Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 44A5270018
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 11:41:15 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0PBfEDP030070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 25 Jan 2018 11:41:15 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eefu6-0001Vn-EZ; Thu, 25 Jan 2018 11:41:14 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jan 2018 11:41:13 +0000
Message-Id: <1516880473-5773-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] classes/recipes: Convert SkipPackage -> SkipRecipe
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
X-List-Received-Date: Thu, 25 Jan 2018 11:41:16 -0000

The new name is much more consistent with what this actually means. We put
the pieces in place to rename everything a while back but looks like we
forgot to actually do it! Fix that now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass                                    | 10 +++++-----
 meta/classes/blacklist.bbclass                               |  2 +-
 meta/classes/distro_features_check.bbclass                   |  6 +++---
 meta/classes/goarch.bbclass                                  |  2 +-
 meta/classes/multilib.bbclass                                |  8 ++++----
 meta/classes/uboot-config.bbclass                            |  8 ++++----
 meta/classes/useradd-staticids.bbclass                       |  2 +-
 meta/recipes-bsp/grub/grub-efi_2.02.bb                       |  2 +-
 meta/recipes-devtools/gcc/libgfortran.inc                    |  2 +-
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb |  2 +-
 meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb              |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb              |  2 +-
 meta/recipes-kernel/linux/linux-yocto.inc                    |  2 +-
 meta/recipes-rt/images/core-image-rt-sdk.bb                  |  2 +-
 meta/recipes-rt/images/core-image-rt.bb                      |  2 +-
 18 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 912e81e..21cacfb 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -293,7 +293,7 @@ python base_eventhandler() {
                 if p.startswith("virtual/") and p not in multiwhitelist:
                     profprov = d.getVar("PREFERRED_PROVIDER_" + p)
                     if profprov and pn != profprov:
-                        raise bb.parse.SkipPackage("PREFERRED_PROVIDER_%s set to %s, not %s" % (p, profprov, pn))
+                        raise bb.parse.SkipRecipe("PREFERRED_PROVIDER_%s set to %s, not %s" % (p, profprov, pn))
 }
 
 CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
