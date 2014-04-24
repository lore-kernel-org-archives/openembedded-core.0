Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5CEAB65D71
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 18:59:23 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id v1so2652355yhn.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 11:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:organization;
	bh=+1eWtoGDC4NHKZK208eAs92ap6hwuqJVO9WVJ/LpZ4o=;
	b=RMvvTp5zFc+gEkNM7zvHfiAVh38RHGLNFePDef1tgcWiL/8KmR685h1mTEoupl+a6O
	N6EXH0jTufIDKl9udfBsRb0wDvgEXUhiRxTdy77W39O2xpPM0YicvidhOtTvUzeXUFYa
	eQ/CRtWDVF3RATlCYsSSc9EQoOGLwjNso+k6t60HQP8QjkmgReHJLWGCOxL7Q2oVgSa0
	a93PUmAoFaJwjZb7EpZG9QiIHukVALg/5yqLvJt8BC70gHht4/LOmLXMqdCQXO9DrTSE
	eTy/Sb5e0nEVkjhHzU7fcmZ+XfFhjZZJh11Iy/Wo7jMBIeq083AVzOrGHOWn1dMKE0XX
	enNw==
X-Received: by 10.236.105.141 with SMTP id k13mr4901344yhg.141.1398365964649; 
	Thu, 24 Apr 2014 11:59:24 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id g65sm9067843yhm.28.2014.04.24.11.59.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Apr 2014 11:59:23 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 34C751A5B49DB; Thu, 24 Apr 2014 15:59:20 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Apr 2014 15:59:19 -0300
Message-Id: <1398365960-30797-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH 1/2] Globally replace oe.utils.contains to bb.utils.contains
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
X-List-Received-Date: Thu, 24 Apr 2014 18:59:24 -0000

