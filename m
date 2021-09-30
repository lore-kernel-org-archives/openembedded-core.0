X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: [PATCH v3 2/2] kernel.bbclass: Allow using update-alternatives for the kernel image
Date: Thu, 30 Sep 2021 16:14:44 +0200
Message-Id: <20210930141444.698139-3-zboszor@pr.hu>
In-Reply-To: <20210930141444.698139-1-zboszor@pr.hu>
References: <16A93426652F9306.27626@lists.openembedded.org>
 <20210930141444.698139-1-zboszor@pr.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>

From: Zoltán Böszörményi <zboszor@gmail.com>

When using dnf to install new kernel versions and installonly_limit
is reached, dnf automatically removes the oldest kernel version.
For the dnf.conf documentation on installonlypkgs, installonly_limit
and others settings, see:
https://dnf.readthedocs.io/en/latest/conf_ref.html

When this happens, the kernel image symlink is removed because
1) the postrm script uses rm -f /boot/<image-type> and
2) postrm for the old version is run later than postinst of
   the new one with dnf.

Obviously, it makes the system fail to boot the next time.
Theoretically, this may happen for any package manager.

Allow using the alternative symlink machinery so the highest
kernel version takes precedence and the symlink always stays
in place. This depends on the new variable called
KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES. If it's set to non-0
then update-alternatives is used. Default is 0.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
v2: Mention dnf.conf documentation link
    Protect against "IndexError: list index out of range"

v3: Make update-alternatives --install work for do_rootfs
    Move constructing alternative priority to a python function
    Fix indentation of postinst/postrm scripts

 meta/classes/kernel.bbclass | 39 +++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index afd9f8045e..40f3361053 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -42,6 +42,16 @@ KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
 KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
 KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
 
+def kernel_alternative_priority(d):
+    import re
+    kver =  d.getVar("KERNEL_VERSION")
+    kverp = re.compile('[\.-]')
+    kvparts = kverp.split(kver)
+    if len(kvparts) >= 3:
+        return str(kvparts[0])+str(kvparts[1]).zfill(2)+str(kvparts[2]).zfill(3)
+    else:
+        return "000000"
+
 python __anonymous () {
     pn = d.getVar("PN")
     kpn = d.getVar("KERNEL_PACKAGE_NAME")
@@ -111,23 +121,31 @@ python __anonymous () {
         d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
         d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower), '1')
         d.setVar('pkg_postinst:%s-image-%s' % (kname,typelower), """set +e
-if [ -n "$D" ]; then
-    ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
+if [ "${KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES}" != "0" ]; then
+    update-alternatives --install /${KERNEL_IMAGEDEST}/%s %s %s-${KERNEL_VERSION_NAME} ${@kernel_alternative_priority(d)}
 else
-    ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
-    if [ $? -ne 0 ]; then
-        echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlinks, falling back to copied image (%s)."
-        install -m 0644 ${KERNEL_IMAGEDEST}/%s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s
+    if [ -n "$D" ]; then
+        ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
+    else
+        ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
+        if [ $? -ne 0 ]; then
+            echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlinks, falling back to copied image (%s)."
+            install -m 0644 ${KERNEL_IMAGEDEST}/%s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s
+        fi
     fi
 fi
 set -e
-""" % (type, type, type, type, type, type, type))
+""" % (type, type, type, type, type, type, type, type, type, type))
         d.setVar('pkg_postrm:%s-image-%s' % (kname,typelower), """set +e
-if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
-    rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
+if [ "${KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES}" != "0" ]; then
+    update-alternatives --remove %s %s-${KERNEL_VERSION_NAME}
+else
+    if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
+        rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
+    fi
 fi
 set -e
-""" % (type, type, type))
+""" % (type, type, type, type, type))
 
 
     image = d.getVar('INITRAMFS_IMAGE')
@@ -208,6 +226,7 @@ KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 # The directory where built kernel lies in the kernel tree
 KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
 KERNEL_IMAGEDEST ?= "boot"
+KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES ?= "0"
 
 #
 # configuration
-- 
2.31.1