@@ -465,7 +465,7 @@ python () {
         if unmatched_license_flag:
             bb.debug(1, "Skipping %s because it has a restricted license not"
                  " whitelisted in LICENSE_FLAGS_WHITELIST" % pn)
-            raise bb.parse.SkipPackage("because it has a restricted license not"
+            raise bb.parse.SkipRecipe("because it has a restricted license not"
                  " whitelisted in LICENSE_FLAGS_WHITELIST")
 
     # If we're building a target package we need to use fakeroot (pseudo)
@@ -493,7 +493,7 @@ python () {
             if re.match(need_machine, m):
                 break
         else:
-            raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE'))
+            raise bb.parse.SkipRecipe("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE'))
 
     source_mirror_fetch = d.getVar('SOURCE_MIRROR_FETCH', False)
     if not source_mirror_fetch:
@@ -502,7 +502,7 @@ python () {
             import re
             this_host = d.getVar('HOST_SYS')
             if not re.match(need_host, this_host):
-                raise bb.parse.SkipPackage("incompatible with host %s (not in COMPATIBLE_HOST)" % this_host)
+                raise bb.parse.SkipRecipe("incompatible with host %s (not in COMPATIBLE_HOST)" % this_host)
 
         bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
 
@@ -555,7 +555,7 @@ python () {
                         bb.debug(1, "INCLUDING the package " + pkg)
                 elif all_skipped or incompatible_license(d, bad_licenses):
                     bb.debug(1, "SKIPPING recipe %s because it's %s" % (pn, license))
-                    raise bb.parse.SkipPackage("it has an incompatible license: %s" % license)
+                    raise bb.parse.SkipRecipe("it has an incompatible license: %s" % license)
             elif pn in whitelist:
                 if pn in incompatwl:
                     bb.note("INCLUDING " + pn + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted")
diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
index e58564c..dc79422 100644
--- a/meta/classes/blacklist.bbclass
+++ b/meta/classes/blacklist.bbclass
@@ -16,5 +16,5 @@ python () {
     blacklist = d.getVarFlag('PNBLACKLIST', d.getVar('PN'))
 
     if blacklist:
-        raise bb.parse.SkipPackage("Recipe is blacklisted: %s" % (blacklist))
+        raise bb.parse.SkipRecipe("Recipe is blacklisted: %s" % (blacklist))
 }
diff --git a/meta/classes/distro_features_check.bbclass b/meta/classes/distro_features_check.bbclass
index e74d3c0..9b78b03 100644
--- a/meta/classes/distro_features_check.bbclass
+++ b/meta/classes/distro_features_check.bbclass
@@ -17,7 +17,7 @@ python () {
     if any_of_distro_features:
         any_of_distro_features = any_of_distro_features.split()
         if set.isdisjoint(set(any_of_distro_features),set(distro_features)):
-            raise bb.parse.SkipPackage("one of '%s' needs to be in DISTRO_FEATURES" % any_of_distro_features)
+            raise bb.parse.SkipRecipe("one of '%s' needs to be in DISTRO_FEATURES" % any_of_distro_features)
 
     required_distro_features = d.getVar('REQUIRED_DISTRO_FEATURES')
     if required_distro_features:
@@ -26,12 +26,12 @@ python () {
             if f in distro_features:
                 continue
             else:
-                raise bb.parse.SkipPackage("missing required distro feature '%s' (not in DISTRO_FEATURES)" % f)
+                raise bb.parse.SkipRecipe("missing required distro feature '%s' (not in DISTRO_FEATURES)" % f)
 
     conflict_distro_features = d.getVar('CONFLICT_DISTRO_FEATURES')
     if conflict_distro_features:
         conflict_distro_features = conflict_distro_features.split()
         for f in conflict_distro_features:
             if f in distro_features:
-                raise bb.parse.SkipPackage("conflicting distro feature '%s' (in DISTRO_FEATURES)" % f)
+                raise bb.parse.SkipRecipe("conflicting distro feature '%s' (in DISTRO_FEATURES)" % f)
 }
diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 663c9ff..922c0cc 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -56,7 +56,7 @@ def go_map_arch(a, d):
     elif re.match('p(pc|owerpc)(64el)', a):
         return 'ppc64le'
     else:
-        raise bb.parse.SkipPackage("Unsupported CPU architecture: %s" % a)
+        raise bb.parse.SkipRecipe("Unsupported CPU architecture: %s" % a)
 
 def go_map_arm(a, f, d):
     import re
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 6dca2e8..fbb6980 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -12,7 +12,7 @@ python multilib_virtclass_handler () {
     # We also skip multilib setup for module packages.
     provides = (e.data.getVar("PROVIDES") or "").split()
     if "virtual/kernel" in provides or bb.data.inherits_class('module-base', e.data):
-        raise bb.parse.SkipPackage("We shouldn't have multilib variants for the kernel")
+        raise bb.parse.SkipRecipe("We shouldn't have multilib variants for the kernel")
 
     save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME") or ""
     for name in save_var_name.split():
@@ -41,13 +41,13 @@ python multilib_virtclass_handler () {
         return
 
     if bb.data.inherits_class('native', e.data):
-        raise bb.parse.SkipPackage("We can't extend native recipes")
+        raise bb.parse.SkipRecipe("We can't extend native recipes")
 
     if bb.data.inherits_class('nativesdk', e.data) or bb.data.inherits_class('crosssdk', e.data):
-        raise bb.parse.SkipPackage("We can't extend nativesdk recipes")
+        raise bb.parse.SkipRecipe("We can't extend nativesdk recipes")
 
     if bb.data.inherits_class('allarch', e.data) and not bb.data.inherits_class('packagegroup', e.data):
-        raise bb.parse.SkipPackage("Don't extend allarch recipes which are not packagegroups")
+        raise bb.parse.SkipRecipe("Don't extend allarch recipes which are not packagegroups")
 
 
     # Expand this since this won't work correctly once we set a multilib into place
diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 533e175..89ff970 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -27,13 +27,13 @@ python () {
         FILE = os.path.basename(d.getVar("FILE"))
         bb.debug(1, "To build %s, see %s for instructions on \
                  setting up your machine config" % (PN, FILE))
-        raise bb.parse.SkipPackage("Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the %s machine configuration." % d.getVar("MACHINE"))
+        raise bb.parse.SkipRecipe("Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the %s machine configuration." % d.getVar("MACHINE"))
 
     if ubootmachine and ubootconfig:
-        raise bb.parse.SkipPackage("You cannot use UBOOT_MACHINE and UBOOT_CONFIG at the same time.")
+        raise bb.parse.SkipRecipe("You cannot use UBOOT_MACHINE and UBOOT_CONFIG at the same time.")
 
     if ubootconfigflags and ubootbinaries:
-        raise bb.parse.SkipPackage("You cannot use UBOOT_BINARIES as it is internal to uboot_config.bbclass.")
+        raise bb.parse.SkipRecipe("You cannot use UBOOT_BINARIES as it is internal to uboot_config.bbclass.")
 
     if len(ubootconfig) > 0:
         for config in ubootconfig:
@@ -41,7 +41,7 @@ python () {
                 if config == f: 
                     items = v.split(',')
                     if items[0] and len(items) > 3:
-                        raise bb.parse.SkipPackage('Only config,images,binary can be specified!')
+                        raise bb.parse.SkipRecipe('Only config,images,binary can be specified!')
                     d.appendVar('UBOOT_MACHINE', ' ' + items[0])
                     # IMAGE_FSTYPES appending
                     if len(items) > 1 and items[1]:
diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 589a99f..64bf6dc 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -307,5 +307,5 @@ python __anonymous() {
             update_useradd_static_config(d)
         except NotImplementedError as f:
             bb.debug(1, "Skipping recipe %s: %s" % (d.getVar('PN'), f))
-            raise bb.parse.SkipPackage(f)
+            raise bb.parse.SkipRecipe(f)
 }
diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index 112a99d..a72b189 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -22,7 +22,7 @@ python __anonymous () {
         grubtarget = 'i386'
         grubimage = "grub-efi-bootia32.efi"
     else:
-        raise bb.parse.SkipPackage("grub-efi is incompatible with target %s" % target)
+        raise bb.parse.SkipRecipe("grub-efi is incompatible with target %s" % target)
     d.setVar("GRUB_TARGET", grubtarget)
     d.setVar("GRUB_IMAGE", grubimage)
 }
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 99c192a..0523764 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -73,5 +73,5 @@ do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 python __anonymous () {
     f = d.getVar("FORTRAN")
     if "fortran" not in f:
-        raise bb.parse.SkipPackage("libgfortran needs fortran support to be enabled in the compiler")
+        raise bb.parse.SkipRecipe("libgfortran needs fortran support to be enabled in the compiler")
 }
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index e1f34d5..8ba02e6 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -19,7 +19,7 @@ REQUIRED_DISTRO_FEATURES += "opengl"
 #
 python __anonymous () {
     if d.getVar('TCLIBC') != "glibc":
-        raise bb.parse.SkipPackage("incompatible with %s C library" %
+        raise bb.parse.SkipRecipe("incompatible with %s C library" %
                                    d.getVar('TCLIBC'))
 }
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
index e652394..bef3636 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
@@ -36,6 +36,6 @@ do_compile_prepend_armv7a () {
 
 python () {
     if not bb.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
-        raise bb.parse.SkipPackage("'opengl' not in DISTRO_FEATURES")
+        raise bb.parse.SkipRecipe("'opengl' not in DISTRO_FEATURES")
 }
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index 8938ab8..8b98885 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # core-image-rt-sdk, core-image-rt.
 python () {
     if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
-        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
+        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
 SRCREV_machine ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index a89c08d..7c2cfd2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # core-image-rt-sdk, core-image-rt.
 python () {
     if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
-        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
+        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
 SRCREV_machine ?= "8dd0b4d434394e5293702c729164b424f2da6b57"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 949d477..f28eedb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # core-image-rt-sdk, core-image-rt.
 python () {
     if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
-        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
+        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
 SRCREV_machine ?= "2c13d27d73b9fddd38fd407326e82240a494d803"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 99931b3..59affcc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # core-image-rt-sdk, core-image-rt.
 python () {
     if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
-        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
+        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
 SRCREV_machine ?= "fef0184c3c1bcac27fe579bf2643c50bf861e40d"
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 87c0674..3bb872a 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -14,7 +14,7 @@ INC_PR = "r4"
 python () {
     if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != d.getVar("PN"):
         d.delVar("BB_DONT_CACHE")
-        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to %s to enable it" % (d.getVar("PN")))
+        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to %s to enable it" % (d.getVar("PN")))
 }
 
 DEPENDS += "xz-native bc-native"
diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
index 7c1e5bf..0f7f091 100644
--- a/meta/recipes-rt/images/core-image-rt-sdk.bb
+++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
@@ -5,7 +5,7 @@ require recipes-core/images/core-image-minimal.bb
 # to build multiple virtual/kernel providers.
 python () {
     if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
-        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
+        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
 DESCRIPTION = "Small image capable of booting a device with a test suite and \
diff --git a/meta/recipes-rt/images/core-image-rt.bb b/meta/recipes-rt/images/core-image-rt.bb
index d8bb04a..9cb93b3 100644
--- a/meta/recipes-rt/images/core-image-rt.bb
+++ b/meta/recipes-rt/images/core-image-rt.bb
@@ -5,7 +5,7 @@ require recipes-core/images/core-image-minimal.bb
 # to build multiple virtual/kernel providers.
 python () {
     if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
-        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
+        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
 DESCRIPTION = "A small image just capable of allowing a device to boot plus a \
-- 
2.7.4


