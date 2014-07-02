Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0233460438
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 09:25:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s629PCvg006605
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Jul 2014 02:25:12 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 2 Jul 2014 02:25:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Jul 2014 02:25:11 -0700
Message-ID: <170029dfcde1cb5c69c5e8c82efa9f223deaf797.1404292676.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1404292676.git.liezhi.yang@windriver.com>
References: <cover.1404292676.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [RFC - WIP PATCH 1/1] image.bbclass: create binary pkg for image recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jul 2014 09:25:13 -0000
Content-Type: text/plain

* Benefits
  We can known the image's RDEPENDS outside the build environment, and
  can use a third part installer such as anaconda to install the packages.
  It's hard to get the ROOTFS_POSTPROCESS_COMMAND outside the build
  environment, now the shell function can be added to postinst, and will
  show a warning for the python function. We have two python functions
  atm: write_package_manifest and write_image_manifest, we don't need them
  in the binary pkg.

* Brief design:
  - Set the RDEPENDS and create the package as other regular recipes.

  - Translate the ROOTFS_POSTPROCESS_COMMAND to postinst
    do_install[postfuncs] += "get_rootfs_postprocess_command"

    The get_rootfs_postprocess_command() will emit the shell script to
    /usr/share/${PN}, and the pkg_postinst_${PN} will run it when do the
    install.

* Fixed:
  RDEPENDS -> RDEPENDS_${PN}, the similar to RRECOMMENDS

* Tested on rpm, dep and ipk

* TODO:
  - Create the binary pkg optionally rather than default ?

[YOCTO #6463]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image.bbclass                   |   91 +++++++++++++++++++++++---
 meta/recipes-core/meta/buildtools-tarball.bb |    2 +-
 2 files changed, 83 insertions(+), 10 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index a03b880..ad2bd2d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -9,10 +9,15 @@ POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks; "
 inherit gzipnative
 
 LICENSE = "MIT"
-PACKAGES = ""
+
+# Only build one package for the image recipe, for example:
+# core-image-minimal -> core-image-minimal.rpm
+# core-image-minimal-dev -> core-image-minimal-dev.rpm
+PACKAGES = "${PN}"
+
 DEPENDS += "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cross"
-RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
-RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
+RDEPENDS_${PN} += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
+RRECOMMENDS_${PN} += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -385,18 +390,86 @@ rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
 
+do_install[postfuncs] += "get_rootfs_postprocess_command"
+
+# The target package doesn't need these commands
+SKIPPED_POSTCOMMAND_FROM_POSTINSTS ?= "write_package_manifest write_image_manifest \
+                                    license_create_manifest"
+
+python get_rootfs_postprocess_command() {
+    import subprocess
+
+    skip_funcs = d.getVar('SKIPPED_POSTCOMMAND_FROM_POSTINSTS', True)
+
+    installdir = os.path.join(d.getVar('D', True), \
+            d.getVar('datadir', True).lstrip('/'), d.getVar('PN', True), 'postinsts')
+    bb.utils.mkdirhier(installdir)
+
+    # The postinst list
+    postinst_list = os.path.join(installdir, 'postinst_list')
+
+    for f in d.getVar('ROOTFS_POSTPROCESS_COMMAND', True).split(';'):
+        func = f.strip()
+        if not func or func in skip_funcs:
+            continue
+
+        flags = d.getVarFlags(func)
+        ispython = flags.get('python')
+        if ispython:
+            bb.warn('%s is a python func, can not add it to postinst' % func)
+            continue
+
+        postinst = os.path.join(installdir, func)
+        with open(postinst, 'w') as script:
+            script.write("#!/bin/sh\n\n")
+            bb.data.emit_func(func, script, d)
+            # Run the function
+            script.write("%s\n" % func)
+
+        bb.note('Fix build path in %s' % postinst)
+        # Remove the IMAGE_ROOTFS prefix
+        fix_cmd = "sed -i -e 's:%s::g'" % d.getVar('IMAGE_ROOTFS', True)
+        # Remove the STAGING_DIR_TARGET prefix
+        fix_cmd += " -e 's:%s::g'" % d.getVar('STAGING_DIR_TARGET', True)
+        # Comment out the STAGING_DIR_NATIVE related lines
+        fix_cmd += " -e 's:\(^.*%s\):#\\1:'" % d.getVar('STAGING_DIR_NATIVE', True)
+        # Comment out the PSEUDO related lines
+        fix_cmd += " -e 's:\(^export .*PSEUDO\):#\\1:'"
+        # Comment out the username related lines
+        fix_cmd += " -e 's:\(^export .*%s\):#\\1:'" % d.getVar('USER', True)
+
+        fix_cmd += " %s" % postinst
+        subprocess.call(fix_cmd, shell=True)
+
+        os.chmod(postinst, 0755)
+
+        with open(postinst_list, 'a') as plist:
+            plist.write("%s\n" % postinst.replace(d.getVar('D', True), ''))
+}
+
+pkg_postinst_${PN} () {
+    listfile = "${datadir}/${PN}/postinst_list"
+    if [ -s $listfile ]; then
+        for script in `cat $listfile`; do
+            echo "Running $script..."
+            /bin/sh $script
+            if [ $? -ne 0 ]; then
+                # Allow the failure rather than re-install the package
+                # since the script can be manualy run
+                echo "ERROR: failed to run $script" >&2
+                echo "ERROR: please fix $script and manually run it" >&2
+                true
+            fi
+        done
+    fi
+}
+
 do_fetch[noexec] = "1"
 do_unpack[noexec] = "1"
 do_patch[noexec] = "1"
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
-do_install[noexec] = "1"
 do_populate_sysroot[noexec] = "1"
-do_package[noexec] = "1"
-do_packagedata[noexec] = "1"
-do_package_write_ipk[noexec] = "1"
-do_package_write_deb[noexec] = "1"
-do_package_write_rpm[noexec] = "1"
 
 addtask rootfs before do_build
 # Allow the kernel to be repacked with the initramfs and boot image file as a single file
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 62e1e0b..7501525 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -45,7 +45,7 @@ TOOLCHAIN_HOST_TASK ?= "\
 
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"
 
-RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
+RDEPENDS_${PN} = "${TOOLCHAIN_HOST_TASK}"
 
 EXCLUDE_FROM_WORLD = "1"
 
-- 
1.7.9.5