BitBake has the exact same code as oe.utils.contains so there's no
reason to duplicate it. We now rely on the bb.utils.contains code for
metadata.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/libc-package.bbclass                        |  6 +++---
 meta/classes/systemd.bbclass                             | 12 ++++++------
 meta/classes/update-rc.d.bbclass                         |  2 +-
 meta/classes/utils.bbclass                               |  2 +-
 meta/lib/oe/rootfs.py                                    |  7 +++----
 meta/lib/oe/utils.py                                     | 13 -------------
 meta/recipes-core/dbus/dbus.inc                          |  2 +-
 meta/recipes-core/systemd/systemd-serialgetty.bb         |  2 +-
 meta/recipes-core/systemd/systemd_211.bb                 |  4 ++--
 meta/recipes-core/udev/udev.inc                          |  2 +-
 meta/recipes-devtools/dpkg/dpkg.inc                      |  2 +-
 meta/recipes-devtools/gcc/gcc-common.inc                 |  4 ++--
 meta/recipes-devtools/opkg/opkg.inc                      |  2 +-
 meta/recipes-devtools/perl/perl-ptest.inc                |  2 +-
 meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb |  2 +-
 15 files changed, 25 insertions(+), 39 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 0af42a0..c1bc399 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -37,9 +37,9 @@ python __anonymous () {
                 break
 
     # try to fix disable charsets/locales/locale-code compile fail
-    if oe.utils.contains('DISTRO_FEATURES', 'libc-charsets', True, False, d) and \
-            oe.utils.contains('DISTRO_FEATURES', 'libc-locales', True, False, d) and \
-            oe.utils.contains('DISTRO_FEATURES', 'libc-locale-code', True, False, d):
+    if bb.utils.contains('DISTRO_FEATURES', 'libc-charsets', True, False, d) and \
+            bb.utils.contains('DISTRO_FEATURES', 'libc-locales', True, False, d) and \
+            bb.utils.contains('DISTRO_FEATURES', 'libc-locale-code', True, False, d):
         d.setVar('PACKAGE_NO_GCONV', '0')
     else:
         d.setVar('PACKAGE_NO_GCONV', '1')
diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 2bd63a4..a6ad723 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -15,9 +15,9 @@ python __anonymous() {
     # If the distro features have systemd but not sysvinit, inhibit update-rcd
     # from doing any work so that pure-systemd images don't have redundant init
     # files.
-    if oe.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
+    if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
         d.appendVar("DEPENDS", " systemd-systemctl-native")
-        if not oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
             d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
@@ -57,7 +57,7 @@ fi
 systemd_populate_packages[vardeps] += "systemd_prerm systemd_postinst"
 
 python systemd_populate_packages() {
-    if not oe.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
+    if not bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
         return
 
     def get_package_var(d, var, pkg):
@@ -172,7 +172,7 @@ PACKAGESPLITFUNCS_prepend = "systemd_populate_packages "
 
 python rm_systemd_unitdir (){
     import shutil
-    if not oe.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
+    if not bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
         systemd_unitdir = oe.path.join(d.getVar("D", True), d.getVar('systemd_unitdir', True))
         if os.path.exists(systemd_unitdir):
             shutil.rmtree(systemd_unitdir)
@@ -186,8 +186,8 @@ python rm_sysvinit_initddir (){
     import shutil
     sysv_initddir = oe.path.join(d.getVar("D", True), (d.getVar('INIT_D_DIR', True) or "/etc/init.d"))
 
-    if oe.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and \
-        not oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) and \
+    if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and \
+        not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) and \
         os.path.exists(sysv_initddir):
         systemd_unitdir = oe.path.join(d.getVar("D", True), d.getVar('systemd_unitdir', True), "system")
 
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 0ac2af7..81cc976 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -117,7 +117,7 @@ python populate_packages_updatercd () {
 
     # Check that this class isn't being inhibited (generally, by
     # systemd.bbclass) before doing any work.
-    if oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) and \
+    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) and \
        not d.getVar("INHIBIT_UPDATERCD_BBCLASS", True):
         pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
         if pkgs == None:
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 0a533af..96e0b04 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -24,7 +24,7 @@ def base_version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
     return oe.utils.version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d)
 
 def base_contains(variable, checkvalues, truevalue, falsevalue, d):
-    return oe.utils.contains(variable, checkvalues, truevalue, falsevalue, d)
+    return bb.utils.contains(variable, checkvalues, truevalue, falsevalue, d)
 
 def base_both_contain(variable1, variable2, checkvalue, d):
     return oe.utils.both_contain(variable1, variable2, checkvalue, d)
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index dddbef4..3d1111a 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -1,6 +1,5 @@
 from abc import ABCMeta, abstractmethod
 from oe.utils import execute_pre_post_process
-from oe.utils import contains as base_contains
 from oe.package_manager import *
 from oe.manifest import *
 import oe.path
@@ -42,7 +41,7 @@ class Rootfs(object):
         pass
 
     def _insert_feed_uris(self):
-        if base_contains("IMAGE_FEATURES", "package-management",
+        if bb.utils.contains("IMAGE_FEATURES", "package-management",
                          True, False, self.d):
             self.pm.insert_feeds_uris()
 
@@ -108,7 +107,7 @@ class Rootfs(object):
 
         execute_pre_post_process(self.d, post_process_cmds)
 
-        if base_contains("IMAGE_FEATURES", "read-only-rootfs",
+        if bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
                          True, False, self.d):
             delayed_postinsts = self._get_delayed_postinsts()
             if delayed_postinsts is not None:
@@ -130,7 +129,7 @@ class Rootfs(object):
         self._cleanup()
 
     def _uninstall_uneeded(self):
-        if base_contains("IMAGE_FEATURES", "package-management",
+        if bb.utils.contains("IMAGE_FEATURES", "package-management",
                          True, False, self.d):
             return
 
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index defa536..0a1d108 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -41,19 +41,6 @@ def version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
     else:
         return falsevalue
 
-def contains(variable, checkvalues, truevalue, falsevalue, d):
-    val = d.getVar(variable, True)
-    if not val:
-        return falsevalue
-    val = set(val.split())
-    if isinstance(checkvalues, basestring):
-        checkvalues = set(checkvalues.split())
-    else:
-        checkvalues = set(checkvalues)
-    if checkvalues.issubset(val):
-        return truevalue
-    return falsevalue
-
 def both_contain(variable1, variable2, checkvalue, d):
     if d.getVar(variable1,1).find(checkvalue) != -1 and d.getVar(variable2,1).find(checkvalue) != -1:
         return checkvalue
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 5727ae7..8d348f8 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -25,7 +25,7 @@ INITSCRIPT_NAME = "dbus-1"
 INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."
 
 python __anonymous() {
-    if not oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 13b2dba..1c34d5c 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -44,6 +44,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 # As this package is tied to systemd, only build it when we're also building systemd.
 python () {
-    if not oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+    if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
         raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
 }
diff --git a/meta/recipes-core/systemd/systemd_211.bb b/meta/recipes-core/systemd/systemd_211.bb
index 44b1965..278de9f 100644
--- a/meta/recipes-core/systemd/systemd_211.bb
+++ b/meta/recipes-core/systemd/systemd_211.bb
@@ -295,7 +295,7 @@ INITSCRIPT_NAME_udev = "systemd-udevd"
 INITSCRIPT_PARAMS_udev = "start 03 S ."
 
 python __anonymous() {
-    if not oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
@@ -348,6 +348,6 @@ pkg_prerm_udev-hwdb () {
 # As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
 # that we don't build both udev and systemd in world builds.
 python () {
-    if not oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+    if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
         raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
 }
diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 1b22525..f9d544e 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -99,7 +99,7 @@ do_install_append () {
 
 # As systemd also builds udev, skip this package if we're doing a systemd build.
 python () {
-    if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+    if bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
         raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
 }
 do_compile_ptest() {
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index eef7ce9..ca44e98 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -17,7 +17,7 @@ PARALLEL_MAKE = ""
 inherit autotools gettext perlnative pkgconfig systemd
 
 python () {
-    if not oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
         pn = d.getVar('PN', True)
         d.setVar('SYSTEMD_SERVICE_%s' % (pn), 'dpkg-configure.service')
 }
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index feb402e..1e00249 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -19,7 +19,7 @@ def get_gcc_fpu_setting(bb, d):
 get_gcc_fpu_setting[vardepvalue] = "${@get_gcc_fpu_setting(bb, d)}"
 
 def get_gcc_mips_plt_setting(bb, d):
-    if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'mips', 'mipsel' ] and oe.utils.contains('DISTRO_FEATURES', 'mplt', True, False, d):
+    if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'mips', 'mipsel' ] and bb.utils.contains('DISTRO_FEATURES', 'mplt', True, False, d):
         return "--with-mips-plt"
     return ""
 
@@ -32,7 +32,7 @@ def get_gcc_multiarch_setting(bb, d):
         "sparc":   "--enable-targets=all",
     }
 
-    if oe.utils.contains('DISTRO_FEATURES', 'multiarch', True, False, d):
+    if bb.utils.contains('DISTRO_FEATURES', 'multiarch', True, False, d):
         if target_arch in multiarch_options :
             return multiarch_options[target_arch]
     return ""
diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 9f87df5..198e500 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -17,7 +17,7 @@ do_configure_prepend() {
 inherit autotools pkgconfig systemd
 
 python () {
-    if not oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
         pn = d.getVar('PN', True)
         d.setVar('SYSTEMD_SERVICE_%s' % (pn), 'opkg-configure.service')
 }
diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 914ca0f..9ef7d0a 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -42,7 +42,7 @@ python populate_packages_prepend() {
     # Put all *.t files from the lib dir in the ptest package
     # do_split_packages requires a pair of () in the regex, but we have nothing
     # to match, so use an empty pair.
-    if oe.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
+    if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
         do_split_packages(d, d.expand('${libdir}/perl/${PV}'), '.*\.t()',
             '${PN}-ptest%s', '%s', recursive=True, match_path=True)
 }
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
index 97941ec..454d0a1 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
@@ -42,7 +42,7 @@ do_compile_prepend_armv7a () {
 }
 
 python () {
-    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
+    if not bb.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
         raise bb.parse.SkipPackage("'opengl' not in DISTRO_FEATURES")
 }
 
-- 
2.0.0.rc0


