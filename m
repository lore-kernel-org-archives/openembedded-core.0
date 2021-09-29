X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: [PATCH v2 2/2] kernel.bbclass: Allow using update-alternatives for the kernel image
Date: Wed, 29 Sep 2021 07:33:53 +0200
Message-Id: <20210929053353.600644-3-zboszor@pr.hu>
In-Reply-To: <20210929053353.600644-1-zboszor@pr.hu>
References: <20210929053353.600644-1-zboszor@pr.hu>
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

However, the /boot/bzImage symlink (or whatever image type is used)
is removed unconditionally.

Allow using the alternative symlink machinery so the highest
kernel version takes precedence and the symlink stays in place.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
v2: Mention dnf.conf documentation link
    Protect against "IndexError: list index out of range"

 meta/classes/kernel.bbclass | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 882858e22e..47a78f0dd2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -43,9 +43,23 @@ KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION')
 KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
 
 python __anonymous () {
+    import re
     pn = d.getVar("PN")
     kpn = d.getVar("KERNEL_PACKAGE_NAME")
 
+    # KERNEL_VERSION cannot be used here as it would cause
+    # "basehash value changed" issues.
+    kver =  d.getVar("PV")
+    kverp = re.compile('[\.-]')
+    kvparts = kverp.split(kver)
+    # It seems PV is unset or empty for early recipe parsing
+    # but __anonymous functions are run nevertheless.
+    # Protect against "IndexError: list index out of range".
+    if len(kvparts) >= 3:
+        kverstr = str(kvparts[0])+str(kvparts[1]).zfill(2)+str(kvparts[2]).zfill(3)
+    else:
+        kverstr = '000000'
+
     # XXX Remove this after bug 11905 is resolved
     #  FILES:${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
     if kpn == pn:
@@ -117,6 +131,9 @@ python __anonymous () {
         d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
         d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower), '1')
         d.setVar('pkg_postinst:%s-image-%s' % (kname,typelower), """set +e
+if [ "${KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES}" != "0" ]; then
+    update-alternatives --install ${KERNEL_IMAGEDEST}/%s %s %s-${KERNEL_VERSION_NAME} %s
+else
 if [ -n "$D" ]; then
     ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
 else
@@ -126,14 +143,19 @@ else
         install -m 0644 ${KERNEL_IMAGEDEST}/%s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s
     fi
 fi
+fi
 set -e
-""" % (type, type, type, type, type, type, type))
+""" % (type, type, type, kverstr, type, type, type, type, type, type, type))
         d.setVar('pkg_postrm:%s-image-%s' % (kname,typelower), """set +e
+if [ "${KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES}" != "0" ]; then
+    update-alternatives --remove %s %s-${KERNEL_VERSION_NAME}
+else
 if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
     rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
 fi
+fi
 set -e
-""" % (type, type, type))
+""" % (type, type, type, type, type))
 
 
     image = d.getVar('INITRAMFS_IMAGE')
@@ -214,6 +236,7 @@ KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 # The directory where built kernel lies in the kernel tree
 KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
 KERNEL_IMAGEDEST ?= "boot"
+KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES ?= "0"
 
 #
 # configuration
-- 
2.31.1

