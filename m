Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE6B62134
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 15:27:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Nov 2016 07:27:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,547,1473145200"; d="scan'208";a="1064113595"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.26.83])
	by orsmga001.jf.intel.com with ESMTP; 25 Nov 2016 07:27:40 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Nov 2016 15:27:28 +0000
Message-Id: <1480087649-26543-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] meta: remove True option to getVar calls
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
X-List-Received-Date: Fri, 25 Nov 2016 15:28:00 -0000

getVar() now defaults to expanding by default, thus remove the True
option from getVar() calls with a regex search and replace.

Search made with the following regex: getVar ?\(( ?[^,()]*), True\)

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/allarch.bbclass                       |   4 +-
 meta/classes/archiver.bbclass                      |  74 +++---
 meta/classes/autotools.bbclass                     |  12 +-
 meta/classes/base.bbclass                          | 120 ++++-----
 meta/classes/binconfig.bbclass                     |   2 +-
 meta/classes/blacklist.bbclass                     |   4 +-
 meta/classes/bugzilla.bbclass                      |  24 +-
 meta/classes/buildhistory.bbclass                  |  62 ++---
 meta/classes/buildstats-summary.bbclass            |   2 +-
 meta/classes/buildstats.bbclass                    |  12 +-
 meta/classes/ccache.bbclass                        |   2 +-
 meta/classes/chrpath.bbclass                       |   4 +-
 meta/classes/cmake.bbclass                         |  16 +-
 meta/classes/cml1.bbclass                          |   4 +-
 meta/classes/compress_doc.bbclass                  |  26 +-
 meta/classes/copyleft_compliance.bbclass           |  10 +-
 meta/classes/copyleft_filter.bbclass               |  10 +-
 meta/classes/cross-canadian.bbclass                |  34 +--
 meta/classes/crosssdk.bbclass                      |   2 +-
 meta/classes/cve-check.bbclass                     |  48 ++--
 meta/classes/debian.bbclass                        |  24 +-
 meta/classes/devshell.bbclass                      |   6 +-
 meta/classes/distro_features_check.bbclass         |   8 +-
 meta/classes/distrodata.bbclass                    | 132 +++++-----
 meta/classes/distutils-base.bbclass                |   2 +-
 meta/classes/distutils3-base.bbclass               |   2 +-
 meta/classes/externalsrc.bbclass                   |  38 +--
 meta/classes/extrausers.bbclass                    |   2 +-
 meta/classes/fontcache.bbclass                     |  14 +-
 meta/classes/fs-uuid.bbclass                       |   2 +-
 meta/classes/gconf.bbclass                         |  12 +-
 meta/classes/gettext.bbclass                       |   8 +-
 meta/classes/gio-module-cache.bbclass              |  10 +-
 meta/classes/grub-efi.bbclass                      |  22 +-
 meta/classes/gsettings.bbclass                     |  10 +-
 meta/classes/gtk-icon-cache.bbclass                |  14 +-
 meta/classes/gtk-immodules-cache.bbclass           |  10 +-
 meta/classes/gummiboot.bbclass                     |  14 +-
 meta/classes/icecc.bbclass                         |   4 +-
 meta/classes/image-buildinfo.bbclass               |  10 +-
 meta/classes/image-live.bbclass                    |   8 +-
 meta/classes/image-vm.bbclass                      |  12 +-
 meta/classes/image.bbclass                         |  94 +++----
 meta/classes/image_types.bbclass                   |  24 +-
 meta/classes/insane.bbclass                        | 192 +++++++-------
 meta/classes/kernel-arch.bbclass                   |   6 +-
 meta/classes/kernel-fitimage.bbclass               |  14 +-
 meta/classes/kernel-grub.bbclass                   |   2 +-
 meta/classes/kernel-module-split.bbclass           |  38 +--
 meta/classes/kernel-uimage.bbclass                 |   8 +-
 meta/classes/kernel-yocto.bbclass                  |   2 +-
 meta/classes/kernel.bbclass                        |  40 +--
 meta/classes/libc-common.bbclass                   |  10 +-
 meta/classes/libc-package.bbclass                  |  56 ++--
 meta/classes/license.bbclass                       |  96 +++----
 meta/classes/live-vm-common.bbclass                |   8 +-
 meta/classes/metadata_scm.bbclass                  |   2 +-
 meta/classes/migrate_localcount.bbclass            |  12 +-
 meta/classes/mime.bbclass                          |  12 +-
 meta/classes/module.bbclass                        |   2 +-
 meta/classes/multilib.bbclass                      |  32 +--
 meta/classes/multilib_global.bbclass               |  22 +-
 meta/classes/native.bbclass                        |  10 +-
 meta/classes/nativesdk.bbclass                     |   8 +-
 meta/classes/npm.bbclass                           |   4 +-
 meta/classes/oelint.bbclass                        |   4 +-
 meta/classes/package.bbclass                       | 282 ++++++++++-----------
 meta/classes/package_deb.bbclass                   |  54 ++--
 meta/classes/package_ipk.bbclass                   |  60 ++---
 meta/classes/package_rpm.bbclass                   | 136 +++++-----
 meta/classes/package_tar.bbclass                   |  14 +-
 meta/classes/packagedata.bbclass                   |  10 +-
 meta/classes/packagefeed-stability.bbclass         |  14 +-
 meta/classes/packagegroup.bbclass                  |   8 +-
 meta/classes/patch.bbclass                         |  26 +-
 meta/classes/pixbufcache.bbclass                   |  10 +-
 meta/classes/populate_sdk_base.bbclass             |  36 +--
 meta/classes/populate_sdk_ext.bbclass              | 108 ++++----
 meta/classes/prexport.bbclass                      |   4 +-
 meta/classes/ptest.bbclass                         |   2 +-
 meta/classes/qemu.bbclass                          |  10 +-
 meta/classes/qemuboot.bbclass                      |   8 +-
 meta/classes/recipe_sanity.bbclass                 |  26 +-
 meta/classes/report-error.bbclass                  |  22 +-
 meta/classes/rm_work.bbclass                       |   6 +-
 meta/classes/rootfs-postcommands.bbclass           |   6 +-
 meta/classes/rootfs_deb.bbclass                    |   4 +-
 meta/classes/rootfs_ipk.bbclass                    |   2 +-
 meta/classes/rootfs_rpm.bbclass                    |   2 +-
 meta/classes/sanity.bbclass                        | 108 ++++----
 meta/classes/sign_ipk.bbclass                      |  12 +-
 meta/classes/sign_package_feed.bbclass             |   4 +-
 meta/classes/sign_rpm.bbclass                      |  12 +-
 meta/classes/siteconfig.bbclass                    |   2 +-
 meta/classes/siteinfo.bbclass                      |  14 +-
 meta/classes/spdx.bbclass                          |  26 +-
 meta/classes/sstate.bbclass                        | 114 ++++-----
 meta/classes/staging.bbclass                       |  22 +-
 meta/classes/syslinux.bbclass                      |  34 +--
 meta/classes/systemd-boot.bbclass                  |  14 +-
 meta/classes/systemd.bbclass                       |  38 +--
 meta/classes/terminal.bbclass                      |   8 +-
 meta/classes/testexport.bbclass                    |  40 +--
 meta/classes/testimage.bbclass                     |  12 +-
 meta/classes/testsdk.bbclass                       |  12 +-
 meta/classes/tinderclient.bbclass                  |  54 ++--
 meta/classes/toaster.bbclass                       |  14 +-
 meta/classes/toolchain-scripts.bbclass             |   4 +-
 meta/classes/uboot-config.bbclass                  |  14 +-
 meta/classes/uboot-extlinux-config.bbclass         |  24 +-
 meta/classes/uboot-sign.bbclass                    |   6 +-
 meta/classes/uninative.bbclass                     |  18 +-
 meta/classes/update-alternatives.bbclass           |  52 ++--
 meta/classes/update-rc.d.bbclass                   |  28 +-
 meta/classes/useradd-staticids.bbclass             |  48 ++--
 meta/classes/useradd.bbclass                       |  22 +-
 meta/classes/utility-tasks.bbclass                 |   4 +-
 meta/classes/utils.bbclass                         |  30 +--
 meta/classes/waf.bbclass                           |   2 +-
 meta/conf/bitbake.conf                             |  30 +--
 meta/conf/distro/defaultsetup.conf                 |   2 +-
 meta/conf/distro/include/tclibc-glibc.inc          |   6 +-
 meta/conf/machine/include/arm/arch-arm.inc         |   2 +-
 meta/conf/machine/include/arm/arch-arm64.inc       |   2 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc |  10 +-
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |  10 +-
 .../machine/include/mips/feature-mips-mips16e.inc  |   6 +-
 meta/conf/multilib.conf                            |   2 +-
 meta/lib/oe/classextend.py                         |  12 +-
 meta/lib/oe/copy_buildsystem.py                    |  12 +-
 meta/lib/oe/data.py                                |   2 +-
 meta/lib/oe/distro_check.py                        |  20 +-
 meta/lib/oe/gpg_sign.py                            |   4 +-
 meta/lib/oe/manifest.py                            |  26 +-
 meta/lib/oe/package.py                             |   2 +-
 meta/lib/oe/package_manager.py                     | 174 ++++++-------
 meta/lib/oe/packagedata.py                         |   2 +-
 meta/lib/oe/packagegroup.py                        |   6 +-
 meta/lib/oe/patch.py                               |  12 +-
 meta/lib/oe/path.py                                |   2 +-
 meta/lib/oe/prservice.py                           |  26 +-
 meta/lib/oe/qa.py                                  |   4 +-
 meta/lib/oe/recipeutils.py                         |  38 +--
 meta/lib/oe/rootfs.py                              | 114 ++++-----
 meta/lib/oe/sdk.py                                 |  76 +++---
 meta/lib/oe/sstatesig.py                           |  30 +--
 meta/lib/oe/terminal.py                            |   2 +-
 meta/lib/oe/utils.py                               |  28 +-
 meta/lib/oeqa/controllers/masterimage.py           |  16 +-
 meta/lib/oeqa/oetest.py                            |  60 ++---
 meta/lib/oeqa/runexported.py                       |   8 +-
 meta/lib/oeqa/runtime/_ptest.py                    |  16 +-
 meta/lib/oeqa/runtime/date.py                      |   4 +-
 meta/lib/oeqa/runtime/multilib.py                  |   2 +-
 meta/lib/oeqa/runtime/parselogs.py                 |   4 +-
 meta/lib/oeqa/runtime/rpm.py                       |   6 +-
 meta/lib/oeqa/runtime/scp.py                       |   2 +-
 meta/lib/oeqa/runtime/smart.py                     |  18 +-
 meta/lib/oeqa/runtime/systemd.py                   |   2 +-
 meta/lib/oeqa/runtime/x32lib.py                    |   2 +-
 meta/lib/oeqa/sdk/gcc.py                           |   2 +-
 meta/lib/oeqa/targetcontrol.py                     |  52 ++--
 meta/lib/oeqa/utils/commands.py                    |   2 +-
 meta/lib/oeqa/utils/dump.py                        |   4 +-
 meta/lib/oeqa/utils/package_manager.py             |  12 +-
 meta/lib/oeqa/utils/targetbuild.py                 |   8 +-
 meta/lib/oeqa/utils/testexport.py                  |  14 +-
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb          |   2 +-
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |   2 +-
 meta/recipes-bsp/u-boot/u-boot.inc                 |   2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc        |   4 +-
 meta/recipes-connectivity/connman/connman.inc      |   4 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |   2 +-
 meta/recipes-core/busybox/busybox.inc              |  14 +-
 meta/recipes-core/busybox/busybox_1.24.1.bb        |   4 +-
 meta/recipes-core/busybox/busybox_git.bb           |   4 +-
 meta/recipes-core/coreutils/coreutils_6.9.bb       |   8 +-
 meta/recipes-core/coreutils/coreutils_8.25.bb      |   8 +-
 meta/recipes-core/glibc/glibc-ld.inc               |   6 +-
 meta/recipes-core/glibc/glibc-locale.inc           |   8 +-
 meta/recipes-core/glibc/glibc-package.inc          |   4 +-
 meta/recipes-core/glibc/glibc.inc                  |   6 +-
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |   2 +-
 meta/recipes-core/meta/meta-environment-extsdk.bb  |   4 +-
 meta/recipes-core/meta/meta-environment.bb         |   6 +-
 meta/recipes-core/meta/meta-extsdk-toolchain.bb    |   2 +-
 meta/recipes-core/meta/meta-world-pkgdata.bb       |   2 +-
 meta/recipes-core/meta/signing-keys.bb             |  18 +-
 meta/recipes-core/os-release/os-release.bb         |   4 +-
 .../packagegroups/packagegroup-base.bb             |   4 +-
 .../packagegroups/packagegroup-core-sdk.bb         |   2 +-
 meta/recipes-core/psplash/psplash_git.bb           |  20 +-
 meta/recipes-core/systemd/systemd_230.bb           |   4 +-
 meta/recipes-core/util-linux/util-linux.inc        |   2 +-
 meta/recipes-core/volatile-binds/volatile-binds.bb |   2 +-
 meta/recipes-devtools/apt/apt-native.inc           |   4 +-
 meta/recipes-devtools/apt/apt-package.inc          |   4 +-
 meta/recipes-devtools/automake/automake.inc        |   2 +-
 meta/recipes-devtools/binutils/binutils-2.27.inc   |   2 +-
 meta/recipes-devtools/binutils/binutils.inc        |   6 +-
 meta/recipes-devtools/cmake/cmake.inc              |   2 +-
 meta/recipes-devtools/cmake/cmake_3.6.2.bb         |   4 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |   2 +-
 meta/recipes-devtools/gcc/gcc-common.inc           |  32 +--
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc            |   2 +-
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  |  20 +-
 meta/recipes-devtools/gcc/libgcc-common.inc        |  38 +--
 meta/recipes-devtools/gcc/libgfortran.inc          |   2 +-
 meta/recipes-devtools/git/git.inc                  |   2 +-
 .../kconfig-frontends_3.12.0.0.bb                  |   2 +-
 meta/recipes-devtools/perl/perl_5.22.1.bb          |   2 +-
 meta/recipes-devtools/prelink/prelink_git.bb       |   2 +-
 meta/recipes-devtools/python/python-smartpm_git.bb |   6 +-
 meta/recipes-devtools/qemu/qemu-targets.inc        |   4 +-
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  60 ++---
 meta/recipes-devtools/swig/swig.inc                |   4 +-
 meta/recipes-devtools/vala/vala.inc                |   2 +-
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   2 +-
 meta/recipes-extended/cups/cups.inc                |   2 +-
 meta/recipes-extended/man/man_1.6g.bb              |   4 +-
 .../net-tools/net-tools_1.60-26.bb                 |   8 +-
 .../packagegroup-core-full-cmdline.bb              |   2 +-
 .../packagegroups/packagegroup-core-lsb.bb         |   4 +-
 meta/recipes-extended/pam/libpam_1.3.0.bb          |  14 +-
 meta/recipes-extended/procps/procps_3.3.12.bb      |   8 +-
 meta/recipes-extended/texinfo/texinfo_6.0.bb       |   2 +-
 meta/recipes-extended/tzdata/tzdata_2016i.bb       |   2 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb |   2 +-
 .../gobject-introspection_1.48.0.bb                |   2 +-
 meta/recipes-gnome/gtk+/gtk+3.inc                  |   2 +-
 meta/recipes-gnome/gtk+/gtk+_2.24.31.bb            |   2 +-
 meta/recipes-graphics/cairo/cairo-fpu.inc          |   2 +-
 meta/recipes-graphics/mesa/mesa.inc                |   6 +-
 .../xorg-driver/xorg-driver-common.inc             |   4 +-
 meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb     |   2 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |   2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |   2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb    |   2 +-
 meta/recipes-kernel/linux/linux-yocto.inc          |   4 +-
 meta/recipes-kernel/lttng/lttng-modules_git.bb     |   4 +-
 meta/recipes-kernel/perf/perf-features.inc         |   2 +-
 meta/recipes-kernel/perf/perf.bb                   |   2 +-
 meta/recipes-multimedia/alsa/alsa-fpu.inc          |   2 +-
 .../gstreamer/gst-plugins-package.inc              |  10 +-
 .../gstreamer/gstreamer1.0-omx.inc                 |   4 +-
 meta/recipes-rt/images/core-image-rt-sdk.bb        |   2 +-
 meta/recipes-rt/images/core-image-rt.bb            |   2 +-
 meta/recipes-support/attr/ea-acl.inc               |   4 +-
 meta/recipes-support/boost/boost-1.62.0.inc        |   4 +-
 meta/recipes-support/boost/boost.inc               |   8 +-
 meta/recipes-support/gnutls/gnutls.inc             |   2 +-
 meta/recipes-support/icu/icu_57.1.bb               |   2 +-
 meta/recipes-support/libiconv/libiconv_1.11.1.bb   |   2 +-
 meta/recipes-support/libiconv/libiconv_1.14.bb     |   4 +-
 meta/recipes-support/libnl/libnl_3.2.28.bb         |   2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.56.0.bb |   2 +-
 meta/recipes-support/sqlite/sqlite3.inc            |   2 +-
 meta/recipes-support/taglib/taglib_1.11.bb         |   2 +-
 scripts/contrib/list-packageconfig-flags.py        |   6 +-
 scripts/contrib/verify-homepage.py                 |   2 +-
 scripts/devtool                                    |   2 +-
 scripts/lib/devtool/__init__.py                    |   8 +-
 scripts/lib/devtool/build_image.py                 |  10 +-
 scripts/lib/devtool/deploy.py                      |   2 +-
 scripts/lib/devtool/package.py                     |   2 +-
 scripts/lib/devtool/runqemu.py                     |   4 +-
 scripts/lib/devtool/sdk.py                         |   8 +-
 scripts/lib/devtool/search.py                      |   4 +-
 scripts/lib/devtool/standard.py                    |  62 ++---
 scripts/lib/devtool/upgrade.py                     |  20 +-
 scripts/lib/devtool/utilcmds.py                    |  18 +-
 scripts/lib/recipetool/append.py                   |  22 +-
 scripts/lib/recipetool/create.py                   |  24 +-
 scripts/lib/recipetool/create_buildsys_python.py   |   4 +-
 scripts/lib/recipetool/create_kernel.py            |   4 +-
 scripts/lib/recipetool/create_npm.py               |   6 +-
 scripts/lib/recipetool/newappend.py                |   2 +-
 scripts/lib/scriptutils.py                         |   2 +-
 scripts/oe-pkgdata-util                            |   2 +-
 scripts/recipetool                                 |   2 +-
 282 files changed, 2395 insertions(+), 2395 deletions(-)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index ddc2a85..9dce498 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -11,7 +11,7 @@ PACKAGE_ARCH = "all"
 python () {
     # Allow this class to be included but overridden - only set
     # the values if we're still "all" package arch.
-    if d.getVar("PACKAGE_ARCH", True) == "all":
+    if d.getVar("PACKAGE_ARCH") == "all":
         # No need for virtual/libc or a cross compiler
         d.setVar("INHIBIT_DEFAULT_DEPS","1")
 
@@ -47,6 +47,6 @@ python () {
         d.setVarFlag("emit_pkgdata", "vardepsexclude", "MULTILIB_VARIANTS")
         d.setVarFlag("write_specfile", "vardepsexclude", "MULTILIBS")
     elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
-        bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE", True))
+        bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
 }
 
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 9239983..30215ae 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -52,10 +52,10 @@ do_deploy_all_archives[dirs] = "${WORKDIR}"
 
 
 python () {
-    pn = d.getVar('PN', True)
-    assume_provided = (d.getVar("ASSUME_PROVIDED", True) or "").split()
+    pn = d.getVar('PN')
+    assume_provided = (d.getVar("ASSUME_PROVIDED") or "").split()
     if pn in assume_provided:
-        for p in d.getVar("PROVIDES", True).split():
+        for p in d.getVar("PROVIDES").split():
             if p != pn:
                 pn = p
                 break
@@ -68,7 +68,7 @@ python () {
         bb.debug(1, 'archiver: %s is included: %s' % (pn, reason))
 
     # We just archive gcc-source for all the gcc related recipes
-    if d.getVar('BPN', True) in ['gcc', 'libgcc'] \
+    if d.getVar('BPN') in ['gcc', 'libgcc'] \
             and not pn.startswith('gcc-source'):
         bb.debug(1, 'archiver: %s is excluded, covered by gcc-source' % pn)
         return
@@ -106,7 +106,7 @@ python () {
     # Output the srpm package
     ar_srpm = d.getVarFlag('ARCHIVER_MODE', 'srpm', True)
     if ar_srpm == "1":
-        if d.getVar('PACKAGES', True) != '' and d.getVar('IMAGE_PKGTYPE', True) == 'rpm':
+        if d.getVar('PACKAGES') != '' and d.getVar('IMAGE_PKGTYPE') == 'rpm':
             d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_package_write_rpm' % pn)
             if ar_dumpdata == "1":
                 d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_dumpdata' % pn)
@@ -130,9 +130,9 @@ python do_ar_original() {
     if d.getVarFlag('ARCHIVER_MODE', 'src', True) != "original":
         return
 
-    ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
+    ar_outdir = d.getVar('ARCHIVER_OUTDIR')
     bb.note('Archiving the original source...')
-    urls = d.getVar("SRC_URI", True).split()
+    urls = d.getVar("SRC_URI").split()
     # destsuffix (git fetcher) and subdir (everything else) are allowed to be
     # absolute paths (for example, destsuffix=${S}/foobar).
     # That messes with unpacking inside our tmpdir below, because the fetchers
@@ -157,7 +157,7 @@ python do_ar_original() {
         if os.path.isfile(local):
             shutil.copy(local, ar_outdir)
         elif os.path.isdir(local):
-            tmpdir = tempfile.mkdtemp(dir=d.getVar('ARCHIVER_WORKDIR', True))
+            tmpdir = tempfile.mkdtemp(dir=d.getVar('ARCHIVER_WORKDIR'))
             fetch.unpack(tmpdir, (url,))
             # To handle recipes with more than one source, we add the "name"
             # URL parameter as suffix. We treat it as an error when
@@ -195,24 +195,24 @@ python do_ar_patched() {
         return
 
     # Get the ARCHIVER_OUTDIR before we reset the WORKDIR
-    ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
-    ar_workdir = d.getVar('ARCHIVER_WORKDIR', True)
+    ar_outdir = d.getVar('ARCHIVER_OUTDIR')
+    ar_workdir = d.getVar('ARCHIVER_WORKDIR')
     bb.note('Archiving the patched source...')
     d.setVar('WORKDIR', ar_workdir)
-    create_tarball(d, d.getVar('S', True), 'patched', ar_outdir)
+    create_tarball(d, d.getVar('S'), 'patched', ar_outdir)
 }
 
 python do_ar_configured() {
     import shutil
 
-    ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
+    ar_outdir = d.getVar('ARCHIVER_OUTDIR')
     if d.getVarFlag('ARCHIVER_MODE', 'src', True) == 'configured':
         bb.note('Archiving the configured source...')
-        pn = d.getVar('PN', True)
+        pn = d.getVar('PN')
         # "gcc-source-${PV}" recipes don't have "do_configure"
         # task, so we need to run "do_preconfigure" instead
         if pn.startswith("gcc-source-"):
-            d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))
+            d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR'))
             bb.build.exec_func('do_preconfigure', d)
 
         # The libtool-native's do_configure will remove the
@@ -221,7 +221,7 @@ python do_ar_configured() {
         # instead of.
         elif pn != 'libtool-native':
             # Change the WORKDIR to make do_configure run in another dir.
-            d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))
+            d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR'))
             if bb.data.inherits_class('kernel-yocto', d):
                 bb.build.exec_func('do_kernel_configme', d)
             if bb.data.inherits_class('cmake', d):
@@ -235,12 +235,12 @@ python do_ar_configured() {
             for func in (postfuncs or '').split():
                 if func != "do_qa_configure":
                     bb.build.exec_func(func, d)
-        srcdir = d.getVar('S', True)
-        builddir = d.getVar('B', True)
+        srcdir = d.getVar('S')
+        builddir = d.getVar('B')
         if srcdir != builddir:
             if os.path.exists(builddir):
                 oe.path.copytree(builddir, os.path.join(srcdir, \
-                    'build.%s.ar_configured' % d.getVar('PF', True)))
+                    'build.%s.ar_configured' % d.getVar('PF')))
         create_tarball(d, srcdir, 'configured', ar_outdir)
 }
 
@@ -251,14 +251,14 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
     import tarfile
 
     # Make sure we are only creating a single tarball for gcc sources
-    if (d.getVar('SRC_URI', True) == ""):
+    if (d.getVar('SRC_URI') == ""):
         return
 
     bb.utils.mkdirhier(ar_outdir)
     if suffix:
-        filename = '%s-%s.tar.gz' % (d.getVar('PF', True), suffix)
+        filename = '%s-%s.tar.gz' % (d.getVar('PF'), suffix)
     else:
-        filename = '%s.tar.gz' % d.getVar('PF', True)
+        filename = '%s.tar.gz' % d.getVar('PF')
     tarname = os.path.join(ar_outdir, filename)
 
     srcdir = srcdir.rstrip('/')
@@ -290,7 +290,7 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
     dirname = os.path.dirname(src)
     basename = os.path.basename(src)
     os.chdir(dirname)
-    out_file = os.path.join(ar_outdir, '%s-diff.gz' % d.getVar('PF', True))
+    out_file = os.path.join(ar_outdir, '%s-diff.gz' % d.getVar('PF'))
     diff_cmd = 'diff -Naur %s.orig %s.patched | gzip -c > %s' % (basename, basename, out_file)
     subprocess.call(diff_cmd, shell=True)
     bb.utils.remove(src_patched, recurse=True)
@@ -301,9 +301,9 @@ python do_unpack_and_patch() {
             [ 'patched', 'configured'] and \
             d.getVarFlag('ARCHIVER_MODE', 'diff', True) != '1':
         return
-    ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
-    ar_workdir = d.getVar('ARCHIVER_WORKDIR', True)
-    pn = d.getVar('PN', True)
+    ar_outdir = d.getVar('ARCHIVER_OUTDIR')
+    ar_workdir = d.getVar('ARCHIVER_WORKDIR')
+    pn = d.getVar('PN')
 
     # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
     if not (bb.data.inherits_class('kernel-yocto', d) or pn.startswith('gcc-source')):
@@ -313,18 +313,18 @@ python do_unpack_and_patch() {
         # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
         # possibly requiring of the following tasks (such as some recipes's
         # do_patch required 'B' existed).
-        bb.utils.mkdirhier(d.getVar('B', True))
+        bb.utils.mkdirhier(d.getVar('B'))
 
         bb.build.exec_func('do_unpack', d)
 
     # Save the original source for creating the patches
     if d.getVarFlag('ARCHIVER_MODE', 'diff', True) == '1':
-        src = d.getVar('S', True).rstrip('/')
+        src = d.getVar('S').rstrip('/')
         src_orig = '%s.orig' % src
         oe.path.copytree(src, src_orig)
 
     # Make sure gcc and kernel sources are patched only once
-    if not (d.getVar('SRC_URI', True) == "" or (bb.data.inherits_class('kernel-yocto', d) or pn.startswith('gcc-source'))):
+    if not (d.getVar('SRC_URI') == "" or (bb.data.inherits_class('kernel-yocto', d) or pn.startswith('gcc-source'))):
         bb.build.exec_func('do_patch', d)
 
     # Create the patches
@@ -343,14 +343,14 @@ python do_ar_recipe () {
 
     require_re = re.compile( r"require\s+(.+)" )
     include_re = re.compile( r"include\s+(.+)" )
-    bbfile = d.getVar('FILE', True)
-    outdir = os.path.join(d.getVar('WORKDIR', True), \
-            '%s-recipe' % d.getVar('PF', True))
+    bbfile = d.getVar('FILE')
+    outdir = os.path.join(d.getVar('WORKDIR'), \
+            '%s-recipe' % d.getVar('PF'))
     bb.utils.mkdirhier(outdir)
     shutil.copy(bbfile, outdir)
 
-    pn = d.getVar('PN', True)
-    bbappend_files = d.getVar('BBINCLUDED', True).split()
+    pn = d.getVar('PN')
+    bbappend_files = d.getVar('BBINCLUDED').split()
     # If recipe name is aa, we need to match files like aa.bbappend and aa_1.1.bbappend
     # Files like aa1.bbappend or aa1_1.1.bbappend must be excluded.
     bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" %pn)
@@ -360,7 +360,7 @@ python do_ar_recipe () {
             shutil.copy(file, outdir)
 
     dirname = os.path.dirname(bbfile)
-    bbpath = '%s:%s' % (dirname, d.getVar('BBPATH', True))
+    bbpath = '%s:%s' % (dirname, d.getVar('BBPATH'))
     f = open(bbfile, 'r')
     for line in f.readlines():
         incfile = None
@@ -374,7 +374,7 @@ python do_ar_recipe () {
             if incfile:
                 shutil.copy(incfile, outdir)
 
-    create_tarball(d, outdir, 'recipe', d.getVar('ARCHIVER_OUTDIR', True))
+    create_tarball(d, outdir, 'recipe', d.getVar('ARCHIVER_OUTDIR'))
     bb.utils.remove(outdir, recurse=True)
 }
 
@@ -383,8 +383,8 @@ python do_dumpdata () {
     dump environment data to ${PF}-showdata.dump
     """
 
-    dumpfile = os.path.join(d.getVar('ARCHIVER_OUTDIR', True), \
-        '%s-showdata.dump' % d.getVar('PF', True))
+    dumpfile = os.path.join(d.getVar('ARCHIVER_OUTDIR'), \
+        '%s-showdata.dump' % d.getVar('PF'))
     bb.note('Dumping metadata into %s' % dumpfile)
     with open(dumpfile, "w") as f:
         # emit variables and shell functions
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index c43ea9a..c43531b 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -1,8 +1,8 @@
 def autotools_dep_prepend(d):
-    if d.getVar('INHIBIT_AUTOTOOLS_DEPS', True):
+    if d.getVar('INHIBIT_AUTOTOOLS_DEPS'):
         return ''
 
-    pn = d.getVar('PN', True)
+    pn = d.getVar('PN')
     deps = ''
 
     if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
@@ -14,7 +14,7 @@ def autotools_dep_prepend(d):
         if not bb.data.inherits_class('native', d) \
                         and not bb.data.inherits_class('nativesdk', d) \
                         and not bb.data.inherits_class('cross', d) \
-                        and not d.getVar('INHIBIT_DEFAULT_DEPS', True):
+                        and not d.getVar('INHIBIT_DEFAULT_DEPS'):
             deps += 'libtool-cross '
 
     return deps + 'gnu-config-native '
@@ -139,15 +139,15 @@ ACLOCALDIR = "${WORKDIR}/aclocal-copy"
 python autotools_copy_aclocals () {
     import copy
 
-    s = d.getVar("AUTOTOOLS_SCRIPT_PATH", True)
+    s = d.getVar("AUTOTOOLS_SCRIPT_PATH")
     if not os.path.exists(s + "/configure.in") and not os.path.exists(s + "/configure.ac"):
         if not d.getVar("AUTOTOOLS_COPYACLOCAL", False):
             return
 
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
     #bb.warn(str(taskdepdata))
-    pn = d.getVar("PN", True)
-    aclocaldir = d.getVar("ACLOCALDIR", True)
+    pn = d.getVar("PN")
+    aclocaldir = d.getVar("ACLOCALDIR")
     oe.path.remove(aclocaldir)
     bb.utils.mkdirhier(aclocaldir)
     start = None
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 024fe43..0bc1569 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -16,7 +16,7 @@ OE_IMPORTS[type] = "list"
 def oe_import(d):
     import sys
 
-    bbpath = d.getVar("BBPATH", True).split(":")
+    bbpath = d.getVar("BBPATH").split(":")
     sys.path[0:0] = [os.path.join(dir, "lib") for dir in bbpath]
 
     def inject(name, value):
@@ -37,7 +37,7 @@ def oe_import(d):
 OE_IMPORTED := "${@oe_import(d)}"
 
 def lsb_distro_identifier(d):
-    adjust = d.getVar('LSB_DISTRO_ADJUST', True)
+    adjust = d.getVar('LSB_DISTRO_ADJUST')
     adjust_func = None
     if adjust:
         try:
@@ -72,7 +72,7 @@ def base_dep_prepend(d):
     # we need that built is the responsibility of the patch function / class, not
     # the application.
     if not d.getVar('INHIBIT_DEFAULT_DEPS', False):
-        if (d.getVar('HOST_SYS', True) != d.getVar('BUILD_SYS', True)):
+        if (d.getVar('HOST_SYS') != d.getVar('BUILD_SYS')):
             deps += " virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc "
     return deps
 
@@ -83,11 +83,11 @@ DEPENDS_prepend="${BASEDEPENDS} "
 FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
 # THISDIR only works properly with imediate expansion as it has to run
 # in the context of the location its used (:=)
-THISDIR = "${@os.path.dirname(d.getVar('FILE', True))}"
+THISDIR = "${@os.path.dirname(d.getVar('FILE'))}"
 
 def extra_path_elements(d):
     path = ""
-    elements = (d.getVar('EXTRANATIVEPATH', True) or "").split()
+    elements = (d.getVar('EXTRANATIVEPATH') or "").split()
     for e in elements:
         path = path + "${STAGING_BINDIR_NATIVE}/" + e + ":"
     return path
@@ -96,8 +96,8 @@ PATH_prepend = "${@extra_path_elements(d)}"
 
 def get_lic_checksum_file_list(d):
     filelist = []
-    lic_files = d.getVar("LIC_FILES_CHKSUM", True) or ''
-    tmpdir = d.getVar("TMPDIR", True)
+    lic_files = d.getVar("LIC_FILES_CHKSUM") or ''
+    tmpdir = d.getVar("TMPDIR")
 
     urls = lic_files.split()
     for url in urls:
@@ -113,7 +113,7 @@ def get_lic_checksum_file_list(d):
                     continue
                 filelist.append(path + ":" + str(os.path.exists(path)))
         except bb.fetch.MalformedUrl:
-            bb.fatal(d.getVar('PN', True) + ": LIC_FILES_CHKSUM contains an invalid URL: " + url)
+            bb.fatal(d.getVar('PN') + ": LIC_FILES_CHKSUM contains an invalid URL: " + url)
     return " ".join(filelist)
 
 addtask fetch
@@ -123,7 +123,7 @@ do_fetch[file-checksums] += " ${@get_lic_checksum_file_list(d)}"
 do_fetch[vardeps] += "SRCREV"
 python base_do_fetch() {
 
-    src_uri = (d.getVar('SRC_URI', True) or "").split()
+    src_uri = (d.getVar('SRC_URI') or "").split()
     if len(src_uri) == 0:
         return
 
@@ -138,31 +138,31 @@ addtask unpack after do_fetch
 do_unpack[dirs] = "${WORKDIR}"
 
 python () {
-    if d.getVar('S', True) != d.getVar('WORKDIR', True):
+    if d.getVar('S') != d.getVar('WORKDIR'):
         d.setVarFlag('do_unpack', 'cleandirs', '${S}')
     else:
         d.setVarFlag('do_unpack', 'cleandirs', os.path.join('${S}', 'patches'))
 }
 python base_do_unpack() {
-    src_uri = (d.getVar('SRC_URI', True) or "").split()
+    src_uri = (d.getVar('SRC_URI') or "").split()
     if len(src_uri) == 0:
         return
 
     try:
         fetcher = bb.fetch2.Fetch(src_uri, d)
-        fetcher.unpack(d.getVar('WORKDIR', True))
+        fetcher.unpack(d.getVar('WORKDIR'))
     except bb.fetch2.BBFetchException as e:
         bb.fatal(str(e))
 }
 
 def pkgarch_mapping(d):
     # Compatibility mappings of TUNE_PKGARCH (opt in)
-    if d.getVar("PKGARCHCOMPAT_ARMV7A", True):
-        if d.getVar("TUNE_PKGARCH", True) == "armv7a-vfp-neon":
+    if d.getVar("PKGARCHCOMPAT_ARMV7A"):
+        if d.getVar("TUNE_PKGARCH") == "armv7a-vfp-neon":
             d.setVar("TUNE_PKGARCH", "armv7a")
 
 def get_layers_branch_rev(d):
-    layers = (d.getVar("BBLAYERS", True) or "").split()
+    layers = (d.getVar("BBLAYERS") or "").split()
     layers_branch_rev = ["%-17s = \"%s:%s\"" % (os.path.basename(i), \
         base_get_metadata_git_branch(i, None).strip(), \
         base_get_metadata_git_revision(i, None)) \
@@ -189,7 +189,7 @@ BUILDCFG_FUNCS[type] = "list"
 def buildcfg_vars(d):
     statusvars = oe.data.typed_value('BUILDCFG_VARS', d)
     for var in statusvars:
-        value = d.getVar(var, True)
+        value = d.getVar(var)
         if value is not None:
             yield '%-17s = "%s"' % (var, value)
 
@@ -197,7 +197,7 @@ def buildcfg_neededvars(d):
     needed_vars = oe.data.typed_value("BUILDCFG_NEEDEDVARS", d)
     pesteruser = []
     for v in needed_vars:
-        val = d.getVar(v, True)
+        val = d.getVar(v)
         if not val or val == 'INVALID':
             pesteruser.append(v)
 
@@ -230,7 +230,7 @@ python base_eventhandler() {
                 if flines:
                     statuslines.extend(flines)
 
-        statusheader = e.data.getVar('BUILDCFG_HEADER', True)
+        statusheader = e.data.getVar('BUILDCFG_HEADER')
         if statusheader:
             bb.plain('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
 
@@ -238,7 +238,7 @@ python base_eventhandler() {
     # target ones and we'd see dulpicate key names overwriting each other
     # for various PREFERRED_PROVIDERS
     if isinstance(e, bb.event.RecipePreFinalise):
-        if e.data.getVar("TARGET_PREFIX", True) == e.data.getVar("SDK_PREFIX", True):
+        if e.data.getVar("TARGET_PREFIX") == e.data.getVar("SDK_PREFIX"):
             e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils")
             e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial")
             e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc")
@@ -264,14 +264,14 @@ python base_eventhandler() {
         # sysroot since they're now "unreachable". This makes switching virtual/kernel work in 
         # particular.
         #
-        pn = d.getVar('PN', True)
+        pn = d.getVar('PN')
         source_mirror_fetch = d.getVar('SOURCE_MIRROR_FETCH', False)
         if not source_mirror_fetch:
-            provs = (d.getVar("PROVIDES", True) or "").split()
-            multiwhitelist = (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
+            provs = (d.getVar("PROVIDES") or "").split()
+            multiwhitelist = (d.getVar("MULTI_PROVIDER_WHITELIST") or "").split()
             for p in provs:
                 if p.startswith("virtual/") and p not in multiwhitelist:
-                    profprov = d.getVar("PREFERRED_PROVIDER_" + p, True)
+                    profprov = d.getVar("PREFERRED_PROVIDER_" + p)
                     if profprov and pn != profprov:
                         raise bb.parse.SkipPackage("PREFERRED_PROVIDER_%s set to %s, not %s" % (p, profprov, pn))
 }
@@ -333,9 +333,9 @@ def set_packagetriplet(d):
     tos = []
     tvs = []
 
-    archs.append(d.getVar("PACKAGE_ARCHS", True).split())
-    tos.append(d.getVar("TARGET_OS", True))
-    tvs.append(d.getVar("TARGET_VENDOR", True))
+    archs.append(d.getVar("PACKAGE_ARCHS").split())
+    tos.append(d.getVar("TARGET_OS"))
+    tvs.append(d.getVar("TARGET_VENDOR"))
 
     def settriplet(d, varname, archs, tos, tvs):
         triplets = []
@@ -347,16 +347,16 @@ def set_packagetriplet(d):
 
     settriplet(d, "PKGTRIPLETS", archs, tos, tvs)
 
-    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+    variants = d.getVar("MULTILIB_VARIANTS") or ""
     for item in variants.split():
         localdata = bb.data.createCopy(d)
         overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
         localdata.setVar("OVERRIDES", overrides)
         bb.data.update_data(localdata)
 
-        archs.append(localdata.getVar("PACKAGE_ARCHS", True).split())
-        tos.append(localdata.getVar("TARGET_OS", True))
-        tvs.append(localdata.getVar("TARGET_VENDOR", True))
+        archs.append(localdata.getVar("PACKAGE_ARCHS").split())
+        tos.append(localdata.getVar("TARGET_OS"))
+        tvs.append(localdata.getVar("TARGET_VENDOR"))
 
     settriplet(d, "PKGMLTRIPLETS", archs, tos, tvs)
 
@@ -371,10 +371,10 @@ python () {
     # PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends"
     pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
     if pkgconfigflags:
-        pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
-        pn = d.getVar("PN", True)
+        pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
+        pn = d.getVar("PN")
 
-        mlprefix = d.getVar("MLPREFIX", True)
+        mlprefix = d.getVar("MLPREFIX")
 
         def expandFilter(appends, extension, prefix):
             appends = bb.utils.explode_deps(d.expand(" ".join(appends)))
@@ -416,7 +416,7 @@ python () {
             num = len(items)
             if num > 4:
                 bb.error("%s: PACKAGECONFIG[%s] Only enable,disable,depend,rdepend can be specified!"
-                    % (d.getVar('PN', True), flag))
+                    % (d.getVar('PN'), flag))
 
             if flag in pkgconfig:
                 if num >= 3 and items[2]:
@@ -431,8 +431,8 @@ python () {
         appendVar('RDEPENDS_${PN}', extrardeps)
         appendVar('PACKAGECONFIG_CONFARGS', extraconf)
 
-    pn = d.getVar('PN', True)
-    license = d.getVar('LICENSE', True)
+    pn = d.getVar('PN')
+    license = d.getVar('LICENSE')
     if license == "INVALID":
         bb.fatal('This recipe does not have the LICENSE field set (%s)' % pn)
 
@@ -462,26 +462,26 @@ python () {
         d.setVarFlag('do_devshell', 'fakeroot', '1')
         d.appendVarFlag('do_devshell', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
 
-    need_machine = d.getVar('COMPATIBLE_MACHINE', True)
+    need_machine = d.getVar('COMPATIBLE_MACHINE')
     if need_machine:
         import re
-        compat_machines = (d.getVar('MACHINEOVERRIDES', True) or "").split(":")
+        compat_machines = (d.getVar('MACHINEOVERRIDES') or "").split(":")
         for m in compat_machines:
             if re.match(need_machine, m):
                 break
         else:
-            raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE', True))
+            raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE'))
 
     source_mirror_fetch = d.getVar('SOURCE_MIRROR_FETCH', False)
     if not source_mirror_fetch:
-        need_host = d.getVar('COMPATIBLE_HOST', True)
+        need_host = d.getVar('COMPATIBLE_HOST')
         if need_host:
             import re
-            this_host = d.getVar('HOST_SYS', True)
+            this_host = d.getVar('HOST_SYS')
             if not re.match(need_host, this_host):
                 raise bb.parse.SkipPackage("incompatible with host %s (not in COMPATIBLE_HOST)" % this_host)
 
-        bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE', True) or "").split()
+        bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
 
         check_license = False if pn.startswith("nativesdk-") else True
         for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARGET_ARCH}",
@@ -500,21 +500,21 @@ python () {
             for lic in bad_licenses:
                 spdx_license = return_spdx(d, lic)
                 for w in ["LGPLv2_WHITELIST_", "WHITELIST_"]:
-                    whitelist.extend((d.getVar(w + lic, True) or "").split())
+                    whitelist.extend((d.getVar(w + lic) or "").split())
                     if spdx_license:
-                        whitelist.extend((d.getVar(w + spdx_license, True) or "").split())
+                        whitelist.extend((d.getVar(w + spdx_license) or "").split())
                     '''
                     We need to track what we are whitelisting and why. If pn is
                     incompatible we need to be able to note that the image that
                     is created may infact contain incompatible licenses despite
                     INCOMPATIBLE_LICENSE being set.
                     '''
-                    incompatwl.extend((d.getVar(w + lic, True) or "").split())
+                    incompatwl.extend((d.getVar(w + lic) or "").split())
                     if spdx_license:
-                        incompatwl.extend((d.getVar(w + spdx_license, True) or "").split())
+                        incompatwl.extend((d.getVar(w + spdx_license) or "").split())
 
             if not pn in whitelist:
-                pkgs = d.getVar('PACKAGES', True).split()
+                pkgs = d.getVar('PACKAGES').split()
                 skipped_pkgs = []
                 unskipped_pkgs = []
                 for pkg in pkgs:
@@ -526,7 +526,7 @@ python () {
                 if unskipped_pkgs:
                     for pkg in skipped_pkgs:
                         bb.debug(1, "SKIPPING the package " + pkg + " at do_rootfs because it's " + license)
-                        mlprefix = d.getVar('MLPREFIX', True)
+                        mlprefix = d.getVar('MLPREFIX')
                         d.setVar('LICENSE_EXCLUSION-' + mlprefix + pkg, 1)
                     for pkg in unskipped_pkgs:
                         bb.debug(1, "INCLUDING the package " + pkg)
@@ -542,8 +542,8 @@ python () {
         # matching of license expressions - just check that all license strings
         # in LICENSE_<pkg> are found in LICENSE.
         license_set = oe.license.list_licenses(license)
-        for pkg in d.getVar('PACKAGES', True).split():
-            pkg_license = d.getVar('LICENSE_' + pkg, True)
+        for pkg in d.getVar('PACKAGES').split():
+            pkg_license = d.getVar('LICENSE_' + pkg)
             if pkg_license:
                 unlisted = oe.license.list_licenses(pkg_license) - license_set
                 if unlisted:
@@ -551,7 +551,7 @@ python () {
                             "listed in LICENSE" % (pkg, ' '.join(unlisted)))
 
     needsrcrev = False
-    srcuri = d.getVar('SRC_URI', True)
+    srcuri = d.getVar('SRC_URI')
     for uri in srcuri.split():
         (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
 
@@ -611,8 +611,8 @@ python () {
     set_packagetriplet(d)
 
     # 'multimachine' handling
-    mach_arch = d.getVar('MACHINE_ARCH', True)
-    pkg_arch = d.getVar('PACKAGE_ARCH', True)
+    mach_arch = d.getVar('MACHINE_ARCH')
+    pkg_arch = d.getVar('PACKAGE_ARCH')
 
     if (pkg_arch == mach_arch):
         # Already machine specific - nothing further to do
@@ -622,11 +622,11 @@ python () {
     # We always try to scan SRC_URI for urls with machine overrides
     # unless the package sets SRC_URI_OVERRIDES_PACKAGE_ARCH=0
     #
-    override = d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', True)
+    override = d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH')
     if override != '0':
         paths = []
-        fpaths = (d.getVar('FILESPATH', True) or '').split(':')
-        machine = d.getVar('MACHINE', True)
+        fpaths = (d.getVar('FILESPATH') or '').split(':')
+        machine = d.getVar('MACHINE')
         for p in fpaths:
             if os.path.basename(p) == machine and os.path.isdir(p):
                 paths.append(p)
@@ -643,16 +643,16 @@ python () {
                         d.setVar('PACKAGE_ARCH', "${MACHINE_ARCH}")
                         return
 
-    packages = d.getVar('PACKAGES', True).split()
+    packages = d.getVar('PACKAGES').split()
     for pkg in packages:
-        pkgarch = d.getVar("PACKAGE_ARCH_%s" % pkg, True)
+        pkgarch = d.getVar("PACKAGE_ARCH_%s" % pkg)
 
         # We could look for != PACKAGE_ARCH here but how to choose
         # if multiple differences are present?
         # Look through PACKAGE_ARCHS for the priority order?
         if pkgarch and pkgarch == mach_arch:
             d.setVar('PACKAGE_ARCH', "${MACHINE_ARCH}")
-            bb.warn("Recipe %s is marked as only being architecture specific but seems to have machine specific packages?! The recipe may as well mark itself as machine specific directly." % d.getVar("PN", True))
+            bb.warn("Recipe %s is marked as only being architecture specific but seems to have machine specific packages?! The recipe may as well mark itself as machine specific directly." % d.getVar("PN"))
 }
 
 addtask cleansstate after do_clean
@@ -663,7 +663,7 @@ addtask cleanall after do_cleansstate
 do_cleansstate[nostamp] = "1"
 
 python do_cleanall() {
-    src_uri = (d.getVar('SRC_URI', True) or "").split()
+    src_uri = (d.getVar('SRC_URI') or "").split()
     if len(src_uri) == 0:
         return
 
diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
index 8591308..5372294 100644
--- a/meta/classes/binconfig.bbclass
+++ b/meta/classes/binconfig.bbclass
@@ -22,7 +22,7 @@ def get_binconfig_mangle(d):
         s += " -e 's:-I${WORKDIR}:-I${STAGING_INCDIR}:'"
         s += " -e 's:-L${WORKDIR}:-L${STAGING_LIBDIR}:'"
         if d.getVar("OE_BINCONFIG_EXTRA_MANGLE", False):
-            s += d.getVar("OE_BINCONFIG_EXTRA_MANGLE", True)
+            s += d.getVar("OE_BINCONFIG_EXTRA_MANGLE")
 
     return s
 
diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
index a0141a8..c6f4223 100644
--- a/meta/classes/blacklist.bbclass
+++ b/meta/classes/blacklist.bbclass
@@ -16,7 +16,7 @@
 addhandler blacklist_multilib_eventhandler
 blacklist_multilib_eventhandler[eventmask] = "bb.event.ConfigParsed"
 python blacklist_multilib_eventhandler() {
-    multilibs = e.data.getVar('MULTILIBS', True)
+    multilibs = e.data.getVar('MULTILIBS')
     if not multilibs:
         return
 
@@ -38,7 +38,7 @@ python blacklist_multilib_eventhandler() {
 }
 
 python () {
-    blacklist = d.getVarFlag('PNBLACKLIST', d.getVar('PN', True), True)
+    blacklist = d.getVarFlag('PNBLACKLIST', d.getVar('PN'), True)
 
     if blacklist:
         raise bb.parse.SkipPackage("Recipe is blacklisted: %s" % (blacklist))
diff --git a/meta/classes/bugzilla.bbclass b/meta/classes/bugzilla.bbclass
index 3fc8956..6d9a821 100644
--- a/meta/classes/bugzilla.bbclass
+++ b/meta/classes/bugzilla.bbclass
@@ -110,12 +110,12 @@ python bugzilla_eventhandler() {
         return
 
     if name == "TaskFailed":
-        xmlrpc  = data.getVar("BUGZILLA_XMLRPC", True)
-        user    = data.getVar("BUGZILLA_USER", True)
-        passw   = data.getVar("BUGZILLA_PASS", True)
-        product = data.getVar("BUGZILLA_PRODUCT", True)
-        compon  = data.getVar("BUGZILLA_COMPONENT", True)
-        version = data.getVar("BUGZILLA_VERSION", True)
+        xmlrpc  = data.getVar("BUGZILLA_XMLRPC")
+        user    = data.getVar("BUGZILLA_USER")
+        passw   = data.getVar("BUGZILLA_PASS")
+        product = data.getVar("BUGZILLA_PRODUCT")
+        compon  = data.getVar("BUGZILLA_COMPONENT")
+        version = data.getVar("BUGZILLA_VERSION")
 
         proxy   = data.getVar('http_proxy', True )
         if (proxy):
@@ -133,14 +133,14 @@ python bugzilla_eventhandler() {
             'component': compon}
 
         # evil hack to figure out what is going on
-        debug_file = open(os.path.join(data.getVar("TMPDIR", True),"..","bugzilla-log"),"a")
+        debug_file = open(os.path.join(data.getVar("TMPDIR"),"..","bugzilla-log"),"a")
 
         file = None
-        bugname = "%(package)s-%(pv)s-autobuild" % { "package" : data.getVar("PN", True),
-                                                           "pv"      : data.getVar("PV", True),
+        bugname = "%(package)s-%(pv)s-autobuild" % { "package" : data.getVar("PN"),
+                                                           "pv"      : data.getVar("PV"),
                                                            }
-        log_file = glob.glob("%s/log.%s.*" % (event.data.getVar('T', True), event.task))
-        text     = "The %s step in %s failed at %s for machine %s" % (e.task, data.getVar("PN", True), data.getVar('DATETIME', True), data.getVar( 'MACHINE', True ) )
+        log_file = glob.glob("%s/log.%s.*" % (event.data.getVar('T'), event.task))
+        text     = "The %s step in %s failed at %s for machine %s" % (e.task, data.getVar("PN"), data.getVar('DATETIME'), data.getVar( 'MACHINE', True ) )
         if len(log_file) != 0:
             print >> debug_file, "Adding log file %s" % log_file[0]
             file = open(log_file[0], 'r')
@@ -168,7 +168,7 @@ python bugzilla_eventhandler() {
 
         if bug_number and log:
             print >> debug_file, "The bug is known as '%s'" % bug_number
-            desc = "Build log for machine %s" % (data.getVar('MACHINE', True))
+            desc = "Build log for machine %s" % (data.getVar('MACHINE'))
             if not bugzilla_create_attachment(debug_file, server, args.copy(), bug_number, text, log_file[0], log, desc):
                  print >> debug_file, "Failed to attach the build log for bug #%s" % bug_number
             else:
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index d82e9bb..73cd886 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -64,18 +64,18 @@ PATCH_GIT_USER_NAME ?= "OpenEmbedded"
 # Write out metadata about this package for comparison when writing future packages
 #
 python buildhistory_emit_pkghistory() {
-    if not d.getVar('BB_CURRENTTASK', True) in ['packagedata', 'packagedata_setscene']:
+    if not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_setscene']:
         return 0
 
-    if not "package" in (d.getVar('BUILDHISTORY_FEATURES', True) or "").split():
+    if not "package" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
         return 0
 
     import re
     import json
     import errno
 
-    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
-    oldpkghistdir = d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE', True)
+    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
+    oldpkghistdir = d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')
 
     class RecipeInfo:
         def __init__(self, name):
@@ -182,12 +182,12 @@ python buildhistory_emit_pkghistory() {
         items.sort()
         return ' '.join(items)
 
-    pn = d.getVar('PN', True)
-    pe = d.getVar('PE', True) or "0"
-    pv = d.getVar('PV', True)
-    pr = d.getVar('PR', True)
+    pn = d.getVar('PN')
+    pe = d.getVar('PE') or "0"
+    pv = d.getVar('PV')
+    pr = d.getVar('PR')
 
-    pkgdata_dir = d.getVar('PKGDATA_DIR', True)
+    pkgdata_dir = d.getVar('PKGDATA_DIR')
     packages = ""
     try:
         with open(os.path.join(pkgdata_dir, pn)) as f:
@@ -203,7 +203,7 @@ python buildhistory_emit_pkghistory() {
             raise
 
     packagelist = packages.split()
-    preserve = d.getVar('BUILDHISTORY_PRESERVE', True).split()
+    preserve = d.getVar('BUILDHISTORY_PRESERVE').split()
     if not os.path.exists(pkghistdir):
         bb.utils.mkdirhier(pkghistdir)
     else:
@@ -223,11 +223,11 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.pe = pe
     rcpinfo.pv = pv
     rcpinfo.pr = pr
-    rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS', True) or ""))
+    rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS') or ""))
     rcpinfo.packages = packages
     write_recipehistory(rcpinfo, d)
 
-    pkgdest = d.getVar('PKGDEST', True)
+    pkgdest = d.getVar('PKGDEST')
     for pkg in packagelist:
         pkgdata = {}
         with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
@@ -293,7 +293,7 @@ python buildhistory_emit_pkghistory() {
 def write_recipehistory(rcpinfo, d):
     bb.debug(2, "Writing recipe history")
 
-    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
+    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
 
     infofile = os.path.join(pkghistdir, "latest")
     with open(infofile, "w") as f:
@@ -308,7 +308,7 @@ def write_recipehistory(rcpinfo, d):
 def write_pkghistory(pkginfo, d):
     bb.debug(2, "Writing package history for package %s" % pkginfo.name)
 
-    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
+    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
 
     pkgpath = os.path.join(pkghistdir, pkginfo.name)
     if not os.path.exists(pkgpath):
@@ -369,7 +369,7 @@ def buildhistory_list_installed(d, rootfs_type="image"):
         pkgs = sdk_list_installed_packages(d, rootfs_type == "sdk_target")
 
     for output_type, output_file in process_list:
-        output_file_full = os.path.join(d.getVar('WORKDIR', True), output_file)
+        output_file_full = os.path.join(d.getVar('WORKDIR'), output_file)
 
         with open(output_file_full, 'w') as output:
             output.write(format_pkg_list(pkgs, output_type))
@@ -550,7 +550,7 @@ END
 python buildhistory_get_extra_sdkinfo() {
     import operator
     import math
-    if d.getVar('BB_CURRENTTASK', True) == 'populate_sdk_ext':
+    if d.getVar('BB_CURRENTTASK') == 'populate_sdk_ext':
         tasksizes = {}
         filesizes = {}
         for root, _, files in os.walk(d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-cache')):
@@ -591,7 +591,7 @@ SDK_POSTPROCESS_COMMAND_append = " buildhistory_get_sdkinfo ; buildhistory_get_e
 SDK_POSTPROCESS_COMMAND[vardepvalueexclude] .= "| buildhistory_get_sdkinfo ; buildhistory_get_extra_sdkinfo; "
 
 def buildhistory_get_build_id(d):
-    if d.getVar('BB_WORKERCONTEXT', True) != '1':
+    if d.getVar('BB_WORKERCONTEXT') != '1':
         return ""
     localdata = bb.data.createCopy(d)
     bb.data.update_data(localdata)
@@ -605,12 +605,12 @@ def buildhistory_get_build_id(d):
             if flines:
                 statuslines.extend(flines)
 
-    statusheader = d.getVar('BUILDCFG_HEADER', True)
+    statusheader = d.getVar('BUILDCFG_HEADER')
     return('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
 
 def buildhistory_get_metadata_revs(d):
     # We want an easily machine-readable format here, so get_layers_branch_rev isn't quite what we want
-    layers = (d.getVar("BBLAYERS", True) or "").split()
+    layers = (d.getVar("BBLAYERS") or "").split()
     medadata_revs = ["%-17s = %s:%s" % (os.path.basename(i), \
         base_get_metadata_git_branch(i, None).strip(), \
         base_get_metadata_git_revision(i, None)) \
@@ -622,7 +622,7 @@ def outputvars(vars, listvars, d):
     listvars = listvars.split()
     ret = ""
     for var in vars:
-        value = d.getVar(var, True) or ""
+        value = d.getVar(var) or ""
         if var in listvars:
             # Squash out spaces
             value = oe.utils.squashspaces(value)
@@ -630,17 +630,17 @@ def outputvars(vars, listvars, d):
     return ret.rstrip('\n')
 
 def buildhistory_get_imagevars(d):
-    if d.getVar('BB_WORKERCONTEXT', True) != '1':
+    if d.getVar('BB_WORKERCONTEXT') != '1':
         return ""
     imagevars = "DISTRO DISTRO_VERSION USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES IMAGE_LINGUAS IMAGE_INSTALL BAD_RECOMMENDATIONS NO_RECOMMENDATIONS PACKAGE_EXCLUDE ROOTFS_POSTPROCESS_COMMAND IMAGE_POSTPROCESS_COMMAND"
     listvars = "USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES IMAGE_LINGUAS IMAGE_INSTALL BAD_RECOMMENDATIONS PACKAGE_EXCLUDE"
     return outputvars(imagevars, listvars, d)
 
 def buildhistory_get_sdkvars(d):
-    if d.getVar('BB_WORKERCONTEXT', True) != '1':
+    if d.getVar('BB_WORKERCONTEXT') != '1':
         return ""
     sdkvars = "DISTRO DISTRO_VERSION SDK_NAME SDK_VERSION SDKMACHINE SDKIMAGE_FEATURES BAD_RECOMMENDATIONS NO_RECOMMENDATIONS PACKAGE_EXCLUDE"
-    if d.getVar('BB_CURRENTTASK', True) == 'populate_sdk_ext':
+    if d.getVar('BB_CURRENTTASK') == 'populate_sdk_ext':
         # Extensible SDK uses some additional variables
         sdkvars += " SDK_LOCAL_CONF_WHITELIST SDK_LOCAL_CONF_BLACKLIST SDK_INHERIT_BLACKLIST SDK_UPDATE_URL SDK_EXT_TYPE SDK_RECRDEP_TASKS SDK_INCLUDE_PKGDATA SDK_INCLUDE_TOOLCHAIN"
     listvars = "SDKIMAGE_FEATURES BAD_RECOMMENDATIONS PACKAGE_EXCLUDE SDK_LOCAL_CONF_WHITELIST SDK_LOCAL_CONF_BLACKLIST SDK_INHERIT_BLACKLIST"
@@ -735,16 +735,16 @@ END
 }
 
 python buildhistory_eventhandler() {
-    if e.data.getVar('BUILDHISTORY_FEATURES', True).strip():
-        reset = e.data.getVar("BUILDHISTORY_RESET", True)
-        olddir = e.data.getVar("BUILDHISTORY_OLD_DIR", True)
+    if e.data.getVar('BUILDHISTORY_FEATURES').strip():
+        reset = e.data.getVar("BUILDHISTORY_RESET")
+        olddir = e.data.getVar("BUILDHISTORY_OLD_DIR")
         if isinstance(e, bb.event.BuildStarted):
             if reset:
                 import shutil
                 # Clean up after potentially interrupted build.
                 if os.path.isdir(olddir):
                     shutil.rmtree(olddir)
-                rootdir = e.data.getVar("BUILDHISTORY_DIR", True)
+                rootdir = e.data.getVar("BUILDHISTORY_DIR")
                 entries = [ x for x in os.listdir(rootdir) if not x.startswith('.') ]
                 bb.utils.mkdirhier(olddir)
                 for entry in entries:
@@ -754,7 +754,7 @@ python buildhistory_eventhandler() {
             if reset:
                 import shutil
                 shutil.rmtree(olddir)
-            if e.data.getVar("BUILDHISTORY_COMMIT", True) == "1":
+            if e.data.getVar("BUILDHISTORY_COMMIT") == "1":
                 bb.note("Writing buildhistory")
                 localdata = bb.data.createCopy(e.data)
                 localdata.setVar('BUILDHISTORY_BUILD_FAILURES', str(e._failures))
@@ -774,7 +774,7 @@ def _get_srcrev_values(d):
     """
 
     scms = []
-    fetcher = bb.fetch.Fetch(d.getVar('SRC_URI', True).split(), d)
+    fetcher = bb.fetch.Fetch(d.getVar('SRC_URI').split(), d)
     urldata = fetcher.ud
     for u in urldata:
         if urldata[u].method.supports_srcrev():
@@ -806,7 +806,7 @@ def _get_srcrev_values(d):
 do_fetch[postfuncs] += "write_srcrev"
 do_fetch[vardepsexclude] += "write_srcrev"
 python write_srcrev() {
-    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
+    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
     srcrevfile = os.path.join(pkghistdir, 'latest_srcrev')
 
     srcrevs, tag_srcrevs = _get_srcrev_values(d)
@@ -838,7 +838,7 @@ python write_srcrev() {
                 for name, srcrev in tag_srcrevs.items():
                     f.write('# tag_%s = "%s"\n' % (name, srcrev))
                     if name in old_tag_srcrevs and old_tag_srcrevs[name] != srcrev:
-                        pkg = d.getVar('PN', True)
+                        pkg = d.getVar('PN')
                         bb.warn("Revision for tag %s in package %s was changed since last build (from %s to %s)" % (name, pkg, old_tag_srcrevs[name], srcrev))
 
     else:
diff --git a/meta/classes/buildstats-summary.bbclass b/meta/classes/buildstats-summary.bbclass
index b86abcc..f9b241b 100644
--- a/meta/classes/buildstats-summary.bbclass
+++ b/meta/classes/buildstats-summary.bbclass
@@ -7,7 +7,7 @@ python buildstats_summary () {
     if not os.path.exists(bsdir):
         return
 
-    sstatetasks = (e.data.getVar('SSTATETASKS', True) or '').split()
+    sstatetasks = (e.data.getVar('SSTATETASKS') or '').split()
     built = collections.defaultdict(lambda: [set(), set()])
     for pf in os.listdir(bsdir):
         taskdir = os.path.join(bsdir, pf)
diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 57ecc8f..0174ae0 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -75,8 +75,8 @@ def get_buildtimedata(var, d):
     return timediff, cpuperc
 
 def write_task_data(status, logfile, e, d):
-    bn = d.getVar('BUILDNAME', True)
-    bsdir = os.path.join(d.getVar('BUILDSTATS_BASE', True), bn)
+    bn = d.getVar('BUILDNAME')
+    bsdir = os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
     with open(os.path.join(logfile), "a") as f:
         elapsedtime = get_timedata("__timedata_task", d, e.time)
         if elapsedtime:
@@ -106,9 +106,9 @@ python run_buildstats () {
     import bb.event
     import time, subprocess, platform
 
-    bn = d.getVar('BUILDNAME', True)
-    bsdir = os.path.join(d.getVar('BUILDSTATS_BASE', True), bn)
-    taskdir = os.path.join(bsdir, d.getVar('PF', True))
+    bn = d.getVar('BUILDNAME')
+    bsdir = os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
+    taskdir = os.path.join(bsdir, d.getVar('PF'))
 
     if isinstance(e, bb.event.BuildStarted):
         ########################################################################
@@ -162,7 +162,7 @@ python run_buildstats () {
         if e.task == "do_rootfs":
             bs = os.path.join(bsdir, "build_stats")
             with open(bs, "a") as f:
-                rootfs = d.getVar('IMAGE_ROOTFS', True)
+                rootfs = d.getVar('IMAGE_ROOTFS')
                 if os.path.isdir(rootfs):
                     try:
                         rootfs_size = subprocess.check_output(["du", "-sh", rootfs],
diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 2e9837c..93fcaca 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -1,4 +1,4 @@
-CCACHE = "${@bb.utils.which(d.getVar('PATH', True), 'ccache') and 'ccache '}"
+CCACHE = "${@bb.utils.which(d.getVar('PATH'), 'ccache') and 'ccache '}"
 export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
 CCACHE_DISABLE[unexport] = "1"
 
diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index f183b4a..ad3c397 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -44,7 +44,7 @@ def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d):
         p = sub.Popen([cmd, '-r', args, fpath],stdout=sub.PIPE,stderr=sub.PIPE)
         out, err = p.communicate()
         if p.returncode != 0:
-            bb.fatal("%s: chrpath command failed with exit code %d:\n%s%s" % (d.getVar('PN', True), p.returncode, out, err))
+            bb.fatal("%s: chrpath command failed with exit code %d:\n%s%s" % (d.getVar('PN'), p.returncode, out, err))
 
 def process_file_darwin(cmd, fpath, rootdir, baseprefix, tmpdir, d):
     import subprocess as sub
@@ -72,7 +72,7 @@ def process_dir (rootdir, directory, d):
     cmd = d.expand('${CHRPATH_BIN}')
     tmpdir = os.path.normpath(d.getVar('TMPDIR', False))
     baseprefix = os.path.normpath(d.expand('${base_prefix}'))
-    hostos = d.getVar("HOST_OS", True)
+    hostos = d.getVar("HOST_OS")
 
     #bb.debug("Checking %s for binaries to process" % directory)
     if not os.path.exists(directory):
diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index fad0baa..9e74599 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -46,7 +46,7 @@ cmake_do_generate_toolchain_file() {
 # CMake system name must be something like "Linux".
 # This is important for cross-compiling.
 set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).*/\1/'` )
-set( CMAKE_SYSTEM_PROCESSOR ${@map_target_arch_to_uname_arch(d.getVar('TARGET_ARCH', True))} )
+set( CMAKE_SYSTEM_PROCESSOR ${@map_target_arch_to_uname_arch(d.getVar('TARGET_ARCH'))} )
 set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
 set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
 set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
@@ -112,15 +112,15 @@ cmake_do_configure() {
 	  ${OECMAKE_SITEFILE} \
 	  ${OECMAKE_SOURCEPATH} \
 	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
-	  -DCMAKE_INSTALL_BINDIR:PATH=${@os.path.relpath(d.getVar('bindir', True), d.getVar('prefix', True))} \
-	  -DCMAKE_INSTALL_SBINDIR:PATH=${@os.path.relpath(d.getVar('sbindir', True), d.getVar('prefix', True))} \
-	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=${@os.path.relpath(d.getVar('libexecdir', True), d.getVar('prefix', True))} \
+	  -DCMAKE_INSTALL_BINDIR:PATH=${@os.path.relpath(d.getVar('bindir'), d.getVar('prefix'))} \
+	  -DCMAKE_INSTALL_SBINDIR:PATH=${@os.path.relpath(d.getVar('sbindir'), d.getVar('prefix'))} \
+	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=${@os.path.relpath(d.getVar('libexecdir'), d.getVar('prefix'))} \
 	  -DCMAKE_INSTALL_SYSCONFDIR:PATH=${sysconfdir} \
-	  -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${@os.path.relpath(d.getVar('sharedstatedir', True), d.  getVar('prefix', True))} \
+	  -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${@os.path.relpath(d.getVar('sharedstatedir'), d.  getVar('prefix'))} \
 	  -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=${localstatedir} \
-	  -DCMAKE_INSTALL_LIBDIR:PATH=${@os.path.relpath(d.getVar('libdir', True), d.getVar('prefix', True))} \
-	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=${@os.path.relpath(d.getVar('includedir', True), d.getVar('prefix', True))} \
-	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=${@os.path.relpath(d.getVar('datadir', True), d.getVar('prefix', True))} \
+	  -DCMAKE_INSTALL_LIBDIR:PATH=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix'))} \
+	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=${@os.path.relpath(d.getVar('includedir'), d.getVar('prefix'))} \
+	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=${@os.path.relpath(d.getVar('datadir'), d.getVar('prefix'))} \
 	  -DCMAKE_INSTALL_SO_NO_EXE=0 \
 	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
 	  -DCMAKE_VERBOSE_MAKEFILE=1 \
diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 5834806..187d407 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -26,7 +26,7 @@ python do_menuconfig() {
     except OSError:
         mtime = 0
 
-    oe_terminal("${SHELL} -c \"make %s; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND', True),
+    oe_terminal("${SHELL} -c \"make %s; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
                 d.getVar('PN', True ) + ' Configuration', d)
 
     # FIXME this check can be removed when the minimum bitbake version has been bumped
@@ -49,7 +49,7 @@ python do_diffconfig() {
     import shutil
     import subprocess
 
-    workdir = d.getVar('WORKDIR', True)
+    workdir = d.getVar('WORKDIR')
     fragment = workdir + '/fragment.cfg'
     configorig = '.config.orig'
     config = '.config'
diff --git a/meta/classes/compress_doc.bbclass b/meta/classes/compress_doc.bbclass
index 8073c17..069db19 100644
--- a/meta/classes/compress_doc.bbclass
+++ b/meta/classes/compress_doc.bbclass
@@ -31,25 +31,25 @@ DOC_DECOMPRESS_CMD[xz] ?= "unxz -v"
 
 PACKAGE_PREPROCESS_FUNCS += "package_do_compress_doc compress_doc_updatealternatives"
 python package_do_compress_doc() {
-    compress_mode = d.getVar('DOC_COMPRESS', True)
-    compress_list = (d.getVar('DOC_COMPRESS_LIST', True) or '').split()
+    compress_mode = d.getVar('DOC_COMPRESS')
+    compress_list = (d.getVar('DOC_COMPRESS_LIST') or '').split()
     if compress_mode not in compress_list:
         bb.fatal('Compression policy %s not supported (not listed in %s)\n' % (compress_mode, compress_list))
 
-    dvar = d.getVar('PKGD', True)
+    dvar = d.getVar('PKGD')
     compress_cmds = {}
     decompress_cmds = {}
     for mode in compress_list:
         compress_cmds[mode] = d.getVarFlag('DOC_COMPRESS_CMD', mode, True)
         decompress_cmds[mode] = d.getVarFlag('DOC_DECOMPRESS_CMD', mode, True)
 
-    mandir = os.path.abspath(dvar + os.sep + d.getVar("mandir", True))
+    mandir = os.path.abspath(dvar + os.sep + d.getVar("mandir"))
     if os.path.exists(mandir):
         # Decompress doc files which format is not compress_mode
         decompress_doc(mandir, compress_mode, decompress_cmds)
         compress_doc(mandir, compress_mode, compress_cmds)
 
-    infodir = os.path.abspath(dvar + os.sep + d.getVar("infodir", True))
+    infodir = os.path.abspath(dvar + os.sep + d.getVar("infodir"))
     if os.path.exists(infodir):
         # Decompress doc files which format is not compress_mode
         decompress_doc(infodir, compress_mode, decompress_cmds)
@@ -218,18 +218,18 @@ python compress_doc_updatealternatives () {
     if not bb.data.inherits_class('update-alternatives', d):
         return
 
-    mandir = d.getVar("mandir", True)
-    infodir = d.getVar("infodir", True)
-    compress_mode = d.getVar('DOC_COMPRESS', True)
-    for pkg in (d.getVar('PACKAGES', True) or "").split():
-        old_names = (d.getVar('ALTERNATIVE_%s' % pkg, True) or "").split()
+    mandir = d.getVar("mandir")
+    infodir = d.getVar("infodir")
+    compress_mode = d.getVar('DOC_COMPRESS')
+    for pkg in (d.getVar('PACKAGES') or "").split():
+        old_names = (d.getVar('ALTERNATIVE_%s' % pkg) or "").split()
         new_names = []
         for old_name in old_names:
             old_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', old_name, True)
             old_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, old_name, True) or \
                 d.getVarFlag('ALTERNATIVE_TARGET', old_name, True) or \
-                d.getVar('ALTERNATIVE_TARGET_%s' % pkg, True) or \
-                d.getVar('ALTERNATIVE_TARGET', True) or \
+                d.getVar('ALTERNATIVE_TARGET_%s' % pkg) or \
+                d.getVar('ALTERNATIVE_TARGET') or \
                 old_link
             # Sometimes old_target is specified as relative to the link name.
             old_target   = os.path.join(os.path.dirname(old_link), old_target)
@@ -247,7 +247,7 @@ python compress_doc_updatealternatives () {
                 elif d.getVarFlag('ALTERNATIVE_TARGET', old_name, True):
                     d.delVarFlag('ALTERNATIVE_TARGET', old_name)
                     d.setVarFlag('ALTERNATIVE_TARGET', new_name, new_target)
-                elif d.getVar('ALTERNATIVE_TARGET_%s' % pkg, True):
+                elif d.getVar('ALTERNATIVE_TARGET_%s' % pkg):
                     d.setVar('ALTERNATIVE_TARGET_%s' % pkg, new_target)
                 elif d.getVar('ALTERNATIVE_TARGET', old_name, True):
                     d.setVar('ALTERNATIVE_TARGET', new_target)
diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index 907c183..eabf12c 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -13,7 +13,7 @@ python do_prepare_copyleft_sources () {
     import os.path
     import shutil
 
-    p = d.getVar('P', True)
+    p = d.getVar('P')
     included, reason = copyleft_should_include(d)
     if not included:
         bb.debug(1, 'copyleft: %s is excluded: %s' % (p, reason))
@@ -21,13 +21,13 @@ python do_prepare_copyleft_sources () {
     else:
         bb.debug(1, 'copyleft: %s is included: %s' % (p, reason))
 
-    sources_dir = d.getVar('COPYLEFT_SOURCES_DIR', True)
-    dl_dir = d.getVar('DL_DIR', True)
-    src_uri = d.getVar('SRC_URI', True).split()
+    sources_dir = d.getVar('COPYLEFT_SOURCES_DIR')
+    dl_dir = d.getVar('DL_DIR')
+    src_uri = d.getVar('SRC_URI').split()
     fetch = bb.fetch2.Fetch(src_uri, d)
     ud = fetch.ud
 
-    pf = d.getVar('PF', True)
+    pf = d.getVar('PF')
     dest = os.path.join(sources_dir, pf)
     shutil.rmtree(dest, ignore_errors=True)
     bb.utils.mkdirhier(dest)
diff --git a/meta/classes/copyleft_filter.bbclass b/meta/classes/copyleft_filter.bbclass
index 46be7f7..426956f 100644
--- a/meta/classes/copyleft_filter.bbclass
+++ b/meta/classes/copyleft_filter.bbclass
@@ -49,7 +49,7 @@ def copyleft_should_include(d):
 
     included, motive = False, 'recipe did not match anything'
 
-    recipe_type = d.getVar('COPYLEFT_RECIPE_TYPE', True)
+    recipe_type = d.getVar('COPYLEFT_RECIPE_TYPE')
     if recipe_type not in oe.data.typed_value('COPYLEFT_RECIPE_TYPES', d):
         include, motive = False, 'recipe type "%s" is excluded' % recipe_type
 
@@ -57,9 +57,9 @@ def copyleft_should_include(d):
     exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
 
     try:
-        is_included, reason = oe.license.is_included(d.getVar('LICENSE', True), include, exclude)
+        is_included, reason = oe.license.is_included(d.getVar('LICENSE'), include, exclude)
     except oe.license.LicenseError as exc:
-        bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
+        bb.fatal('%s: %s' % (d.getVar('PF'), exc))
     else:
         if is_included:
             if reason:
@@ -69,10 +69,10 @@ def copyleft_should_include(d):
         else:
             included, motive = False, 'recipe has excluded licenses: %s' % ', '.join(reason)
 
-    if any(fnmatch(d.getVar('PN', True), name) \
+    if any(fnmatch(d.getVar('PN'), name) \
             for name in oe.data.typed_value('COPYLEFT_PN_INCLUDE', d)):
         included, motive =  True, 'recipe included by name'
-    if any(fnmatch(d.getVar('PN', True), name) \
+    if any(fnmatch(d.getVar('PN'), name) \
             for name in oe.data.typed_value('COPYLEFT_PN_EXCLUDE', d)):
         included, motive = False, 'recipe excluded by name'
 
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 21921b3..64db113 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -20,25 +20,25 @@ CANADIANEXTRAOS = "${BASECANADIANEXTRAOS}"
 CANADIANEXTRAVENDOR = ""
 MODIFYTOS ??= "1"
 python () {
-    archs = d.getVar('PACKAGE_ARCHS', True).split()
+    archs = d.getVar('PACKAGE_ARCHS').split()
     sdkarchs = []
     for arch in archs:
         sdkarchs.append(arch + '-${SDKPKGSUFFIX}')
     d.setVar('PACKAGE_ARCHS', " ".join(sdkarchs))
 
     # Allow the following code segment to be disabled, e.g. meta-environment
-    if d.getVar("MODIFYTOS", True) != "1":
+    if d.getVar("MODIFYTOS") != "1":
         return
 
-    if d.getVar("TCLIBC", True) == "baremetal":
+    if d.getVar("TCLIBC") == "baremetal":
         return
 
-    tos = d.getVar("TARGET_OS", True)
+    tos = d.getVar("TARGET_OS")
     whitelist = []
     extralibcs = [""]
-    if "uclibc" in d.getVar("BASECANADIANEXTRAOS", True):
+    if "uclibc" in d.getVar("BASECANADIANEXTRAOS"):
         extralibcs.append("uclibc")
-    if "musl" in d.getVar("BASECANADIANEXTRAOS", True):
+    if "musl" in d.getVar("BASECANADIANEXTRAOS"):
         extralibcs.append("musl")
     for variant in ["", "spe", "x32", "eabi", "n32"]:
         for libc in extralibcs:
@@ -51,33 +51,33 @@ python () {
                 entry = entry + "-" + libc
             whitelist.append(entry)
     if tos not in whitelist:
-        bb.fatal("Building cross-candian for an unknown TARGET_SYS (%s), please update cross-canadian.bbclass" % d.getVar("TARGET_SYS", True))
+        bb.fatal("Building cross-candian for an unknown TARGET_SYS (%s), please update cross-canadian.bbclass" % d.getVar("TARGET_SYS"))
 
     for n in ["PROVIDES", "DEPENDS"]:
-        d.setVar(n, d.getVar(n, True))
-    d.setVar("STAGING_BINDIR_TOOLCHAIN", d.getVar("STAGING_BINDIR_TOOLCHAIN", True))
+        d.setVar(n, d.getVar(n))
+    d.setVar("STAGING_BINDIR_TOOLCHAIN", d.getVar("STAGING_BINDIR_TOOLCHAIN"))
     for prefix in ["AR", "AS", "DLLTOOL", "CC", "CXX", "GCC", "LD", "LIPO", "NM", "OBJDUMP", "RANLIB", "STRIP", "WINDRES"]:
         n = prefix + "_FOR_TARGET"
-        d.setVar(n, d.getVar(n, True))
+        d.setVar(n, d.getVar(n))
     # This is a bit ugly. We need to zero LIBC/ABI extension which will change TARGET_OS
     # however we need the old value in some variables. We expand those here first.
-    tarch = d.getVar("TARGET_ARCH", True)
+    tarch = d.getVar("TARGET_ARCH")
     if tarch == "x86_64":
         d.setVar("LIBCEXTENSION", "")
         d.setVar("ABIEXTENSION", "")
         d.appendVar("CANADIANEXTRAOS", " linux-gnux32")
-        for extraos in d.getVar("BASECANADIANEXTRAOS", True).split():
+        for extraos in d.getVar("BASECANADIANEXTRAOS").split():
             d.appendVar("CANADIANEXTRAOS", " " + extraos + "x32")
     elif tarch == "powerpc":
         # PowerPC can build "linux" and "linux-gnuspe"
         d.setVar("LIBCEXTENSION", "")
         d.setVar("ABIEXTENSION", "")
         d.appendVar("CANADIANEXTRAOS", " linux-gnuspe")
-        for extraos in d.getVar("BASECANADIANEXTRAOS", True).split():
+        for extraos in d.getVar("BASECANADIANEXTRAOS").split():
             d.appendVar("CANADIANEXTRAOS", " " + extraos + "spe")
     elif tarch == "mips64":
         d.appendVar("CANADIANEXTRAOS", " linux-gnun32")
-        for extraos in d.getVar("BASECANADIANEXTRAOS", True).split():
+        for extraos in d.getVar("BASECANADIANEXTRAOS").split():
             d.appendVar("CANADIANEXTRAOS", " " + extraos + "n32")
     if tarch == "arm" or tarch == "armeb":
         d.appendVar("CANADIANEXTRAOS", " linux-gnueabi linux-musleabi linux-uclibceabi")
@@ -86,10 +86,10 @@ python () {
         d.setVar("TARGET_OS", "linux")
 
     # Also need to handle multilib target vendors
-    vendors = d.getVar("CANADIANEXTRAVENDOR", True)
+    vendors = d.getVar("CANADIANEXTRAVENDOR")
     if not vendors:
         vendors = all_multilib_tune_values(d, 'TARGET_VENDOR')
-    origvendor = d.getVar("TARGET_VENDOR_MULTILIB_ORIGINAL", True)
+    origvendor = d.getVar("TARGET_VENDOR_MULTILIB_ORIGINAL")
     if origvendor:
         d.setVar("TARGET_VENDOR", origvendor)
         if origvendor not in vendors.split():
@@ -116,7 +116,7 @@ HOST_LD_ARCH = "${SDK_LD_ARCH}"
 HOST_AS_ARCH = "${SDK_AS_ARCH}"
 
 #assign DPKG_ARCH
-DPKG_ARCH = "${@debian_arch_map(d.getVar('SDK_ARCH', True), '')}"
+DPKG_ARCH = "${@debian_arch_map(d.getVar('SDK_ARCH'), '')}"
 
 CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
 CFLAGS = "${BUILDSDK_CFLAGS}"
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 7315c38..eaf2beb 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -5,7 +5,7 @@ MACHINEOVERRIDES = ""
 PACKAGE_ARCH = "${SDK_ARCH}"
 python () {
 	# set TUNE_PKGARCH to SDK_ARCH
-	d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH', True))
+	d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH'))
 }
 
 STAGING_DIR_TARGET = "${STAGING_DIR}/${SDK_ARCH}-${SDKPKGSUFFIX}${SDK_VENDOR}-${SDK_OS}"
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index b0febfb..30f90cc 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -47,7 +47,7 @@ python do_cve_check () {
     Check recipe for patched and unpatched CVEs
     """
 
-    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE", True)):
+    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
         patched_cves = get_patches_cves(d)
         patched, unpatched = check_cves(d, patched_cves)
         if patched or unpatched:
@@ -66,7 +66,7 @@ python cve_check_cleanup () {
     Delete the file used to gather all the CVE information.
     """
 
-    bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE", True))
+    bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
 }
 
 addhandler cve_check_cleanup
@@ -79,12 +79,12 @@ python cve_check_write_rootfs_manifest () {
 
     import shutil
 
-    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE", True)):
+    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
         bb.note("Writing rootfs CVE manifest")
-        deploy_dir = d.getVar("DEPLOY_DIR_IMAGE", True)
-        link_name = d.getVar("IMAGE_LINK_NAME", True)
-        manifest_name = d.getVar("CVE_CHECK_MANIFEST", True)
-        cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE", True)
+        deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
+        link_name = d.getVar("IMAGE_LINK_NAME")
+        manifest_name = d.getVar("CVE_CHECK_MANIFEST")
+        cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
 
         shutil.copyfile(cve_tmp_file, manifest_name)
 
@@ -97,7 +97,7 @@ python cve_check_write_rootfs_manifest () {
             bb.plain("Image CVE report stored in: %s" % manifest_name)
 }
 
-ROOTFS_POSTPROCESS_COMMAND_prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST', True) == '1' else ''}"
+ROOTFS_POSTPROCESS_COMMAND_prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 
 def get_patches_cves(d):
     """
@@ -106,7 +106,7 @@ def get_patches_cves(d):
 
     import re
 
-    pn = d.getVar("PN", True)
+    pn = d.getVar("PN")
     cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
     patched_cves = set()
     bb.debug(2, "Looking for patches that solves CVEs for %s" % pn)
@@ -144,16 +144,16 @@ def check_cves(d, patched_cves):
 
     cves_patched = []
     cves_unpatched = []
-    bpn = d.getVar("BPN", True)
-    pv = d.getVar("PV", True).split("git+")[0]
+    bpn = d.getVar("BPN")
+    pv = d.getVar("PV").split("git+")[0]
     cves = " ".join(patched_cves)
-    cve_db_dir = d.getVar("CVE_CHECK_DB_DIR", True)
-    cve_whitelist = ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST", True))
+    cve_db_dir = d.getVar("CVE_CHECK_DB_DIR")
+    cve_whitelist = ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST"))
     cve_cmd = "cve-check-tool"
     cmd = [cve_cmd, "--no-html", "--csv", "--not-affected", "-t", "faux", "-d", cve_db_dir]
 
     # If the recipe has been whitlisted we return empty lists
-    if d.getVar("PN", True) in d.getVar("CVE_CHECK_PN_WHITELIST", True).split():
+    if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
         bb.note("Recipe has been whitelisted, skipping check")
         return ([], [])
 
@@ -206,7 +206,7 @@ def get_cve_info(d, cves):
         from pysqlite2 import dbapi2 as sqlite3
 
     cve_data = {}
-    db_file = d.getVar("CVE_CHECK_DB_FILE", True)
+    db_file = d.getVar("CVE_CHECK_DB_FILE")
     placeholder = ",".join("?" * len(cves))
     query = "SELECT * FROM NVD WHERE id IN (%s)" % placeholder
     conn = sqlite3.connect(db_file)
@@ -227,15 +227,15 @@ def cve_write_data(d, patched, unpatched, cve_data):
     CVE manifest if enabled.
     """
 
-    cve_file = d.getVar("CVE_CHECK_LOCAL_FILE", True)
+    cve_file = d.getVar("CVE_CHECK_LOCAL_FILE")
     nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
     write_string = ""
     first_alert = True
-    bb.utils.mkdirhier(d.getVar("CVE_CHECK_LOCAL_DIR", True))
+    bb.utils.mkdirhier(d.getVar("CVE_CHECK_LOCAL_DIR"))
 
     for cve in sorted(cve_data):
-        write_string += "PACKAGE NAME: %s\n" % d.getVar("PN", True)
-        write_string += "PACKAGE VERSION: %s\n" % d.getVar("PV", True)
+        write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
+        write_string += "PACKAGE VERSION: %s\n" % d.getVar("PV")
         write_string += "CVE: %s\n" % cve
         if cve in patched:
             write_string += "CVE STATUS: Patched\n"
@@ -253,13 +253,13 @@ def cve_write_data(d, patched, unpatched, cve_data):
         bb.note("Writing file %s with CVE information" % cve_file)
         f.write(write_string)
 
-    if d.getVar("CVE_CHECK_COPY_FILES", True) == "1":
-        cve_dir = d.getVar("CVE_CHECK_DIR", True)
+    if d.getVar("CVE_CHECK_COPY_FILES") == "1":
+        cve_dir = d.getVar("CVE_CHECK_DIR")
         bb.utils.mkdirhier(cve_dir)
-        deploy_file = os.path.join(cve_dir, d.getVar("PN", True))
+        deploy_file = os.path.join(cve_dir, d.getVar("PN"))
         with open(deploy_file, "w") as f:
             f.write(write_string)
 
-    if d.getVar("CVE_CHECK_CREATE_MANIFEST", True) == "1":
-        with open(d.getVar("CVE_CHECK_TMP_FILE", True), "a") as f:
+    if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
+        with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
             f.write("%s" % write_string)
diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index be7cacc..8124558 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -20,17 +20,17 @@ do_package_write_tar[rdeptask] = "${DEBIANRDEP}"
 do_package_write_rpm[rdeptask] = "${DEBIANRDEP}"
 
 python () {
-    if not d.getVar("PACKAGES", True):
+    if not d.getVar("PACKAGES"):
         d.setVar("DEBIANRDEP", "")
 }
 
 python debian_package_name_hook () {
     import glob, copy, stat, errno, re
 
-    pkgdest = d.getVar('PKGDEST', True)
-    packages = d.getVar('PACKAGES', True)
-    bin_re = re.compile(".*/s?" + os.path.basename(d.getVar("bindir", True)) + "$")
-    lib_re = re.compile(".*/" + os.path.basename(d.getVar("libdir", True)) + "$")
+    pkgdest = d.getVar('PKGDEST')
+    packages = d.getVar('PACKAGES')
+    bin_re = re.compile(".*/s?" + os.path.basename(d.getVar("bindir")) + "$")
+    lib_re = re.compile(".*/" + os.path.basename(d.getVar("libdir")) + "$")
     so_re = re.compile("lib.*\.so")
 
     def socrunch(s):
@@ -53,11 +53,11 @@ python debian_package_name_hook () {
         return (s[stat.ST_MODE] & stat.S_IEXEC)
 
     def add_rprovides(pkg, d):
-        newpkg = d.getVar('PKG_' + pkg, True)
+        newpkg = d.getVar('PKG_' + pkg)
         if newpkg and newpkg != pkg:
-            provs = (d.getVar('RPROVIDES_' + pkg, True) or "").split()
+            provs = (d.getVar('RPROVIDES_' + pkg) or "").split()
             if pkg not in provs:
-                d.appendVar('RPROVIDES_' + pkg, " " + pkg + " (=" + d.getVar("PKGV", True) + ")")
+                d.appendVar('RPROVIDES_' + pkg, " " + pkg + " (=" + d.getVar("PKGV") + ")")
 
     def auto_libname(packages, orig_pkg):
         sonames = []
@@ -70,7 +70,7 @@ python debian_package_name_hook () {
             if lib_re.match(root):
                 has_libs = 1
                 if so_re.match(os.path.basename(file)):
-                    cmd = (d.getVar('TARGET_PREFIX', True) or "") + "objdump -p " + file + " 2>/dev/null"
+                    cmd = (d.getVar('TARGET_PREFIX') or "") + "objdump -p " + file + " 2>/dev/null"
                     fd = os.popen(cmd)
                     lines = fd.readlines()
                     fd.close()
@@ -84,7 +84,7 @@ python debian_package_name_hook () {
         if len(sonames) == 1:
             soname = sonames[0]
         elif len(sonames) > 1:
-            lead = d.getVar('LEAD_SONAME', True)
+            lead = d.getVar('LEAD_SONAME')
             if lead:
                 r = re.compile(lead)
                 filtered = []
@@ -115,7 +115,7 @@ python debian_package_name_hook () {
                         newpkg = pkgname
                     else:
                         newpkg = pkg.replace(orig_pkg, devname, 1)
-                    mlpre=d.getVar('MLPREFIX', True)
+                    mlpre=d.getVar('MLPREFIX')
                     if mlpre:
                         if not newpkg.find(mlpre) == 0:
                             newpkg = mlpre + newpkg
@@ -131,7 +131,7 @@ python debian_package_name_hook () {
     # and later
     # DEBUG: LIBNAMES: pkgname libtic5 devname libtic pkg ncurses-libticw orig_pkg ncurses-libtic debian_pn None newpkg libticw
     # so we need to handle ncurses-libticw->libticw5 before ncurses-libtic->libtic5
-    for pkg in sorted((d.getVar('AUTO_LIBNAME_PKGS', True) or "").split(), reverse=True):
+    for pkg in sorted((d.getVar('AUTO_LIBNAME_PKGS') or "").split(), reverse=True):
         auto_libname(packages, pkg)
 }
 
diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index be71aff..864ace4 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -5,14 +5,14 @@ DEVSHELL = "${SHELL}"
 python do_devshell () {
     if d.getVarFlag("do_devshell", "manualfakeroot", True):
        d.prependVar("DEVSHELL", "pseudo ")
-       fakeenv = d.getVar("FAKEROOTENV", True).split()
+       fakeenv = d.getVar("FAKEROOTENV").split()
        for f in fakeenv:
             k = f.split("=")
             d.setVar(k[0], k[1])           
             d.appendVar("OE_TERMINAL_EXPORTS", " " + k[0])
        d.delVarFlag("do_devshell", "fakeroot")
 
-    oe_terminal(d.getVar('DEVSHELL', True), 'OpenEmbedded Developer Shell', d)
+    oe_terminal(d.getVar('DEVSHELL'), 'OpenEmbedded Developer Shell', d)
 }
 
 addtask devshell after do_patch
@@ -82,7 +82,7 @@ def devpyshell(d):
         more = False
 
         i = code.InteractiveInterpreter(locals=_context)
-        print("OE PyShell (PN = %s)\n" % d.getVar("PN", True))
+        print("OE PyShell (PN = %s)\n" % d.getVar("PN"))
 
         def prompt(more):
             if more:
diff --git a/meta/classes/distro_features_check.bbclass b/meta/classes/distro_features_check.bbclass
index 7e91dbc..e74d3c0 100644
--- a/meta/classes/distro_features_check.bbclass
+++ b/meta/classes/distro_features_check.bbclass
@@ -11,15 +11,15 @@
 
 python () {
     # Assume at least one var is set.
-    distro_features = (d.getVar('DISTRO_FEATURES', True) or "").split()
+    distro_features = (d.getVar('DISTRO_FEATURES') or "").split()
 
-    any_of_distro_features = d.getVar('ANY_OF_DISTRO_FEATURES', True)
+    any_of_distro_features = d.getVar('ANY_OF_DISTRO_FEATURES')
     if any_of_distro_features:
         any_of_distro_features = any_of_distro_features.split()
         if set.isdisjoint(set(any_of_distro_features),set(distro_features)):
             raise bb.parse.SkipPackage("one of '%s' needs to be in DISTRO_FEATURES" % any_of_distro_features)
 
-    required_distro_features = d.getVar('REQUIRED_DISTRO_FEATURES', True)
+    required_distro_features = d.getVar('REQUIRED_DISTRO_FEATURES')
     if required_distro_features:
         required_distro_features = required_distro_features.split()
         for f in required_distro_features:
@@ -28,7 +28,7 @@ python () {
             else:
                 raise bb.parse.SkipPackage("missing required distro feature '%s' (not in DISTRO_FEATURES)" % f)
 
-    conflict_distro_features = d.getVar('CONFLICT_DISTRO_FEATURES', True)
+    conflict_distro_features = d.getVar('CONFLICT_DISTRO_FEATURES')
     if conflict_distro_features:
         conflict_distro_features = conflict_distro_features.split()
         for f in conflict_distro_features:
diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index fbb7402..5b3a3e0 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -25,75 +25,75 @@ addtask distrodata_np
 do_distrodata_np[nostamp] = "1"
 python do_distrodata_np() {
         localdata = bb.data.createCopy(d)
-        pn = d.getVar("PN", True)
+        pn = d.getVar("PN")
         bb.note("Package Name: %s" % pn)
 
         import oe.distro_check as dist_check
-        tmpdir = d.getVar('TMPDIR', True)
+        tmpdir = d.getVar('TMPDIR')
         distro_check_dir = os.path.join(tmpdir, "distro_check")
-        datetime = localdata.getVar('DATETIME', True)
+        datetime = localdata.getVar('DATETIME')
         dist_check.update_distro_data(distro_check_dir, datetime, localdata)
 
         if pn.find("-native") != -1:
             pnstripped = pn.split("-native")
             bb.note("Native Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
             bb.data.update_data(localdata)
 
         if pn.find("-cross") != -1:
             pnstripped = pn.split("-cross")
             bb.note("cross Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
             bb.data.update_data(localdata)
 
         if pn.find("-crosssdk") != -1:
             pnstripped = pn.split("-crosssdk")
             bb.note("cross Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
             bb.data.update_data(localdata)
 
         if pn.startswith("nativesdk-"):
             pnstripped = pn.replace("nativesdk-", "")
             bb.note("NativeSDK Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES'))
             bb.data.update_data(localdata)
 
 
         if pn.find("-initial") != -1:
             pnstripped = pn.split("-initial")
             bb.note("initial Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
             bb.data.update_data(localdata)
 
         """generate package information from .bb file"""
-        pname = localdata.getVar('PN', True)
-        pcurver = localdata.getVar('PV', True)
-        pdesc = localdata.getVar('DESCRIPTION', True)
+        pname = localdata.getVar('PN')
+        pcurver = localdata.getVar('PV')
+        pdesc = localdata.getVar('DESCRIPTION')
         if pdesc is not None:
                 pdesc = pdesc.replace(',','')
                 pdesc = pdesc.replace('\n','')
 
-        pgrp = localdata.getVar('SECTION', True)
-        plicense = localdata.getVar('LICENSE', True).replace(',','_')
+        pgrp = localdata.getVar('SECTION')
+        plicense = localdata.getVar('LICENSE').replace(',','_')
 
-        rstatus = localdata.getVar('RECIPE_COLOR', True)
+        rstatus = localdata.getVar('RECIPE_COLOR')
         if rstatus is not None:
                 rstatus = rstatus.replace(',','')
 
-        pupver = localdata.getVar('RECIPE_UPSTREAM_VERSION', True)
+        pupver = localdata.getVar('RECIPE_UPSTREAM_VERSION')
         if pcurver == pupver:
                 vermatch="1"
         else:
                 vermatch="0"
-        noupdate_reason = localdata.getVar('RECIPE_NO_UPDATE_REASON', True)
+        noupdate_reason = localdata.getVar('RECIPE_NO_UPDATE_REASON')
         if noupdate_reason is None:
                 noupdate="0"
         else:
                 noupdate="1"
                 noupdate_reason = noupdate_reason.replace(',','')
 
-        maintainer = localdata.getVar('RECIPE_MAINTAINER', True)
-        rlrd = localdata.getVar('RECIPE_UPSTREAM_DATE', True)
+        maintainer = localdata.getVar('RECIPE_MAINTAINER')
+        rlrd = localdata.getVar('RECIPE_UPSTREAM_DATE')
         result = dist_check.compare_in_distro_packages_list(distro_check_dir, localdata)
 
         bb.note("DISTRO: %s,%s,%s,%s,%s,%s,%s,%s,%s\n" % \
@@ -109,80 +109,80 @@ addtask distrodata
 do_distrodata[nostamp] = "1"
 python do_distrodata() {
         import csv
-        logpath = d.getVar('LOG_DIR', True)
+        logpath = d.getVar('LOG_DIR')
         bb.utils.mkdirhier(logpath)
         logfile = os.path.join(logpath, "distrodata.csv")
 
         import oe.distro_check as dist_check
         localdata = bb.data.createCopy(d)
-        tmpdir = d.getVar('TMPDIR', True)
+        tmpdir = d.getVar('TMPDIR')
         distro_check_dir = os.path.join(tmpdir, "distro_check")
-        datetime = localdata.getVar('DATETIME', True)
+        datetime = localdata.getVar('DATETIME')
         dist_check.update_distro_data(distro_check_dir, datetime, localdata)
 
-        pn = d.getVar("PN", True)
+        pn = d.getVar("PN")
         bb.note("Package Name: %s" % pn)
 
         if pn.find("-native") != -1:
             pnstripped = pn.split("-native")
             bb.note("Native Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
             bb.data.update_data(localdata)
 
         if pn.startswith("nativesdk-"):
             pnstripped = pn.replace("nativesdk-", "")
             bb.note("NativeSDK Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES'))
             bb.data.update_data(localdata)
 
         if pn.find("-cross") != -1:
             pnstripped = pn.split("-cross")
             bb.note("cross Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
             bb.data.update_data(localdata)
 
         if pn.find("-crosssdk") != -1:
             pnstripped = pn.split("-crosssdk")
             bb.note("cross Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
             bb.data.update_data(localdata)
 
         if pn.find("-initial") != -1:
             pnstripped = pn.split("-initial")
             bb.note("initial Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
             bb.data.update_data(localdata)
 
         """generate package information from .bb file"""
-        pname = localdata.getVar('PN', True)
-        pcurver = localdata.getVar('PV', True)
-        pdesc = localdata.getVar('DESCRIPTION', True)
+        pname = localdata.getVar('PN')
+        pcurver = localdata.getVar('PV')
+        pdesc = localdata.getVar('DESCRIPTION')
         if pdesc is not None:
                 pdesc = pdesc.replace(',','')
                 pdesc = pdesc.replace('\n','')
 
-        pgrp = localdata.getVar('SECTION', True)
-        plicense = localdata.getVar('LICENSE', True).replace(',','_')
+        pgrp = localdata.getVar('SECTION')
+        plicense = localdata.getVar('LICENSE').replace(',','_')
 
-        rstatus = localdata.getVar('RECIPE_COLOR', True)
+        rstatus = localdata.getVar('RECIPE_COLOR')
         if rstatus is not None:
                 rstatus = rstatus.replace(',','')
 
-        pupver = localdata.getVar('RECIPE_UPSTREAM_VERSION', True)
+        pupver = localdata.getVar('RECIPE_UPSTREAM_VERSION')
         if pcurver == pupver:
                 vermatch="1"
         else:
                 vermatch="0"
 
-        noupdate_reason = localdata.getVar('RECIPE_NO_UPDATE_REASON', True)
+        noupdate_reason = localdata.getVar('RECIPE_NO_UPDATE_REASON')
         if noupdate_reason is None:
                 noupdate="0"
         else:
                 noupdate="1"
                 noupdate_reason = noupdate_reason.replace(',','')
 
-        maintainer = localdata.getVar('RECIPE_MAINTAINER', True)
-        rlrd = localdata.getVar('RECIPE_UPSTREAM_DATE', True)
+        maintainer = localdata.getVar('RECIPE_MAINTAINER')
+        rlrd = localdata.getVar('RECIPE_UPSTREAM_DATE')
         # do the comparison
         result = dist_check.compare_in_distro_packages_list(distro_check_dir, localdata)
 
@@ -272,60 +272,60 @@ python do_checkpkg() {
         from bb.fetch2 import FetchError, NoMethodError, decodeurl
 
         """first check whether a uri is provided"""
-        src_uri = (d.getVar('SRC_URI', True) or '').split()
+        src_uri = (d.getVar('SRC_URI') or '').split()
         if src_uri:
             uri_type, _, _, _, _, _ = decodeurl(src_uri[0])
         else:
             uri_type = "none"
 
         """initialize log files."""
-        logpath = d.getVar('LOG_DIR', True)
+        logpath = d.getVar('LOG_DIR')
         bb.utils.mkdirhier(logpath)
         logfile = os.path.join(logpath, "checkpkg.csv")
 
         """generate package information from .bb file"""
-        pname = d.getVar('PN', True)
+        pname = d.getVar('PN')
 
         if pname.find("-native") != -1:
-            if d.getVar('BBCLASSEXTEND', True):
+            if d.getVar('BBCLASSEXTEND'):
                     return
             pnstripped = pname.split("-native")
             bb.note("Native Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
             bb.data.update_data(localdata)
 
         if pname.startswith("nativesdk-"):
-            if d.getVar('BBCLASSEXTEND', True):
+            if d.getVar('BBCLASSEXTEND'):
                     return
             pnstripped = pname.replace("nativesdk-", "")
             bb.note("NativeSDK Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES'))
             bb.data.update_data(localdata)
 
         if pname.find("-cross") != -1:
             pnstripped = pname.split("-cross")
             bb.note("cross Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
             bb.data.update_data(localdata)
 
         if pname.find("-initial") != -1:
             pnstripped = pname.split("-initial")
             bb.note("initial Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
             bb.data.update_data(localdata)
 
-        pdesc = localdata.getVar('DESCRIPTION', True)
-        pgrp = localdata.getVar('SECTION', True)
-        pversion = localdata.getVar('PV', True)
-        plicense = localdata.getVar('LICENSE', True)
-        psection = localdata.getVar('SECTION', True)
-        phome = localdata.getVar('HOMEPAGE', True)
-        prelease = localdata.getVar('PR', True)
-        pdepends = localdata.getVar('DEPENDS', True)
-        pbugtracker = localdata.getVar('BUGTRACKER', True)
-        ppe = localdata.getVar('PE', True)
-        psrcuri = localdata.getVar('SRC_URI', True)
-        maintainer = localdata.getVar('RECIPE_MAINTAINER', True)
+        pdesc = localdata.getVar('DESCRIPTION')
+        pgrp = localdata.getVar('SECTION')
+        pversion = localdata.getVar('PV')
+        plicense = localdata.getVar('LICENSE')
+        psection = localdata.getVar('SECTION')
+        phome = localdata.getVar('HOMEPAGE')
+        prelease = localdata.getVar('PR')
+        pdepends = localdata.getVar('DEPENDS')
+        pbugtracker = localdata.getVar('BUGTRACKER')
+        ppe = localdata.getVar('PE')
+        psrcuri = localdata.getVar('SRC_URI')
+        maintainer = localdata.getVar('RECIPE_MAINTAINER')
 
         """ Get upstream version version """
         pupver = ""
@@ -362,7 +362,7 @@ python do_checkpkg() {
             psrcuri = "none"
         pdepends = "".join(pdepends.split("\t"))
         pdesc = "".join(pdesc.split("\t"))
-        no_upgr_reason = d.getVar('RECIPE_NO_UPDATE_REASON', True)
+        no_upgr_reason = d.getVar('RECIPE_NO_UPDATE_REASON')
         lf = bb.utils.lockfile("%s.lock" % logfile)
         with open(logfile, "a") as f:
             writer = csv.writer(f, delimiter='\t')
@@ -401,12 +401,12 @@ python do_distro_check() {
 
     localdata = bb.data.createCopy(d)
     bb.data.update_data(localdata)
-    tmpdir = d.getVar('TMPDIR', True)
+    tmpdir = d.getVar('TMPDIR')
     distro_check_dir = os.path.join(tmpdir, "distro_check")
-    logpath = d.getVar('LOG_DIR', True)
+    logpath = d.getVar('LOG_DIR')
     bb.utils.mkdirhier(logpath)
     result_file = os.path.join(logpath, "distrocheck.csv")
-    datetime = localdata.getVar('DATETIME', True)
+    datetime = localdata.getVar('DATETIME')
     dc.update_distro_data(distro_check_dir, datetime, localdata)
 
     # do the comparison
@@ -449,12 +449,12 @@ do_checklicense[nostamp] = "1"
 python do_checklicense() {
     import csv
     import shutil
-    logpath = d.getVar('LOG_DIR', True)
+    logpath = d.getVar('LOG_DIR')
     bb.utils.mkdirhier(logpath)
-    pn = d.getVar('PN', True)
+    pn = d.getVar('PN')
     logfile = os.path.join(logpath, "missinglicense.csv")
-    generic_directory = d.getVar('COMMON_LICENSE_DIR', True)
-    license_types = d.getVar('LICENSE', True)
+    generic_directory = d.getVar('COMMON_LICENSE_DIR')
+    license_types = d.getVar('LICENSE')
     for license_type in ((license_types.replace('+', '').replace('|', '&')
                           .replace('(', '').replace(')', '').replace(';', '')
                           .replace(',', '').replace(" ", "").split("&"))):
diff --git a/meta/classes/distutils-base.bbclass b/meta/classes/distutils-base.bbclass
index aa18e8b..9f398d7 100644
--- a/meta/classes/distutils-base.bbclass
+++ b/meta/classes/distutils-base.bbclass
@@ -1,4 +1,4 @@
-DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES', True) == '')]}"
+DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES') == '')]}"
 RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
 inherit distutils-common-base pythonnative
diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3-base.bbclass
index 82ab6a3..7dbf07a 100644
--- a/meta/classes/distutils3-base.bbclass
+++ b/meta/classes/distutils3-base.bbclass
@@ -1,4 +1,4 @@
-DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES', True) == '')]}"
+DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES') == '')]}"
 RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
 inherit distutils-common-base python3native
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 31908c3..5ba6c34 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -28,34 +28,34 @@ SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
 EXTERNALSRC_SYMLINKS ?= "oe-workdir:${WORKDIR} oe-logs:${T}"
 
 python () {
-    externalsrc = d.getVar('EXTERNALSRC', True)
+    externalsrc = d.getVar('EXTERNALSRC')
 
     # If this is the base recipe and EXTERNALSRC is set for it or any of its
     # derivatives, then enable BB_DONT_CACHE to force the recipe to always be
     # re-parsed so that the file-checksums function for do_compile is run every
     # time.
-    bpn = d.getVar('BPN', True)
-    if bpn == d.getVar('PN', True):
-        classextend = (d.getVar('BBCLASSEXTEND', True) or '').split()
+    bpn = d.getVar('BPN')
+    if bpn == d.getVar('PN'):
+        classextend = (d.getVar('BBCLASSEXTEND') or '').split()
         if (externalsrc or
                 ('native' in classextend and
-                 d.getVar('EXTERNALSRC_pn-%s-native' % bpn, True)) or
+                 d.getVar('EXTERNALSRC_pn-%s-native' % bpn)) or
                 ('nativesdk' in classextend and
-                 d.getVar('EXTERNALSRC_pn-nativesdk-%s' % bpn, True)) or
+                 d.getVar('EXTERNALSRC_pn-nativesdk-%s' % bpn)) or
                 ('cross' in classextend and
-                 d.getVar('EXTERNALSRC_pn-%s-cross' % bpn, True))):
+                 d.getVar('EXTERNALSRC_pn-%s-cross' % bpn))):
             d.setVar('BB_DONT_CACHE', '1')
 
     if externalsrc:
         d.setVar('S', externalsrc)
-        externalsrcbuild = d.getVar('EXTERNALSRC_BUILD', True)
+        externalsrcbuild = d.getVar('EXTERNALSRC_BUILD')
         if externalsrcbuild:
             d.setVar('B', externalsrcbuild)
         else:
             d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
 
         local_srcuri = []
-        fetch = bb.fetch2.Fetch((d.getVar('SRC_URI', True) or '').split(), d)
+        fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
         for url in fetch.urls:
             url_data = fetch.ud[url]
             parm = url_data.parm
@@ -94,7 +94,7 @@ python () {
         # Note that we cannot use d.appendVarFlag() here because deps is expected to be a list object, not a string
         d.setVarFlag('do_configure', 'deps', (d.getVarFlag('do_configure', 'deps', False) or []) + ['do_unpack'])
 
-        for task in d.getVar("SRCTREECOVEREDTASKS", True).split():
+        for task in d.getVar("SRCTREECOVEREDTASKS").split():
             if local_srcuri and task in fetch_tasks:
                 continue
             bb.build.deltask(task, d)
@@ -106,13 +106,13 @@ python () {
         d.setVarFlag('do_configure', 'file-checksums', '${@srctree_configure_hash_files(d)}')
 
         # We don't want the workdir to go away
-        d.appendVar('RM_WORK_EXCLUDE', ' ' + d.getVar('PN', True))
+        d.appendVar('RM_WORK_EXCLUDE', ' ' + d.getVar('PN'))
 
         # If B=S the same builddir is used even for different architectures.
         # Thus, use a shared CONFIGURESTAMPFILE and STAMP directory so that
         # change of do_configure task hash is correctly detected and stamps are
         # invalidated if e.g. MACHINE changes.
-        if d.getVar('S', True) == d.getVar('B', True):
+        if d.getVar('S') == d.getVar('B'):
             configstamp = '${TMPDIR}/work-shared/${PN}/${EXTENDPE}${PV}-${PR}/configure.sstate'
             d.setVar('CONFIGURESTAMPFILE', configstamp)
             d.setVar('STAMP', '${STAMPS_DIR}/work-shared/${PN}/${EXTENDPE}${PV}-${PR}')
@@ -120,10 +120,10 @@ python () {
 
 python externalsrc_configure_prefunc() {
     # Create desired symlinks
-    symlinks = (d.getVar('EXTERNALSRC_SYMLINKS', True) or '').split()
+    symlinks = (d.getVar('EXTERNALSRC_SYMLINKS') or '').split()
     for symlink in symlinks:
         symsplit = symlink.split(':', 1)
-        lnkfile = os.path.join(d.getVar('S', True), symsplit[0])
+        lnkfile = os.path.join(d.getVar('S'), symsplit[0])
         target = d.expand(symsplit[1])
         if len(symsplit) > 1:
             if os.path.islink(lnkfile):
@@ -139,7 +139,7 @@ python externalsrc_configure_prefunc() {
 
 python externalsrc_compile_prefunc() {
     # Make it obvious that this is happening, since forgetting about it could lead to much confusion
-    bb.plain('NOTE: %s: compiling from external source tree %s' % (d.getVar('PN', True), d.getVar('EXTERNALSRC', True)))
+    bb.plain('NOTE: %s: compiling from external source tree %s' % (d.getVar('PN'), d.getVar('EXTERNALSRC')))
 }
 
 def srctree_hash_files(d):
@@ -147,7 +147,7 @@ def srctree_hash_files(d):
     import subprocess
     import tempfile
 
-    s_dir = d.getVar('EXTERNALSRC', True)
+    s_dir = d.getVar('EXTERNALSRC')
     git_dir = os.path.join(s_dir, '.git')
     oe_hash_file = os.path.join(git_dir, 'oe-devtool-tree-sha1')
 
@@ -165,7 +165,7 @@ def srctree_hash_files(d):
             fobj.write(sha1)
         ret = oe_hash_file + ':True'
     else:
-        ret = d.getVar('EXTERNALSRC', True) + '/*:True'
+        ret = d.getVar('EXTERNALSRC') + '/*:True'
     return ret
 
 def srctree_configure_hash_files(d):
@@ -173,7 +173,7 @@ def srctree_configure_hash_files(d):
     Get the list of files that should trigger do_configure to re-execute,
     based on the value of CONFIGURE_FILES
     """
-    in_files = (d.getVar('CONFIGURE_FILES', True) or '').split()
+    in_files = (d.getVar('CONFIGURE_FILES') or '').split()
     out_items = []
     search_files = []
     for entry in in_files:
@@ -182,7 +182,7 @@ def srctree_configure_hash_files(d):
         else:
             search_files.append(entry)
     if search_files:
-        s_dir = d.getVar('EXTERNALSRC', True)
+        s_dir = d.getVar('EXTERNALSRC')
         for root, _, files in os.walk(s_dir):
             for f in files:
                 if f in search_files:
diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
index 43900f3..39e5ff2 100644
--- a/meta/classes/extrausers.bbclass
+++ b/meta/classes/extrausers.bbclass
@@ -15,7 +15,7 @@
 
 inherit useradd_base
 
-IMAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS', True))]}"
+IMAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}"
 
 # Image level user / group settings
 ROOTFS_POSTPROCESS_COMMAND_append = " set_user_group;"
diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index 8ebdfc4..d047a79 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -30,26 +30,26 @@ fi
 }
 
 python () {
-    font_pkgs = d.getVar('FONT_PACKAGES', True).split()
-    deps = d.getVar("FONT_EXTRA_RDEPENDS", True)
+    font_pkgs = d.getVar('FONT_PACKAGES').split()
+    deps = d.getVar("FONT_EXTRA_RDEPENDS")
 
     for pkg in font_pkgs:
         if deps: d.appendVar('RDEPENDS_' + pkg, ' '+deps)
 }
 
 python add_fontcache_postinsts() {
-    for pkg in d.getVar('FONT_PACKAGES', True).split():
+    for pkg in d.getVar('FONT_PACKAGES').split():
         bb.note("adding fonts postinst and postrm scripts to %s" % pkg)
-        postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
+        postinst = d.getVar('pkg_postinst_%s' % pkg) or d.getVar('pkg_postinst')
         if not postinst:
             postinst = '#!/bin/sh\n'
-        postinst += d.getVar('fontcache_common', True)
+        postinst += d.getVar('fontcache_common')
         d.setVar('pkg_postinst_%s' % pkg, postinst)
 
-        postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
+        postrm = d.getVar('pkg_postrm_%s' % pkg) or d.getVar('pkg_postrm')
         if not postrm:
             postrm = '#!/bin/sh\n'
-        postrm += d.getVar('fontcache_common', True)
+        postrm += d.getVar('fontcache_common')
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
 
diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
index bd2613c..313c5a3 100644
--- a/meta/classes/fs-uuid.bbclass
+++ b/meta/classes/fs-uuid.bbclass
@@ -3,7 +3,7 @@
 # on ext file systems and depends on tune2fs.
 def get_rootfs_uuid(d):
     import subprocess
-    rootfs = d.getVar('ROOTFS', True)
+    rootfs = d.getVar('ROOTFS')
     output = subprocess.check_output(['tune2fs', '-l', rootfs])
     for line in output.split('\n'):
         if line.startswith('Filesystem UUID:'):
diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index d7afa72..d07bead 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -42,8 +42,8 @@ done
 
 python populate_packages_append () {
     import re
-    packages = d.getVar('PACKAGES', True).split()
-    pkgdest =  d.getVar('PKGDEST', True)
+    packages = d.getVar('PACKAGES').split()
+    pkgdest =  d.getVar('PKGDEST')
     
     for pkg in packages:
         schema_dir = '%s/%s/etc/gconf/schemas' % (pkgdest, pkg)
@@ -56,15 +56,15 @@ python populate_packages_append () {
         if schemas != []:
             bb.note("adding gconf postinst and prerm scripts to %s" % pkg)
             d.setVar('SCHEMA_FILES', " ".join(schemas))
-            postinst = d.getVar('pkg_postinst_%s' % pkg, True)
+            postinst = d.getVar('pkg_postinst_%s' % pkg)
             if not postinst:
                 postinst = '#!/bin/sh\n'
-            postinst += d.getVar('gconf_postinst', True)
+            postinst += d.getVar('gconf_postinst')
             d.setVar('pkg_postinst_%s' % pkg, postinst)
-            prerm = d.getVar('pkg_prerm_%s' % pkg, True)
+            prerm = d.getVar('pkg_prerm_%s' % pkg)
             if not prerm:
                 prerm = '#!/bin/sh\n'
-            prerm += d.getVar('gconf_prerm', True)
+            prerm += d.getVar('gconf_prerm')
             d.setVar('pkg_prerm_%s' % pkg, prerm)
             d.appendVar("RDEPENDS_%s" % pkg, ' ' + d.getVar('MLPREFIX', False) + 'gconf')
 }
diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index 03b89b2..0be1424 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -1,15 +1,15 @@
 def gettext_dependencies(d):
-    if d.getVar('INHIBIT_DEFAULT_DEPS', True) and not oe.utils.inherits(d, 'cross-canadian'):
+    if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d, 'cross-canadian'):
         return ""
-    if d.getVar('USE_NLS', True) == 'no':
+    if d.getVar('USE_NLS') == 'no':
         return "gettext-minimal-native"
     return d.getVar('DEPENDS_GETTEXT', False)
 
 def gettext_oeconf(d):
-    if d.getVar('USE_NLS', True) == 'no':
+    if d.getVar('USE_NLS') == 'no':
         return '--disable-nls'
     # Remove the NLS bits if USE_NLS is no or INHIBIT_DEFAULT_DEPS is set
-    if d.getVar('INHIBIT_DEFAULT_DEPS', True) and not oe.utils.inherits(d, 'cross-canadian'):
+    if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d, 'cross-canadian'):
         return '--disable-nls'
     return "--enable-nls"
 
diff --git a/meta/classes/gio-module-cache.bbclass b/meta/classes/gio-module-cache.bbclass
index 91461b1..39b7bef 100644
--- a/meta/classes/gio-module-cache.bbclass
+++ b/meta/classes/gio-module-cache.bbclass
@@ -17,21 +17,21 @@ fi
 }
 
 python populate_packages_append () {
-    packages = d.getVar('GIO_MODULE_PACKAGES', True).split()
+    packages = d.getVar('GIO_MODULE_PACKAGES').split()
 
     for pkg in packages:
         bb.note("adding gio-module-cache postinst and postrm scripts to %s" % pkg)
 
-        postinst = d.getVar('pkg_postinst_%s' % pkg, True)
+        postinst = d.getVar('pkg_postinst_%s' % pkg)
         if not postinst:
             postinst = '#!/bin/sh\n'
-        postinst += d.getVar('gio_module_cache_common', True)
+        postinst += d.getVar('gio_module_cache_common')
         d.setVar('pkg_postinst_%s' % pkg, postinst)
 
-        postrm = d.getVar('pkg_postrm_%s' % pkg, True)
+        postrm = d.getVar('pkg_postrm_%s' % pkg)
         if not postrm:
             postrm = '#!/bin/sh\n'
-        postrm += d.getVar('gio_module_cache_common', True)
+        postrm += d.getVar('gio_module_cache_common')
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
 
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 17417ba..3dc9146 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -72,14 +72,14 @@ efi_hddimg_populate() {
 python build_efi_cfg() {
     import sys
 
-    workdir = d.getVar('WORKDIR', True)
+    workdir = d.getVar('WORKDIR')
     if not workdir:
         bb.error("WORKDIR not defined, unable to package")
         return
 
-    gfxserial = d.getVar('GRUB_GFXSERIAL', True) or ""
+    gfxserial = d.getVar('GRUB_GFXSERIAL') or ""
 
-    labels = d.getVar('LABELS', True)
+    labels = d.getVar('LABELS')
     if not labels:
         bb.debug(1, "LABELS not defined, nothing to do")
         return
@@ -88,7 +88,7 @@ python build_efi_cfg() {
         bb.debug(1, "No labels, nothing to do")
         return
 
-    cfile = d.getVar('GRUB_CFG', True)
+    cfile = d.getVar('GRUB_CFG')
     if not cfile:
         bb.fatal('Unable to read GRUB_CFG')
 
@@ -99,33 +99,33 @@ python build_efi_cfg() {
 
     cfgfile.write('# Automatically created by OE\n')
 
-    opts = d.getVar('GRUB_OPTS', True)
+    opts = d.getVar('GRUB_OPTS')
     if opts:
         for opt in opts.split(';'):
             cfgfile.write('%s\n' % opt)
 
     cfgfile.write('default=%s\n' % (labels.split()[0]))
 
-    timeout = d.getVar('GRUB_TIMEOUT', True)
+    timeout = d.getVar('GRUB_TIMEOUT')
     if timeout:
         cfgfile.write('timeout=%s\n' % timeout)
     else:
         cfgfile.write('timeout=50\n')
 
-    root = d.getVar('GRUB_ROOT', True)
+    root = d.getVar('GRUB_ROOT')
     if not root:
         bb.fatal('GRUB_ROOT not defined')
 
     if gfxserial == "1":
         btypes = [ [ " graphics console", "" ],
-            [ " serial console", d.getVar('GRUB_SERIAL', True) or "" ] ]
+            [ " serial console", d.getVar('GRUB_SERIAL') or "" ] ]
     else:
         btypes = [ [ "", "" ] ]
 
     for label in labels.split():
         localdata = d.createCopy()
 
-        overrides = localdata.getVar('OVERRIDES', True)
+        overrides = localdata.getVar('OVERRIDES')
         if not overrides:
             bb.fatal('OVERRIDES not defined')
 
@@ -141,8 +141,8 @@ python build_efi_cfg() {
 
             cfgfile.write(' %s' % replace_rootfs_uuid(d, root))
 
-            append = localdata.getVar('APPEND', True)
-            initrd = localdata.getVar('INITRD', True)
+            append = localdata.getVar('APPEND')
+            initrd = localdata.getVar('INITRD')
 
             if append:
                 append = replace_rootfs_uuid(d, append)
diff --git a/meta/classes/gsettings.bbclass b/meta/classes/gsettings.bbclass
index dec5abc..e6d1c8a 100644
--- a/meta/classes/gsettings.bbclass
+++ b/meta/classes/gsettings.bbclass
@@ -18,20 +18,20 @@ gsettings_postinstrm () {
 }
 
 python populate_packages_append () {
-    pkg = d.getVar('PN', True)
+    pkg = d.getVar('PN')
     bb.note("adding gsettings postinst scripts to %s" % pkg)
 
-    postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
+    postinst = d.getVar('pkg_postinst_%s' % pkg) or d.getVar('pkg_postinst')
     if not postinst:
         postinst = '#!/bin/sh\n'
-    postinst += d.getVar('gsettings_postinstrm', True)
+    postinst += d.getVar('gsettings_postinstrm')
     d.setVar('pkg_postinst_%s' % pkg, postinst)
 
     bb.note("adding gsettings postrm scripts to %s" % pkg)
 
-    postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
+    postrm = d.getVar('pkg_postrm_%s' % pkg) or d.getVar('pkg_postrm')
     if not postrm:
         postrm = '#!/bin/sh\n'
-    postrm += d.getVar('gsettings_postinstrm', True)
+    postrm += d.getVar('gsettings_postinstrm')
     d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 0f1052b..c5d8d7c 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -35,11 +35,11 @@ fi
 }
 
 python populate_packages_append () {
-    packages = d.getVar('PACKAGES', True).split()
-    pkgdest =  d.getVar('PKGDEST', True)
+    packages = d.getVar('PACKAGES').split()
+    pkgdest =  d.getVar('PKGDEST')
     
     for pkg in packages:
-        icon_dir = '%s/%s/%s/icons' % (pkgdest, pkg, d.getVar('datadir', True))
+        icon_dir = '%s/%s/%s/icons' % (pkgdest, pkg, d.getVar('datadir'))
         if not os.path.exists(icon_dir):
             continue
 
@@ -49,16 +49,16 @@ python populate_packages_append () {
     
         bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
         
-        postinst = d.getVar('pkg_postinst_%s' % pkg, True)
+        postinst = d.getVar('pkg_postinst_%s' % pkg)
         if not postinst:
             postinst = '#!/bin/sh\n'
-        postinst += d.getVar('gtk_icon_cache_postinst', True)
+        postinst += d.getVar('gtk_icon_cache_postinst')
         d.setVar('pkg_postinst_%s' % pkg, postinst)
 
-        postrm = d.getVar('pkg_postrm_%s' % pkg, True)
+        postrm = d.getVar('pkg_postrm_%s' % pkg)
         if not postrm:
             postrm = '#!/bin/sh\n'
-        postrm += d.getVar('gtk_icon_cache_postrm', True)
+        postrm += d.getVar('gtk_icon_cache_postrm')
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
 
diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index ebbc9de..baea959 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -61,21 +61,21 @@ fi
 }
 
 python populate_packages_append () {
-    gtkimmodules_pkgs = d.getVar('GTKIMMODULES_PACKAGES', True).split()
+    gtkimmodules_pkgs = d.getVar('GTKIMMODULES_PACKAGES').split()
 
     for pkg in gtkimmodules_pkgs:
             bb.note("adding gtk-immodule-cache postinst and postrm scripts to %s" % pkg)
 
-            postinst = d.getVar('pkg_postinst_%s' % pkg, True)
+            postinst = d.getVar('pkg_postinst_%s' % pkg)
             if not postinst:
                 postinst = '#!/bin/sh\n'
-            postinst += d.getVar('gtk_immodule_cache_postinst', True)
+            postinst += d.getVar('gtk_immodule_cache_postinst')
             d.setVar('pkg_postinst_%s' % pkg, postinst)
 
-            postrm = d.getVar('pkg_postrm_%s' % pkg, True)
+            postrm = d.getVar('pkg_postrm_%s' % pkg)
             if not postrm:
                 postrm = '#!/bin/sh\n'
-            postrm += d.getVar('gtk_immodule_cache_postrm', True)
+            postrm += d.getVar('gtk_immodule_cache_postrm')
             d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
 
diff --git a/meta/classes/gummiboot.bbclass b/meta/classes/gummiboot.bbclass
index 4f2dea6..5aaf766 100644
--- a/meta/classes/gummiboot.bbclass
+++ b/meta/classes/gummiboot.bbclass
@@ -60,8 +60,8 @@ efi_hddimg_populate() {
 }
 
 python build_efi_cfg() {
-    s = d.getVar("S", True)
-    labels = d.getVar('LABELS', True)
+    s = d.getVar("S")
+    labels = d.getVar('LABELS')
     if not labels:
         bb.debug(1, "LABELS not defined, nothing to do")
         return
@@ -70,7 +70,7 @@ python build_efi_cfg() {
         bb.debug(1, "No labels, nothing to do")
         return
 
-    cfile = d.getVar('GUMMIBOOT_CFG', True)
+    cfile = d.getVar('GUMMIBOOT_CFG')
     try:
          cfgfile = open(cfile, 'w')
     except OSError:
@@ -78,7 +78,7 @@ python build_efi_cfg() {
 
     cfgfile.write('# Automatically created by OE\n')
     cfgfile.write('default %s\n' % (labels.split()[0]))
-    timeout = d.getVar('GUMMIBOOT_TIMEOUT', True)
+    timeout = d.getVar('GUMMIBOOT_TIMEOUT')
     if timeout:
         cfgfile.write('timeout %s\n' % timeout)
     else:
@@ -88,7 +88,7 @@ python build_efi_cfg() {
     for label in labels.split():
         localdata = d.createCopy()
 
-        overrides = localdata.getVar('OVERRIDES', True)
+        overrides = localdata.getVar('OVERRIDES')
         if not overrides:
             bb.fatal('OVERRIDES not defined')
 
@@ -104,8 +104,8 @@ python build_efi_cfg() {
         entrycfg.write('title %s\n' % label)
         entrycfg.write('linux /vmlinuz\n')
 
-        append = localdata.getVar('APPEND', True)
-        initrd = localdata.getVar('INITRD', True)
+        append = localdata.getVar('APPEND')
+        initrd = localdata.getVar('INITRD')
 
         if initrd:
             entrycfg.write('initrd /initrd\n')
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index a837894..8a351cf 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -100,7 +100,7 @@ def use_icecc(bb,d):
     if icecc_is_allarch(bb, d):
         return "no"
 
-    pn = d.getVar('PN', True)
+    pn = d.getVar('PN')
 
     system_class_blacklist = []
     user_class_blacklist = (d.getVar('ICECC_USER_CLASS_BL', False) or "none").split()
@@ -139,7 +139,7 @@ def use_icecc(bb,d):
     return "yes"
 
 def icecc_is_allarch(bb, d):
-    return d.getVar("PACKAGE_ARCH", True) == "all" or bb.data.inherits_class('allarch', d)
+    return d.getVar("PACKAGE_ARCH") == "all" or bb.data.inherits_class('allarch', d)
 
 def icecc_is_kernel(bb, d):
     return \
diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index da1edf7..3b79de5 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -18,7 +18,7 @@ def image_buildinfo_outputvars(vars, listvars, d):
     listvars = listvars.split()
     ret = ""
     for var in vars:
-        value = d.getVar(var, True) or ""
+        value = d.getVar(var) or ""
         if (d.getVarFlag(var, 'type', True) == "list"):
             value = oe.utils.squashspaces(value)
         ret += "%s = %s\n" % (var, value)
@@ -42,7 +42,7 @@ def get_layer_git_status(path):
 
 # Returns layer revisions along with their respective status
 def get_layer_revs(d):
-    layers = (d.getVar("BBLAYERS", True) or "").split()
+    layers = (d.getVar("BBLAYERS") or "").split()
     medadata_revs = ["%-17s = %s:%s %s" % (os.path.basename(i), \
         base_get_metadata_git_branch(i, None).strip(), \
         base_get_metadata_git_revision(i, None), \
@@ -52,11 +52,11 @@ def get_layer_revs(d):
 
 def buildinfo_target(d):
         # Get context
-        if d.getVar('BB_WORKERCONTEXT', True) != '1':
+        if d.getVar('BB_WORKERCONTEXT') != '1':
                 return ""
         # Single and list variables to be read
-        vars = (d.getVar("IMAGE_BUILDINFO_VARS", True) or "")
-        listvars = (d.getVar("IMAGE_BUILDINFO_LVARS", True) or "")
+        vars = (d.getVar("IMAGE_BUILDINFO_VARS") or "")
+        listvars = (d.getVar("IMAGE_BUILDINFO_LVARS") or "")
         return image_buildinfo_outputvars(vars, listvars, d)
 
 # Write build information to target filesystem
diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 4a634dc..a3d1b4e 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -51,8 +51,8 @@ IMAGE_TYPEDEP_hddimg = "ext4"
 IMAGE_TYPES_MASKED += "live hddimg iso"
 
 python() {
-    image_b = d.getVar('IMAGE_BASENAME', True)
-    initrd_i = d.getVar('INITRD_IMAGE_LIVE', True)
+    image_b = d.getVar('IMAGE_BASENAME')
+    initrd_i = d.getVar('INITRD_IMAGE_LIVE')
     if image_b == initrd_i:
         bb.error('INITRD_IMAGE_LIVE %s cannot use image live, hddimg or iso.' % initrd_i)
         bb.fatal('Check IMAGE_FSTYPES and INITRAMFS_FSTYPES settings.')
@@ -264,9 +264,9 @@ build_hddimg() {
 
 python do_bootimg() {
     set_live_vm_vars(d, 'LIVE')
-    if d.getVar("PCBIOS", True) == "1":
+    if d.getVar("PCBIOS") == "1":
         bb.build.exec_func('build_syslinux_cfg', d)
-    if d.getVar("EFI", True) == "1":
+    if d.getVar("EFI") == "1":
         bb.build.exec_func('build_efi_cfg', d)
     bb.build.exec_func('build_hddimg', d)
     bb.build.exec_func('build_iso', d)
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 2f35d6b..35c9244 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -112,9 +112,9 @@ build_boot_dd() {
 python do_bootdirectdisk() {
     validate_disk_signature(d)
     set_live_vm_vars(d, 'VM')
-    if d.getVar("PCBIOS", True) == "1":
+    if d.getVar("PCBIOS") == "1":
         bb.build.exec_func('build_syslinux_cfg', d)
-    if d.getVar("EFI", True) == "1":
+    if d.getVar("EFI") == "1":
         bb.build.exec_func('build_efi_cfg', d)
     bb.build.exec_func('build_boot_dd', d)
 }
@@ -132,7 +132,7 @@ def generate_disk_signature():
 def validate_disk_signature(d):
     import re
 
-    disk_signature = d.getVar("DISK_SIGNATURE", True)
+    disk_signature = d.getVar("DISK_SIGNATURE")
 
     if not re.match(r'^[0-9a-fA-F]{8}$', disk_signature):
         bb.fatal("DISK_SIGNATURE '%s' must be an 8 digit hex string" % disk_signature)
@@ -158,11 +158,11 @@ create_qcow2_image () {
 }
 
 python do_vmimg() {
-    if 'vmdk' in d.getVar('IMAGE_FSTYPES', True):
+    if 'vmdk' in d.getVar('IMAGE_FSTYPES'):
         bb.build.exec_func('create_vmdk_image', d)
-    if 'vdi' in d.getVar('IMAGE_FSTYPES', True):
+    if 'vdi' in d.getVar('IMAGE_FSTYPES'):
         bb.build.exec_func('create_vdi_image', d)
-    if 'qcow2' in d.getVar('IMAGE_FSTYPES', True):
+    if 'qcow2' in d.getVar('IMAGE_FSTYPES'):
         bb.build.exec_func('create_qcow2_image', d)
 }
 
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 6111f6d..13c7bf9 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -2,7 +2,7 @@ inherit rootfs_${IMAGE_PKGTYPE}
 
 # Only Linux SDKs support populate_sdk_ext, fall back to populate_sdk
 # in the non-Linux SDK_OS case, such as mingw32
-SDKEXTCLASS ?= "${@['populate_sdk', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS", True)]}"
+SDKEXTCLASS ?= "${@['populate_sdk', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
 inherit ${SDKEXTCLASS}
 
 TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
@@ -133,7 +133,7 @@ def build_live(d):
     if bb.utils.contains("IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
         d.setVar('NOISO', bb.utils.contains('IMAGE_FSTYPES', "iso", "0", "1", d))
         d.setVar('NOHDD', bb.utils.contains('IMAGE_FSTYPES', "hddimg", "0", "1", d))
-        if d.getVar('NOISO', True) == "0" or d.getVar('NOHDD', True) == "0":
+        if d.getVar('NOISO') == "0" or d.getVar('NOHDD') == "0":
             return "image-live"
         return ""
     return "image-live"
@@ -149,7 +149,7 @@ python () {
     d.appendVarFlag('do_rootfs', 'depends', deps)
 
     deps = ""
-    for dep in (d.getVar('EXTRA_IMAGEDEPENDS', True) or "").split():
+    for dep in (d.getVar('EXTRA_IMAGEDEPENDS') or "").split():
         deps += " %s:do_populate_sysroot" % dep
     d.appendVarFlag('do_build', 'depends', deps)
 
@@ -158,22 +158,22 @@ python () {
     features = set(oe.data.typed_value('IMAGE_FEATURES', d))
     remain_features = features.copy()
     for feature in features:
-        replaces = set((d.getVar("IMAGE_FEATURES_REPLACES_%s" % feature, True) or "").split())
+        replaces = set((d.getVar("IMAGE_FEATURES_REPLACES_%s" % feature) or "").split())
         remain_features -= replaces
 
     #Check for conflict image features
     for feature in remain_features:
-        conflicts = set((d.getVar("IMAGE_FEATURES_CONFLICTS_%s" % feature, True) or "").split())
+        conflicts = set((d.getVar("IMAGE_FEATURES_CONFLICTS_%s" % feature) or "").split())
         temp = conflicts & remain_features
         if temp:
-            bb.fatal("%s contains conflicting IMAGE_FEATURES %s %s" % (d.getVar('PN', True), feature, ' '.join(list(temp))))
+            bb.fatal("%s contains conflicting IMAGE_FEATURES %s %s" % (d.getVar('PN'), feature, ' '.join(list(temp))))
 
     d.setVar('IMAGE_FEATURES', ' '.join(sorted(list(remain_features))))
 
     check_image_features(d)
-    initramfs_image = d.getVar('INITRAMFS_IMAGE', True) or ""
+    initramfs_image = d.getVar('INITRAMFS_IMAGE') or ""
     if initramfs_image != "":
-        d.appendVarFlag('do_build', 'depends', " %s:do_bundle_initramfs" %  d.getVar('PN', True))
+        d.appendVarFlag('do_build', 'depends', " %s:do_bundle_initramfs" %  d.getVar('PN'))
         d.appendVarFlag('do_bundle_initramfs', 'depends', " %s:do_image_complete" % initramfs_image)
 }
 
@@ -185,7 +185,7 @@ IMAGE_POSTPROCESS_COMMAND ?= ""
 # some default locales
 IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
 
-LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IMAGE_LINGUAS', True).split()))}"
+LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IMAGE_LINGUAS').split()))}"
 
 # Prefer image, but use the fallback files for lookups if the image ones
 # aren't yet available.
@@ -212,20 +212,20 @@ fakeroot python do_rootfs () {
     progress_reporter.next_stage()
 
     # Handle package exclusions
-    excl_pkgs = d.getVar("PACKAGE_EXCLUDE", True).split()
-    inst_pkgs = d.getVar("PACKAGE_INSTALL", True).split()
-    inst_attempt_pkgs = d.getVar("PACKAGE_INSTALL_ATTEMPTONLY", True).split()
+    excl_pkgs = d.getVar("PACKAGE_EXCLUDE").split()
+    inst_pkgs = d.getVar("PACKAGE_INSTALL").split()
+    inst_attempt_pkgs = d.getVar("PACKAGE_INSTALL_ATTEMPTONLY").split()
 
     d.setVar('PACKAGE_INSTALL_ORIG', ' '.join(inst_pkgs))
     d.setVar('PACKAGE_INSTALL_ATTEMPTONLY', ' '.join(inst_attempt_pkgs))
 
     for pkg in excl_pkgs:
         if pkg in inst_pkgs:
-            bb.warn("Package %s, set to be excluded, is in %s PACKAGE_INSTALL (%s).  It will be removed from the list." % (pkg, d.getVar('PN', True), inst_pkgs))
+            bb.warn("Package %s, set to be excluded, is in %s PACKAGE_INSTALL (%s).  It will be removed from the list." % (pkg, d.getVar('PN'), inst_pkgs))
             inst_pkgs.remove(pkg)
 
         if pkg in inst_attempt_pkgs:
-            bb.warn("Package %s, set to be excluded, is in %s PACKAGE_INSTALL_ATTEMPTONLY (%s).  It will be removed from the list." % (pkg, d.getVar('PN', True), inst_pkgs))
+            bb.warn("Package %s, set to be excluded, is in %s PACKAGE_INSTALL_ATTEMPTONLY (%s).  It will be removed from the list." % (pkg, d.getVar('PN'), inst_pkgs))
             inst_attempt_pkgs.remove(pkg)
 
     d.setVar("PACKAGE_INSTALL", ' '.join(inst_pkgs))
@@ -235,7 +235,7 @@ fakeroot python do_rootfs () {
     # We have to delay the runtime_mapping_rename until just before rootfs runs
     # otherwise, the multilib renaming could step in and squash any fixups that
     # may have occurred.
-    pn = d.getVar('PN', True)
+    pn = d.getVar('PN')
     runtime_mapping_rename("PACKAGE_INSTALL", pn, d)
     runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, d)
     runtime_mapping_rename("BAD_RECOMMENDATIONS", pn, d)
@@ -258,7 +258,7 @@ addtask rootfs before do_build
 fakeroot python do_image () {
     from oe.utils import execute_pre_post_process
 
-    pre_process_cmds = d.getVar("IMAGE_PREPROCESS_COMMAND", True)
+    pre_process_cmds = d.getVar("IMAGE_PREPROCESS_COMMAND")
 
     execute_pre_post_process(d, pre_process_cmds)
 }
@@ -269,7 +269,7 @@ addtask do_image after do_rootfs before do_build
 fakeroot python do_image_complete () {
     from oe.utils import execute_pre_post_process
 
-    post_process_cmds = d.getVar("IMAGE_POSTPROCESS_COMMAND", True)
+    post_process_cmds = d.getVar("IMAGE_POSTPROCESS_COMMAND")
 
     execute_pre_post_process(d, post_process_cmds)
 }
@@ -292,7 +292,7 @@ addtask do_image_complete after do_image before do_build
 fakeroot python do_image_qa () {
     from oe.utils import ImageQAFailed
 
-    qa_cmds = (d.getVar('IMAGE_QA_COMMANDS', True) or '').split()
+    qa_cmds = (d.getVar('IMAGE_QA_COMMANDS') or '').split()
     qamsg = ""
 
     for cmd in qa_cmds:
@@ -307,7 +307,7 @@ fakeroot python do_image_qa () {
             qamsg = qamsg + '\n'
 
     if qamsg:
-        imgname = d.getVar('IMAGE_NAME', True)
+        imgname = d.getVar('IMAGE_NAME')
         bb.fatal("QA errors found whilst validating image: %s\n%s" % (imgname, qamsg))
 }
 addtask do_image_qa after do_image_complete before do_build
@@ -317,17 +317,17 @@ addtask do_image_qa after do_image_complete before do_build
 # to tmp/sysroots/<machine>/imgdata/<image>.env
 #
 python do_rootfs_wicenv () {
-    wicvars = d.getVar('WICVARS', True)
+    wicvars = d.getVar('WICVARS')
     if not wicvars:
         return
 
-    stdir = d.getVar('STAGING_DIR_TARGET', True)
+    stdir = d.getVar('STAGING_DIR_TARGET')
     outdir = os.path.join(stdir, 'imgdata')
     bb.utils.mkdirhier(outdir)
-    basename = d.getVar('IMAGE_BASENAME', True)
+    basename = d.getVar('IMAGE_BASENAME')
     with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
         for var in wicvars.split():
-            value = d.getVar(var, True)
+            value = d.getVar(var)
             if value:
                 envf.write('%s="%s"\n' % (var, value.strip()))
 }
@@ -340,7 +340,7 @@ def setup_debugfs_variables(d):
     d.appendVar('IMAGE_LINK_NAME', '-dbg')
     d.appendVar('IMAGE_NAME','-dbg')
     d.setVar('IMAGE_BUILDING_DEBUGFS', 'true')
-    debugfs_image_fstypes = d.getVar('IMAGE_FSTYPES_DEBUGFS', True)
+    debugfs_image_fstypes = d.getVar('IMAGE_FSTYPES_DEBUGFS')
     if debugfs_image_fstypes:
         d.setVar('IMAGE_FSTYPES', debugfs_image_fstypes)
 
@@ -358,7 +358,7 @@ python () {
     #
     # Without de-duplication, gen_conversion_cmds() below
     # would create the same compression command multiple times.
-    ctypes = set(d.getVar('CONVERSIONTYPES', True).split())
+    ctypes = set(d.getVar('CONVERSIONTYPES').split())
     old_overrides = d.getVar('OVERRIDES', False)
 
     def _image_base_type(type):
@@ -375,11 +375,11 @@ python () {
         return basetype
 
     basetypes = {}
-    alltypes = d.getVar('IMAGE_FSTYPES', True).split()
+    alltypes = d.getVar('IMAGE_FSTYPES').split()
     typedeps = {}
 
-    if d.getVar('IMAGE_GEN_DEBUGFS', True) == "1":
-        debugfs_fstypes = d.getVar('IMAGE_FSTYPES_DEBUGFS', True).split()
+    if d.getVar('IMAGE_GEN_DEBUGFS') == "1":
+        debugfs_fstypes = d.getVar('IMAGE_FSTYPES_DEBUGFS').split()
         for t in debugfs_fstypes:
             alltypes.append("debugfs_" + t)
 
@@ -394,7 +394,7 @@ python () {
         if t.startswith("debugfs_"):
             t = t[8:]
             debug = "debugfs_"
-        deps = (d.getVar('IMAGE_TYPEDEP_' + t, True) or "").split()
+        deps = (d.getVar('IMAGE_TYPEDEP_' + t) or "").split()
         vardeps.add('IMAGE_TYPEDEP_' + t)
         if baset not in typedeps:
             typedeps[baset] = set()
@@ -414,7 +414,7 @@ python () {
 
     d.appendVarFlag('do_image', 'vardeps', ' '.join(vardeps))
 
-    maskedtypes = (d.getVar('IMAGE_TYPES_MASKED', True) or "").split()
+    maskedtypes = (d.getVar('IMAGE_TYPES_MASKED') or "").split()
     maskedtypes = [dbg + t for t in maskedtypes for dbg in ("", "debugfs_")]
 
     for t in basetypes:
@@ -442,7 +442,7 @@ python () {
         localdata.delVar('DATETIME')
         localdata.delVar('TMPDIR')
 
-        image_cmd = localdata.getVar("IMAGE_CMD", True)
+        image_cmd = localdata.getVar("IMAGE_CMD")
         vardeps.add('IMAGE_CMD_' + realt)
         if image_cmd:
             cmds.append("\t" + image_cmd)
@@ -464,7 +464,7 @@ python () {
                     # Create input image first.
                     gen_conversion_cmds(type)
                     localdata.setVar('type', type)
-                    cmd = "\t" + (localdata.getVar("CONVERSION_CMD_" + ctype, True) or localdata.getVar("COMPRESS_CMD_" + ctype, True))
+                    cmd = "\t" + (localdata.getVar("CONVERSION_CMD_" + ctype) or localdata.getVar("COMPRESS_CMD_" + ctype))
                     if cmd not in cmds:
                         cmds.append(cmd)
                     vardeps.add('CONVERSION_CMD_' + ctype)
@@ -515,17 +515,17 @@ python () {
 def get_rootfs_size(d):
     import subprocess
 
-    rootfs_alignment = int(d.getVar('IMAGE_ROOTFS_ALIGNMENT', True))
-    overhead_factor = float(d.getVar('IMAGE_OVERHEAD_FACTOR', True))
-    rootfs_req_size = int(d.getVar('IMAGE_ROOTFS_SIZE', True))
-    rootfs_extra_space = eval(d.getVar('IMAGE_ROOTFS_EXTRA_SPACE', True))
-    rootfs_maxsize = d.getVar('IMAGE_ROOTFS_MAXSIZE', True)
-    image_fstypes = d.getVar('IMAGE_FSTYPES', True) or ''
-    initramfs_fstypes = d.getVar('INITRAMFS_FSTYPES', True) or ''
-    initramfs_maxsize = d.getVar('INITRAMFS_MAXSIZE', True)
+    rootfs_alignment = int(d.getVar('IMAGE_ROOTFS_ALIGNMENT'))
+    overhead_factor = float(d.getVar('IMAGE_OVERHEAD_FACTOR'))
+    rootfs_req_size = int(d.getVar('IMAGE_ROOTFS_SIZE'))
+    rootfs_extra_space = eval(d.getVar('IMAGE_ROOTFS_EXTRA_SPACE'))
+    rootfs_maxsize = d.getVar('IMAGE_ROOTFS_MAXSIZE')
+    image_fstypes = d.getVar('IMAGE_FSTYPES') or ''
+    initramfs_fstypes = d.getVar('INITRAMFS_FSTYPES') or ''
+    initramfs_maxsize = d.getVar('INITRAMFS_MAXSIZE')
 
     output = subprocess.check_output(['du', '-ks',
-                                      d.getVar('IMAGE_ROOTFS', True)])
+                                      d.getVar('IMAGE_ROOTFS')])
     size_kb = int(output.split()[0])
     base_size = size_kb * overhead_factor
     base_size = max(base_size, rootfs_req_size) + rootfs_extra_space
@@ -541,7 +541,7 @@ def get_rootfs_size(d):
     # Do not check image size of the debugfs image. This is not supposed
     # to be deployed, etc. so it doesn't make sense to limit the size
     # of the debug.
-    if (d.getVar('IMAGE_BUILDING_DEBUGFS', True) or "") == "true":
+    if (d.getVar('IMAGE_BUILDING_DEBUGFS') or "") == "true":
         return base_size
 
     # Check the rootfs size against IMAGE_ROOTFS_MAXSIZE (if set)
@@ -572,11 +572,11 @@ python set_image_size () {
 #
 python create_symlinks() {
 
-    deploy_dir = d.getVar('IMGDEPLOYDIR', True)
-    img_name = d.getVar('IMAGE_NAME', True)
-    link_name = d.getVar('IMAGE_LINK_NAME', True)
-    manifest_name = d.getVar('IMAGE_MANIFEST', True)
-    taskname = d.getVar("BB_CURRENTTASK", True)
+    deploy_dir = d.getVar('IMGDEPLOYDIR')
+    img_name = d.getVar('IMAGE_NAME')
+    link_name = d.getVar('IMAGE_LINK_NAME')
+    manifest_name = d.getVar('IMAGE_MANIFEST')
+    taskname = d.getVar("BB_CURRENTTASK")
     subimages = (d.getVarFlag("do_" + taskname, 'subimages', False) or "").split()
     imgsuffix = d.getVarFlag("do_" + taskname, 'imgsuffix', True) or d.expand("${IMAGE_NAME_SUFFIX}.")
 
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 9d66d7d..8f04849 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -17,20 +17,20 @@ def imagetypes_getdepends(d):
                 d += ":do_populate_sysroot"
             deps.add(d)
 
-    fstypes = set((d.getVar('IMAGE_FSTYPES', True) or "").split())
-    fstypes |= set((d.getVar('IMAGE_FSTYPES_DEBUGFS', True) or "").split())
+    fstypes = set((d.getVar('IMAGE_FSTYPES') or "").split())
+    fstypes |= set((d.getVar('IMAGE_FSTYPES_DEBUGFS') or "").split())
 
     deps = set()
     for typestring in fstypes:
         types = typestring.split(".")
         basetype, resttypes = types[0], types[1:]
 
-        adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype, True) , deps)
-        for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype, True) or "").split():
-            adddep(d.getVar('IMAGE_DEPENDS_%s' % typedepends, True) , deps)
+        adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype) , deps)
+        for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype) or "").split():
+            adddep(d.getVar('IMAGE_DEPENDS_%s' % typedepends) , deps)
         for ctype in resttypes:
-            adddep(d.getVar("CONVERSION_DEPENDS_%s" % ctype, True), deps)
-            adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype, True), deps)
+            adddep(d.getVar("CONVERSION_DEPENDS_%s" % ctype), deps)
+            adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype), deps)
 
     # Sort the set so that ordering is consistant
     return " ".join(sorted(deps))
@@ -220,7 +220,7 @@ WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
 
 python () {
-    if d.getVar('USING_WIC', True) and 'do_bootimg' in d:
+    if d.getVar('USING_WIC') and 'do_bootimg' in d:
         bb.build.addtask('do_image_wic', '', 'do_bootimg', d)
 }
 
@@ -228,7 +228,7 @@ python do_write_wks_template () {
     """Write out expanded template contents to WKS_FULL_PATH."""
     import re
 
-    template_body = d.getVar('_WKS_TEMPLATE', True)
+    template_body = d.getVar('_WKS_TEMPLATE')
 
     # Remove any remnant variable references left behind by the expansion
     # due to undefined variables
@@ -240,18 +240,18 @@ python do_write_wks_template () {
         else:
             template_body = new_body
 
-    wks_file = d.getVar('WKS_FULL_PATH', True)
+    wks_file = d.getVar('WKS_FULL_PATH')
     with open(wks_file, 'w') as f:
         f.write(template_body)
 }
 
 python () {
-    if d.getVar('USING_WIC', True):
+    if d.getVar('USING_WIC'):
         wks_file_u = d.getVar('WKS_FULL_PATH', False)
         wks_file = d.expand(wks_file_u)
         base, ext = os.path.splitext(wks_file)
         if ext == '.in' and os.path.exists(wks_file):
-            wks_out_file = os.path.join(d.getVar('WORKDIR', True), os.path.basename(base))
+            wks_out_file = os.path.join(d.getVar('WORKDIR'), os.path.basename(base))
             d.setVar('WKS_FULL_PATH', wks_out_file)
             d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
             d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a5c93f3..d7fc2f3 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -176,7 +176,7 @@ def package_qa_get_machine_dict(d):
 
     # Add in any extra user supplied data which may come from a BSP layer, removing the
     # need to always change this class directly
-    extra_machdata = (d.getVar("PACKAGEQA_EXTRA_MACHDEFFUNCS", True) or "").split()
+    extra_machdata = (d.getVar("PACKAGEQA_EXTRA_MACHDEFFUNCS") or "").split()
     for m in extra_machdata:
         call = m + "(machdata, d)"
         locs = { "machdata" : machdata, "d" : d}
@@ -191,23 +191,23 @@ def package_qa_clean_path(path, d, pkg=None):
     TMPDIR is stripped, otherwise PKGDEST/pkg is stripped.
     """
     if pkg:
-        path = path.replace(os.path.join(d.getVar("PKGDEST", True), pkg), "/")
-    return path.replace(d.getVar("TMPDIR", True), "/").replace("//", "/")
+        path = path.replace(os.path.join(d.getVar("PKGDEST"), pkg), "/")
+    return path.replace(d.getVar("TMPDIR"), "/").replace("//", "/")
 
 def package_qa_write_error(type, error, d):
-    logfile = d.getVar('QA_LOGFILE', True)
+    logfile = d.getVar('QA_LOGFILE')
     if logfile:
-        p = d.getVar('P', True)
+        p = d.getVar('P')
         with open(logfile, "a+") as f:
             f.write("%s: %s [%s]\n" % (p, error, type))
 
 def package_qa_handle_error(error_class, error_msg, d):
     package_qa_write_error(error_class, error_msg, d)
-    if error_class in (d.getVar("ERROR_QA", True) or "").split():
+    if error_class in (d.getVar("ERROR_QA") or "").split():
         bb.error("QA Issue: %s [%s]" % (error_msg, error_class))
         d.setVar("QA_SANE", False)
         return False
-    elif error_class in (d.getVar("WARN_QA", True) or "").split():
+    elif error_class in (d.getVar("WARN_QA") or "").split():
         bb.warn("QA Issue: %s [%s]" % (error_msg, error_class))
     else:
         bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
@@ -223,7 +223,7 @@ QAPATHTEST[libexec] = "package_qa_check_libexec"
 def package_qa_check_libexec(path,name, d, elf, messages):
 
     # Skip the case where the default is explicitly /usr/libexec
-    libexec = d.getVar('libexecdir', True)
+    libexec = d.getVar('libexecdir')
     if libexec == "/usr/libexec":
         return True
 
@@ -244,7 +244,7 @@ def package_qa_check_rpath(file,name, d, elf, messages):
     if os.path.islink(file):
         return
 
-    bad_dirs = [d.getVar('BASE_WORKDIR', True), d.getVar('STAGING_DIR_TARGET', True)]
+    bad_dirs = [d.getVar('BASE_WORKDIR'), d.getVar('STAGING_DIR_TARGET')]
 
     phdrs = elf.run_objdump("-p", d)
 
@@ -272,8 +272,8 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
     if os.path.islink(file):
         return
 
-    libdir = d.getVar("libdir", True)
-    base_libdir = d.getVar("base_libdir", True)
+    libdir = d.getVar("libdir")
+    base_libdir = d.getVar("base_libdir")
 
     phdrs = elf.run_objdump("-p", d)
 
@@ -330,11 +330,11 @@ def package_qa_check_libdir(d):
     """
     import re
 
-    pkgdest = d.getVar('PKGDEST', True)
+    pkgdest = d.getVar('PKGDEST')
     base_libdir = d.getVar("base_libdir",True) + os.sep
-    libdir = d.getVar("libdir", True) + os.sep
-    libexecdir = d.getVar("libexecdir", True) + os.sep
-    exec_prefix = d.getVar("exec_prefix", True) + os.sep
+    libdir = d.getVar("libdir") + os.sep
+    libexecdir = d.getVar("libexecdir") + os.sep
+    exec_prefix = d.getVar("exec_prefix") + os.sep
 
     messages = []
 
@@ -349,10 +349,10 @@ def package_qa_check_libdir(d):
             # Skip subdirectories for any packages with libdir in INSANE_SKIP
             skippackages = []
             for package in dirs:
-                if 'libdir' in (d.getVar('INSANE_SKIP_' + package, True) or "").split():
+                if 'libdir' in (d.getVar('INSANE_SKIP_' + package) or "").split():
                     bb.note("Package %s skipping libdir QA test" % (package))
                     skippackages.append(package)
-                elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE', True) == 'debug-file-directory' and package.endswith("-dbg"):
+                elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-file-directory' and package.endswith("-dbg"):
                     bb.note("Package %s skipping libdir QA test for PACKAGE_DEBUG_SPLIT_STYLE equals debug-file-directory" % (package))
                     skippackages.append(package)
             for package in skippackages:
@@ -413,10 +413,10 @@ def package_qa_check_unsafe_references_in_binaries(path, name, d, elf, messages)
 
     if elf:
         import subprocess as sub
-        pn = d.getVar('PN', True)
+        pn = d.getVar('PN')
 
-        exec_prefix = d.getVar('exec_prefix', True)
-        sysroot_path = d.getVar('STAGING_DIR_TARGET', True)
+        exec_prefix = d.getVar('exec_prefix')
+        sysroot_path = d.getVar('STAGING_DIR_TARGET')
         sysroot_path_usr = sysroot_path + exec_prefix
 
         try:
@@ -429,8 +429,8 @@ def package_qa_check_unsafe_references_in_binaries(path, name, d, elf, messages)
         if sysroot_path_usr in ldd_output:
             ldd_output = ldd_output.replace(sysroot_path, "")
 
-            pkgdest = d.getVar('PKGDEST', True)
-            packages = d.getVar('PACKAGES', True)
+            pkgdest = d.getVar('PKGDEST')
+            packages = d.getVar('PACKAGES')
 
             for package in packages.split():
                 short_path = path.replace('%s/%s' % (pkgdest, package), "", 1)
@@ -456,13 +456,13 @@ def package_qa_check_unsafe_references_in_scripts(path, name, d, elf, messages):
     if not elf:
         import stat
         import subprocess
-        pn = d.getVar('PN', True)
+        pn = d.getVar('PN')
 
         # Ensure we're checking an executable script
         statinfo = os.stat(path)
         if bool(statinfo.st_mode & stat.S_IXUSR):
             # grep shell scripts for possible references to /exec_prefix/
-            exec_prefix = d.getVar('exec_prefix', True)
+            exec_prefix = d.getVar('exec_prefix')
             statement = "grep -e '%s/[^ :]\{1,\}/[^ :]\{1,\}' %s > /dev/null" % (exec_prefix, path)
             if subprocess.call(statement, shell=True) == 0:
                 error_msg = pn + ": Found a reference to %s/ in %s" % (exec_prefix, path)
@@ -486,19 +486,19 @@ def unsafe_references_skippable(path, name, d):
         return True
 
     # Skip unusual rootfs layouts which make these tests irrelevant
-    exec_prefix = d.getVar('exec_prefix', True)
+    exec_prefix = d.getVar('exec_prefix')
     if exec_prefix == "":
         return True
 
-    pkgdest = d.getVar('PKGDEST', True)
+    pkgdest = d.getVar('PKGDEST')
     pkgdest = pkgdest + "/" + name
     pkgdest = os.path.abspath(pkgdest)
-    base_bindir = pkgdest + d.getVar('base_bindir', True)
-    base_sbindir = pkgdest + d.getVar('base_sbindir', True)
-    base_libdir = pkgdest + d.getVar('base_libdir', True)
-    bindir = pkgdest + d.getVar('bindir', True)
-    sbindir = pkgdest + d.getVar('sbindir', True)
-    libdir = pkgdest + d.getVar('libdir', True)
+    base_bindir = pkgdest + d.getVar('base_bindir')
+    base_sbindir = pkgdest + d.getVar('base_sbindir')
+    base_libdir = pkgdest + d.getVar('base_libdir')
+    bindir = pkgdest + d.getVar('bindir')
+    sbindir = pkgdest + d.getVar('sbindir')
+    libdir = pkgdest + d.getVar('libdir')
 
     if base_bindir == bindir and base_sbindir == sbindir and base_libdir == libdir:
         return True
@@ -520,13 +520,13 @@ def package_qa_check_arch(path,name,d, elf, messages):
     if not elf:
         return
 
-    target_os   = d.getVar('TARGET_OS', True)
-    target_arch = d.getVar('TARGET_ARCH', True)
-    provides = d.getVar('PROVIDES', True)
-    bpn = d.getVar('BPN', True)
+    target_os   = d.getVar('TARGET_OS')
+    target_arch = d.getVar('TARGET_ARCH')
+    provides = d.getVar('PROVIDES')
+    bpn = d.getVar('BPN')
 
     if target_arch == "allarch":
-        pn = d.getVar('PN', True)
+        pn = d.getVar('PN')
         package_qa_add_message(messages, "arch", pn + ": Recipe inherits the allarch class, but has packaged architecture-specific binaries")
         return
 
@@ -546,7 +546,7 @@ def package_qa_check_arch(path,name,d, elf, messages):
 
     # Check the architecture and endiannes of the binary
     is_32 = (("virtual/kernel" in provides) or bb.data.inherits_class("module", d)) and \
-            (target_os == "linux-gnux32" or re.match('mips64.*32', d.getVar('DEFAULTTUNE', True)))
+            (target_os == "linux-gnux32" or re.match('mips64.*32', d.getVar('DEFAULTTUNE')))
     if not ((machine == elf.machine()) or is_32):
         package_qa_add_message(messages, "arch", "Architecture did not match (%s, expected %s) on %s" % \
                  (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine), package_qa_clean_path(path,d)))
@@ -605,9 +605,9 @@ def package_qa_hash_style(path, name, d, elf, messages):
     if os.path.islink(path):
         return
 
-    gnu_hash = "--hash-style=gnu" in d.getVar('LDFLAGS', True)
+    gnu_hash = "--hash-style=gnu" in d.getVar('LDFLAGS')
     if not gnu_hash:
-        gnu_hash = "--hash-style=both" in d.getVar('LDFLAGS', True)
+        gnu_hash = "--hash-style=both" in d.getVar('LDFLAGS')
     if not gnu_hash:
         return
 
@@ -646,7 +646,7 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     if path.find(name + "/CONTROL/") != -1 or path.find(name + "/DEBIAN/") != -1:
         return
 
-    tmpdir = d.getVar('TMPDIR', True)
+    tmpdir = d.getVar('TMPDIR')
     with open(path, 'rb') as f:
         file_content = f.read().decode('utf-8', errors='ignore')
         if tmpdir in file_content:
@@ -665,8 +665,8 @@ def package_qa_check_xorg_driver_abi(path, name, d, elf, messages):
 
     driverdir = d.expand("${libdir}/xorg/modules/drivers/")
     if driverdir in path and path.endswith(".so"):
-        mlprefix = d.getVar('MLPREFIX', True) or ''
-        for rdep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + name, True) or ""):
+        mlprefix = d.getVar('MLPREFIX') or ''
+        for rdep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + name) or ""):
             if rdep.startswith("%sxorg-abi-" % mlprefix):
                 return
         package_qa_add_message(messages, "xorg-driver-abi", "Package %s contains Xorg driver (%s) but no xorg-abi- dependencies" % (name, os.path.basename(path)))
@@ -689,9 +689,9 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
     if os.path.islink(path):
         target = os.readlink(path)
         if os.path.isabs(target):
-            tmpdir = d.getVar('TMPDIR', True)
+            tmpdir = d.getVar('TMPDIR')
             if target.startswith(tmpdir):
-                trimmed = path.replace(os.path.join (d.getVar("PKGDEST", True), name), "")
+                trimmed = path.replace(os.path.join (d.getVar("PKGDEST"), name), "")
                 package_qa_add_message(messages, "symlink-to-sysroot", "Symlink %s in %s points to TMPDIR" % (trimmed, name))
 
 # Check license variables
@@ -703,17 +703,17 @@ python populate_lic_qa_checksum() {
     import tempfile
     sane = True
 
-    lic_files = d.getVar('LIC_FILES_CHKSUM', True) or ''
-    lic = d.getVar('LICENSE', True)
-    pn = d.getVar('PN', True)
+    lic_files = d.getVar('LIC_FILES_CHKSUM') or ''
+    lic = d.getVar('LICENSE')
+    pn = d.getVar('PN')
 
     if lic == "CLOSED":
         return
 
-    if not lic_files and d.getVar('SRC_URI', True):
+    if not lic_files and d.getVar('SRC_URI'):
         sane = package_qa_handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)
 
-    srcdir = d.getVar('S', True)
+    srcdir = d.getVar('S')
 
     for url in lic_files.split():
         try:
@@ -791,7 +791,7 @@ def package_qa_check_staged(path,d):
     """
 
     sane = True
-    tmpdir = d.getVar('TMPDIR', True)
+    tmpdir = d.getVar('TMPDIR')
     workdir = os.path.join(tmpdir, "work")
 
     if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
@@ -825,8 +825,8 @@ def package_qa_walk(warnfuncs, errorfuncs, skip, package, d):
     import oe.qa
 
     #if this will throw an exception, then fix the dict above
-    target_os   = d.getVar('TARGET_OS', True)
-    target_arch = d.getVar('TARGET_ARCH', True)
+    target_os   = d.getVar('TARGET_OS')
+    target_arch = d.getVar('TARGET_ARCH')
 
     warnings = {}
     errors = {}
@@ -859,7 +859,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
         bb.data.update_data(localdata)
 
         # Now check the RDEPENDS
-        rdepends = bb.utils.explode_deps(localdata.getVar('RDEPENDS', True) or "")
+        rdepends = bb.utils.explode_deps(localdata.getVar('RDEPENDS') or "")
 
         # Now do the sanity check!!!
         if "build-deps" not in skip:
@@ -875,7 +875,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                     if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
                         continue
                     if not rdep_data or not 'PN' in rdep_data:
-                        pkgdata_dir = d.getVar("PKGDATA_DIR", True)
+                        pkgdata_dir = d.getVar("PKGDATA_DIR")
                         try:
                             possibles = os.listdir("%s/runtime-rprovides/%s/" % (pkgdata_dir, rdepend))
                         except OSError:
@@ -934,7 +934,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                 # The python is not a package, but python-core provides it, so
                 # skip checking /usr/bin/python if python is in the rdeps, in
                 # case there is a RDEPENDS_pkg = "python" in the recipe.
-                for py in [ d.getVar('MLPREFIX', True) + "python", "python" ]:
+                for py in [ d.getVar('MLPREFIX') + "python", "python" ]:
                     if py in done:
                         filerdepends.pop("/usr/bin/python",None)
                         done.remove(py)
@@ -967,7 +967,7 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
 
     def check_valid_deps(var):
         try:
-            rvar = bb.utils.explode_dep_versions2(localdata.getVar(var, True) or "")
+            rvar = bb.utils.explode_dep_versions2(localdata.getVar(var) or "")
         except ValueError as e:
             bb.fatal("%s_%s: %s" % (var, pkg, e))
         for dep in rvar:
@@ -994,7 +994,7 @@ def package_qa_check_expanded_d(path,name,d,elf,messages):
     expanded_d = d.getVar('D',True)
 
     # Get packages for current recipe and iterate
-    packages = d.getVar('PACKAGES', True).split(" ")
+    packages = d.getVar('PACKAGES').split(" ")
     for pak in packages:
     # Go through all variables and check if expanded D is found, warn the user accordingly
         for var in 'FILES','pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
@@ -1013,7 +1013,7 @@ def package_qa_check_expanded_d(path,name,d,elf,messages):
 def package_qa_check_encoding(keys, encode, d):
     def check_encoding(key, enc):
         sane = True
-        value = d.getVar(key, True)
+        value = d.getVar(key)
         if value:
             try:
                 s = value.encode(enc)
@@ -1038,8 +1038,8 @@ def package_qa_check_host_user(path, name, d, elf, messages):
     if not os.path.lexists(path):
         return
 
-    dest = d.getVar('PKGDEST', True)
-    pn = d.getVar('PN', True)
+    dest = d.getVar('PKGDEST')
+    pn = d.getVar('PN')
     home = os.path.join(dest, 'home')
     if path == home or path.startswith(home + os.sep):
         return
@@ -1052,12 +1052,12 @@ def package_qa_check_host_user(path, name, d, elf, messages):
             raise
     else:
         rootfs_path = path[len(dest):]
-        check_uid = int(d.getVar('HOST_USER_UID', True))
+        check_uid = int(d.getVar('HOST_USER_UID'))
         if stat.st_uid == check_uid:
             package_qa_add_message(messages, "host-user-contaminated", "%s: %s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, rootfs_path, check_uid))
             return False
 
-        check_gid = int(d.getVar('HOST_USER_GID', True))
+        check_gid = int(d.getVar('HOST_USER_GID'))
         if stat.st_gid == check_gid:
             package_qa_add_message(messages, "host-user-contaminated", "%s: %s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, rootfs_path, check_gid))
             return False
@@ -1075,8 +1075,8 @@ python do_package_qa () {
     # Check non UTF-8 characters on recipe's metadata
     package_qa_check_encoding(['DESCRIPTION', 'SUMMARY', 'LICENSE', 'SECTION'], 'utf-8', d)
 
-    logdir = d.getVar('T', True)
-    pkg = d.getVar('PN', True)
+    logdir = d.getVar('T')
+    pkg = d.getVar('PN')
 
     # Check the compile log for host contamination
     compilelog = os.path.join(logdir,"log.do_compile")
@@ -1099,8 +1099,8 @@ python do_package_qa () {
             package_qa_handle_error("install-host-path", msg, d)
 
     # Scan the packages...
-    pkgdest = d.getVar('PKGDEST', True)
-    packages = set((d.getVar('PACKAGES', True) or '').split())
+    pkgdest = d.getVar('PKGDEST')
+    packages = set((d.getVar('PACKAGES') or '').split())
 
     cpath = oe.cachedpath.CachedPath()
     global pkgfiles
@@ -1127,11 +1127,11 @@ python do_package_qa () {
 
     g = globals()
     for package in packages:
-        skip = (d.getVar('INSANE_SKIP_' + package, True) or "").split()
+        skip = (d.getVar('INSANE_SKIP_' + package) or "").split()
         if skip:
             bb.note("Package %s skipping QA tests: %s" % (package, str(skip)))
         warnchecks = []
-        for w in (d.getVar("WARN_QA", True) or "").split():
+        for w in (d.getVar("WARN_QA") or "").split():
             if w in skip:
                continue
             if w in testmatrix and testmatrix[w] in g:
@@ -1140,7 +1140,7 @@ python do_package_qa () {
                 oe.utils.write_ld_so_conf(d)
 
         errorchecks = []
-        for e in (d.getVar("ERROR_QA", True) or "").split():
+        for e in (d.getVar("ERROR_QA") or "").split():
             if e in skip:
                continue
             if e in testmatrix and testmatrix[e] in g:
@@ -1160,10 +1160,10 @@ python do_package_qa () {
         package_qa_check_rdepends(package, pkgdest, skip, taskdeps, packages, d)
         package_qa_check_deps(package, pkgdest, skip, d)
 
-    if 'libdir' in d.getVar("ALL_QA", True).split():
+    if 'libdir' in d.getVar("ALL_QA").split():
         package_qa_check_libdir(d)
 
-    qa_sane = d.getVar("QA_SANE", True)
+    qa_sane = d.getVar("QA_SANE")
     if not qa_sane:
         bb.fatal("QA run found fatal errors. Please consider fixing them.")
     bb.note("DONE with PACKAGE QA")
@@ -1196,7 +1196,7 @@ python do_qa_configure() {
     ###########################################################################
 
     configs = []
-    workdir = d.getVar('WORKDIR', True)
+    workdir = d.getVar('WORKDIR')
 
     if bb.data.inherits_class('autotools', d):
         bb.note("Checking autotools environment for common misconfiguration")
@@ -1217,16 +1217,16 @@ Rerun configure task after fixing this.""")
     # Check gettext configuration and dependencies are correct
     ###########################################################################
 
-    cnf = d.getVar('EXTRA_OECONF', True) or ""
-    if "gettext" not in d.getVar('P', True) and "gcc-runtime" not in d.getVar('P', True) and "--disable-nls" not in cnf:
-        ml = d.getVar("MLPREFIX", True) or ""
+    cnf = d.getVar('EXTRA_OECONF') or ""
+    if "gettext" not in d.getVar('P') and "gcc-runtime" not in d.getVar('P') and "--disable-nls" not in cnf:
+        ml = d.getVar("MLPREFIX") or ""
         if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('nativesdk', d):
             gt = "gettext-native"
         elif bb.data.inherits_class('cross-canadian', d):
             gt = "nativesdk-gettext"
         else:
             gt = "virtual/" + ml + "gettext"
-        deps = bb.utils.explode_deps(d.getVar('DEPENDS', True) or "")
+        deps = bb.utils.explode_deps(d.getVar('DEPENDS') or "")
         if gt not in deps:
             for config in configs:
                 gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
@@ -1241,40 +1241,40 @@ Missing inherit gettext?""" % (gt, config))
         bb.note("Checking configure output for unrecognised options")
         try:
             flag = "WARNING: unrecognized options:"
-            log = os.path.join(d.getVar('B', True), 'config.log')
+            log = os.path.join(d.getVar('B'), 'config.log')
             output = subprocess.check_output(['grep', '-F', flag, log]).decode("utf-8").replace(', ', ' ')
             options = set()
             for line in output.splitlines():
                 options |= set(line.partition(flag)[2].split())
-            whitelist = set(d.getVar("UNKNOWN_CONFIGURE_WHITELIST", True).split())
+            whitelist = set(d.getVar("UNKNOWN_CONFIGURE_WHITELIST").split())
             options -= whitelist
             if options:
-                pn = d.getVar('PN', True)
+                pn = d.getVar('PN')
                 error_msg = pn + ": configure was passed unrecognised options: " + " ".join(options)
                 package_qa_handle_error("unknown-configure-option", error_msg, d)
         except subprocess.CalledProcessError:
             pass
 
     # Check invalid PACKAGECONFIG
-    pkgconfig = (d.getVar("PACKAGECONFIG", True) or "").split()
+    pkgconfig = (d.getVar("PACKAGECONFIG") or "").split()
     if pkgconfig:
         pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
         for pconfig in pkgconfig:
             if pconfig not in pkgconfigflags:
-                pn = d.getVar('PN', True)
+                pn = d.getVar('PN')
                 error_msg = "%s: invalid PACKAGECONFIG: %s" % (pn, pconfig)
                 package_qa_handle_error("invalid-packageconfig", error_msg, d)
 
-    qa_sane = d.getVar("QA_SANE", True)
+    qa_sane = d.getVar("QA_SANE")
     if not qa_sane:
         bb.fatal("Fatal QA errors found, failing task.")
 }
 
 python do_qa_unpack() {
-    src_uri = d.getVar('SRC_URI', True)
-    s_dir = d.getVar('S', True)
+    src_uri = d.getVar('SRC_URI')
+    s_dir = d.getVar('S')
     if src_uri and not os.path.exists(s_dir):
-        bb.warn('%s: the directory %s (%s) pointed to by the S variable doesn\'t exist - please set S within the recipe to point to where the source has been unpacked to' % (d.getVar('PN', True), d.getVar('S', False), s_dir))
+        bb.warn('%s: the directory %s (%s) pointed to by the S variable doesn\'t exist - please set S within the recipe to point to where the source has been unpacked to' % (d.getVar('PN'), d.getVar('S', False), s_dir))
 }
 
 # The Staging Func, to check all staging
@@ -1290,7 +1290,7 @@ do_configure[postfuncs] += "do_qa_configure "
 do_unpack[postfuncs] += "do_qa_unpack"
 
 python () {
-    tests = d.getVar('ALL_QA', True).split()
+    tests = d.getVar('ALL_QA').split()
     if "desktop" in tests:
         d.appendVar("PACKAGE_DEPENDS", " desktop-file-utils-native")
 
@@ -1299,7 +1299,7 @@ python () {
     ###########################################################################
 
     # Checking ${FILESEXTRAPATHS}
-    extrapaths = (d.getVar("FILESEXTRAPATHS", True) or "")
+    extrapaths = (d.getVar("FILESEXTRAPATHS") or "")
     if '__default' not in extrapaths.split(":"):
         msg = "FILESEXTRAPATHS-variable, must always use _prepend (or _append)\n"
         msg += "type of assignment, and don't forget the colon.\n"
@@ -1311,29 +1311,29 @@ python () {
         msg += "%s\n" % extrapaths
         bb.warn(msg)
 
-    overrides = d.getVar('OVERRIDES', True).split(':')
-    pn = d.getVar('PN', True)
+    overrides = d.getVar('OVERRIDES').split(':')
+    pn = d.getVar('PN')
     if pn in overrides:
-        msg = 'Recipe %s has PN of "%s" which is in OVERRIDES, this can result in unexpected behaviour.' % (d.getVar("FILE", True), pn)
+        msg = 'Recipe %s has PN of "%s" which is in OVERRIDES, this can result in unexpected behaviour.' % (d.getVar("FILE"), pn)
         package_qa_handle_error("pn-overrides", msg, d)
 
     issues = []
-    if (d.getVar('PACKAGES', True) or "").split():
-        for dep in (d.getVar('QADEPENDS', True) or "").split():
+    if (d.getVar('PACKAGES') or "").split():
+        for dep in (d.getVar('QADEPENDS') or "").split():
             d.appendVarFlag('do_package_qa', 'depends', " %s:do_populate_sysroot" % dep)
         for var in 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RCONFLICTS', 'RPROVIDES', 'RREPLACES', 'FILES', 'pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm', 'ALLOW_EMPTY':
             if d.getVar(var, False):
                 issues.append(var)
 
-        fakeroot_tests = d.getVar('FAKEROOT_QA', True).split()
+        fakeroot_tests = d.getVar('FAKEROOT_QA').split()
         if set(tests) & set(fakeroot_tests):
             d.setVarFlag('do_package_qa', 'fakeroot', '1')
             d.appendVarFlag('do_package_qa', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
     else:
         d.setVarFlag('do_package_qa', 'rdeptask', '')
     for i in issues:
-        package_qa_handle_error("pkgvarcheck", "%s: Variable %s is set as not being package specific, please fix this." % (d.getVar("FILE", True), i), d)
-    qa_sane = d.getVar("QA_SANE", True)
+        package_qa_handle_error("pkgvarcheck", "%s: Variable %s is set as not being package specific, please fix this." % (d.getVar("FILE"), i), d)
+    qa_sane = d.getVar("QA_SANE")
     if not qa_sane:
         bb.fatal("Fatal QA errors found, failing task.")
 }
diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index ea976c6..e09cdc4 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -19,7 +19,7 @@ valid_archs = "alpha cris ia64 \
 def map_kernel_arch(a, d):
     import re
 
-    valid_archs = d.getVar('valid_archs', True).split()
+    valid_archs = d.getVar('valid_archs').split()
 
     if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
     elif re.match('armeb$', a):                 return 'arm'
@@ -34,7 +34,7 @@ def map_kernel_arch(a, d):
     else:
         bb.error("cannot map '%s' to a linux kernel architecture" % a)
 
-export ARCH = "${@map_kernel_arch(d.getVar('TARGET_ARCH', True), d)}"
+export ARCH = "${@map_kernel_arch(d.getVar('TARGET_ARCH'), d)}"
 
 def map_uboot_arch(a, d):
     import re
@@ -43,7 +43,7 @@ def map_uboot_arch(a, d):
     elif re.match('i.86$', a): return 'x86'
     return a
 
-export UBOOT_ARCH = "${@map_uboot_arch(d.getVar('ARCH', True), d)}"
+export UBOOT_ARCH = "${@map_uboot_arch(d.getVar('ARCH'), d)}"
 
 # Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
 # specific options necessary for building the kernel and modules.
diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 8580247..2934b3a 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -1,13 +1,13 @@
 inherit kernel-uboot uboot-sign
 
 python __anonymous () {
-    kerneltypes = d.getVar('KERNEL_IMAGETYPES', True) or ""
+    kerneltypes = d.getVar('KERNEL_IMAGETYPES') or ""
     if 'fitImage' in kerneltypes.split():
-        depends = d.getVar("DEPENDS", True)
+        depends = d.getVar("DEPENDS")
         depends = "%s u-boot-mkimage-native dtc-native" % depends
         d.setVar("DEPENDS", depends)
 
-        if d.getVar("UBOOT_ARCH", True) == "x86":
+        if d.getVar("UBOOT_ARCH") == "x86":
             replacementtype = "bzImage"
         else:
             replacementtype = "zImage"
@@ -15,19 +15,19 @@ python __anonymous () {
 	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
 	# to kernel.bbclass . We have to override it, since we pack zImage
 	# (at least for now) into the fitImage .
-        typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", True) or ""
+        typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
         if 'fitImage' in typeformake.split():
             d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', replacementtype))
 
-        image = d.getVar('INITRAMFS_IMAGE', True)
+        image = d.getVar('INITRAMFS_IMAGE')
         if image:
             d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 
         # Verified boot will sign the fitImage and append the public key to
         # U-boot dtb. We ensure the U-Boot dtb is deployed before assembling
         # the fitImage:
-        if d.getVar('UBOOT_SIGN_ENABLE', True):
-            uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot', True) or 'u-boot'
+        if d.getVar('UBOOT_SIGN_ENABLE'):
+            uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_deploy' % uboot_pn)
 }
 
diff --git a/meta/classes/kernel-grub.bbclass b/meta/classes/kernel-grub.bbclass
index f7dcc07..5d92f3b 100644
--- a/meta/classes/kernel-grub.bbclass
+++ b/meta/classes/kernel-grub.bbclass
@@ -92,7 +92,7 @@ python __anonymous () {
 	fi
 '''
 
-    imagetypes = d.getVar('KERNEL_IMAGETYPES', True)
+    imagetypes = d.getVar('KERNEL_IMAGETYPES')
     imagetypes = re.sub(r'\.gz$', '', imagetypes)
 
     for type in imagetypes.split():
diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 08d2262..efe1b42 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -39,10 +39,10 @@ python split_kernel_module_packages () {
 
     def extract_modinfo(file):
         import tempfile, subprocess
-        tempfile.tempdir = d.getVar("WORKDIR", True)
+        tempfile.tempdir = d.getVar("WORKDIR")
         tf = tempfile.mkstemp()
         tmpfile = tf[1]
-        cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX", True) or "", file, tmpfile)
+        cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX") or "", file, tmpfile)
         subprocess.call(cmd, shell=True)
         f = open(tmpfile)
         l = f.read().split("\000")
@@ -60,12 +60,12 @@ python split_kernel_module_packages () {
     def frob_metadata(file, pkg, pattern, format, basename):
         vals = extract_modinfo(file)
 
-        dvar = d.getVar('PKGD', True)
+        dvar = d.getVar('PKGD')
 
         # If autoloading is requested, output /etc/modules-load.d/<name>.conf and append
         # appropriate modprobe commands to the postinst
-        autoloadlist = (d.getVar("KERNEL_MODULE_AUTOLOAD", True) or "").split()
-        autoload = d.getVar('module_autoload_%s' % basename, True)
+        autoloadlist = (d.getVar("KERNEL_MODULE_AUTOLOAD") or "").split()
+        autoload = d.getVar('module_autoload_%s' % basename)
         if autoload and autoload == basename:
             bb.warn("module_autoload_%s was replaced by KERNEL_MODULE_AUTOLOAD for cases where basename == module name, please drop it" % basename)
         if autoload and basename not in autoloadlist:
@@ -79,15 +79,15 @@ python split_kernel_module_packages () {
             else:
                 f.write('%s\n' % basename)
             f.close()
-            postinst = d.getVar('pkg_postinst_%s' % pkg, True)
+            postinst = d.getVar('pkg_postinst_%s' % pkg)
             if not postinst:
                 bb.fatal("pkg_postinst_%s not defined" % pkg)
-            postinst += d.getVar('autoload_postinst_fragment', True) % (autoload or basename)
+            postinst += d.getVar('autoload_postinst_fragment') % (autoload or basename)
             d.setVar('pkg_postinst_%s' % pkg, postinst)
 
         # Write out any modconf fragment
-        modconflist = (d.getVar("KERNEL_MODULE_PROBECONF", True) or "").split()
-        modconf = d.getVar('module_conf_%s' % basename, True)
+        modconflist = (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()
+        modconf = d.getVar('module_conf_%s' % basename)
         if modconf and basename in modconflist:
             name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
             f = open(name, 'w')
@@ -96,15 +96,15 @@ python split_kernel_module_packages () {
         elif modconf:
             bb.error("Please ensure module %s is listed in KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename, basename))
 
-        files = d.getVar('FILES_%s' % pkg, True)
+        files = d.getVar('FILES_%s' % pkg)
         files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
         d.setVar('FILES_%s' % pkg, files)
 
         if "description" in vals:
-            old_desc = d.getVar('DESCRIPTION_' + pkg, True) or ""
+            old_desc = d.getVar('DESCRIPTION_' + pkg) or ""
             d.setVar('DESCRIPTION_' + pkg, old_desc + "; " + vals["description"])
 
-        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, True) or "")
+        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg) or "")
         modinfo_deps = []
         if "depends" in vals and vals["depends"] != "":
             for dep in vals["depends"].split(","):
@@ -121,24 +121,24 @@ python split_kernel_module_packages () {
 
     module_regex = '^(.*)\.k?o$'
 
-    module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX', True)
+    module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
     module_pattern = module_pattern_prefix + 'kernel-module-%s'
 
-    postinst = d.getVar('pkg_postinst_modules', True)
-    postrm = d.getVar('pkg_postrm_modules', True)
+    postinst = d.getVar('pkg_postinst_modules')
+    postrm = d.getVar('pkg_postrm_modules')
 
-    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
+    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
     if modules:
-        metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE', True)
+        metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
         d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
 
     # If modules-load.d and modprobe.d are empty at this point, remove them to
     # avoid warnings. removedirs only raises an OSError if an empty
     # directory cannot be removed.
-    dvar = d.getVar('PKGD', True)
+    dvar = d.getVar('PKGD')
     for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar), "%s/etc" % (dvar)]:
         if len(os.listdir(dir)) == 0:
             os.rmdir(dir)
 }
 
-do_package[vardeps] += '${@" ".join(map(lambda s: "module_conf_" + s, (d.getVar("KERNEL_MODULE_PROBECONF", True) or "").split()))}'
+do_package[vardeps] += '${@" ".join(map(lambda s: "module_conf_" + s, (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index 340503a..7e7185f 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -1,8 +1,8 @@
 inherit kernel-uboot
 
 python __anonymous () {
-    if "uImage" in (d.getVar('KERNEL_IMAGETYPES', True) or "").split():
-        depends = d.getVar("DEPENDS", True)
+    if "uImage" in (d.getVar('KERNEL_IMAGETYPES') or "").split():
+        depends = d.getVar("DEPENDS")
         depends = "%s u-boot-mkimage-native" % depends
         d.setVar("DEPENDS", depends)
 
@@ -11,8 +11,8 @@ python __anonymous () {
         # to build uImage using the kernel build system if and only if
         # KEEPUIMAGE == yes. Otherwise, we pack compressed vmlinux into
         # the uImage .
-        if d.getVar("KEEPUIMAGE", True) != 'yes':
-            typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", True) or ""
+        if d.getVar("KEEPUIMAGE") != 'yes':
+            typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
             if "uImage" in typeformake.split():
                 d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('uImage', 'vmlinux'))
 }
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 6160a29..6956761 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -284,7 +284,7 @@ python do_kernel_configcheck() {
     if not os.path.exists(kmeta):
         kmeta = "." + kmeta
 
-    pathprefix = "export PATH=%s:%s; " % (d.getVar('PATH', True), "${S}/scripts/util/")
+    pathprefix = "export PATH=%s:%s; " % (d.getVar('PATH'), "${S}/scripts/util/")
 
     cmd = d.expand("scc --configs -o ${S}/.kernel-meta")
     ret, configs = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 25a153c..8c18622 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -22,18 +22,18 @@ INITRAMFS_IMAGE_BUNDLE ?= ""
 # number and cause kernel to be rebuilt. To avoid this, make
 # KERNEL_VERSION_NAME and KERNEL_VERSION_PKG_NAME depend on
 # LINUX_VERSION which is a constant.
-KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION', True) or ""}"
+KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION') or ""}"
 KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
-KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION', True))}"
+KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
 KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
 
 python __anonymous () {
     import re
 
     # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
-    type = d.getVar('KERNEL_IMAGETYPE', True) or ""
-    alttype = d.getVar('KERNEL_ALT_IMAGETYPE', True) or ""
-    types = d.getVar('KERNEL_IMAGETYPES', True) or ""
+    type = d.getVar('KERNEL_IMAGETYPE') or ""
+    alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
+    types = d.getVar('KERNEL_IMAGETYPES') or ""
     if type not in types.split():
         types = (type + ' ' + types).strip()
     if alttype not in types.split():
@@ -56,15 +56,15 @@ python __anonymous () {
 
         d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
 
-        imagedest = d.getVar('KERNEL_IMAGEDEST', True)
-        priority = d.getVar('KERNEL_PRIORITY', True)
+        imagedest = d.getVar('KERNEL_IMAGEDEST')
+        priority = d.getVar('KERNEL_PRIORITY')
         postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
         d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
 
         postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
         d.setVar('pkg_postrm_kernel-image-' + typelower, postrm)
 
-    image = d.getVar('INITRAMFS_IMAGE', True)
+    image = d.getVar('INITRAMFS_IMAGE')
     if image:
         d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 
@@ -72,7 +72,7 @@ python __anonymous () {
     #       The preferred method is to set INITRAMFS_IMAGE, because
     #       this INITRAMFS_TASK has circular dependency problems
     #       if the initramfs requires kernel modules
-    image_task = d.getVar('INITRAMFS_TASK', True)
+    image_task = d.getVar('INITRAMFS_TASK')
     if image_task:
         d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
 }
@@ -101,15 +101,15 @@ inherit ${KERNEL_CLASSES}
 do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
 do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
 base_do_unpack_append () {
-    s = d.getVar("S", True)
+    s = d.getVar("S")
     if s[-1] == '/':
         # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as directory name and fail
         s=s[:-1]
-    kernsrc = d.getVar("STAGING_KERNEL_DIR", True)
+    kernsrc = d.getVar("STAGING_KERNEL_DIR")
     if s != kernsrc:
         bb.utils.mkdirhier(kernsrc)
         bb.utils.remove(kernsrc, recurse=True)
-        if d.getVar("EXTERNALSRC", True):
+        if d.getVar("EXTERNALSRC"):
             # With EXTERNALSRC S will not be wiped so we can symlink to it
             os.symlink(s, kernsrc)
         else:
@@ -127,9 +127,9 @@ PACKAGES_DYNAMIC += "^kernel-firmware-.*"
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 
-KERNEL_PRIORITY ?= "${@int(d.getVar('PV', True).split('-')[0].split('+')[0].split('.')[0]) * 10000 + \
-                       int(d.getVar('PV', True).split('-')[0].split('+')[0].split('.')[1]) * 100 + \
-                       int(d.getVar('PV', True).split('-')[0].split('+')[0].split('.')[-1])}"
+KERNEL_PRIORITY ?= "${@int(d.getVar('PV').split('-')[0].split('+')[0].split('.')[0]) * 10000 + \
+                       int(d.getVar('PV').split('-')[0].split('+')[0].split('.')[1]) * 100 + \
+                       int(d.getVar('PV').split('-')[0].split('+')[0].split('.')[-1])}"
 
 KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 
@@ -140,7 +140,7 @@ KERNEL_IMAGEDEST = "boot"
 #
 # configuration
 #
-export CMDLINE_CONSOLE = "console=${@d.getVar("KERNEL_CONSOLE", True) or "ttyS0"}"
+export CMDLINE_CONSOLE = "console=${@d.getVar("KERNEL_CONSOLE") or "ttyS0"}"
 
 KERNEL_VERSION = "${@get_kernelversion_headers('${B}')}"
 
@@ -435,14 +435,14 @@ sysroot_stage_all () {
 KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} oldnoconfig || yes '' | oe_runmake -C ${S} O=${B} oldconfig"
 
 python check_oldest_kernel() {
-    oldest_kernel = d.getVar('OLDEST_KERNEL', True)
-    kernel_version = d.getVar('KERNEL_VERSION', True)
-    tclibc = d.getVar('TCLIBC', True)
+    oldest_kernel = d.getVar('OLDEST_KERNEL')
+    kernel_version = d.getVar('KERNEL_VERSION')
+    tclibc = d.getVar('TCLIBC')
     if tclibc == 'glibc':
         kernel_version = kernel_version.split('-', 1)[0]
         if oldest_kernel and kernel_version:
             if bb.utils.vercmp_string(kernel_version, oldest_kernel) < 0:
-                bb.warn('%s: OLDEST_KERNEL is "%s" but the version of the kernel you are building is "%s" - therefore %s as built may not be compatible with this kernel. Either set OLDEST_KERNEL to an older version, or build a newer kernel.' % (d.getVar('PN', True), oldest_kernel, kernel_version, tclibc))
+                bb.warn('%s: OLDEST_KERNEL is "%s" but the version of the kernel you are building is "%s" - therefore %s as built may not be compatible with this kernel. Either set OLDEST_KERNEL to an older version, or build a newer kernel.' % (d.getVar('PN'), oldest_kernel, kernel_version, tclibc))
 }
 
 check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index 11b0065..9ea2c03 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -17,15 +17,15 @@ do_install() {
 }
 
 def get_libc_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU', True) in [ 'soft', 'ppc-efd' ]:
+    if d.getVar('TARGET_FPU') in [ 'soft', 'ppc-efd' ]:
         return "--without-fp"
     return ""
 
 python populate_packages_prepend () {
-    if d.getVar('DEBIAN_NAMES', True):
-        pkgs = d.getVar('PACKAGES', True).split()
-        bpn = d.getVar('BPN', True)
-        prefix = d.getVar('MLPREFIX', True) or ""
+    if d.getVar('DEBIAN_NAMES'):
+        pkgs = d.getVar('PACKAGES').split()
+        bpn = d.getVar('BPN')
+        prefix = d.getVar('MLPREFIX') or ""
         # Set the base package...
         d.setVar('PKG_' + prefix + bpn, prefix + 'libc6')
         libcprefix = prefix + bpn + '-'
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 2dc90c4..50a84b4 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -10,24 +10,24 @@
 GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "ondevice"
 
 python __anonymous () {
-    enabled = d.getVar("ENABLE_BINARY_LOCALE_GENERATION", True)
+    enabled = d.getVar("ENABLE_BINARY_LOCALE_GENERATION")
 
-    pn = d.getVar("PN", True)
+    pn = d.getVar("PN")
     if pn.endswith("-initial"):
         enabled = False
 
     if enabled and int(enabled):
         import re
 
-        target_arch = d.getVar("TARGET_ARCH", True)
-        binary_arches = d.getVar("BINARY_LOCALE_ARCHES", True) or ""
-        use_cross_localedef = d.getVar("LOCALE_GENERATION_WITH_CROSS-LOCALEDEF", True) or ""
+        target_arch = d.getVar("TARGET_ARCH")
+        binary_arches = d.getVar("BINARY_LOCALE_ARCHES") or ""
+        use_cross_localedef = d.getVar("LOCALE_GENERATION_WITH_CROSS-LOCALEDEF") or ""
 
         for regexp in binary_arches.split(" "):
             r = re.compile(regexp)
 
             if r.match(target_arch):
-                depends = d.getVar("DEPENDS", True)
+                depends = d.getVar("DEPENDS")
                 if use_cross_localedef == "1" :
                     depends = "%s cross-localedef-native" % depends
                 else:
@@ -92,21 +92,21 @@ inherit qemu
 
 python package_do_split_gconvs () {
     import re
-    if (d.getVar('PACKAGE_NO_GCONV', True) == '1'):
+    if (d.getVar('PACKAGE_NO_GCONV') == '1'):
         bb.note("package requested not splitting gconvs")
         return
 
-    if not d.getVar('PACKAGES', True):
+    if not d.getVar('PACKAGES'):
         return
 
-    mlprefix = d.getVar("MLPREFIX", True) or ""
+    mlprefix = d.getVar("MLPREFIX") or ""
 
-    bpn = d.getVar('BPN', True)
-    libdir = d.getVar('libdir', True)
+    bpn = d.getVar('BPN')
+    libdir = d.getVar('libdir')
     if not libdir:
         bb.error("libdir not defined")
         return
-    datadir = d.getVar('datadir', True)
+    datadir = d.getVar('datadir')
     if not datadir:
         bb.error("datadir not defined")
         return
@@ -114,7 +114,7 @@ python package_do_split_gconvs () {
     gconv_libdir = base_path_join(libdir, "gconv")
     charmap_dir = base_path_join(datadir, "i18n", "charmaps")
     locales_dir = base_path_join(datadir, "i18n", "locales")
-    binary_locales_dir = d.getVar('localedir', True)
+    binary_locales_dir = d.getVar('localedir')
 
     def calc_gconv_deps(fn, pkg, file_regex, output_pattern, group):
         deps = []
@@ -181,13 +181,13 @@ python package_do_split_gconvs () {
         description='locale definition for %s', hook=calc_locale_deps, extra_depends='')
     d.setVar('PACKAGES', d.getVar('PACKAGES', False) + ' ' + d.getVar('MLPREFIX', False) + bpn + '-gconv')
 
-    use_bin = d.getVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", True)
+    use_bin = d.getVar("GLIBC_INTERNAL_USE_BINARY_LOCALE")
 
     dot_re = re.compile("(.*)\.(.*)")
 
     # Read in supported locales and associated encodings
     supported = {}
-    with open(base_path_join(d.getVar('WORKDIR', True), "SUPPORTED")) as f:
+    with open(base_path_join(d.getVar('WORKDIR'), "SUPPORTED")) as f:
         for line in f.readlines():
             try:
                 locale, charset = line.rstrip().split()
@@ -196,7 +196,7 @@ python package_do_split_gconvs () {
             supported[locale] = charset
 
     # GLIBC_GENERATE_LOCALES var specifies which locales to be generated. empty or "all" means all locales
-    to_generate = d.getVar('GLIBC_GENERATE_LOCALES', True)
+    to_generate = d.getVar('GLIBC_GENERATE_LOCALES')
     if not to_generate or to_generate == 'all':
         to_generate = sorted(supported.keys())
     else:
@@ -213,9 +213,9 @@ python package_do_split_gconvs () {
     def output_locale_source(name, pkgname, locale, encoding):
         d.setVar('RDEPENDS_%s' % pkgname, '%slocaledef %s-localedata-%s %s-charmap-%s' % \
         (mlprefix, mlprefix+bpn, legitimize_package_name(locale), mlprefix+bpn, legitimize_package_name(encoding)))
-        d.setVar('pkg_postinst_%s' % pkgname, d.getVar('locale_base_postinst', True) \
+        d.setVar('pkg_postinst_%s' % pkgname, d.getVar('locale_base_postinst') \
         % (locale, encoding, locale))
-        d.setVar('pkg_postrm_%s' % pkgname, d.getVar('locale_base_postrm', True) % \
+        d.setVar('pkg_postrm_%s' % pkgname, d.getVar('locale_base_postrm') % \
         (locale, encoding, locale))
 
     def output_locale_binary_rdepends(name, pkgname, locale, encoding):
@@ -230,16 +230,16 @@ python package_do_split_gconvs () {
     commands = {}
 
     def output_locale_binary(name, pkgname, locale, encoding):
-        treedir = base_path_join(d.getVar("WORKDIR", True), "locale-tree")
-        ldlibdir = base_path_join(treedir, d.getVar("base_libdir", True))
-        path = d.getVar("PATH", True)
+        treedir = base_path_join(d.getVar("WORKDIR"), "locale-tree")
+        ldlibdir = base_path_join(treedir, d.getVar("base_libdir"))
+        path = d.getVar("PATH")
         i18npath = base_path_join(treedir, datadir, "i18n")
         gconvpath = base_path_join(treedir, "iconvdata")
         outputpath = base_path_join(treedir, binary_locales_dir)
 
-        use_cross_localedef = d.getVar("LOCALE_GENERATION_WITH_CROSS-LOCALEDEF", True) or "0"
+        use_cross_localedef = d.getVar("LOCALE_GENERATION_WITH_CROSS-LOCALEDEF") or "0"
         if use_cross_localedef == "1":
-            target_arch = d.getVar('TARGET_ARCH', True)
+            target_arch = d.getVar('TARGET_ARCH')
             locale_arch_options = { \
                 "arm":     " --uint32-align=4 --little-endian ", \
                 "armeb":   " --uint32-align=4 --big-endian ",    \
@@ -278,7 +278,7 @@ python package_do_split_gconvs () {
                 --inputfile=%s/i18n/locales/%s --charmap=%s %s" \
                 % (treedir, datadir, locale, encoding, name)
 
-            qemu_options = d.getVar('QEMU_OPTIONS', True)
+            qemu_options = d.getVar('QEMU_OPTIONS')
 
             cmd = "PSEUDO_RELOADED=YES PATH=\"%s\" I18NPATH=\"%s\" %s -L %s \
                 -E LD_LIBRARY_PATH=%s %s %s/bin/localedef %s" % \
@@ -291,7 +291,7 @@ python package_do_split_gconvs () {
     def output_locale(name, locale, encoding):
         pkgname = d.getVar('MLPREFIX', False) + 'locale-base-' + legitimize_package_name(name)
         d.setVar('ALLOW_EMPTY_%s' % pkgname, '1')
-        d.setVar('PACKAGES', '%s %s' % (pkgname, d.getVar('PACKAGES', True)))
+        d.setVar('PACKAGES', '%s %s' % (pkgname, d.getVar('PACKAGES')))
         rprovides = ' %svirtual-locale-%s' % (mlprefix, legitimize_package_name(name))
         m = re.match("(.*)_(.*)", name)
         if m:
@@ -310,8 +310,8 @@ python package_do_split_gconvs () {
         bb.note("preparing tree for binary locale generation")
         bb.build.exec_func("do_prep_locale_tree", d)
 
-    utf8_only = int(d.getVar('LOCALE_UTF8_ONLY', True) or 0)
-    utf8_is_default = int(d.getVar('LOCALE_UTF8_IS_DEFAULT', True) or 0)
+    utf8_only = int(d.getVar('LOCALE_UTF8_ONLY') or 0)
+    utf8_is_default = int(d.getVar('LOCALE_UTF8_IS_DEFAULT') or 0)
 
     encodings = {}
     for locale in to_generate:
@@ -338,7 +338,7 @@ python package_do_split_gconvs () {
                 output_locale('%s.%s' % (base, charset), base, charset)
 
     if use_bin == "compile":
-        makefile = base_path_join(d.getVar("WORKDIR", True), "locale-tree", "Makefile")
+        makefile = base_path_join(d.getVar("WORKDIR"), "locale-tree", "Makefile")
         m = open(makefile, "w")
         m.write("all: %s\n\n" % " ".join(commands.keys()))
         for cmd in commands:
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index afcfbfc..c5d1204 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -37,13 +37,13 @@ python license_create_manifest() {
     import oe.packagedata
     from oe.rootfs import image_list_installed_packages
 
-    build_images_from_feeds = d.getVar('BUILD_IMAGES_FROM_FEEDS', True)
+    build_images_from_feeds = d.getVar('BUILD_IMAGES_FROM_FEEDS')
     if build_images_from_feeds == "1":
         return 0
 
     pkg_dic = {}
     for pkg in sorted(image_list_installed_packages(d)):
-        pkg_info = os.path.join(d.getVar('PKGDATA_DIR', True),
+        pkg_info = os.path.join(d.getVar('PKGDATA_DIR'),
                                 'runtime-reverse', pkg)
         pkg_name = os.path.basename(os.readlink(pkg_info))
 
@@ -52,15 +52,15 @@ python license_create_manifest() {
             pkg_lic_name = "LICENSE_" + pkg_name
             pkg_dic[pkg_name]["LICENSE"] = pkg_dic[pkg_name][pkg_lic_name]
 
-    rootfs_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
-                        d.getVar('IMAGE_NAME', True), 'license.manifest')
+    rootfs_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+                        d.getVar('IMAGE_NAME'), 'license.manifest')
     write_license_files(d, rootfs_license_manifest, pkg_dic)
 }
 
 def write_license_files(d, license_manifest, pkg_dic):
     import re
 
-    bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE", True) or "").split()
+    bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
     bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
     bad_licenses = expand_wildcard_licenses(d, bad_licenses)
 
@@ -72,7 +72,7 @@ def write_license_files(d, license_manifest, pkg_dic):
                         oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"],
                         bad_licenses, canonical_license, d)
                 except oe.license.LicenseError as exc:
-                    bb.fatal('%s: %s' % (d.getVar('P', True), exc))
+                    bb.fatal('%s: %s' % (d.getVar('P'), exc))
             else:
                 pkg_dic[pkg]["LICENSES"] = re.sub('[|&()*]', ' ', pkg_dic[pkg]["LICENSE"])
                 pkg_dic[pkg]["LICENSES"] = re.sub('  *', ' ', pkg_dic[pkg]["LICENSES"])
@@ -98,7 +98,7 @@ def write_license_files(d, license_manifest, pkg_dic):
                 license_file.write("FILES: %s\n\n" % pkg_dic[pkg]["FILES"])
 
             for lic in pkg_dic[pkg]["LICENSES"]:
-                lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
+                lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY'),
                                         pkg_dic[pkg]["PN"], "generic_%s" % 
                                         re.sub('\+', '', lic))
                 # add explicity avoid of CLOSED license because isn't generic
@@ -114,8 +114,8 @@ def write_license_files(d, license_manifest, pkg_dic):
     # - Just copy the manifest
     # - Copy the manifest and the license directories
     # With both options set we see a .5 M increase in core-image-minimal
-    copy_lic_manifest = d.getVar('COPY_LIC_MANIFEST', True)
-    copy_lic_dirs = d.getVar('COPY_LIC_DIRS', True)
+    copy_lic_manifest = d.getVar('COPY_LIC_MANIFEST')
+    copy_lic_dirs = d.getVar('COPY_LIC_DIRS')
     if copy_lic_manifest == "1":
         rootfs_license_dir = os.path.join(d.getVar('IMAGE_ROOTFS', 'True'), 
                                 'usr', 'share', 'common-licenses')
@@ -129,7 +129,7 @@ def write_license_files(d, license_manifest, pkg_dic):
             for pkg in sorted(pkg_dic):
                 pkg_rootfs_license_dir = os.path.join(rootfs_license_dir, pkg)
                 bb.utils.mkdirhier(pkg_rootfs_license_dir)
-                pkg_license_dir = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
+                pkg_license_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
                                             pkg_dic[pkg]["PN"]) 
                 licenses = os.listdir(pkg_license_dir)
                 for lic in licenses:
@@ -166,7 +166,7 @@ def license_deployed_manifest(d):
 
     dep_dic = {}
     man_dic = {}
-    lic_dir = d.getVar("LICENSE_DIRECTORY", True)
+    lic_dir = d.getVar("LICENSE_DIRECTORY")
 
     dep_dic = get_deployed_dependencies(d)
     for dep in dep_dic.keys():
@@ -181,8 +181,8 @@ def license_deployed_manifest(d):
                 key,val = line.split(": ", 1)
                 man_dic[dep][key] = val[:-1]
 
-    lic_manifest_dir = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
-                                    d.getVar('IMAGE_NAME', True))
+    lic_manifest_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+                                    d.getVar('IMAGE_NAME'))
     bb.utils.mkdirhier(lic_manifest_dir)
     image_license_manifest = os.path.join(lic_manifest_dir, 'image_license.manifest')
     write_license_files(d, image_license_manifest, man_dic)
@@ -202,7 +202,7 @@ def get_deployed_dependencies(d):
     depends = list(set([dep[0] for dep
                     in list(taskdata.values())
                     if not dep[0].endswith("-native")]))
-    extra_depends = d.getVar("EXTRA_IMAGEDEPENDS", True)
+    extra_depends = d.getVar("EXTRA_IMAGEDEPENDS")
     boot_depends = get_boot_dependencies(d)
     depends.extend(extra_depends.split())
     depends.extend(boot_depends)
@@ -212,13 +212,13 @@ def get_deployed_dependencies(d):
     # the SSTATE_MANIFESTS for "deploy" task.
     # The manifest file name contains the arch. Because we are not running
     # in the recipe context it is necessary to check every arch used.
-    sstate_manifest_dir = d.getVar("SSTATE_MANIFESTS", True)
-    sstate_archs = d.getVar("SSTATE_ARCHS", True)
-    extra_archs = d.getVar("PACKAGE_EXTRA_ARCHS", True)
+    sstate_manifest_dir = d.getVar("SSTATE_MANIFESTS")
+    sstate_archs = d.getVar("SSTATE_ARCHS")
+    extra_archs = d.getVar("PACKAGE_EXTRA_ARCHS")
     archs = list(set(("%s %s" % (sstate_archs, extra_archs)).split()))
     for dep in depends:
         # Some recipes have an arch on their own, so we try that first.
-        special_arch = d.getVar("PACKAGE_ARCH_pn-%s" % dep, True)
+        special_arch = d.getVar("PACKAGE_ARCH_pn-%s" % dep)
         if special_arch:
             sstate_manifest_file = os.path.join(sstate_manifest_dir,
                     "manifest-%s-%s.deploy" % (special_arch, dep))
@@ -254,7 +254,7 @@ def get_boot_dependencies(d):
                 in boot_depends_string.split()
                 if not dep.split(":")[0].endswith("-native")]
     for dep in boot_depends:
-        info_file = os.path.join(d.getVar("LICENSE_DIRECTORY", True),
+        info_file = os.path.join(d.getVar("LICENSE_DIRECTORY"),
                 dep, "recipeinfo")
         # If the recipe and dependency name is the same
         if os.path.exists(info_file):
@@ -265,7 +265,7 @@ def get_boot_dependencies(d):
                 # The fifth field contains what the task provides
                 if dep in taskdep[4]:
                     info_file = os.path.join(
-                            d.getVar("LICENSE_DIRECTORY", True),
+                            d.getVar("LICENSE_DIRECTORY"),
                             taskdep[0], "recipeinfo")
                     if os.path.exists(info_file):
                         depends.append(taskdep[0])
@@ -295,7 +295,7 @@ python do_populate_lic() {
     lic_files_paths = find_license_files(d)
 
     # The base directory we wrangle licenses to
-    destdir = os.path.join(d.getVar('LICSSTATEDIR', True), d.getVar('PN', True))
+    destdir = os.path.join(d.getVar('LICSSTATEDIR'), d.getVar('PN'))
     copy_license_files(lic_files_paths, destdir)
     info = get_recipe_info(d)
     with open(os.path.join(destdir, "recipeinfo"), "w") as f:
@@ -306,11 +306,11 @@ python do_populate_lic() {
 # it would be better to copy them in do_install_append, but find_license_filesa is python
 python perform_packagecopy_prepend () {
     enabled = oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
-    if d.getVar('CLASSOVERRIDE', True) == 'class-target' and enabled:
+    if d.getVar('CLASSOVERRIDE') == 'class-target' and enabled:
         lic_files_paths = find_license_files(d)
 
         # LICENSE_FILES_DIRECTORY starts with '/' so os.path.join cannot be used to join D and LICENSE_FILES_DIRECTORY
-        destdir = d.getVar('D', True) + os.path.join(d.getVar('LICENSE_FILES_DIRECTORY', True), d.getVar('PN', True))
+        destdir = d.getVar('D') + os.path.join(d.getVar('LICENSE_FILES_DIRECTORY'), d.getVar('PN'))
         copy_license_files(lic_files_paths, destdir)
         add_package_and_files(d)
 }
@@ -318,15 +318,15 @@ perform_packagecopy[vardeps] += "LICENSE_CREATE_PACKAGE"
 
 def get_recipe_info(d):
     info = {}
-    info["PV"] = d.getVar("PV", True)
-    info["PR"] = d.getVar("PR", True)
-    info["LICENSE"] = d.getVar("LICENSE", True)
+    info["PV"] = d.getVar("PV")
+    info["PR"] = d.getVar("PR")
+    info["LICENSE"] = d.getVar("LICENSE")
     return info
 
 def add_package_and_files(d):
-    packages = d.getVar('PACKAGES', True)
-    files = d.getVar('LICENSE_FILES_DIRECTORY', True)
-    pn = d.getVar('PN', True)
+    packages = d.getVar('PACKAGES')
+    files = d.getVar('LICENSE_FILES_DIRECTORY')
+    pn = d.getVar('PN')
     pn_lic = "%s%s" % (pn, d.getVar('LICENSE_PACKAGE_SUFFIX', False))
     if pn_lic in packages:
         bb.warn("%s package already existed in %s." % (pn_lic, pn))
@@ -334,7 +334,7 @@ def add_package_and_files(d):
         # first in PACKAGES to be sure that nothing else gets LICENSE_FILES_DIRECTORY
         d.setVar('PACKAGES', "%s %s" % (pn_lic, packages))
         d.setVar('FILES_' + pn_lic, files)
-        rrecommends_pn = d.getVar('RRECOMMENDS_' + pn, True)
+        rrecommends_pn = d.getVar('RRECOMMENDS_' + pn)
         if rrecommends_pn:
             d.setVar('RRECOMMENDS_' + pn, "%s %s" % (pn_lic, rrecommends_pn))
         else:
@@ -390,12 +390,12 @@ def find_license_files(d):
     from collections import defaultdict, OrderedDict
 
     # All the license files for the package
-    lic_files = d.getVar('LIC_FILES_CHKSUM', True) or ""
-    pn = d.getVar('PN', True)
+    lic_files = d.getVar('LIC_FILES_CHKSUM') or ""
+    pn = d.getVar('PN')
     # The license files are located in S/LIC_FILE_CHECKSUM.
-    srcdir = d.getVar('S', True)
+    srcdir = d.getVar('S')
     # Directory we store the generic licenses as set in the distro configuration
-    generic_directory = d.getVar('COMMON_LICENSE_DIR', True)
+    generic_directory = d.getVar('COMMON_LICENSE_DIR')
     # List of basename, path tuples
     lic_files_paths = []
     # Entries from LIC_FILES_CHKSUM
@@ -403,7 +403,7 @@ def find_license_files(d):
     license_source_dirs = []
     license_source_dirs.append(generic_directory)
     try:
-        additional_lic_dirs = d.getVar('LICENSE_PATH', True).split()
+        additional_lic_dirs = d.getVar('LICENSE_PATH').split()
         for lic_dir in additional_lic_dirs:
             license_source_dirs.append(lic_dir)
     except:
@@ -473,18 +473,18 @@ def find_license_files(d):
         try:
             (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
         except bb.fetch.MalformedUrl:
-            bb.fatal("%s: LIC_FILES_CHKSUM contains an invalid URL:  %s" % (d.getVar('PF', True), url))
+            bb.fatal("%s: LIC_FILES_CHKSUM contains an invalid URL:  %s" % (d.getVar('PF'), url))
         # We want the license filename and path
         chksum = parm['md5'] if 'md5' in parm else parm['sha256']
         lic_chksums[path] = chksum
 
     v = FindVisitor()
     try:
-        v.visit_string(d.getVar('LICENSE', True))
+        v.visit_string(d.getVar('LICENSE'))
     except oe.license.InvalidLicense as exc:
-        bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
+        bb.fatal('%s: %s' % (d.getVar('PF'), exc))
     except SyntaxError:
-        bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('PF', True)))
+        bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('PF')))
 
     # Add files from LIC_FILES_CHKSUM to list of license files
     lic_chksum_paths = defaultdict(OrderedDict)
@@ -542,7 +542,7 @@ def expand_wildcard_licenses(d, wildcard_licenses):
 
 def incompatible_license_contains(license, truevalue, falsevalue, d):
     license = canonical_license(d, license)
-    bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE', True) or "").split()
+    bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
     bad_licenses = expand_wildcard_licenses(d, bad_licenses)
     return truevalue if license in bad_licenses else falsevalue
 
@@ -553,9 +553,9 @@ def incompatible_license(d, dont_want_licenses, package=None):
     as canonical (SPDX) names.
     """
     import oe.license
-    license = d.getVar("LICENSE_%s" % package, True) if package else None
+    license = d.getVar("LICENSE_%s" % package) if package else None
     if not license:
-        license = d.getVar('LICENSE', True)
+        license = d.getVar('LICENSE')
 
     # Handles an "or" or two license sets provided by
     # flattened_licenses(), pick one that works if possible.
@@ -566,7 +566,7 @@ def incompatible_license(d, dont_want_licenses, package=None):
     try:
         licenses = oe.license.flattened_licenses(license, choose_lic_set)
     except oe.license.LicenseError as exc:
-        bb.fatal('%s: %s' % (d.getVar('P', True), exc))
+        bb.fatal('%s: %s' % (d.getVar('P'), exc))
     return any(not oe.license.license_ok(canonical_license(d, l), \
 		dont_want_licenses) for l in licenses)
 
@@ -614,16 +614,16 @@ def check_license_flags(d):
 
     def all_license_flags_match(license_flags, whitelist):
         """ Return first unmatched flag, None if all flags match """
-        pn = d.getVar('PN', True)
+        pn = d.getVar('PN')
         split_whitelist = whitelist.split()
         for flag in license_flags.split():
             if not license_flag_matches(flag, split_whitelist, pn):
                 return flag
         return None
 
-    license_flags = d.getVar('LICENSE_FLAGS', True)
+    license_flags = d.getVar('LICENSE_FLAGS')
     if license_flags:
-        whitelist = d.getVar('LICENSE_FLAGS_WHITELIST', True)
+        whitelist = d.getVar('LICENSE_FLAGS_WHITELIST')
         if not whitelist:
             return license_flags
         unmatched_flag = all_license_flags_match(license_flags, whitelist)
@@ -637,8 +637,8 @@ def check_license_format(d):
         Validate operators in LICENSES.
         No spaces are allowed between LICENSES.
     """
-    pn = d.getVar('PN', True)
-    licenses = d.getVar('LICENSE', True)
+    pn = d.getVar('PN')
+    licenses = d.getVar('LICENSE')
     from oe.license import license_operator, license_operator_chars, license_pattern
 
     elements = list(filter(lambda x: x.strip(), license_operator.split(licenses)))
diff --git a/meta/classes/live-vm-common.bbclass b/meta/classes/live-vm-common.bbclass
index 734697f..27b137d 100644
--- a/meta/classes/live-vm-common.bbclass
+++ b/meta/classes/live-vm-common.bbclass
@@ -4,11 +4,11 @@ def set_live_vm_vars(d, suffix):
     vars = ['GRUB_CFG', 'SYSLINUX_CFG', 'ROOT', 'LABELS', 'INITRD']
     for var in vars:
         var_with_suffix = var + '_' + suffix
-        if d.getVar(var, True):
+        if d.getVar(var):
             bb.warn('Found potential conflicted var %s, please use %s rather than %s' % \
                 (var, var_with_suffix, var))
-        elif d.getVar(var_with_suffix, True):
-            d.setVar(var, d.getVar(var_with_suffix, True))
+        elif d.getVar(var_with_suffix):
+            d.setVar(var, d.getVar(var_with_suffix))
 
 
 EFI = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
@@ -25,7 +25,7 @@ def pcbios(d):
     return pcbios
 
 PCBIOS = "${@pcbios(d)}"
-PCBIOS_CLASS = "${@['','syslinux'][d.getVar('PCBIOS', True) == '1']}"
+PCBIOS_CLASS = "${@['','syslinux'][d.getVar('PCBIOS') == '1']}"
 
 inherit ${EFI_CLASS}
 inherit ${PCBIOS_CLASS}
diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 2e6fac2..fa791f0 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -26,7 +26,7 @@ def base_detect_branch(d):
     return "<unknown>"
 
 def base_get_scmbasepath(d):
-    return os.path.join(d.getVar('COREBASE', True), 'meta')
+    return os.path.join(d.getVar('COREBASE'), 'meta')
 
 def base_get_metadata_monotone_branch(path, d):
     monotone_branch = "<unknown>"
diff --git a/meta/classes/migrate_localcount.bbclass b/meta/classes/migrate_localcount.bbclass
index aa0df8b..810a541 100644
--- a/meta/classes/migrate_localcount.bbclass
+++ b/meta/classes/migrate_localcount.bbclass
@@ -6,12 +6,12 @@ python migrate_localcount_handler () {
     if not e.data:
         return
 
-    pv = e.data.getVar('PV', True)
+    pv = e.data.getVar('PV')
     if not 'AUTOINC' in pv:
         return
 
     localcounts = bb.persist_data.persist('BB_URI_LOCALCOUNT', e.data)
-    pn = e.data.getVar('PN', True)
+    pn = e.data.getVar('PN')
     revs = localcounts.get_by_pattern('%%-%s_rev' % pn)
     counts = localcounts.get_by_pattern('%%-%s_count' % pn)
     if not revs or not counts:
@@ -21,10 +21,10 @@ python migrate_localcount_handler () {
         bb.warn("The number of revs and localcounts don't match in %s" % pn)
         return
 
-    version = e.data.getVar('PRAUTOINX', True)
+    version = e.data.getVar('PRAUTOINX')
     srcrev = bb.fetch2.get_srcrev(e.data)
     base_ver = 'AUTOINC-%s' % version[:version.find(srcrev)]
-    pkgarch = e.data.getVar('PACKAGE_ARCH', True)
+    pkgarch = e.data.getVar('PACKAGE_ARCH')
     value = max(int(count) for count in counts)
 
     if len(revs) == 1:
@@ -33,8 +33,8 @@ python migrate_localcount_handler () {
     else:
         value += 1
 
-    bb.utils.mkdirhier(e.data.getVar('PRSERV_DUMPDIR', True))
-    df = e.data.getVar('LOCALCOUNT_DUMPFILE', True)
+    bb.utils.mkdirhier(e.data.getVar('PRSERV_DUMPDIR'))
+    df = e.data.getVar('LOCALCOUNT_DUMPFILE')
     flock = bb.utils.lockfile("%s.lock" % df)
     with open(df, 'a') as fd:
         fd.write('PRAUTO$%s$%s$%s = "%s"\n' %
diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index 721c73f..6cd59af 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -28,8 +28,8 @@ fi
 
 python populate_packages_append () {
     import re
-    packages = d.getVar('PACKAGES', True).split()
-    pkgdest =  d.getVar('PKGDEST', True)
+    packages = d.getVar('PACKAGES').split()
+    pkgdest =  d.getVar('PKGDEST')
 
     for pkg in packages:
         mime_dir = '%s/%s/usr/share/mime/packages' % (pkgdest, pkg)
@@ -41,15 +41,15 @@ python populate_packages_append () {
                     mimes.append(f)
         if mimes:
             bb.note("adding mime postinst and postrm scripts to %s" % pkg)
-            postinst = d.getVar('pkg_postinst_%s' % pkg, True)
+            postinst = d.getVar('pkg_postinst_%s' % pkg)
             if not postinst:
                 postinst = '#!/bin/sh\n'
-            postinst += d.getVar('mime_postinst', True)
+            postinst += d.getVar('mime_postinst')
             d.setVar('pkg_postinst_%s' % pkg, postinst)
-            postrm = d.getVar('pkg_postrm_%s' % pkg, True)
+            postrm = d.getVar('pkg_postrm_%s' % pkg)
             if not postrm:
                 postrm = '#!/bin/sh\n'
-            postrm += d.getVar('mime_postrm', True)
+            postrm += d.getVar('mime_postrm')
             d.setVar('pkg_postrm_%s' % pkg, postrm)
             bb.note("adding shared-mime-info-data dependency to %s" % pkg)
             d.appendVar('RDEPENDS_' + pkg, " shared-mime-info-data")
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 68e3d34..95d42da 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -9,7 +9,7 @@ EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
 MODULES_INSTALL_TARGET ?= "modules_install"
 
 python __anonymous () {
-    depends = d.getVar('DEPENDS', True)
+    depends = d.getVar('DEPENDS')
     extra_symbols = []
     for dep in depends.split():
         if dep.startswith("kernel-module-"):
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index d5a3128..498f7f5 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -1,20 +1,20 @@
 python multilib_virtclass_handler () {
-    cls = e.data.getVar("BBEXTENDCURR", True)
-    variant = e.data.getVar("BBEXTENDVARIANT", True)
+    cls = e.data.getVar("BBEXTENDCURR")
+    variant = e.data.getVar("BBEXTENDVARIANT")
     if cls != "multilib" or not variant:
         return
 
-    e.data.setVar('STAGING_KERNEL_DIR', e.data.getVar('STAGING_KERNEL_DIR', True))
+    e.data.setVar('STAGING_KERNEL_DIR', e.data.getVar('STAGING_KERNEL_DIR'))
 
     # There should only be one kernel in multilib configs
     # We also skip multilib setup for module packages.
-    provides = (e.data.getVar("PROVIDES", True) or "").split()
+    provides = (e.data.getVar("PROVIDES") or "").split()
     if "virtual/kernel" in provides or bb.data.inherits_class('module-base', e.data):
         raise bb.parse.SkipPackage("We shouldn't have multilib variants for the kernel")
 
-    save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME", True) or ""
+    save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME") or ""
     for name in save_var_name.split():
-        val=e.data.getVar(name, True)
+        val=e.data.getVar(name)
         if val:
             e.data.setVar(name + "_MULTILIB_ORIGINAL", val)
 
@@ -26,7 +26,7 @@ python multilib_virtclass_handler () {
     if bb.data.inherits_class('image', e.data):
         e.data.setVar("MLPREFIX", variant + "-")
         e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
-        e.data.setVar('SDKTARGETSYSROOT', e.data.getVar('SDKTARGETSYSROOT', True))
+        e.data.setVar('SDKTARGETSYSROOT', e.data.getVar('SDKTARGETSYSROOT'))
         target_vendor = e.data.getVar("TARGET_VENDOR_" + "virtclass-multilib-" + variant, False)
         if target_vendor:
             e.data.setVar("TARGET_VENDOR", target_vendor)
@@ -50,7 +50,7 @@ python multilib_virtclass_handler () {
 
 
     # Expand this since this won't work correctly once we set a multilib into place
-    e.data.setVar("ALL_MULTILIB_PACKAGE_ARCHS", e.data.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True))
+    e.data.setVar("ALL_MULTILIB_PACKAGE_ARCHS", e.data.getVar("ALL_MULTILIB_PACKAGE_ARCHS"))
  
     override = ":virtclass-multilib-" + variant
 
@@ -60,7 +60,7 @@ python multilib_virtclass_handler () {
 
     # Expand the WHITELISTs with multilib prefix
     for whitelist in ["WHITELIST_GPL-3.0", "LGPLv2_WHITELIST_GPL-3.0"]:
-        pkgs = e.data.getVar(whitelist, True)
+        pkgs = e.data.getVar(whitelist)
         for pkg in pkgs.split():
             pkgs += " " + variant + "-" + pkg
         e.data.setVar(whitelist, pkgs)
@@ -78,7 +78,7 @@ multilib_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
 STAGINGCC_prepend = "${BBEXTENDVARIANT}-"
 
 python __anonymous () {
-    variant = d.getVar("BBEXTENDVARIANT", True)
+    variant = d.getVar("BBEXTENDVARIANT")
 
     import oe.classextend
 
@@ -88,7 +88,7 @@ python __anonymous () {
         clsextend.map_depends_variable("PACKAGE_INSTALL")
         clsextend.map_depends_variable("LINGUAS_INSTALL")
         clsextend.map_depends_variable("RDEPENDS")
-        pinstall = d.getVar("LINGUAS_INSTALL", True) + " " + d.getVar("PACKAGE_INSTALL", True)
+        pinstall = d.getVar("LINGUAS_INSTALL") + " " + d.getVar("PACKAGE_INSTALL")
         d.setVar("PACKAGE_INSTALL", pinstall)
         d.setVar("LINGUAS_INSTALL", "")
         # FIXME, we need to map this to something, not delete it!
@@ -104,7 +104,7 @@ python __anonymous () {
         return
 
     clsextend.rename_packages()
-    clsextend.rename_package_variables((d.getVar("PACKAGEVARS", True) or "").split())
+    clsextend.rename_package_variables((d.getVar("PACKAGEVARS") or "").split())
 
     clsextend.map_packagevars()
     clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
@@ -119,7 +119,7 @@ PACKAGEFUNCS_append = " do_package_qa_multilib"
 python do_package_qa_multilib() {
 
     def check_mlprefix(pkg, var, mlprefix):
-        values = bb.utils.explode_deps(d.getVar('%s_%s' % (var, pkg), True) or d.getVar(var, True) or "")
+        values = bb.utils.explode_deps(d.getVar('%s_%s' % (var, pkg), True) or d.getVar(var) or "")
         candidates = []
         for i in values:
             if i.startswith('virtual/'):
@@ -130,14 +130,14 @@ python do_package_qa_multilib() {
                 candidates.append(i)
         if len(candidates) > 0:
             msg = "%s package %s - suspicious values '%s' in %s" \
-                   % (d.getVar('PN', True), pkg, ' '.join(candidates), var)
+                   % (d.getVar('PN'), pkg, ' '.join(candidates), var)
             package_qa_handle_error("multilib", msg, d)
 
-    ml = d.getVar('MLPREFIX', True)
+    ml = d.getVar('MLPREFIX')
     if not ml:
         return
 
-    packages = d.getVar('PACKAGES', True)
+    packages = d.getVar('PACKAGES')
     for pkg in packages.split():
         check_mlprefix(pkg, 'RDEPENDS', ml)
         check_mlprefix(pkg, 'RPROVIDES', ml)
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 11ae268..aba0371 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -1,7 +1,7 @@
 def preferred_ml_updates(d):
     # If any PREFERRED_PROVIDER or PREFERRED_VERSION are set,
     # we need to mirror these variables in the multilib case;
-    multilibs = d.getVar('MULTILIBS', True) or ""
+    multilibs = d.getVar('MULTILIBS') or ""
     if not multilibs:
         return
 
@@ -102,7 +102,7 @@ def preferred_ml_updates(d):
         prov = prov.replace("virtual/", "")
         return "virtual/" + prefix + "-" + prov
 
-    mp = (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
+    mp = (d.getVar("MULTI_PROVIDER_WHITELIST") or "").split()
     extramp = []
     for p in mp:
         if p.endswith("-native") or "-crosssdk-" in p or p.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in p:
@@ -111,14 +111,14 @@ def preferred_ml_updates(d):
             extramp.append(translate_provide(pref, p))
     d.setVar("MULTI_PROVIDER_WHITELIST", " ".join(mp + extramp))
 
-    abisafe = (d.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE", True) or "").split()
+    abisafe = (d.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE") or "").split()
     extras = []
     for p in prefixes:
         for a in abisafe:
             extras.append(p + "-" + a)
     d.appendVar("SIGGEN_EXCLUDERECIPES_ABISAFE", " " + " ".join(extras))
 
-    siggen_exclude = (d.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", True) or "").split()
+    siggen_exclude = (d.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS") or "").split()
     extras = []
     for p in prefixes:
         for a in siggen_exclude:
@@ -128,7 +128,7 @@ def preferred_ml_updates(d):
 
 python multilib_virtclass_handler_vendor () {
     if isinstance(e, bb.event.ConfigParsed):
-        for v in e.data.getVar("MULTILIB_VARIANTS", True).split():
+        for v in e.data.getVar("MULTILIB_VARIANTS").split():
             if e.data.getVar("TARGET_VENDOR_virtclass-multilib-" + v, False) is None:
                 e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + v, e.data.getVar("TARGET_VENDOR", False) + "ml" + v)
         preferred_ml_updates(e.data)
@@ -140,14 +140,14 @@ python multilib_virtclass_handler_global () {
     if not e.data:
         return
 
-    variant = e.data.getVar("BBEXTENDVARIANT", True)
+    variant = e.data.getVar("BBEXTENDVARIANT")
 
     if isinstance(e, bb.event.RecipeParsed) and not variant:
         if bb.data.inherits_class('kernel', e.data) or \
             bb.data.inherits_class('module-base', e.data) or \
             (bb.data.inherits_class('allarch', e.data) and\
              not bb.data.inherits_class('packagegroup', e.data)):
-            variants = (e.data.getVar("MULTILIB_VARIANTS", True) or "").split()
+            variants = (e.data.getVar("MULTILIB_VARIANTS") or "").split()
 
             import oe.classextend
             clsextends = []
@@ -155,21 +155,21 @@ python multilib_virtclass_handler_global () {
                 clsextends.append(oe.classextend.ClassExtender(variant, e.data))
 
             # Process PROVIDES
-            origprovs = provs = e.data.getVar("PROVIDES", True) or ""
+            origprovs = provs = e.data.getVar("PROVIDES") or ""
             for clsextend in clsextends:
                 provs = provs + " " + clsextend.map_variable("PROVIDES", setvar=False)
             e.data.setVar("PROVIDES", provs)
 
             # Process RPROVIDES
-            origrprovs = rprovs = e.data.getVar("RPROVIDES", True) or ""
+            origrprovs = rprovs = e.data.getVar("RPROVIDES") or ""
             for clsextend in clsextends:
                 rprovs = rprovs + " " + clsextend.map_variable("RPROVIDES", setvar=False)
             if rprovs.strip():
                 e.data.setVar("RPROVIDES", rprovs)
 
 	    # Process RPROVIDES_${PN}...
-            for pkg in (e.data.getVar("PACKAGES", True) or "").split():
-                origrprovs = rprovs = e.data.getVar("RPROVIDES_%s" % pkg, True) or ""
+            for pkg in (e.data.getVar("PACKAGES") or "").split():
+                origrprovs = rprovs = e.data.getVar("RPROVIDES_%s" % pkg) or ""
                 for clsextend in clsextends:
                     rprovs = rprovs + " " + clsextend.map_variable("RPROVIDES_%s" % pkg, setvar=False)
                     rprovs = rprovs + " " + clsextend.extname + "-" + pkg
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 143f8a9..5592e1d 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -116,18 +116,18 @@ MACHINEOVERRIDES = ""
 PATH_prepend = "${COREBASE}/scripts/native-intercept:"
 
 python native_virtclass_handler () {
-    classextend = e.data.getVar('BBCLASSEXTEND', True) or ""
+    classextend = e.data.getVar('BBCLASSEXTEND') or ""
     if "native" not in classextend:
         return
 
-    pn = e.data.getVar("PN", True)
+    pn = e.data.getVar("PN")
     if not pn.endswith("-native"):
         return
 
     def map_dependencies(varname, d, suffix = ""):
         if suffix:
             varname = varname + "_" + suffix
-        deps = d.getVar(varname, True)
+        deps = d.getVar(varname)
         if not deps:
             return
         deps = bb.utils.explode_deps(deps)
@@ -146,14 +146,14 @@ python native_virtclass_handler () {
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-native")
 
     map_dependencies("DEPENDS", e.data)
-    for pkg in [e.data.getVar("PN", True), "", "${PN}"]:
+    for pkg in [e.data.getVar("PN"), "", "${PN}"]:
         map_dependencies("RDEPENDS", e.data, pkg)
         map_dependencies("RRECOMMENDS", e.data, pkg)
         map_dependencies("RSUGGESTS", e.data, pkg)
         map_dependencies("RPROVIDES", e.data, pkg)
         map_dependencies("RREPLACES", e.data, pkg)
 
-    provides = e.data.getVar("PROVIDES", True)
+    provides = e.data.getVar("PROVIDES")
     nprovides = []
     for prov in provides.split():
         if prov.find(pn) != -1:
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 31dde4a..2ac8fd8 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -64,17 +64,17 @@ export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${libdir}/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 
 python nativesdk_virtclass_handler () {
-    pn = e.data.getVar("PN", True)
+    pn = e.data.getVar("PN")
     if not (pn.endswith("-nativesdk") or pn.startswith("nativesdk-")):
         return
 
     e.data.setVar("MLPREFIX", "nativesdk-")
-    e.data.setVar("PN", "nativesdk-" + e.data.getVar("PN", True).replace("-nativesdk", "").replace("nativesdk-", ""))
+    e.data.setVar("PN", "nativesdk-" + e.data.getVar("PN").replace("-nativesdk", "").replace("nativesdk-", ""))
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-nativesdk")
 }
 
 python () {
-    pn = d.getVar("PN", True)
+    pn = d.getVar("PN")
     if not pn.startswith("nativesdk-"):
         return
 
@@ -82,7 +82,7 @@ python () {
 
     clsextend = oe.classextend.NativesdkClassExtender("nativesdk", d)
     clsextend.rename_packages()
-    clsextend.rename_package_variables((d.getVar("PACKAGEVARS", True) or "").split())
+    clsextend.rename_package_variables((d.getVar("PACKAGEVARS") or "").split())
 
     clsextend.map_depends_variable("DEPENDS")
     clsextend.map_packagevars()
diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 43228c5..1c778a7 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -13,7 +13,7 @@ def npm_oe_arch_map(target_arch, d):
     elif re.match('arm64$', target_arch): return 'arm'
     return target_arch
 
-NPM_ARCH ?= "${@npm_oe_arch_map(d.getVar('TARGET_ARCH', True), d)}"
+NPM_ARCH ?= "${@npm_oe_arch_map(d.getVar('TARGET_ARCH'), d)}"
 
 npm_do_compile() {
 	# Copy in any additionally fetched modules
@@ -59,7 +59,7 @@ python populate_packages_prepend () {
             description = pdata.get('description', None)
             if description:
                 d.setVar('SUMMARY_%s' % expanded_pkgname, description.replace(u"\u2018", "'").replace(u"\u2019", "'"))
-    d.appendVar('RDEPENDS_%s' % d.getVar('PN', True), ' %s' % ' '.join(pkgnames).replace('_', '-'))
+    d.appendVar('RDEPENDS_%s' % d.getVar('PN'), ' %s' % ' '.join(pkgnames).replace('_', '-'))
 }
 
 FILES_${PN} += " \
diff --git a/meta/classes/oelint.bbclass b/meta/classes/oelint.bbclass
index c4febc2..2589d340 100644
--- a/meta/classes/oelint.bbclass
+++ b/meta/classes/oelint.bbclass
@@ -1,7 +1,7 @@
 addtask lint before do_build
 do_lint[nostamp] = "1"
 python do_lint() {
-    pkgname = d.getVar("PN", True)
+    pkgname = d.getVar("PN")
 
     ##############################
     # Test that DESCRIPTION exists
@@ -35,7 +35,7 @@ python do_lint() {
     # Check that all patches have Signed-off-by and Upstream-Status
     #
     srcuri = d.getVar("SRC_URI", False).split()
-    fpaths = (d.getVar('FILESPATH', True) or '').split(':')
+    fpaths = (d.getVar('FILESPATH') or '').split(':')
 
     def findPatch(patchname):
         for dir in fpaths:
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a6f0a7a..2703465 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -120,7 +120,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
 
     """
 
-    dvar = d.getVar('PKGD', True)
+    dvar = d.getVar('PKGD')
     root = d.expand(root)
     output_pattern = d.expand(output_pattern)
     extra_depends = d.expand(extra_depends)
@@ -130,7 +130,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
     if not os.path.exists(dvar + root):
         return []
 
-    ml = d.getVar("MLPREFIX", True)
+    ml = d.getVar("MLPREFIX")
     if ml:
         if not output_pattern.startswith(ml):
             output_pattern = ml + output_pattern
@@ -145,7 +145,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
             extra_depends = " ".join(newdeps)
 
 
-    packages = d.getVar('PACKAGES', True).split()
+    packages = d.getVar('PACKAGES').split()
     split_packages = set()
 
     if postinst:
@@ -163,7 +163,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
                     objs.append(relpath)
 
     if extra_depends == None:
-        extra_depends = d.getVar("PN", True)
+        extra_depends = d.getVar("PN")
 
     if not summary:
         summary = description
@@ -189,7 +189,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
                 packages = [pkg] + packages
             else:
                 packages.append(pkg)
-        oldfiles = d.getVar('FILES_' + pkg, True)
+        oldfiles = d.getVar('FILES_' + pkg)
         newfile = os.path.join(root, o)
         # These names will be passed through glob() so if the filename actually
         # contains * or ? (rare, but possible) we need to handle that specially
@@ -214,9 +214,9 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
             d.setVar('FILES_' + pkg, oldfiles + " " + newfile)
         if extra_depends != '':
             d.appendVar('RDEPENDS_' + pkg, ' ' + extra_depends)
-        if not d.getVar('DESCRIPTION_' + pkg, True):
+        if not d.getVar('DESCRIPTION_' + pkg):
             d.setVar('DESCRIPTION_' + pkg, description % on)
-        if not d.getVar('SUMMARY_' + pkg, True):
+        if not d.getVar('SUMMARY_' + pkg):
             d.setVar('SUMMARY_' + pkg, summary % on)
         if postinst:
             d.setVar('pkg_postinst_' + pkg, postinst)
@@ -231,9 +231,9 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
 PACKAGE_DEPENDS += "file-native"
 
 python () {
-    if d.getVar('PACKAGES', True) != '':
+    if d.getVar('PACKAGES') != '':
         deps = ""
-        for dep in (d.getVar('PACKAGE_DEPENDS', True) or "").split():
+        for dep in (d.getVar('PACKAGE_DEPENDS') or "").split():
             deps += " %s:do_populate_sysroot" % dep
         d.appendVarFlag('do_package', 'depends', deps)
 
@@ -286,14 +286,14 @@ def files_from_filevars(filevars):
 
 # Called in package_<rpm,ipk,deb>.bbclass to get the correct list of configuration files
 def get_conffiles(pkg, d):
-    pkgdest = d.getVar('PKGDEST', True)
+    pkgdest = d.getVar('PKGDEST')
     root = os.path.join(pkgdest, pkg)
     cwd = os.getcwd()
     os.chdir(root)
 
-    conffiles = d.getVar('CONFFILES_%s' % pkg, True);
+    conffiles = d.getVar('CONFFILES_%s' % pkg);
     if conffiles == None:
-        conffiles = d.getVar('CONFFILES', True)
+        conffiles = d.getVar('CONFFILES')
     if conffiles == None:
         conffiles = ""
     conffiles = conffiles.split()
@@ -318,7 +318,7 @@ def get_conffiles(pkg, d):
     return conf_list
 
 def checkbuildpath(file, d):
-    tmpdir = d.getVar('TMPDIR', True)
+    tmpdir = d.getVar('TMPDIR')
     with open(file) as f:
         file_content = f.read()
         if tmpdir in file_content:
@@ -335,8 +335,8 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
 
     import stat
 
-    dvar = d.getVar('PKGD', True)
-    objcopy = d.getVar("OBJCOPY", True)
+    dvar = d.getVar('PKGD')
+    objcopy = d.getVar("OBJCOPY")
     debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
 
     # We ignore kernel modules, we don't generate debug info files.
@@ -382,11 +382,11 @@ def copydebugsources(debugsrcdir, d):
 
     sourcefile = d.expand("${WORKDIR}/debugsources.list")
     if debugsrcdir and os.path.isfile(sourcefile):
-        dvar = d.getVar('PKGD', True)
-        strip = d.getVar("STRIP", True)
-        objcopy = d.getVar("OBJCOPY", True)
+        dvar = d.getVar('PKGD')
+        strip = d.getVar("STRIP")
+        objcopy = d.getVar("OBJCOPY")
         debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
-        workdir = d.getVar("WORKDIR", True)
+        workdir = d.getVar("WORKDIR")
         workparentdir = os.path.dirname(os.path.dirname(workdir))
         workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
 
@@ -468,20 +468,20 @@ def get_package_additional_metadata (pkg_type, d):
         return "\n".join(metadata_fields).strip()
 
 def runtime_mapping_rename (varname, pkg, d):
-    #bb.note("%s before: %s" % (varname, d.getVar(varname, True)))
+    #bb.note("%s before: %s" % (varname, d.getVar(varname)))
 
     if bb.data.inherits_class('packagegroup', d):
         return
 
     new_depends = {}
-    deps = bb.utils.explode_dep_versions2(d.getVar(varname, True) or "")
+    deps = bb.utils.explode_dep_versions2(d.getVar(varname) or "")
     for depend in deps:
         new_depend = get_package_mapping(depend, pkg, d)
         new_depends[new_depend] = deps[depend]
 
     d.setVar(varname, bb.utils.join_deps(new_depends, commasep=False))
 
-    #bb.note("%s after: %s" % (varname, d.getVar(varname, True)))
+    #bb.note("%s after: %s" % (varname, d.getVar(varname)))
 
 #
 # Package functions suitable for inclusion in PACKAGEFUNCS
@@ -492,34 +492,34 @@ python package_get_auto_pr() {
     import re
 
     # Support per recipe PRSERV_HOST
-    pn = d.getVar('PN', True)
-    host = d.getVar("PRSERV_HOST_" + pn, True)
+    pn = d.getVar('PN')
+    host = d.getVar("PRSERV_HOST_" + pn)
     if not (host is None):
         d.setVar("PRSERV_HOST", host)
 
-    pkgv = d.getVar("PKGV", True)
+    pkgv = d.getVar("PKGV")
 
     # PR Server not active, handle AUTOINC
-    if not d.getVar('PRSERV_HOST', True):
+    if not d.getVar('PRSERV_HOST'):
         if 'AUTOINC' in pkgv:
             d.setVar("PKGV", pkgv.replace("AUTOINC", "0"))
         return
 
     auto_pr = None
-    pv = d.getVar("PV", True)
-    version = d.getVar("PRAUTOINX", True)
-    pkgarch = d.getVar("PACKAGE_ARCH", True)
-    checksum = d.getVar("BB_TASKHASH", True)
+    pv = d.getVar("PV")
+    version = d.getVar("PRAUTOINX")
+    pkgarch = d.getVar("PACKAGE_ARCH")
+    checksum = d.getVar("BB_TASKHASH")
 
-    if d.getVar('PRSERV_LOCKDOWN', True):
-        auto_pr = d.getVar('PRAUTO_' + version + '_' + pkgarch, True) or d.getVar('PRAUTO_' + version, True) or None
+    if d.getVar('PRSERV_LOCKDOWN'):
+        auto_pr = d.getVar('PRAUTO_' + version + '_' + pkgarch) or d.getVar('PRAUTO_' + version) or None
         if auto_pr is None:
             bb.fatal("Can NOT get PRAUTO from lockdown exported file")
         d.setVar('PRAUTO',str(auto_pr))
         return
 
     try:
-        conn = d.getVar("__PRSERV_CONN", True)
+        conn = d.getVar("__PRSERV_CONN")
         if conn is None:
             conn = oe.prservice.prserv_make_conn(d)
         if conn is not None:
@@ -540,19 +540,19 @@ python package_get_auto_pr() {
 LOCALEBASEPN ??= "${PN}"
 
 python package_do_split_locales() {
-    if (d.getVar('PACKAGE_NO_LOCALE', True) == '1'):
+    if (d.getVar('PACKAGE_NO_LOCALE') == '1'):
         bb.debug(1, "package requested not splitting locales")
         return
 
-    packages = (d.getVar('PACKAGES', True) or "").split()
+    packages = (d.getVar('PACKAGES') or "").split()
 
-    datadir = d.getVar('datadir', True)
+    datadir = d.getVar('datadir')
     if not datadir:
         bb.note("datadir not defined")
         return
 
-    dvar = d.getVar('PKGD', True)
-    pn = d.getVar('LOCALEBASEPN', True)
+    dvar = d.getVar('PKGD')
+    pn = d.getVar('LOCALEBASEPN')
 
     if pn + '-locale' in packages:
         packages.remove(pn + '-locale')
@@ -565,10 +565,10 @@ python package_do_split_locales() {
 
     locales = os.listdir(localedir)
 
-    summary = d.getVar('SUMMARY', True) or pn
-    description = d.getVar('DESCRIPTION', True) or ""
-    locale_section = d.getVar('LOCALE_SECTION', True)
-    mlprefix = d.getVar('MLPREFIX', True) or ""
+    summary = d.getVar('SUMMARY') or pn
+    description = d.getVar('DESCRIPTION') or ""
+    locale_section = d.getVar('LOCALE_SECTION')
+    mlprefix = d.getVar('MLPREFIX') or ""
     for l in sorted(locales):
         ln = legitimize_package_name(l)
         pkg = pn + '-locale-' + ln
@@ -589,14 +589,14 @@ python package_do_split_locales() {
     # glibc-localedata-translit* won't install as a dependency
     # for some other package which breaks meta-toolchain
     # Probably breaks since virtual-locale- isn't provided anywhere
-    #rdep = (d.getVar('RDEPENDS_%s' % pn, True) or "").split()
+    #rdep = (d.getVar('RDEPENDS_%s' % pn) or "").split()
     #rdep.append('%s-locale*' % pn)
     #d.setVar('RDEPENDS_%s' % pn, ' '.join(rdep))
 }
 
 python perform_packagecopy () {
-    dest = d.getVar('D', True)
-    dvar = d.getVar('PKGD', True)
+    dest = d.getVar('D')
+    dvar = d.getVar('PKGD')
 
     # Start by package population by taking a copy of the installed
     # files to operate on
@@ -730,8 +730,8 @@ python fixup_perms () {
     # paths are resolved via BBPATH
     def get_fs_perms_list(d):
         str = ""
-        bbpath = d.getVar('BBPATH', True)
-        fs_perms_tables = d.getVar('FILESYSTEM_PERMS_TABLES', True)
+        bbpath = d.getVar('BBPATH')
+        fs_perms_tables = d.getVar('FILESYSTEM_PERMS_TABLES')
         if not fs_perms_tables:
             fs_perms_tables = 'files/fs-perms.txt'
         for conf_file in fs_perms_tables.split():
@@ -740,7 +740,7 @@ python fixup_perms () {
 
 
 
-    dvar = d.getVar('PKGD', True)
+    dvar = d.getVar('PKGD')
 
     fs_perms_table = {}
     fs_link_table = {}
@@ -769,7 +769,7 @@ python fixup_perms () {
                 'oldincludedir' ]
 
     for path in target_path_vars:
-        dir = d.getVar(path, True) or ""
+        dir = d.getVar(path) or ""
         if dir == "":
             continue
         fs_perms_table[dir] = fs_perms_entry(bb.data.expand("%s 0755 root root false - - -" % (dir), d))
@@ -854,20 +854,20 @@ python fixup_perms () {
 python split_and_strip_files () {
     import stat, errno
 
-    dvar = d.getVar('PKGD', True)
-    pn = d.getVar('PN', True)
+    dvar = d.getVar('PKGD')
+    pn = d.getVar('PN')
 
     oldcwd = os.getcwd()
     os.chdir(dvar)
 
     # We default to '.debug' style
-    if d.getVar('PACKAGE_DEBUG_SPLIT_STYLE', True) == 'debug-file-directory':
+    if d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-file-directory':
         # Single debug-file-directory style debug info
         debugappend = ".debug"
         debugdir = ""
         debuglibdir = "/usr/lib/debug"
         debugsrcdir = "/usr/src/debug"
-    elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE', True) == 'debug-without-src':
+    elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-without-src':
         # Original OE-core, a.k.a. ".debug", style debug info, but without sources in /usr/src/debug
         debugappend = ""
         debugdir = "/.debug"
@@ -918,10 +918,10 @@ python split_and_strip_files () {
     symlinks = {}
     kernmods = []
     inodes = {}
-    libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir", True))
-    baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir", True))
-    if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1' or \
-            d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) != '1'):
+    libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir"))
+    baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir"))
+    if (d.getVar('INHIBIT_PACKAGE_STRIP') != '1' or \
+            d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') != '1'):
         for root, dirs, files in cpath.walk(dvar):
             for f in files:
                 file = os.path.join(root, f)
@@ -962,7 +962,7 @@ python split_and_strip_files () {
                     elf_file = isELF(file)
                     if elf_file & 1:
                         if elf_file & 2:
-                            if 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn, True) or "").split():
+                            if 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn) or "").split():
                                 bb.note("Skipping file %s from %s for already-stripped QA test" % (file[len(dvar):], pn))
                             else:
                                 msg = "File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
@@ -991,7 +991,7 @@ python split_and_strip_files () {
     #
     # First lets process debug splitting
     #
-    if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) != '1'):
+    if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') != '1'):
         for file in elffiles:
             src = file[len(dvar):]
             dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
@@ -1054,8 +1054,8 @@ python split_and_strip_files () {
     #
     # Now lets go back over things and strip them
     #
-    if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
-        strip = d.getVar("STRIP", True)
+    if (d.getVar('INHIBIT_PACKAGE_STRIP') != '1'):
+        strip = d.getVar("STRIP")
         sfiles = []
         for file in elffiles:
             elf_file = int(elffiles[file])
@@ -1075,16 +1075,16 @@ python split_and_strip_files () {
 python populate_packages () {
     import glob, re
 
-    workdir = d.getVar('WORKDIR', True)
-    outdir = d.getVar('DEPLOY_DIR', True)
-    dvar = d.getVar('PKGD', True)
-    packages = d.getVar('PACKAGES', True)
-    pn = d.getVar('PN', True)
+    workdir = d.getVar('WORKDIR')
+    outdir = d.getVar('DEPLOY_DIR')
+    dvar = d.getVar('PKGD')
+    packages = d.getVar('PACKAGES')
+    pn = d.getVar('PN')
 
     bb.utils.mkdirhier(outdir)
     os.chdir(dvar)
     
-    autodebug = not (d.getVar("NOAUTOPACKAGEDEBUG", True) or False)
+    autodebug = not (d.getVar("NOAUTOPACKAGEDEBUG") or False)
 
     # Sanity check PACKAGES for duplicates
     # Sanity should be moved to sanity.bbclass once we have the infrastucture
@@ -1099,7 +1099,7 @@ python populate_packages () {
         else:
             package_list.append(pkg)
     d.setVar('PACKAGES', ' '.join(package_list))
-    pkgdest = d.getVar('PKGDEST', True)
+    pkgdest = d.getVar('PKGDEST')
 
     seen = []
 
@@ -1120,7 +1120,7 @@ python populate_packages () {
         root = os.path.join(pkgdest, pkg)
         bb.utils.mkdirhier(root)
 
-        filesvar = d.getVar('FILES_%s' % pkg, True) or ""
+        filesvar = d.getVar('FILES_%s' % pkg) or ""
         if "//" in filesvar:
             msg = "FILES variable for package %s contains '//' which is invalid. Attempting to fix this but you should correct the metadata.\n" % pkg
             package_qa_handle_error("files-invalid", msg, d)
@@ -1188,7 +1188,7 @@ python populate_packages () {
     # Handle LICENSE_EXCLUSION
     package_list = []
     for pkg in packages.split():
-        if d.getVar('LICENSE_EXCLUSION-' + pkg, True):
+        if d.getVar('LICENSE_EXCLUSION-' + pkg):
             msg = "%s has an incompatible license. Excluding from packaging." % pkg
             package_qa_handle_error("incompatible-license", msg, d)
         else:
@@ -1207,7 +1207,7 @@ python populate_packages () {
 
     if unshipped != []:
         msg = pn + ": Files/directories were installed but not shipped in any package:"
-        if "installed-vs-shipped" in (d.getVar('INSANE_SKIP_' + pn, True) or "").split():
+        if "installed-vs-shipped" in (d.getVar('INSANE_SKIP_' + pn) or "").split():
             bb.note("Package %s skipping QA tests: installed-vs-shipped" % pn)
         else:
             for f in unshipped:
@@ -1220,7 +1220,7 @@ populate_packages[dirs] = "${D}"
 
 python package_fixsymlinks () {
     import errno
-    pkgdest = d.getVar('PKGDEST', True)
+    pkgdest = d.getVar('PKGDEST')
     packages = d.getVar("PACKAGES", False).split()
 
     dangling_links = {}
@@ -1255,7 +1255,7 @@ python package_fixsymlinks () {
                 bb.note("%s contains dangling symlink to %s" % (pkg, l))
 
     for pkg in newrdepends:
-        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, True) or "")
+        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg) or "")
         for p in newrdepends[pkg]:
             if p not in rdepends:
                 rdepends[p] = []
@@ -1309,9 +1309,9 @@ python emit_pkgdata() {
                 with open(subdata_file, 'w') as fd:
                     fd.write("PKG_%s: %s" % (ml_pkg, pkg))
 
-    packages = d.getVar('PACKAGES', True)
-    pkgdest = d.getVar('PKGDEST', True)
-    pkgdatadir = d.getVar('PKGDESTWORK', True)
+    packages = d.getVar('PACKAGES')
+    pkgdest = d.getVar('PKGDEST')
+    pkgdatadir = d.getVar('PKGDESTWORK')
 
     # Take shared lock since we're only reading, not writing
     lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
@@ -1321,9 +1321,9 @@ python emit_pkgdata() {
     f.write("PACKAGES: %s\n" % packages)
     f.close()
 
-    pn = d.getVar('PN', True)
-    global_variants = (d.getVar('MULTILIB_GLOBAL_VARIANTS', True) or "").split()
-    variants = (d.getVar('MULTILIB_VARIANTS', True) or "").split()
+    pn = d.getVar('PN')
+    global_variants = (d.getVar('MULTILIB_GLOBAL_VARIANTS') or "").split()
+    variants = (d.getVar('MULTILIB_VARIANTS') or "").split()
 
     if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
         write_extra_pkgs(variants, pn, packages, pkgdatadir)
@@ -1331,10 +1331,10 @@ python emit_pkgdata() {
     if (bb.data.inherits_class('allarch', d) and not bb.data.inherits_class('packagegroup', d)):
         write_extra_pkgs(global_variants, pn, packages, pkgdatadir)
 
-    workdir = d.getVar('WORKDIR', True)
+    workdir = d.getVar('WORKDIR')
 
     for pkg in packages.split():
-        pkgval = d.getVar('PKG_%s' % pkg, True)
+        pkgval = d.getVar('PKG_%s' % pkg)
         if pkgval is None:
             pkgval = pkg
             d.setVar('PKG_%s' % pkg, pkg)
@@ -1377,11 +1377,11 @@ python emit_pkgdata() {
         write_if_exists(sf, pkg, 'pkg_prerm')
         write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
         write_if_exists(sf, pkg, 'FILES_INFO')
-        for dfile in (d.getVar('FILERPROVIDESFLIST_' + pkg, True) or "").split():
+        for dfile in (d.getVar('FILERPROVIDESFLIST_' + pkg) or "").split():
             write_if_exists(sf, pkg, 'FILERPROVIDES_' + dfile)
 
         write_if_exists(sf, pkg, 'FILERDEPENDSFLIST')
-        for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg, True) or "").split():
+        for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg) or "").split():
             write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
 
         sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
@@ -1394,9 +1394,9 @@ python emit_pkgdata() {
                 bb.utils.mkdirhier(os.path.dirname(subdata_sym))
                 oe.path.symlink("../../runtime/%s" % pkg, subdata_sym, True)
 
-        allow_empty = d.getVar('ALLOW_EMPTY_%s' % pkg, True)
+        allow_empty = d.getVar('ALLOW_EMPTY_%s' % pkg)
         if not allow_empty:
-            allow_empty = d.getVar('ALLOW_EMPTY', True)
+            allow_empty = d.getVar('ALLOW_EMPTY')
         root = "%s/%s" % (pkgdest, pkg)
         os.chdir(root)
         g = glob('*')
@@ -1435,19 +1435,19 @@ RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpmdeps-oecore --macros ${STAGING_LI
 #  FILERDEPENDS_filepath_pkg - per file dep
 
 python package_do_filedeps() {
-    if d.getVar('SKIP_FILEDEPS', True) == '1':
+    if d.getVar('SKIP_FILEDEPS') == '1':
         return
 
-    pkgdest = d.getVar('PKGDEST', True)
-    packages = d.getVar('PACKAGES', True)
-    rpmdeps = d.getVar('RPMDEPS', True)
+    pkgdest = d.getVar('PKGDEST')
+    packages = d.getVar('PACKAGES')
+    rpmdeps = d.getVar('RPMDEPS')
 
     def chunks(files, n):
         return [files[i:i+n] for i in range(0, len(files), n)]
 
     pkglist = []
     for pkg in packages.split():
-        if d.getVar('SKIP_FILEDEPS_' + pkg, True) == '1':
+        if d.getVar('SKIP_FILEDEPS_' + pkg) == '1':
             continue
         if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1 or pkg.find('-charmap-') != -1 or pkg.startswith('kernel-module-'):
             continue
@@ -1496,22 +1496,22 @@ python package_do_shlibs() {
         return
 
     lib_re = re.compile("^.*\.so")
-    libdir_re = re.compile(".*/%s$" % d.getVar('baselib', True))
+    libdir_re = re.compile(".*/%s$" % d.getVar('baselib'))
 
-    packages = d.getVar('PACKAGES', True)
-    targetos = d.getVar('TARGET_OS', True)
+    packages = d.getVar('PACKAGES')
+    targetos = d.getVar('TARGET_OS')
 
-    workdir = d.getVar('WORKDIR', True)
+    workdir = d.getVar('WORKDIR')
 
-    ver = d.getVar('PKGV', True)
+    ver = d.getVar('PKGV')
     if not ver:
         msg = "PKGV not defined"
         package_qa_handle_error("pkgv-undefined", msg, d)
         return
 
-    pkgdest = d.getVar('PKGDEST', True)
+    pkgdest = d.getVar('PKGDEST')
 
-    shlibswork_dir = d.getVar('SHLIBSWORKDIR', True)
+    shlibswork_dir = d.getVar('SHLIBSWORKDIR')
 
     # Take shared lock since we're only reading, not writing
     lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
@@ -1519,7 +1519,7 @@ python package_do_shlibs() {
     def linux_so(file, needed, sonames, renames, pkgver):
         needs_ldconfig = False
         ldir = os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
-        cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(file) + " 2>/dev/null"
+        cmd = d.getVar('OBJDUMP') + " -p " + pipes.quote(file) + " 2>/dev/null"
         fd = os.popen(cmd)
         lines = fd.readlines()
         fd.close()
@@ -1601,12 +1601,12 @@ python package_do_shlibs() {
                 if name and name not in needed[pkg]:
                      needed[pkg].append((name, file, []))
 
-    if d.getVar('PACKAGE_SNAP_LIB_SYMLINKS', True) == "1":
+    if d.getVar('PACKAGE_SNAP_LIB_SYMLINKS') == "1":
         snap_symlinks = True
     else:
         snap_symlinks = False
 
-    if (d.getVar('USE_LDCONFIG', True) or "1") == "1":
+    if (d.getVar('USE_LDCONFIG') or "1") == "1":
         use_ldconfig = True
     else:
         use_ldconfig = False
@@ -1615,14 +1615,14 @@ python package_do_shlibs() {
     shlib_provider = oe.package.read_shlib_providers(d)
 
     for pkg in packages.split():
-        private_libs = d.getVar('PRIVATE_LIBS_' + pkg, True) or d.getVar('PRIVATE_LIBS', True) or ""
+        private_libs = d.getVar('PRIVATE_LIBS_' + pkg) or d.getVar('PRIVATE_LIBS') or ""
         private_libs = private_libs.split()
         needs_ldconfig = False
         bb.debug(2, "calculating shlib provides for %s" % pkg)
 
-        pkgver = d.getVar('PKGV_' + pkg, True)
+        pkgver = d.getVar('PKGV_' + pkg)
         if not pkgver:
-            pkgver = d.getVar('PV_' + pkg, True)
+            pkgver = d.getVar('PV_' + pkg)
         if not pkgver:
             pkgver = ver
 
@@ -1659,18 +1659,18 @@ python package_do_shlibs() {
             fd.close()
         if needs_ldconfig and use_ldconfig:
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
-            postinst = d.getVar('pkg_postinst_%s' % pkg, True)
+            postinst = d.getVar('pkg_postinst_%s' % pkg)
             if not postinst:
                 postinst = '#!/bin/sh\n'
-            postinst += d.getVar('ldconfig_postinst_fragment', True)
+            postinst += d.getVar('ldconfig_postinst_fragment')
             d.setVar('pkg_postinst_%s' % pkg, postinst)
         bb.debug(1, 'LIBNAMES: pkg %s sonames %s' % (pkg, sonames))
 
     bb.utils.unlockfile(lf)
 
-    assumed_libs = d.getVar('ASSUME_SHLIBS', True)
+    assumed_libs = d.getVar('ASSUME_SHLIBS')
     if assumed_libs:
-        libdir = d.getVar("libdir", True)
+        libdir = d.getVar("libdir")
         for e in assumed_libs.split():
             l, dep_pkg = e.split(":")
             lib_ver = None
@@ -1682,7 +1682,7 @@ python package_do_shlibs() {
                 shlib_provider[l] = {}
             shlib_provider[l][libdir] = (dep_pkg, lib_ver)
 
-    libsearchpath = [d.getVar('libdir', True), d.getVar('base_libdir', True)]
+    libsearchpath = [d.getVar('libdir'), d.getVar('base_libdir')]
 
     for pkg in packages.split():
         bb.debug(2, "calculating shlib requirements for %s" % pkg)
@@ -1736,12 +1736,12 @@ python package_do_shlibs() {
 python package_do_pkgconfig () {
     import re
 
-    packages = d.getVar('PACKAGES', True)
-    workdir = d.getVar('WORKDIR', True)
-    pkgdest = d.getVar('PKGDEST', True)
+    packages = d.getVar('PACKAGES')
+    workdir = d.getVar('WORKDIR')
+    pkgdest = d.getVar('PKGDEST')
 
-    shlibs_dirs = d.getVar('SHLIBSDIRS', True).split()
-    shlibswork_dir = d.getVar('SHLIBSWORKDIR', True)
+    shlibs_dirs = d.getVar('SHLIBSDIRS').split()
+    shlibswork_dir = d.getVar('SHLIBSWORKDIR')
 
     pc_re = re.compile('(.*)\.pc$')
     var_re = re.compile('(.*)=(.*)')
@@ -1826,7 +1826,7 @@ python package_do_pkgconfig () {
 
 def read_libdep_files(d):
     pkglibdeps = {}
-    packages = d.getVar('PACKAGES', True).split()
+    packages = d.getVar('PACKAGES').split()
     for pkg in packages:
         pkglibdeps[pkg] = {}
         for extension in ".shlibdeps", ".pcdeps", ".clilibdeps":
@@ -1846,9 +1846,9 @@ def read_libdep_files(d):
 python read_shlibdeps () {
     pkglibdeps = read_libdep_files(d)
 
-    packages = d.getVar('PACKAGES', True).split()
+    packages = d.getVar('PACKAGES').split()
     for pkg in packages:
-        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, True) or "")
+        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg) or "")
         for dep in pkglibdeps[pkg]:
             # Add the dep if it's not already there, or if no comparison is set
             if dep not in rdepends:
@@ -1873,14 +1873,14 @@ python package_depchains() {
     package.
     """
 
-    packages  = d.getVar('PACKAGES', True)
-    postfixes = (d.getVar('DEPCHAIN_POST', True) or '').split()
-    prefixes  = (d.getVar('DEPCHAIN_PRE', True) or '').split()
+    packages  = d.getVar('PACKAGES')
+    postfixes = (d.getVar('DEPCHAIN_POST') or '').split()
+    prefixes  = (d.getVar('DEPCHAIN_PRE') or '').split()
 
     def pkg_adddeprrecs(pkg, base, suffix, getname, depends, d):
 
         #bb.note('depends for %s is %s' % (base, depends))
-        rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg, True) or "")
+        rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg) or "")
 
         for depend in depends:
             if depend.find('-native') != -1 or depend.find('-cross') != -1 or depend.startswith('virtual/'):
@@ -1901,7 +1901,7 @@ python package_depchains() {
     def pkg_addrrecs(pkg, base, suffix, getname, rdepends, d):
 
         #bb.note('rdepends for %s is %s' % (base, rdepends))
-        rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg, True) or "")
+        rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg) or "")
 
         for depend in rdepends:
             if depend.find('virtual-locale-') != -1:
@@ -1924,12 +1924,12 @@ python package_depchains() {
             list.append(dep)
 
     depends = []
-    for dep in bb.utils.explode_deps(d.getVar('DEPENDS', True) or ""):
+    for dep in bb.utils.explode_deps(d.getVar('DEPENDS') or ""):
         add_dep(depends, dep)
 
     rdepends = []
     for pkg in packages.split():
-        for dep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + pkg, True) or ""):
+        for dep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + pkg) or ""):
             add_dep(rdepends, dep)
 
     #bb.note('rdepends is %s' % rdepends)
@@ -1959,7 +1959,7 @@ python package_depchains() {
         for pkg in pkglibdeps:
             for k in pkglibdeps[pkg]:
                 add_dep(pkglibdeplist, k)
-        dbgdefaultdeps = ((d.getVar('DEPCHAIN_DBGDEFAULTDEPS', True) == '1') or (bb.data.inherits_class('packagegroup', d)))
+        dbgdefaultdeps = ((d.getVar('DEPCHAIN_DBGDEFAULTDEPS') == '1') or (bb.data.inherits_class('packagegroup', d)))
 
     for suffix in pkgs:
         for pkg in pkgs[suffix]:
@@ -1976,7 +1976,7 @@ python package_depchains() {
                 pkg_addrrecs(pkg, base, suffix, func, rdepends, d)
             else:
                 rdeps = []
-                for dep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + base, True) or ""):
+                for dep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + base) or ""):
                     add_dep(rdeps, dep)
                 pkg_addrrecs(pkg, base, suffix, func, rdeps, d)
 }
@@ -1987,8 +1987,8 @@ PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDE
 
 def gen_packagevar(d):
     ret = []
-    pkgs = (d.getVar("PACKAGES", True) or "").split()
-    vars = (d.getVar("PACKAGEVARS", True) or "").split()
+    pkgs = (d.getVar("PACKAGES") or "").split()
+    vars = (d.getVar("PACKAGEVARS") or "").split()
     for p in pkgs:
         for v in vars:
             ret.append(v + "_" + p)
@@ -2036,16 +2036,16 @@ python do_package () {
     # Sanity test the setup
     ###########################################################################
 
-    packages = (d.getVar('PACKAGES', True) or "").split()
+    packages = (d.getVar('PACKAGES') or "").split()
     if len(packages) < 1:
         bb.debug(1, "No packages to build, skipping do_package")
         return
 
-    workdir = d.getVar('WORKDIR', True)
-    outdir = d.getVar('DEPLOY_DIR', True)
-    dest = d.getVar('D', True)
-    dvar = d.getVar('PKGD', True)
-    pn = d.getVar('PN', True)
+    workdir = d.getVar('WORKDIR')
+    outdir = d.getVar('DEPLOY_DIR')
+    dest = d.getVar('D')
+    dvar = d.getVar('PKGD')
+    pn = d.getVar('PN')
 
     if not workdir or not outdir or not dest or not dvar or not pn:
         msg = "WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined, unable to package"
@@ -2063,7 +2063,7 @@ python do_package () {
     # code pre-expands some frequently used variables
 
     def expandVar(x, d):
-        d.setVar(x, d.getVar(x, True))
+        d.setVar(x, d.getVar(x))
 
     for x in 'PN', 'PV', 'BPN', 'TARGET_SYS', 'EXTENDPRAUTO':
         expandVar(x, d)
@@ -2072,7 +2072,7 @@ python do_package () {
     # Setup PKGD (from D)
     ###########################################################################
 
-    for f in (d.getVar('PACKAGEBUILDPKGD', True) or '').split():
+    for f in (d.getVar('PACKAGEBUILDPKGD') or '').split():
         bb.build.exec_func(f, d)
 
     ###########################################################################
@@ -2081,7 +2081,7 @@ python do_package () {
 
     cpath = oe.cachedpath.CachedPath()
 
-    for f in (d.getVar('PACKAGESPLITFUNCS', True) or '').split():
+    for f in (d.getVar('PACKAGESPLITFUNCS') or '').split():
         bb.build.exec_func(f, d)
 
     ###########################################################################
@@ -2091,18 +2091,18 @@ python do_package () {
     # Build global list of files in each split package
     global pkgfiles
     pkgfiles = {}
-    packages = d.getVar('PACKAGES', True).split()
-    pkgdest = d.getVar('PKGDEST', True)
+    packages = d.getVar('PACKAGES').split()
+    pkgdest = d.getVar('PKGDEST')
     for pkg in packages:
         pkgfiles[pkg] = []
         for walkroot, dirs, files in cpath.walk(pkgdest + "/" + pkg):
             for file in files:
                 pkgfiles[pkg].append(walkroot + os.sep + file)
 
-    for f in (d.getVar('PACKAGEFUNCS', True) or '').split():
+    for f in (d.getVar('PACKAGEFUNCS') or '').split():
         bb.build.exec_func(f, d)
 
-    qa_sane = d.getVar("QA_SANE", True)
+    qa_sane = d.getVar("QA_SANE")
     if not qa_sane:
         bb.fatal("Fatal QA errors found, failing task.")
 }
@@ -2149,7 +2149,7 @@ def mapping_rename_hook(d):
     Rewrite variables to account for package renaming in things
     like debian.bbclass or manual PKG variable name changes
     """
-    pkg = d.getVar("PKG", True)
+    pkg = d.getVar("PKG")
     runtime_mapping_rename("RDEPENDS", pkg, d)
     runtime_mapping_rename("RRECOMMENDS", pkg, d)
     runtime_mapping_rename("RSUGGESTS", pkg, d)
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index fb6034c..68eca61 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -6,14 +6,14 @@ inherit package
 
 IMAGE_PKGTYPE ?= "deb"
 
-DPKG_ARCH ?= "${@debian_arch_map(d.getVar('TARGET_ARCH', True), d.getVar('TUNE_FEATURES', True))}"
+DPKG_ARCH ?= "${@debian_arch_map(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'))}"
 DPKG_ARCH[vardepvalue] = "${DPKG_ARCH}"
 
 PKGWRITEDIRDEB = "${WORKDIR}/deploy-debs"
 
 APTCONF_TARGET = "${WORKDIR}"
 
-APT_ARGS = "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS", True) == "1"]}"
+APT_ARGS = "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
 
 def debian_arch_map(arch, tune):
     tune_features = tune.split()
@@ -56,22 +56,22 @@ python do_package_deb () {
 
     oldcwd = os.getcwd()
 
-    workdir = d.getVar('WORKDIR', True)
+    workdir = d.getVar('WORKDIR')
     if not workdir:
         bb.error("WORKDIR not defined, unable to package")
         return
 
-    outdir = d.getVar('PKGWRITEDIRDEB', True)
+    outdir = d.getVar('PKGWRITEDIRDEB')
     if not outdir:
         bb.error("PKGWRITEDIRDEB not defined, unable to package")
         return
 
-    packages = d.getVar('PACKAGES', True)
+    packages = d.getVar('PACKAGES')
     if not packages:
         bb.debug(1, "PACKAGES not defined, nothing to package")
         return
 
-    tmpdir = d.getVar('TMPDIR', True)
+    tmpdir = d.getVar('TMPDIR')
 
     if os.access(os.path.join(tmpdir, "stamps", "DEB_PACKAGE_INDEX_CLEAN"),os.R_OK):
         os.unlink(os.path.join(tmpdir, "stamps", "DEB_PACKAGE_INDEX_CLEAN"))
@@ -80,7 +80,7 @@ python do_package_deb () {
         bb.debug(1, "No packages; nothing to do")
         return
 
-    pkgdest = d.getVar('PKGDEST', True)
+    pkgdest = d.getVar('PKGDEST')
 
     def cleanupcontrol(root):
         for p in ['CONTROL', 'DEBIAN']:
@@ -96,7 +96,7 @@ python do_package_deb () {
 
         localdata.setVar('ROOT', '')
         localdata.setVar('ROOT_%s' % pkg, root)
-        pkgname = localdata.getVar('PKG_%s' % pkg, True)
+        pkgname = localdata.getVar('PKG_%s' % pkg)
         if not pkgname:
             pkgname = pkg
         localdata.setVar('PKG', pkgname)
@@ -106,7 +106,7 @@ python do_package_deb () {
         bb.data.update_data(localdata)
         basedir = os.path.join(os.path.dirname(root))
 
-        pkgoutdir = os.path.join(outdir, localdata.getVar('PACKAGE_ARCH', True))
+        pkgoutdir = os.path.join(outdir, localdata.getVar('PACKAGE_ARCH'))
         bb.utils.mkdirhier(pkgoutdir)
 
         os.chdir(root)
@@ -114,7 +114,7 @@ python do_package_deb () {
         from glob import glob
         g = glob('*')
         if not g and localdata.getVar('ALLOW_EMPTY', False) != "1":
-            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
+            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV'), localdata.getVar('PKGR')))
             bb.utils.unlockfile(lf)
             continue
 
@@ -129,7 +129,7 @@ python do_package_deb () {
             bb.fatal("unable to open control file for writing")
 
         fields = []
-        pe = d.getVar('PKGE', True)
+        pe = d.getVar('PKGE')
         if pe and int(pe) > 0:
             fields.append(["Version: %s:%s-%s\n", ['PKGE', 'PKGV', 'PKGR']])
         else:
@@ -141,7 +141,7 @@ python do_package_deb () {
         fields.append(["Architecture: %s\n", ['DPKG_ARCH']])
         fields.append(["OE: %s\n", ['PN']])
         fields.append(["PackageArch: %s\n", ['PACKAGE_ARCH']])
-        if d.getVar('HOMEPAGE', True):
+        if d.getVar('HOMEPAGE'):
             fields.append(["Homepage: %s\n", ['HOMEPAGE']])
 
         # Package, Version, Maintainer, Description - mandatory
@@ -151,10 +151,10 @@ python do_package_deb () {
         def pullData(l, d):
             l2 = []
             for i in l:
-                data = d.getVar(i, True)
+                data = d.getVar(i)
                 if data is None:
                     raise KeyError(f)
-                if i == 'DPKG_ARCH' and d.getVar('PACKAGE_ARCH', True) == 'all':
+                if i == 'DPKG_ARCH' and d.getVar('PACKAGE_ARCH') == 'all':
                     data = 'all'
                 elif i == 'PACKAGE_ARCH' or i == 'DPKG_ARCH':
                    # The params in deb package control don't allow character
@@ -165,7 +165,7 @@ python do_package_deb () {
             return l2
 
         ctrlfile.write("Package: %s\n" % pkgname)
-        if d.getVar('PACKAGE_ARCH', True) == "all":
+        if d.getVar('PACKAGE_ARCH') == "all":
             ctrlfile.write("Multi-Arch: foreign\n")
         # check for required fields
         try:
@@ -175,9 +175,9 @@ python do_package_deb () {
                          raise KeyError(f)
                 # Special behavior for description...
                 if 'DESCRIPTION' in fs:
-                     summary = localdata.getVar('SUMMARY', True) or localdata.getVar('DESCRIPTION', True) or "."
+                     summary = localdata.getVar('SUMMARY') or localdata.getVar('DESCRIPTION') or "."
                      ctrlfile.write('Description: %s\n' % summary)
-                     description = localdata.getVar('DESCRIPTION', True) or "."
+                     description = localdata.getVar('DESCRIPTION') or "."
                      description = textwrap.dedent(description).strip()
                      if '\\n' in description:
                          # Manually indent
@@ -231,7 +231,7 @@ python do_package_deb () {
                     elif (v or "").startswith("> "):
                         var[dep][i] = var[dep][i].replace("> ", ">> ")
 
-        rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS", True) or "")
+        rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS") or "")
         debian_cmp_remap(rdepends)
         for dep in list(rdepends.keys()):
                 if dep == pkg:
@@ -239,20 +239,20 @@ python do_package_deb () {
                         continue
                 if '*' in dep:
                         del rdepends[dep]
-        rrecommends = bb.utils.explode_dep_versions2(localdata.getVar("RRECOMMENDS", True) or "")
+        rrecommends = bb.utils.explode_dep_versions2(localdata.getVar("RRECOMMENDS") or "")
         debian_cmp_remap(rrecommends)
         for dep in list(rrecommends.keys()):
                 if '*' in dep:
                         del rrecommends[dep]
-        rsuggests = bb.utils.explode_dep_versions2(localdata.getVar("RSUGGESTS", True) or "")
+        rsuggests = bb.utils.explode_dep_versions2(localdata.getVar("RSUGGESTS") or "")
         debian_cmp_remap(rsuggests)
         # Deliberately drop version information here, not wanted/supported by deb
-        rprovides = dict.fromkeys(bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES", True) or ""), [])
+        rprovides = dict.fromkeys(bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES") or ""), [])
         rprovides = collections.OrderedDict(sorted(rprovides.items(), key=lambda x: x[0]))
         debian_cmp_remap(rprovides)
-        rreplaces = bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES", True) or "")
+        rreplaces = bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES") or "")
         debian_cmp_remap(rreplaces)
-        rconflicts = bb.utils.explode_dep_versions2(localdata.getVar("RCONFLICTS", True) or "")
+        rconflicts = bb.utils.explode_dep_versions2(localdata.getVar("RCONFLICTS") or "")
         debian_cmp_remap(rconflicts)
         if rdepends:
             ctrlfile.write("Depends: %s\n" % bb.utils.join_deps(rdepends))
@@ -269,7 +269,7 @@ python do_package_deb () {
         ctrlfile.close()
 
         for script in ["preinst", "postinst", "prerm", "postrm"]:
-            scriptvar = localdata.getVar('pkg_%s' % script, True)
+            scriptvar = localdata.getVar('pkg_%s' % script)
             if not scriptvar:
                 continue
             scriptvar = scriptvar.strip()
@@ -308,7 +308,7 @@ python do_package_deb () {
             conffiles.close()
 
         os.chdir(basedir)
-        ret = subprocess.call("PATH=\"%s\" dpkg-deb -b %s %s" % (localdata.getVar("PATH", True), root, pkgoutdir), shell=True)
+        ret = subprocess.call("PATH=\"%s\" dpkg-deb -b %s %s" % (localdata.getVar("PATH"), root, pkgoutdir), shell=True)
         if ret != 0:
             bb.utils.unlockfile(lf)
             bb.fatal("dpkg-deb execution failed")
@@ -328,7 +328,7 @@ do_package_write_deb[sstate-inputdirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[sstate-outputdirs] = "${DEPLOY_DIR_DEB}"
 
 python do_package_write_deb_setscene () {
-    tmpdir = d.getVar('TMPDIR', True)
+    tmpdir = d.getVar('TMPDIR')
 
     if os.access(os.path.join(tmpdir, "stamps", "DEB_PACKAGE_INDEX_CLEAN"),os.R_OK):
         os.unlink(os.path.join(tmpdir, "stamps", "DEB_PACKAGE_INDEX_CLEAN"))
@@ -338,7 +338,7 @@ python do_package_write_deb_setscene () {
 addtask do_package_write_deb_setscene
 
 python () {
-    if d.getVar('PACKAGES', True) != '':
+    if d.getVar('PACKAGES') != '':
         deps = ' dpkg-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
         d.appendVarFlag('do_package_write_deb', 'depends', deps)
         d.setVarFlag('do_package_write_deb', 'fakeroot', "1")
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index eb00932..7018a60 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -11,8 +11,8 @@ PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
 OPKGBUILDCMD ??= "opkg-build"
 
 OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
-OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS", True) == "1"]}"
-OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKAGE_EXCLUDE', True) or "").split())][(d.getVar("PACKAGE_EXCLUDE", True) or "") != ""]}"
+OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
+OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKAGE_EXCLUDE') or "").split())][(d.getVar("PACKAGE_EXCLUDE") or "") != ""]}"
 
 OPKGLIBDIR = "${localstatedir}/lib"
 
@@ -24,15 +24,15 @@ python do_package_ipk () {
 
     oldcwd = os.getcwd()
 
-    workdir = d.getVar('WORKDIR', True)
-    outdir = d.getVar('PKGWRITEDIRIPK', True)
-    tmpdir = d.getVar('TMPDIR', True)
-    pkgdest = d.getVar('PKGDEST', True)
+    workdir = d.getVar('WORKDIR')
+    outdir = d.getVar('PKGWRITEDIRIPK')
+    tmpdir = d.getVar('TMPDIR')
+    pkgdest = d.getVar('PKGDEST')
     if not workdir or not outdir or not tmpdir:
         bb.error("Variables incorrectly set, unable to package")
         return
 
-    packages = d.getVar('PACKAGES', True)
+    packages = d.getVar('PACKAGES')
     if not packages or packages == '':
         bb.debug(1, "No packages; nothing to do")
         return
@@ -56,7 +56,7 @@ python do_package_ipk () {
 
         localdata.setVar('ROOT', '')
         localdata.setVar('ROOT_%s' % pkg, root)
-        pkgname = localdata.getVar('PKG_%s' % pkg, True)
+        pkgname = localdata.getVar('PKG_%s' % pkg)
         if not pkgname:
             pkgname = pkg
         localdata.setVar('PKG', pkgname)
@@ -65,7 +65,7 @@ python do_package_ipk () {
 
         bb.data.update_data(localdata)
         basedir = os.path.join(os.path.dirname(root))
-        arch = localdata.getVar('PACKAGE_ARCH', True)
+        arch = localdata.getVar('PACKAGE_ARCH')
 
         if localdata.getVar('IPK_HIERARCHICAL_FEED', False) == "1":
             # Spread packages across subdirectories so each isn't too crowded
@@ -98,7 +98,7 @@ python do_package_ipk () {
         from glob import glob
         g = glob('*')
         if not g and localdata.getVar('ALLOW_EMPTY', False) != "1":
-            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
+            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV'), localdata.getVar('PKGR')))
             bb.utils.unlockfile(lf)
             continue
 
@@ -111,7 +111,7 @@ python do_package_ipk () {
             bb.fatal("unable to open control file for writing")
 
         fields = []
-        pe = d.getVar('PKGE', True)
+        pe = d.getVar('PKGE')
         if pe and int(pe) > 0:
             fields.append(["Version: %s:%s-%s\n", ['PKGE', 'PKGV', 'PKGR']])
         else:
@@ -123,13 +123,13 @@ python do_package_ipk () {
         fields.append(["License: %s\n", ['LICENSE']])
         fields.append(["Architecture: %s\n", ['PACKAGE_ARCH']])
         fields.append(["OE: %s\n", ['PN']])
-        if d.getVar('HOMEPAGE', True):
+        if d.getVar('HOMEPAGE'):
             fields.append(["Homepage: %s\n", ['HOMEPAGE']])
 
         def pullData(l, d):
             l2 = []
             for i in l:
-                l2.append(d.getVar(i, True))
+                l2.append(d.getVar(i))
             return l2
 
         ctrlfile.write("Package: %s\n" % pkgname)
@@ -141,9 +141,9 @@ python do_package_ipk () {
                         raise KeyError(f)
                 # Special behavior for description...
                 if 'DESCRIPTION' in fs:
-                    summary = localdata.getVar('SUMMARY', True) or localdata.getVar('DESCRIPTION', True) or "."
+                    summary = localdata.getVar('SUMMARY') or localdata.getVar('DESCRIPTION') or "."
                     ctrlfile.write('Description: %s\n' % summary)
-                    description = localdata.getVar('DESCRIPTION', True) or "."
+                    description = localdata.getVar('DESCRIPTION') or "."
                     description = textwrap.dedent(description).strip()
                     if '\\n' in description:
                         # Manually indent
@@ -185,19 +185,19 @@ python do_package_ipk () {
                     elif (v or "").startswith("> "):
                         var[dep][i] = var[dep][i].replace("> ", ">> ")
 
-        rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS", True) or "")
+        rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS") or "")
         debian_cmp_remap(rdepends)
-        rrecommends = bb.utils.explode_dep_versions2(localdata.getVar("RRECOMMENDS", True) or "")
+        rrecommends = bb.utils.explode_dep_versions2(localdata.getVar("RRECOMMENDS") or "")
         debian_cmp_remap(rrecommends)
-        rsuggests = bb.utils.explode_dep_versions2(localdata.getVar("RSUGGESTS", True) or "")
+        rsuggests = bb.utils.explode_dep_versions2(localdata.getVar("RSUGGESTS") or "")
         debian_cmp_remap(rsuggests)
         # Deliberately drop version information here, not wanted/supported by ipk
-        rprovides = dict.fromkeys(bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES", True) or ""), [])
+        rprovides = dict.fromkeys(bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES") or ""), [])
         rprovides = collections.OrderedDict(sorted(rprovides.items(), key=lambda x: x[0]))
         debian_cmp_remap(rprovides)
-        rreplaces = bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES", True) or "")
+        rreplaces = bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES") or "")
         debian_cmp_remap(rreplaces)
-        rconflicts = bb.utils.explode_dep_versions2(localdata.getVar("RCONFLICTS", True) or "")
+        rconflicts = bb.utils.explode_dep_versions2(localdata.getVar("RCONFLICTS") or "")
         debian_cmp_remap(rconflicts)
 
         if rdepends:
@@ -212,14 +212,14 @@ python do_package_ipk () {
             ctrlfile.write("Replaces: %s\n" % bb.utils.join_deps(rreplaces))
         if rconflicts:
             ctrlfile.write("Conflicts: %s\n" % bb.utils.join_deps(rconflicts))
-        src_uri = localdata.getVar("SRC_URI", True).strip() or "None"
+        src_uri = localdata.getVar("SRC_URI").strip() or "None"
         if src_uri:
             src_uri = re.sub("\s+", " ", src_uri)
             ctrlfile.write("Source: %s\n" % " ".join(src_uri.split()))
         ctrlfile.close()
 
         for script in ["preinst", "postinst", "prerm", "postrm"]:
-            scriptvar = localdata.getVar('pkg_%s' % script, True)
+            scriptvar = localdata.getVar('pkg_%s' % script)
             if not scriptvar:
                 continue
             try:
@@ -244,15 +244,15 @@ python do_package_ipk () {
             conffiles.close()
 
         os.chdir(basedir)
-        ret = subprocess.call("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH", True),
-                                                          d.getVar("OPKGBUILDCMD", True), pkg, pkgoutdir), shell=True)
+        ret = subprocess.call("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
+                                                          d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir), shell=True)
         if ret != 0:
             bb.utils.unlockfile(lf)
             bb.fatal("opkg-build execution failed")
 
-        if d.getVar('IPK_SIGN_PACKAGES', True) == '1':
-            ipkver = "%s-%s" % (d.getVar('PKGV', True), d.getVar('PKGR', True))
-            ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipkver, d.getVar('PACKAGE_ARCH', True))
+        if d.getVar('IPK_SIGN_PACKAGES') == '1':
+            ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
+            ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipkver, d.getVar('PACKAGE_ARCH'))
             sign_ipk(d, ipk_to_sign)
 
         cleanupcontrol(root)
@@ -268,7 +268,7 @@ do_package_write_ipk[sstate-inputdirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[sstate-outputdirs] = "${DEPLOY_DIR_IPK}"
 
 python do_package_write_ipk_setscene () {
-    tmpdir = d.getVar('TMPDIR', True)
+    tmpdir = d.getVar('TMPDIR')
 
     if os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"), os.R_OK):
         os.unlink(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"))
@@ -278,7 +278,7 @@ python do_package_write_ipk_setscene () {
 addtask do_package_write_ipk_setscene
 
 python () {
-    if d.getVar('PACKAGES', True) != '':
+    if d.getVar('PACKAGES') != '':
         deps = ' opkg-utils-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
         d.appendVarFlag('do_package_write_ipk', 'depends', deps)
         d.setVarFlag('do_package_write_ipk', 'fakeroot', "1")
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index c431545..722c628 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -13,9 +13,9 @@ MERGEPERFILEDEPS = "1"
 
 # Construct per file dependencies file
 def write_rpm_perfiledata(srcname, d):
-    workdir = d.getVar('WORKDIR', True)
-    packages = d.getVar('PACKAGES', True)
-    pkgd = d.getVar('PKGD', True)
+    workdir = d.getVar('WORKDIR')
+    packages = d.getVar('PACKAGES')
+    pkgd = d.getVar('PKGD')
 
     def dump_filerdeps(varname, outfile, d):
         outfile.write("#!/usr/bin/env python\n\n")
@@ -23,10 +23,10 @@ def write_rpm_perfiledata(srcname, d):
         outfile.write('deps = {\n')
         for pkg in packages.split():
             dependsflist_key = 'FILE' + varname + 'FLIST' + "_" + pkg
-            dependsflist = (d.getVar(dependsflist_key, True) or "")
+            dependsflist = (d.getVar(dependsflist_key) or "")
             for dfile in dependsflist.split():
                 key = "FILE" + varname + "_" + dfile + "_" + pkg
-                depends_dict = bb.utils.explode_dep_versions(d.getVar(key, True) or "")
+                depends_dict = bb.utils.explode_dep_versions(d.getVar(key) or "")
                 file = dfile.replace("@underscore@", "_")
                 file = file.replace("@closebrace@", "]")
                 file = file.replace("@openbrace@", "[")
@@ -87,14 +87,14 @@ python write_specfile () {
     # append information for logs and patches to %prep
     def add_prep(d,spec_files_bottom):
         if d.getVarFlag('ARCHIVER_MODE', 'srpm', True) == '1' and bb.data.inherits_class('archiver', d):
-            spec_files_bottom.append('%%prep -n %s' % d.getVar('PN', True) )
+            spec_files_bottom.append('%%prep -n %s' % d.getVar('PN') )
             spec_files_bottom.append('%s' % "echo \"include logs and patches, Please check them in SOURCES\"")
             spec_files_bottom.append('')
 
     # append the name of tarball to key word 'SOURCE' in xxx.spec.
     def tail_source(d):
         if d.getVarFlag('ARCHIVER_MODE', 'srpm', True) == '1' and bb.data.inherits_class('archiver', d):
-            ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
+            ar_outdir = d.getVar('ARCHIVER_OUTDIR')
             if not os.path.exists(ar_outdir):
                 return
             source_list = os.listdir(ar_outdir)
@@ -110,7 +110,7 @@ python write_specfile () {
     # We need a simple way to remove the MLPREFIX from the package name,
     # and dependency information...
     def strip_multilib(name, d):
-        multilibs = d.getVar('MULTILIBS', True) or ""
+        multilibs = d.getVar('MULTILIBS') or ""
         for ext in multilibs.split():
             eext = ext.split(':')
             if len(eext) > 1 and eext[0] == 'multilib' and name and name.find(eext[1] + '-') >= 0:
@@ -124,7 +124,7 @@ python write_specfile () {
             newdeps[strip_multilib(dep, d)] = depends[dep]
         return bb.utils.join_deps(newdeps)
 
-#        ml = d.getVar("MLPREFIX", True)
+#        ml = d.getVar("MLPREFIX")
 #        if ml and name and len(ml) != 0 and name.find(ml) == 0:
 #            return ml.join(name.split(ml, 1)[1:])
 #        return name
@@ -144,7 +144,7 @@ python write_specfile () {
     # after renaming we cannot look up the dependencies in the packagedata
     # store.
     def translate_vers(varname, d):
-        depends = d.getVar(varname, True)
+        depends = d.getVar(varname)
         if depends:
             depends_dict = bb.utils.explode_dep_versions2(depends)
             newdeps_dict = {}
@@ -248,10 +248,10 @@ python write_specfile () {
     def get_perfile(varname, pkg, d):
         deps = []
         dependsflist_key = 'FILE' + varname + 'FLIST' + "_" + pkg
-        dependsflist = (d.getVar(dependsflist_key, True) or "")
+        dependsflist = (d.getVar(dependsflist_key) or "")
         for dfile in dependsflist.split():
             key = "FILE" + varname + "_" + dfile + "_" + pkg
-            depends = d.getVar(key, True)
+            depends = d.getVar(key)
             if depends:
                 deps.append(depends)
         return " ".join(deps)
@@ -269,33 +269,33 @@ python write_specfile () {
         else:
             spec_preamble.append('%s' % textwrap.fill(dedent_text, width=75))
 
-    packages = d.getVar('PACKAGES', True)
+    packages = d.getVar('PACKAGES')
     if not packages or packages == '':
         bb.debug(1, "No packages; nothing to do")
         return
 
-    pkgdest = d.getVar('PKGDEST', True)
+    pkgdest = d.getVar('PKGDEST')
     if not pkgdest:
         bb.fatal("No PKGDEST")
 
-    outspecfile = d.getVar('OUTSPECFILE', True)
+    outspecfile = d.getVar('OUTSPECFILE')
     if not outspecfile:
         bb.fatal("No OUTSPECFILE")
 
     # Construct the SPEC file...
-    srcname    = strip_multilib(d.getVar('PN', True), d)
-    srcsummary = (d.getVar('SUMMARY', True) or d.getVar('DESCRIPTION', True) or ".")
-    srcversion = d.getVar('PKGV', True).replace('-', '+')
-    srcrelease = d.getVar('PKGR', True)
-    srcepoch   = (d.getVar('PKGE', True) or "")
-    srclicense = d.getVar('LICENSE', True)
-    srcsection = d.getVar('SECTION', True)
-    srcmaintainer  = d.getVar('MAINTAINER', True)
-    srchomepage    = d.getVar('HOMEPAGE', True)
-    srcdescription = d.getVar('DESCRIPTION', True) or "."
+    srcname    = strip_multilib(d.getVar('PN'), d)
+    srcsummary = (d.getVar('SUMMARY') or d.getVar('DESCRIPTION') or ".")
+    srcversion = d.getVar('PKGV').replace('-', '+')
+    srcrelease = d.getVar('PKGR')
+    srcepoch   = (d.getVar('PKGE') or "")
+    srclicense = d.getVar('LICENSE')
+    srcsection = d.getVar('SECTION')
+    srcmaintainer  = d.getVar('MAINTAINER')
+    srchomepage    = d.getVar('HOMEPAGE')
+    srcdescription = d.getVar('DESCRIPTION') or "."
     srccustomtagschunk = get_package_additional_metadata("rpm", d)
 
-    srcdepends     = strip_multilib_deps(d.getVar('DEPENDS', True), d)
+    srcdepends     = strip_multilib_deps(d.getVar('DEPENDS'), d)
     srcrdepends    = []
     srcrrecommends = []
     srcrsuggests   = []
@@ -318,8 +318,8 @@ python write_specfile () {
     spec_files_top = []
     spec_files_bottom = []
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS", True) or "0") == "0"
-    extra_pkgdata = (d.getVar("RPM_EXTRA_PKGDATA", True) or "0") == "1"
+    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
+    extra_pkgdata = (d.getVar("RPM_EXTRA_PKGDATA") or "0") == "1"
 
     for pkg in packages.split():
         localdata = bb.data.createCopy(d)
@@ -328,7 +328,7 @@ python write_specfile () {
 
         localdata.setVar('ROOT', '')
         localdata.setVar('ROOT_%s' % pkg, root)
-        pkgname = localdata.getVar('PKG_%s' % pkg, True)
+        pkgname = localdata.getVar('PKG_%s' % pkg)
         if not pkgname:
             pkgname = pkg
         localdata.setVar('PKG', pkgname)
@@ -338,19 +338,19 @@ python write_specfile () {
         bb.data.update_data(localdata)
 
         conffiles = get_conffiles(pkg, d)
-        dirfiles = localdata.getVar('DIRFILES', True)
+        dirfiles = localdata.getVar('DIRFILES')
         if dirfiles is not None:
             dirfiles = dirfiles.split()
 
         splitname    = strip_multilib(pkgname, d)
 
-        splitsummary = (localdata.getVar('SUMMARY', True) or localdata.getVar('DESCRIPTION', True) or ".")
-        splitversion = (localdata.getVar('PKGV', True) or "").replace('-', '+')
-        splitrelease = (localdata.getVar('PKGR', True) or "")
-        splitepoch   = (localdata.getVar('PKGE', True) or "")
-        splitlicense = (localdata.getVar('LICENSE', True) or "")
-        splitsection = (localdata.getVar('SECTION', True) or "")
-        splitdescription = (localdata.getVar('DESCRIPTION', True) or ".")
+        splitsummary = (localdata.getVar('SUMMARY') or localdata.getVar('DESCRIPTION') or ".")
+        splitversion = (localdata.getVar('PKGV') or "").replace('-', '+')
+        splitrelease = (localdata.getVar('PKGR') or "")
+        splitepoch   = (localdata.getVar('PKGE') or "")
+        splitlicense = (localdata.getVar('LICENSE') or "")
+        splitsection = (localdata.getVar('SECTION') or "")
+        splitdescription = (localdata.getVar('DESCRIPTION') or ".")
         splitcustomtagschunk = get_package_additional_metadata("rpm", localdata)
 
         translate_vers('RDEPENDS', localdata)
@@ -363,18 +363,18 @@ python write_specfile () {
         # Map the dependencies into their final form
         mapping_rename_hook(localdata)
 
-        splitrdepends    = strip_multilib_deps(localdata.getVar('RDEPENDS', True), d)
-        splitrrecommends = strip_multilib_deps(localdata.getVar('RRECOMMENDS', True), d)
-        splitrsuggests   = strip_multilib_deps(localdata.getVar('RSUGGESTS', True), d)
-        splitrprovides   = strip_multilib_deps(localdata.getVar('RPROVIDES', True), d)
-        splitrreplaces   = strip_multilib_deps(localdata.getVar('RREPLACES', True), d)
-        splitrconflicts  = strip_multilib_deps(localdata.getVar('RCONFLICTS', True), d)
+        splitrdepends    = strip_multilib_deps(localdata.getVar('RDEPENDS'), d)
+        splitrrecommends = strip_multilib_deps(localdata.getVar('RRECOMMENDS'), d)
+        splitrsuggests   = strip_multilib_deps(localdata.getVar('RSUGGESTS'), d)
+        splitrprovides   = strip_multilib_deps(localdata.getVar('RPROVIDES'), d)
+        splitrreplaces   = strip_multilib_deps(localdata.getVar('RREPLACES'), d)
+        splitrconflicts  = strip_multilib_deps(localdata.getVar('RCONFLICTS'), d)
         splitrobsoletes  = []
 
-        splitrpreinst  = localdata.getVar('pkg_preinst', True)
-        splitrpostinst = localdata.getVar('pkg_postinst', True)
-        splitrprerm    = localdata.getVar('pkg_prerm', True)
-        splitrpostrm   = localdata.getVar('pkg_postrm', True)
+        splitrpreinst  = localdata.getVar('pkg_preinst')
+        splitrpostinst = localdata.getVar('pkg_postinst')
+        splitrprerm    = localdata.getVar('pkg_prerm')
+        splitrpostrm   = localdata.getVar('pkg_postrm')
 
 
         if not perfiledeps:
@@ -621,7 +621,7 @@ python write_specfile () {
 
     # RPMSPEC_PREAMBLE is a way to add arbitrary text to the top
     # of the generated spec file
-    external_preamble = d.getVar("RPMSPEC_PREAMBLE", True)
+    external_preamble = d.getVar("RPMSPEC_PREAMBLE")
     if external_preamble:
         specfile.write(external_preamble + "\n")
 
@@ -652,20 +652,20 @@ python do_package_rpm () {
     # We need a simple way to remove the MLPREFIX from the package name,
     # and dependency information...
     def strip_multilib(name, d):
-        ml = d.getVar("MLPREFIX", True)
+        ml = d.getVar("MLPREFIX")
         if ml and name and len(ml) != 0 and name.find(ml) >= 0:
             return "".join(name.split(ml))
         return name
 
-    workdir = d.getVar('WORKDIR', True)
-    tmpdir = d.getVar('TMPDIR', True)
-    pkgd = d.getVar('PKGD', True)
-    pkgdest = d.getVar('PKGDEST', True)
+    workdir = d.getVar('WORKDIR')
+    tmpdir = d.getVar('TMPDIR')
+    pkgd = d.getVar('PKGD')
+    pkgdest = d.getVar('PKGDEST')
     if not workdir or not pkgd or not tmpdir:
         bb.error("Variables incorrectly set, unable to package")
         return
 
-    packages = d.getVar('PACKAGES', True)
+    packages = d.getVar('PACKAGES')
     if not packages or packages == '':
         bb.debug(1, "No packages; nothing to do")
         return
@@ -674,31 +674,31 @@ python do_package_rpm () {
     # If the spec file already exist, and has not been stored into 
     # pseudo's files.db, it maybe cause rpmbuild src.rpm fail,
     # so remove it before doing rpmbuild src.rpm.
-    srcname    = strip_multilib(d.getVar('PN', True), d)
+    srcname    = strip_multilib(d.getVar('PN'), d)
     outspecfile = workdir + "/" + srcname + ".spec"
     if os.path.isfile(outspecfile):
         os.remove(outspecfile)
     d.setVar('OUTSPECFILE', outspecfile)
     bb.build.exec_func('write_specfile', d)
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS", True) or "0") == "0"
+    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
     if perfiledeps:
         outdepends, outprovides = write_rpm_perfiledata(srcname, d)
 
     # Setup the rpmbuild arguments...
-    rpmbuild = d.getVar('RPMBUILD', True)
-    targetsys = d.getVar('TARGET_SYS', True)
-    targetvendor = d.getVar('HOST_VENDOR', True)
-    package_arch = (d.getVar('PACKAGE_ARCH', True) or "").replace("-", "_")
-    sdkpkgsuffix = (d.getVar('SDKPKGSUFFIX', True) or "nativesdk").replace("-", "_")
+    rpmbuild = d.getVar('RPMBUILD')
+    targetsys = d.getVar('TARGET_SYS')
+    targetvendor = d.getVar('HOST_VENDOR')
+    package_arch = (d.getVar('PACKAGE_ARCH') or "").replace("-", "_")
+    sdkpkgsuffix = (d.getVar('SDKPKGSUFFIX') or "nativesdk").replace("-", "_")
     if package_arch not in "all any noarch".split() and not package_arch.endswith(sdkpkgsuffix):
-        ml_prefix = (d.getVar('MLPREFIX', True) or "").replace("-", "_")
+        ml_prefix = (d.getVar('MLPREFIX') or "").replace("-", "_")
         d.setVar('PACKAGE_ARCH_EXTEND', ml_prefix + package_arch)
     else:
         d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
     pkgwritedir = d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
     d.setVar('RPM_PKGWRITEDIR', pkgwritedir)
-    bb.debug(1, 'PKGWRITEDIR: %s' % d.getVar('RPM_PKGWRITEDIR', True))
+    bb.debug(1, 'PKGWRITEDIR: %s' % d.getVar('RPM_PKGWRITEDIR'))
     pkgarch = d.expand('${PACKAGE_ARCH_EXTEND}${HOST_VENDOR}-${HOST_OS}')
     magicfile = d.expand('${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc')
     bb.utils.mkdirhier(pkgwritedir)
@@ -707,7 +707,7 @@ python do_package_rpm () {
     cmd = rpmbuild
     cmd = cmd + " --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
-    cmd = cmd + " --define '_builddir " + d.getVar('S', True) + "'"
+    cmd = cmd + " --define '_builddir " + d.getVar('S') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
     cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     if perfiledeps:
@@ -721,8 +721,8 @@ python do_package_rpm () {
     cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"
     if d.getVarFlag('ARCHIVER_MODE', 'srpm', True) == '1' and bb.data.inherits_class('archiver', d):
-        cmd = cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTDIR', True) + "'"
-        cmdsrpm = cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_OUTDIR', True) + "'"
+        cmd = cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTDIR') + "'"
+        cmdsrpm = cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_OUTDIR') + "'"
         cmdsrpm = cmdsrpm + " -bs " + outspecfile
         # Build the .src.rpm
         d.setVar('SBUILDSPEC', cmdsrpm + "\n")
@@ -735,12 +735,12 @@ python do_package_rpm () {
     d.setVarFlag('BUILDSPEC', 'func', '1')
     bb.build.exec_func('BUILDSPEC', d)
 
-    if d.getVar('RPM_SIGN_PACKAGES', True) == '1':
+    if d.getVar('RPM_SIGN_PACKAGES') == '1':
         bb.build.exec_func("sign_rpm", d)
 }
 
 python () {
-    if d.getVar('PACKAGES', True) != '':
+    if d.getVar('PACKAGES') != '':
         deps = ' rpm-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
         d.appendVarFlag('do_package_write_rpm', 'depends', deps)
         d.setVarFlag('do_package_write_rpm', 'fakeroot', '1')
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index e217814..3ff8b8f 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -7,27 +7,27 @@ python do_package_tar () {
 
     oldcwd = os.getcwd()
 
-    workdir = d.getVar('WORKDIR', True)
+    workdir = d.getVar('WORKDIR')
     if not workdir:
         bb.error("WORKDIR not defined, unable to package")
         return
 
-    outdir = d.getVar('DEPLOY_DIR_TAR', True)
+    outdir = d.getVar('DEPLOY_DIR_TAR')
     if not outdir:
         bb.error("DEPLOY_DIR_TAR not defined, unable to package")
         return
 
-    dvar = d.getVar('D', True)
+    dvar = d.getVar('D')
     if not dvar:
         bb.error("D not defined, unable to package")
         return
 
-    packages = d.getVar('PACKAGES', True)
+    packages = d.getVar('PACKAGES')
     if not packages:
         bb.debug(1, "PACKAGES not defined, nothing to package")
         return
 
-    pkgdest = d.getVar('PKGDEST', True)
+    pkgdest = d.getVar('PKGDEST')
 
     bb.utils.mkdirhier(outdir)
     bb.utils.mkdirhier(dvar)
@@ -46,7 +46,7 @@ python do_package_tar () {
         os.chdir(root)
         dlist = os.listdir(root)
         if not dlist:
-            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
+            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV'), localdata.getVar('PKGR')))
             continue
         args = "tar -cz --exclude=CONTROL --exclude=DEBIAN -f".split()
         ret = subprocess.call(args + [tarfn] + dlist)
@@ -57,7 +57,7 @@ python do_package_tar () {
 }
 
 python () {
-    if d.getVar('PACKAGES', True) != '':
+    if d.getVar('PACKAGES') != '':
         deps = (d.getVarFlag('do_package_write_tar', 'depends', True) or "").split()
         deps.append('tar-native:do_populate_sysroot')
         deps.append('virtual/fakeroot-native:do_populate_sysroot')
diff --git a/meta/classes/packagedata.bbclass b/meta/classes/packagedata.bbclass
index 3397f1e..a903e5c 100644
--- a/meta/classes/packagedata.bbclass
+++ b/meta/classes/packagedata.bbclass
@@ -2,10 +2,10 @@ python read_subpackage_metadata () {
     import oe.packagedata
 
     vars = {
-        "PN" : d.getVar('PN', True), 
-        "PE" : d.getVar('PE', True), 
-        "PV" : d.getVar('PV', True),
-        "PR" : d.getVar('PR', True),
+        "PN" : d.getVar('PN'), 
+        "PE" : d.getVar('PE'), 
+        "PV" : d.getVar('PV'),
+        "PR" : d.getVar('PR'),
     }
 
     data = oe.packagedata.read_pkgdata(vars["PN"], d)
@@ -13,7 +13,7 @@ python read_subpackage_metadata () {
     for key in data.keys():
         d.setVar(key, data[key])
 
-    for pkg in d.getVar('PACKAGES', True).split():
+    for pkg in d.getVar('PACKAGES').split():
         sdata = oe.packagedata.read_subpkgdata(pkg, d)
         for key in sdata.keys():
             if key in vars:
diff --git a/meta/classes/packagefeed-stability.bbclass b/meta/classes/packagefeed-stability.bbclass
index aa01def..3a12807 100644
--- a/meta/classes/packagefeed-stability.bbclass
+++ b/meta/classes/packagefeed-stability.bbclass
@@ -31,7 +31,7 @@ python() {
     # This assumes that the package_write task is called package_write_<pkgtype>
     # and that the directory in which packages should be written is
     # pointed to by the variable DEPLOY_DIR_<PKGTYPE>
-    for pkgclass in (d.getVar('PACKAGE_CLASSES', True) or '').split():
+    for pkgclass in (d.getVar('PACKAGE_CLASSES') or '').split():
         if pkgclass.startswith('package_'):
             pkgtype = pkgclass.split('_', 1)[1]
             pkgwritefunc = 'do_package_write_%s' % pkgtype
@@ -71,7 +71,7 @@ python() {
 # This isn't the real task function - it's a template that we use in the
 # anonymous python code above
 fakeroot python do_package_compare () {
-    currenttask = d.getVar('BB_CURRENTTASK', True)
+    currenttask = d.getVar('BB_CURRENTTASK')
     pkgtype = currenttask.rsplit('_', 1)[1]
     package_compare_impl(pkgtype, d)
 }
@@ -83,12 +83,12 @@ def package_compare_impl(pkgtype, d):
     import subprocess
     import oe.sstatesig
 
-    pn = d.getVar('PN', True)
+    pn = d.getVar('PN')
     deploydir = d.getVar('DEPLOY_DIR_%s' % pkgtype.upper(), True)
     prepath = deploydir + '-prediff/'
 
     # Find out PKGR values are
-    pkgdatadir = d.getVar('PKGDATA_DIR', True)
+    pkgdatadir = d.getVar('PKGDATA_DIR')
     packages = []
     try:
         with open(os.path.join(pkgdatadir, pn), 'r') as f:
@@ -138,7 +138,7 @@ def package_compare_impl(pkgtype, d):
     files = []
     docopy = False
     manifest, _ = oe.sstatesig.sstate_get_manifest_filename(pkgwritetask, d)
-    mlprefix = d.getVar('MLPREFIX', True)
+    mlprefix = d.getVar('MLPREFIX')
     # Copy recipe's all packages if one of the packages are different to make
     # they have the same PR.
     with open(manifest, 'r') as f:
@@ -215,7 +215,7 @@ def package_compare_impl(pkgtype, d):
                 # multilib), they're identical in theory, but sstate.bbclass
                 # copies it again, so keep align with that.
                 if os.path.exists(destpath) and pkgtype == 'rpm' \
-                        and d.getVar('PACKAGE_ARCH', True) == 'all':
+                        and d.getVar('PACKAGE_ARCH') == 'all':
                     os.unlink(destpath)
                 if (os.stat(srcpath).st_dev == os.stat(destdir).st_dev):
                     # Use a hard link to save space
@@ -229,7 +229,7 @@ def package_compare_impl(pkgtype, d):
 do_cleansstate[postfuncs] += "pfs_cleanpkgs"
 python pfs_cleanpkgs () {
     import errno
-    for pkgclass in (d.getVar('PACKAGE_CLASSES', True) or '').split():
+    for pkgclass in (d.getVar('PACKAGE_CLASSES') or '').split():
         if pkgclass.startswith('package_'):
             pkgtype = pkgclass.split('_', 1)[1]
             deploydir = d.getVar('DEPLOY_DIR_%s' % pkgtype.upper(), True)
diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index 3928c8a..a60a52b 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -16,15 +16,15 @@ PACKAGE_ARCH_EXPANDED := "${PACKAGE_ARCH}"
 
 LICENSE ?= "MIT"
 
-inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH_EXPANDED', True) == 'all', 'allarch', '')}
+inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH_EXPANDED') == 'all', 'allarch', '')}
 
 # This automatically adds -dbg and -dev flavours of all PACKAGES
 # to the list. Their dependencies (RRECOMMENDS) are handled as usual
 # by package_depchains in a following step.
 # Also mark all packages as ALLOW_EMPTY
 python () {
-    packages = d.getVar('PACKAGES', True).split()
-    if d.getVar('PACKAGEGROUP_DISABLE_COMPLEMENTARY', True) != '1':
+    packages = d.getVar('PACKAGES').split()
+    if d.getVar('PACKAGEGROUP_DISABLE_COMPLEMENTARY') != '1':
         types = ['', '-dbg', '-dev']
         if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
             types.append('-ptest')
@@ -49,7 +49,7 @@ do_install[noexec] = "1"
 do_populate_sysroot[noexec] = "1"
 
 python () {
-    initman = d.getVar("VIRTUAL-RUNTIME_init_manager", True)
+    initman = d.getVar("VIRTUAL-RUNTIME_init_manager")
     if initman and initman in ['sysvinit', 'systemd'] and not bb.utils.contains('DISTRO_FEATURES', initman, True, False, d):
         bb.fatal("Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (%s) matches the entries enabled in DISTRO_FEATURES" % initman)
 }
diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 2c1f58c..cc27fd5 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -11,7 +11,7 @@ PATCH_GIT_USER_EMAIL ?= "oe.patch@oe"
 inherit terminal
 
 def src_patches(d, all=False, expand=True):
-    workdir = d.getVar('WORKDIR', True)
+    workdir = d.getVar('WORKDIR')
     fetch = bb.fetch2.Fetch([], d)
     patches = []
     sources = []
@@ -79,13 +79,13 @@ def should_apply(parm, d):
     """Determine if we should apply the given patch"""
 
     if "mindate" in parm or "maxdate" in parm:
-        pn = d.getVar('PN', True)
-        srcdate = d.getVar('SRCDATE_%s' % pn, True)
+        pn = d.getVar('PN')
+        srcdate = d.getVar('SRCDATE_%s' % pn)
         if not srcdate:
-            srcdate = d.getVar('SRCDATE', True)
+            srcdate = d.getVar('SRCDATE')
 
         if srcdate == "now":
-            srcdate = d.getVar('DATE', True)
+            srcdate = d.getVar('DATE')
 
         if "maxdate" in parm and parm["maxdate"] < srcdate:
             return False, 'is outdated'
@@ -95,22 +95,22 @@ def should_apply(parm, d):
 
 
     if "minrev" in parm:
-        srcrev = d.getVar('SRCREV', True)
+        srcrev = d.getVar('SRCREV')
         if srcrev and srcrev < parm["minrev"]:
             return False, 'applies to later revisions'
 
     if "maxrev" in parm:
-        srcrev = d.getVar('SRCREV', True)
+        srcrev = d.getVar('SRCREV')
         if srcrev and srcrev > parm["maxrev"]:
             return False, 'applies to earlier revisions'
 
     if "rev" in parm:
-        srcrev = d.getVar('SRCREV', True)
+        srcrev = d.getVar('SRCREV')
         if srcrev and parm["rev"] not in srcrev:
             return False, "doesn't apply to revision"
 
     if "notrev" in parm:
-        srcrev = d.getVar('SRCREV', True)
+        srcrev = d.getVar('SRCREV')
         if srcrev and parm["notrev"] in srcrev:
             return False, "doesn't apply to revision"
 
@@ -127,20 +127,20 @@ python patch_do_patch() {
         "git": oe.patch.GitApplyTree,
     }
 
-    cls = patchsetmap[d.getVar('PATCHTOOL', True) or 'quilt']
+    cls = patchsetmap[d.getVar('PATCHTOOL') or 'quilt']
 
     resolvermap = {
         "noop": oe.patch.NOOPResolver,
         "user": oe.patch.UserResolver,
     }
 
-    rcls = resolvermap[d.getVar('PATCHRESOLVE', True) or 'user']
+    rcls = resolvermap[d.getVar('PATCHRESOLVE') or 'user']
 
     classes = {}
 
-    s = d.getVar('S', True)
+    s = d.getVar('S')
 
-    os.putenv('PATH', d.getVar('PATH', True))
+    os.putenv('PATH', d.getVar('PATH'))
 
     # We must use one TMPDIR per process so that the "patch" processes
     # don't generate the same temp file name.
diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 3f48a0f..63bf079 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -28,20 +28,20 @@ fi
 }
 
 python populate_packages_append() {
-    pixbuf_pkgs = d.getVar('PIXBUF_PACKAGES', True).split()
+    pixbuf_pkgs = d.getVar('PIXBUF_PACKAGES').split()
 
     for pkg in pixbuf_pkgs:
         bb.note("adding pixbuf postinst and postrm scripts to %s" % pkg)
-        postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
+        postinst = d.getVar('pkg_postinst_%s' % pkg) or d.getVar('pkg_postinst')
         if not postinst:
             postinst = '#!/bin/sh\n'
-        postinst += d.getVar('pixbufcache_common', True)
+        postinst += d.getVar('pixbufcache_common')
         d.setVar('pkg_postinst_%s' % pkg, postinst)
 
-        postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
+        postrm = d.getVar('pkg_postrm_%s' % pkg) or d.getVar('pkg_postrm')
         if not postrm:
             postrm = '#!/bin/sh\n'
-        postrm += d.getVar('pixbufcache_common', True)
+        postrm += d.getVar('pixbufcache_common')
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
 
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 220cde6..48bc395 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -11,7 +11,7 @@ COMPLEMENTARY_GLOB[ptest-pkgs] = '*-ptest'
 def complementary_globs(featurevar, d):
     all_globs = d.getVarFlags('COMPLEMENTARY_GLOB')
     globs = []
-    features = set((d.getVar(featurevar, True) or '').split())
+    features = set((d.getVar(featurevar) or '').split())
     for name, glob in all_globs.items():
         if name in features:
             globs.append(glob)
@@ -57,30 +57,30 @@ SDK_PRE_INSTALL_COMMAND ?= ""
 SDK_POST_INSTALL_COMMAND ?= ""
 SDK_RELOCATE_AFTER_INSTALL ?= "1"
 
-SDKEXTPATH ?= "~/${@d.getVar('DISTRO', True)}_sdk"
-SDK_TITLE ?= "${@d.getVar('DISTRO_NAME', True) or d.getVar('DISTRO', True)} SDK"
+SDKEXTPATH ?= "~/${@d.getVar('DISTRO')}_sdk"
+SDK_TITLE ?= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
 
 SDK_TARGET_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
 SDK_HOST_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
 python write_target_sdk_manifest () {
     from oe.sdk import sdk_list_installed_packages
     from oe.utils import format_pkg_list
-    sdkmanifestdir = os.path.dirname(d.getVar("SDK_TARGET_MANIFEST", True))
+    sdkmanifestdir = os.path.dirname(d.getVar("SDK_TARGET_MANIFEST"))
     pkgs = sdk_list_installed_packages(d, True)
     if not os.path.exists(sdkmanifestdir):
         bb.utils.mkdirhier(sdkmanifestdir)
-    with open(d.getVar('SDK_TARGET_MANIFEST', True), 'w') as output:
+    with open(d.getVar('SDK_TARGET_MANIFEST'), 'w') as output:
         output.write(format_pkg_list(pkgs, 'ver'))
 }
 
 python write_host_sdk_manifest () {
     from oe.sdk import sdk_list_installed_packages
     from oe.utils import format_pkg_list
-    sdkmanifestdir = os.path.dirname(d.getVar("SDK_HOST_MANIFEST", True))
+    sdkmanifestdir = os.path.dirname(d.getVar("SDK_HOST_MANIFEST"))
     pkgs = sdk_list_installed_packages(d, False)
     if not os.path.exists(sdkmanifestdir):
         bb.utils.mkdirhier(sdkmanifestdir)
-    with open(d.getVar('SDK_HOST_MANIFEST', True), 'w') as output:
+    with open(d.getVar('SDK_HOST_MANIFEST'), 'w') as output:
         output.write(format_pkg_list(pkgs, 'ver'))
 }
 
@@ -93,7 +93,7 @@ def populate_sdk_common(d):
     from oe.sdk import populate_sdk
     from oe.manifest import create_manifest, Manifest
 
-    pn = d.getVar('PN', True)
+    pn = d.getVar('PN')
     runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", pn, d)
     runtime_mapping_rename("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY", pn, d)
 
@@ -101,13 +101,13 @@ def populate_sdk_common(d):
     ld.setVar("PKGDATA_DIR", "${STAGING_DIR}/${SDK_ARCH}-${SDKPKGSUFFIX}${SDK_VENDOR}-${SDK_OS}/pkgdata")
     runtime_mapping_rename("TOOLCHAIN_HOST_TASK", pn, ld)
     runtime_mapping_rename("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", pn, ld)
-    d.setVar("TOOLCHAIN_HOST_TASK", ld.getVar("TOOLCHAIN_HOST_TASK", True))
-    d.setVar("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", ld.getVar("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", True))
+    d.setVar("TOOLCHAIN_HOST_TASK", ld.getVar("TOOLCHAIN_HOST_TASK"))
+    d.setVar("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", ld.getVar("TOOLCHAIN_HOST_TASK_ATTEMPTONLY"))
     
     # create target/host SDK manifests
-    create_manifest(d, manifest_dir=d.getVar('SDK_DIR', True),
+    create_manifest(d, manifest_dir=d.getVar('SDK_DIR'),
                     manifest_type=Manifest.MANIFEST_TYPE_SDK_HOST)
-    create_manifest(d, manifest_dir=d.getVar('SDK_DIR', True),
+    create_manifest(d, manifest_dir=d.getVar('SDK_DIR'),
                     manifest_type=Manifest.MANIFEST_TYPE_SDK_TARGET)
 
     populate_sdk(d)
@@ -134,7 +134,7 @@ fakeroot create_sdk_files() {
 python check_sdk_sysroots() {
     # Fails build if there are broken or dangling symlinks in SDK sysroots
 
-    if d.getVar('CHECK_SDK_SYSROOTS', True) != '1':
+    if d.getVar('CHECK_SDK_SYSROOTS') != '1':
         # disabled, bail out
         return
 
@@ -142,8 +142,8 @@ python check_sdk_sysroots() {
         return os.path.abspath(path)
 
     # Get scan root
-    SCAN_ROOT = norm_path("%s/%s/sysroots/" % (d.getVar('SDK_OUTPUT', True),
-                                               d.getVar('SDKPATH', True)))
+    SCAN_ROOT = norm_path("%s/%s/sysroots/" % (d.getVar('SDK_OUTPUT'),
+                                               d.getVar('SDKPATH')))
 
     bb.note('Checking SDK sysroots at ' + SCAN_ROOT)
 
@@ -218,7 +218,7 @@ EOF
 		-e 's#@SDKEXTPATH@#${SDKEXTPATH}#g' \
 		-e 's#@OLDEST_KERNEL@#${SDK_OLDEST_KERNEL}#g' \
 		-e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
-		-e 's#@SDK_TITLE@#${@d.getVar("SDK_TITLE", True).replace('&', '\&')}#g' \
+		-e 's#@SDK_TITLE@#${@d.getVar("SDK_TITLE").replace('&', '\&')}#g' \
 		-e 's#@SDK_VERSION@#${SDK_VERSION}#g' \
 		-e '/@SDK_PRE_INSTALL_COMMAND@/d' \
 		-e '/@SDK_POST_INSTALL_COMMAND@/d' \
@@ -268,7 +268,7 @@ do_populate_sdk[file-checksums] += "${COREBASE}/meta/files/toolchain-shar-reloca
                                     ${COREBASE}/meta/files/toolchain-shar-extract.sh:True"
 
 do_populate_sdk[dirs] = "${PKGDATA_DIR} ${TOPDIR}"
-do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS', True).split()])}  ${@d.getVarFlag('do_rootfs', 'depends', False)}"
-do_populate_sdk[rdepends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_RDEPENDS', True).split()])}"
+do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS').split()])}  ${@d.getVarFlag('do_rootfs', 'depends', False)}"
+do_populate_sdk[rdepends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_RDEPENDS').split()])}"
 do_populate_sdk[recrdeptask] += "do_packagedata do_package_write_rpm do_package_write_ipk do_package_write_deb"
 addtask populate_sdk
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 0e3656b..d3c3c49 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -21,7 +21,7 @@ SDK_EXT_task-populate-sdk-ext = "-ext"
 # Options are full or minimal
 SDK_EXT_TYPE ?= "full"
 SDK_INCLUDE_PKGDATA ?= "0"
-SDK_INCLUDE_TOOLCHAIN ?= "${@'1' if d.getVar('SDK_EXT_TYPE', True) == 'full' else '0'}"
+SDK_INCLUDE_TOOLCHAIN ?= "${@'1' if d.getVar('SDK_EXT_TYPE') == 'full' else '0'}"
 
 SDK_RECRDEP_TASKS ?= ""
 
@@ -43,8 +43,8 @@ SDK_TARGETS ?= "${PN}"
 
 def get_sdk_install_targets(d, images_only=False):
     sdk_install_targets = ''
-    if images_only or d.getVar('SDK_EXT_TYPE', True) != 'minimal':
-        sdk_install_targets = d.getVar('SDK_TARGETS', True)
+    if images_only or d.getVar('SDK_EXT_TYPE') != 'minimal':
+        sdk_install_targets = d.getVar('SDK_TARGETS')
 
         depd = d.getVar('BB_TASKDEPDATA', False)
         for v in depd.values():
@@ -53,9 +53,9 @@ def get_sdk_install_targets(d, images_only=False):
                     sdk_install_targets += ' {}'.format(v[0])
 
     if not images_only:
-        if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1':
+        if d.getVar('SDK_INCLUDE_PKGDATA') == '1':
             sdk_install_targets += ' meta-world-pkgdata:do_allpackagedata'
-        if d.getVar('SDK_INCLUDE_TOOLCHAIN', True) == '1':
+        if d.getVar('SDK_INCLUDE_TOOLCHAIN') == '1':
             sdk_install_targets += ' meta-extsdk-toolchain:do_populate_sysroot'
 
     return sdk_install_targets
@@ -83,7 +83,7 @@ TOOLCHAIN_OUTPUTNAME_task-populate-sdk-ext = "${TOOLCHAINEXT_OUTPUTNAME}"
 SDK_EXT_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"
 SDK_EXT_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"
 
-SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME', True) or d.getVar('DISTRO', True)} Extensible SDK"
+SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} Extensible SDK"
 
 def clean_esdk_builddir(d, sdkbasepath):
     """Clean up traces of the fake build for create_filtered_tasklist()"""
@@ -110,14 +110,14 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
     try:
         with open(sdkbasepath + '/conf/local.conf', 'a') as f:
             # Force the use of sstate from the build system
-            f.write('\nSSTATE_DIR_forcevariable = "%s"\n' % d.getVar('SSTATE_DIR', True))
+            f.write('\nSSTATE_DIR_forcevariable = "%s"\n' % d.getVar('SSTATE_DIR'))
             f.write('SSTATE_MIRRORS_forcevariable = ""\n')
             # Ensure TMPDIR is the default so that clean_esdk_builddir() can delete it
             f.write('TMPDIR_forcevariable = "${TOPDIR}/tmp"\n')
 
         # Unfortunately the default SDKPATH (or even a custom value) may contain characters that bitbake
         # will not allow in its COREBASE path, so we need to rename the directory temporarily
-        temp_sdkbasepath = d.getVar('SDK_OUTPUT', True) + '/tmp-renamed-sdk'
+        temp_sdkbasepath = d.getVar('SDK_OUTPUT') + '/tmp-renamed-sdk'
         # Delete any existing temp dir
         try:
             shutil.rmtree(temp_sdkbasepath)
@@ -126,7 +126,7 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
         os.rename(sdkbasepath, temp_sdkbasepath)
         try:
             cmdprefix = '. %s .; ' % conf_initpath
-            logfile = d.getVar('WORKDIR', True) + '/tasklist_bb_log.txt'
+            logfile = d.getVar('WORKDIR') + '/tasklist_bb_log.txt'
             try:
                 oe.copy_buildsystem.check_sstate_task_list(d, get_sdk_install_targets(d), tasklistfile, cmdprefix=cmdprefix, cwd=temp_sdkbasepath, logfile=logfile)
             except bb.process.ExecutionError as e:
@@ -148,7 +148,7 @@ python copy_buildsystem () {
     import glob
     import oe.copy_buildsystem
 
-    oe_init_env_script = d.getVar('OE_INIT_ENV_SCRIPT', True)
+    oe_init_env_script = d.getVar('OE_INIT_ENV_SCRIPT')
 
     conf_bbpath = ''
     conf_initpath = ''
@@ -156,10 +156,10 @@ python copy_buildsystem () {
 
     # Copy in all metadata layers + bitbake (as repositories)
     buildsystem = oe.copy_buildsystem.BuildSystem('extensible SDK', d)
-    baseoutpath = d.getVar('SDK_OUTPUT', True) + '/' + d.getVar('SDKPATH', True)
+    baseoutpath = d.getVar('SDK_OUTPUT') + '/' + d.getVar('SDKPATH')
 
     # Determine if we're building a derivative extensible SDK (from devtool build-sdk)
-    derivative = (d.getVar('SDK_DERIVATIVE', True) or '') == '1'
+    derivative = (d.getVar('SDK_DERIVATIVE') or '') == '1'
     if derivative:
         workspace_name = 'orig-workspace'
     else:
@@ -167,7 +167,7 @@ python copy_buildsystem () {
     layers_copied = buildsystem.copy_bitbake_and_layers(baseoutpath + '/layers', workspace_name)
 
     sdkbblayers = []
-    corebase = os.path.basename(d.getVar('COREBASE', True))
+    corebase = os.path.basename(d.getVar('COREBASE'))
     for layer in layers_copied:
         if corebase == os.path.basename(layer):
             conf_bbpath = os.path.join('layers', layer, 'bitbake')
@@ -198,8 +198,8 @@ python copy_buildsystem () {
     config.set('General', 'init_path', conf_initpath)
     config.set('General', 'core_meta_subdir', core_meta_subdir)
     config.add_section('SDK')
-    config.set('SDK', 'sdk_targets', d.getVar('SDK_TARGETS', True))
-    updateurl = d.getVar('SDK_UPDATE_URL', True)
+    config.set('SDK', 'sdk_targets', d.getVar('SDK_TARGETS'))
+    updateurl = d.getVar('SDK_UPDATE_URL')
     if updateurl:
         config.set('SDK', 'updateserver', updateurl)
     bb.utils.mkdirhier(os.path.join(baseoutpath, 'conf'))
@@ -211,7 +211,7 @@ python copy_buildsystem () {
         pass
 
     # Create a layer for new recipes / appends
-    bbpath = d.getVar('BBPATH', True)
+    bbpath = d.getVar('BBPATH')
     bb.process.run(['devtool', '--bbpath', bbpath, '--basepath', baseoutpath, 'create-workspace', '--create-only', os.path.join(baseoutpath, 'workspace')])
 
     # Create bblayers.conf
@@ -244,16 +244,16 @@ python copy_buildsystem () {
     bb.utils.mkdirhier(uninative_outdir)
     shutil.copy(uninative_file, uninative_outdir)
 
-    env_whitelist = (d.getVar('BB_ENV_EXTRAWHITE', True) or '').split()
+    env_whitelist = (d.getVar('BB_ENV_EXTRAWHITE') or '').split()
     env_whitelist_values = {}
 
     # Create local.conf
-    builddir = d.getVar('TOPDIR', True)
+    builddir = d.getVar('TOPDIR')
     if derivative:
         shutil.copyfile(builddir + '/conf/local.conf', baseoutpath + '/conf/local.conf')
     else:
-        local_conf_whitelist = (d.getVar('SDK_LOCAL_CONF_WHITELIST', True) or '').split()
-        local_conf_blacklist = (d.getVar('SDK_LOCAL_CONF_BLACKLIST', True) or '').split()
+        local_conf_whitelist = (d.getVar('SDK_LOCAL_CONF_WHITELIST') or '').split()
+        local_conf_blacklist = (d.getVar('SDK_LOCAL_CONF_BLACKLIST') or '').split()
         def handle_var(varname, origvalue, op, newlines):
             if varname in local_conf_blacklist or (origvalue.strip().startswith('/') and not varname in local_conf_whitelist):
                 newlines.append('# Removed original setting of %s\n' % varname)
@@ -281,7 +281,7 @@ python copy_buildsystem () {
             f.write('DL_DIR = "${TOPDIR}/downloads"\n')
 
             f.write('INHERIT += "%s"\n' % 'uninative')
-            f.write('UNINATIVE_CHECKSUM[%s] = "%s"\n\n' % (d.getVar('BUILD_ARCH', True), uninative_checksum))
+            f.write('UNINATIVE_CHECKSUM[%s] = "%s"\n\n' % (d.getVar('BUILD_ARCH'), uninative_checksum))
             f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION', False))
 
             # Some classes are not suitable for SDK, remove them from INHERIT
@@ -315,7 +315,7 @@ python copy_buildsystem () {
 
             # If you define a sdk_extraconf() function then it can contain additional config
             # (Though this is awkward; sdk-extra.conf should probably be used instead)
-            extraconf = (d.getVar('sdk_extraconf', True) or '').strip()
+            extraconf = (d.getVar('sdk_extraconf') or '').strip()
             if extraconf:
                 # Strip off any leading / trailing spaces
                 for line in extraconf.splitlines():
@@ -348,7 +348,7 @@ python copy_buildsystem () {
     # BB_ENV_EXTRAWHITE) are set in the SDK's configuration
     extralines = []
     for name, value in env_whitelist_values.items():
-        actualvalue = d.getVar(name, True) or ''
+        actualvalue = d.getVar(name) or ''
         if value != actualvalue:
             extralines.append('%s = "%s"\n' % (name, actualvalue))
     if extralines:
@@ -361,7 +361,7 @@ python copy_buildsystem () {
 
     # Filter the locked signatures file to just the sstate tasks we are interested in
     excluded_targets = get_sdk_install_targets(d, images_only=True)
-    sigfile = d.getVar('WORKDIR', True) + '/locked-sigs.inc'
+    sigfile = d.getVar('WORKDIR') + '/locked-sigs.inc'
     lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
     oe.copy_buildsystem.prune_lockedsigs([],
                                          excluded_targets.split(),
@@ -373,36 +373,36 @@ python copy_buildsystem () {
     # uninative.bbclass sets NATIVELSBSTRING to 'universal'
     fixedlsbstring = 'universal'
 
-    sdk_include_toolchain = (d.getVar('SDK_INCLUDE_TOOLCHAIN', True) == '1')
-    sdk_ext_type = d.getVar('SDK_EXT_TYPE', True)
+    sdk_include_toolchain = (d.getVar('SDK_INCLUDE_TOOLCHAIN') == '1')
+    sdk_ext_type = d.getVar('SDK_EXT_TYPE')
     if sdk_ext_type != 'minimal' or sdk_include_toolchain or derivative:
         # Create the filtered task list used to generate the sstate cache shipped with the SDK
-        tasklistfn = d.getVar('WORKDIR', True) + '/tasklist.txt'
+        tasklistfn = d.getVar('WORKDIR') + '/tasklist.txt'
         create_filtered_tasklist(d, baseoutpath, tasklistfn, conf_initpath)
     else:
         tasklistfn = None
 
     # Add packagedata if enabled
-    if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1':
-        lockedsigs_base = d.getVar('WORKDIR', True) + '/locked-sigs-base.inc'
-        lockedsigs_copy = d.getVar('WORKDIR', True) + '/locked-sigs-copy.inc'
+    if d.getVar('SDK_INCLUDE_PKGDATA') == '1':
+        lockedsigs_base = d.getVar('WORKDIR') + '/locked-sigs-base.inc'
+        lockedsigs_copy = d.getVar('WORKDIR') + '/locked-sigs-copy.inc'
         shutil.move(lockedsigs_pruned, lockedsigs_base)
         oe.copy_buildsystem.merge_lockedsigs(['do_packagedata'],
                                              lockedsigs_base,
-                                             d.getVar('STAGING_DIR_HOST', True) + '/world-pkgdata/locked-sigs-pkgdata.inc',
+                                             d.getVar('STAGING_DIR_HOST') + '/world-pkgdata/locked-sigs-pkgdata.inc',
                                              lockedsigs_pruned,
                                              lockedsigs_copy)
 
     if sdk_include_toolchain:
-        lockedsigs_base = d.getVar('WORKDIR', True) + '/locked-sigs-base2.inc'
-        lockedsigs_toolchain = d.getVar('STAGING_DIR_HOST', True) + '/locked-sigs/locked-sigs-extsdk-toolchain.inc'
+        lockedsigs_base = d.getVar('WORKDIR') + '/locked-sigs-base2.inc'
+        lockedsigs_toolchain = d.getVar('STAGING_DIR_HOST') + '/locked-sigs/locked-sigs-extsdk-toolchain.inc'
         shutil.move(lockedsigs_pruned, lockedsigs_base)
         oe.copy_buildsystem.merge_lockedsigs([],
                                              lockedsigs_base,
                                              lockedsigs_toolchain,
                                              lockedsigs_pruned)
         oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_toolchain,
-                                                       d.getVar('SSTATE_DIR', True),
+                                                       d.getVar('SSTATE_DIR'),
                                                        sstate_out, d,
                                                        fixedlsbstring,
                                                        filterfile=tasklistfn)
@@ -412,22 +412,22 @@ python copy_buildsystem () {
             # Assume the user is not going to set up an additional sstate
             # mirror, thus we need to copy the additional artifacts (from
             # workspace recipes) into the derivative SDK
-            lockedsigs_orig = d.getVar('TOPDIR', True) + '/conf/locked-sigs.inc'
+            lockedsigs_orig = d.getVar('TOPDIR') + '/conf/locked-sigs.inc'
             if os.path.exists(lockedsigs_orig):
-                lockedsigs_extra = d.getVar('WORKDIR', True) + '/locked-sigs-extra.inc'
+                lockedsigs_extra = d.getVar('WORKDIR') + '/locked-sigs-extra.inc'
                 oe.copy_buildsystem.merge_lockedsigs(None,
                                                      lockedsigs_orig,
                                                      lockedsigs_pruned,
                                                      None,
                                                      lockedsigs_extra)
                 oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_extra,
-                                                               d.getVar('SSTATE_DIR', True),
+                                                               d.getVar('SSTATE_DIR'),
                                                                sstate_out, d,
                                                                fixedlsbstring,
                                                                filterfile=tasklistfn)
     else:
         oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_pruned,
-                                                       d.getVar('SSTATE_DIR', True),
+                                                       d.getVar('SSTATE_DIR'),
                                                        sstate_out, d,
                                                        fixedlsbstring,
                                                        filterfile=tasklistfn)
@@ -458,24 +458,24 @@ python copy_buildsystem () {
 def get_current_buildtools(d):
     """Get the file name of the current buildtools installer"""
     import glob
-    btfiles = glob.glob(os.path.join(d.getVar('SDK_DEPLOY', True), '*-buildtools-nativesdk-standalone-*.sh'))
+    btfiles = glob.glob(os.path.join(d.getVar('SDK_DEPLOY'), '*-buildtools-nativesdk-standalone-*.sh'))
     btfiles.sort(key=os.path.getctime)
     return os.path.basename(btfiles[-1])
 
 def get_sdk_required_utilities(buildtools_fn, d):
     """Find required utilities that aren't provided by the buildtools"""
-    sanity_required_utilities = (d.getVar('SANITY_REQUIRED_UTILITIES', True) or '').split()
+    sanity_required_utilities = (d.getVar('SANITY_REQUIRED_UTILITIES') or '').split()
     sanity_required_utilities.append(d.expand('${BUILD_PREFIX}gcc'))
     sanity_required_utilities.append(d.expand('${BUILD_PREFIX}g++'))
-    buildtools_installer = os.path.join(d.getVar('SDK_DEPLOY', True), buildtools_fn)
+    buildtools_installer = os.path.join(d.getVar('SDK_DEPLOY'), buildtools_fn)
     filelist, _ = bb.process.run('%s -l' % buildtools_installer)
     localdata = bb.data.createCopy(d)
     localdata.setVar('SDKPATH', '.')
-    sdkpathnative = localdata.getVar('SDKPATHNATIVE', True)
-    sdkbindirs = [localdata.getVar('bindir_nativesdk', True),
-                  localdata.getVar('sbindir_nativesdk', True),
-                  localdata.getVar('base_bindir_nativesdk', True),
-                  localdata.getVar('base_sbindir_nativesdk', True)]
+    sdkpathnative = localdata.getVar('SDKPATHNATIVE')
+    sdkbindirs = [localdata.getVar('bindir_nativesdk'),
+                  localdata.getVar('sbindir_nativesdk'),
+                  localdata.getVar('base_bindir_nativesdk'),
+                  localdata.getVar('base_sbindir_nativesdk')]
     for line in filelist.splitlines():
         splitline = line.split()
         if len(splitline) > 5:
@@ -504,7 +504,7 @@ install_tools() {
 	# (they get populated from sstate on installation)
 	unfsd_path="${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/unfsd"
 	if [ "${SDK_INCLUDE_TOOLCHAIN}" == "1" -a ! -e $unfsd_path ] ; then
-		binrelpath=${@os.path.relpath(d.getVar('STAGING_BINDIR_NATIVE',True), d.getVar('TOPDIR', True))}
+		binrelpath=${@os.path.relpath(d.getVar('STAGING_BINDIR_NATIVE',True), d.getVar('TOPDIR'))}
 		lnr ${SDK_OUTPUT}/${SDKPATH}/$binrelpath/unfsd $unfsd_path
 	fi
 	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
@@ -606,8 +606,8 @@ SDK_INSTALL_TARGETS = ""
 fakeroot python do_populate_sdk_ext() {
     # FIXME hopefully we can remove this restriction at some point, but uninative
     # currently forces this upon us
-    if d.getVar('SDK_ARCH', True) != d.getVar('BUILD_ARCH', True):
-        bb.fatal('The extensible SDK can currently only be built for the same architecture as the machine being built on - SDK_ARCH is set to %s (likely via setting SDKMACHINE) which is different from the architecture of the build machine (%s). Unable to continue.' % (d.getVar('SDK_ARCH', True), d.getVar('BUILD_ARCH', True)))
+    if d.getVar('SDK_ARCH') != d.getVar('BUILD_ARCH'):
+        bb.fatal('The extensible SDK can currently only be built for the same architecture as the machine being built on - SDK_ARCH is set to %s (likely via setting SDKMACHINE) which is different from the architecture of the build machine (%s). Unable to continue.' % (d.getVar('SDK_ARCH'), d.getVar('BUILD_ARCH')))
 
     if not bb.data.inherits_class('uninative', d):
         bb.fatal('The extensible SDK requires uninative to be enabled. Enabling this is straightforward - just add the following to your configuration:\n\nrequire meta/conf/distro/include/yocto-uninative.inc\nINHERIT += "uninative"\n')
@@ -624,7 +624,7 @@ fakeroot python do_populate_sdk_ext() {
 def get_ext_sdk_depends(d):
     # Note: the deps varflag is a list not a string, so we need to specify expand=False
     deps = d.getVarFlag('do_image_complete', 'deps', False)
-    pn = d.getVar('PN', True)
+    pn = d.getVar('PN')
     deplist = ['%s:%s' % (pn, dep) for dep in deps]
     for task in ['do_image_complete', 'do_rootfs', 'do_build']:
         deplist.extend((d.getVarFlag(task, 'depends', True) or '').split())
@@ -635,7 +635,7 @@ python do_sdk_depends() {
     # dependencies we don't need to (e.g. buildtools-tarball) and bringing those
     # into the SDK's sstate-cache
     import oe.copy_buildsystem
-    sigfile = d.getVar('WORKDIR', True) + '/locked-sigs.inc'
+    sigfile = d.getVar('WORKDIR') + '/locked-sigs.inc'
     oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
 }
 addtask sdk_depends
@@ -656,10 +656,10 @@ do_populate_sdk_ext[dirs] = "${@d.getVarFlag('do_populate_sdk', 'dirs', False)}"
 
 do_populate_sdk_ext[depends] = "${@d.getVarFlag('do_populate_sdk', 'depends', False)} \
                                 buildtools-tarball:do_populate_sdk uninative-tarball:do_populate_sdk \
-                                ${@'meta-world-pkgdata:do_collect_packagedata' if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1' else ''} \
-                                ${@'meta-extsdk-toolchain:do_locked_sigs' if d.getVar('SDK_INCLUDE_TOOLCHAIN', True) == '1' else ''}"
+                                ${@'meta-world-pkgdata:do_collect_packagedata' if d.getVar('SDK_INCLUDE_PKGDATA') == '1' else ''} \
+                                ${@'meta-extsdk-toolchain:do_locked_sigs' if d.getVar('SDK_INCLUDE_TOOLCHAIN') == '1' else ''}"
 
-do_populate_sdk_ext[rdepends] += "${@' '.join([x + ':do_build' for x in d.getVar('SDK_TARGETS', True).split()])}"
+do_populate_sdk_ext[rdepends] += "${@' '.join([x + ':do_build' for x in d.getVar('SDK_TARGETS').split()])}"
 
 # Make sure code changes can result in rebuild
 do_populate_sdk_ext[vardeps] += "copy_buildsystem \
diff --git a/meta/classes/prexport.bbclass b/meta/classes/prexport.bbclass
index 809ec10..6dcf99e 100644
--- a/meta/classes/prexport.bbclass
+++ b/meta/classes/prexport.bbclass
@@ -15,7 +15,7 @@ python prexport_handler () {
     if isinstance(e, bb.event.RecipeParsed):
         import oe.prservice
         #get all PR values for the current PRAUTOINX
-        ver = e.data.getVar('PRSERV_DUMPOPT_VERSION', True)
+        ver = e.data.getVar('PRSERV_DUMPOPT_VERSION')
         ver = ver.replace('%','-')
         retval = oe.prservice.prserv_dump_db(e.data)
         if not retval:
@@ -40,7 +40,7 @@ python prexport_handler () {
         import oe.prservice
         oe.prservice.prserv_check_avail(e.data)
         #remove dumpfile
-        bb.utils.remove(e.data.getVar('PRSERV_DUMPFILE', True))
+        bb.utils.remove(e.data.getVar('PRSERV_DUMPFILE'))
     elif isinstance(e, bb.event.ParseCompleted):
         import oe.prservice
         #dump meta info of tables
diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index fa3561e..798d802 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -61,7 +61,7 @@ python () {
         d.setVarFlag('do_install_ptest_base', 'fakeroot', '1')
 
     # Remove all '*ptest_base' tasks when ptest is not enabled
-    if not(d.getVar('PTEST_ENABLED', True) == "1"):
+    if not(d.getVar('PTEST_ENABLED') == "1"):
         for i in ['do_configure_ptest_base', 'do_compile_ptest_base', 'do_install_ptest_base']:
             bb.build.deltask(i, d)
 }
diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index f2d4d1c..6167582 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -4,12 +4,12 @@
 #
 
 def qemu_target_binary(data):
-    package_arch = data.getVar("PACKAGE_ARCH", True)
-    qemu_target_binary = (data.getVar("QEMU_TARGET_BINARY_%s" % package_arch, True) or "")
+    package_arch = data.getVar("PACKAGE_ARCH")
+    qemu_target_binary = (data.getVar("QEMU_TARGET_BINARY_%s" % package_arch) or "")
     if qemu_target_binary:
         return qemu_target_binary
 
-    target_arch = data.getVar("TARGET_ARCH", True)
+    target_arch = data.getVar("TARGET_ARCH")
     if target_arch in ("i486", "i586", "i686"):
         target_arch = "i386"
     elif target_arch == "powerpc":
@@ -26,7 +26,7 @@ def qemu_wrapper_cmdline(data, rootfs_path, library_paths):
     if qemu_binary == "qemu-allarch":
         qemu_binary = "qemuwrapper"
 
-    qemu_options = data.getVar("QEMU_OPTIONS", True)    
+    qemu_options = data.getVar("QEMU_OPTIONS")    
 
     return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
             + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
@@ -52,7 +52,7 @@ def qemu_run_binary(data, rootfs_path, binary):
 # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
 # qemu-arm default CPU supports all required architecture levels.
 
-QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH', True), True) or ""}"
+QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH'), True) or ""}"
 QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
 
 QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 39df3ad..54517bb 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -55,17 +55,17 @@ write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
 python write_qemuboot_conf() {
     import configparser
 
-    qemuboot = "%s/%s.qemuboot.conf" % (d.getVar('DEPLOY_DIR_IMAGE', True), d.getVar('IMAGE_NAME', True))
-    qemuboot_link = "%s/%s.qemuboot.conf" % (d.getVar('DEPLOY_DIR_IMAGE', True), d.getVar('IMAGE_LINK_NAME', True))
+    qemuboot = "%s/%s.qemuboot.conf" % (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('IMAGE_NAME'))
+    qemuboot_link = "%s/%s.qemuboot.conf" % (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('IMAGE_LINK_NAME'))
     cf = configparser.ConfigParser()
     cf.add_section('config_bsp')
     for k in qemuboot_vars(d):
-        cf.set('config_bsp', k, '%s' % d.getVar(k, True))
+        cf.set('config_bsp', k, '%s' % d.getVar(k))
 
     # QB_DEFAULT_KERNEL's value of KERNEL_IMAGETYPE is the name of a symlink
     # to the kernel file, which hinders relocatability of the qb conf.
     # Read the link and replace it with the full filename of the target.
-    kernel_link = os.path.join(d.getVar('DEPLOY_DIR_IMAGE', True), d.getVar('QB_DEFAULT_KERNEL', True))
+    kernel_link = os.path.join(d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('QB_DEFAULT_KERNEL'))
     kernel = os.path.realpath(kernel_link)
     cf.set('config_bsp', 'QB_DEFAULT_KERNEL', kernel)
 
diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index add34df..3b00b0e 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -1,5 +1,5 @@
 def __note(msg, d):
-    bb.note("%s: recipe_sanity: %s" % (d.getVar("P", True), msg))
+    bb.note("%s: recipe_sanity: %s" % (d.getVar("P"), msg))
 
 __recipe_sanity_badruntimevars = "RDEPENDS RPROVIDES RRECOMMENDS RCONFLICTS"
 def bad_runtime_vars(cfgdata, d):
@@ -7,7 +7,7 @@ def bad_runtime_vars(cfgdata, d):
             bb.data.inherits_class("cross", d):
         return
 
-    for var in d.getVar("__recipe_sanity_badruntimevars", True).split():
+    for var in d.getVar("__recipe_sanity_badruntimevars").split():
         val = d.getVar(var, False)
         if val and val != cfgdata.get(var):
             __note("%s should be %s_${PN}" % (var, var), d)
@@ -15,11 +15,11 @@ def bad_runtime_vars(cfgdata, d):
 __recipe_sanity_reqvars = "DESCRIPTION"
 __recipe_sanity_reqdiffvars = ""
 def req_vars(cfgdata, d):
-    for var in d.getVar("__recipe_sanity_reqvars", True).split():
+    for var in d.getVar("__recipe_sanity_reqvars").split():
         if not d.getVar(var, False):
             __note("%s should be set" % var, d)
 
-    for var in d.getVar("__recipe_sanity_reqdiffvars", True).split():
+    for var in d.getVar("__recipe_sanity_reqdiffvars").split():
         val = d.getVar(var, False)
         cfgval = cfgdata.get(var)
 
@@ -38,11 +38,11 @@ def var_renames_overwrite(cfgdata, d):
 def incorrect_nonempty_PACKAGES(cfgdata, d):
     if bb.data.inherits_class("native", d) or \
             bb.data.inherits_class("cross", d):
-        if d.getVar("PACKAGES", True):
+        if d.getVar("PACKAGES"):
             return True
 
 def can_use_autotools_base(cfgdata, d):
-    cfg = d.getVar("do_configure", True)
+    cfg = d.getVar("do_configure")
     if not bb.data.inherits_class("autotools", d):
         return False
 
@@ -61,7 +61,7 @@ def can_delete_FILESPATH(cfgdata, d):
     expected = cfgdata.get("FILESPATH")
     expectedpaths = d.expand(expected)
     unexpanded = d.getVar("FILESPATH", False)
-    filespath = d.getVar("FILESPATH", True).split(":")
+    filespath = d.getVar("FILESPATH").split(":")
     filespath = [os.path.normpath(f) for f in filespath if os.path.exists(f)]
     for fp in filespath:
         if not fp in expectedpaths:
@@ -72,13 +72,13 @@ def can_delete_FILESPATH(cfgdata, d):
 
 def can_delete_FILESDIR(cfgdata, d):
     expected = cfgdata.get("FILESDIR")
-    #expected = "${@bb.utils.which(d.getVar('FILESPATH', True), '.')}"
+    #expected = "${@bb.utils.which(d.getVar('FILESPATH'), '.')}"
     unexpanded = d.getVar("FILESDIR", False)
     if unexpanded is None:
         return False
 
-    expanded = os.path.normpath(d.getVar("FILESDIR", True))
-    filespath = d.getVar("FILESPATH", True).split(":")
+    expanded = os.path.normpath(d.getVar("FILESDIR"))
+    filespath = d.getVar("FILESPATH").split(":")
     filespath = [os.path.normpath(f) for f in filespath if os.path.exists(f)]
 
     return unexpanded != expected and \
@@ -96,7 +96,7 @@ def can_delete_others(p, cfgdata, d):
             continue
 
         try:
-            expanded = d.getVar(k, True)
+            expanded = d.getVar(k)
             cfgexpanded = d.expand(cfgunexpanded)
         except bb.fetch.ParameterError:
             continue
@@ -108,8 +108,8 @@ def can_delete_others(p, cfgdata, d):
                        (p, cfgunexpanded, unexpanded, expanded))
 
 python do_recipe_sanity () {
-    p = d.getVar("P", True)
-    p = "%s %s %s" % (d.getVar("PN", True), d.getVar("PV", True), d.getVar("PR", True))
+    p = d.getVar("P")
+    p = "%s %s %s" % (d.getVar("PN"), d.getVar("PV"), d.getVar("PR"))
 
     sanitychecks = [
         (can_delete_FILESDIR, "candidate for removal of FILESDIR"),
diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 5bb231e..d6fdd36 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -10,7 +10,7 @@ ERR_REPORT_DIR ?= "${LOG_DIR}/error-report"
 
 def errorreport_getdata(e):
     import codecs
-    logpath = e.data.getVar('ERR_REPORT_DIR', True)
+    logpath = e.data.getVar('ERR_REPORT_DIR')
     datafile = os.path.join(logpath, "error-report.txt")
     with codecs.open(datafile, 'r', 'utf-8') as f:
         data = f.read()
@@ -19,7 +19,7 @@ def errorreport_getdata(e):
 def errorreport_savedata(e, newdata, file):
     import json
     import codecs
-    logpath = e.data.getVar('ERR_REPORT_DIR', True)
+    logpath = e.data.getVar('ERR_REPORT_DIR')
     datafile = os.path.join(logpath, file)
     with codecs.open(datafile, 'w', 'utf-8') as f:
         json.dump(newdata, f, indent=4, sort_keys=True)
@@ -29,18 +29,18 @@ python errorreport_handler () {
         import json
         import codecs
 
-        logpath = e.data.getVar('ERR_REPORT_DIR', True)
+        logpath = e.data.getVar('ERR_REPORT_DIR')
         datafile = os.path.join(logpath, "error-report.txt")
 
         if isinstance(e, bb.event.BuildStarted):
             bb.utils.mkdirhier(logpath)
             data = {}
-            machine = e.data.getVar("MACHINE", True)
+            machine = e.data.getVar("MACHINE")
             data['machine'] = machine
-            data['build_sys'] = e.data.getVar("BUILD_SYS", True)
-            data['nativelsb'] = e.data.getVar("NATIVELSBSTRING", True)
-            data['distro'] = e.data.getVar("DISTRO", True)
-            data['target_sys'] = e.data.getVar("TARGET_SYS", True)
+            data['build_sys'] = e.data.getVar("BUILD_SYS")
+            data['nativelsb'] = e.data.getVar("NATIVELSBSTRING")
+            data['distro'] = e.data.getVar("DISTRO")
+            data['target_sys'] = e.data.getVar("TARGET_SYS")
             data['failures'] = []
             data['component'] = " ".join(e.getPkgs())
             data['branch_commit'] = str(base_detect_branch(e.data)) + ": " + str(base_detect_revision(e.data))
@@ -51,7 +51,7 @@ python errorreport_handler () {
         elif isinstance(e, bb.build.TaskFailed):
             task = e.task
             taskdata={}
-            log = e.data.getVar('BB_LOGFILE', True)
+            log = e.data.getVar('BB_LOGFILE')
             taskdata['package'] = e.data.expand("${PF}")
             taskdata['task'] = task
             if log:
@@ -61,7 +61,7 @@ python errorreport_handler () {
 
                     # Replace host-specific paths so the logs are cleaner
                     for d in ("TOPDIR", "TMPDIR"):
-                        s = e.data.getVar(d, True)
+                        s = e.data.getVar(d)
                         if s:
                             logdata = logdata.replace(s, d)
 
@@ -92,7 +92,7 @@ python errorreport_handler () {
             bb.utils.unlockfile(lock)
             failures = jsondata['failures']
             if(len(failures) > 0):
-                filename = "error_report_" + e.data.getVar("BUILDNAME", True)+".txt"
+                filename = "error_report_" + e.data.getVar("BUILDNAME")+".txt"
                 datafile = errorreport_savedata(e, jsondata, filename)
                 bb.note("The errors for this build are stored in %s\nYou can send the errors to a reports server by running:\n  send-error-report %s [-s server]" % (datafile, datafile))
                 bb.note("The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.")
diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 64b6981..72018f5 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -119,10 +119,10 @@ rm_work_rootfs[cleandirs] = "${WORKDIR}/rootfs"
 
 python () {
     if bb.data.inherits_class('kernel', d):
-        d.appendVar("RM_WORK_EXCLUDE", ' ' + d.getVar("PN", True))
+        d.appendVar("RM_WORK_EXCLUDE", ' ' + d.getVar("PN"))
     # If the recipe name is in the RM_WORK_EXCLUDE, skip the recipe.
-    excludes = (d.getVar("RM_WORK_EXCLUDE", True) or "").split()
-    pn = d.getVar("PN", True)
+    excludes = (d.getVar("RM_WORK_EXCLUDE") or "").split()
+    pn = d.getVar("PN")
     if pn in excludes:
         d.delVarFlag('rm_work_rootfs', 'cleandirs')
         d.delVarFlag('rm_work_populatesdk', 'cleandirs')
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 0c7ceea..8d48a2d 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -217,9 +217,9 @@ python write_image_manifest () {
     from oe.rootfs import image_list_installed_packages
     from oe.utils import format_pkg_list
 
-    deploy_dir = d.getVar('IMGDEPLOYDIR', True)
-    link_name = d.getVar('IMAGE_LINK_NAME', True)
-    manifest_name = d.getVar('IMAGE_MANIFEST', True)
+    deploy_dir = d.getVar('IMGDEPLOYDIR')
+    link_name = d.getVar('IMAGE_LINK_NAME')
+    manifest_name = d.getVar('IMAGE_MANIFEST')
 
     if not manifest_name:
         return
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index f79fca6..e8facd4 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -14,7 +14,7 @@ do_rootfs[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 do_populate_sdk[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 
 python rootfs_deb_bad_recommendations() {
-    if d.getVar("BAD_RECOMMENDATIONS", True):
+    if d.getVar("BAD_RECOMMENDATIONS"):
         bb.warn("Debian package install does not support BAD_RECOMMENDATIONS")
 }
 do_rootfs[prefuncs] += "rootfs_deb_bad_recommendations"
@@ -25,7 +25,7 @@ opkglibdir = "${localstatedir}/lib/opkg"
 
 python () {
     # Map TARGET_ARCH to Debian's ideas about architectures
-    darch = d.getVar('SDK_ARCH', True)
+    darch = d.getVar('SDK_ARCH')
     if darch in ["x86", "i486", "i586", "i686", "pentium"]:
          d.setVar('DEB_SDK_ARCH', 'i386')
     elif darch == "x86_64":
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index d5c38fe..8c60398 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -27,7 +27,7 @@ MULTILIBRE_ALLOW_REP = "${OPKGLIBDIR}/opkg|/usr/lib/opkg"
 
 python () {
 
-    if d.getVar('BUILD_IMAGES_FROM_FEEDS', True):
+    if d.getVar('BUILD_IMAGES_FROM_FEEDS'):
         flags = d.getVarFlag('do_rootfs', 'recrdeptask', True)
         flags = flags.replace("do_package_write_ipk", "")
         flags = flags.replace("do_deploy", "")
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 37730a7..20beb7c 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -25,7 +25,7 @@ do_rootfs[recrdeptask] += "do_package_write_rpm"
 do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 
 python () {
-    if d.getVar('BUILD_IMAGES_FROM_FEEDS', True):
+    if d.getVar('BUILD_IMAGES_FROM_FEEDS'):
         flags = d.getVarFlag('do_rootfs', 'recrdeptask', True)
         flags = flags.replace("do_package_write_rpm", "")
         flags = flags.replace("do_deploy", "")
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 921b248..9674ae9 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -6,7 +6,7 @@ SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar \
     gzip gawk chrpath wget cpio perl file"
 
 def bblayers_conf_file(d):
-    return os.path.join(d.getVar('TOPDIR', True), 'conf/bblayers.conf')
+    return os.path.join(d.getVar('TOPDIR'), 'conf/bblayers.conf')
 
 def sanity_conf_read(fn):
     with open(fn, 'r') as f:
@@ -39,8 +39,8 @@ SANITY_DIFF_TOOL ?= "meld"
 SANITY_LOCALCONF_SAMPLE ?= "${COREBASE}/meta*/conf/local.conf.sample"
 python oecore_update_localconf() {
     # Check we are using a valid local.conf
-    current_conf  = d.getVar('CONF_VERSION', True)
-    conf_version =  d.getVar('LOCALCONF_VERSION', True)
+    current_conf  = d.getVar('CONF_VERSION')
+    conf_version =  d.getVar('LOCALCONF_VERSION')
 
     failmsg = """Your version of local.conf was generated from an older/newer version of 
 local.conf.sample and there have been updates made to this file. Please compare the two 
@@ -59,8 +59,8 @@ is a good way to visualise the changes."""
 SANITY_SITECONF_SAMPLE ?= "${COREBASE}/meta*/conf/site.conf.sample"
 python oecore_update_siteconf() {
     # If we have a site.conf, check it's valid
-    current_sconf = d.getVar('SCONF_VERSION', True)
-    sconf_version = d.getVar('SITE_CONF_VERSION', True)
+    current_sconf = d.getVar('SCONF_VERSION')
+    sconf_version = d.getVar('SITE_CONF_VERSION')
 
     failmsg = """Your version of site.conf was generated from an older version of 
 site.conf.sample and there have been updates made to this file. Please compare the two 
@@ -80,8 +80,8 @@ SANITY_BBLAYERCONF_SAMPLE ?= "${COREBASE}/meta*/conf/bblayers.conf.sample"
 python oecore_update_bblayers() {
     # bblayers.conf is out of date, so see if we can resolve that
 
-    current_lconf = int(d.getVar('LCONF_VERSION', True))
-    lconf_version = int(d.getVar('LAYER_CONF_VERSION', True))
+    current_lconf = int(d.getVar('LCONF_VERSION'))
+    lconf_version = int(d.getVar('LAYER_CONF_VERSION'))
 
     failmsg = """Your version of bblayers.conf has the wrong LCONF_VERSION (has ${LCONF_VERSION}, expecting ${LAYER_CONF_VERSION}).
 Please compare your file against bblayers.conf.sample and merge any changes before continuing.
@@ -141,7 +141,7 @@ is a good way to visualise the changes."""
         # Handle rename of meta-yocto -> meta-poky
         # This marks the start of separate version numbers but code is needed in OE-Core
         # for the migration, one last time.
-        layers = d.getVar('BBLAYERS', True).split()
+        layers = d.getVar('BBLAYERS').split()
         layers = [ os.path.basename(path) for path in layers ]
         if 'meta-yocto' in layers:
             found = False
@@ -172,7 +172,7 @@ is a good way to visualise the changes."""
 }
 
 def raise_sanity_error(msg, d, network_error=False):
-    if d.getVar("SANITY_USE_EVENTS", True) == "1":
+    if d.getVar("SANITY_USE_EVENTS") == "1":
         try:
             bb.event.fire(bb.event.SanityCheckFailed(msg, network_error), d)
         except TypeError:
@@ -198,7 +198,7 @@ def check_toolchain_tune_args(data, tune, multilib, errs):
     return found_errors
 
 def check_toolchain_args_present(data, tune, multilib, tune_errors, which):
-    args_set = (data.getVar("TUNE_%s" % which, True) or "").split()
+    args_set = (data.getVar("TUNE_%s" % which) or "").split()
     args_wanted = (data.getVar("TUNEABI_REQUIRED_%s_tune-%s" % (which, tune), True) or "").split()
     args_missing = []
 
@@ -228,7 +228,7 @@ def check_toolchain_tune(data, tune, multilib):
         localdata.setVar("OVERRIDES", overrides)
     bb.data.update_data(localdata)
     bb.debug(2, "Sanity-checking tuning '%s' (%s) features:" % (tune, multilib))
-    features = (localdata.getVar("TUNE_FEATURES_tune-%s" % tune, True) or "").split()
+    features = (localdata.getVar("TUNE_FEATURES_tune-%s" % tune) or "").split()
     if not features:
         return "Tuning '%s' has no defined features, and cannot be used." % tune
     valid_tunes = localdata.getVarFlags('TUNEVALID') or {}
@@ -248,9 +248,9 @@ def check_toolchain_tune(data, tune, multilib):
             bb.debug(2, "  %s: %s" % (feature, valid_tunes[feature]))
         else:
             tune_errors.append("Feature '%s' is not defined." % feature)
-    whitelist = localdata.getVar("TUNEABI_WHITELIST", True)
+    whitelist = localdata.getVar("TUNEABI_WHITELIST")
     if whitelist:
-        tuneabi = localdata.getVar("TUNEABI_tune-%s" % tune, True)
+        tuneabi = localdata.getVar("TUNEABI_tune-%s" % tune)
         if not tuneabi:
             tuneabi = tune
         if True not in [x in whitelist.split() for x in tuneabi.split()]:
@@ -264,13 +264,13 @@ def check_toolchain_tune(data, tune, multilib):
 
 def check_toolchain(data):
     tune_error_set = []
-    deftune = data.getVar("DEFAULTTUNE", True)
+    deftune = data.getVar("DEFAULTTUNE")
     tune_errors = check_toolchain_tune(data, deftune, 'default')
     if tune_errors:
         tune_error_set.append(tune_errors)
 
-    multilibs = (data.getVar("MULTILIB_VARIANTS", True) or "").split()
-    global_multilibs = (data.getVar("MULTILIB_GLOBAL_VARIANTS", True) or "").split()
+    multilibs = (data.getVar("MULTILIB_VARIANTS") or "").split()
+    global_multilibs = (data.getVar("MULTILIB_GLOBAL_VARIANTS") or "").split()
 
     if multilibs:
         seen_libs = []
@@ -282,7 +282,7 @@ def check_toolchain(data):
                 seen_libs.append(lib)
             if not lib in global_multilibs:
                 tune_error_set.append("Multilib %s is not present in MULTILIB_GLOBAL_VARIANTS" % lib)
-            tune = data.getVar("DEFAULTTUNE_virtclass-multilib-%s" % lib, True)
+            tune = data.getVar("DEFAULTTUNE_virtclass-multilib-%s" % lib)
             if tune in seen_tunes:
                 tune_error_set.append("The tuning '%s' appears in more than one multilib." % tune)
             else:
@@ -360,10 +360,10 @@ def check_connectivity(d):
     # URI's to check can be set in the CONNECTIVITY_CHECK_URIS variable
     # using the same syntax as for SRC_URI. If the variable is not set
     # the check is skipped
-    test_uris = (d.getVar('CONNECTIVITY_CHECK_URIS', True) or "").split()
+    test_uris = (d.getVar('CONNECTIVITY_CHECK_URIS') or "").split()
     retval = ""
 
-    bbn = d.getVar('BB_NO_NETWORK', True)
+    bbn = d.getVar('BB_NO_NETWORK')
     if bbn not in (None, '0', '1'):
         return 'BB_NO_NETWORK should be "0" or "1", but it is "%s"' % bbn
 
@@ -382,7 +382,7 @@ def check_connectivity(d):
         except Exception as err:
             # Allow the message to be configured so that users can be
             # pointed to a support mechanism.
-            msg = data.getVar('CONNECTIVITY_CHECK_MSG', True) or ""
+            msg = data.getVar('CONNECTIVITY_CHECK_MSG') or ""
             if len(msg) == 0:
                 msg = "%s.\n" % err
                 msg += "    Please ensure your host's network is configured correctly,\n"
@@ -395,7 +395,7 @@ def check_connectivity(d):
 def check_supported_distro(sanity_data):
     from fnmatch import fnmatch
 
-    tested_distros = sanity_data.getVar('SANITY_TESTED_DISTROS', True)
+    tested_distros = sanity_data.getVar('SANITY_TESTED_DISTROS')
     if not tested_distros:
         return
 
@@ -418,17 +418,17 @@ def check_sanity_validmachine(sanity_data):
     messages = ""
 
     # Check TUNE_ARCH is set
-    if sanity_data.getVar('TUNE_ARCH', True) == 'INVALID':
+    if sanity_data.getVar('TUNE_ARCH') == 'INVALID':
         messages = messages + 'TUNE_ARCH is unset. Please ensure your MACHINE configuration includes a valid tune configuration file which will set this correctly.\n'
 
     # Check TARGET_OS is set
-    if sanity_data.getVar('TARGET_OS', True) == 'INVALID':
+    if sanity_data.getVar('TARGET_OS') == 'INVALID':
         messages = messages + 'Please set TARGET_OS directly, or choose a MACHINE or DISTRO that does so.\n'
 
     # Check that we don't have duplicate entries in PACKAGE_ARCHS & that TUNE_PKGARCH is in PACKAGE_ARCHS
-    pkgarchs = sanity_data.getVar('PACKAGE_ARCHS', True)
-    tunepkg = sanity_data.getVar('TUNE_PKGARCH', True)
-    defaulttune = sanity_data.getVar('DEFAULTTUNE', True)
+    pkgarchs = sanity_data.getVar('PACKAGE_ARCHS')
+    tunepkg = sanity_data.getVar('TUNE_PKGARCH')
+    defaulttune = sanity_data.getVar('DEFAULTTUNE')
     tunefound = False
     seen = {}
     dups = []
@@ -476,7 +476,7 @@ def check_gcc_march(sanity_data):
                 result = True;
 
         if not result:
-            build_arch = sanity_data.getVar('BUILD_ARCH', True)
+            build_arch = sanity_data.getVar('BUILD_ARCH')
             status,res = oe.utils.getstatusoutput(sanity_data.expand("${BUILD_CC} -march=%s gcc_test.c -o gcc_test" % build_arch))
             if status == 0:
                 message = "BUILD_CFLAGS_append = \" -march=%s\"" % build_arch
@@ -564,11 +564,11 @@ def check_perl_modules(sanity_data):
     return None
 
 def sanity_check_conffiles(d):
-    funcs = d.getVar('BBLAYERS_CONF_UPDATE_FUNCS', True).split()
+    funcs = d.getVar('BBLAYERS_CONF_UPDATE_FUNCS').split()
     for func in funcs:
         conffile, current_version, required_version, func = func.split(":")
-        if check_conf_exists(conffile, d) and d.getVar(current_version, True) is not None and \
-                d.getVar(current_version, True) != d.getVar(required_version, True):
+        if check_conf_exists(conffile, d) and d.getVar(current_version) is not None and \
+                d.getVar(current_version) != d.getVar(required_version):
             try:
                 bb.build.exec_func(func, d, pythonexception=True)
             except NotImplementedError as e:
@@ -581,8 +581,8 @@ def sanity_handle_abichanges(status, d):
     #
     import subprocess
 
-    current_abi = d.getVar('OELAYOUT_ABI', True)
-    abifile = d.getVar('SANITY_ABIFILE', True)
+    current_abi = d.getVar('OELAYOUT_ABI')
+    abifile = d.getVar('SANITY_ABIFILE')
     if os.path.exists(abifile):
         with open(abifile, "r") as f:
             abi = f.read().strip()
@@ -677,12 +677,12 @@ def check_sanity_version_change(status, d):
         missing = missing + "GNU make,"
 
     if not check_app_exists('${BUILD_CC}', d):
-        missing = missing + "C Compiler (%s)," % d.getVar("BUILD_CC", True)
+        missing = missing + "C Compiler (%s)," % d.getVar("BUILD_CC")
 
     if not check_app_exists('${BUILD_CXX}', d):
-        missing = missing + "C++ Compiler (%s)," % d.getVar("BUILD_CXX", True)
+        missing = missing + "C++ Compiler (%s)," % d.getVar("BUILD_CXX")
 
-    required_utilities = d.getVar('SANITY_REQUIRED_UTILITIES', True)
+    required_utilities = d.getVar('SANITY_REQUIRED_UTILITIES')
 
     for util in required_utilities.split():
         if not check_app_exists(util, d):
@@ -692,7 +692,7 @@ def check_sanity_version_change(status, d):
         missing = missing.rstrip(',')
         status.addresult("Please install the following missing utilities: %s\n" % missing)
 
-    assume_provided = d.getVar('ASSUME_PROVIDED', True).split()
+    assume_provided = d.getVar('ASSUME_PROVIDED').split()
     # Check user doesn't have ASSUME_PROVIDED = instead of += in local.conf
     if "diffstat-native" not in assume_provided:
         status.addresult('Please use ASSUME_PROVIDED +=, not ASSUME_PROVIDED = in your local.conf\n')
@@ -715,7 +715,7 @@ def check_sanity_version_change(status, d):
         status.addresult("        __sync_bool_compare_and_swap (&atomic, 2, 3);\n")
 
     # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
-    tmpdir = d.getVar('TMPDIR', True)
+    tmpdir = d.getVar('TMPDIR')
     status.addresult(check_create_long_filename(tmpdir, "TMPDIR"))
     tmpdirmode = os.stat(tmpdir).st_mode
     if (tmpdirmode & stat.S_ISGID):
@@ -739,7 +739,7 @@ def check_sanity_version_change(status, d):
     if netcheck:
         status.network_error = True
 
-    nolibs = d.getVar('NO32LIBS', True)
+    nolibs = d.getVar('NO32LIBS')
     if not nolibs:
         lib32path = '/lib'
         if os.path.exists('/lib64') and ( os.path.islink('/lib64') or os.path.islink('/lib') ):
@@ -748,7 +748,7 @@ def check_sanity_version_change(status, d):
         if os.path.exists('%s/libc.so.6' % lib32path) and not os.path.exists('/usr/include/gnu/stubs-32.h'):
             status.addresult("You have a 32-bit libc, but no 32-bit headers.  You must install the 32-bit libc headers.\n")
 
-    bbpaths = d.getVar('BBPATH', True).split(":")
+    bbpaths = d.getVar('BBPATH').split(":")
     if ("." in bbpaths or "./" in bbpaths or "" in bbpaths):
         status.addresult("BBPATH references the current directory, either through "    \
                 "an empty entry, a './' or a '.'.\n\t This is unsafe and means your "\
@@ -758,7 +758,7 @@ def check_sanity_version_change(status, d):
                 "references.\n" \
                 "Parsed BBPATH is" + str(bbpaths));
 
-    oes_bb_conf = d.getVar( 'OES_BITBAKE_CONF', True)
+    oes_bb_conf = d.getVar( 'OES_BITBAKE_CONF')
     if not oes_bb_conf:
         status.addresult('You are not using the OpenEmbedded version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n')
 
@@ -793,26 +793,26 @@ def check_sanity_everybuild(status, d):
 
     # Check the bitbake version meets minimum requirements
     from distutils.version import LooseVersion
-    minversion = d.getVar('BB_MIN_VERSION', True)
+    minversion = d.getVar('BB_MIN_VERSION')
     if (LooseVersion(bb.__version__) < LooseVersion(minversion)):
         status.addresult('Bitbake version %s is required and version %s was found\n' % (minversion, bb.__version__))
 
     sanity_check_locale(d)
 
-    paths = d.getVar('PATH', True).split(":")
+    paths = d.getVar('PATH').split(":")
     if "." in paths or "./" in paths or "" in paths:
         status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
 
     # Check that the DISTRO is valid, if set
     # need to take into account DISTRO renaming DISTRO
-    distro = d.getVar('DISTRO', True)
+    distro = d.getVar('DISTRO')
     if distro and distro != "nodistro":
         if not ( check_conf_exists("conf/distro/${DISTRO}.conf", d) or check_conf_exists("conf/distro/include/${DISTRO}.inc", d) ):
-            status.addresult("DISTRO '%s' not found. Please set a valid DISTRO in your local.conf\n" % d.getVar("DISTRO", True))
+            status.addresult("DISTRO '%s' not found. Please set a valid DISTRO in your local.conf\n" % d.getVar("DISTRO"))
 
     # Check that DL_DIR is set, exists and is writable. In theory, we should never even hit the check if DL_DIR isn't 
     # set, since so much relies on it being set.
-    dldir = d.getVar('DL_DIR', True)
+    dldir = d.getVar('DL_DIR')
     if not dldir:
         status.addresult("DL_DIR is not set. Your environment is misconfigured, check that DL_DIR is set, and if the directory exists, that it is writable. \n")
     if os.path.exists(dldir) and not os.access(dldir, os.W_OK):
@@ -821,7 +821,7 @@ def check_sanity_everybuild(status, d):
 
     # Check that the MACHINE is valid, if it is set
     machinevalid = True
-    if d.getVar('MACHINE', True):
+    if d.getVar('MACHINE'):
         if not check_conf_exists("conf/machine/${MACHINE}.conf", d):
             status.addresult('Please set a valid MACHINE in your local.conf or environment\n')
             machinevalid = False
@@ -834,7 +834,7 @@ def check_sanity_everybuild(status, d):
         status.addresult(check_toolchain(d))
 
     # Check that the SDKMACHINE is valid, if it is set
-    if d.getVar('SDKMACHINE', True):
+    if d.getVar('SDKMACHINE'):
         if not check_conf_exists("conf/machine-sdk/${SDKMACHINE}.conf", d):
             status.addresult('Specified SDKMACHINE value is not valid\n')
         elif d.getVar('SDK_ARCH', False) == "${BUILD_ARCH}":
@@ -847,7 +847,7 @@ def check_sanity_everybuild(status, d):
         status.addresult("Please use a umask which allows a+rx and u+rwx\n")
     os.umask(omask)
 
-    if d.getVar('TARGET_ARCH', True) == "arm":
+    if d.getVar('TARGET_ARCH') == "arm":
         # This path is no longer user-readable in modern (very recent) Linux
         try:
             if os.path.exists("/proc/sys/vm/mmap_min_addr"):
@@ -860,7 +860,7 @@ def check_sanity_everybuild(status, d):
         except:
             pass
 
-    oeroot = d.getVar('COREBASE', True)
+    oeroot = d.getVar('COREBASE')
     if oeroot.find('+') != -1:
         status.addresult("Error, you have an invalid character (+) in your COREBASE directory path. Please move the installation to a directory which doesn't include any + characters.")
     if oeroot.find('@') != -1:
@@ -875,7 +875,7 @@ def check_sanity_everybuild(status, d):
                  'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
                  'bzr', 'cvs', 'npm', 'sftp', 'ssh']
     for mirror_var in mirror_vars:
-        mirrors = (d.getVar(mirror_var, True) or '').replace('\\n', '\n').split('\n')
+        mirrors = (d.getVar(mirror_var) or '').replace('\\n', '\n').split('\n')
         for mirror_entry in mirrors:
             mirror_entry = mirror_entry.strip()
             if not mirror_entry:
@@ -914,7 +914,7 @@ def check_sanity_everybuild(status, d):
                     check_symlink(mirror_base, d)
 
     # Check that TMPDIR hasn't changed location since the last time we were run
-    tmpdir = d.getVar('TMPDIR', True)
+    tmpdir = d.getVar('TMPDIR')
     checkfile = os.path.join(tmpdir, "saved_tmpdir")
     if os.path.exists(checkfile):
         with open(checkfile, "r") as f:
@@ -951,8 +951,8 @@ def check_sanity(sanity_data):
 
     status = SanityStatus()
 
-    tmpdir = sanity_data.getVar('TMPDIR', True)
-    sstate_dir = sanity_data.getVar('SSTATE_DIR', True)
+    tmpdir = sanity_data.getVar('TMPDIR')
+    sstate_dir = sanity_data.getVar('SSTATE_DIR')
 
     check_symlink(sstate_dir, sanity_data)
 
@@ -976,7 +976,7 @@ def check_sanity(sanity_data):
 
     check_sanity_everybuild(status, sanity_data)
     
-    sanity_version = int(sanity_data.getVar('SANITY_VERSION', True) or 1)
+    sanity_version = int(sanity_data.getVar('SANITY_VERSION') or 1)
     network_error = False
     # NATIVELSBSTRING var may have been overridden with "universal", so
     # get actual host distribution id and version
diff --git a/meta/classes/sign_ipk.bbclass b/meta/classes/sign_ipk.bbclass
index a481f6d..e5057b7 100644
--- a/meta/classes/sign_ipk.bbclass
+++ b/meta/classes/sign_ipk.bbclass
@@ -29,10 +29,10 @@ IPK_GPG_SIGNATURE_TYPE ?= 'ASC'
 python () {
     # Check configuration
     for var in ('IPK_GPG_NAME', 'IPK_GPG_PASSPHRASE_FILE'):
-        if not d.getVar(var, True):
+        if not d.getVar(var):
             raise_sanity_error("You need to define %s in the config" % var, d)
 
-    sigtype = d.getVar("IPK_GPG_SIGNATURE_TYPE", True)
+    sigtype = d.getVar("IPK_GPG_SIGNATURE_TYPE")
     if sigtype.upper() != "ASC" and sigtype.upper() != "BIN":
         raise_sanity_error("Bad value for IPK_GPG_SIGNATURE_TYPE (%s), use either ASC or BIN" % sigtype)
 }
@@ -42,11 +42,11 @@ def sign_ipk(d, ipk_to_sign):
 
     bb.debug(1, 'Signing ipk: %s' % ipk_to_sign)
 
-    signer = get_signer(d, d.getVar('IPK_GPG_BACKEND', True))
-    sig_type = d.getVar('IPK_GPG_SIGNATURE_TYPE', True)
+    signer = get_signer(d, d.getVar('IPK_GPG_BACKEND'))
+    sig_type = d.getVar('IPK_GPG_SIGNATURE_TYPE')
     is_ascii_sig = (sig_type.upper() != "BIN")
 
     signer.detach_sign(ipk_to_sign,
-                       d.getVar('IPK_GPG_NAME', True),
-                       d.getVar('IPK_GPG_PASSPHRASE_FILE', True),
+                       d.getVar('IPK_GPG_NAME'),
+                       d.getVar('IPK_GPG_PASSPHRASE_FILE'),
                        armor=is_ascii_sig)
diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index 31a6e9b..71df03b 100644
--- a/meta/classes/sign_package_feed.bbclass
+++ b/meta/classes/sign_package_feed.bbclass
@@ -31,10 +31,10 @@ PACKAGE_FEED_GPG_SIGNATURE_TYPE ?= 'ASC'
 python () {
     # Check sanity of configuration
     for var in ('PACKAGE_FEED_GPG_NAME', 'PACKAGE_FEED_GPG_PASSPHRASE_FILE'):
-        if not d.getVar(var, True):
+        if not d.getVar(var):
             raise_sanity_error("You need to define %s in the config" % var, d)
 
-    sigtype = d.getVar("PACKAGE_FEED_GPG_SIGNATURE_TYPE", True)
+    sigtype = d.getVar("PACKAGE_FEED_GPG_SIGNATURE_TYPE")
     if sigtype.upper() != "ASC" and sigtype.upper() != "BIN":
         raise_sanity_error("Bad value for PACKAGE_FEED_GPG_SIGNATURE_TYPE (%s), use either ASC or BIN" % sigtype)
 }
diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index a8ea75f..2a08020 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -22,11 +22,11 @@ RPM_GPG_BACKEND ?= 'local'
 
 
 python () {
-    if d.getVar('RPM_GPG_PASSPHRASE_FILE', True):
+    if d.getVar('RPM_GPG_PASSPHRASE_FILE'):
         raise_sanity_error('RPM_GPG_PASSPHRASE_FILE is replaced by RPM_GPG_PASSPHRASE', d)
     # Check configuration
     for var in ('RPM_GPG_NAME', 'RPM_GPG_PASSPHRASE'):
-        if not d.getVar(var, True):
+        if not d.getVar(var):
             raise_sanity_error("You need to define %s in the config" % var, d)
 
     # Set the expected location of the public key
@@ -41,12 +41,12 @@ python sign_rpm () {
     import glob
     from oe.gpg_sign import get_signer
 
-    signer = get_signer(d, d.getVar('RPM_GPG_BACKEND', True))
-    rpms = glob.glob(d.getVar('RPM_PKGWRITEDIR', True) + '/*')
+    signer = get_signer(d, d.getVar('RPM_GPG_BACKEND'))
+    rpms = glob.glob(d.getVar('RPM_PKGWRITEDIR') + '/*')
 
     signer.sign_rpms(rpms,
-                     d.getVar('RPM_GPG_NAME', True),
-                     d.getVar('RPM_GPG_PASSPHRASE', True))
+                     d.getVar('RPM_GPG_NAME'),
+                     d.getVar('RPM_GPG_PASSPHRASE'))
 }
 
 do_package_index[depends] += "signing-keys:do_deploy"
diff --git a/meta/classes/siteconfig.bbclass b/meta/classes/siteconfig.bbclass
index 45dce48..9d51a02 100644
--- a/meta/classes/siteconfig.bbclass
+++ b/meta/classes/siteconfig.bbclass
@@ -2,7 +2,7 @@ python siteconfig_do_siteconfig () {
 	shared_state = sstate_state_fromvars(d)
 	if shared_state['task'] != 'populate_sysroot':
 		return
-	if not os.path.isdir(os.path.join(d.getVar('FILE_DIRNAME', True), 'site_config')):
+	if not os.path.isdir(os.path.join(d.getVar('FILE_DIRNAME'), 'site_config')):
 		bb.debug(1, "No site_config directory, skipping do_siteconfig")
 		return
 	bb.build.exec_func('do_siteconfig_gencache', d)
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 6eca004..abb194f 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -113,14 +113,14 @@ def siteinfo_data(d):
 
     # Add in any extra user supplied data which may come from a BSP layer, removing the
     # need to always change this class directly
-    extra_siteinfo = (d.getVar("SITEINFO_EXTRA_DATAFUNCS", True) or "").split()
+    extra_siteinfo = (d.getVar("SITEINFO_EXTRA_DATAFUNCS") or "").split()
     for m in extra_siteinfo:
         call = m + "(archinfo, osinfo, targetinfo, d)"
         locs = { "archinfo" : archinfo, "osinfo" : osinfo, "targetinfo" : targetinfo, "d" : d}
         archinfo, osinfo, targetinfo = bb.utils.better_eval(call, locs)
 
-    hostarch = d.getVar("HOST_ARCH", True)
-    hostos = d.getVar("HOST_OS", True)
+    hostarch = d.getVar("HOST_ARCH")
+    hostos = d.getVar("HOST_OS")
     target = "%s-%s" % (hostarch, hostos)
 
     sitedata = []
@@ -144,7 +144,7 @@ python () {
         d.setVar("SITEINFO_ENDIANNESS", "be")
     else:
         bb.error("Unable to determine endianness for architecture '%s'" %
-                 d.getVar("HOST_ARCH", True))
+                 d.getVar("HOST_ARCH"))
         bb.fatal("Please add your architecture to siteinfo.bbclass")
 
     if "bit-32" in sitedata:
@@ -153,14 +153,14 @@ python () {
         d.setVar("SITEINFO_BITS", "64")
     else:
         bb.error("Unable to determine bit size for architecture '%s'" %
-                 d.getVar("HOST_ARCH", True))
+                 d.getVar("HOST_ARCH"))
         bb.fatal("Please add your architecture to siteinfo.bbclass")
 }
 
 def siteinfo_get_files(d, aclocalcache = False):
     sitedata = siteinfo_data(d)
     sitefiles = ""
-    for path in d.getVar("BBPATH", True).split(":"):
+    for path in d.getVar("BBPATH").split(":"):
         for element in sitedata:
             filename = os.path.join(path, "site", element)
             if os.path.exists(filename):
@@ -177,7 +177,7 @@ def siteinfo_get_files(d, aclocalcache = False):
     # issues and the directory being created/removed whilst this code executes. This can happen
     # when a multilib recipe is parsed along with its base variant which may be running at the time
     # causing rare but nasty failures
-    path_siteconfig = d.getVar('ACLOCALDIR', True)
+    path_siteconfig = d.getVar('ACLOCALDIR')
     if path_siteconfig and os.path.isdir(path_siteconfig):
         for i in os.listdir(path_siteconfig):
             if not i.endswith("_config"):
diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
index 89394d3..c5f544d 100644
--- a/meta/classes/spdx.bbclass
+++ b/meta/classes/spdx.bbclass
@@ -26,20 +26,20 @@ python do_spdx () {
     import json, shutil
 
     info = {} 
-    info['workdir'] = d.getVar('WORKDIR', True)
-    info['sourcedir'] = d.getVar('SPDX_S', True)
-    info['pn'] = d.getVar('PN', True)
-    info['pv'] = d.getVar('PV', True)
-    info['spdx_version'] = d.getVar('SPDX_VERSION', True)
-    info['data_license'] = d.getVar('DATA_LICENSE', True)
-
-    sstatedir = d.getVar('SPDXSSTATEDIR', True)
+    info['workdir'] = d.getVar('WORKDIR')
+    info['sourcedir'] = d.getVar('SPDX_S')
+    info['pn'] = d.getVar('PN')
+    info['pv'] = d.getVar('PV')
+    info['spdx_version'] = d.getVar('SPDX_VERSION')
+    info['data_license'] = d.getVar('DATA_LICENSE')
+
+    sstatedir = d.getVar('SPDXSSTATEDIR')
     sstatefile = os.path.join(sstatedir, info['pn'] + info['pv'] + ".spdx")
 
-    manifest_dir = d.getVar('SPDX_MANIFEST_DIR', True)
+    manifest_dir = d.getVar('SPDX_MANIFEST_DIR')
     info['outfile'] = os.path.join(manifest_dir, info['pn'] + ".spdx" )
 
-    info['spdx_temp_dir'] = d.getVar('SPDX_TEMP_DIR', True)
+    info['spdx_temp_dir'] = d.getVar('SPDX_TEMP_DIR')
     info['tar_file'] = os.path.join(info['workdir'], info['pn'] + ".tar.gz" )
 
     # Make sure important dirs exist
@@ -74,9 +74,9 @@ python do_spdx () {
         foss_license_info = cached_spdx['Licenses']
     else:
         ## setup fossology command
-        foss_server = d.getVar('FOSS_SERVER', True)
-        foss_flags = d.getVar('FOSS_WGET_FLAGS', True)
-        foss_full_spdx = d.getVar('FOSS_FULL_SPDX', True) == "true" or False
+        foss_server = d.getVar('FOSS_SERVER')
+        foss_flags = d.getVar('FOSS_WGET_FLAGS')
+        foss_full_spdx = d.getVar('FOSS_FULL_SPDX') == "true" or False
         foss_command = "wget %s --post-file=%s %s"\
             % (foss_flags, info['tar_file'], foss_server)
         
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 8643f3d..546e276 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -11,7 +11,7 @@ def generate_sstatefn(spec, hash, d):
 SSTATE_PKGARCH    = "${PACKAGE_ARCH}"
 SSTATE_PKGSPEC    = "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
 SSTATE_SWSPEC     = "sstate:${PN}::${PV}:${PR}::${SSTATE_VERSION}:"
-SSTATE_PKGNAME    = "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PKGSPEC', True), d.getVar('BB_TASKHASH', True), d)}"
+SSTATE_PKGNAME    = "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PKGSPEC'), d.getVar('BB_TASKHASH'), d)}"
 SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
 SSTATE_EXTRAPATH   = ""
 SSTATE_EXTRAPATHWILDCARD = ""
@@ -34,7 +34,7 @@ SSTATE_DUPWHITELIST += "${DEPLOY_DIR_SRC}"
 SSTATE_DUPWHITELIST += "${DEPLOY_DIR}/sdk/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt"
 
 SSTATE_SCAN_FILES ?= "*.la *-config *_config"
-SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'
+SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES").split())}" \) -type f'
 
 BB_HASHFILENAME = "False ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}"
 
@@ -84,7 +84,7 @@ python () {
         d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${SDK_OS}"))
     elif bb.data.inherits_class('cross-canadian', d):
         d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${PACKAGE_ARCH}"))
-    elif bb.data.inherits_class('allarch', d) and d.getVar("PACKAGE_ARCH", True) == "all":
+    elif bb.data.inherits_class('allarch', d) and d.getVar("PACKAGE_ARCH") == "all":
         d.setVar('SSTATE_PKGARCH', "allarch")
     else:
         d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}"))
@@ -100,7 +100,7 @@ python () {
         scan_cmd = "grep -Irl ${STAGING_DIR} ${SSTATE_BUILDDIR}"
         d.setVar('SSTATE_SCAN_CMD', scan_cmd)
 
-    unique_tasks = sorted(set((d.getVar('SSTATETASKS', True) or "").split()))
+    unique_tasks = sorted(set((d.getVar('SSTATETASKS') or "").split()))
     d.setVar('SSTATETASKS', " ".join(unique_tasks))
     for task in unique_tasks:
         d.prependVarFlag(task, 'prefuncs', "sstate_task_prefunc ")
@@ -118,7 +118,7 @@ def sstate_init(task, d):
 
 def sstate_state_fromvars(d, task = None):
     if task is None:
-        task = d.getVar('BB_CURRENTTASK', True)
+        task = d.getVar('BB_CURRENTTASK')
         if not task:
             bb.fatal("sstate code running without task context?!")
         task = task.replace("_setscene", "")
@@ -200,7 +200,7 @@ def sstate_install(ss, d):
                 shareddirs.append(dstdir)
 
     # Check the file list for conflicts against files which already exist
-    whitelist = (d.getVar("SSTATE_DUPWHITELIST", True) or "").split()
+    whitelist = (d.getVar("SSTATE_DUPWHITELIST") or "").split()
     match = []
     for f in sharedfiles:
         if os.path.exists(f):
@@ -239,7 +239,7 @@ def sstate_install(ss, d):
           "things (e.g. bluez 4 and bluez 5 and the correct solution for that would " \
           "be to resolve the conflict. If in doubt, please ask on the mailing list, " \
           "sharing the error and filelist above." % \
-          (d.getVar('PN', True), "\n ".join(match)))
+          (d.getVar('PN'), "\n ".join(match)))
         bb.fatal("If the above message is too much, the simpler version is you're advised to wipe out tmp and rebuild (reusing sstate is fine). That will likely fix things in most (but not all) cases.")
 
     # Write out the manifest
@@ -260,7 +260,7 @@ def sstate_install(ss, d):
 
     i = d2.expand("${SSTATE_MANIFESTS}/index-${SSTATE_MANMACH}")
     l = bb.utils.lockfile(i + ".lock")
-    filedata = d.getVar("STAMP", True) + " " + d2.getVar("SSTATE_MANFILEPREFIX", True) + " " + d.getVar("WORKDIR", True) + "\n"
+    filedata = d.getVar("STAMP") + " " + d2.getVar("SSTATE_MANFILEPREFIX") + " " + d.getVar("WORKDIR") + "\n"
     manifests = []
     if os.path.exists(i):
         with open(i, "r") as f:
@@ -275,7 +275,7 @@ def sstate_install(ss, d):
         if os.path.exists(state[1]):
             oe.path.copyhardlinktree(state[1], state[2])
 
-    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or '').split():
+    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS') or '').split():
         # All hooks should run in the SSTATE_INSTDIR
         bb.build.exec_func(postinst, d, (sstateinst,))
 
@@ -298,8 +298,8 @@ def sstate_installpkg(ss, d):
         oe.path.remove(dir)
 
     sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['task'])
-    sstatefetch = d.getVar('SSTATE_PKGNAME', True) + '_' + ss['task'] + ".tgz"
-    sstatepkg = d.getVar('SSTATE_PKG', True) + '_' + ss['task'] + ".tgz"
+    sstatefetch = d.getVar('SSTATE_PKGNAME') + '_' + ss['task'] + ".tgz"
+    sstatepkg = d.getVar('SSTATE_PKG') + '_' + ss['task'] + ".tgz"
 
     if not os.path.exists(sstatepkg):
         pstaging_fetch(sstatefetch, sstatepkg, d)
@@ -313,12 +313,12 @@ def sstate_installpkg(ss, d):
     d.setVar('SSTATE_INSTDIR', sstateinst)
     d.setVar('SSTATE_PKG', sstatepkg)
 
-    if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG", True), False):
+    if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
         signer = get_signer(d, 'local')
         if not signer.verify(sstatepkg + '.sig'):
             bb.warn("Cannot verify signature on sstate package %s" % sstatepkg)
 
-    for f in (d.getVar('SSTATEPREINSTFUNCS', True) or '').split() + ['sstate_unpack_package'] + (d.getVar('SSTATEPOSTUNPACKFUNCS', True) or '').split():
+    for f in (d.getVar('SSTATEPREINSTFUNCS') or '').split() + ['sstate_unpack_package'] + (d.getVar('SSTATEPOSTUNPACKFUNCS') or '').split():
         # All hooks should run in the SSTATE_INSTDIR
         bb.build.exec_func(f, d, (sstateinst,))
 
@@ -328,7 +328,7 @@ def sstate_installpkg(ss, d):
     sstate_install(ss, d)
 
     for plain in ss['plaindirs']:
-        workdir = d.getVar('WORKDIR', True)
+        workdir = d.getVar('WORKDIR')
         src = sstateinst + "/" + plain.replace(workdir, '')
         dest = plain
         bb.utils.mkdirhier(src)
@@ -344,12 +344,12 @@ python sstate_hardcode_path_unpack () {
     # sstate_hardcode_path(d)
     import subprocess
 
-    sstateinst = d.getVar('SSTATE_INSTDIR', True)
+    sstateinst = d.getVar('SSTATE_INSTDIR')
     fixmefn =  sstateinst + "fixmepath"
     if os.path.isfile(fixmefn):
-        staging = d.getVar('STAGING_DIR', True)
-        staging_target = d.getVar('STAGING_DIR_TARGET', True)
-        staging_host = d.getVar('STAGING_DIR_HOST', True)
+        staging = d.getVar('STAGING_DIR')
+        staging_target = d.getVar('STAGING_DIR_TARGET')
+        staging_host = d.getVar('STAGING_DIR_HOST')
 
         if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross-canadian', d):
             sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIR:%s:g'" % (staging)
@@ -358,9 +358,9 @@ python sstate_hardcode_path_unpack () {
         else:
             sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRHOST:%s:g'" % (staging_host)
 
-        extra_staging_fixmes = d.getVar('EXTRA_STAGING_FIXMES', True) or ''
+        extra_staging_fixmes = d.getVar('EXTRA_STAGING_FIXMES') or ''
         for fixmevar in extra_staging_fixmes.split():
-            fixme_path = d.getVar(fixmevar, True)
+            fixme_path = d.getVar(fixmevar)
             sstate_sed_cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
 
         # Add sstateinst to each filename in fixmepath, use xargs to efficiently call sed
@@ -377,12 +377,12 @@ python sstate_hardcode_path_unpack () {
 def sstate_clean_cachefile(ss, d):
     import oe.path
 
-    sstatepkgfile = d.getVar('SSTATE_PATHSPEC', True) + "*_" + ss['task'] + ".tgz*"
+    sstatepkgfile = d.getVar('SSTATE_PATHSPEC') + "*_" + ss['task'] + ".tgz*"
     bb.note("Removing %s" % sstatepkgfile)
     oe.path.remove(sstatepkgfile)
 
 def sstate_clean_cachefiles(d):
-    for task in (d.getVar('SSTATETASKS', True) or "").split():
+    for task in (d.getVar('SSTATETASKS') or "").split():
         ld = d.createCopy()
         ss = sstate_state_fromvars(ld, task)
         sstate_clean_cachefile(ss, ld)
@@ -424,7 +424,7 @@ def sstate_clean(ss, d):
     import glob
 
     d2 = d.createCopy()
-    stamp_clean = d.getVar("STAMPCLEAN", True)
+    stamp_clean = d.getVar("STAMPCLEAN")
     extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
     if extrainf:
         d2.setVar("SSTATE_MANMACH", extrainf)
@@ -467,7 +467,7 @@ def sstate_clean(ss, d):
             oe.path.remove(stfile)
 
     # Removes the users/groups created by the package
-    for cleanfunc in (d.getVar('SSTATECLEANFUNCS', True) or '').split():
+    for cleanfunc in (d.getVar('SSTATECLEANFUNCS') or '').split():
         bb.build.exec_func(cleanfunc, d)
 
 sstate_clean[vardepsexclude] = "SSTATE_MANFILEPREFIX"
@@ -475,13 +475,13 @@ sstate_clean[vardepsexclude] = "SSTATE_MANFILEPREFIX"
 CLEANFUNCS += "sstate_cleanall"
 
 python sstate_cleanall() {
-    bb.note("Removing shared state for package %s" % d.getVar('PN', True))
+    bb.note("Removing shared state for package %s" % d.getVar('PN'))
 
-    manifest_dir = d.getVar('SSTATE_MANIFESTS', True)
+    manifest_dir = d.getVar('SSTATE_MANIFESTS')
     if not os.path.exists(manifest_dir):
         return
 
-    tasks = d.getVar('SSTATETASKS', True).split()
+    tasks = d.getVar('SSTATETASKS').split()
     for name in tasks:
         ld = d.createCopy()
         shared_state = sstate_state_fromvars(ld, name)
@@ -497,10 +497,10 @@ python sstate_hardcode_path () {
     # Note: the logic in this function needs to match the reverse logic
     # in sstate_installpkg(ss, d)
 
-    staging = d.getVar('STAGING_DIR', True)
-    staging_target = d.getVar('STAGING_DIR_TARGET', True)
-    staging_host = d.getVar('STAGING_DIR_HOST', True)
-    sstate_builddir = d.getVar('SSTATE_BUILDDIR', True)
+    staging = d.getVar('STAGING_DIR')
+    staging_target = d.getVar('STAGING_DIR_TARGET')
+    staging_host = d.getVar('STAGING_DIR_HOST')
+    sstate_builddir = d.getVar('SSTATE_BUILDDIR')
 
     if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross-canadian', d):
         sstate_grep_cmd = "grep -l -e '%s'" % (staging)
@@ -512,14 +512,14 @@ python sstate_hardcode_path () {
         sstate_grep_cmd = "grep -l -e '%s'" % (staging_host)
         sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRHOST:g'" % (staging_host)
 
-    extra_staging_fixmes = d.getVar('EXTRA_STAGING_FIXMES', True) or ''
+    extra_staging_fixmes = d.getVar('EXTRA_STAGING_FIXMES') or ''
     for fixmevar in extra_staging_fixmes.split():
-        fixme_path = d.getVar(fixmevar, True)
+        fixme_path = d.getVar(fixmevar)
         sstate_sed_cmd += " -e 's:%s:FIXME_%s:g'" % (fixme_path, fixmevar)
 
     fixmefn =  sstate_builddir + "fixmepath"
 
-    sstate_scan_cmd = d.getVar('SSTATE_SCAN_CMD', True)
+    sstate_scan_cmd = d.getVar('SSTATE_SCAN_CMD')
     sstate_filelist_cmd = "tee %s" % (fixmefn)
 
     # fixmepath file needs relative paths, drop sstate_builddir prefix
@@ -568,17 +568,17 @@ def sstate_package(ss, d):
         os.remove(path)
         os.symlink(base, path)
 
-    tmpdir = d.getVar('TMPDIR', True)
+    tmpdir = d.getVar('TMPDIR')
 
     sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['task'])
-    sstatepkg = d.getVar('SSTATE_PKG', True) + '_'+ ss['task'] + ".tgz"
+    sstatepkg = d.getVar('SSTATE_PKG') + '_'+ ss['task'] + ".tgz"
     bb.utils.remove(sstatebuild, recurse=True)
     bb.utils.mkdirhier(sstatebuild)
     bb.utils.mkdirhier(os.path.dirname(sstatepkg))
     for state in ss['dirs']:
         if not os.path.exists(state[1]):
             continue
-        if d.getVar('SSTATE_SKIP_CREATION', True) == '1':
+        if d.getVar('SSTATE_SKIP_CREATION') == '1':
             continue
         srcbase = state[0].rstrip("/").rsplit('/', 1)[0]
         for walkroot, dirs, files in os.walk(state[1]):
@@ -593,7 +593,7 @@ def sstate_package(ss, d):
         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))
         oe.path.copyhardlinktree(state[1], sstatebuild + state[0])
 
-    workdir = d.getVar('WORKDIR', True)
+    workdir = d.getVar('WORKDIR')
     for plain in ss['plaindirs']:
         pdir = plain.replace(workdir, sstatebuild)
         bb.utils.mkdirhier(plain)
@@ -603,9 +603,9 @@ def sstate_package(ss, d):
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_PKG', sstatepkg)
 
-    for f in (d.getVar('SSTATECREATEFUNCS', True) or '').split() + \
+    for f in (d.getVar('SSTATECREATEFUNCS') or '').split() + \
              ['sstate_create_package', 'sstate_sign_package'] + \
-             (d.getVar('SSTATEPOSTCREATEFUNCS', True) or '').split():
+             (d.getVar('SSTATEPOSTCREATEFUNCS') or '').split():
         # All hooks should run in SSTATE_BUILDDIR.
         bb.build.exec_func(f, d, (sstatebuild,))
 
@@ -617,7 +617,7 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
     import bb.fetch2
 
     # Only try and fetch if the user has configured a mirror
-    mirrors = d.getVar('SSTATE_MIRRORS', True)
+    mirrors = d.getVar('SSTATE_MIRRORS')
     if not mirrors:
         return
 
@@ -635,14 +635,14 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
 
     # if BB_NO_NETWORK is set but we also have SSTATE_MIRROR_ALLOW_NETWORK,
     # we'll want to allow network access for the current set of fetches.
-    if localdata.getVar('BB_NO_NETWORK', True) == "1" and localdata.getVar('SSTATE_MIRROR_ALLOW_NETWORK', True) == "1":
+    if localdata.getVar('BB_NO_NETWORK') == "1" and localdata.getVar('SSTATE_MIRROR_ALLOW_NETWORK') == "1":
         localdata.delVar('BB_NO_NETWORK')
 
     # Try a fetch from the sstate mirror, if it fails just return and
     # we will build the package
     uris = ['file://{0};downloadfilename={0}'.format(sstatefetch),
             'file://{0}.siginfo;downloadfilename={0}.siginfo'.format(sstatefetch)]
-    if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG", True), False):
+    if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
         uris += ['file://{0}.sig;downloadfilename={0}.sig'.format(sstatefetch)]
 
     for srcuri in uris:
@@ -671,7 +671,7 @@ python sstate_task_postfunc () {
 
     sstate_install(shared_state, d)
     for intercept in shared_state['interceptfuncs']:
-        bb.build.exec_func(intercept, d, (d.getVar("WORKDIR", True),))
+        bb.build.exec_func(intercept, d, (d.getVar("WORKDIR"),))
     omask = os.umask(0o002)
     if omask != 0o002:
        bb.note("Using umask 0o002 (not %0o) for sstate packaging" % omask)
@@ -709,13 +709,13 @@ sstate_create_package () {
 python sstate_sign_package () {
     from oe.gpg_sign import get_signer
 
-    if d.getVar('SSTATE_SIG_KEY', True):
+    if d.getVar('SSTATE_SIG_KEY'):
         signer = get_signer(d, 'local')
-        sstate_pkg = d.getVar('SSTATE_PKG', True)
+        sstate_pkg = d.getVar('SSTATE_PKG')
         if os.path.exists(sstate_pkg + '.sig'):
             os.unlink(sstate_pkg + '.sig')
         signer.detach_sign(sstate_pkg, d.getVar('SSTATE_SIG_KEY', False), None,
-                           d.getVar('SSTATE_SIG_PASSPHRASE', True), armor=False)
+                           d.getVar('SSTATE_SIG_PASSPHRASE'), armor=False)
 }
 
 #
@@ -746,7 +746,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
         splithashfn = sq_hashfn[task].split(" ")
         spec = splithashfn[1]
         if splithashfn[0] == "True":
-            extrapath = d.getVar("NATIVELSBSTRING", True) + "/"
+            extrapath = d.getVar("NATIVELSBSTRING") + "/"
         else:
             extrapath = ""
 
@@ -785,7 +785,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
             missed.append(task)
             bb.debug(2, "SState: Looked for but didn't find file %s" % sstatefile)
 
-    mirrors = d.getVar("SSTATE_MIRRORS", True)
+    mirrors = d.getVar("SSTATE_MIRRORS")
     if mirrors:
         # Copy the data object and override DL_DIR and SRC_URI
         localdata = bb.data.createCopy(d)
@@ -801,7 +801,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
 
         # if BB_NO_NETWORK is set but we also have SSTATE_MIRROR_ALLOW_NETWORK,
         # we'll want to allow network access for the current set of fetches.
-        if localdata.getVar('BB_NO_NETWORK', True) == "1" and localdata.getVar('SSTATE_MIRROR_ALLOW_NETWORK', True) == "1":
+        if localdata.getVar('BB_NO_NETWORK') == "1" and localdata.getVar('SSTATE_MIRROR_ALLOW_NETWORK') == "1":
             localdata.delVar('BB_NO_NETWORK')
 
         whitelist = bb.runqueue.get_setscene_enforce_whitelist(d)
@@ -868,7 +868,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
             if whitelist and missing:
                 bb.fatal('Required artifacts were unavailable - exiting')
 
-    inheritlist = d.getVar("INHERIT", True)
+    inheritlist = d.getVar("INHERIT")
     if "toaster" in inheritlist:
         evdata = {'missed': [], 'found': []};
         for task in missed:
@@ -977,15 +977,15 @@ sstate_eventhandler[eventmask] = "bb.build.TaskSucceeded"
 python sstate_eventhandler() {
     d = e.data
     # When we write an sstate package we rewrite the SSTATE_PKG
-    spkg = d.getVar('SSTATE_PKG', True)
+    spkg = d.getVar('SSTATE_PKG')
     if not spkg.endswith(".tgz"):
-        taskname = d.getVar("BB_RUNTASK", True)[3:]
-        spec = d.getVar('SSTATE_PKGSPEC', True)
-        swspec = d.getVar('SSTATE_SWSPEC', True)
+        taskname = d.getVar("BB_RUNTASK")[3:]
+        spec = d.getVar('SSTATE_PKGSPEC')
+        swspec = d.getVar('SSTATE_SWSPEC')
         if taskname in ["fetch", "unpack", "patch", "populate_lic", "preconfigure"] and swspec:
             d.setVar("SSTATE_PKGSPEC", "${SSTATE_SWSPEC}")
             d.setVar("SSTATE_EXTRAPATH", "")
-        sstatepkg = d.getVar('SSTATE_PKG', True)
+        sstatepkg = d.getVar('SSTATE_PKG')
         bb.siggen.dump_this_task(sstatepkg + '_' + taskname + ".tgz" ".siginfo", d)
 }
 
@@ -1004,7 +1004,7 @@ python sstate_eventhandler2() {
     stamps = e.stamps.values()
     removeworkdir = (d.getVar("SSTATE_PRUNE_OBSOLETEWORKDIR", False) == "1")
     seen = []
-    for a in d.getVar("SSTATE_ARCHS", True).split():
+    for a in d.getVar("SSTATE_ARCHS").split():
         toremove = []
         i = d.expand("${SSTATE_MANIFESTS}/index-" + a)
         if not os.path.exists(i):
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index a0b09a0..f95fc24 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -69,8 +69,8 @@ sysroot_stage_all() {
 python sysroot_strip () {
     import stat, errno
 
-    dvar = d.getVar('SYSROOT_DESTDIR', True)
-    pn = d.getVar('PN', True)
+    dvar = d.getVar('SYSROOT_DESTDIR')
+    pn = d.getVar('PN')
 
     os.chdir(dvar)
 
@@ -103,9 +103,9 @@ python sysroot_strip () {
 
     elffiles = {}
     inodes = {}
-    libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir", True))
-    baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir", True))
-    if (d.getVar('INHIBIT_SYSROOT_STRIP', True) != '1'):
+    libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir"))
+    baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir"))
+    if (d.getVar('INHIBIT_SYSROOT_STRIP') != '1'):
         #
         # First lets figure out all of the files we may have to process
         #
@@ -136,7 +136,7 @@ python sysroot_strip () {
                     elf_file = isELF(file)
                     if elf_file & 1:
                         if elf_file & 2:
-                            if 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn, True) or "").split():
+                            if 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn) or "").split():
                                 bb.note("Skipping file %s from %s for already-stripped QA test" % (file[len(dvar):], pn))
                             else:
                                 bb.warn("File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn))
@@ -154,7 +154,7 @@ python sysroot_strip () {
         #
         # Now strip them (in parallel)
         #
-        strip = d.getVar("STRIP", True)
+        strip = d.getVar("STRIP")
         sfiles = []
         for file in elffiles:
             elf_file = int(elffiles[file])
@@ -212,13 +212,13 @@ def sysroot_checkhashes(covered, tasknames, fnids, fns, d, invalidtasks = None):
 python do_populate_sysroot () {
     bb.build.exec_func("sysroot_stage_all", d)
     bb.build.exec_func("sysroot_strip", d)
-    for f in (d.getVar('SYSROOT_PREPROCESS_FUNCS', True) or '').split():
+    for f in (d.getVar('SYSROOT_PREPROCESS_FUNCS') or '').split():
         bb.build.exec_func(f, d)
-    pn = d.getVar("PN", True)
-    multiprov = d.getVar("MULTI_PROVIDER_WHITELIST", True).split()
+    pn = d.getVar("PN")
+    multiprov = d.getVar("MULTI_PROVIDER_WHITELIST").split()
     provdir = d.expand("${SYSROOT_DESTDIR}${base_prefix}/sysroot-providers/")
     bb.utils.mkdirhier(provdir)
-    for p in d.getVar("PROVIDES", True).split():
+    for p in d.getVar("PROVIDES").split():
         if p in multiprov:
             continue
         p = p.replace("/", "_")
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 7778fd7..d8859b3 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -84,12 +84,12 @@ python build_syslinux_cfg () {
     import copy
     import sys
 
-    workdir = d.getVar('WORKDIR', True)
+    workdir = d.getVar('WORKDIR')
     if not workdir:
         bb.error("WORKDIR not defined, unable to package")
         return
         
-    labels = d.getVar('LABELS', True)
+    labels = d.getVar('LABELS')
     if not labels:
         bb.debug(1, "LABELS not defined, nothing to do")
         return
@@ -98,7 +98,7 @@ python build_syslinux_cfg () {
         bb.debug(1, "No labels, nothing to do")
         return
 
-    cfile = d.getVar('SYSLINUX_CFG', True)
+    cfile = d.getVar('SYSLINUX_CFG')
     if not cfile:
         bb.fatal('Unable to read SYSLINUX_CFG')
 
@@ -109,39 +109,39 @@ python build_syslinux_cfg () {
 
     cfgfile.write('# Automatically created by OE\n')
 
-    opts = d.getVar('SYSLINUX_OPTS', True)
+    opts = d.getVar('SYSLINUX_OPTS')
 
     if opts:
         for opt in opts.split(';'):
             cfgfile.write('%s\n' % opt)
 
-    allowoptions = d.getVar('SYSLINUX_ALLOWOPTIONS', True)
+    allowoptions = d.getVar('SYSLINUX_ALLOWOPTIONS')
     if allowoptions:
         cfgfile.write('ALLOWOPTIONS %s\n' % allowoptions)
     else:
         cfgfile.write('ALLOWOPTIONS 1\n')
 
-    syslinux_default_console = d.getVar('SYSLINUX_DEFAULT_CONSOLE', True)
-    syslinux_serial_tty = d.getVar('SYSLINUX_SERIAL_TTY', True)
-    syslinux_serial = d.getVar('SYSLINUX_SERIAL', True)
+    syslinux_default_console = d.getVar('SYSLINUX_DEFAULT_CONSOLE')
+    syslinux_serial_tty = d.getVar('SYSLINUX_SERIAL_TTY')
+    syslinux_serial = d.getVar('SYSLINUX_SERIAL')
     if syslinux_serial:
         cfgfile.write('SERIAL %s\n' % syslinux_serial)
 
-    menu = (d.getVar('AUTO_SYSLINUXMENU', True) == "1")
+    menu = (d.getVar('AUTO_SYSLINUXMENU') == "1")
 
     if menu and syslinux_serial:
         cfgfile.write('DEFAULT Graphics console %s\n' % (labels.split()[0]))
     else:
         cfgfile.write('DEFAULT %s\n' % (labels.split()[0]))
 
-    timeout = d.getVar('SYSLINUX_TIMEOUT', True)
+    timeout = d.getVar('SYSLINUX_TIMEOUT')
 
     if timeout:
         cfgfile.write('TIMEOUT %s\n' % timeout)
     else:
         cfgfile.write('TIMEOUT 50\n')
 
-    prompt = d.getVar('SYSLINUX_PROMPT', True)
+    prompt = d.getVar('SYSLINUX_PROMPT')
     if prompt:
         cfgfile.write('PROMPT %s\n' % prompt)
     else:
@@ -151,14 +151,14 @@ python build_syslinux_cfg () {
         cfgfile.write('ui vesamenu.c32\n')
         cfgfile.write('menu title Select kernel options and boot kernel\n')
         cfgfile.write('menu tabmsg Press [Tab] to edit, [Return] to select\n')
-        splash = d.getVar('SYSLINUX_SPLASH', True)
+        splash = d.getVar('SYSLINUX_SPLASH')
         if splash:
             cfgfile.write('menu background splash.lss\n')
     
     for label in labels.split():
         localdata = bb.data.createCopy(d)
 
-        overrides = localdata.getVar('OVERRIDES', True)
+        overrides = localdata.getVar('OVERRIDES')
         if not overrides:
             bb.fatal('OVERRIDES not defined')
 
@@ -170,19 +170,19 @@ python build_syslinux_cfg () {
             btypes = [ [ "Graphics console ", syslinux_default_console  ],
                 [ "Serial console ", syslinux_serial_tty ] ]
 
-        root= d.getVar('SYSLINUX_ROOT', True)
+        root= d.getVar('SYSLINUX_ROOT')
         if not root:
             bb.fatal('SYSLINUX_ROOT not defined')
 
         for btype in btypes:
             cfgfile.write('LABEL %s%s\nKERNEL /vmlinuz\n' % (btype[0], label))
 
-            exargs = d.getVar('SYSLINUX_KERNEL_ARGS', True)
+            exargs = d.getVar('SYSLINUX_KERNEL_ARGS')
             if exargs:
                 btype[1] += " " + exargs
 
-            append = localdata.getVar('APPEND', True)
-            initrd = localdata.getVar('INITRD', True)
+            append = localdata.getVar('APPEND')
+            initrd = localdata.getVar('INITRD')
 
             append = root + " " + append
             cfgfile.write('APPEND ')
diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 05244c7..60729a7 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -63,8 +63,8 @@ efi_hddimg_populate() {
 }
 
 python build_efi_cfg() {
-    s = d.getVar("S", True)
-    labels = d.getVar('LABELS', True)
+    s = d.getVar("S")
+    labels = d.getVar('LABELS')
     if not labels:
         bb.debug(1, "LABELS not defined, nothing to do")
         return
@@ -73,7 +73,7 @@ python build_efi_cfg() {
         bb.debug(1, "No labels, nothing to do")
         return
 
-    cfile = d.getVar('SYSTEMD_BOOT_CFG', True)
+    cfile = d.getVar('SYSTEMD_BOOT_CFG')
     try:
          cfgfile = open(cfile, 'w')
     except OSError:
@@ -81,7 +81,7 @@ python build_efi_cfg() {
 
     cfgfile.write('# Automatically created by OE\n')
     cfgfile.write('default %s\n' % (labels.split()[0]))
-    timeout = d.getVar('SYSTEMD_BOOT_TIMEOUT', True)
+    timeout = d.getVar('SYSTEMD_BOOT_TIMEOUT')
     if timeout:
         cfgfile.write('timeout %s\n' % timeout)
     else:
@@ -91,7 +91,7 @@ python build_efi_cfg() {
     for label in labels.split():
         localdata = d.createCopy()
 
-        overrides = localdata.getVar('OVERRIDES', True)
+        overrides = localdata.getVar('OVERRIDES')
         if not overrides:
             bb.fatal('OVERRIDES not defined')
 
@@ -107,8 +107,8 @@ python build_efi_cfg() {
         entrycfg.write('title %s\n' % label)
         entrycfg.write('linux /vmlinuz\n')
 
-        append = localdata.getVar('APPEND', True)
-        initrd = localdata.getVar('INITRD', True)
+        append = localdata.getVar('APPEND')
+        initrd = localdata.getVar('INITRD')
 
         if initrd:
             entrycfg.write('initrd /initrd\n')
diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 7e51ed6..d50141d 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -71,12 +71,12 @@ python systemd_populate_packages() {
     def get_package_var(d, var, pkg):
         val = (d.getVar('%s_%s' % (var, pkg), True) or "").strip()
         if val == "":
-            val = (d.getVar(var, True) or "").strip()
+            val = (d.getVar(var) or "").strip()
         return val
 
     # Check if systemd-packages already included in PACKAGES
     def systemd_check_package(pkg_systemd):
-        packages = d.getVar('PACKAGES', True)
+        packages = d.getVar('PACKAGES')
         if not pkg_systemd in packages.split():
             bb.error('%s does not appear in package list, please add it' % pkg_systemd)
 
@@ -90,23 +90,23 @@ python systemd_populate_packages() {
         localdata.prependVar("OVERRIDES", pkg + ":")
         bb.data.update_data(localdata)
 
-        postinst = d.getVar('pkg_postinst_%s' % pkg, True)
+        postinst = d.getVar('pkg_postinst_%s' % pkg)
         if not postinst:
             postinst = '#!/bin/sh\n'
-        postinst += localdata.getVar('systemd_postinst', True)
+        postinst += localdata.getVar('systemd_postinst')
         d.setVar('pkg_postinst_%s' % pkg, postinst)
 
-        prerm = d.getVar('pkg_prerm_%s' % pkg, True)
+        prerm = d.getVar('pkg_prerm_%s' % pkg)
         if not prerm:
             prerm = '#!/bin/sh\n'
-        prerm += localdata.getVar('systemd_prerm', True)
+        prerm += localdata.getVar('systemd_prerm')
         d.setVar('pkg_prerm_%s' % pkg, prerm)
 
 
     # Add files to FILES_*-systemd if existent and not already done
     def systemd_append_file(pkg_systemd, file_append):
         appended = False
-        if os.path.exists(oe.path.join(d.getVar("D", True), file_append)):
+        if os.path.exists(oe.path.join(d.getVar("D"), file_append)):
             var_name = "FILES_" + pkg_systemd
             files = d.getVar(var_name, False) or ""
             if file_append not in files.split():
@@ -118,7 +118,7 @@ python systemd_populate_packages() {
     def systemd_add_files_and_parse(pkg_systemd, path, service, keys):
         # avoid infinite recursion
         if systemd_append_file(pkg_systemd, oe.path.join(path, service)):
-            fullpath = oe.path.join(d.getVar("D", True), path, service)
+            fullpath = oe.path.join(d.getVar("D"), path, service)
             if service.find('.service') != -1:
                 # for *.service add *@.service
                 service_base = service.replace('.service', '')
@@ -141,9 +141,9 @@ python systemd_populate_packages() {
 
     # Check service-files and call systemd_add_files_and_parse for each entry
     def systemd_check_services():
-        searchpaths = [oe.path.join(d.getVar("sysconfdir", True), "systemd", "system"),]
-        searchpaths.append(d.getVar("systemd_system_unitdir", True))
-        systemd_packages = d.getVar('SYSTEMD_PACKAGES', True)
+        searchpaths = [oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),]
+        searchpaths.append(d.getVar("systemd_system_unitdir"))
+        systemd_packages = d.getVar('SYSTEMD_PACKAGES')
 
         keys = 'Also'
         # scan for all in SYSTEMD_SERVICE[]
@@ -158,11 +158,11 @@ python systemd_populate_packages() {
                     base = re.sub('@[^.]+.', '@.', service)
 
                 for path in searchpaths:
-                    if os.path.exists(oe.path.join(d.getVar("D", True), path, service)):
+                    if os.path.exists(oe.path.join(d.getVar("D"), path, service)):
                         path_found = path
                         break
                     elif base is not None:
-                        if os.path.exists(oe.path.join(d.getVar("D", True), path, base)):
+                        if os.path.exists(oe.path.join(d.getVar("D"), path, base)):
                             path_found = path
                             break
 
@@ -172,10 +172,10 @@ python systemd_populate_packages() {
                     bb.fatal("SYSTEMD_SERVICE_%s value %s does not exist" % (pkg_systemd, service))
 
     # Run all modifications once when creating package
-    if os.path.exists(d.getVar("D", True)):
-        for pkg in d.getVar('SYSTEMD_PACKAGES', True).split():
+    if os.path.exists(d.getVar("D")):
+        for pkg in d.getVar('SYSTEMD_PACKAGES').split():
             systemd_check_package(pkg)
-            if d.getVar('SYSTEMD_SERVICE_' + pkg, True):
+            if d.getVar('SYSTEMD_SERVICE_' + pkg):
                 systemd_generate_package_scripts(pkg)
         systemd_check_services()
 }
@@ -185,7 +185,7 @@ PACKAGESPLITFUNCS_prepend = "systemd_populate_packages "
 python rm_systemd_unitdir (){
     import shutil
     if not bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
-        systemd_unitdir = oe.path.join(d.getVar("D", True), d.getVar('systemd_unitdir', True))
+        systemd_unitdir = oe.path.join(d.getVar("D"), d.getVar('systemd_unitdir'))
         if os.path.exists(systemd_unitdir):
             shutil.rmtree(systemd_unitdir)
         systemd_libdir = os.path.dirname(systemd_unitdir)
@@ -196,12 +196,12 @@ do_install[postfuncs] += "rm_systemd_unitdir "
 
 python rm_sysvinit_initddir (){
     import shutil
-    sysv_initddir = oe.path.join(d.getVar("D", True), (d.getVar('INIT_D_DIR', True) or "/etc/init.d"))
+    sysv_initddir = oe.path.join(d.getVar("D"), (d.getVar('INIT_D_DIR') or "/etc/init.d"))
 
     if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and \
         not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) and \
         os.path.exists(sysv_initddir):
-        systemd_system_unitdir = oe.path.join(d.getVar("D", True), d.getVar('systemd_system_unitdir', True))
+        systemd_system_unitdir = oe.path.join(d.getVar("D"), d.getVar('systemd_system_unitdir'))
 
         # If systemd_system_unitdir contains anything, delete sysv_initddir
         if (os.path.exists(systemd_system_unitdir) and os.listdir(systemd_system_unitdir)):
diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index cd8d124..5db013f 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -19,9 +19,9 @@ def emit_terminal_func(command, envdata, d):
     envdata.setVar(cmd_func, 'exec ' + command)
     envdata.setVarFlag(cmd_func, 'func', '1')
 
-    runfmt = d.getVar('BB_RUNFMT', True) or "run.{func}.{pid}"
+    runfmt = d.getVar('BB_RUNFMT') or "run.{func}.{pid}"
     runfile = runfmt.format(func=cmd_func, task=cmd_func, taskfunc=cmd_func, pid=os.getpid())
-    runfile = os.path.join(d.getVar('T', True), runfile)
+    runfile = os.path.join(d.getVar('T'), runfile)
     bb.utils.mkdirhier(os.path.dirname(runfile))
 
     with open(runfile, 'w') as script:
@@ -44,7 +44,7 @@ def oe_terminal(command, title, d):
         envdata.setVarFlag(v, 'export', '1')
 
     for export in oe.data.typed_value('OE_TERMINAL_EXPORTS', d):
-        value = d.getVar(export, True)
+        value = d.getVar(export)
         if value is not None:
             os.environ[export] = str(value)
             envdata.setVar(export, str(value))
@@ -60,7 +60,7 @@ def oe_terminal(command, title, d):
     for key in origbbenv:
         if key in envdata:
             continue
-        value = origbbenv.getVar(key, True)
+        value = origbbenv.getVar(key)
         if value is not None:
             os.environ[key] = str(value)
             envdata.setVar(key, str(value))
diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 5147020..3f7b2de 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -49,19 +49,19 @@ def exportTests(d,tc):
     import re
     import oe.path
 
-    exportpath = d.getVar("TEST_EXPORT_DIR", True)
+    exportpath = d.getVar("TEST_EXPORT_DIR")
 
     savedata = {}
     savedata["d"] = {}
     savedata["target"] = {}
-    savedata["target"]["ip"] = tc.target.ip or d.getVar("TEST_TARGET_IP", True)
-    savedata["target"]["server_ip"] = tc.target.server_ip or d.getVar("TEST_SERVER_IP", True)
+    savedata["target"]["ip"] = tc.target.ip or d.getVar("TEST_TARGET_IP")
+    savedata["target"]["server_ip"] = tc.target.server_ip or d.getVar("TEST_SERVER_IP")
 
     keys = [ key for key in d.keys() if not key.startswith("_") and not key.startswith("BB") \
             and not key.startswith("B_pn") and not key.startswith("do_") and not d.getVarFlag(key, "func", True)]
     for key in keys:
         try:
-            savedata["d"][key] = d.getVar(key, True)
+            savedata["d"][key] = d.getVar(key)
         except bb.data_smart.ExpansionError:
             # we don't care about those anyway
             pass
@@ -71,7 +71,7 @@ def exportTests(d,tc):
             json.dump(savedata, f, skipkeys=True, indent=4, sort_keys=True)
 
     # Replace absolute path with relative in the file
-    exclude_path = os.path.join(d.getVar("COREBASE", True),'meta','lib','oeqa')
+    exclude_path = os.path.join(d.getVar("COREBASE"),'meta','lib','oeqa')
     f1 = open(json_file,'r').read()
     f2 = open(json_file,'w')
     m = f1.replace(exclude_path,'oeqa')
@@ -90,7 +90,7 @@ def exportTests(d,tc):
     bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/runtime/files"))
     bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/utils"))
     # copy test modules, this should cover tests in other layers too
-    bbpath = d.getVar("BBPATH", True).split(':')
+    bbpath = d.getVar("BBPATH").split(':')
     for t in tc.testslist:
         isfolder = False
         if re.search("\w+\.\w+\.test_\S+", t):
@@ -111,7 +111,7 @@ def exportTests(d,tc):
             if os.path.isfile(json_file):
                 shutil.copy2(json_file, os.path.join(exportpath, "oeqa/runtime"))
     # Get meta layer
-    for layer in d.getVar("BBLAYERS", True).split():
+    for layer in d.getVar("BBLAYERS").split():
         if os.path.basename(layer) == "meta":
             meta_layer = layer
             break
@@ -130,28 +130,28 @@ def exportTests(d,tc):
             shutil.copy2(os.path.join(root, f), os.path.join(exportpath, "oeqa/runtime/files"))
 
     # Create tar file for common parts of testexport
-    create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR", True))
+    create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR"))
 
     # Copy packages needed for runtime testing
-    test_pkg_dir = d.getVar("TEST_NEEDED_PACKAGES_DIR", True)
+    test_pkg_dir = d.getVar("TEST_NEEDED_PACKAGES_DIR")
     if os.listdir(test_pkg_dir):
-        export_pkg_dir = os.path.join(d.getVar("TEST_EXPORT_DIR", True), "packages")
+        export_pkg_dir = os.path.join(d.getVar("TEST_EXPORT_DIR"), "packages")
         oe.path.copytree(test_pkg_dir, export_pkg_dir)
         # Create tar file for packages needed by the DUT
-        create_tarball(d, "testexport_packages_%s.tar.gz" % d.getVar("MACHINE", True), export_pkg_dir)
+        create_tarball(d, "testexport_packages_%s.tar.gz" % d.getVar("MACHINE"), export_pkg_dir)
 
     # Copy SDK
-    if d.getVar("TEST_EXPORT_SDK_ENABLED", True) == "1":
-        sdk_deploy = d.getVar("SDK_DEPLOY", True)
-        tarball_name = "%s.sh" % d.getVar("TEST_EXPORT_SDK_NAME", True)
+    if d.getVar("TEST_EXPORT_SDK_ENABLED") == "1":
+        sdk_deploy = d.getVar("SDK_DEPLOY")
+        tarball_name = "%s.sh" % d.getVar("TEST_EXPORT_SDK_NAME")
         tarball_path = os.path.join(sdk_deploy, tarball_name)
-        export_sdk_dir = os.path.join(d.getVar("TEST_EXPORT_DIR", True),
-                                      d.getVar("TEST_EXPORT_SDK_DIR", True))
+        export_sdk_dir = os.path.join(d.getVar("TEST_EXPORT_DIR"),
+                                      d.getVar("TEST_EXPORT_SDK_DIR"))
         bb.utils.mkdirhier(export_sdk_dir)
         shutil.copy2(tarball_path, export_sdk_dir)
 
         # Create tar file for the sdk
-        create_tarball(d, "testexport_sdk_%s.tar.gz" % d.getVar("SDK_ARCH", True), export_sdk_dir)
+        create_tarball(d, "testexport_sdk_%s.tar.gz" % d.getVar("SDK_ARCH"), export_sdk_dir)
 
     bb.plain("Exported tests to: %s" % exportpath)
 
@@ -161,8 +161,8 @@ def testexport_main(d):
     from oeqa.utils.dump import get_host_dumper
 
     test_create_extract_dirs(d)
-    export_dir = d.getVar("TEST_EXPORT_DIR", True)
-    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
+    export_dir = d.getVar("TEST_EXPORT_DIR")
+    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
     bb.utils.remove(export_dir, recurse=True)
     bb.utils.mkdirhier(export_dir)
 
@@ -188,7 +188,7 @@ def create_tarball(d, tar_name, src_dir):
 
     import tarfile
 
-    tar_path = os.path.join(d.getVar("TEST_EXPORT_DIR", True), tar_name)
+    tar_path = os.path.join(d.getVar("TEST_EXPORT_DIR"), tar_name)
     current_dir = os.getcwd()
     src_dir = src_dir.rstrip('/')
     dir_name = os.path.dirname(src_dir)
diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 6b6781d..770ec80 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -130,8 +130,8 @@ def testimage_main(d):
     from oeqa.targetcontrol import get_target_controller
     from oeqa.utils.dump import get_host_dumper
 
-    pn = d.getVar("PN", True)
-    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
+    pn = d.getVar("PN")
+    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
     test_create_extract_dirs(d)
 
     # we need the host dumper in test context
@@ -176,10 +176,10 @@ def testimage_main(d):
         target.stop()
 
 def test_create_extract_dirs(d):
-    install_path = d.getVar("TEST_INSTALL_TMP_DIR", True)
-    package_path = d.getVar("TEST_PACKAGED_DIR", True)
-    extracted_path = d.getVar("TEST_EXTRACTED_DIR", True)
-    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
+    install_path = d.getVar("TEST_INSTALL_TMP_DIR")
+    package_path = d.getVar("TEST_PACKAGED_DIR")
+    extracted_path = d.getVar("TEST_EXTRACTED_DIR")
+    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
     bb.utils.remove(package_path, recurse=True)
     bb.utils.mkdirhier(install_path)
     bb.utils.mkdirhier(package_path)
diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 06b4c50..063b908 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -54,8 +54,8 @@ def testsdk_main(d):
     import subprocess
     from oeqa.oetest import SDKTestContext
 
-    pn = d.getVar("PN", True)
-    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
+    pn = d.getVar("PN")
+    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
 
     tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh")
     if not os.path.exists(tcname):
@@ -100,12 +100,12 @@ def testsdkext_main(d):
 
     # extensible sdk can be contaminated if native programs are
     # in PATH, i.e. use perl-native instead of eSDK one.
-    paths_to_avoid = [d.getVar('STAGING_DIR', True),
-                      d.getVar('BASE_WORKDIR', True)]
+    paths_to_avoid = [d.getVar('STAGING_DIR'),
+                      d.getVar('BASE_WORKDIR')]
     os.environ['PATH'] = avoid_paths_in_environ(paths_to_avoid)
 
-    pn = d.getVar("PN", True)
-    bb.utils.mkdirhier(d.getVar("TEST_LOG_SDKEXT_DIR", True))
+    pn = d.getVar("PN")
+    bb.utils.mkdirhier(d.getVar("TEST_LOG_SDKEXT_DIR"))
 
     tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.sh")
     if not os.path.exists(tcname):
diff --git a/meta/classes/tinderclient.bbclass b/meta/classes/tinderclient.bbclass
index 917b74d..706a392 100644
--- a/meta/classes/tinderclient.bbclass
+++ b/meta/classes/tinderclient.bbclass
@@ -55,22 +55,22 @@ def tinder_format_http_post(d,status,log):
 
     # the variables we will need to send on this form post
     variables =  {
-        "tree"         : d.getVar('TINDER_TREE', True),
-        "machine_name" : d.getVar('TINDER_MACHINE', True),
+        "tree"         : d.getVar('TINDER_TREE'),
+        "machine_name" : d.getVar('TINDER_MACHINE'),
         "os"           : os.uname()[0],
         "os_version"   : os.uname()[2],
         "compiler"     : "gcc",
-        "clobber"      : d.getVar('TINDER_CLOBBER', True) or "0",
-        "srcdate"      : d.getVar('SRCDATE', True),
-        "PN"           : d.getVar('PN', True),
-        "PV"           : d.getVar('PV', True),
-        "PR"           : d.getVar('PR', True),
-        "FILE"         : d.getVar('FILE', True) or "N/A",
-        "TARGETARCH"   : d.getVar('TARGET_ARCH', True),
-        "TARGETFPU"    : d.getVar('TARGET_FPU', True) or "Unknown",
-        "TARGETOS"     : d.getVar('TARGET_OS', True) or "Unknown",
-        "MACHINE"      : d.getVar('MACHINE', True) or "Unknown",
-        "DISTRO"       : d.getVar('DISTRO', True) or "Unknown",
+        "clobber"      : d.getVar('TINDER_CLOBBER') or "0",
+        "srcdate"      : d.getVar('SRCDATE'),
+        "PN"           : d.getVar('PN'),
+        "PV"           : d.getVar('PV'),
+        "PR"           : d.getVar('PR'),
+        "FILE"         : d.getVar('FILE') or "N/A",
+        "TARGETARCH"   : d.getVar('TARGET_ARCH'),
+        "TARGETFPU"    : d.getVar('TARGET_FPU') or "Unknown",
+        "TARGETOS"     : d.getVar('TARGET_OS') or "Unknown",
+        "MACHINE"      : d.getVar('MACHINE') or "Unknown",
+        "DISTRO"       : d.getVar('DISTRO') or "Unknown",
         "zecke-rocks"  : "sure",
     }
 
@@ -127,7 +127,7 @@ def tinder_build_start(d):
 
     # now we will need to save the machine number
     # we will override any previous numbers
-    f = open(d.getVar('TMPDIR', True)+"/tinder-machine.id", 'w')
+    f = open(d.getVar('TMPDIR')+"/tinder-machine.id", 'w')
     f.write(report)
 
 
@@ -137,8 +137,8 @@ def tinder_send_http(d, status, _log):
     """
 
     # get the body and type
-    server = d.getVar('TINDER_HOST', True)
-    url    = d.getVar('TINDER_URL', True)
+    server = d.getVar('TINDER_HOST')
+    url    = d.getVar('TINDER_URL')
 
     selector = url + "/xml/build_status.pl"
 
@@ -278,7 +278,7 @@ def tinder_do_tinder_report(event):
 
         try:
             # truncate the tinder log file
-            f = open(event.data.getVar('TINDER_LOG', True), 'w')
+            f = open(event.data.getVar('TINDER_LOG'), 'w')
             f.write("")
             f.close()
         except:
@@ -287,7 +287,7 @@ def tinder_do_tinder_report(event):
         try:
             # write a status to the file. This is needed for the -k option
             # of BitBake
-            g = open(event.data.getVar('TMPDIR', True)+"/tinder-status", 'w')
+            g = open(event.data.getVar('TMPDIR')+"/tinder-status", 'w')
             g.write("")
             g.close()
         except IOError:
@@ -296,10 +296,10 @@ def tinder_do_tinder_report(event):
     # Append the Task-Log (compile,configure...) to the log file
     # we will send to the server
     if name == "TaskSucceeded" or name == "TaskFailed":
-        log_file = glob.glob("%s/log.%s.*" % (event.data.getVar('T', True), event.task))
+        log_file = glob.glob("%s/log.%s.*" % (event.data.getVar('T'), event.task))
 
         if len(log_file) != 0:
-            to_file  = event.data.getVar('TINDER_LOG', True)
+            to_file  = event.data.getVar('TINDER_LOG')
             log     += "".join(open(log_file[0], 'r').readlines())
 
     # set the right 'HEADER'/Summary for the TinderBox
@@ -310,16 +310,16 @@ def tinder_do_tinder_report(event):
     elif name == "TaskFailed":
         log += "<--- TINDERBOX Task %s failed (FAILURE)\n" % event.task
     elif name == "PkgStarted":
-        log += "---> TINDERBOX Package %s started\n" % event.data.getVar('PF', True)
+        log += "---> TINDERBOX Package %s started\n" % event.data.getVar('PF')
     elif name == "PkgSucceeded":
-        log += "<--- TINDERBOX Package %s done (SUCCESS)\n" % event.data.getVar('PF', True)
+        log += "<--- TINDERBOX Package %s done (SUCCESS)\n" % event.data.getVar('PF')
     elif name == "PkgFailed":
-        if not event.data.getVar('TINDER_AUTOBUILD', True) == "0":
+        if not event.data.getVar('TINDER_AUTOBUILD') == "0":
             build.exec_task('do_clean', event.data)
-        log += "<--- TINDERBOX Package %s failed (FAILURE)\n" % event.data.getVar('PF', True)
+        log += "<--- TINDERBOX Package %s failed (FAILURE)\n" % event.data.getVar('PF')
         status = 200
         # remember the failure for the -k case
-        h = open(event.data.getVar('TMPDIR', True)+"/tinder-status", 'w')
+        h = open(event.data.getVar('TMPDIR')+"/tinder-status", 'w')
         h.write("200")
     elif name == "BuildCompleted":
         log += "Build Completed\n"
@@ -342,7 +342,7 @@ def tinder_do_tinder_report(event):
         log += "Error:Was Runtime: %d\n" % event.isRuntime()
         status = 200
         # remember the failure for the -k case
-        h = open(event.data.getVar('TMPDIR', True)+"/tinder-status", 'w')
+        h = open(event.data.getVar('TMPDIR')+"/tinder-status", 'w')
         h.write("200")
 
     # now post the log
@@ -360,7 +360,7 @@ python tinderclient_eventhandler() {
     if e.data is None or bb.event.getName(e) == "MsgNote":
         return
 
-    do_tinder_report = e.data.getVar('TINDER_REPORT', True)
+    do_tinder_report = e.data.getVar('TINDER_REPORT')
     if do_tinder_report and do_tinder_report == "1":
         tinder_do_tinder_report(e)
 
diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 4bddf34..4ea2056 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -80,7 +80,7 @@ python toaster_layerinfo_dumpdata() {
         return layer_info
 
 
-    bblayers = e.data.getVar("BBLAYERS", True)
+    bblayers = e.data.getVar("BBLAYERS")
 
     llayerinfo = {}
 
@@ -119,10 +119,10 @@ python toaster_package_dumpdata() {
     """
 
     # No need to try and dumpdata if the recipe isn't generating packages
-    if not d.getVar('PACKAGES', True):
+    if not d.getVar('PACKAGES'):
         return
 
-    pkgdatadir = d.getVar('PKGDESTWORK', True)
+    pkgdatadir = d.getVar('PKGDESTWORK')
     lpkgdata = {}
     datadir = os.path.join(pkgdatadir, 'runtime')
 
@@ -142,7 +142,7 @@ python toaster_artifact_dumpdata() {
     """
 
     event_data = {
-      "TOOLCHAIN_OUTPUTNAME": d.getVar("TOOLCHAIN_OUTPUTNAME", True)
+      "TOOLCHAIN_OUTPUTNAME": d.getVar("TOOLCHAIN_OUTPUTNAME")
     }
 
     bb.event.fire(bb.event.MetadataEvent("SDKArtifactInfo", event_data), d)
@@ -157,9 +157,9 @@ python toaster_collect_task_stats() {
     import bb.utils
     import os
 
-    toaster_statlist_file = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist")
+    toaster_statlist_file = os.path.join(e.data.getVar('BUILDSTATS_BASE'), "toasterstatlist")
 
-    if not e.data.getVar('BUILDSTATS_BASE', True):
+    if not e.data.getVar('BUILDSTATS_BASE'):
         return  # if we don't have buildstats, we cannot collect stats
 
     def stat_to_float(value):
@@ -246,7 +246,7 @@ python toaster_buildhistory_dump() {
     import re
     BUILDHISTORY_DIR = e.data.expand("${TOPDIR}/buildhistory")
     BUILDHISTORY_DIR_IMAGE_BASE = e.data.expand("%s/images/${MACHINE_ARCH}/${TCLIBC}/"% BUILDHISTORY_DIR)
-    pkgdata_dir = e.data.getVar("PKGDATA_DIR", True)
+    pkgdata_dir = e.data.getVar("PKGDATA_DIR")
 
 
     # scan the build targets for this build
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 0e11f2d..44b4e24 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -139,9 +139,9 @@ toolchain_create_sdk_siteconfig[vardepsexclude] = "TOOLCHAIN_CONFIGSITE_SYSROOTC
 python __anonymous () {
     import oe.classextend
     deps = ""
-    for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
+    for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE') or "").split():
         deps += " %s:do_populate_sysroot" % dep
-        for variant in (d.getVar('MULTILIB_VARIANTS', True) or "").split():
+        for variant in (d.getVar('MULTILIB_VARIANTS') or "").split():
             clsextend = oe.classextend.ClassExtender(variant, d)
             newdep = clsextend.extend_name(dep)
             deps += " %s:do_populate_sysroot" % newdep
diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 3f760f2..10013b7 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -14,19 +14,19 @@
 UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
 
 python () {
-    ubootmachine = d.getVar("UBOOT_MACHINE", True)
+    ubootmachine = d.getVar("UBOOT_MACHINE")
     ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
-    ubootbinary = d.getVar('UBOOT_BINARY', True)
-    ubootbinaries = d.getVar('UBOOT_BINARIES', True)
+    ubootbinary = d.getVar('UBOOT_BINARY')
+    ubootbinaries = d.getVar('UBOOT_BINARIES')
     # The "doc" varflag is special, we don't want to see it here
     ubootconfigflags.pop('doc', None)
 
     if not ubootmachine and not ubootconfigflags:
-        PN = d.getVar("PN", True)
-        FILE = os.path.basename(d.getVar("FILE", True))
+        PN = d.getVar("PN")
+        FILE = os.path.basename(d.getVar("FILE"))
         bb.debug(1, "To build %s, see %s for instructions on \
                  setting up your machine config" % (PN, FILE))
-        raise bb.parse.SkipPackage("Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the %s machine configuration." % d.getVar("MACHINE", True))
+        raise bb.parse.SkipPackage("Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the %s machine configuration." % d.getVar("MACHINE"))
 
     if ubootmachine and ubootconfigflags:
         raise bb.parse.SkipPackage("You cannot use UBOOT_MACHINE and UBOOT_CONFIG at the same time.")
@@ -37,7 +37,7 @@ python () {
     if not ubootconfigflags:
         return
 
-    ubootconfig = (d.getVar('UBOOT_CONFIG', True) or "").split()
+    ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
     if len(ubootconfig) > 0:
         for config in ubootconfig:
             for f, v in ubootconfigflags.items():
diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
index df91386..ec5fffb 100644
--- a/meta/classes/uboot-extlinux-config.bbclass
+++ b/meta/classes/uboot-extlinux-config.bbclass
@@ -58,20 +58,20 @@ UBOOT_EXTLINUX_MENU_DESCRIPTION_linux ??= "${DISTRO_NAME}"
 UBOOT_EXTLINUX_CONFIG = "${B}/extlinux.conf"
 
 python create_extlinux_config() {
-    if d.getVar("UBOOT_EXTLINUX", True) != "1":
+    if d.getVar("UBOOT_EXTLINUX") != "1":
       return
 
-    if not d.getVar('WORKDIR', True):
+    if not d.getVar('WORKDIR'):
         bb.error("WORKDIR not defined, unable to package")
 
-    labels = d.getVar('UBOOT_EXTLINUX_LABELS', True)
+    labels = d.getVar('UBOOT_EXTLINUX_LABELS')
     if not labels:
         bb.fatal("UBOOT_EXTLINUX_LABELS not defined, nothing to do")
 
     if not labels.strip():
         bb.fatal("No labels, nothing to do")
 
-    cfile = d.getVar('UBOOT_EXTLINUX_CONFIG', True)
+    cfile = d.getVar('UBOOT_EXTLINUX_CONFIG')
     if not cfile:
         bb.fatal('Unable to read UBOOT_EXTLINUX_CONFIG')
 
@@ -85,34 +85,34 @@ python create_extlinux_config() {
             for label in labels.split():
                 localdata = bb.data.createCopy(d)
 
-                overrides = localdata.getVar('OVERRIDES', True)
+                overrides = localdata.getVar('OVERRIDES')
                 if not overrides:
                     bb.fatal('OVERRIDES not defined')
 
                 localdata.setVar('OVERRIDES', label + ':' + overrides)
                 bb.data.update_data(localdata)
 
-                extlinux_console = localdata.getVar('UBOOT_EXTLINUX_CONSOLE', True)
+                extlinux_console = localdata.getVar('UBOOT_EXTLINUX_CONSOLE')
 
-                menu_description = localdata.getVar('UBOOT_EXTLINUX_MENU_DESCRIPTION', True)
+                menu_description = localdata.getVar('UBOOT_EXTLINUX_MENU_DESCRIPTION')
                 if not menu_description:
                     menu_description = label
 
-                root = localdata.getVar('UBOOT_EXTLINUX_ROOT', True)
+                root = localdata.getVar('UBOOT_EXTLINUX_ROOT')
                 if not root:
                     bb.fatal('UBOOT_EXTLINUX_ROOT not defined')
 
-                kernel_image = localdata.getVar('UBOOT_EXTLINUX_KERNEL_IMAGE', True)
-                fdtdir = localdata.getVar('UBOOT_EXTLINUX_FDTDIR', True)
+                kernel_image = localdata.getVar('UBOOT_EXTLINUX_KERNEL_IMAGE')
+                fdtdir = localdata.getVar('UBOOT_EXTLINUX_FDTDIR')
                 if fdtdir:
                     cfgfile.write('LABEL %s\n\tKERNEL %s\n\tFDTDIR %s\n' %
                                  (menu_description, kernel_image, fdtdir))
                 else:
                     cfgfile.write('LABEL %s\n\tKERNEL %s\n' % (menu_description, kernel_image))
 
-                kernel_args = localdata.getVar('UBOOT_EXTLINUX_KERNEL_ARGS', True)
+                kernel_args = localdata.getVar('UBOOT_EXTLINUX_KERNEL_ARGS')
 
-                initrd = localdata.getVar('UBOOT_EXTLINUX_INITRD', True)
+                initrd = localdata.getVar('UBOOT_EXTLINUX_INITRD')
                 if initrd:
                     cfgfile.write('\tINITRD %s\n'% initrd)
 
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index cef26b1..65a8c49 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -80,9 +80,9 @@ do_concat_dtb () {
 }
 
 python () {
-	uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot', True) or 'u-boot'
-	if d.getVar('UBOOT_SIGN_ENABLE', True) == '1' and d.getVar('PN', True) == uboot_pn:
-		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel', True)
+	uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
+	if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == uboot_pn:
+		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
 
 		# u-boot.dtb and u-boot-nodtb.bin are deployed _before_ do_deploy
 		# Thus, do_deploy_setscene will also populate them in DEPLOY_IMAGE_DIR
diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 89cec07..7dab1e8 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -30,11 +30,11 @@ python uninative_event_fetchloader() {
     loader isn't already present.
     """
 
-    chksum = d.getVarFlag("UNINATIVE_CHECKSUM", d.getVar("BUILD_ARCH", True), True)
+    chksum = d.getVarFlag("UNINATIVE_CHECKSUM", d.getVar("BUILD_ARCH"), True)
     if not chksum:
-        bb.fatal("Uninative selected but not configured correctly, please set UNINATIVE_CHECKSUM[%s]" % d.getVar("BUILD_ARCH", True))
+        bb.fatal("Uninative selected but not configured correctly, please set UNINATIVE_CHECKSUM[%s]" % d.getVar("BUILD_ARCH"))
 
-    loader = d.getVar("UNINATIVE_LOADER", True)
+    loader = d.getVar("UNINATIVE_LOADER")
     loaderchksum = loader + ".chksum"
     if os.path.exists(loader) and os.path.exists(loaderchksum):
         with open(loaderchksum, "r") as f:
@@ -47,13 +47,13 @@ python uninative_event_fetchloader() {
         # Save and restore cwd as Fetch.download() does a chdir()
         olddir = os.getcwd()
 
-        tarball = d.getVar("UNINATIVE_TARBALL", True)
-        tarballdir = os.path.join(d.getVar("UNINATIVE_DLDIR", True), chksum)
+        tarball = d.getVar("UNINATIVE_TARBALL")
+        tarballdir = os.path.join(d.getVar("UNINATIVE_DLDIR"), chksum)
         tarballpath = os.path.join(tarballdir, tarball)
 
         if not os.path.exists(tarballpath):
             bb.utils.mkdirhier(tarballdir)
-            if d.getVar("UNINATIVE_URL", True) == "unset":
+            if d.getVar("UNINATIVE_URL") == "unset":
                 bb.fatal("Uninative selected but not configured, please set UNINATIVE_URL")
 
             localdata = bb.data.createCopy(d)
@@ -96,7 +96,7 @@ python uninative_event_enable() {
 }
 
 def enable_uninative(d):
-    loader = d.getVar("UNINATIVE_LOADER", True)
+    loader = d.getVar("UNINATIVE_LOADER")
     if os.path.exists(loader):
         bb.debug(2, "Enabling uninative")
         d.setVar("NATIVELSBSTRING", "universal")
@@ -111,7 +111,7 @@ python uninative_changeinterp () {
     if not (bb.data.inherits_class('native', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross', d)):
         return
 
-    sstateinst = d.getVar('SSTATE_INSTDIR', True)
+    sstateinst = d.getVar('SSTATE_INSTDIR')
     for walkroot, dirs, files in os.walk(sstateinst):
         for file in files:
             if file.endswith(".so") or ".so." in file:
@@ -132,7 +132,7 @@ python uninative_changeinterp () {
 
             try:
                 subprocess.check_output(("patchelf-uninative", "--set-interpreter",
-                                         d.getVar("UNINATIVE_LOADER", True), f),
+                                         d.getVar("UNINATIVE_LOADER"), f),
                                         stderr=subprocess.STDOUT)
             except subprocess.CalledProcessError as e:
                 bb.fatal("'%s' failed with exit code %d and the following output:\n%s" %
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 1fdd681..65da9da 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -66,8 +66,8 @@ ALTERNATIVE_PRIORITY = "10"
 UPDALTVARS  = "ALTERNATIVE ALTERNATIVE_LINK_NAME ALTERNATIVE_TARGET ALTERNATIVE_PRIORITY"
 
 def gen_updatealternativesvardeps(d):
-    pkgs = (d.getVar("PACKAGES", True) or "").split()
-    vars = (d.getVar("UPDALTVARS", True) or "").split()
+    pkgs = (d.getVar("PACKAGES") or "").split()
+    vars = (d.getVar("UPDALTVARS") or "").split()
 
     # First compute them for non_pkg versions
     for v in vars:
@@ -84,7 +84,7 @@ def gen_updatealternativesvardeps(d):
                 d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d.getVarFlag('%s_%s' % (v,p), flag, False)))
 
 def ua_extend_depends(d):
-    if not 'virtual/update-alternatives' in d.getVar('PROVIDES', True):
+    if not 'virtual/update-alternatives' in d.getVar('PROVIDES'):
         d.appendVar('DEPENDS', ' virtual/${MLPREFIX}update-alternatives')
 
 python __anonymous() {
@@ -103,8 +103,8 @@ python __anonymous() {
 
 def gen_updatealternativesvars(d):
     ret = []
-    pkgs = (d.getVar("PACKAGES", True) or "").split()
-    vars = (d.getVar("UPDALTVARS", True) or "").split()
+    pkgs = (d.getVar("PACKAGES") or "").split()
+    vars = (d.getVar("UPDALTVARS") or "").split()
 
     for v in vars:
         ret.append(v + "_VARDEPS")
@@ -123,23 +123,23 @@ populate_packages[vardeps] += "${UPDALTVARS} ${@gen_updatealternativesvars(d)}"
 # place.
 python perform_packagecopy_append () {
     # Check for deprecated usage...
-    pn = d.getVar('BPN', True)
-    if d.getVar('ALTERNATIVE_LINKS', True) != None:
+    pn = d.getVar('BPN')
+    if d.getVar('ALTERNATIVE_LINKS') != None:
         bb.fatal('%s: Use of ALTERNATIVE_LINKS/ALTERNATIVE_PATH/ALTERNATIVE_NAME is no longer supported, please convert to the updated syntax, see update-alternatives.bbclass for more info.' % pn)
 
     # Do actual update alternatives processing
-    pkgdest = d.getVar('PKGD', True)
-    for pkg in (d.getVar('PACKAGES', True) or "").split():
+    pkgdest = d.getVar('PKGD')
+    for pkg in (d.getVar('PACKAGES') or "").split():
         # If the src == dest, we know we need to rename the dest by appending ${BPN}
         link_rename = {}
-        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg, True) or "").split():
+        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
             alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name, True)
             if not alt_link:
-                alt_link = "%s/%s" % (d.getVar('bindir', True), alt_name)
+                alt_link = "%s/%s" % (d.getVar('bindir'), alt_name)
                 d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link)
 
             alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name, True) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name, True)
-            alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg, True) or d.getVar('ALTERNATIVE_TARGET', True) or alt_link
+            alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg) or d.getVar('ALTERNATIVE_TARGET') or alt_link
             # Sometimes alt_target is specified as relative to the link name.
             alt_target   = os.path.join(os.path.dirname(alt_link), alt_target)
 
@@ -189,23 +189,23 @@ python perform_packagecopy_append () {
 PACKAGESPLITFUNCS_prepend = "populate_packages_updatealternatives "
 
 python populate_packages_updatealternatives () {
-    pn = d.getVar('BPN', True)
+    pn = d.getVar('BPN')
 
     # Do actual update alternatives processing
-    pkgdest = d.getVar('PKGD', True)
-    for pkg in (d.getVar('PACKAGES', True) or "").split():
+    pkgdest = d.getVar('PKGD')
+    for pkg in (d.getVar('PACKAGES') or "").split():
         # Create post install/removal scripts
         alt_setup_links = ""
         alt_remove_links = ""
-        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg, True) or "").split():
+        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
             alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name, True)
             alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name, True) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name, True)
-            alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg, True) or d.getVar('ALTERNATIVE_TARGET', True) or alt_link
+            alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg) or d.getVar('ALTERNATIVE_TARGET') or alt_link
             # Sometimes alt_target is specified as relative to the link name.
             alt_target   = os.path.join(os.path.dirname(alt_link), alt_target)
 
             alt_priority = d.getVarFlag('ALTERNATIVE_PRIORITY_%s' % pkg,  alt_name, True) or d.getVarFlag('ALTERNATIVE_PRIORITY',  alt_name, True)
-            alt_priority = alt_priority or d.getVar('ALTERNATIVE_PRIORITY_%s' % pkg, True) or d.getVar('ALTERNATIVE_PRIORITY', True)
+            alt_priority = alt_priority or d.getVar('ALTERNATIVE_PRIORITY_%s' % pkg) or d.getVar('ALTERNATIVE_PRIORITY')
 
             # This shouldn't trigger, as it should have been resolved earlier!
             if alt_link == alt_target:
@@ -224,32 +224,32 @@ python populate_packages_updatealternatives () {
 
         if alt_setup_links:
             # RDEPENDS setup
-            provider = d.getVar('VIRTUAL-RUNTIME_update-alternatives', True)
+            provider = d.getVar('VIRTUAL-RUNTIME_update-alternatives')
             if provider:
                 #bb.note('adding runtime requirement for update-alternatives for %s' % pkg)
                 d.appendVar('RDEPENDS_%s' % pkg, ' ' + d.getVar('MLPREFIX', False) + provider)
 
             bb.note('adding update-alternatives calls to postinst/prerm for %s' % pkg)
             bb.note('%s' % alt_setup_links)
-            postinst = d.getVar('pkg_postinst_%s' % pkg, True) or '#!/bin/sh\n'
+            postinst = d.getVar('pkg_postinst_%s' % pkg) or '#!/bin/sh\n'
             postinst += alt_setup_links
             d.setVar('pkg_postinst_%s' % pkg, postinst)
 
             bb.note('%s' % alt_remove_links)
-            prerm = d.getVar('pkg_prerm_%s' % pkg, True) or '#!/bin/sh\n'
+            prerm = d.getVar('pkg_prerm_%s' % pkg) or '#!/bin/sh\n'
             prerm += alt_remove_links
             d.setVar('pkg_prerm_%s' % pkg, prerm)
 }
 
 python package_do_filedeps_append () {
-    pn = d.getVar('BPN', True)
-    pkgdest = d.getVar('PKGDEST', True)
+    pn = d.getVar('BPN')
+    pkgdest = d.getVar('PKGDEST')
 
     for pkg in packages.split():
-        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg, True) or "").split():
+        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
             alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name, True)
             alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name, True) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name, True)
-            alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg, True) or d.getVar('ALTERNATIVE_TARGET', True) or alt_link
+            alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg) or d.getVar('ALTERNATIVE_TARGET') or alt_link
 
             if alt_link == alt_target:
                 bb.warn('%s: alt_link == alt_target: %s == %s' % (pn, alt_link, alt_target))
@@ -261,7 +261,7 @@ python package_do_filedeps_append () {
             # Add file provide
             trans_target = oe.package.file_translate(alt_target)
             d.appendVar('FILERPROVIDES_%s_%s' % (trans_target, pkg), " " + alt_link)
-            if not trans_target in (d.getVar('FILERPROVIDESFLIST_%s' % pkg, True) or ""):
+            if not trans_target in (d.getVar('FILERPROVIDESFLIST_%s' % pkg) or ""):
                 d.appendVar('FILERPROVIDESFLIST_%s' % pkg, " " + trans_target)
 }
 
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 321924b..eafd036 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -80,52 +80,52 @@ python populate_packages_updatercd () {
             return
         statement = "grep -q -w '/etc/init.d/functions' %s" % path
         if subprocess.call(statement, shell=True) == 0:
-            mlprefix = d.getVar('MLPREFIX', True) or ""
+            mlprefix = d.getVar('MLPREFIX') or ""
             d.appendVar('RDEPENDS_' + pkg, ' %sinitscripts-functions' % (mlprefix))
 
     def update_rcd_package(pkg):
         bb.debug(1, 'adding update-rc.d calls to preinst/postinst/prerm/postrm for %s' % pkg)
 
         localdata = bb.data.createCopy(d)
-        overrides = localdata.getVar("OVERRIDES", True)
+        overrides = localdata.getVar("OVERRIDES")
         localdata.setVar("OVERRIDES", "%s:%s" % (pkg, overrides))
         bb.data.update_data(localdata)
 
         update_rcd_auto_depend(pkg)
 
-        preinst = d.getVar('pkg_preinst_%s' % pkg, True)
+        preinst = d.getVar('pkg_preinst_%s' % pkg)
         if not preinst:
             preinst = '#!/bin/sh\n'
-        preinst += localdata.getVar('updatercd_preinst', True)
+        preinst += localdata.getVar('updatercd_preinst')
         d.setVar('pkg_preinst_%s' % pkg, preinst)
 
-        postinst = d.getVar('pkg_postinst_%s' % pkg, True)
+        postinst = d.getVar('pkg_postinst_%s' % pkg)
         if not postinst:
             postinst = '#!/bin/sh\n'
-        postinst += localdata.getVar('updatercd_postinst', True)
+        postinst += localdata.getVar('updatercd_postinst')
         d.setVar('pkg_postinst_%s' % pkg, postinst)
 
-        prerm = d.getVar('pkg_prerm_%s' % pkg, True)
+        prerm = d.getVar('pkg_prerm_%s' % pkg)
         if not prerm:
             prerm = '#!/bin/sh\n'
-        prerm += localdata.getVar('updatercd_prerm', True)
+        prerm += localdata.getVar('updatercd_prerm')
         d.setVar('pkg_prerm_%s' % pkg, prerm)
 
-        postrm = d.getVar('pkg_postrm_%s' % pkg, True)
+        postrm = d.getVar('pkg_postrm_%s' % pkg)
         if not postrm:
                 postrm = '#!/bin/sh\n'
-        postrm += localdata.getVar('updatercd_postrm', True)
+        postrm += localdata.getVar('updatercd_postrm')
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 
         d.appendVar('RRECOMMENDS_' + pkg, " ${MLPREFIX}${UPDATERCD}")
 
     # Check that this class isn't being inhibited (generally, by
     # systemd.bbclass) before doing any work.
-    if not d.getVar("INHIBIT_UPDATERCD_BBCLASS", True):
-        pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
+    if not d.getVar("INHIBIT_UPDATERCD_BBCLASS"):
+        pkgs = d.getVar('INITSCRIPT_PACKAGES')
         if pkgs == None:
-            pkgs = d.getVar('UPDATERCPN', True)
-            packages = (d.getVar('PACKAGES', True) or "").split()
+            pkgs = d.getVar('UPDATERCPN')
+            packages = (d.getVar('PACKAGES') or "").split()
             if not pkgs in packages and packages != []:
                 pkgs = packages[0]
         for pkg in pkgs.split():
diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 4162774..94bcbaa 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -8,11 +8,11 @@ def update_useradd_static_config(d):
 
     class myArgumentParser( argparse.ArgumentParser ):
         def _print_message(self, message, file=None):
-            bb.warn("%s - %s: %s" % (d.getVar('PN', True), pkg, message))
+            bb.warn("%s - %s: %s" % (d.getVar('PN'), pkg, message))
 
         # This should never be called...
         def exit(self, status=0, message=None):
-            message = message or ("%s - %s: useradd.bbclass: Argument parsing exited" % (d.getVar('PN', True), pkg))
+            message = message or ("%s - %s: useradd.bbclass: Argument parsing exited" % (d.getVar('PN'), pkg))
             error(message)
 
         def error(self, message):
@@ -52,10 +52,10 @@ def update_useradd_static_config(d):
 
     def handle_missing_id(id, type, pkg):
         # For backwards compatibility we accept "1" in addition to "error"
-        if d.getVar('USERADD_ERROR_DYNAMIC', True) == 'error' or d.getVar('USERADD_ERROR_DYNAMIC', True) == '1':
-            raise NotImplementedError("%s - %s: %sname %s does not have a static ID defined. Skipping it." % (d.getVar('PN', True), pkg, type, id))
-        elif d.getVar('USERADD_ERROR_DYNAMIC', True) == 'warn':
-            bb.warn("%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN', True), pkg, type, id))
+        if d.getVar('USERADD_ERROR_DYNAMIC') == 'error' or d.getVar('USERADD_ERROR_DYNAMIC') == '1':
+            raise NotImplementedError("%s - %s: %sname %s does not have a static ID defined. Skipping it." % (d.getVar('PN'), pkg, type, id))
+        elif d.getVar('USERADD_ERROR_DYNAMIC') == 'warn':
+            bb.warn("%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN'), pkg, type, id))
 
     # We parse and rewrite the useradd components
     def rewrite_useradd(params):
@@ -89,8 +89,8 @@ def update_useradd_static_config(d):
         # paths are resolved via BBPATH
         def get_passwd_list(d):
             str = ""
-            bbpath = d.getVar('BBPATH', True)
-            passwd_tables = d.getVar('USERADD_UID_TABLES', True)
+            bbpath = d.getVar('BBPATH')
+            passwd_tables = d.getVar('USERADD_UID_TABLES')
             if not passwd_tables:
                 passwd_tables = 'files/passwd'
             for conf_file in passwd_tables.split():
@@ -106,7 +106,7 @@ def update_useradd_static_config(d):
             try:
                 uaargs = parser.parse_args(re.split('''[ \t]+(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
             except:
-                bb.fatal("%s: Unable to parse arguments for USERADD_PARAM_%s: '%s'" % (d.getVar('PN', True), pkg, param))
+                bb.fatal("%s: Unable to parse arguments for USERADD_PARAM_%s: '%s'" % (d.getVar('PN'), pkg, param))
 
             # Read all passwd files specified in USERADD_UID_TABLES or files/passwd
             # Use the standard passwd layout:
@@ -130,7 +130,7 @@ def update_useradd_static_config(d):
             field = users[uaargs.LOGIN]
 
             if uaargs.uid and field[2] and (uaargs.uid != field[2]):
-                bb.warn("%s: Changing username %s's uid from (%s) to (%s), verify configuration files!" % (d.getVar('PN', True), uaargs.LOGIN, uaargs.uid, field[2]))
+                bb.warn("%s: Changing username %s's uid from (%s) to (%s), verify configuration files!" % (d.getVar('PN'), uaargs.LOGIN, uaargs.uid, field[2]))
             uaargs.uid = field[2] or uaargs.uid
 
             # Determine the possible groupname
@@ -158,12 +158,12 @@ def update_useradd_static_config(d):
                     # We want to add a group, but we don't know it's name... so we can't add the group...
                     # We have to assume the group has previously been added or we'll fail on the adduser...
                     # Note: specifying the actual gid is very rare in OE, usually the group name is specified.
-                    bb.warn("%s: Changing gid for login %s to %s, verify configuration files!" % (d.getVar('PN', True), uaargs.LOGIN, uaargs.groupid))
+                    bb.warn("%s: Changing gid for login %s to %s, verify configuration files!" % (d.getVar('PN'), uaargs.LOGIN, uaargs.groupid))
 
                 uaargs.gid = uaargs.groupid
                 uaargs.user_group = None
                 if newgroup:
-                    groupadd = d.getVar("GROUPADD_PARAM_%s" % pkg, True)
+                    groupadd = d.getVar("GROUPADD_PARAM_%s" % pkg)
                     if groupadd:
                         d.setVar("GROUPADD_PARAM_%s" % pkg, "%s; %s" % (groupadd, newgroup))
                     else:
@@ -223,8 +223,8 @@ def update_useradd_static_config(d):
         # paths are resolved via BBPATH
         def get_group_list(d):
             str = ""
-            bbpath = d.getVar('BBPATH', True)
-            group_tables = d.getVar('USERADD_GID_TABLES', True)
+            bbpath = d.getVar('BBPATH')
+            group_tables = d.getVar('USERADD_GID_TABLES')
             if not group_tables:
                 group_tables = 'files/group'
             for conf_file in group_tables.split():
@@ -241,7 +241,7 @@ def update_useradd_static_config(d):
                 # If we're processing multiple lines, we could have left over values here...
                 gaargs = parser.parse_args(re.split('''[ \t]+(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
             except:
-                bb.fatal("%s: Unable to parse arguments for GROUPADD_PARAM_%s: '%s'" % (d.getVar('PN', True), pkg, param))
+                bb.fatal("%s: Unable to parse arguments for GROUPADD_PARAM_%s: '%s'" % (d.getVar('PN'), pkg, param))
 
             # Read all group files specified in USERADD_GID_TABLES or files/group
             # Use the standard group layout:
@@ -264,7 +264,7 @@ def update_useradd_static_config(d):
 
             if field[2]:
                 if gaargs.gid and (gaargs.gid != field[2]):
-                    bb.warn("%s: Changing groupname %s's gid from (%s) to (%s), verify configuration files!" % (d.getVar('PN', True), gaargs.GROUP, gaargs.gid, field[2]))
+                    bb.warn("%s: Changing groupname %s's gid from (%s) to (%s), verify configuration files!" % (d.getVar('PN'), gaargs.GROUP, gaargs.gid, field[2]))
                 gaargs.gid = field[2]
 
             if not gaargs.gid or not gaargs.gid.isdigit():
@@ -288,32 +288,32 @@ def update_useradd_static_config(d):
     # the files listed in USERADD_UID/GID_TABLES. We need to tell bitbake
     # about that explicitly to trigger re-parsing and thus re-execution of
     # this code when the files change.
-    bbpath = d.getVar('BBPATH', True)
+    bbpath = d.getVar('BBPATH')
     for varname, default in (('USERADD_UID_TABLES', 'files/passwd'),
                              ('USERADD_GID_TABLES', 'files/group')):
-        tables = d.getVar(varname, True)
+        tables = d.getVar(varname)
         if not tables:
             tables = default
         for conf_file in tables.split():
             bb.parse.mark_dependency(d, bb.utils.which(bbpath, conf_file))
 
     # Load and process the users and groups, rewriting the adduser/addgroup params
-    useradd_packages = d.getVar('USERADD_PACKAGES', True)
+    useradd_packages = d.getVar('USERADD_PACKAGES')
 
     for pkg in useradd_packages.split():
         # Groupmems doesn't have anything we might want to change, so simply validating
         # is a bit of a waste -- only process useradd/groupadd
-        useradd_param = d.getVar('USERADD_PARAM_%s' % pkg, True)
+        useradd_param = d.getVar('USERADD_PARAM_%s' % pkg)
         if useradd_param:
             #bb.warn("Before: 'USERADD_PARAM_%s' - '%s'" % (pkg, useradd_param))
             d.setVar('USERADD_PARAM_%s' % pkg, rewrite_useradd(useradd_param))
-            #bb.warn("After:  'USERADD_PARAM_%s' - '%s'" % (pkg, d.getVar('USERADD_PARAM_%s' % pkg, True)))
+            #bb.warn("After:  'USERADD_PARAM_%s' - '%s'" % (pkg, d.getVar('USERADD_PARAM_%s' % pkg)))
 
-        groupadd_param = d.getVar('GROUPADD_PARAM_%s' % pkg, True)
+        groupadd_param = d.getVar('GROUPADD_PARAM_%s' % pkg)
         if groupadd_param:
             #bb.warn("Before: 'GROUPADD_PARAM_%s' - '%s'" % (pkg, groupadd_param))
             d.setVar('GROUPADD_PARAM_%s' % pkg, rewrite_groupadd(groupadd_param))
-            #bb.warn("After:  'GROUPADD_PARAM_%s' - '%s'" % (pkg, d.getVar('GROUPADD_PARAM_%s' % pkg, True)))
+            #bb.warn("After:  'GROUPADD_PARAM_%s' - '%s'" % (pkg, d.getVar('GROUPADD_PARAM_%s' % pkg)))
 
 
 
@@ -323,6 +323,6 @@ python __anonymous() {
         try:
             update_useradd_static_config(d)
         except NotImplementedError as f:
-            bb.debug(1, "Skipping recipe %s: %s" % (d.getVar('PN', True), f))
+            bb.debug(1, "Skipping recipe %s: %s" % (d.getVar('PN'), f))
             raise bb.parse.SkipPackage(f)
 }
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 3cff08e..fd59969 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -168,13 +168,13 @@ USERADDSETSCENEDEPS = ""
 
 # Recipe parse-time sanity checks
 def update_useradd_after_parse(d):
-    useradd_packages = d.getVar('USERADD_PACKAGES', True)
+    useradd_packages = d.getVar('USERADD_PACKAGES')
 
     if not useradd_packages:
         bb.fatal("%s inherits useradd but doesn't set USERADD_PACKAGES" % d.getVar('FILE', False))
 
     for pkg in useradd_packages.split():
-        if not d.getVar('USERADD_PARAM_%s' % pkg, True) and not d.getVar('GROUPADD_PARAM_%s' % pkg, True) and not d.getVar('GROUPMEMS_PARAM_%s' % pkg, True):
+        if not d.getVar('USERADD_PARAM_%s' % pkg) and not d.getVar('GROUPADD_PARAM_%s' % pkg) and not d.getVar('GROUPMEMS_PARAM_%s' % pkg):
             bb.fatal("%s inherits useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar('FILE', False), pkg))
 
 python __anonymous() {
@@ -191,9 +191,9 @@ def get_all_cmd_params(d, cmd_type):
     param_type = cmd_type.upper() + "_PARAM_%s"
     params = []
 
-    useradd_packages = d.getVar('USERADD_PACKAGES', True) or ""
+    useradd_packages = d.getVar('USERADD_PACKAGES') or ""
     for pkg in useradd_packages.split():
-        param = d.getVar(param_type % pkg, True)
+        param = d.getVar(param_type % pkg)
         if param:
             params.append(param.rstrip(" ;"))
 
@@ -209,20 +209,20 @@ fakeroot python populate_packages_prepend () {
         required to execute on the target. Not doing so may cause
         useradd preinst to be invoked twice, causing unwanted warnings.
         """
-        preinst = d.getVar('pkg_preinst_%s' % pkg, True) or d.getVar('pkg_preinst', True)
+        preinst = d.getVar('pkg_preinst_%s' % pkg) or d.getVar('pkg_preinst')
         if not preinst:
             preinst = '#!/bin/sh\n'
         preinst += 'bbnote () {\n\techo "NOTE: $*"\n}\n'
         preinst += 'bbwarn () {\n\techo "WARNING: $*"\n}\n'
         preinst += 'bbfatal () {\n\techo "ERROR: $*"\n\texit 1\n}\n'
-        preinst += 'perform_groupadd () {\n%s}\n' % d.getVar('perform_groupadd', True)
-        preinst += 'perform_useradd () {\n%s}\n' % d.getVar('perform_useradd', True)
-        preinst += 'perform_groupmems () {\n%s}\n' % d.getVar('perform_groupmems', True)
-        preinst += d.getVar('useradd_preinst', True)
+        preinst += 'perform_groupadd () {\n%s}\n' % d.getVar('perform_groupadd')
+        preinst += 'perform_useradd () {\n%s}\n' % d.getVar('perform_useradd')
+        preinst += 'perform_groupmems () {\n%s}\n' % d.getVar('perform_groupmems')
+        preinst += d.getVar('useradd_preinst')
         d.setVar('pkg_preinst_%s' % pkg, preinst)
 
         # RDEPENDS setup
-        rdepends = d.getVar("RDEPENDS_%s" % pkg, True) or ""
+        rdepends = d.getVar("RDEPENDS_%s" % pkg) or ""
         rdepends += ' ' + d.getVar('MLPREFIX', False) + 'base-passwd'
         rdepends += ' ' + d.getVar('MLPREFIX', False) + 'shadow'
         # base-files is where the default /etc/skel is packaged
@@ -233,7 +233,7 @@ fakeroot python populate_packages_prepend () {
     # to packages specified by USERADD_PACKAGES
     if not bb.data.inherits_class('nativesdk', d) \
         and not bb.data.inherits_class('native', d):
-        useradd_packages = d.getVar('USERADD_PACKAGES', True) or ""
+        useradd_packages = d.getVar('USERADD_PACKAGES') or ""
         for pkg in useradd_packages.split():
             update_useradd_package(pkg)
 }
diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
index 7ba56e2..68e8217 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -32,14 +32,14 @@ python do_clean() {
     bb.note("Removing " + dir)
     oe.path.remove(dir)
 
-    for f in (d.getVar('CLEANFUNCS', True) or '').split():
+    for f in (d.getVar('CLEANFUNCS') or '').split():
         bb.build.exec_func(f, d)
 }
 
 addtask checkuri
 do_checkuri[nostamp] = "1"
 python do_checkuri() {
-    src_uri = (d.getVar('SRC_URI', True) or "").split()
+    src_uri = (d.getVar('SRC_URI') or "").split()
     if len(src_uri) == 0:
         return
 
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index dbb5e4c..640daed 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -41,9 +41,9 @@ def oe_filter_out(f, str, d):
 
 def machine_paths(d):
     """List any existing machine specific filespath directories"""
-    machine = d.getVar("MACHINE", True)
-    filespathpkg = d.getVar("FILESPATHPKG", True).split(":")
-    for basepath in d.getVar("FILESPATHBASE", True).split(":"):
+    machine = d.getVar("MACHINE")
+    filespathpkg = d.getVar("FILESPATHPKG").split(":")
+    for basepath in d.getVar("FILESPATHBASE").split(":"):
         for pkgpath in filespathpkg:
             machinepath = os.path.join(basepath, pkgpath, machine)
             if os.path.isdir(machinepath):
@@ -52,7 +52,7 @@ def machine_paths(d):
 def is_machine_specific(d):
     """Determine whether the current recipe is machine specific"""
     machinepaths = set(machine_paths(d))
-    srcuri = d.getVar("SRC_URI", True).split()
+    srcuri = d.getVar("SRC_URI").split()
     for url in srcuri:
         fetcher = bb.fetch2.Fetch([srcuri], d)
         if url.startswith("file://"):
@@ -315,14 +315,14 @@ def explode_deps(s):
 
 def base_set_filespath(path, d):
     filespath = []
-    extrapaths = (d.getVar("FILESEXTRAPATHS", True) or "")
+    extrapaths = (d.getVar("FILESEXTRAPATHS") or "")
     # Remove default flag which was used for checking
     extrapaths = extrapaths.replace("__default:", "")
     # Don't prepend empty strings to the path list
     if extrapaths != "":
         path = extrapaths.split(":") + path
     # The ":" ensures we have an 'empty' override
-    overrides = (":" + (d.getVar("FILESOVERRIDES", True) or "")).split(":")
+    overrides = (":" + (d.getVar("FILESOVERRIDES") or "")).split(":")
     overrides.reverse()
     for o in overrides:
         for p in path:
@@ -333,7 +333,7 @@ def base_set_filespath(path, d):
 def extend_variants(d, var, extend, delim=':'):
     """Return a string of all bb class extend variants for the given extend"""
     variants = []
-    whole = d.getVar(var, True) or ""
+    whole = d.getVar(var) or ""
     for ext in whole.split():
         eext = ext.split(delim)
         if len(eext) > 1 and eext[0] == extend:
@@ -341,7 +341,7 @@ def extend_variants(d, var, extend, delim=':'):
     return " ".join(variants)
 
 def multilib_pkg_extend(d, pkg):
-    variants = (d.getVar("MULTILIB_VARIANTS", True) or "").split()
+    variants = (d.getVar("MULTILIB_VARIANTS") or "").split()
     if not variants:
         return pkg
     pkgs = pkg
@@ -352,21 +352,21 @@ def multilib_pkg_extend(d, pkg):
 def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = ' '):
     """Return a string of all ${var} in all multilib tune configuration"""
     values = []
-    value = d.getVar(var, True) or ""
+    value = d.getVar(var) or ""
     if value != "":
         if need_split:
             for item in value.split(delim):
                 values.append(item)
         else:
             values.append(value)
-    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+    variants = d.getVar("MULTILIB_VARIANTS") or ""
     for item in variants.split():
         localdata = bb.data.createCopy(d)
         overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
         localdata.setVar("OVERRIDES", overrides)
         localdata.setVar("MLPREFIX", item + "-")
         bb.data.update_data(localdata)
-        value = localdata.getVar(var, True) or ""
+        value = localdata.getVar(var) or ""
         if value != "":
             if need_split:
                 for item in value.split(delim):
@@ -402,21 +402,21 @@ def all_multilib_tune_list(vars, d):
             newoverrides.append(o)
     localdata.setVar("OVERRIDES", ":".join(newoverrides))
     localdata.setVar("MLPREFIX", "")
-    origdefault = localdata.getVar("DEFAULTTUNE_MULTILIB_ORIGINAL", True)
+    origdefault = localdata.getVar("DEFAULTTUNE_MULTILIB_ORIGINAL")
     if origdefault:
         localdata.setVar("DEFAULTTUNE", origdefault)
     bb.data.update_data(localdata)
     values['ml'] = ['']
     for v in vars:
-        values[v].append(localdata.getVar(v, True))
-    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+        values[v].append(localdata.getVar(v))
+    variants = d.getVar("MULTILIB_VARIANTS") or ""
     for item in variants.split():
         localdata = bb.data.createCopy(d)
         overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
         localdata.setVar("OVERRIDES", overrides)
         localdata.setVar("MLPREFIX", item + "-")
         bb.data.update_data(localdata)
-        values[v].append(localdata.getVar(v, True))
+        values[v].append(localdata.getVar(v))
         values['ml'].append(item)
     return values
 
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 5e55833..95f5240 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -2,7 +2,7 @@
 DISABLE_STATIC = ""
 
 def get_waf_parallel_make(d):
-    pm = d.getVar('PARALLEL_MAKE', True)
+    pm = d.getVar('PARALLEL_MAKE')
     if pm:
         # look for '-j' and throw other options (e.g. '-l') away
         # because they might have different meaning in bjam
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1472e8f..aee9919 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -123,7 +123,7 @@ SDKUSE_NLS ??= "yes"
 TARGET_ARCH = "${TUNE_ARCH}"
 TARGET_OS = "linux${LIBCEXTENSION}${ABIEXTENSION}"
 TARGET_VENDOR = "-oe"
-TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS', True), ''][d.getVar('TARGET_OS', True) == ('' or 'custom')]}"
+TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS'), ''][d.getVar('TARGET_OS') == ('' or 'custom')]}"
 TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = "${TUNE_CCARGS}"
 TARGET_LD_ARCH = "${TUNE_LDARGS}"
@@ -132,7 +132,7 @@ TARGET_AS_ARCH = "${TUNE_ASARGS}"
 SDKMACHINE ??= "x86_64"
 SDK_OS = "${BUILD_OS}"
 SDK_VENDOR = "-oesdk"
-SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + d.getVar('SDK_OS', True), ''][d.getVar('SDK_OS', True) == ('' or 'custom')]}"
+SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + d.getVar('SDK_OS'), ''][d.getVar('SDK_OS') == ('' or 'custom')]}"
 SDK_PREFIX = "${SDK_SYS}-"
 SDK_CC_ARCH = "${BUILD_CC_ARCH}"
 SDKPKGSUFFIX = "nativesdk"
@@ -142,7 +142,7 @@ SDK_AS_ARCH = "${BUILD_AS_ARCH}"
 
 TUNE_PKGARCH ??= ""
 PACKAGE_ARCH ??= "${TUNE_PKGARCH}"
-MACHINE_ARCH = "${@[d.getVar('TUNE_PKGARCH', True), d.getVar('MACHINE', True)][bool(d.getVar('MACHINE', True))].replace('-', '_')}"
+MACHINE_ARCH = "${@[d.getVar('TUNE_PKGARCH'), d.getVar('MACHINE')][bool(d.getVar('MACHINE'))].replace('-', '_')}"
 PACKAGE_EXTRA_ARCHS ??= "${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}"
 PACKAGE_ARCHS = "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
 # MACHINE_ARCH shouldn't be included here as a variable dependency
@@ -197,24 +197,24 @@ PV = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0
 PR = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[2] or 'r0'}"
 PE = ""
 PF = "${PN}-${EXTENDPE}${PV}-${PR}"
-EXTENDPE = "${@['','${PE}_'][int(d.getVar('PE', True) or 0) > 0]}"
+EXTENDPE = "${@['','${PE}_'][int(d.getVar('PE') or 0) > 0]}"
 P = "${PN}-${PV}"
 
 PRAUTO = ""
-EXTENDPRAUTO = "${@['.${PRAUTO}', ''][not d.getVar('PRAUTO', True)]}"
+EXTENDPRAUTO = "${@['.${PRAUTO}', ''][not d.getVar('PRAUTO')]}"
 PRAUTOINX = "${PF}"
 
 PKGV ?= "${PV}"
 PKGR ?= "${PR}${EXTENDPRAUTO}"
-PKGE ?= "${@['','${PE}'][int(d.getVar('PE', True) or 0) > 0]}"
-EXTENDPKGEVER = "${@['','${PKGE}:'][d.getVar('PKGE', True).strip() != '']}"
+PKGE ?= "${@['','${PE}'][int(d.getVar('PE') or 0) > 0]}"
+EXTENDPKGEVER = "${@['','${PKGE}:'][d.getVar('PKGE').strip() != '']}"
 EXTENDPKGV ?= "${EXTENDPKGEVER}${PKGV}-${PKGR}"
 
 # Base package name
 # Automatically derives "foo" from "foo-native", "foo-cross" or "foo-initial"
 # otherwise it is the same as PN and P
 SPECIAL_PKGSUFFIX = "-native -cross -initial -intermediate -crosssdk -cross-canadian"
-BPN = "${@base_prune_suffix(d.getVar('PN', True), d.getVar('SPECIAL_PKGSUFFIX', True).split(), d)}"
+BPN = "${@base_prune_suffix(d.getVar('PN'), d.getVar('SPECIAL_PKGSUFFIX').split(), d)}"
 BP = "${BPN}-${PV}"
 
 # Package info.
@@ -330,7 +330,7 @@ FILESEXTRAPATHS ?= "__default:"
 ##################################################################
 
 TMPDIR ?= "${TOPDIR}/tmp"
-CACHE = "${TMPDIR}/cache${@['', '/' + str(d.getVar('MACHINE', True))][bool(d.getVar('MACHINE', True))]}${@['', '/' + str(d.getVar('SDKMACHINE', True))][bool(d.getVar('SDKMACHINE', True))]}"
+CACHE = "${TMPDIR}/cache${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' + str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
 # The persistent cache should be shared by all builds
 PERSISTENT_DIR = "${TOPDIR}/cache"
 LOG_DIR = "${TMPDIR}/log"
@@ -455,7 +455,7 @@ export PATH
 CCACHE ??= ""
 # Disable ccache explicitly if CCACHE is null since gcc may be a symlink
 # of ccache some distributions (e.g., Fedora 17).
-export CCACHE_DISABLE ??= "${@[0,1][d.getVar('CCACHE', True) == '']}"
+export CCACHE_DISABLE ??= "${@[0,1][d.getVar('CCACHE') == '']}"
 # ccache < 3.1.10 will create CCACHE_DIR on startup even if disabled, and
 # autogen sets HOME=/dev/null so in certain situations builds can fail.
 # Explicitly export CCACHE_DIR until we can assume ccache >3.1.10 on the host.
@@ -535,7 +535,7 @@ LINKER_HASH_STYLE ??= "gnu"
 # mips does not support GNU hash style therefore we override
 LINKER_HASH_STYLE_mipsarch = "sysv"
 
-TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_STYLE', True) != 'gnu']}"
+TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_STYLE') != 'gnu']}"
 
 export LDFLAGS = "${TARGET_LDFLAGS}"
 export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
@@ -561,7 +561,7 @@ DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
 # Disabled until the option works properly -feliminate-dwarf2-dups
 FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
 DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
-SELECTED_OPTIMIZATION = "${@d.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTIMIZATION'][d.getVar('DEBUG_BUILD', True) == '1'], True)}"
+SELECTED_OPTIMIZATION = "${@d.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTIMIZATION'][d.getVar('DEBUG_BUILD') == '1'], True)}"
 SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION"
 BUILD_OPTIMIZATION = "-O2 -pipe"
 
@@ -687,7 +687,7 @@ DISTRO_NAME ??= "OpenEmbedded"
 OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
 OVERRIDES[vardepsexclude] = "MACHINEOVERRIDES"
 CLASSOVERRIDE ?= "class-target"
-DISTROOVERRIDES ?= "${@d.getVar('DISTRO', True) or ''}"
+DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
 MACHINEOVERRIDES ?= "${MACHINE}"
 MACHINEOVERRIDES[vardepsexclude] = "MACHINE"
 
@@ -773,7 +773,7 @@ COMBINED_FEATURES = "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MACHINE_FEATU
 COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
 
 SERIAL_CONSOLE ??= ""
-SERIAL_CONSOLES ??= "${@d.getVar('SERIAL_CONSOLE', True).replace(' ', ';')}"
+SERIAL_CONSOLES ??= "${@d.getVar('SERIAL_CONSOLE').replace(' ', ';')}"
 
 NO_RECOMMENDATIONS ?= ""
 BAD_RECOMMENDATIONS ?= ""
@@ -797,7 +797,7 @@ DISTRO[unexport] = "1"
 SHELL[unexport] = "1"
 
 # Used by canadian-cross to handle string conversions on TARGET_ARCH where needed
-TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"
+TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH').replace("_", "-")}"
 
 # Complete output from bitbake
 BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 71c65b1..16e1391 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -13,7 +13,7 @@ require conf/distro/include/tclibc-${TCLIBC}.inc
 TCLIBCAPPEND ?= "-${TCLIBC}"
 TMPDIR .= "${TCLIBCAPPEND}"
 
-CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE', True))][bool(d.getVar('MACHINE', True))]}${@['', '/' + str(d.getVar('SDKMACHINE', True))][bool(d.getVar('SDKMACHINE', True))]}"
+CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' + str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
 
 USER_CLASSES ?= ""
 PACKAGE_CLASSES ?= "package_ipk"
diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
index 649918f..ad8000f 100644
--- a/meta/conf/distro/include/tclibc-glibc.inc
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -2,7 +2,7 @@
 # glibc specific configuration
 #
 
-LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION', True) or '') != '']}"
+LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') != '']}"
 
 # Add glibc overrides to the overrides for glibc.
 LIBCOVERRIDE = ":libc-glibc"
@@ -34,7 +34,7 @@ LIBC_LOCALE_DEPENDENCIES = "\
 	glibc-gconv-iso8859-15"
 
 def get_libc_locales_dependencies(d):
-    if 'libc-locales' in (d.getVar('DISTRO_FEATURES', True) or '').split() :
-        return d.getVar('LIBC_LOCALE_DEPENDENCIES', True) or ''
+    if 'libc-locales' in (d.getVar('DISTRO_FEATURES') or '').split() :
+        return d.getVar('LIBC_LOCALE_DEPENDENCIES') or ''
     else:
         return ''
diff --git a/meta/conf/machine/include/arm/arch-arm.inc b/meta/conf/machine/include/arm/arch-arm.inc
index 2e3127c..99625d8 100644
--- a/meta/conf/machine/include/arm/arch-arm.inc
+++ b/meta/conf/machine/include/arm/arch-arm.inc
@@ -13,4 +13,4 @@ TUNE_PKGARCH = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}
 
 ABIEXTENSION = "eabi"
 
-TARGET_FPU = "${@d.getVar('TUNE_CCARGS_MFLOAT', True) or 'soft'}"
+TARGET_FPU = "${@d.getVar('TUNE_CCARGS_MFLOAT') or 'soft'}"
diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 9440698..1bc3039 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -28,7 +28,7 @@ TARGET_FPU_64 = ""
 TUNE_ARCH_32 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'armeb', 'arm', d)}"
 TUNE_PKGARCH_32 = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
 ABIEXTENSION_32 = "eabi"
-TARGET_FPU_32 = "${@d.getVar('TUNE_CCARGS_MFLOAT', True) or 'soft'}"
+TARGET_FPU_32 = "${@d.getVar('TUNE_CCARGS_MFLOAT') or 'soft'}"
 
 TUNE_ARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_ARCH_64}', '${TUNE_ARCH_32}' ,d)}"
 TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_PKGARCH_64}', '${TUNE_PKGARCH_32}' ,d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 1faebf7..6d4747b 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -1,5 +1,5 @@
 TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
-ARM_THUMB_OPT = "${@['arm', 'thumb'][d.getVar('ARM_INSTRUCTION_SET', True) == 'thumb']}"
+ARM_THUMB_OPT = "${@['arm', 'thumb'][d.getVar('ARM_INSTRUCTION_SET') == 'thumb']}"
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4',  't',  '', d)}"
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5',  't',  '', d)}"
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6',  't',  '', d)}"
@@ -15,19 +15,19 @@ ARM_M_OPT = "${@bb.utils.contains('TUNE_FEATURES', 'arm', '${ARM_THUMB_OPT}', 't
 python () {
     if bb.utils.contains('TUNE_FEATURES', 'thumb', False, True, d):
         return
-    selected = d.getVar('ARM_INSTRUCTION_SET', True)
+    selected = d.getVar('ARM_INSTRUCTION_SET')
     if selected == None:
         return
-    used = d.getVar('ARM_M_OPT', True)
+    used = d.getVar('ARM_M_OPT')
     if selected != used:
-        pn = d.getVar('PN', True)
+        pn = d.getVar('PN')
         bb.warn("Recipe '%s' selects ARM_INSTRUCTION_SET to be '%s', but tune configuration overrides it to '%s'" % (pn, selected, used))
 }
 
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}', '', d)}"
 
 # Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_M_OPT to thumb
-ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d) if d.getVar('ARM_M_OPT', True) == 'thumb' else ''}"
+ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d) if d.getVar('ARM_M_OPT') == 'thumb' else ''}"
 
 # what about armv7m devices which don't support -marm (e.g. Cortex-M3)?
 TARGET_CC_KERNEL_ARCH += "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '-mno-thumb-interwork -marm', '', d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index 9ef31e7..667b609 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -5,10 +5,10 @@
 TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
 TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' vfp', '', d)}"
 
-TUNE_CCARGS  .= "${@ (' -mfpu=%s ' % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
-ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1].replace('vfpv3-d16', 'vfpv3d16')) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
+TUNE_CCARGS  .= "${@ (' -mfpu=%s ' % d.getVar('TUNE_CCARGS_MFPU').split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU') != '') else ''}"
+ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU').split()[-1].replace('vfpv3-d16', 'vfpv3d16')) if (d.getVar('TUNE_CCARGS_MFPU') != '') else ''}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
-TUNE_CCARGS_MFLOAT = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else '' }"
-TUNE_CCARGS   .= "${@ ' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT', True) != '')     else ''}"
-ARMPKGSFX_EABI = "${@ 'hf'                                 if (d.getVar('TUNE_CCARGS_MFLOAT', True) == 'hard') else ''}"
+TUNE_CCARGS_MFLOAT = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU') != '') else '' }"
+TUNE_CCARGS   .= "${@ ' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '')     else ''}"
+ARMPKGSFX_EABI = "${@ 'hf'                                 if (d.getVar('TUNE_CCARGS_MFLOAT') == 'hard') else ''}"
diff --git a/meta/conf/machine/include/mips/feature-mips-mips16e.inc b/meta/conf/machine/include/mips/feature-mips-mips16e.inc
index 05011de..101d533 100644
--- a/meta/conf/machine/include/mips/feature-mips-mips16e.inc
+++ b/meta/conf/machine/include/mips/feature-mips-mips16e.inc
@@ -1,8 +1,8 @@
 TUNEVALID[mips16e] = "Build target packages with MIPS16e ASE instructions"
-MIPS_MIPS16E_OPT = "${@['mno-mips16', 'mips16'][d.getVar('MIPS_INSTRUCTION_SET', True) == 'mips16e']}"
+MIPS_MIPS16E_OPT = "${@['mno-mips16', 'mips16'][d.getVar('MIPS_INSTRUCTION_SET') == 'mips16e']}"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips16e', ' -${MIPS_MIPS16E_OPT}', '', d)}"
 
-MIPSPKGSFX_MIPS16E .= "${@bb.utils.contains('TUNE_FEATURES', 'mips16e', '-m16', '', d) if d.getVar('MIPS_MIPS16E_OPT', True) == 'mips16' else ''}"
+MIPSPKGSFX_MIPS16E .= "${@bb.utils.contains('TUNE_FEATURES', 'mips16e', '-m16', '', d) if d.getVar('MIPS_MIPS16E_OPT') == 'mips16' else ''}"
 
 # Whether to compile with code to allow interworking between the two
 # instruction sets. This allows mips16e code to be executed on a primarily
@@ -14,4 +14,4 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips16e', ' ${MIPS16_TUNE
 OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'mips16e', ':mips16e', '', d)}"
 
 # show status (if compiling in MIPS16e mode)
-BUILDCFG_VARS += "${@['', 'MIPS_INSTRUCTION_SET'][d.getVar('MIPS_INSTRUCTION_SET', True) == 'mips16e']}"
+BUILDCFG_VARS += "${@['', 'MIPS_INSTRUCTION_SET'][d.getVar('MIPS_INSTRUCTION_SET') == 'mips16e']}"
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 1403a03..ce97d5d 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -1,5 +1,5 @@
 
-baselib = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) or 'INVALID'), True) or d.getVar('BASELIB', True)}"
+baselib = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE') or 'INVALID'), True) or d.getVar('BASELIB')}"
 
 MULTILIB_VARIANTS = "${@extend_variants(d,'MULTILIBS','multilib')}"
 MULTILIB_SAVE_VARNAME = "DEFAULTTUNE TARGET_ARCH TARGET_SYS TARGET_VENDOR"
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 4c8a000..d2eeaf0 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -25,7 +25,7 @@ class ClassExtender(object):
         return name
 
     def map_variable(self, varname, setvar = True):
-        var = self.d.getVar(varname, True)
+        var = self.d.getVar(varname)
         if not var:
             return ""
         var = var.split()
@@ -38,7 +38,7 @@ class ClassExtender(object):
         return newdata
 
     def map_regexp_variable(self, varname, setvar = True):
-        var = self.d.getVar(varname, True)
+        var = self.d.getVar(varname)
         if not var:
             return ""
         var = var.split()
@@ -60,7 +60,7 @@ class ClassExtender(object):
             return dep
         else:
             # Do not extend for that already have multilib prefix
-            var = self.d.getVar("MULTILIB_VARIANTS", True)
+            var = self.d.getVar("MULTILIB_VARIANTS")
             if var:
                 var = var.split()
                 for v in var:
@@ -74,7 +74,7 @@ class ClassExtender(object):
             varname = varname + "_" + suffix
         orig = self.d.getVar("EXTENDPKGV", False)
         self.d.setVar("EXTENDPKGV", "EXTENDPKGV")
-        deps = self.d.getVar(varname, True)
+        deps = self.d.getVar(varname)
         if not deps:
             self.d.setVar("EXTENDPKGV", orig)
             return
@@ -87,7 +87,7 @@ class ClassExtender(object):
         self.d.setVar("EXTENDPKGV", orig)
 
     def map_packagevars(self):
-        for pkg in (self.d.getVar("PACKAGES", True).split() + [""]):
+        for pkg in (self.d.getVar("PACKAGES").split() + [""]):
             self.map_depends_variable("RDEPENDS", pkg)
             self.map_depends_variable("RRECOMMENDS", pkg)
             self.map_depends_variable("RSUGGESTS", pkg)
@@ -97,7 +97,7 @@ class ClassExtender(object):
             self.map_depends_variable("PKG", pkg)
 
     def rename_packages(self):
-        for pkg in (self.d.getVar("PACKAGES", True) or "").split():
+        for pkg in (self.d.getVar("PACKAGES") or "").split():
             if pkg.startswith(self.extname):
                self.pkgs_mapping.append([pkg.split(self.extname + "-")[1], pkg])
                continue
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 29ac6d4..a372904 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -21,8 +21,8 @@ class BuildSystem(object):
     def __init__(self, context, d):
         self.d = d
         self.context = context
-        self.layerdirs = [os.path.abspath(pth) for pth in d.getVar('BBLAYERS', True).split()]
-        self.layers_exclude = (d.getVar('SDK_LAYERS_EXCLUDE', True) or "").split()
+        self.layerdirs = [os.path.abspath(pth) for pth in d.getVar('BBLAYERS').split()]
+        self.layers_exclude = (d.getVar('SDK_LAYERS_EXCLUDE') or "").split()
 
     def copy_bitbake_and_layers(self, destdir, workspace_name=None):
         # Copy in all metadata layers + bitbake (as repositories)
@@ -30,7 +30,7 @@ class BuildSystem(object):
         bb.utils.mkdirhier(destdir)
         layers = list(self.layerdirs)
 
-        corebase = os.path.abspath(self.d.getVar('COREBASE', True))
+        corebase = os.path.abspath(self.d.getVar('COREBASE'))
         layers.append(corebase)
 
         # Exclude layers
@@ -46,7 +46,7 @@ class BuildSystem(object):
                 extranum += 1
                 workspace_newname = '%s-%d' % (workspace_name, extranum)
 
-        corebase_files = self.d.getVar('COREBASE_FILES', True).split()
+        corebase_files = self.d.getVar('COREBASE_FILES').split()
         corebase_files = [corebase + '/' +x for x in corebase_files]
         # Make sure bitbake goes in
         bitbake_dir = bb.__file__.rsplit('/', 3)[0]
@@ -100,7 +100,7 @@ class BuildSystem(object):
                 # Drop all bbappends except the one for the image the SDK is being built for
                 # (because of externalsrc, the workspace bbappends will interfere with the
                 # locked signatures if present, and we don't need them anyway)
-                image_bbappend = os.path.splitext(os.path.basename(self.d.getVar('FILE', True)))[0] + '.bbappend'
+                image_bbappend = os.path.splitext(os.path.basename(self.d.getVar('FILE')))[0] + '.bbappend'
                 appenddir = os.path.join(layerdestpath, 'appends')
                 if os.path.isdir(appenddir):
                     for fn in os.listdir(appenddir):
@@ -208,7 +208,7 @@ def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cac
     import shutil
     bb.note('Generating sstate-cache...')
 
-    nativelsbstring = d.getVar('NATIVELSBSTRING', True)
+    nativelsbstring = d.getVar('NATIVELSBSTRING')
     bb.process.run("gen-lockedsig-cache %s %s %s %s %s" % (lockedsigs, input_sstate_cache, output_sstate_cache, nativelsbstring, filterfile or ''))
     if fixedlsbstring and nativelsbstring != fixedlsbstring:
         nativedir = output_sstate_cache + '/' + nativelsbstring
diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index ee48950..032f68a 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -12,6 +12,6 @@ def typed_value(key, d):
         flags = {}
 
     try:
-        return oe.maketype.create(d.getVar(key, True) or '', var_type, **flags)
+        return oe.maketype.create(d.getVar(key) or '', var_type, **flags)
     except (TypeError, ValueError) as exc:
         bb.msg.fatal("Data", "%s: %s" % (key, str(exc)))
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index c666ddc..f54f4bb 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -224,37 +224,37 @@ def compare_in_distro_packages_list(distro_check_dir, d):
     localdata = bb.data.createCopy(d)
     pkglst_dir = os.path.join(distro_check_dir, "package_lists")
     matching_distros = []
-    pn = recipe_name = d.getVar('PN', True)
+    pn = recipe_name = d.getVar('PN')
     bb.note("Checking: %s" % pn)
 
     if pn.find("-native") != -1:
         pnstripped = pn.split("-native")
-        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
+        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
         bb.data.update_data(localdata)
         recipe_name = pnstripped[0]
 
     if pn.startswith("nativesdk-"):
         pnstripped = pn.split("nativesdk-")
-        localdata.setVar('OVERRIDES', "pn-" + pnstripped[1] + ":" + d.getVar('OVERRIDES', True))
+        localdata.setVar('OVERRIDES', "pn-" + pnstripped[1] + ":" + d.getVar('OVERRIDES'))
         bb.data.update_data(localdata)
         recipe_name = pnstripped[1]
 
     if pn.find("-cross") != -1:
         pnstripped = pn.split("-cross")
-        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
+        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
         bb.data.update_data(localdata)
         recipe_name = pnstripped[0]
 
     if pn.find("-initial") != -1:
         pnstripped = pn.split("-initial")
-        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
+        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
         bb.data.update_data(localdata)
         recipe_name = pnstripped[0]
 
     bb.note("Recipe: %s" % recipe_name)
 
     distro_exceptions = dict({"OE-Core":'OE-Core', "OpenedHand":'OpenedHand', "Intel":'Intel', "Upstream":'Upstream', "Windriver":'Windriver', "OSPDT":'OSPDT Approved', "Poky":'poky'})
-    tmp = localdata.getVar('DISTRO_PN_ALIAS', True) or ""
+    tmp = localdata.getVar('DISTRO_PN_ALIAS') or ""
     for str in tmp.split():
         if str and str.find("=") == -1 and distro_exceptions[str]:
             matching_distros.append(str)
@@ -286,10 +286,10 @@ def compare_in_distro_packages_list(distro_check_dir, d):
     return matching_distros
 
 def create_log_file(d, logname):
-    logpath = d.getVar('LOG_DIR', True)
+    logpath = d.getVar('LOG_DIR')
     bb.utils.mkdirhier(logpath)
     logfn, logsuffix = os.path.splitext(logname)
-    logfile = os.path.join(logpath, "%s.%s%s" % (logfn, d.getVar('DATETIME', True), logsuffix))
+    logfile = os.path.join(logpath, "%s.%s%s" % (logfn, d.getVar('DATETIME'), logsuffix))
     if not os.path.exists(logfile):
             slogfile = os.path.join(logpath, logname)
             if os.path.exists(slogfile):
@@ -301,8 +301,8 @@ def create_log_file(d, logname):
 
 
 def save_distro_check_result(result, datetime, result_file, d):
-    pn = d.getVar('PN', True)
-    logdir = d.getVar('LOG_DIR', True)
+    pn = d.getVar('PN')
+    logdir = d.getVar('LOG_DIR')
     if not logdir:
         bb.error("LOG_DIR variable is not defined, can't write the distro_check results")
         return
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 38eb0cb..dcd1990 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -7,9 +7,9 @@ import oe.utils
 class LocalSigner(object):
     """Class for handling local (on the build host) signing"""
     def __init__(self, d):
-        self.gpg_bin = d.getVar('GPG_BIN', True) or \
+        self.gpg_bin = d.getVar('GPG_BIN') or \
                   bb.utils.which(os.getenv('PATH'), 'gpg')
-        self.gpg_path = d.getVar('GPG_PATH', True)
+        self.gpg_path = d.getVar('GPG_PATH')
         self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpm")
 
     def export_pubkey(self, output_file, keyid, armor=True):
diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index 95f8eb2..6ec9b1a 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -59,9 +59,9 @@ class Manifest(object, metaclass=ABCMeta):
 
         if manifest_dir is None:
             if manifest_type != self.MANIFEST_TYPE_IMAGE:
-                self.manifest_dir = self.d.getVar('SDK_DIR', True)
+                self.manifest_dir = self.d.getVar('SDK_DIR')
             else:
-                self.manifest_dir = self.d.getVar('WORKDIR', True)
+                self.manifest_dir = self.d.getVar('WORKDIR')
         else:
             self.manifest_dir = manifest_dir
 
@@ -82,7 +82,7 @@ class Manifest(object, metaclass=ABCMeta):
     This will be used for testing until the class is implemented properly!
     """
     def _create_dummy_initial(self):
-        image_rootfs = self.d.getVar('IMAGE_ROOTFS', True)
+        image_rootfs = self.d.getVar('IMAGE_ROOTFS')
         pkg_list = dict()
         if image_rootfs.find("core-image-sato-sdk") > 0:
             pkg_list[self.PKG_TYPE_MUST_INSTALL] = \
@@ -195,7 +195,7 @@ class RpmManifest(Manifest):
         for pkg in pkg_list.split():
             pkg_type = self.PKG_TYPE_MUST_INSTALL
 
-            ml_variants = self.d.getVar('MULTILIB_VARIANTS', True).split()
+            ml_variants = self.d.getVar('MULTILIB_VARIANTS').split()
 
             for ml_variant in ml_variants:
                 if pkg.startswith(ml_variant + '-'):
@@ -216,13 +216,13 @@ class RpmManifest(Manifest):
 
             for var in self.var_maps[self.manifest_type]:
                 if var in self.vars_to_split:
-                    split_pkgs = self._split_multilib(self.d.getVar(var, True))
+                    split_pkgs = self._split_multilib(self.d.getVar(var))
                     if split_pkgs is not None:
                         pkgs = dict(list(pkgs.items()) + list(split_pkgs.items()))
                 else:
-                    pkg_list = self.d.getVar(var, True)
+                    pkg_list = self.d.getVar(var)
                     if pkg_list is not None:
-                        pkgs[self.var_maps[self.manifest_type][var]] = self.d.getVar(var, True)
+                        pkgs[self.var_maps[self.manifest_type][var]] = self.d.getVar(var)
 
             for pkg_type in pkgs:
                 for pkg in pkgs[pkg_type].split():
@@ -245,7 +245,7 @@ class OpkgManifest(Manifest):
         for pkg in pkg_list.split():
             pkg_type = self.PKG_TYPE_MUST_INSTALL
 
-            ml_variants = self.d.getVar('MULTILIB_VARIANTS', True).split()
+            ml_variants = self.d.getVar('MULTILIB_VARIANTS').split()
 
             for ml_variant in ml_variants:
                 if pkg.startswith(ml_variant + '-'):
@@ -266,13 +266,13 @@ class OpkgManifest(Manifest):
 
             for var in self.var_maps[self.manifest_type]:
                 if var in self.vars_to_split:
-                    split_pkgs = self._split_multilib(self.d.getVar(var, True))
+                    split_pkgs = self._split_multilib(self.d.getVar(var))
                     if split_pkgs is not None:
                         pkgs = dict(list(pkgs.items()) + list(split_pkgs.items()))
                 else:
-                    pkg_list = self.d.getVar(var, True)
+                    pkg_list = self.d.getVar(var)
                     if pkg_list is not None:
-                        pkgs[self.var_maps[self.manifest_type][var]] = self.d.getVar(var, True)
+                        pkgs[self.var_maps[self.manifest_type][var]] = self.d.getVar(var)
 
             for pkg_type in pkgs:
                 for pkg in pkgs[pkg_type].split():
@@ -310,7 +310,7 @@ class DpkgManifest(Manifest):
             manifest.write(self.initial_manifest_file_header)
 
             for var in self.var_maps[self.manifest_type]:
-                pkg_list = self.d.getVar(var, True)
+                pkg_list = self.d.getVar(var)
 
                 if pkg_list is None:
                     continue
@@ -332,7 +332,7 @@ def create_manifest(d, final_manifest=False, manifest_dir=None,
                     'ipk': OpkgManifest,
                     'deb': DpkgManifest}
 
-    manifest = manifest_map[d.getVar('IMAGE_PKGTYPE', True)](d, manifest_dir, manifest_type)
+    manifest = manifest_map[d.getVar('IMAGE_PKGTYPE')](d, manifest_dir, manifest_type)
 
     if final_manifest:
         manifest.create_final()
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 02642f2..6c719b0 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -103,7 +103,7 @@ def read_shlib_providers(d):
     import re
 
     shlib_provider = {}
-    shlibs_dirs = d.getVar('SHLIBSDIRS', True).split()
+    shlibs_dirs = d.getVar('SHLIBSDIRS').split()
     list_re = re.compile('^(.*)\.list$')
     # Go from least to most specific since the last one found wins
     for dir in reversed(shlibs_dirs):
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 7ba2e4d..02882fa 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -107,16 +107,16 @@ class RpmIndexer(Indexer):
         target_os = collections.OrderedDict()
 
         if arch_var is not None and os_var is not None:
-            package_archs['default'] = self.d.getVar(arch_var, True).split()
+            package_archs['default'] = self.d.getVar(arch_var).split()
             package_archs['default'].reverse()
-            target_os['default'] = self.d.getVar(os_var, True).strip()
+            target_os['default'] = self.d.getVar(os_var).strip()
         else:
-            package_archs['default'] = self.d.getVar("PACKAGE_ARCHS", True).split()
+            package_archs['default'] = self.d.getVar("PACKAGE_ARCHS").split()
             # arch order is reversed.  This ensures the -best- match is
             # listed first!
             package_archs['default'].reverse()
-            target_os['default'] = self.d.getVar("TARGET_OS", True).strip()
-            multilibs = self.d.getVar('MULTILIBS', True) or ""
+            target_os['default'] = self.d.getVar("TARGET_OS").strip()
+            multilibs = self.d.getVar('MULTILIBS') or ""
             for ext in multilibs.split():
                 eext = ext.split(':')
                 if len(eext) > 1 and eext[0] == 'multilib':
@@ -150,8 +150,8 @@ class RpmIndexer(Indexer):
         return (ml_prefix_list, target_os)
 
     def write_index(self):
-        sdk_pkg_archs = (self.d.getVar('SDK_PACKAGE_ARCHS', True) or "").replace('-', '_').split()
-        all_mlb_pkg_archs = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").replace('-', '_').split()
+        sdk_pkg_archs = (self.d.getVar('SDK_PACKAGE_ARCHS') or "").replace('-', '_').split()
+        all_mlb_pkg_archs = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS') or "").replace('-', '_').split()
 
         mlb_prefix_list = self.get_ml_prefix_and_os_list()[0]
 
@@ -165,15 +165,15 @@ class RpmIndexer(Indexer):
         archs = archs.union(set(sdk_pkg_archs))
 
         rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
-        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
-            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND', True))
+        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
+            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
         else:
             signer = None
         index_cmds = []
         repomd_files = []
         rpm_dirs_found = False
         for arch in archs:
-            dbpath = os.path.join(self.d.getVar('WORKDIR', True), 'rpmdb', arch)
+            dbpath = os.path.join(self.d.getVar('WORKDIR'), 'rpmdb', arch)
             if os.path.exists(dbpath):
                 bb.utils.remove(dbpath, True)
             arch_dir = os.path.join(self.deploy_dir, arch)
@@ -197,11 +197,11 @@ class RpmIndexer(Indexer):
         # Sign repomd
         if signer:
             for repomd in repomd_files:
-                feed_sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE', True)
+                feed_sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE')
                 is_ascii_sig = (feed_sig_type.upper() != "BIN")
                 signer.detach_sign(repomd,
-                                   self.d.getVar('PACKAGE_FEED_GPG_NAME', True),
-                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True),
+                                   self.d.getVar('PACKAGE_FEED_GPG_NAME'),
+                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
                                    armor=is_ascii_sig)
 
 
@@ -212,8 +212,8 @@ class OpkgIndexer(Indexer):
                      "MULTILIB_ARCHS"]
 
         opkg_index_cmd = bb.utils.which(os.getenv('PATH'), "opkg-make-index")
-        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
-            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND', True))
+        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
+            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
         else:
             signer = None
 
@@ -223,7 +223,7 @@ class OpkgIndexer(Indexer):
         index_cmds = set()
         index_sign_files = set()
         for arch_var in arch_vars:
-            archs = self.d.getVar(arch_var, True)
+            archs = self.d.getVar(arch_var)
             if archs is None:
                 continue
 
@@ -251,12 +251,12 @@ class OpkgIndexer(Indexer):
             bb.fatal('%s' % ('\n'.join(result)))
 
         if signer:
-            feed_sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE', True)
+            feed_sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE')
             is_ascii_sig = (feed_sig_type.upper() != "BIN")
             for f in index_sign_files:
                 signer.detach_sign(f,
-                                   self.d.getVar('PACKAGE_FEED_GPG_NAME', True),
-                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True),
+                                   self.d.getVar('PACKAGE_FEED_GPG_NAME'),
+                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
                                    armor=is_ascii_sig)
 
 
@@ -290,16 +290,16 @@ class DpkgIndexer(Indexer):
 
         os.environ['APT_CONFIG'] = self.apt_conf_file
 
-        pkg_archs = self.d.getVar('PACKAGE_ARCHS', True)
+        pkg_archs = self.d.getVar('PACKAGE_ARCHS')
         if pkg_archs is not None:
             arch_list = pkg_archs.split()
-        sdk_pkg_archs = self.d.getVar('SDK_PACKAGE_ARCHS', True)
+        sdk_pkg_archs = self.d.getVar('SDK_PACKAGE_ARCHS')
         if sdk_pkg_archs is not None:
             for a in sdk_pkg_archs.split():
                 if a not in pkg_archs:
                     arch_list.append(a)
 
-        all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").split()
+        all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS') or "").split()
         arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in arch_list)
 
         apt_ftparchive = bb.utils.which(os.getenv('PATH'), "apt-ftparchive")
@@ -332,7 +332,7 @@ class DpkgIndexer(Indexer):
         result = oe.utils.multiprocess_exec(index_cmds, create_index)
         if result:
             bb.fatal('%s' % ('\n'.join(result)))
-        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
+        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
             raise NotImplementedError('Package feed signing not implementd for dpkg')
 
 
@@ -387,7 +387,7 @@ class RpmPkgsList(PkgsList):
 
                     # Workaround for bug 3565. Simply look to see if we
                     # know of a package with that name, if not try again!
-                    filename = os.path.join(self.d.getVar('PKGDATA_DIR', True),
+                    filename = os.path.join(self.d.getVar('PKGDATA_DIR'),
                                             'runtime-reverse',
                                             new_pkg)
                     if os.path.exists(filename):
@@ -466,7 +466,7 @@ class OpkgPkgsList(PkgsList):
 
         self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
         self.opkg_args = "-f %s -o %s " % (config_file, rootfs_dir)
-        self.opkg_args += self.d.getVar("OPKG_ARGS", True)
+        self.opkg_args += self.d.getVar("OPKG_ARGS")
 
     def list_pkgs(self, format=None):
         cmd = "%s %s status" % (self.opkg_cmd, self.opkg_args)
@@ -514,9 +514,9 @@ class PackageManager(object, metaclass=ABCMeta):
         self.d = d
         self.deploy_dir = None
         self.deploy_lock = None
-        self.feed_uris = self.d.getVar('PACKAGE_FEED_URIS', True) or ""
-        self.feed_base_paths = self.d.getVar('PACKAGE_FEED_BASE_PATHS', True) or ""
-        self.feed_archs = self.d.getVar('PACKAGE_FEED_ARCHS', True)
+        self.feed_uris = self.d.getVar('PACKAGE_FEED_URIS') or ""
+        self.feed_base_paths = self.d.getVar('PACKAGE_FEED_BASE_PATHS') or ""
+        self.feed_archs = self.d.getVar('PACKAGE_FEED_ARCHS')
 
     """
     Update the package manager package database.
@@ -570,7 +570,7 @@ class PackageManager(object, metaclass=ABCMeta):
     def install_complementary(self, globs=None):
         # we need to write the list of installed packages to a file because the
         # oe-pkgdata-util reads it from a file
-        installed_pkgs_file = os.path.join(self.d.getVar('WORKDIR', True),
+        installed_pkgs_file = os.path.join(self.d.getVar('WORKDIR'),
                                            "installed_pkgs.txt")
         with open(installed_pkgs_file, "w+") as installed_pkgs:
             pkgs = self.list_installed()
@@ -578,10 +578,10 @@ class PackageManager(object, metaclass=ABCMeta):
             installed_pkgs.write(output)
 
         if globs is None:
-            globs = self.d.getVar('IMAGE_INSTALL_COMPLEMENTARY', True)
+            globs = self.d.getVar('IMAGE_INSTALL_COMPLEMENTARY')
             split_linguas = set()
 
-            for translation in self.d.getVar('IMAGE_LINGUAS', True).split():
+            for translation in self.d.getVar('IMAGE_LINGUAS').split():
                 split_linguas.add(translation)
                 split_linguas.add(translation.split('-')[0])
 
@@ -594,9 +594,9 @@ class PackageManager(object, metaclass=ABCMeta):
             return
 
         cmd = [bb.utils.which(os.getenv('PATH'), "oe-pkgdata-util"),
-               "-p", self.d.getVar('PKGDATA_DIR', True), "glob", installed_pkgs_file,
+               "-p", self.d.getVar('PKGDATA_DIR'), "glob", installed_pkgs_file,
                globs]
-        exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY', True)
+        exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY')
         if exclude:
             cmd.extend(['--exclude=' + '|'.join(exclude.split())])
         try:
@@ -661,7 +661,7 @@ class RpmPM(PackageManager):
         self.task_name = task_name
         self.providename = providename
         self.fullpkglist = list()
-        self.deploy_dir = self.d.getVar('DEPLOY_DIR_RPM', True)
+        self.deploy_dir = self.d.getVar('DEPLOY_DIR_RPM')
         self.etcrpm_dir = os.path.join(self.target_rootfs, "etc/rpm")
         self.install_dir_name = "oe_install"
         self.install_dir_path = os.path.join(self.target_rootfs, self.install_dir_name)
@@ -671,7 +671,7 @@ class RpmPM(PackageManager):
         # 1 = --log-level=info (includes information about executing scriptlets and their output)
         # 2 = --log-level=debug
         # 3 = --log-level=debug plus dumps of scriplet content and command invocation
-        self.debug_level = int(d.getVar('ROOTFS_RPM_DEBUG', True) or "0")
+        self.debug_level = int(d.getVar('ROOTFS_RPM_DEBUG') or "0")
         self.smart_opt = "--log-level=%s --data-dir=%s" % \
                          ("warning" if self.debug_level == 0 else
                           "info" if self.debug_level == 1 else
@@ -686,7 +686,7 @@ class RpmPM(PackageManager):
         if not os.path.exists(self.d.expand('${T}/saved')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved'))
 
-        packageindex_dir = os.path.join(self.d.getVar('WORKDIR', True), 'rpms')
+        packageindex_dir = os.path.join(self.d.getVar('WORKDIR'), 'rpms')
         self.indexer = RpmIndexer(self.d, packageindex_dir)
         self.pkgs_list = RpmPkgsList(self.d, self.target_rootfs, arch_var, os_var)
 
@@ -704,7 +704,7 @@ class RpmPM(PackageManager):
             # List must be prefered to least preferred order
             default_platform_extra = list()
             platform_extra = list()
-            bbextendvariant = self.d.getVar('BBEXTENDVARIANT', True) or ""
+            bbextendvariant = self.d.getVar('BBEXTENDVARIANT') or ""
             for mlib in self.ml_os_list:
                 for arch in self.ml_prefix_list[mlib]:
                     plt = arch.replace('-', '_') + '-.*-' + self.ml_os_list[mlib]
@@ -752,7 +752,7 @@ class RpmPM(PackageManager):
     Create configs for rpm and smart, and multilib is supported
     '''
     def create_configs(self):
-        target_arch = self.d.getVar('TARGET_ARCH', True)
+        target_arch = self.d.getVar('TARGET_ARCH')
         platform = '%s%s-%s' % (target_arch.replace('-', '_'),
                                 self.target_vendor,
                                 self.ml_os_list['default'])
@@ -760,7 +760,7 @@ class RpmPM(PackageManager):
         # List must be prefered to least preferred order
         default_platform_extra = list()
         platform_extra = list()
-        bbextendvariant = self.d.getVar('BBEXTENDVARIANT', True) or ""
+        bbextendvariant = self.d.getVar('BBEXTENDVARIANT') or ""
         for mlib in self.ml_os_list:
             for arch in self.ml_prefix_list[mlib]:
                 plt = arch.replace('-', '_') + '-.*-' + self.ml_os_list[mlib]
@@ -840,7 +840,7 @@ class RpmPM(PackageManager):
                     if not new_pkg:
                         # Failed to translate, package not found!
                         err_msg = '%s not found in the %s feeds (%s) in %s.' % \
-                                  (pkg, mlib, " ".join(feed_archs), self.d.getVar('DEPLOY_DIR_RPM', True))
+                                  (pkg, mlib, " ".join(feed_archs), self.d.getVar('DEPLOY_DIR_RPM'))
                         if not attempt_only:
                             bb.error(err_msg)
                             bb.fatal("This is often caused by an empty package declared " \
@@ -859,7 +859,7 @@ class RpmPM(PackageManager):
                 new_pkg = self._search_pkg_name_in_feeds(pkg, default_archs)
                 if not new_pkg:
                     err_msg = '%s not found in the feeds (%s) in %s.' % \
-                                  (pkg, " ".join(default_archs), self.d.getVar('DEPLOY_DIR_RPM', True))
+                                  (pkg, " ".join(default_archs), self.d.getVar('DEPLOY_DIR_RPM'))
                     if not attempt_only:
                         bb.error(err_msg)
                         bb.fatal("This is often caused by an empty package declared " \
@@ -886,7 +886,7 @@ class RpmPM(PackageManager):
 
         channel_priority = 5
         platform_dir = os.path.join(self.etcrpm_dir, "platform")
-        sdkos = self.d.getVar("SDK_OS", True)
+        sdkos = self.d.getVar("SDK_OS")
         with open(platform_dir, "w+") as platform_fd:
             platform_fd.write(platform + '\n')
             for pt in platform_extra:
@@ -958,8 +958,8 @@ class RpmPM(PackageManager):
             bb.fatal("Create rpm database failed. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
         # Import GPG key to RPM database of the target system
-        if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
-            pubkey_path = self.d.getVar('RPM_GPG_PUBKEY', True)
+        if self.d.getVar('RPM_SIGN_PACKAGES') == '1':
+            pubkey_path = self.d.getVar('RPM_GPG_PUBKEY')
             cmd = "%s --root %s --dbpath /var/lib/rpm --import %s > /dev/null" % (
                   self.rpm_cmd, self.target_rootfs, pubkey_path)
             subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
@@ -971,10 +971,10 @@ class RpmPM(PackageManager):
         self._invoke_smart('config --set rpm-root=%s' % self.target_rootfs)
         self._invoke_smart('config --set rpm-dbpath=/var/lib/rpm')
         self._invoke_smart('config --set rpm-extra-macros._var=%s' %
-                           self.d.getVar('localstatedir', True))
+                           self.d.getVar('localstatedir'))
         cmd = "config --set rpm-extra-macros._tmppath=/%s/tmp" % (self.install_dir_name)
 
-        prefer_color = self.d.getVar('RPM_PREFER_ELF_ARCH', True)
+        prefer_color = self.d.getVar('RPM_PREFER_ELF_ARCH')
         if prefer_color:
             if prefer_color not in ['0', '1', '2', '4']:
                 bb.fatal("Invalid RPM_PREFER_ELF_ARCH: %s, it should be one of:\n"
@@ -982,7 +982,7 @@ class RpmPM(PackageManager):
                         "\t2: ELF64 wins\n"
                         "\t4: ELF64 N32 wins (mips64 or mips64el only)" %
                         prefer_color)
-            if prefer_color == "4" and self.d.getVar("TUNE_ARCH", True) not in \
+            if prefer_color == "4" and self.d.getVar("TUNE_ARCH") not in \
                                     ['mips64', 'mips64el']:
                 bb.fatal("RPM_PREFER_ELF_ARCH = \"4\" is for mips64 or mips64el "
                          "only.")
@@ -995,17 +995,17 @@ class RpmPM(PackageManager):
         # Write common configuration for host and target usage
         self._invoke_smart('config --set rpm-nolinktos=1')
         self._invoke_smart('config --set rpm-noparentdirs=1')
-        check_signature = self.d.getVar('RPM_CHECK_SIGNATURES', True)
+        check_signature = self.d.getVar('RPM_CHECK_SIGNATURES')
         if check_signature and check_signature.strip() == "0":
             self._invoke_smart('config --set rpm-check-signatures=false')
-        for i in self.d.getVar('BAD_RECOMMENDATIONS', True).split():
+        for i in self.d.getVar('BAD_RECOMMENDATIONS').split():
             self._invoke_smart('flag --set ignore-recommends %s' % i)
 
         # Do the following configurations here, to avoid them being
         # saved for field upgrade
-        if self.d.getVar('NO_RECOMMENDATIONS', True).strip() == "1":
+        if self.d.getVar('NO_RECOMMENDATIONS').strip() == "1":
             self._invoke_smart('config --set ignore-all-recommends=1')
-        pkg_exclude = self.d.getVar('PACKAGE_EXCLUDE', True) or ""
+        pkg_exclude = self.d.getVar('PACKAGE_EXCLUDE') or ""
         for i in pkg_exclude.split():
             self._invoke_smart('flag --set exclude-packages %s' % i)
 
@@ -1016,13 +1016,13 @@ class RpmPM(PackageManager):
         ch_already_added = []
         for canonical_arch in platform_extra:
             arch = canonical_arch.split('-')[0]
-            arch_channel = os.path.join(self.d.getVar('WORKDIR', True), 'rpms', arch)
+            arch_channel = os.path.join(self.d.getVar('WORKDIR'), 'rpms', arch)
             oe.path.remove(arch_channel)
             deploy_arch_dir = os.path.join(self.deploy_dir, arch)
             if not os.path.exists(deploy_arch_dir):
                     continue
 
-            lockfilename = self.d.getVar('DEPLOY_DIR_RPM', True) + "/rpm.lock"
+            lockfilename = self.d.getVar('DEPLOY_DIR_RPM') + "/rpm.lock"
             lf = bb.utils.lockfile(lockfilename, False)
             oe.path.copyhardlinktree(deploy_arch_dir, arch_channel)
             bb.utils.unlockfile(lf)
@@ -1093,7 +1093,7 @@ class RpmPM(PackageManager):
             "fi\n"
 
         intercept_dir = self.d.expand('${WORKDIR}/intercept_scripts')
-        native_root = self.d.getVar('STAGING_DIR_NATIVE', True)
+        native_root = self.d.getVar('STAGING_DIR_NATIVE')
         scriptlet_content = SCRIPTLET_FORMAT % (os.environ['PATH'],
                                                 self.target_rootfs,
                                                 intercept_dir,
@@ -1167,7 +1167,7 @@ class RpmPM(PackageManager):
             ml_pkgs = []
             non_ml_pkgs = pkgs[:]
             for pkg in pkgs:
-                for mlib in (self.d.getVar("MULTILIB_VARIANTS", True) or "").split():
+                for mlib in (self.d.getVar("MULTILIB_VARIANTS") or "").split():
                     if pkg.startswith(mlib + '-'):
                         ml_pkgs.append(pkg)
                         non_ml_pkgs.remove(pkg)
@@ -1181,7 +1181,7 @@ class RpmPM(PackageManager):
                 # correctly.
                 pkgs_new = []
                 for pkg in non_ml_pkgs:
-                    for mlib in (self.d.getVar("MULTILIB_VARIANTS", True) or "").split():
+                    for mlib in (self.d.getVar("MULTILIB_VARIANTS") or "").split():
                         mlib_pkg = mlib + "-" + pkg
                         if mlib_pkg in ml_pkgs:
                             pkgs_new.append(pkg)
@@ -1406,7 +1406,7 @@ class RpmPM(PackageManager):
 
         self._invoke_smart('config --set rpm-nolinktos=1')
         self._invoke_smart('config --set rpm-noparentdirs=1')
-        for i in self.d.getVar('BAD_RECOMMENDATIONS', True).split():
+        for i in self.d.getVar('BAD_RECOMMENDATIONS').split():
             self._invoke_smart('flag --set ignore-recommends %s' % i)
         self._invoke_smart('channel --add rpmsys type=rpm-sys -y')
 
@@ -1580,13 +1580,13 @@ class OpkgPM(OpkgDpkgPM):
         self.pkg_archs = archs
         self.task_name = task_name
 
-        self.deploy_dir = self.d.getVar("DEPLOY_DIR_IPK", True)
+        self.deploy_dir = self.d.getVar("DEPLOY_DIR_IPK")
         self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
         self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
         self.opkg_args = "--volatile-cache -f %s -t %s -o %s " % (self.config_file, self.d.expand('${T}/ipktemp/') ,target_rootfs)
-        self.opkg_args += self.d.getVar("OPKG_ARGS", True)
+        self.opkg_args += self.d.getVar("OPKG_ARGS")
 
-        opkg_lib_dir = self.d.getVar('OPKGLIBDIR', True)
+        opkg_lib_dir = self.d.getVar('OPKGLIBDIR')
         if opkg_lib_dir[0] == "/":
             opkg_lib_dir = opkg_lib_dir[1:]
 
@@ -1598,7 +1598,7 @@ class OpkgPM(OpkgDpkgPM):
         if not os.path.exists(self.d.expand('${T}/saved')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved'))
 
-        self.from_feeds = (self.d.getVar('BUILD_IMAGES_FROM_FEEDS', True) or "") == "1"
+        self.from_feeds = (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or "") == "1"
         if self.from_feeds:
             self._create_custom_config()
         else:
@@ -1643,7 +1643,7 @@ class OpkgPM(OpkgDpkgPM):
                 config_file.write("arch %s %d\n" % (arch, priority))
                 priority += 5
 
-            for line in (self.d.getVar('IPK_FEED_URIS', True) or "").split():
+            for line in (self.d.getVar('IPK_FEED_URIS') or "").split():
                 feed_match = re.match("^[ \t]*(.*)##([^ \t]*)[ \t]*$", line)
 
                 if feed_match is not None:
@@ -1660,17 +1660,17 @@ class OpkgPM(OpkgDpkgPM):
             specified as compatible for the current machine.
             NOTE: Development-helper feature, NOT a full-fledged feed.
             """
-            if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI', True) or "") != "":
+            if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI') or "") != "":
                 for arch in self.pkg_archs.split():
                     cfg_file_name = os.path.join(self.target_rootfs,
-                                                 self.d.getVar("sysconfdir", True),
+                                                 self.d.getVar("sysconfdir"),
                                                  "opkg",
                                                  "local-%s-feed.conf" % arch)
 
                     with open(cfg_file_name, "w+") as cfg_file:
                         cfg_file.write("src/gz local-%s %s/%s" %
                                        (arch,
-                                        self.d.getVar('FEED_DEPLOYDIR_BASE_URI', True),
+                                        self.d.getVar('FEED_DEPLOYDIR_BASE_URI'),
                                         arch))
 
                         if self.opkg_dir != '/var/lib/opkg':
@@ -1679,8 +1679,8 @@ class OpkgPM(OpkgDpkgPM):
                             # the default value of "/var/lib" as defined in opkg:
                             # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
                             # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
-                            cfg_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
-                            cfg_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
+                            cfg_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'info'))
+                            cfg_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'status'))
 
 
     def _create_config(self):
@@ -1704,8 +1704,8 @@ class OpkgPM(OpkgDpkgPM):
                 # the default value of "/var/lib" as defined in opkg:
                 # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
                 # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
-                config_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
-                config_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
+                config_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'info'))
+                config_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'status'))
 
     def insert_feeds_uris(self):
         if self.feed_uris == "":
@@ -1760,9 +1760,9 @@ class OpkgPM(OpkgDpkgPM):
         os.environ['OFFLINE_ROOT'] = self.target_rootfs
         os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
         os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['INTERCEPT_DIR'] = os.path.join(self.d.getVar('WORKDIR', True),
+        os.environ['INTERCEPT_DIR'] = os.path.join(self.d.getVar('WORKDIR'),
                                                    "intercept_scripts")
-        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE', True)
+        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
 
         try:
             bb.note("Installing the following packages: %s" % ' '.join(pkgs))
@@ -1813,7 +1813,7 @@ class OpkgPM(OpkgDpkgPM):
         return OpkgPkgsList(self.d, self.target_rootfs, self.config_file).list_pkgs()
 
     def handle_bad_recommendations(self):
-        bad_recommendations = self.d.getVar("BAD_RECOMMENDATIONS", True) or ""
+        bad_recommendations = self.d.getVar("BAD_RECOMMENDATIONS") or ""
         if bad_recommendations.strip() == "":
             return
 
@@ -1864,7 +1864,7 @@ class OpkgPM(OpkgDpkgPM):
         bb.utils.mkdirhier(temp_opkg_dir)
 
         opkg_args = "-f %s -o %s " % (self.config_file, temp_rootfs)
-        opkg_args += self.d.getVar("OPKG_ARGS", True)
+        opkg_args += self.d.getVar("OPKG_ARGS")
 
         cmd = "%s %s update" % (self.opkg_cmd, opkg_args)
         try:
@@ -1940,7 +1940,7 @@ class DpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None):
         super(DpkgPM, self).__init__(d)
         self.target_rootfs = target_rootfs
-        self.deploy_dir = self.d.getVar('DEPLOY_DIR_DEB', True)
+        self.deploy_dir = self.d.getVar('DEPLOY_DIR_DEB')
         if apt_conf_dir is None:
             self.apt_conf_dir = self.d.expand("${APTCONF_TARGET}/apt")
         else:
@@ -1949,10 +1949,10 @@ class DpkgPM(OpkgDpkgPM):
         self.apt_get_cmd = bb.utils.which(os.getenv('PATH'), "apt-get")
         self.apt_cache_cmd = bb.utils.which(os.getenv('PATH'), "apt-cache")
 
-        self.apt_args = d.getVar("APT_ARGS", True)
+        self.apt_args = d.getVar("APT_ARGS")
 
         self.all_arch_list = archs.split()
-        all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").split()
+        all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS') or "").split()
         self.all_arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in self.all_arch_list)
 
         self._create_configs(archs, base_archs)
@@ -2013,9 +2013,9 @@ class DpkgPM(OpkgDpkgPM):
         os.environ['OFFLINE_ROOT'] = self.target_rootfs
         os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
         os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['INTERCEPT_DIR'] = os.path.join(self.d.getVar('WORKDIR', True),
+        os.environ['INTERCEPT_DIR'] = os.path.join(self.d.getVar('WORKDIR'),
                                                    "intercept_scripts")
-        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE', True)
+        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
 
         failed_pkgs = []
         for pkg_name in installed_pkgs:
@@ -2166,7 +2166,7 @@ class DpkgPM(OpkgDpkgPM):
 
                 priority += 5
 
-            pkg_exclude = self.d.getVar('PACKAGE_EXCLUDE', True) or ""
+            pkg_exclude = self.d.getVar('PACKAGE_EXCLUDE') or ""
             for pkg in pkg_exclude.split():
                 prefs_file.write(
                     "Package: %s\n"
@@ -2181,14 +2181,14 @@ class DpkgPM(OpkgDpkgPM):
                                    os.path.join(self.deploy_dir, arch))
 
         base_arch_list = base_archs.split()
-        multilib_variants = self.d.getVar("MULTILIB_VARIANTS", True);
+        multilib_variants = self.d.getVar("MULTILIB_VARIANTS");
         for variant in multilib_variants.split():
             localdata = bb.data.createCopy(self.d)
             variant_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + variant, False)
-            orig_arch = localdata.getVar("DPKG_ARCH", True)
+            orig_arch = localdata.getVar("DPKG_ARCH")
             localdata.setVar("DEFAULTTUNE", variant_tune)
             bb.data.update_data(localdata)
-            variant_arch = localdata.getVar("DPKG_ARCH", True)
+            variant_arch = localdata.getVar("DPKG_ARCH")
             if variant_arch not in base_arch_list:
                 base_arch_list.append(variant_arch)
 
@@ -2219,7 +2219,7 @@ class DpkgPM(OpkgDpkgPM):
 
     def remove_packaging_data(self):
         bb.utils.remove(os.path.join(self.target_rootfs,
-                                     self.d.getVar('opkglibdir', True)), True)
+                                     self.d.getVar('opkglibdir')), True)
         bb.utils.remove(self.target_rootfs + "/var/lib/dpkg/", True)
 
     def fix_broken_dependencies(self):
@@ -2267,12 +2267,12 @@ class DpkgPM(OpkgDpkgPM):
         return tmp_dir
 
 def generate_index_files(d):
-    classes = d.getVar('PACKAGE_CLASSES', True).replace("package_", "").split()
+    classes = d.getVar('PACKAGE_CLASSES').replace("package_", "").split()
 
     indexer_map = {
-        "rpm": (RpmIndexer, d.getVar('DEPLOY_DIR_RPM', True)),
-        "ipk": (OpkgIndexer, d.getVar('DEPLOY_DIR_IPK', True)),
-        "deb": (DpkgIndexer, d.getVar('DEPLOY_DIR_DEB', True))
+        "rpm": (RpmIndexer, d.getVar('DEPLOY_DIR_RPM')),
+        "ipk": (OpkgIndexer, d.getVar('DEPLOY_DIR_IPK')),
+        "deb": (DpkgIndexer, d.getVar('DEPLOY_DIR_DEB'))
     }
 
     result = None
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 21d4de9..32e5c82 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -57,7 +57,7 @@ def read_subpkgdata_dict(pkg, d):
 def _pkgmap(d):
     """Return a dictionary mapping package to recipe name."""
 
-    pkgdatadir = d.getVar("PKGDATA_DIR", True)
+    pkgdatadir = d.getVar("PKGDATA_DIR")
 
     pkgmap = {}
     try:
diff --git a/meta/lib/oe/packagegroup.py b/meta/lib/oe/packagegroup.py
index 9781927..d68e5d3 100644
--- a/meta/lib/oe/packagegroup.py
+++ b/meta/lib/oe/packagegroup.py
@@ -1,7 +1,7 @@
 import itertools
 
 def is_optional(feature, d):
-    packages = d.getVar("FEATURE_PACKAGES_%s" % feature, True)
+    packages = d.getVar("FEATURE_PACKAGES_%s" % feature)
     if packages:
         return bool(d.getVarFlag("FEATURE_PACKAGES_%s" % feature, "optional", True))
     else:
@@ -9,9 +9,9 @@ def is_optional(feature, d):
 
 def packages(features, d):
     for feature in features:
-        packages = d.getVar("FEATURE_PACKAGES_%s" % feature, True)
+        packages = d.getVar("FEATURE_PACKAGES_%s" % feature)
         if not packages:
-            packages = d.getVar("PACKAGE_GROUP_%s" % feature, True)
+            packages = d.getVar("PACKAGE_GROUP_%s" % feature)
         for pkg in (packages or "").split():
             yield pkg
 
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index dbefd28..0f9e728 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -281,8 +281,8 @@ class GitApplyTree(PatchTree):
 
     def __init__(self, dir, d):
         PatchTree.__init__(self, dir, d)
-        self.commituser = d.getVar('PATCH_GIT_USER_NAME', True)
-        self.commitemail = d.getVar('PATCH_GIT_USER_EMAIL', True)
+        self.commituser = d.getVar('PATCH_GIT_USER_NAME')
+        self.commitemail = d.getVar('PATCH_GIT_USER_EMAIL')
 
     @staticmethod
     def extractPatchHeader(patchfile):
@@ -371,8 +371,8 @@ class GitApplyTree(PatchTree):
     @staticmethod
     def gitCommandUserOptions(cmd, commituser=None, commitemail=None, d=None):
         if d:
-            commituser = d.getVar('PATCH_GIT_USER_NAME', True)
-            commitemail = d.getVar('PATCH_GIT_USER_EMAIL', True)
+            commituser = d.getVar('PATCH_GIT_USER_NAME')
+            commitemail = d.getVar('PATCH_GIT_USER_EMAIL')
         if commituser:
             cmd += ['-c', 'user.name="%s"' % commituser]
         if commitemail:
@@ -551,7 +551,7 @@ class GitApplyTree(PatchTree):
 
 class QuiltTree(PatchSet):
     def _runcmd(self, args, run = True):
-        quiltrc = self.d.getVar('QUILTRCFILE', True)
+        quiltrc = self.d.getVar('QUILTRCFILE')
         if not run:
             return ["quilt"] + ["--quiltrc"] + [quiltrc] + args
         runcmd(["quilt"] + ["--quiltrc"] + [quiltrc] + args, self.dir)
@@ -727,7 +727,7 @@ class UserResolver(Resolver):
             # Patch application failed
             patchcmd = self.patchset.Push(True, False, False)
 
-            t = self.patchset.d.getVar('T', True)
+            t = self.patchset.d.getVar('T')
             if not t:
                 bb.msg.fatal("Build", "T not set")
             bb.utils.mkdirhier(t)
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index f73fd4a..804ecd5 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -52,7 +52,7 @@ def make_relative_symlink(path):
 
 def format_display(path, metadata):
     """ Prepare a path for display to the user. """
-    rel = relative(metadata.getVar("TOPDIR", True), path)
+    rel = relative(metadata.getVar("TOPDIR"), path)
     if len(rel) > len(path):
         return path
     else:
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index 0054f95..32dfc15 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -1,7 +1,7 @@
 
 def prserv_make_conn(d, check = False):
     import prserv.serv
-    host_params = list([_f for _f in (d.getVar("PRSERV_HOST", True) or '').split(':') if _f])
+    host_params = list([_f for _f in (d.getVar("PRSERV_HOST") or '').split(':') if _f])
     try:
         conn = None
         conn = prserv.serv.PRServerConnection(host_params[0], int(host_params[1]))
@@ -15,11 +15,11 @@ def prserv_make_conn(d, check = False):
     return conn
 
 def prserv_dump_db(d):
-    if not d.getVar('PRSERV_HOST', True):
+    if not d.getVar('PRSERV_HOST'):
         bb.error("Not using network based PR service")
         return None
 
-    conn = d.getVar("__PRSERV_CONN", True)
+    conn = d.getVar("__PRSERV_CONN")
     if conn is None:
         conn = prserv_make_conn(d)
         if conn is None:
@@ -27,18 +27,18 @@ def prserv_dump_db(d):
             return None
 
     #dump db
-    opt_version = d.getVar('PRSERV_DUMPOPT_VERSION', True)
-    opt_pkgarch = d.getVar('PRSERV_DUMPOPT_PKGARCH', True)
-    opt_checksum = d.getVar('PRSERV_DUMPOPT_CHECKSUM', True)
-    opt_col = ("1" == d.getVar('PRSERV_DUMPOPT_COL', True))
+    opt_version = d.getVar('PRSERV_DUMPOPT_VERSION')
+    opt_pkgarch = d.getVar('PRSERV_DUMPOPT_PKGARCH')
+    opt_checksum = d.getVar('PRSERV_DUMPOPT_CHECKSUM')
+    opt_col = ("1" == d.getVar('PRSERV_DUMPOPT_COL'))
     return conn.export(opt_version, opt_pkgarch, opt_checksum, opt_col)
 
 def prserv_import_db(d, filter_version=None, filter_pkgarch=None, filter_checksum=None):
-    if not d.getVar('PRSERV_HOST', True):
+    if not d.getVar('PRSERV_HOST'):
         bb.error("Not using network based PR service")
         return None
 
-    conn = d.getVar("__PRSERV_CONN", True)
+    conn = d.getVar("__PRSERV_CONN")
     if conn is None:
         conn = prserv_make_conn(d)
         if conn is None:
@@ -58,7 +58,7 @@ def prserv_import_db(d, filter_version=None, filter_pkgarch=None, filter_checksu
                (filter_checksum and filter_checksum != checksum):
                continue
             try:
-                value = int(d.getVar(remain + '$' + version + '$' + pkgarch + '$' + checksum, True))
+                value = int(d.getVar(remain + '$' + version + '$' + pkgarch + '$' + checksum))
             except BaseException as exc:
                 bb.debug("Not valid value of %s:%s" % (v,str(exc)))
                 continue
@@ -72,8 +72,8 @@ def prserv_import_db(d, filter_version=None, filter_pkgarch=None, filter_checksu
 def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=False):
     import bb.utils
     #initilize the output file
-    bb.utils.mkdirhier(d.getVar('PRSERV_DUMPDIR', True))
-    df = d.getVar('PRSERV_DUMPFILE', True)
+    bb.utils.mkdirhier(d.getVar('PRSERV_DUMPDIR'))
+    df = d.getVar('PRSERV_DUMPFILE')
     #write data
     lf = bb.utils.lockfile("%s.lock" % df)
     f = open(df, "a")
@@ -114,7 +114,7 @@ def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=False):
     bb.utils.unlockfile(lf)
 
 def prserv_check_avail(d):
-    host_params = list([_f for _f in (d.getVar("PRSERV_HOST", True) or '').split(':') if _f])
+    host_params = list([_f for _f in (d.getVar("PRSERV_HOST") or '').split(':') if _f])
     try:
         if len(host_params) != 2:
             raise TypeError
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 22d76dc..3231e60 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -129,11 +129,11 @@ class ELFFile:
         if cmd in self.objdump_output:
             return self.objdump_output[cmd]
 
-        objdump = d.getVar('OBJDUMP', True)
+        objdump = d.getVar('OBJDUMP')
 
         env = os.environ.copy()
         env["LC_ALL"] = "C"
-        env["PATH"] = d.getVar('PATH', True)
+        env["PATH"] = d.getVar('PATH')
 
         try:
             bb.note("%s %s %s" % (objdump, cmd, self.name))
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 1589feb..4c27c3b 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -359,16 +359,16 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True):
 
     # FIXME need a warning if the unexpanded SRC_URI value contains variable references
 
-    uris = (d.getVar('SRC_URI', True) or "").split()
+    uris = (d.getVar('SRC_URI') or "").split()
     fetch = bb.fetch2.Fetch(uris, d)
     if download:
         fetch.download()
 
     # Copy local files to target directory and gather any remote files
-    bb_dir = os.path.dirname(d.getVar('FILE', True)) + os.sep
+    bb_dir = os.path.dirname(d.getVar('FILE')) + os.sep
     remotes = []
     copied = []
-    includes = [path for path in d.getVar('BBINCLUDED', True).split() if
+    includes = [path for path in d.getVar('BBINCLUDED').split() if
                 path.startswith(bb_dir) and os.path.exists(path)]
     for path in fetch.localpaths() + includes:
         # Only import files that are under the meta directory
@@ -391,7 +391,7 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True):
 
 def get_recipe_local_files(d, patches=False, archives=False):
     """Get a list of local files in SRC_URI within a recipe."""
-    uris = (d.getVar('SRC_URI', True) or "").split()
+    uris = (d.getVar('SRC_URI') or "").split()
     fetch = bb.fetch2.Fetch(uris, d)
     # FIXME this list should be factored out somewhere else (such as the
     # fetcher) though note that this only encompasses actual container formats
@@ -454,7 +454,7 @@ def get_recipe_patched_files(d):
     for patch in patches:
         _, _, patchfile, _, _, parm = bb.fetch.decodeurl(patch)
         striplevel = int(parm['striplevel'])
-        patchedfiles[patchfile] = oe.patch.PatchSet.getPatchedFiles(patchfile, striplevel, os.path.join(d.getVar('S', True), parm.get('patchdir', '')))
+        patchedfiles[patchfile] = oe.patch.PatchSet.getPatchedFiles(patchfile, striplevel, os.path.join(d.getVar('S'), parm.get('patchdir', '')))
     return patchedfiles
 
 
@@ -492,9 +492,9 @@ def get_bbfile_path(d, destdir, extrapathhint=None):
     confdata.setVar('LAYERDIR', destlayerdir)
     destlayerconf = os.path.join(destlayerdir, "conf", "layer.conf")
     confdata = bb.cookerdata.parse_config_file(destlayerconf, confdata)
-    pn = d.getVar('PN', True)
+    pn = d.getVar('PN')
 
-    bbfilespecs = (confdata.getVar('BBFILES', True) or '').split()
+    bbfilespecs = (confdata.getVar('BBFILES') or '').split()
     if destdir == destlayerdir:
         for bbfilespec in bbfilespecs:
             if not bbfilespec.endswith('.bbappend'):
@@ -507,8 +507,8 @@ def get_bbfile_path(d, destdir, extrapathhint=None):
 
     # Try to make up a path that matches BBFILES
     # this is a little crude, but better than nothing
-    bpn = d.getVar('BPN', True)
-    recipefn = os.path.basename(d.getVar('FILE', True))
+    bpn = d.getVar('BPN')
+    recipefn = os.path.basename(d.getVar('FILE'))
     pathoptions = [destdir]
     if extrapathhint:
         pathoptions.append(os.path.join(destdir, extrapathhint))
@@ -532,7 +532,7 @@ def get_bbappend_path(d, destlayerdir, wildcardver=False):
     import bb.cookerdata
 
     destlayerdir = os.path.abspath(destlayerdir)
-    recipefile = d.getVar('FILE', True)
+    recipefile = d.getVar('FILE')
     recipefn = os.path.splitext(os.path.basename(recipefile))[0]
     if wildcardver and '_' in recipefn:
         recipefn = recipefn.split('_', 1)[0] + '_%'
@@ -552,7 +552,7 @@ def get_bbappend_path(d, destlayerdir, wildcardver=False):
     appendpath = os.path.join(destlayerdir, os.path.relpath(os.path.dirname(recipefile), origlayerdir), appendfn)
     closepath = ''
     pathok = True
-    for bbfilespec in confdata.getVar('BBFILES', True).split():
+    for bbfilespec in confdata.getVar('BBFILES').split():
         if fnmatch.fnmatchcase(appendpath, bbfilespec):
             # Our append path works, we're done
             break
@@ -625,7 +625,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
 
     # FIXME check if the bbappend doesn't get overridden by a higher priority layer?
 
-    layerdirs = [os.path.abspath(layerdir) for layerdir in rd.getVar('BBLAYERS', True).split()]
+    layerdirs = [os.path.abspath(layerdir) for layerdir in rd.getVar('BBLAYERS').split()]
     if not os.path.abspath(destlayerdir) in layerdirs:
         bb.warn('Specified layer is not currently enabled in bblayers.conf, you will need to add it before this bbappend will be active')
 
@@ -661,7 +661,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
         else:
             bbappendlines.append((varname, op, value))
 
-    destsubdir = rd.getVar('PN', True)
+    destsubdir = rd.getVar('PN')
     if srcfiles:
         bbappendlines.append(('FILESEXTRAPATHS_prepend', ':=', '${THISDIR}/${PN}:'))
 
@@ -680,7 +680,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
                 srcurientry = 'file://%s' % srcfile
                 # Double-check it's not there already
                 # FIXME do we care if the entry is added by another bbappend that might go away?
-                if not srcurientry in rd.getVar('SRC_URI', True).split():
+                if not srcurientry in rd.getVar('SRC_URI').split():
                     if machine:
                         appendline('SRC_URI_append%s' % appendoverride, '=', ' ' + srcurientry)
                     else:
@@ -829,7 +829,7 @@ def replace_dir_vars(path, d):
     # Sort by length so we get the variables we're interested in first
     for var in sorted(list(d.keys()), key=len):
         if var.endswith('dir') and var.lower() == var:
-            value = d.getVar(var, True)
+            value = d.getVar(var)
             if value.startswith('/') and not '\n' in value and value not in dirvars:
                 dirvars[value] = var
     for dirpath in sorted(list(dirvars.keys()), reverse=True):
@@ -883,12 +883,12 @@ def get_recipe_upstream_version(rd):
     ru['type'] = 'U'
     ru['datetime'] = ''
 
-    pv = rd.getVar('PV', True)
+    pv = rd.getVar('PV')
 
     # XXX: If don't have SRC_URI means that don't have upstream sources so
     # returns the current recipe version, so that upstream version check
     # declares a match.
-    src_uris = rd.getVar('SRC_URI', True)
+    src_uris = rd.getVar('SRC_URI')
     if not src_uris:
         ru['version'] = pv
         ru['type'] = 'M'
@@ -899,13 +899,13 @@ def get_recipe_upstream_version(rd):
     src_uri = src_uris.split()[0]
     uri_type, _, _, _, _, _ =  decodeurl(src_uri)
 
-    manual_upstream_version = rd.getVar("RECIPE_UPSTREAM_VERSION", True)
+    manual_upstream_version = rd.getVar("RECIPE_UPSTREAM_VERSION")
     if manual_upstream_version:
         # manual tracking of upstream version.
         ru['version'] = manual_upstream_version
         ru['type'] = 'M'
 
-        manual_upstream_date = rd.getVar("CHECK_DATE", True)
+        manual_upstream_date = rd.getVar("CHECK_DATE")
         if manual_upstream_date:
             date = datetime.strptime(manual_upstream_date, "%b %d, %Y")
         else:
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index a348b97..8c5976a 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -18,8 +18,8 @@ class Rootfs(object, metaclass=ABCMeta):
     def __init__(self, d, progress_reporter=None):
         self.d = d
         self.pm = None
-        self.image_rootfs = self.d.getVar('IMAGE_ROOTFS', True)
-        self.deploydir = self.d.getVar('IMGDEPLOYDIR', True)
+        self.image_rootfs = self.d.getVar('IMAGE_ROOTFS')
+        self.deploydir = self.d.getVar('IMGDEPLOYDIR')
         self.progress_reporter = progress_reporter
 
         self.install_order = Manifest.INSTALL_ORDER
@@ -69,7 +69,7 @@ class Rootfs(object, metaclass=ABCMeta):
             else:
                 msg = '%d %s messages' % (len(messages), type)
             msg = '[log_check] %s: found %s in the logfile:\n%s' % \
-                (self.d.getVar('PN', True), msg, ''.join(messages))
+                (self.d.getVar('PN'), msg, ''.join(messages))
             if type == 'error':
                 bb.fatal(msg)
             else:
@@ -100,7 +100,7 @@ class Rootfs(object, metaclass=ABCMeta):
         pass
 
     def _setup_dbg_rootfs(self, dirs):
-        gen_debugfs = self.d.getVar('IMAGE_GEN_DEBUGFS', True) or '0'
+        gen_debugfs = self.d.getVar('IMAGE_GEN_DEBUGFS') or '0'
         if gen_debugfs != '1':
            return
 
@@ -153,7 +153,7 @@ class Rootfs(object, metaclass=ABCMeta):
         os.rename(self.image_rootfs + '-orig', self.image_rootfs)
 
     def _exec_shell_cmd(self, cmd):
-        fakerootcmd = self.d.getVar('FAKEROOT', True)
+        fakerootcmd = self.d.getVar('FAKEROOT')
         if fakerootcmd is not None:
             exec_cmd = [fakerootcmd, cmd]
         else:
@@ -168,14 +168,14 @@ class Rootfs(object, metaclass=ABCMeta):
 
     def create(self):
         bb.note("###### Generate rootfs #######")
-        pre_process_cmds = self.d.getVar("ROOTFS_PREPROCESS_COMMAND", True)
-        post_process_cmds = self.d.getVar("ROOTFS_POSTPROCESS_COMMAND", True)
-        rootfs_post_install_cmds = self.d.getVar('ROOTFS_POSTINSTALL_COMMAND', True)
+        pre_process_cmds = self.d.getVar("ROOTFS_PREPROCESS_COMMAND")
+        post_process_cmds = self.d.getVar("ROOTFS_POSTPROCESS_COMMAND")
+        rootfs_post_install_cmds = self.d.getVar('ROOTFS_POSTINSTALL_COMMAND')
 
-        postinst_intercepts_dir = self.d.getVar("POSTINST_INTERCEPTS_DIR", True)
+        postinst_intercepts_dir = self.d.getVar("POSTINST_INTERCEPTS_DIR")
         if not postinst_intercepts_dir:
             postinst_intercepts_dir = self.d.expand("${COREBASE}/scripts/postinst-intercepts")
-        intercepts_dir = os.path.join(self.d.getVar('WORKDIR', True),
+        intercepts_dir = os.path.join(self.d.getVar('WORKDIR'),
                                       "intercept_scripts")
 
         bb.utils.remove(intercepts_dir, True)
@@ -198,10 +198,10 @@ class Rootfs(object, metaclass=ABCMeta):
         # call the package manager dependent create method
         self._create()
 
-        sysconfdir = self.image_rootfs + self.d.getVar('sysconfdir', True)
+        sysconfdir = self.image_rootfs + self.d.getVar('sysconfdir')
         bb.utils.mkdirhier(sysconfdir)
         with open(sysconfdir + "/version", "w+") as ver:
-            ver.write(self.d.getVar('BUILDNAME', True) + "\n")
+            ver.write(self.d.getVar('BUILDNAME') + "\n")
 
         execute_pre_post_process(self.d, rootfs_post_install_cmds)
 
@@ -220,7 +220,7 @@ class Rootfs(object, metaclass=ABCMeta):
                          "offline and rootfs is read-only: %s" %
                          delayed_postinsts)
 
-        if self.d.getVar('USE_DEVFS', True) != "1":
+        if self.d.getVar('USE_DEVFS') != "1":
             self._create_devfs()
 
         self._uninstall_unneeded()
@@ -232,7 +232,7 @@ class Rootfs(object, metaclass=ABCMeta):
 
         self._run_ldconfig()
 
-        if self.d.getVar('USE_DEPMOD', True) != "0":
+        if self.d.getVar('USE_DEPMOD') != "0":
             self._generate_kernel_module_deps()
 
         self._cleanup()
@@ -248,16 +248,16 @@ class Rootfs(object, metaclass=ABCMeta):
         if delayed_postinsts is None:
             if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts")):
                 self._exec_shell_cmd(["update-rc.d", "-f", "-r",
-                                      self.d.getVar('IMAGE_ROOTFS', True),
+                                      self.d.getVar('IMAGE_ROOTFS'),
                                       "run-postinsts", "remove"])
 
         image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
                                         True, False, self.d)
-        image_rorfs_force = self.d.getVar('FORCE_RO_REMOVE', True)
+        image_rorfs_force = self.d.getVar('FORCE_RO_REMOVE')
 
         if image_rorfs or image_rorfs_force == "1":
             # Remove components that we don't need if it's a read-only rootfs
-            unneeded_pkgs = self.d.getVar("ROOTFS_RO_UNNEEDED", True).split()
+            unneeded_pkgs = self.d.getVar("ROOTFS_RO_UNNEEDED").split()
             pkgs_installed = image_list_installed_packages(self.d)
             pkgs_to_remove = [pkg for pkg in pkgs_installed if pkg in unneeded_pkgs]
 
@@ -270,7 +270,7 @@ class Rootfs(object, metaclass=ABCMeta):
                 bb.warn("There are post install scripts "
                         "in a read-only rootfs")
 
-        post_uninstall_cmds = self.d.getVar("ROOTFS_POSTUNINSTALL_COMMAND", True)
+        post_uninstall_cmds = self.d.getVar("ROOTFS_POSTUNINSTALL_COMMAND")
         execute_pre_post_process(self.d, post_uninstall_cmds)
 
         runtime_pkgmanage = bb.utils.contains("IMAGE_FEATURES", "package-management",
@@ -280,12 +280,12 @@ class Rootfs(object, metaclass=ABCMeta):
             self.pm.remove_packaging_data()
 
     def _run_intercepts(self):
-        intercepts_dir = os.path.join(self.d.getVar('WORKDIR', True),
+        intercepts_dir = os.path.join(self.d.getVar('WORKDIR'),
                                       "intercept_scripts")
 
         bb.note("Running intercept scripts:")
         os.environ['D'] = self.image_rootfs
-        os.environ['STAGING_DIR_NATIVE'] = self.d.getVar('STAGING_DIR_NATIVE', True)
+        os.environ['STAGING_DIR_NATIVE'] = self.d.getVar('STAGING_DIR_NATIVE')
         for script in os.listdir(intercepts_dir):
             script_full = os.path.join(intercepts_dir, script)
 
@@ -317,7 +317,7 @@ class Rootfs(object, metaclass=ABCMeta):
                         self._handle_intercept_failure(registered_pkgs)
 
     def _run_ldconfig(self):
-        if self.d.getVar('LDCONFIGDEPEND', True):
+        if self.d.getVar('LDCONFIGDEPEND'):
             bb.note("Executing: ldconfig -r" + self.image_rootfs + "-c new -v")
             self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '-c',
                                   'new', '-v'])
@@ -337,7 +337,7 @@ class Rootfs(object, metaclass=ABCMeta):
             bb.note("No Kernel Modules found, not running depmod")
             return
 
-        kernel_abi_ver_file = oe.path.join(self.d.getVar('PKGDATA_DIR', True), "kernel-depmod",
+        kernel_abi_ver_file = oe.path.join(self.d.getVar('PKGDATA_DIR'), "kernel-depmod",
                                            'kernel-abiversion')
         if not os.path.exists(kernel_abi_ver_file):
             bb.fatal("No kernel-abiversion file found (%s), cannot run depmod, aborting" % kernel_abi_ver_file)
@@ -359,15 +359,15 @@ class Rootfs(object, metaclass=ABCMeta):
     """
     def _create_devfs(self):
         devtable_list = []
-        devtable = self.d.getVar('IMAGE_DEVICE_TABLE', True)
+        devtable = self.d.getVar('IMAGE_DEVICE_TABLE')
         if devtable is not None:
             devtable_list.append(devtable)
         else:
-            devtables = self.d.getVar('IMAGE_DEVICE_TABLES', True)
+            devtables = self.d.getVar('IMAGE_DEVICE_TABLES')
             if devtables is None:
                 devtables = 'files/device_table-minimal.txt'
             for devtable in devtables.split():
-                devtable_list.append("%s" % bb.utils.which(self.d.getVar('BBPATH', True), devtable))
+                devtable_list.append("%s" % bb.utils.which(self.d.getVar('BBPATH'), devtable))
 
         for devtable in devtable_list:
             self._exec_shell_cmd(["makedevs", "-r",
@@ -383,16 +383,16 @@ class RpmRootfs(Rootfs):
         self.manifest = RpmManifest(d, manifest_dir)
 
         self.pm = RpmPM(d,
-                        d.getVar('IMAGE_ROOTFS', True),
-                        self.d.getVar('TARGET_VENDOR', True)
+                        d.getVar('IMAGE_ROOTFS'),
+                        self.d.getVar('TARGET_VENDOR')
                         )
 
-        self.inc_rpm_image_gen = self.d.getVar('INC_RPM_IMAGE_GEN', True)
+        self.inc_rpm_image_gen = self.d.getVar('INC_RPM_IMAGE_GEN')
         if self.inc_rpm_image_gen != "1":
             bb.utils.remove(self.image_rootfs, True)
         else:
             self.pm.recovery_packaging_data()
-        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS', True), True)
+        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
 
         self.pm.create_configs()
 
@@ -426,8 +426,8 @@ class RpmRootfs(Rootfs):
 
     def _create(self):
         pkgs_to_install = self.manifest.parse_initial_manifest()
-        rpm_pre_process_cmds = self.d.getVar('RPM_PREPROCESS_COMMANDS', True)
-        rpm_post_process_cmds = self.d.getVar('RPM_POSTPROCESS_COMMANDS', True)
+        rpm_pre_process_cmds = self.d.getVar('RPM_PREPROCESS_COMMANDS')
+        rpm_post_process_cmds = self.d.getVar('RPM_POSTPROCESS_COMMANDS')
 
         # update PM index files
         self.pm.write_index()
@@ -600,7 +600,7 @@ class DpkgOpkgRootfs(Rootfs):
         pkg_list = []
 
         pkgs = None
-        if not self.d.getVar('PACKAGE_INSTALL', True).strip():
+        if not self.d.getVar('PACKAGE_INSTALL').strip():
             bb.note("Building empty image")
         else:
             pkgs = self._get_pkgs_postinsts(status_file)
@@ -636,17 +636,17 @@ class DpkgRootfs(DpkgOpkgRootfs):
         ]
 
         bb.utils.remove(self.image_rootfs, True)
-        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS', True), True)
+        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
         self.manifest = DpkgManifest(d, manifest_dir)
-        self.pm = DpkgPM(d, d.getVar('IMAGE_ROOTFS', True),
-                         d.getVar('PACKAGE_ARCHS', True),
-                         d.getVar('DPKG_ARCH', True))
+        self.pm = DpkgPM(d, d.getVar('IMAGE_ROOTFS'),
+                         d.getVar('PACKAGE_ARCHS'),
+                         d.getVar('DPKG_ARCH'))
 
 
     def _create(self):
         pkgs_to_install = self.manifest.parse_initial_manifest()
-        deb_pre_process_cmds = self.d.getVar('DEB_PREPROCESS_COMMANDS', True)
-        deb_post_process_cmds = self.d.getVar('DEB_POSTPROCESS_COMMANDS', True)
+        deb_pre_process_cmds = self.d.getVar('DEB_PREPROCESS_COMMANDS')
+        deb_post_process_cmds = self.d.getVar('DEB_POSTPROCESS_COMMANDS')
 
         alt_dir = self.d.expand("${IMAGE_ROOTFS}/var/lib/dpkg/alternatives")
         bb.utils.mkdirhier(alt_dir)
@@ -724,10 +724,10 @@ class OpkgRootfs(DpkgOpkgRootfs):
         self.log_check_regex = '(exit 1|Collected errors)'
 
         self.manifest = OpkgManifest(d, manifest_dir)
-        self.opkg_conf = self.d.getVar("IPKGCONF_TARGET", True)
-        self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True)
+        self.opkg_conf = self.d.getVar("IPKGCONF_TARGET")
+        self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS")
 
-        self.inc_opkg_image_gen = self.d.getVar('INC_IPK_IMAGE_GEN', True) or ""
+        self.inc_opkg_image_gen = self.d.getVar('INC_IPK_IMAGE_GEN') or ""
         if self._remove_old_rootfs():
             bb.utils.remove(self.image_rootfs, True)
             self.pm = OpkgPM(d,
@@ -741,7 +741,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
                              self.pkg_archs)
             self.pm.recover_packaging_data()
 
-        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS', True), True)
+        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
 
     def _prelink_file(self, root_dir, filename):
         bb.note('prelink %s in %s' % (filename, root_dir))
@@ -796,7 +796,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
     """
     def _multilib_sanity_test(self, dirs):
 
-        allow_replace = self.d.getVar("MULTILIBRE_ALLOW_REP", True)
+        allow_replace = self.d.getVar("MULTILIBRE_ALLOW_REP")
         if allow_replace is None:
             allow_replace = ""
 
@@ -828,12 +828,12 @@ class OpkgRootfs(DpkgOpkgRootfs):
                         files[key] = item
 
     def _multilib_test_install(self, pkgs):
-        ml_temp = self.d.getVar("MULTILIB_TEMP_ROOTFS", True)
+        ml_temp = self.d.getVar("MULTILIB_TEMP_ROOTFS")
         bb.utils.mkdirhier(ml_temp)
 
         dirs = [self.image_rootfs]
 
-        for variant in self.d.getVar("MULTILIB_VARIANTS", True).split():
+        for variant in self.d.getVar("MULTILIB_VARIANTS").split():
             ml_target_rootfs = os.path.join(ml_temp, variant)
 
             bb.utils.remove(ml_target_rootfs, True)
@@ -893,9 +893,9 @@ class OpkgRootfs(DpkgOpkgRootfs):
             old_vars_list = open(vars_list_file, 'r+').read()
 
         new_vars_list = '%s:%s:%s\n' % \
-                ((self.d.getVar('BAD_RECOMMENDATIONS', True) or '').strip(),
-                 (self.d.getVar('NO_RECOMMENDATIONS', True) or '').strip(),
-                 (self.d.getVar('PACKAGE_EXCLUDE', True) or '').strip())
+                ((self.d.getVar('BAD_RECOMMENDATIONS') or '').strip(),
+                 (self.d.getVar('NO_RECOMMENDATIONS') or '').strip(),
+                 (self.d.getVar('PACKAGE_EXCLUDE') or '').strip())
         open(vars_list_file, 'w+').write(new_vars_list)
 
         if old_vars_list != new_vars_list:
@@ -905,11 +905,11 @@ class OpkgRootfs(DpkgOpkgRootfs):
 
     def _create(self):
         pkgs_to_install = self.manifest.parse_initial_manifest()
-        opkg_pre_process_cmds = self.d.getVar('OPKG_PREPROCESS_COMMANDS', True)
-        opkg_post_process_cmds = self.d.getVar('OPKG_POSTPROCESS_COMMANDS', True)
+        opkg_pre_process_cmds = self.d.getVar('OPKG_PREPROCESS_COMMANDS')
+        opkg_post_process_cmds = self.d.getVar('OPKG_POSTPROCESS_COMMANDS')
 
         # update PM index files, unless users provide their own feeds
-        if (self.d.getVar('BUILD_IMAGES_FROM_FEEDS', True) or "") != "1":
+        if (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or "") != "1":
             self.pm.write_index()
 
         execute_pre_post_process(self.d, opkg_pre_process_cmds)
@@ -967,7 +967,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
 
     def _get_delayed_postinsts(self):
         status_file = os.path.join(self.image_rootfs,
-                                   self.d.getVar('OPKGLIBDIR', True).strip('/'),
+                                   self.d.getVar('OPKGLIBDIR').strip('/'),
                                    "opkg", "status")
         return self._get_delayed_postinsts_common(status_file)
 
@@ -992,14 +992,14 @@ def get_class_for_type(imgtype):
             "deb": DpkgRootfs}[imgtype]
 
 def variable_depends(d, manifest_dir=None):
-    img_type = d.getVar('IMAGE_PKGTYPE', True)
+    img_type = d.getVar('IMAGE_PKGTYPE')
     cls = get_class_for_type(img_type)
     return cls._depends_list()
 
 def create_rootfs(d, manifest_dir=None, progress_reporter=None):
     env_bkp = os.environ.copy()
 
-    img_type = d.getVar('IMAGE_PKGTYPE', True)
+    img_type = d.getVar('IMAGE_PKGTYPE')
     if img_type == "rpm":
         RpmRootfs(d, manifest_dir, progress_reporter).create()
     elif img_type == "ipk":
@@ -1013,13 +1013,13 @@ def create_rootfs(d, manifest_dir=None, progress_reporter=None):
 
 def image_list_installed_packages(d, rootfs_dir=None):
     if not rootfs_dir:
-        rootfs_dir = d.getVar('IMAGE_ROOTFS', True)
+        rootfs_dir = d.getVar('IMAGE_ROOTFS')
 
-    img_type = d.getVar('IMAGE_PKGTYPE', True)
+    img_type = d.getVar('IMAGE_PKGTYPE')
     if img_type == "rpm":
         return RpmPkgsList(d, rootfs_dir).list_pkgs()
     elif img_type == "ipk":
-        return OpkgPkgsList(d, rootfs_dir, d.getVar("IPKGCONF_TARGET", True)).list_pkgs()
+        return OpkgPkgsList(d, rootfs_dir, d.getVar("IPKGCONF_TARGET")).list_pkgs()
     elif img_type == "deb":
         return DpkgPkgsList(d, rootfs_dir).list_pkgs()
 
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index c74525f..fef02d0 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -11,16 +11,16 @@ import traceback
 class Sdk(object, metaclass=ABCMeta):
     def __init__(self, d, manifest_dir):
         self.d = d
-        self.sdk_output = self.d.getVar('SDK_OUTPUT', True)
-        self.sdk_native_path = self.d.getVar('SDKPATHNATIVE', True).strip('/')
-        self.target_path = self.d.getVar('SDKTARGETSYSROOT', True).strip('/')
-        self.sysconfdir = self.d.getVar('sysconfdir', True).strip('/')
+        self.sdk_output = self.d.getVar('SDK_OUTPUT')
+        self.sdk_native_path = self.d.getVar('SDKPATHNATIVE').strip('/')
+        self.target_path = self.d.getVar('SDKTARGETSYSROOT').strip('/')
+        self.sysconfdir = self.d.getVar('sysconfdir').strip('/')
 
         self.sdk_target_sysroot = os.path.join(self.sdk_output, self.target_path)
         self.sdk_host_sysroot = self.sdk_output
 
         if manifest_dir is None:
-            self.manifest_dir = self.d.getVar("SDK_DIR", True)
+            self.manifest_dir = self.d.getVar("SDK_DIR")
         else:
             self.manifest_dir = manifest_dir
 
@@ -40,12 +40,12 @@ class Sdk(object, metaclass=ABCMeta):
 
         # Don't ship any libGL in the SDK
         self.remove(os.path.join(self.sdk_output, self.sdk_native_path,
-                         self.d.getVar('libdir_nativesdk', True).strip('/'),
+                         self.d.getVar('libdir_nativesdk').strip('/'),
                          "libGL*"))
 
         # Fix or remove broken .la files
         self.remove(os.path.join(self.sdk_output, self.sdk_native_path,
-                         self.d.getVar('libdir_nativesdk', True).strip('/'),
+                         self.d.getVar('libdir_nativesdk').strip('/'),
                          "*.la"))
 
         # Link the ld.so.cache file into the hosts filesystem
@@ -54,7 +54,7 @@ class Sdk(object, metaclass=ABCMeta):
         self.mkdirhier(os.path.dirname(link_name))
         os.symlink("/etc/ld.so.cache", link_name)
 
-        execute_pre_post_process(self.d, self.d.getVar('SDK_POSTPROCESS_COMMAND', True))
+        execute_pre_post_process(self.d, self.d.getVar('SDK_POSTPROCESS_COMMAND'))
 
     def movefile(self, sourcefile, destdir):
         try:
@@ -102,7 +102,7 @@ class RpmSdk(Sdk):
 
         self.target_pm = RpmPM(d,
                                self.sdk_target_sysroot,
-                               self.d.getVar('TARGET_VENDOR', True),
+                               self.d.getVar('TARGET_VENDOR'),
                                'target',
                                target_providename
                                )
@@ -118,7 +118,7 @@ class RpmSdk(Sdk):
 
         self.host_pm = RpmPM(d,
                              self.sdk_host_sysroot,
-                             self.d.getVar('SDK_VENDOR', True),
+                             self.d.getVar('SDK_VENDOR'),
                              'host',
                              sdk_providename,
                              "SDK_PACKAGE_ARCHS",
@@ -149,9 +149,9 @@ class RpmSdk(Sdk):
         bb.note("Installing TARGET packages")
         self._populate_sysroot(self.target_pm, self.target_manifest)
 
-        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY', True))
+        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
 
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND", True))
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
 
         if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
             self.target_pm.remove_packaging_data()
@@ -159,7 +159,7 @@ class RpmSdk(Sdk):
         bb.note("Installing NATIVESDK packages")
         self._populate_sysroot(self.host_pm, self.host_manifest)
 
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND", True))
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
 
         if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
             self.host_pm.remove_packaging_data()
@@ -167,7 +167,7 @@ class RpmSdk(Sdk):
         # Move host RPM library data
         native_rpm_state_dir = os.path.join(self.sdk_output,
                                             self.sdk_native_path,
-                                            self.d.getVar('localstatedir_nativesdk', True).strip('/'),
+                                            self.d.getVar('localstatedir_nativesdk').strip('/'),
                                             "lib",
                                             "rpm"
                                             )
@@ -197,8 +197,8 @@ class OpkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
         super(OpkgSdk, self).__init__(d, manifest_dir)
 
-        self.target_conf = self.d.getVar("IPKGCONF_TARGET", True)
-        self.host_conf = self.d.getVar("IPKGCONF_SDK", True)
+        self.target_conf = self.d.getVar("IPKGCONF_TARGET")
+        self.host_conf = self.d.getVar("IPKGCONF_SDK")
 
         self.target_manifest = OpkgManifest(d, self.manifest_dir,
                                             Manifest.MANIFEST_TYPE_SDK_TARGET)
@@ -206,15 +206,15 @@ class OpkgSdk(Sdk):
                                           Manifest.MANIFEST_TYPE_SDK_HOST)
 
         self.target_pm = OpkgPM(d, self.sdk_target_sysroot, self.target_conf,
-                                self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True))
+                                self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"))
 
         self.host_pm = OpkgPM(d, self.sdk_host_sysroot, self.host_conf,
-                              self.d.getVar("SDK_PACKAGE_ARCHS", True))
+                              self.d.getVar("SDK_PACKAGE_ARCHS"))
 
     def _populate_sysroot(self, pm, manifest):
         pkgs_to_install = manifest.parse_initial_manifest()
 
-        if (self.d.getVar('BUILD_IMAGES_FROM_FEEDS', True) or "") != "1":
+        if (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or "") != "1":
             pm.write_index()
 
         pm.update()
@@ -228,9 +228,9 @@ class OpkgSdk(Sdk):
         bb.note("Installing TARGET packages")
         self._populate_sysroot(self.target_pm, self.target_manifest)
 
-        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY', True))
+        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
 
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND", True))
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
 
         if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
             self.target_pm.remove_packaging_data()
@@ -238,7 +238,7 @@ class OpkgSdk(Sdk):
         bb.note("Installing NATIVESDK packages")
         self._populate_sysroot(self.host_pm, self.host_manifest)
 
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND", True))
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
 
         if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
             self.host_pm.remove_packaging_data()
@@ -257,7 +257,7 @@ class OpkgSdk(Sdk):
                               os.path.basename(self.host_conf)), 0o644)
 
         native_opkg_state_dir = os.path.join(self.sdk_output, self.sdk_native_path,
-                                             self.d.getVar('localstatedir_nativesdk', True).strip('/'),
+                                             self.d.getVar('localstatedir_nativesdk').strip('/'),
                                              "lib", "opkg")
         self.mkdirhier(native_opkg_state_dir)
         for f in glob.glob(os.path.join(self.sdk_output, "var", "lib", "opkg", "*")):
@@ -270,8 +270,8 @@ class DpkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
         super(DpkgSdk, self).__init__(d, manifest_dir)
 
-        self.target_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET", True), "apt")
-        self.host_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET", True), "apt-sdk")
+        self.target_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt")
+        self.host_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt-sdk")
 
         self.target_manifest = DpkgManifest(d, self.manifest_dir,
                                             Manifest.MANIFEST_TYPE_SDK_TARGET)
@@ -279,17 +279,17 @@ class DpkgSdk(Sdk):
                                           Manifest.MANIFEST_TYPE_SDK_HOST)
 
         self.target_pm = DpkgPM(d, self.sdk_target_sysroot,
-                                self.d.getVar("PACKAGE_ARCHS", True),
-                                self.d.getVar("DPKG_ARCH", True),
+                                self.d.getVar("PACKAGE_ARCHS"),
+                                self.d.getVar("DPKG_ARCH"),
                                 self.target_conf_dir)
 
         self.host_pm = DpkgPM(d, self.sdk_host_sysroot,
-                              self.d.getVar("SDK_PACKAGE_ARCHS", True),
-                              self.d.getVar("DEB_SDK_ARCH", True),
+                              self.d.getVar("SDK_PACKAGE_ARCHS"),
+                              self.d.getVar("DEB_SDK_ARCH"),
                               self.host_conf_dir)
 
     def _copy_apt_dir_to(self, dst_dir):
-        staging_etcdir_native = self.d.getVar("STAGING_ETCDIR_NATIVE", True)
+        staging_etcdir_native = self.d.getVar("STAGING_ETCDIR_NATIVE")
 
         self.remove(dst_dir, True)
 
@@ -310,9 +310,9 @@ class DpkgSdk(Sdk):
         bb.note("Installing TARGET packages")
         self._populate_sysroot(self.target_pm, self.target_manifest)
 
-        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY', True))
+        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
 
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND", True))
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
 
         self._copy_apt_dir_to(os.path.join(self.sdk_target_sysroot, "etc", "apt"))
 
@@ -322,7 +322,7 @@ class DpkgSdk(Sdk):
         bb.note("Installing NATIVESDK packages")
         self._populate_sysroot(self.host_pm, self.host_manifest)
 
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND", True))
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
 
         self._copy_apt_dir_to(os.path.join(self.sdk_output, self.sdk_native_path,
                                            "etc", "apt"))
@@ -341,26 +341,26 @@ class DpkgSdk(Sdk):
 
 def sdk_list_installed_packages(d, target, rootfs_dir=None):
     if rootfs_dir is None:
-        sdk_output = d.getVar('SDK_OUTPUT', True)
-        target_path = d.getVar('SDKTARGETSYSROOT', True).strip('/')
+        sdk_output = d.getVar('SDK_OUTPUT')
+        target_path = d.getVar('SDKTARGETSYSROOT').strip('/')
 
         rootfs_dir = [sdk_output, os.path.join(sdk_output, target_path)][target is True]
 
-    img_type = d.getVar('IMAGE_PKGTYPE', True)
+    img_type = d.getVar('IMAGE_PKGTYPE')
     if img_type == "rpm":
         arch_var = ["SDK_PACKAGE_ARCHS", None][target is True]
         os_var = ["SDK_OS", None][target is True]
         return RpmPkgsList(d, rootfs_dir, arch_var, os_var).list_pkgs()
     elif img_type == "ipk":
         conf_file_var = ["IPKGCONF_SDK", "IPKGCONF_TARGET"][target is True]
-        return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var, True)).list_pkgs()
+        return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var)).list_pkgs()
     elif img_type == "deb":
         return DpkgPkgsList(d, rootfs_dir).list_pkgs()
 
 def populate_sdk(d, manifest_dir=None):
     env_bkp = os.environ.copy()
 
-    img_type = d.getVar('IMAGE_PKGTYPE', True)
+    img_type = d.getVar('IMAGE_PKGTYPE')
     if img_type == "rpm":
         RpmSdk(d, manifest_dir).populate()
     elif img_type == "ipk":
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 8224e3a..e053c37 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -63,10 +63,10 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
 
 def sstate_lockedsigs(d):
     sigs = {}
-    types = (d.getVar("SIGGEN_LOCKEDSIGS_TYPES", True) or "").split()
+    types = (d.getVar("SIGGEN_LOCKEDSIGS_TYPES") or "").split()
     for t in types:
         siggen_lockedsigs_var = "SIGGEN_LOCKEDSIGS_%s" % t
-        lockedsigs = (d.getVar(siggen_lockedsigs_var, True) or "").split()
+        lockedsigs = (d.getVar(siggen_lockedsigs_var) or "").split()
         for ls in lockedsigs:
             pn, task, h = ls.split(":", 2)
             if pn not in sigs:
@@ -77,8 +77,8 @@ def sstate_lockedsigs(d):
 class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
     name = "OEBasic"
     def init_rundepcheck(self, data):
-        self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE", True) or "").split()
-        self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", True) or "").split()
+        self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE") or "").split()
+        self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS") or "").split()
         pass
     def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
         return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
@@ -86,15 +86,15 @@ class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
 class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
     name = "OEBasicHash"
     def init_rundepcheck(self, data):
-        self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE", True) or "").split()
-        self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", True) or "").split()
+        self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE") or "").split()
+        self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS") or "").split()
         self.lockedsigs = sstate_lockedsigs(data)
         self.lockedhashes = {}
         self.lockedpnmap = {}
         self.lockedhashfn = {}
-        self.machine = data.getVar("MACHINE", True)
+        self.machine = data.getVar("MACHINE")
         self.mismatch_msgs = []
-        self.unlockedrecipes = (data.getVar("SIGGEN_UNLOCKED_RECIPES", True) or
+        self.unlockedrecipes = (data.getVar("SIGGEN_UNLOCKED_RECIPES") or
                                 "").split()
         self.unlockedrecipes = { k: "" for k in self.unlockedrecipes }
         pass
@@ -224,13 +224,13 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
                         sstate_missing_msgs.append("Locked sig is set for %s:%s (%s) yet not in sstate cache?"
                                                % (pn, sq_task[task], sq_hash[task]))
 
-        checklevel = d.getVar("SIGGEN_LOCKEDSIGS_TASKSIG_CHECK", True)
+        checklevel = d.getVar("SIGGEN_LOCKEDSIGS_TASKSIG_CHECK")
         if checklevel == 'warn':
             warn_msgs += self.mismatch_msgs
         elif checklevel == 'error':
             error_msgs += self.mismatch_msgs
 
-        checklevel = d.getVar("SIGGEN_LOCKEDSIGS_SSTATE_EXISTS_CHECK", True)
+        checklevel = d.getVar("SIGGEN_LOCKEDSIGS_SSTATE_EXISTS_CHECK")
         if checklevel == 'warn':
             warn_msgs += sstate_missing_msgs
         elif checklevel == 'error':
@@ -274,7 +274,7 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     localdata.setVar('PV', '*')
     localdata.setVar('PR', '*')
     localdata.setVar('EXTENDPE', '')
-    stamp = localdata.getVar('STAMP', True)
+    stamp = localdata.getVar('STAMP')
     if pn.startswith("gcc-source"):
         # gcc-source shared workdir is a special case :(
         stamp = localdata.expand("${STAMPS_DIR}/work-shared/gcc-${PV}-${PR}")
@@ -309,18 +309,18 @@ def find_siginfo(pn, taskname, taskhashlist, d):
             localdata.setVar('PV', '*')
             localdata.setVar('PR', '*')
             localdata.setVar('BB_TASKHASH', hashval)
-            swspec = localdata.getVar('SSTATE_SWSPEC', True)
+            swspec = localdata.getVar('SSTATE_SWSPEC')
             if taskname in ['do_fetch', 'do_unpack', 'do_patch', 'do_populate_lic', 'do_preconfigure'] and swspec:
                 localdata.setVar('SSTATE_PKGSPEC', '${SSTATE_SWSPEC}')
             elif pn.endswith('-native') or "-cross-" in pn or "-crosssdk-" in pn:
                 localdata.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
             sstatename = taskname[3:]
-            filespec = '%s_%s.*.siginfo' % (localdata.getVar('SSTATE_PKG', True), sstatename)
+            filespec = '%s_%s.*.siginfo' % (localdata.getVar('SSTATE_PKG'), sstatename)
 
             if hashval != '*':
-                sstatedir = "%s/%s" % (d.getVar('SSTATE_DIR', True), hashval[:2])
+                sstatedir = "%s/%s" % (d.getVar('SSTATE_DIR'), hashval[:2])
             else:
-                sstatedir = d.getVar('SSTATE_DIR', True)
+                sstatedir = d.getVar('SSTATE_DIR')
 
             for root, dirs, files in os.walk(sstatedir):
                 for fn in files:
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 38e66ce..c7f26c4 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -196,7 +196,7 @@ class Custom(Terminal):
     priority = 3
 
     def __init__(self, sh_cmd, title=None, env=None, d=None):
-        self.command = d and d.getVar('OE_TERMINAL_CUSTOMCMD', True)
+        self.command = d and d.getVar('OE_TERMINAL_CUSTOMCMD')
         if self.command:
             if not '{command}' in self.command:
                 self.command += ' {command}'
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index d6545b1..c9df220 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -23,13 +23,13 @@ def ifelse(condition, iftrue = True, iffalse = False):
         return iffalse
 
 def conditional(variable, checkvalue, truevalue, falsevalue, d):
-    if d.getVar(variable, True) == checkvalue:
+    if d.getVar(variable) == checkvalue:
         return truevalue
     else:
         return falsevalue
 
 def less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
-    if float(d.getVar(variable, True)) <= float(checkvalue):
+    if float(d.getVar(variable)) <= float(checkvalue):
         return truevalue
     else:
         return falsevalue
@@ -42,8 +42,8 @@ def version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
         return falsevalue
 
 def both_contain(variable1, variable2, checkvalue, d):
-    val1 = d.getVar(variable1, True)
-    val2 = d.getVar(variable2, True)
+    val1 = d.getVar(variable1)
+    val2 = d.getVar(variable2)
     val1 = set(val1.split())
     val2 = set(val2.split())
     if isinstance(checkvalue, str):
@@ -66,8 +66,8 @@ def set_intersect(variable1, variable2, d):
     s3 = set_intersect(s1, s2)
     => s3 = "b c"
     """
-    val1 = set(d.getVar(variable1, True).split())
-    val2 = set(d.getVar(variable2, True).split())
+    val1 = set(d.getVar(variable1).split())
+    val2 = set(d.getVar(variable2).split())
     return " ".join(val1 & val2)
 
 def prune_suffix(var, suffixes, d):
@@ -77,7 +77,7 @@ def prune_suffix(var, suffixes, d):
         if var.endswith(suffix):
             var = var.replace(suffix, "")
 
-    prefix = d.getVar("MLPREFIX", True)
+    prefix = d.getVar("MLPREFIX")
     if prefix and var.startswith(prefix):
         var = var.replace(prefix, "")
 
@@ -115,9 +115,9 @@ def features_backfill(var,d):
     # disturbing distributions that have already set DISTRO_FEATURES.
     # Distributions wanting to elide a value in DISTRO_FEATURES_BACKFILL should
     # add the feature to DISTRO_FEATURES_BACKFILL_CONSIDERED
-    features = (d.getVar(var, True) or "").split()
-    backfill = (d.getVar(var+"_BACKFILL", True) or "").split()
-    considered = (d.getVar(var+"_BACKFILL_CONSIDERED", True) or "").split()
+    features = (d.getVar(var) or "").split()
+    backfill = (d.getVar(var+"_BACKFILL") or "").split()
+    considered = (d.getVar(var+"_BACKFILL_CONSIDERED") or "").split()
 
     addfeatures = []
     for feature in backfill:
@@ -133,12 +133,12 @@ def packages_filter_out_system(d):
     Return a list of packages from PACKAGES with the "system" packages such as
     PN-dbg PN-doc PN-locale-eb-gb removed.
     """
-    pn = d.getVar('PN', True)
+    pn = d.getVar('PN')
     blacklist = [pn + suffix for suffix in ('', '-dbg', '-dev', '-doc', '-locale', '-staticdev')]
     localepkg = pn + "-locale-"
     pkgs = []
 
-    for pkg in d.getVar('PACKAGES', True).split():
+    for pkg in d.getVar('PACKAGES').split():
         if pkg not in blacklist and localepkg not in pkg:
             pkgs.append(pkg)
     return pkgs
@@ -302,8 +302,8 @@ def write_ld_so_conf(d):
         bb.utils.remove(ldsoconf)
     bb.utils.mkdirhier(os.path.dirname(ldsoconf))
     with open(ldsoconf, "w") as f:
-        f.write(d.getVar("base_libdir", True) + '\n')
-        f.write(d.getVar("libdir", True) + '\n')
+        f.write(d.getVar("base_libdir") + '\n')
+        f.write(d.getVar("libdir") + '\n')
 
 class ImageQAFailed(bb.build.FuncFailed):
     def __init__(self, description, name=None, logfile=None):
diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 9ce3bf8..d796fc3 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -32,14 +32,14 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
         super(MasterImageHardwareTarget, self).__init__(d)
 
         # target ip
-        addr = d.getVar("TEST_TARGET_IP", True) or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
+        addr = d.getVar("TEST_TARGET_IP") or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
         self.ip = addr.split(":")[0]
         try:
             self.port = addr.split(":")[1]
         except IndexError:
             self.port = None
         bb.note("Target IP: %s" % self.ip)
-        self.server_ip = d.getVar("TEST_SERVER_IP", True)
+        self.server_ip = d.getVar("TEST_SERVER_IP")
         if not self.server_ip:
             try:
                 self.server_ip = subprocess.check_output(['ip', 'route', 'get', self.ip ]).split("\n")[0].split()[-1]
@@ -49,8 +49,8 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
 
         # test rootfs + kernel
         self.image_fstype = self.get_image_fstype(d)
-        self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
-        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
+        self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), d.getVar("IMAGE_LINK_NAME") + '.' + self.image_fstype)
+        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
         if not os.path.isfile(self.rootfs):
             # we could've checked that IMAGE_FSTYPES contains tar.gz but the config for running testimage might not be
             # the same as the config with which the image was build, ie
@@ -64,16 +64,16 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
         # master ssh connection
         self.master = None
         # if the user knows what they are doing, then by all means...
-        self.user_cmds = d.getVar("TEST_DEPLOY_CMDS", True)
+        self.user_cmds = d.getVar("TEST_DEPLOY_CMDS")
         self.deploy_cmds = None
 
         # this is the name of the command that controls the power for a board
         # e.g: TEST_POWERCONTROL_CMD = "/home/user/myscripts/powercontrol.py ${MACHINE} what-ever-other-args-the-script-wants"
         # the command should take as the last argument "off" and "on" and "cycle" (off, on)
-        self.powercontrol_cmd = d.getVar("TEST_POWERCONTROL_CMD", True) or None
+        self.powercontrol_cmd = d.getVar("TEST_POWERCONTROL_CMD") or None
         self.powercontrol_args = d.getVar("TEST_POWERCONTROL_EXTRA_ARGS", False) or ""
 
-        self.serialcontrol_cmd = d.getVar("TEST_SERIALCONTROL_CMD", True) or None
+        self.serialcontrol_cmd = d.getVar("TEST_SERIALCONTROL_CMD") or None
         self.serialcontrol_args = d.getVar("TEST_SERIALCONTROL_EXTRA_ARGS", False) or ""
 
         self.origenv = os.environ
@@ -82,7 +82,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
             # ssh + keys means we need the original user env
             bborigenv = d.getVar("BB_ORIGENV", False) or {}
             for key in bborigenv:
-                val = bborigenv.getVar(key, True)
+                val = bborigenv.getVar(key)
                 if val is not None:
                     self.origenv[key] = str(val)
 
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 95d3bf7..d1aef96 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -221,15 +221,15 @@ class TestContext(object):
             path = [os.path.dirname(os.path.abspath(__file__))]
             extrapath = ""
         else:
-            path = d.getVar("BBPATH", True).split(':')
+            path = d.getVar("BBPATH").split(':')
             extrapath = "lib/oeqa"
 
         self.testslist = self._get_tests_list(path, extrapath)
         self.testsrequired = self._get_test_suites_required()
 
         self.filesdir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "runtime/files")
-        self.imagefeatures = d.getVar("IMAGE_FEATURES", True).split()
-        self.distrofeatures = d.getVar("DISTRO_FEATURES", True).split()
+        self.imagefeatures = d.getVar("IMAGE_FEATURES").split()
+        self.distrofeatures = d.getVar("DISTRO_FEATURES").split()
 
     # get testcase list from specified file
     # if path is a relative path, then relative to build/conf/
@@ -406,9 +406,9 @@ class RuntimeTestContext(TestContext):
         self.target = target
 
         self.pkgmanifest = {}
-        manifest = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),
-                d.getVar("IMAGE_LINK_NAME", True) + ".manifest")
-        nomanifest = d.getVar("IMAGE_NO_MANIFEST", True)
+        manifest = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"),
+                d.getVar("IMAGE_LINK_NAME") + ".manifest")
+        nomanifest = d.getVar("IMAGE_NO_MANIFEST")
         if nomanifest is None or nomanifest != "1":
             try:
                 with open(manifest) as f:
@@ -424,19 +424,19 @@ class RuntimeTestContext(TestContext):
     def _get_test_suites(self):
         testsuites = []
 
-        manifests = (self.d.getVar("TEST_SUITES_MANIFEST", True) or '').split()
+        manifests = (self.d.getVar("TEST_SUITES_MANIFEST") or '').split()
         if manifests:
             for manifest in manifests:
                 testsuites.extend(self._read_testlist(manifest,
-                                  self.d.getVar("TOPDIR", True)).split())
+                                  self.d.getVar("TOPDIR")).split())
 
         else:
-            testsuites = self.d.getVar("TEST_SUITES", True).split()
+            testsuites = self.d.getVar("TEST_SUITES").split()
 
         return testsuites
 
     def _get_test_suites_required(self):
-        return [t for t in self.d.getVar("TEST_SUITES", True).split() if t != "auto"]
+        return [t for t in self.d.getVar("TEST_SUITES").split() if t != "auto"]
 
     def loadTests(self):
         super(RuntimeTestContext, self).loadTests()
@@ -449,10 +449,10 @@ class RuntimeTestContext(TestContext):
         """
 
         modules = self.getTestModules()
-        bbpaths = self.d.getVar("BBPATH", True).split(":")
+        bbpaths = self.d.getVar("BBPATH").split(":")
 
-        shutil.rmtree(self.d.getVar("TEST_EXTRACTED_DIR", True))
-        shutil.rmtree(self.d.getVar("TEST_PACKAGED_DIR", True))
+        shutil.rmtree(self.d.getVar("TEST_EXTRACTED_DIR"))
+        shutil.rmtree(self.d.getVar("TEST_PACKAGED_DIR"))
         for module in modules:
             json_file = self._getJsonFile(module)
             if json_file:
@@ -466,8 +466,8 @@ class RuntimeTestContext(TestContext):
 
         import oe.path
 
-        extracted_path = self.d.getVar("TEST_EXTRACTED_DIR", True)
-        packaged_path = self.d.getVar("TEST_PACKAGED_DIR", True)
+        extracted_path = self.d.getVar("TEST_EXTRACTED_DIR")
+        packaged_path = self.d.getVar("TEST_PACKAGED_DIR")
 
         for key,value in needed_packages.items():
             packages = ()
@@ -548,7 +548,7 @@ class RuntimeTestContext(TestContext):
 
         from oeqa.utils.package_manager import get_package_manager
 
-        pkg_path = os.path.join(self.d.getVar("TEST_INSTALL_TMP_DIR", True), pkg)
+        pkg_path = os.path.join(self.d.getVar("TEST_INSTALL_TMP_DIR"), pkg)
         pm = get_package_manager(self.d, pkg_path)
         extract_dir = pm.extract(pkg)
         shutil.rmtree(pkg_path)
@@ -562,8 +562,8 @@ class RuntimeTestContext(TestContext):
 
         from oeqa.utils.package_manager import get_package_manager
 
-        pkg_path = os.path.join(self.d.getVar("TEST_INSTALL_TMP_DIR", True), pkg)
-        dst_dir = self.d.getVar("TEST_PACKAGED_DIR", True)
+        pkg_path = os.path.join(self.d.getVar("TEST_INSTALL_TMP_DIR"), pkg)
+        dst_dir = self.d.getVar("TEST_PACKAGED_DIR")
         pm = get_package_manager(self.d, pkg_path)
         pkg_info = pm.package_info(pkg)
         file_path = pkg_info[pkg]["filepath"]
@@ -611,7 +611,7 @@ class ImageTestContext(RuntimeTestContext):
     def __init__(self, d, target, host_dumper):
         super(ImageTestContext, self).__init__(d, target)
 
-        self.tagexp = d.getVar("TEST_SUITES_TAGS", True)
+        self.tagexp = d.getVar("TEST_SUITES_TAGS")
 
         self.host_dumper = host_dumper
 
@@ -629,7 +629,7 @@ class ImageTestContext(RuntimeTestContext):
         Check if the test requires a package and Install/Unistall it in the DUT
         """
 
-        pkg_dir = self.d.getVar("TEST_EXTRACTED_DIR", True)
+        pkg_dir = self.d.getVar("TEST_EXTRACTED_DIR")
         super(ImageTestContext, self).install_uninstall_packages(test_id, pkg_dir, install)
 
 class ExportTestContext(RuntimeTestContext):
@@ -643,7 +643,7 @@ class ExportTestContext(RuntimeTestContext):
         super(ExportTestContext, self).__init__(d, target, exported)
 
         tag = parsedArgs.get("tag", None)
-        self.tagexp = tag if tag != None else d.getVar("TEST_SUITES_TAGS", True)
+        self.tagexp = tag if tag != None else d.getVar("TEST_SUITES_TAGS")
 
         self.sigterm = None
 
@@ -653,7 +653,7 @@ class ExportTestContext(RuntimeTestContext):
         """
 
         export_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
-        extracted_dir = self.d.getVar("TEST_EXPORT_EXTRACTED_DIR", True)
+        extracted_dir = self.d.getVar("TEST_EXPORT_EXTRACTED_DIR")
         pkg_dir = os.path.join(export_dir, extracted_dir)
         super(ExportTestContext, self).install_uninstall_packages(test_id, pkg_dir, install)
 
@@ -666,7 +666,7 @@ class SDKTestContext(TestContext):
         self.tcname = tcname
 
         if not hasattr(self, 'target_manifest'):
-            self.target_manifest = d.getVar("SDK_TARGET_MANIFEST", True)
+            self.target_manifest = d.getVar("SDK_TARGET_MANIFEST")
         try:
             self.pkgmanifest = {}
             with open(self.target_manifest) as f:
@@ -677,7 +677,7 @@ class SDKTestContext(TestContext):
             bb.fatal("No package manifest file found. Did you build the sdk image?\n%s" % e)
 
         if not hasattr(self, 'host_manifest'):
-            self.host_manifest = d.getVar("SDK_HOST_MANIFEST", True)
+            self.host_manifest = d.getVar("SDK_HOST_MANIFEST")
         try:
             with open(self.host_manifest) as f:
                 self.hostpkgmanifest = f.read()
@@ -688,16 +688,16 @@ class SDKTestContext(TestContext):
         return "sdk"
 
     def _get_test_suites(self):
-        return (self.d.getVar("TEST_SUITES_SDK", True) or "auto").split()
+        return (self.d.getVar("TEST_SUITES_SDK") or "auto").split()
 
     def _get_test_suites_required(self):
-        return [t for t in (self.d.getVar("TEST_SUITES_SDK", True) or \
+        return [t for t in (self.d.getVar("TEST_SUITES_SDK") or \
                 "auto").split() if t != "auto"]
 
 class SDKExtTestContext(SDKTestContext):
     def __init__(self, d, sdktestdir, sdkenv, tcname, *args):
-        self.target_manifest = d.getVar("SDK_EXT_TARGET_MANIFEST", True)
-        self.host_manifest = d.getVar("SDK_EXT_HOST_MANIFEST", True)
+        self.target_manifest = d.getVar("SDK_EXT_TARGET_MANIFEST")
+        self.host_manifest = d.getVar("SDK_EXT_HOST_MANIFEST")
         if args:
             self.cm = args[0] # Compatibility mode for run SDK tests
         else:
@@ -715,8 +715,8 @@ class SDKExtTestContext(SDKTestContext):
             return "sdkext"
 
     def _get_test_suites(self):
-        return (self.d.getVar("TEST_SUITES_SDK_EXT", True) or "auto").split()
+        return (self.d.getVar("TEST_SUITES_SDK_EXT") or "auto").split()
 
     def _get_test_suites_required(self):
-        return [t for t in (self.d.getVar("TEST_SUITES_SDK_EXT", True) or \
+        return [t for t in (self.d.getVar("TEST_SUITES_SDK_EXT") or \
                 "auto").split() if t != "auto"]
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index 7e245c4..9cfea0f 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -43,8 +43,8 @@ class FakeTarget(object):
         self.ip = None
         self.server_ip = None
         self.datetime = time.strftime('%Y%m%d%H%M%S',time.gmtime())
-        self.testdir = d.getVar("TEST_LOG_DIR", True)
-        self.pn = d.getVar("PN", True)
+        self.testdir = d.getVar("TEST_LOG_DIR")
+        self.pn = d.getVar("PN")
 
     def exportStart(self):
         self.sshlog = os.path.join(self.testdir, "ssh_target_log.%s" % self.datetime)
@@ -130,8 +130,8 @@ def extract_sdk(d):
     """
 
     export_dir = os.path.dirname(os.path.realpath(__file__))
-    tools_dir = d.getVar("TEST_EXPORT_SDK_DIR", True)
-    tarball_name = "%s.sh" % d.getVar("TEST_EXPORT_SDK_NAME", True)
+    tools_dir = d.getVar("TEST_EXPORT_SDK_DIR")
+    tarball_name = "%s.sh" % d.getVar("TEST_EXPORT_SDK_NAME")
     tarball_path = os.path.join(export_dir, tools_dir, tarball_name)
     extract_path = os.path.join(export_dir, "sysroot")
     if os.path.isfile(tarball_path):
diff --git a/meta/lib/oeqa/runtime/_ptest.py b/meta/lib/oeqa/runtime/_ptest.py
index 71324d3..cfb4041 100644
--- a/meta/lib/oeqa/runtime/_ptest.py
+++ b/meta/lib/oeqa/runtime/_ptest.py
@@ -13,7 +13,7 @@ def setUpModule():
         skipModule("Image doesn't have package management feature")
     if not oeRuntimeTest.hasPackage("smartpm"):
         skipModule("Image doesn't have smart installed")
-    if "package_rpm" != oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES", True).split()[0]:
+    if "package_rpm" != oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES").split()[0]:
         skipModule("Rpm is not the primary package manager")
 
 class PtestRunnerTest(oeRuntimeTest):
@@ -57,7 +57,7 @@ class PtestRunnerTest(oeRuntimeTest):
 #        (status, result) = oeRuntimeTest.tc.target.run('smart channel --show | grep "\["', 0)
 #        for x in result.split("\n"):
 #            self.existingchannels.add(x)
-        self.repo_server = HTTPService(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True), oeRuntimeTest.tc.target.server_ip)
+        self.repo_server = HTTPService(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR'), oeRuntimeTest.tc.target.server_ip)
         self.repo_server.start()
 
     @classmethod
@@ -70,23 +70,23 @@ class PtestRunnerTest(oeRuntimeTest):
 #                oeRuntimeTest.tc.target.run('smart channel --remove '+x[1:-1]+' -y', 0)
 
     def add_smart_channel(self):
-        image_pkgtype = self.tc.d.getVar('IMAGE_PKGTYPE', True)
+        image_pkgtype = self.tc.d.getVar('IMAGE_PKGTYPE')
         deploy_url = 'http://%s:%s/%s' %(self.target.server_ip, self.repo_server.port, image_pkgtype)
-        pkgarchs = self.tc.d.getVar('PACKAGE_ARCHS', True).replace("-","_").split()
+        pkgarchs = self.tc.d.getVar('PACKAGE_ARCHS').replace("-","_").split()
         for arch in os.listdir('%s/%s' % (self.repo_server.root_dir, image_pkgtype)):
             if arch in pkgarchs:
                 self.target.run('smart channel -y --add {a} type=rpm-md baseurl={u}/{a}'.format(a=arch, u=deploy_url), 0)
         self.target.run('smart update', 0)
 
     def install_complementary(self, globs=None):
-        installed_pkgs_file = os.path.join(oeRuntimeTest.tc.d.getVar('WORKDIR', True),
+        installed_pkgs_file = os.path.join(oeRuntimeTest.tc.d.getVar('WORKDIR'),
                                            "installed_pkgs.txt")
-        self.pkgs_list = RpmPkgsList(oeRuntimeTest.tc.d, oeRuntimeTest.tc.d.getVar('IMAGE_ROOTFS', True), oeRuntimeTest.tc.d.getVar('arch_var', True), oeRuntimeTest.tc.d.getVar('os_var', True))
+        self.pkgs_list = RpmPkgsList(oeRuntimeTest.tc.d, oeRuntimeTest.tc.d.getVar('IMAGE_ROOTFS'), oeRuntimeTest.tc.d.getVar('arch_var'), oeRuntimeTest.tc.d.getVar('os_var'))
         with open(installed_pkgs_file, "w+") as installed_pkgs:
             installed_pkgs.write(self.pkgs_list.list("arch"))
 
         cmd = [bb.utils.which(os.getenv('PATH'), "oe-pkgdata-util"),
-               "-p", oeRuntimeTest.tc.d.getVar('PKGDATA_DIR', True), "glob", installed_pkgs_file,
+               "-p", oeRuntimeTest.tc.d.getVar('PKGDATA_DIR'), "glob", installed_pkgs_file,
                globs]
         try:
             bb.note("Installing complementary packages ...")
@@ -99,7 +99,7 @@ class PtestRunnerTest(oeRuntimeTest):
         return complementary_pkgs.split()
 
     def setUpLocal(self):
-        self.ptest_log = os.path.join(oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR",True), "ptest-%s.log" % oeRuntimeTest.tc.d.getVar('DATETIME', True))
+        self.ptest_log = os.path.join(oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR",True), "ptest-%s.log" % oeRuntimeTest.tc.d.getVar('DATETIME'))
 
     @skipUnlessPassed('test_ssh')
     def test_ptestrunner(self):
diff --git a/meta/lib/oeqa/runtime/date.py b/meta/lib/oeqa/runtime/date.py
index 447987e..6f3516a 100644
--- a/meta/lib/oeqa/runtime/date.py
+++ b/meta/lib/oeqa/runtime/date.py
@@ -5,11 +5,11 @@ import re
 class DateTest(oeRuntimeTest):
 
     def setUpLocal(self):
-        if oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", True) == "systemd":
+        if oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager") == "systemd":
             self.target.run('systemctl stop systemd-timesyncd')
 
     def tearDownLocal(self):
-        if oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", True) == "systemd":
+        if oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager") == "systemd":
             self.target.run('systemctl start systemd-timesyncd')
 
     @testcase(211)
diff --git a/meta/lib/oeqa/runtime/multilib.py b/meta/lib/oeqa/runtime/multilib.py
index 593d385..5cce24f 100644
--- a/meta/lib/oeqa/runtime/multilib.py
+++ b/meta/lib/oeqa/runtime/multilib.py
@@ -3,7 +3,7 @@ from oeqa.oetest import oeRuntimeTest, skipModule
 from oeqa.utils.decorators import *
 
 def setUpModule():
-    multilibs = oeRuntimeTest.tc.d.getVar("MULTILIBS", True) or ""
+    multilibs = oeRuntimeTest.tc.d.getVar("MULTILIBS") or ""
     if "multilib:lib32" not in multilibs:
         skipModule("this isn't a multilib:lib32 image")
 
diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 58f62da..7e2738b 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -179,10 +179,10 @@ class ParseLogsTest(oeRuntimeTest):
                 self.ignore_errors[machine] = self.ignore_errors[machine] + video_related
 
     def getMachine(self):
-        return oeRuntimeTest.tc.d.getVar("MACHINE", True)
+        return oeRuntimeTest.tc.d.getVar("MACHINE")
 
     def getWorkdir(self):
-        return oeRuntimeTest.tc.d.getVar("WORKDIR", True)
+        return oeRuntimeTest.tc.d.getVar("WORKDIR")
 
     #get some information on the CPU of the machine to display at the beginning of the output. This info might be useful in some cases.
     def getHardwareInfo(self):
diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
index 7f514ca..f1c4763 100644
--- a/meta/lib/oeqa/runtime/rpm.py
+++ b/meta/lib/oeqa/runtime/rpm.py
@@ -7,7 +7,7 @@ from oeqa.utils.decorators import *
 def setUpModule():
     if not oeRuntimeTest.hasFeature("package-management"):
             skipModule("rpm module skipped: target doesn't have package-management in IMAGE_FEATURES")
-    if "package_rpm" != oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES", True).split()[0]:
+    if "package_rpm" != oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES").split()[0]:
             skipModule("rpm module skipped: target doesn't have rpm as primary package manager")
 
 
@@ -29,8 +29,8 @@ class RpmInstallRemoveTest(oeRuntimeTest):
 
     @classmethod
     def setUpClass(self):
-        pkgarch = oeRuntimeTest.tc.d.getVar('TUNE_PKGARCH', True).replace("-", "_")
-        rpmdir = os.path.join(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True), "rpm", pkgarch)
+        pkgarch = oeRuntimeTest.tc.d.getVar('TUNE_PKGARCH').replace("-", "_")
+        rpmdir = os.path.join(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR'), "rpm", pkgarch)
         # pick rpm-doc as a test file to get installed, because it's small and it will always be built for standard targets
         for f in fnmatch.filter(os.listdir(rpmdir), "rpm-doc-*.%s.rpm" % pkgarch):
             testrpmfile = f
diff --git a/meta/lib/oeqa/runtime/scp.py b/meta/lib/oeqa/runtime/scp.py
index 48e87d2..cf36cfa 100644
--- a/meta/lib/oeqa/runtime/scp.py
+++ b/meta/lib/oeqa/runtime/scp.py
@@ -11,7 +11,7 @@ class ScpTest(oeRuntimeTest):
     @testcase(220)
     @skipUnlessPassed('test_ssh')
     def test_scp_file(self):
-        test_log_dir = oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR", True)
+        test_log_dir = oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR")
         test_file_path = os.path.join(test_log_dir, 'test_scp_file')
         with open(test_file_path, 'w') as test_scp_file:
             test_scp_file.seek(2 ** 22 - 1)
diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index 6cdb10d..dde1c4d 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -11,7 +11,7 @@ def setUpModule():
         skipModule("Image doesn't have package management feature")
     if not oeRuntimeTest.hasPackage("smartpm"):
         skipModule("Image doesn't have smart installed")
-    if "package_rpm" != oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES", True).split()[0]:
+    if "package_rpm" != oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES").split()[0]:
         skipModule("Rpm is not the primary package manager")
 
 class SmartTest(oeRuntimeTest):
@@ -75,16 +75,16 @@ class SmartRepoTest(SmartTest):
         rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
         index_cmds = []
         rpm_dirs_found = False
-        archs = (oeRuntimeTest.tc.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").replace('-', '_').split()
+        archs = (oeRuntimeTest.tc.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS') or "").replace('-', '_').split()
         for arch in archs:
-            rpm_dir = os.path.join(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR_RPM', True), arch)
-            idx_path = os.path.join(oeRuntimeTest.tc.d.getVar('WORKDIR', True), 'rpm', arch)
-            db_path = os.path.join(oeRuntimeTest.tc.d.getVar('WORKDIR', True), 'rpmdb', arch)
+            rpm_dir = os.path.join(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR_RPM'), arch)
+            idx_path = os.path.join(oeRuntimeTest.tc.d.getVar('WORKDIR'), 'rpm', arch)
+            db_path = os.path.join(oeRuntimeTest.tc.d.getVar('WORKDIR'), 'rpmdb', arch)
             if not os.path.isdir(rpm_dir):
                 continue
             if os.path.exists(db_path):
                 bb.utils.remove(dbpath, True)
-            lockfilename = oeRuntimeTest.tc.d.getVar('DEPLOY_DIR_RPM', True) + "/rpm.lock"
+            lockfilename = oeRuntimeTest.tc.d.getVar('DEPLOY_DIR_RPM') + "/rpm.lock"
             lf = bb.utils.lockfile(lockfilename, False)
             oe.path.copyhardlinktree(rpm_dir, idx_path)
             # Full indexes overload a 256MB image so reduce the number of rpms
@@ -98,7 +98,7 @@ class SmartRepoTest(SmartTest):
         result = oe.utils.multiprocess_exec(index_cmds, self.create_index)
         if result:
             bb.fatal('%s' % ('\n'.join(result)))
-        self.repo_server = HTTPService(oeRuntimeTest.tc.d.getVar('WORKDIR', True), oeRuntimeTest.tc.target.server_ip)
+        self.repo_server = HTTPService(oeRuntimeTest.tc.d.getVar('WORKDIR'), oeRuntimeTest.tc.target.server_ip)
         self.repo_server.start()
 
     @classmethod
@@ -113,9 +113,9 @@ class SmartRepoTest(SmartTest):
 
     @testcase(719)
     def test_smart_channel_add(self):
-        image_pkgtype = self.tc.d.getVar('IMAGE_PKGTYPE', True)
+        image_pkgtype = self.tc.d.getVar('IMAGE_PKGTYPE')
         deploy_url = 'http://%s:%s/%s' %(self.target.server_ip, self.repo_server.port, image_pkgtype)
-        pkgarchs = self.tc.d.getVar('PACKAGE_ARCHS', True).replace("-","_").split()
+        pkgarchs = self.tc.d.getVar('PACKAGE_ARCHS').replace("-","_").split()
         for arch in os.listdir('%s/%s' % (self.repo_server.root_dir, image_pkgtype)):
             if arch in pkgarchs:
                 self.smart('channel -y --add {a} type=rpm-md baseurl={u}/{a}'.format(a=arch, u=deploy_url))
diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index 8de799c..52feb1b 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -6,7 +6,7 @@ from oeqa.utils.decorators import *
 def setUpModule():
     if not oeRuntimeTest.hasFeature("systemd"):
             skipModule("target doesn't have systemd in DISTRO_FEATURES")
-    if "systemd" != oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", True):
+    if "systemd" != oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"):
             skipModule("systemd is not the init manager for this image")
 
 
diff --git a/meta/lib/oeqa/runtime/x32lib.py b/meta/lib/oeqa/runtime/x32lib.py
index ce5e214..2f98dbf 100644
--- a/meta/lib/oeqa/runtime/x32lib.py
+++ b/meta/lib/oeqa/runtime/x32lib.py
@@ -4,7 +4,7 @@ from oeqa.utils.decorators import *
 
 def setUpModule():
         #check if DEFAULTTUNE is set and it's value is: x86-64-x32
-        defaulttune = oeRuntimeTest.tc.d.getVar("DEFAULTTUNE", True)
+        defaulttune = oeRuntimeTest.tc.d.getVar("DEFAULTTUNE")
         if "x86-64-x32" not in defaulttune:
             skipModule("DEFAULTTUNE is not set to x86-64-x32")
 
diff --git a/meta/lib/oeqa/sdk/gcc.py b/meta/lib/oeqa/sdk/gcc.py
index 8395b9b..f3f4341 100644
--- a/meta/lib/oeqa/sdk/gcc.py
+++ b/meta/lib/oeqa/sdk/gcc.py
@@ -5,7 +5,7 @@ from oeqa.oetest import oeSDKTest, skipModule
 from oeqa.utils.decorators import *
 
 def setUpModule():
-    machine = oeSDKTest.tc.d.getVar("MACHINE", True)
+    machine = oeSDKTest.tc.d.getVar("MACHINE")
     if not oeSDKTest.hasHostPackage("packagegroup-cross-canadian-" + machine):
         skipModule("SDK doesn't contain a cross-canadian toolchain")
 
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 24669f4..d1f441f 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -19,7 +19,7 @@ from oeqa.controllers.testtargetloader import TestTargetLoader
 from abc import ABCMeta, abstractmethod
 
 def get_target_controller(d):
-    testtarget = d.getVar("TEST_TARGET", True)
+    testtarget = d.getVar("TEST_TARGET")
     # old, simple names
     if testtarget == "qemu":
         return QemuTarget(d)
@@ -33,7 +33,7 @@ def get_target_controller(d):
         except AttributeError:
             # nope, perhaps a layer defined one
             try:
-                bbpath = d.getVar("BBPATH", True).split(':')
+                bbpath = d.getVar("BBPATH").split(':')
                 testtargetloader = TestTargetLoader()
                 controller = testtargetloader.get_controller_module(testtarget, bbpath)
             except ImportError as e:
@@ -51,9 +51,9 @@ class BaseTarget(object, metaclass=ABCMeta):
         self.connection = None
         self.ip = None
         self.server_ip = None
-        self.datetime = d.getVar('DATETIME', True)
-        self.testdir = d.getVar("TEST_LOG_DIR", True)
-        self.pn = d.getVar("PN", True)
+        self.datetime = d.getVar('DATETIME')
+        self.testdir = d.getVar("TEST_LOG_DIR")
+        self.pn = d.getVar("PN")
 
     @abstractmethod
     def deploy(self):
@@ -80,7 +80,7 @@ class BaseTarget(object, metaclass=ABCMeta):
     @classmethod
     def match_image_fstype(self, d, image_fstypes=None):
         if not image_fstypes:
-            image_fstypes = d.getVar('IMAGE_FSTYPES', True).split(' ')
+            image_fstypes = d.getVar('IMAGE_FSTYPES').split(' ')
         possible_image_fstypes = [fstype for fstype in self.supported_image_fstypes if fstype in image_fstypes]
         if possible_image_fstypes:
             return possible_image_fstypes[0]
@@ -119,14 +119,14 @@ class QemuTarget(BaseTarget):
 
         self.image_fstype = self.get_image_fstype(d)
         self.qemulog = os.path.join(self.testdir, "qemu_boot_log.%s" % self.datetime)
-        self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
-        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
-        dump_target_cmds = d.getVar("testimage_dump_target", True)
-        dump_host_cmds = d.getVar("testimage_dump_host", True)
-        dump_dir = d.getVar("TESTIMAGE_DUMP_DIR", True)
+        self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"),  d.getVar("IMAGE_LINK_NAME") + '.' + self.image_fstype)
+        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
+        dump_target_cmds = d.getVar("testimage_dump_target")
+        dump_host_cmds = d.getVar("testimage_dump_host")
+        dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
         if d.getVar("QEMU_USE_KVM", False) is not None \
            and d.getVar("QEMU_USE_KVM", False) == "True" \
-           and "x86" in d.getVar("MACHINE", True):
+           and "x86" in d.getVar("MACHINE"):
             use_kvm = True
         else:
             use_kvm = False
@@ -141,26 +141,26 @@ class QemuTarget(BaseTarget):
         logger.addHandler(loggerhandler)
         oe.path.symlink(os.path.basename(self.qemurunnerlog), os.path.join(self.testdir, 'qemurunner_log'), force=True)
 
-        if d.getVar("DISTRO", True) == "poky-tiny":
-            self.runner = QemuTinyRunner(machine=d.getVar("MACHINE", True),
+        if d.getVar("DISTRO") == "poky-tiny":
+            self.runner = QemuTinyRunner(machine=d.getVar("MACHINE"),
                             rootfs=self.rootfs,
-                            tmpdir = d.getVar("TMPDIR", True),
-                            deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE", True),
-                            display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True),
+                            tmpdir = d.getVar("TMPDIR"),
+                            deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE"),
+                            display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY"),
                             logfile = self.qemulog,
                             kernel = self.kernel,
-                            boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT", True)))
+                            boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT")))
         else:
-            self.runner = QemuRunner(machine=d.getVar("MACHINE", True),
+            self.runner = QemuRunner(machine=d.getVar("MACHINE"),
                             rootfs=self.rootfs,
-                            tmpdir = d.getVar("TMPDIR", True),
-                            deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE", True),
-                            display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True),
+                            tmpdir = d.getVar("TMPDIR"),
+                            deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE"),
+                            display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY"),
                             logfile = self.qemulog,
-                            boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT", True)),
+                            boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT")),
                             use_kvm = use_kvm,
                             dump_dir = dump_dir,
-                            dump_host_cmds = d.getVar("testimage_dump_host", True))
+                            dump_host_cmds = d.getVar("testimage_dump_host"))
 
         self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
 
@@ -214,14 +214,14 @@ class SimpleRemoteTarget(BaseTarget):
 
     def __init__(self, d):
         super(SimpleRemoteTarget, self).__init__(d)
-        addr = d.getVar("TEST_TARGET_IP", True) or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
+        addr = d.getVar("TEST_TARGET_IP") or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
         self.ip = addr.split(":")[0]
         try:
             self.port = addr.split(":")[1]
         except IndexError:
             self.port = None
         bb.note("Target IP: %s" % self.ip)
-        self.server_ip = d.getVar("TEST_SERVER_IP", True)
+        self.server_ip = d.getVar("TEST_SERVER_IP")
         if not self.server_ip:
             try:
                 self.server_ip = subprocess.check_output(['ip', 'route', 'get', self.ip ]).split("\n")[0].split()[-1]
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 5cd0f74..53777e6 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -231,7 +231,7 @@ def runqemu(pn, ssh=True):
         logger = logging.getLogger('BitBake.QemuRunner')
         logger.setLevel(logging.DEBUG)
         logger.propagate = False
-        logdir = recipedata.getVar("TEST_LOG_DIR", True)
+        logdir = recipedata.getVar("TEST_LOG_DIR")
 
         qemu = oeqa.targetcontrol.QemuTarget(recipedata)
     finally:
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 71422a9..44037a9 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -6,8 +6,8 @@ import itertools
 from .commands import runCmd
 
 def get_host_dumper(d):
-    cmds = d.getVar("testimage_dump_host", True)
-    parent_dir = d.getVar("TESTIMAGE_DUMP_DIR", True)
+    cmds = d.getVar("testimage_dump_host")
+    parent_dir = d.getVar("TESTIMAGE_DUMP_DIR")
     return HostDumper(cmds, parent_dir)
 
 
diff --git a/meta/lib/oeqa/utils/package_manager.py b/meta/lib/oeqa/utils/package_manager.py
index 099ecc9..0f6bdbc 100644
--- a/meta/lib/oeqa/utils/package_manager.py
+++ b/meta/lib/oeqa/utils/package_manager.py
@@ -4,24 +4,24 @@ def get_package_manager(d, root_path):
     """
     from oe.package_manager import RpmPM, OpkgPM, DpkgPM
 
-    pkg_class = d.getVar("IMAGE_PKGTYPE", True)
+    pkg_class = d.getVar("IMAGE_PKGTYPE")
     if pkg_class == "rpm":
         pm = RpmPM(d,
                    root_path,
-                   d.getVar('TARGET_VENDOR', True))
+                   d.getVar('TARGET_VENDOR'))
         pm.create_configs()
 
     elif pkg_class == "ipk":
         pm = OpkgPM(d,
                     root_path,
-                    d.getVar("IPKGCONF_TARGET", True),
-                    d.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True))
+                    d.getVar("IPKGCONF_TARGET"),
+                    d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"))
 
     elif pkg_class == "deb":
         pm = DpkgPM(d,
                     root_path,
-                    d.getVar('PACKAGE_ARCHS', True),
-                    d.getVar('DPKG_ARCH', True))
+                    d.getVar('PACKAGE_ARCHS'),
+                    d.getVar('DPKG_ARCH'))
 
     pm.write_index()
     pm.update()
diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 59593f5..c001602 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -25,7 +25,7 @@ class BuildProject(metaclass=ABCMeta):
     # Download self.archive to self.localarchive
     def _download_archive(self):
 
-        dl_dir = self.d.getVar("DL_DIR", True)
+        dl_dir = self.d.getVar("DL_DIR")
         if dl_dir and os.path.exists(os.path.join(dl_dir, self.archive)):
             bb.utils.copyfile(os.path.join(dl_dir, self.archive), self.localarchive)
             return
@@ -40,7 +40,7 @@ class BuildProject(metaclass=ABCMeta):
 
         cmd = ''
         for var in exportvars:
-            val = self.d.getVar(var, True)
+            val = self.d.getVar(var)
             if val:
                 cmd = 'export ' + var + '=\"%s\"; %s' % (val, cmd)
 
@@ -103,8 +103,8 @@ class SDKBuildProject(BuildProject):
         self.testdir = testpath
         self.targetdir = testpath
         bb.utils.mkdirhier(testpath)
-        self.datetime = d.getVar('DATETIME', True)
-        self.testlogdir = d.getVar("TEST_LOG_DIR", True)
+        self.datetime = d.getVar('DATETIME')
+        self.testlogdir = d.getVar("TEST_LOG_DIR")
         bb.utils.mkdirhier(self.testlogdir)
         self.logfile = os.path.join(self.testlogdir, "sdk_target_log.%s" % self.datetime)
         BuildProject.__init__(self, d, uri, foldername, tmpdir=testpath)
diff --git a/meta/lib/oeqa/utils/testexport.py b/meta/lib/oeqa/utils/testexport.py
index 57be2ca..be2a211 100644
--- a/meta/lib/oeqa/utils/testexport.py
+++ b/meta/lib/oeqa/utils/testexport.py
@@ -72,9 +72,9 @@ def process_binaries(d, params):
         return extract_bin_command
 
     if determine_if_poky_env(): # machine with poky environment
-        exportpath = d.getVar("TEST_EXPORT_DIR", True) if export_env else d.getVar("DEPLOY_DIR", True)
-        rpm_deploy_dir = d.getVar("DEPLOY_DIR_RPM", True)
-        arch = get_dest_folder(d.getVar("TUNE_FEATURES", True), os.listdir(rpm_deploy_dir))
+        exportpath = d.getVar("TEST_EXPORT_DIR") if export_env else d.getVar("DEPLOY_DIR")
+        rpm_deploy_dir = d.getVar("DEPLOY_DIR_RPM")
+        arch = get_dest_folder(d.getVar("TUNE_FEATURES"), os.listdir(rpm_deploy_dir))
         arch_rpm_dir = os.path.join(rpm_deploy_dir, arch)
         extracted_bin_dir = os.path.join(exportpath,"binaries", arch, "extracted_binaries")
         packaged_bin_dir = os.path.join(exportpath,"binaries", arch, "packaged_binaries")
@@ -92,7 +92,7 @@ def process_binaries(d, params):
                     return ""
                 for item in native_rpm_file_list:# will copy all versions of package. Used version will be selected on remote machine
                     bb.plain("Copying native package file: %s" % item)
-                    sh.copy(os.path.join(rpm_deploy_dir, native_rpm_dir, item), os.path.join(d.getVar("TEST_EXPORT_DIR", True), "binaries", "native"))
+                    sh.copy(os.path.join(rpm_deploy_dir, native_rpm_dir, item), os.path.join(d.getVar("TEST_EXPORT_DIR"), "binaries", "native"))
             else: # nothing to do here; running tests under bitbake, so we asume native binaries are in sysroots dir.
                 if param_list[1] or param_list[4]:
                     bb.warn("Native binary %s %s%s. Running tests under bitbake environment. Version can't be checked except when the test itself does it"
@@ -148,7 +148,7 @@ def process_binaries(d, params):
         else: # this is for target device
             if param_list[2] == "rpm":
                 return "No need to extract, this is an .rpm file"
-            arch = get_dest_folder(d.getVar("TUNE_FEATURES", True), os.listdir(binaries_path))
+            arch = get_dest_folder(d.getVar("TUNE_FEATURES"), os.listdir(binaries_path))
             extracted_bin_path = os.path.join(binaries_path, arch, "extracted_binaries")
             extracted_bin_list = [item for item in os.listdir(extracted_bin_path)]
             packaged_bin_path = os.path.join(binaries_path, arch, "packaged_binaries")
@@ -206,9 +206,9 @@ def send_bin_to_DUT(d,params):
     from oeqa.oetest import oeRuntimeTest
     param_list = params
     cleanup_list = list()
-    bins_dir = os.path.join(d.getVar("TEST_EXPORT_DIR", True), "binaries") if determine_if_poky_env() \
+    bins_dir = os.path.join(d.getVar("TEST_EXPORT_DIR"), "binaries") if determine_if_poky_env() \
                     else os.getenv("bin_dir")
-    arch = get_dest_folder(d.getVar("TUNE_FEATURES", True), os.listdir(bins_dir))
+    arch = get_dest_folder(d.getVar("TUNE_FEATURES"), os.listdir(bins_dir))
     arch_rpms_dir = os.path.join(bins_dir, arch, "packaged_binaries")
     extracted_bin_dir = os.path.join(bins_dir, arch, "extracted_binaries", param_list[0])
 
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
index e0d8ee7..9ddc4ba 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
@@ -27,7 +27,7 @@ COMPATIBLE_HOST_armv4 = 'null'
 
 def gnu_efi_arch(d):
     import re
-    tarch = d.getVar("TARGET_ARCH", True)
+    tarch = d.getVar("TARGET_ARCH")
     if re.match("i[3456789]86", tarch):
         return "ia32"
     return tarch
diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index 5a0dc95..531482b 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/grub-${PV}"
 # Determine the target arch for the grub modules
 python __anonymous () {
     import re
-    target = d.getVar('TARGET_ARCH', True)
+    target = d.getVar('TARGET_ARCH')
     if target == "x86_64":
         grubtarget = 'x86_64'
         grubimage = "bootx64.efi"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index afe3fe9..4a55fd6 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -42,7 +42,7 @@ UBOOT_ELF_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_ELF_SUFFIX}"
 # deploy directory.  For those versions they can set the following variables
 # to allow packaging the SPL.
 SPL_BINARY ?= ""
-SPL_BINARYNAME ?= "${@os.path.basename(d.getVar("SPL_BINARY", True))}"
+SPL_BINARYNAME ?= "${@os.path.basename(d.getVar("SPL_BINARY"))}"
 SPL_IMAGE ?= "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}"
 SPL_SYMLINK ?= "${SPL_BINARYNAME}-${MACHINE}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index ecefb7b..55a5055 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -95,13 +95,13 @@ FILES_${PN}-testtools = "${libdir}/bluez/test/*"
 
 def get_noinst_tools_paths (d, bb, tools):
     s = list()
-    bindir = d.getVar("bindir", True)
+    bindir = d.getVar("bindir")
     for bdp in tools.split():
         f = os.path.basename(bdp)
         s.append("%s/%s" % (bindir, f))
     return "\n".join(s)
 
-FILES_${PN}-noinst-tools = "${@get_noinst_tools_paths(d, bb, d.getVar('NOINST_TOOLS', True))}"
+FILES_${PN}-noinst-tools = "${@get_noinst_tools_paths(d, bb, d.getVar('NOINST_TOOLS'))}"
 
 RDEPENDS_${PN}-testtools += "python3 python3-dbus python3-pygobject"
 
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 35a7eed..7fa9a7b 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -58,7 +58,7 @@ INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
 python __anonymous () {
     systemd_packages = "${PN}"
-    pkgconfig = d.getVar('PACKAGECONFIG', True)
+    pkgconfig = d.getVar('PACKAGECONFIG')
     if ('openvpn' or 'vpnc' or 'l2tp' or 'pptp') in pkgconfig.split():
         systemd_packages += " ${PN}-vpn"
     d.setVar('SYSTEMD_PACKAGES', systemd_packages)
@@ -116,7 +116,7 @@ def add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, add_insane_skip):
 
 python populate_packages_prepend() {
     depmap = dict(pppd="ppp")
-    multilib_prefix = (d.getVar("MLPREFIX", True) or "")
+    multilib_prefix = (d.getVar("MLPREFIX") or "")
 
     hook = lambda file,pkg,x,y,z: \
         add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, False)
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 5333110..d138005 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -173,5 +173,5 @@ FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-CONFFILES_${PN} = "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname'][(d.getVar('hostname', True) != '')]} ${sysconfdir}/shells"
+CONFFILES_${PN} = "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname'][(d.getVar('hostname') != '')]} ${sysconfdir}/shells"
 CONFFILES_${PN} += "${sysconfdir}/motd ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile"
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index b2f1960..1f4a48c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -331,21 +331,21 @@ ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
 
 python () {
     if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        pn = d.getVar('PN', True)
+        pn = d.getVar('PN')
         d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-init')
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (d.getVar('sysconfdir', True)))
-        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init', '%s/init.d/syslog.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', True)))
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (d.getVar('sysconfdir')))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init', '%s/init.d/syslog.%s' % (d.getVar('sysconfdir'), d.getVar('BPN')))
         d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-startup-conf')
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-startup-conf', '%s/syslog-startup.conf' % (d.getVar('sysconfdir', True)))
-        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-startup-conf', '%s/syslog-startup.conf.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', True)))
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-startup-conf', '%s/syslog-startup.conf' % (d.getVar('sysconfdir')))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-startup-conf', '%s/syslog-startup.conf.%s' % (d.getVar('sysconfdir'), d.getVar('BPN')))
 }
 
 python do_package_prepend () {
     # We need to load the full set of busybox provides from the /etc/busybox.links
     # Use this to see the update-alternatives with the right information
 
-    dvar = d.getVar('D', True)
-    pn = d.getVar('PN', True)
+    dvar = d.getVar('D')
+    pn = d.getVar('PN')
     def set_alternative_vars(links, target):
         links = d.expand(links)
         target = d.expand(target)
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index df0e131..658c347 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -38,8 +38,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://sha256sum.cfg \
            file://getopts.cfg \
            file://resize.cfg \
-           ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager', True) == 'busybox')]} \
-           ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager', True) == 'busybox-mdev')]} \
+           ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
+           ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
            file://inittab \
            file://rcS \
            file://rcK \
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index c29b894..c2ee3e6 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -40,8 +40,8 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://sha256sum.cfg \
            file://getopts.cfg \
            file://resize.cfg \
-           ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager', True) == 'busybox')]} \
-           ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager', True) == 'busybox-mdev')]} \
+           ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
+           ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
            file://inittab \
            file://rcS \
            file://rcK \
diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 35700a3..9bfbeab 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -99,9 +99,9 @@ ALTERNATIVE_LINK_NAME[lbracket] = "${bindir}/["
 ALTERNATIVE_TARGET[lbracket] = "${bindir}/lbracket.${BPN}"
 
 python __anonymous() {
-	for prog in d.getVar('base_bindir_progs', True).split():
-		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir', True), prog))
+	for prog in d.getVar('base_bindir_progs').split():
+		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir'), prog))
 
-	for prog in d.getVar('sbindir_progs', True).split():
-		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('sbindir', True), prog))
+	for prog in d.getVar('sbindir_progs').split():
+		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('sbindir'), prog))
 }
diff --git a/meta/recipes-core/coreutils/coreutils_8.25.bb b/meta/recipes-core/coreutils/coreutils_8.25.bb
index df6ad38..6d6f7bc 100644
--- a/meta/recipes-core/coreutils/coreutils_8.25.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.25.bb
@@ -132,11 +132,11 @@ ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
 ALTERNATIVE_LINK_NAME[stat.1] = "${mandir}/man1/stat.1"
 
 python __anonymous() {
-	for prog in d.getVar('base_bindir_progs', True).split():
-		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir', True), prog))
+	for prog in d.getVar('base_bindir_progs').split():
+		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir'), prog))
 
-	for prog in d.getVar('sbindir_progs', True).split():
-		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('sbindir', True), prog))
+	for prog in d.getVar('sbindir_progs').split():
+		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('sbindir'), prog))
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-core/glibc/glibc-ld.inc b/meta/recipes-core/glibc/glibc-ld.inc
index e2e2474..547c235 100644
--- a/meta/recipes-core/glibc/glibc-ld.inc
+++ b/meta/recipes-core/glibc/glibc-ld.inc
@@ -1,6 +1,6 @@
 def ld_append_if_tune_exists(d, infos, dict):
-    tune = d.getVar("DEFAULTTUNE", True) or ""
-    libdir = d.getVar("base_libdir", True) or ""
+    tune = d.getVar("DEFAULTTUNE") or ""
+    libdir = d.getVar("base_libdir") or ""
     if tune in dict:
         infos['ldconfig'].add('{"' + libdir + '/' + dict[tune][0] + '",' + dict[tune][1] + ' }')
         infos['lddrewrite'].add(libdir+'/'+dict[tune][0])
@@ -32,7 +32,7 @@ def glibc_dl_info(d):
         localdata.setVar("DEFAULTTUNE", original_tune)
         ld_append_if_tune_exists(localdata, infos, ld_info_all)
 
-    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+    variants = d.getVar("MULTILIB_VARIANTS") or ""
     for item in variants.split():
         localdata = bb.data.createCopy(d)
         overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 0a7adfc..11bd612 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -41,22 +41,22 @@ PACKAGES_DYNAMIC = "^locale-base-.* \
 # Create a glibc-binaries package
 ALLOW_EMPTY_${BPN}-binaries = "1"
 PACKAGES += "${BPN}-binaries"
-RRECOMMENDS_${BPN}-binaries =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("glibc-binary") != -1])}"
+RRECOMMENDS_${BPN}-binaries =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-binary") != -1])}"
 
 # Create a glibc-charmaps package
 ALLOW_EMPTY_${BPN}-charmaps = "1"
 PACKAGES += "${BPN}-charmaps"
-RRECOMMENDS_${BPN}-charmaps =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("glibc-charmap") != -1])}"
+RRECOMMENDS_${BPN}-charmaps =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-charmap") != -1])}"
 
 # Create a glibc-gconvs package
 ALLOW_EMPTY_${BPN}-gconvs = "1"
 PACKAGES += "${BPN}-gconvs"
-RRECOMMENDS_${BPN}-gconvs =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("glibc-gconv") != -1])}"
+RRECOMMENDS_${BPN}-gconvs =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-gconv") != -1])}"
 
 # Create a glibc-localedatas package
 ALLOW_EMPTY_${BPN}-localedatas = "1"
 PACKAGES += "${BPN}-localedatas"
-RRECOMMENDS_${BPN}-localedatas =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("glibc-localedata") != -1])}"
+RRECOMMENDS_${BPN}-localedatas =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-localedata") != -1])}"
 
 DESCRIPTION_localedef = "glibc: compile locale definition files"
 
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index bad6424..481a00e 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -8,10 +8,10 @@
 
 python __anonymous () {
     import bb, re
-    uc_os = (re.match('.*uclibc*', d.getVar('TARGET_OS', True)) != None)
+    uc_os = (re.match('.*uclibc*', d.getVar('TARGET_OS')) != None)
     if uc_os:
         raise bb.parse.SkipPackage("incompatible with target %s" %
-                                   d.getVar('TARGET_OS', True))
+                                   d.getVar('TARGET_OS'))
 }
 
 # Set this to zero if you don't want ldconfig in the output package
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index e85c704..2faee37 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -10,13 +10,13 @@ TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
 
 python () {
     opt_effective = "-O"
-    for opt in d.getVar('SELECTED_OPTIMIZATION', True).split():
+    for opt in d.getVar('SELECTED_OPTIMIZATION').split():
         if opt in ("-O0", "-O", "-O1", "-O2", "-O3", "-Os"):
             opt_effective = opt
     if opt_effective == "-O0":
-        bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVar('PN', True), opt_effective))
+        bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVar('PN'), opt_effective))
     if opt_effective in ("-O", "-O1", "-Os"):
-        bb.note("%s doesn't build cleanly with %s, adding -Wno-error to SELECTED_OPTIMIZATION" % (d.getVar('PN', True), opt_effective))
+        bb.note("%s doesn't build cleanly with %s, adding -Wno-error to SELECTED_OPTIMIZATION" % (d.getVar('PN'), opt_effective))
         d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
 }
 
diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index 59874be..a7221a5 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -52,7 +52,7 @@ EXTRA_OECONF_linuxstdbase = "--with-debug --with-legacy --with-docbook --with-c1
 
 python populate_packages_prepend () {
     # autonamer would call this libxml2-2, but we don't want that
-    if d.getVar('DEBIAN_NAMES', True):
+    if d.getVar('DEBIAN_NAMES'):
         d.setVar('PKG_libxml2', '${MLPREFIX}libxml2')
 }
 
diff --git a/meta/recipes-core/meta/meta-environment-extsdk.bb b/meta/recipes-core/meta/meta-environment-extsdk.bb
index d9e5961..52012cc 100644
--- a/meta/recipes-core/meta/meta-environment-extsdk.bb
+++ b/meta/recipes-core/meta/meta-environment-extsdk.bb
@@ -5,8 +5,8 @@ require meta-environment.bb
 PN = "meta-environment-extsdk-${MACHINE}"
 
 create_sdk_files_append() {
-	local sysroot=${SDKPATH}/${@os.path.relpath(d.getVar('STAGING_DIR_TARGET', True), d.getVar('TOPDIR', True))}
-	local sdkpathnative=${SDKPATH}/${@os.path.relpath(d.getVar('STAGING_DIR_NATIVE',True), d.getVar('TOPDIR', True))}
+	local sysroot=${SDKPATH}/${@os.path.relpath(d.getVar('STAGING_DIR_TARGET'), d.getVar('TOPDIR'))}
+	local sdkpathnative=${SDKPATH}/${@os.path.relpath(d.getVar('STAGING_DIR_NATIVE',True), d.getVar('TOPDIR'))}
 
 	toolchain_create_sdk_env_script '' '' $sysroot '' ${bindir_native} ${prefix_native} $sdkpathnative
 }
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 71e0c23..a250cc8 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -26,16 +26,16 @@ python do_generate_content() {
     localdata = bb.data.createCopy(d)
 
     # make sure we only use the WORKDIR value from 'd', or it can change
-    localdata.setVar('WORKDIR', d.getVar('WORKDIR', True))
+    localdata.setVar('WORKDIR', d.getVar('WORKDIR'))
 
     # make sure we only use the SDKTARGETSYSROOT value from 'd'
-    localdata.setVar('SDKTARGETSYSROOT', d.getVar('SDKTARGETSYSROOT', True))
+    localdata.setVar('SDKTARGETSYSROOT', d.getVar('SDKTARGETSYSROOT'))
     localdata.setVar('libdir', d.getVar('target_libdir', False))
 
     # Process DEFAULTTUNE
     bb.build.exec_func("create_sdk_files", localdata)
 
-    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+    variants = d.getVar("MULTILIB_VARIANTS") or ""
     for item in variants.split():
         # Load overrides from 'd' to avoid having to reset the value...
         overrides = d.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
diff --git a/meta/recipes-core/meta/meta-extsdk-toolchain.bb b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
index 22de0f3..fc6d6de 100644
--- a/meta/recipes-core/meta/meta-extsdk-toolchain.bb
+++ b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
@@ -19,7 +19,7 @@ do_locked_sigs[sstate-outputdirs] = "${STAGING_DIR_HOST}/locked-sigs"
 
 python do_locked_sigs() {
     import oe.copy_buildsystem
-    outdir = os.path.join(d.getVar('LOCKED_SIGS_INDIR', True))
+    outdir = os.path.join(d.getVar('LOCKED_SIGS_INDIR'))
     bb.utils.mkdirhier(outdir)
     sigfile = os.path.join(outdir, 'locked-sigs-extsdk-toolchain.inc')
     oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
diff --git a/meta/recipes-core/meta/meta-world-pkgdata.bb b/meta/recipes-core/meta/meta-world-pkgdata.bb
index 81c8647..0ce378e 100644
--- a/meta/recipes-core/meta/meta-world-pkgdata.bb
+++ b/meta/recipes-core/meta/meta-world-pkgdata.bb
@@ -19,7 +19,7 @@ do_collect_packagedata[sstate-outputdirs] = "${STAGING_DIR_HOST}/world-pkgdata"
 
 python do_collect_packagedata() {
     import oe.copy_buildsystem
-    outdir = os.path.join(d.getVar('WORLD_PKGDATADIR', True))
+    outdir = os.path.join(d.getVar('WORLD_PKGDATADIR'))
     bb.utils.mkdirhier(outdir)
     sigfile = os.path.join(outdir, 'locked-sigs-pkgdata.inc')
     oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index d088c0c..aaa01d0 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -21,23 +21,23 @@ FILES_${PN}-packagefeed = "${sysconfdir}/pki/packagefeed-gpg"
 python do_get_public_keys () {
     from oe.gpg_sign import get_signer
 
-    if d.getVar("RPM_SIGN_PACKAGES", True):
+    if d.getVar("RPM_SIGN_PACKAGES"):
         # Export public key of the rpm signing key
-        signer = get_signer(d, d.getVar('RPM_GPG_BACKEND', True))
+        signer = get_signer(d, d.getVar('RPM_GPG_BACKEND'))
         signer.export_pubkey(os.path.join(d.expand('${B}'), 'rpm-key'),
-                             d.getVar('RPM_GPG_NAME', True))
+                             d.getVar('RPM_GPG_NAME'))
 
-    if d.getVar("IPK_SIGN_PACKAGES", True):
+    if d.getVar("IPK_SIGN_PACKAGES"):
         # Export public key of the ipk signing key
-        signer = get_signer(d, d.getVar('IPK_GPG_BACKEND', True))
+        signer = get_signer(d, d.getVar('IPK_GPG_BACKEND'))
         signer.export_pubkey(os.path.join(d.expand('${B}'), 'ipk-key'),
-                             d.getVar('IPK_GPG_NAME', True))
+                             d.getVar('IPK_GPG_NAME'))
 
-    if d.getVar('PACKAGE_FEED_SIGN', True) == '1':
+    if d.getVar('PACKAGE_FEED_SIGN') == '1':
         # Export public key of the feed signing key
-        signer = get_signer(d, d.getVar('PACKAGE_FEED_GPG_BACKEND', True))
+        signer = get_signer(d, d.getVar('PACKAGE_FEED_GPG_BACKEND'))
         signer.export_pubkey(os.path.join(d.expand('${B}'), 'pf-key'),
-                             d.getVar('PACKAGE_FEED_GPG_NAME', True))
+                             d.getVar('PACKAGE_FEED_GPG_NAME'))
 }
 do_get_public_keys[cleandirs] = "${B}"
 addtask get_public_keys before do_install
diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index fac0bac..f988704 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -32,8 +32,8 @@ def sanitise_version(ver):
 python do_compile () {
     import shutil
     with open(d.expand('${B}/os-release'), 'w') as f:
-        for field in d.getVar('OS_RELEASE_FIELDS', True).split():
-            value = d.getVar(field, True)
+        for field in d.getVar('OS_RELEASE_FIELDS').split():
+            value = d.getVar(field)
             if value and field == 'VERSION_ID':
                 value = sanitise_version(value)
             if value:
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 2e94fde..0069e3e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -110,8 +110,8 @@ python __anonymous () {
     # If Distro want wifi and machine feature wifi/pci/pcmcia/usbhost (one of them)
     # then include packagegroup-base-wifi in packagegroup-base
 
-    distro_features = set(d.getVar("DISTRO_FEATURES", True).split())
-    machine_features= set(d.getVar("MACHINE_FEATURES", True).split())
+    distro_features = set(d.getVar("DISTRO_FEATURES").split())
+    machine_features= set(d.getVar("MACHINE_FEATURES").split())
 
     if "bluetooth" in distro_features and not "bluetooth" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
         d.setVar("ADD_BT", "packagegroup-base-bluetooth")
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 327cd8e..7d6d414 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -42,7 +42,7 @@ RRECOMMENDS_packagegroup-core-sdk = "\
 
 #python generate_sdk_pkgs () {
 #    poky_pkgs = read_pkgdata('packagegroup-core', d)['PACKAGES']
-#    pkgs = d.getVar('PACKAGES', True).split()
+#    pkgs = d.getVar('PACKAGES').split()
 #    for pkg in poky_pkgs.split():
 #        newpkg = pkg.replace('packagegroup-core', 'packagegroup-core-sdk')
 #
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 0537426..b0d6bb4 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -16,8 +16,8 @@ SRC_URI = "git://git.yoctoproject.org/${BPN} \
 SPLASH_IMAGES = "file://psplash-poky-img.h;outsuffix=default"
 
 python __anonymous() {
-    oldpkgs = d.getVar("PACKAGES", True).split()
-    splashfiles = d.getVar('SPLASH_IMAGES', True).split()
+    oldpkgs = d.getVar("PACKAGES").split()
+    splashfiles = d.getVar('SPLASH_IMAGES').split()
     pkgs = []
     localpaths = []
     haspng = False
@@ -50,8 +50,8 @@ python __anonymous() {
         d.appendVar("DEPENDS", " gdk-pixbuf-native")
 
     d.prependVar("PACKAGES", "%s " % (" ".join(pkgs)))
-    mlprefix = d.getVar('MLPREFIX', True) or ''
-    pn = d.getVar('PN', True) or ''
+    mlprefix = d.getVar('MLPREFIX') or ''
+    pn = d.getVar('PN') or ''
     for p in pkgs:
         ep = '%s%s' % (mlprefix, p)
         epsplash = '%s%s' % (mlprefix, 'psplash')
@@ -74,11 +74,11 @@ python do_compile () {
     import shutil
 
     # Build a separate executable for each splash image
-    workdir = d.getVar('WORKDIR', True)
-    convertscript = "%s/make-image-header.sh" % d.getVar('S', True)
-    destfile = "%s/psplash-poky-img.h" % d.getVar('S', True)
-    localfiles = d.getVar('SPLASH_LOCALPATHS', True).split()
-    outputfiles = d.getVar('SPLASH_INSTALL', True).split()
+    workdir = d.getVar('WORKDIR')
+    convertscript = "%s/make-image-header.sh" % d.getVar('S')
+    destfile = "%s/psplash-poky-img.h" % d.getVar('S')
+    localfiles = d.getVar('SPLASH_LOCALPATHS').split()
+    outputfiles = d.getVar('SPLASH_INSTALL').split()
     for localfile, outputfile in zip(localfiles, outputfiles):
         if localfile.endswith(".png"):
             outp = oe.utils.getstatusoutput('%s %s POKY' % (convertscript, os.path.join(workdir, localfile)))
@@ -89,7 +89,7 @@ python do_compile () {
             shutil.copyfile(os.path.join(workdir, localfile), destfile)
         # For some reason just updating the header is not enough, we have to touch the .c
         # file in order to get it to rebuild
-        os.utime("%s/psplash.c" % d.getVar('S', True), None)
+        os.utime("%s/psplash.c" % d.getVar('S'), None)
         bb.build.exec_func("oe_runmake", d)
         shutil.copyfile("psplash", outputfile)
 }
diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core/systemd/systemd_230.bb
index 77b7130..98d3cd9 100644
--- a/meta/recipes-core/systemd/systemd_230.bb
+++ b/meta/recipes-core/systemd/systemd_230.bb
@@ -279,7 +279,7 @@ do_install_ptest () {
 }
 
 python populate_packages_prepend (){
-    systemdlibdir = d.getVar("rootlibdir", True)
+    systemdlibdir = d.getVar("rootlibdir")
     do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
 }
 PACKAGES_DYNAMIC += "^lib(udev|systemd).*"
@@ -595,6 +595,6 @@ python () {
         raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
 
     import re
-    if re.match('.*musl*', d.getVar('TARGET_OS', True)) != None:
+    if re.match('.*musl*', d.getVar('TARGET_OS')) != None:
         raise bb.parse.SkipPackage("Not _yet_ supported on musl based targets")
 }
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 70cba6b..21815fb 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -270,7 +270,7 @@ ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
 BBCLASSEXTEND = "native nativesdk"
 
 python do_package_prepend () {
-    if '--enable-su' in d.getVar('EXTRA_OECONF', True).split():
+    if '--enable-su' in d.getVar('EXTRA_OECONF').split():
         d.appendVar(d.expand('ALTERNATIVE_${PN}'), ' su')
         d.appendVar(d.expand('ALTERNATIVE_${PN}-doc'), ' su.1')
 
diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index fee7275..f07458a 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -46,7 +46,7 @@ do_compile () {
             -e "s#@whatparent@#${spec%/*}#g; s#@whereparent@#${mountpoint%/*}#g" \
             volatile-binds.service.in >$servicefile
     done <<END
-${@d.getVar('VOLATILE_BINDS', True).replace("\\n", "\n")}
+${@d.getVar('VOLATILE_BINDS').replace("\\n", "\n")}
 END
 
     if [ -e var-volatile-lib.service ]; then
diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index 9fa206e..68f1b3c 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -17,14 +17,14 @@ python do_install () {
 }
 
 python do_install_config () {
-    indir = os.path.dirname(d.getVar('FILE', True))
+    indir = os.path.dirname(d.getVar('FILE'))
     infile = open(oe.path.join(indir, 'files', 'apt.conf'), 'r')
     data = infile.read()
     infile.close()
 
     data = d.expand(data)
 
-    outdir = oe.path.join(d.getVar('D', True), d.getVar('sysconfdir', True), 'apt')
+    outdir = oe.path.join(d.getVar('D'), d.getVar('sysconfdir'), 'apt')
     if not os.path.exists(outdir):
         os.makedirs(outdir)
 
diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
index a553aa2..6e8cb84 100644
--- a/meta/recipes-devtools/apt/apt-package.inc
+++ b/meta/recipes-devtools/apt/apt-package.inc
@@ -34,9 +34,9 @@ FILES_${PN} = "${bindir}/apt-cdrom ${bindir}/apt-get \
 	       ${localstatedir} ${sysconfdir} \
 	       ${libdir}/dpkg"
 FILES_${PN}-utils = "${bindir}/apt-sortpkgs ${bindir}/apt-extracttemplates"
-FILES_${PN}-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-manpages', True))} \
+FILES_${PN}-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-manpages'))} \
 		   ${docdir}/apt"
-FILES_${PN}-utils-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-utils-manpages', True))}"
+FILES_${PN}-utils-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-utils-manpages'))}"
 FILES_${PN}-dev = "${libdir}/libapt*.so ${includedir}"
 
 do_install () {
diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
index 4f9b5f7..87cedc9 100644
--- a/meta/recipes-devtools/automake/automake.inc
+++ b/meta/recipes-devtools/automake/automake.inc
@@ -16,6 +16,6 @@ do_configure() {
 	oe_runconf
 }
 
-export AUTOMAKE = "${@bb.utils.which('automake', d.getVar('PATH', True))}"
+export AUTOMAKE = "${@bb.utils.which('automake', d.getVar('PATH'))}"
 
 FILES_${PN} += "${datadir}/automake* ${datadir}/aclocal*"
diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/meta/recipes-devtools/binutils/binutils-2.27.inc
index fc81721..cf6a904 100644
--- a/meta/recipes-devtools/binutils/binutils-2.27.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM="\
     "
 
 def binutils_branch_version(d):
-    pvsplit = d.getVar('PV', True).split('.')
+    pvsplit = d.getVar('PV').split('.')
     return pvsplit[0] + "_" + pvsplit[1]
 
 BINUPV = "${@binutils_branch_version(d)}"
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 75d190f..9b1192b 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -59,9 +59,9 @@ USE_ALTERNATIVES_FOR = " \
 "
 
 python do_package_prepend() {
-    make_alts = d.getVar("USE_ALTERNATIVES_FOR", True) or ""
-    prefix = d.getVar("TARGET_PREFIX", True)
-    bindir = d.getVar("bindir", True)
+    make_alts = d.getVar("USE_ALTERNATIVES_FOR") or ""
+    prefix = d.getVar("TARGET_PREFIX")
+    bindir = d.getVar("bindir")
     for alt in make_alts.split():
         d.setVarFlag('ALTERNATIVE_TARGET', alt, bindir + "/" + prefix + alt)
         d.setVarFlag('ALTERNATIVE_LINK_NAME', alt, bindir + "/" + alt)
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index fee511f..10577fd 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -9,7 +9,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://Copyright.txt;md5=052f86c15bbde68af55c7f7b340ab639 \
                     file://Source/cmake.h;beginline=1;endline=10;md5=341736dae83c9e344b53eeb1bc7d7bc2"
 
-CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV', True).split('.')[0:2])}"
+CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://support-oe-qt4-tools-names.patch \
diff --git a/meta/recipes-devtools/cmake/cmake_3.6.2.bb b/meta/recipes-devtools/cmake/cmake_3.6.2.bb
index 850d6de..8b732e6 100644
--- a/meta/recipes-devtools/cmake/cmake_3.6.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.6.2.bb
@@ -10,8 +10,8 @@ SRC_URI_append_class-nativesdk = " \
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
-    prefix=d.getVar("prefix", True)
-    docdir=d.getVar("docdir", True)
+    prefix=d.getVar("prefix")
+    docdir=d.getVar("docdir")
 
     if not docdir.startswith(prefix):
         bb.fatal('docdir must contain prefix as its prefix')
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index e8d8a9b..ff88318 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -13,7 +13,7 @@ inherit autotools gettext perlnative pkgconfig systemd
 
 python () {
     if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        pn = d.getVar('PN', True)
+        pn = d.getVar('PN')
         d.setVar('SYSTEMD_SERVICE_%s' % (pn), 'dpkg-configure.service')
 }
 
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index f540b4d..d17ba29 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -10,35 +10,35 @@ inherit autotools gettext texinfo
 BPN = "gcc"
 
 def get_gcc_float_setting(bb, d):
-    if d.getVar('ARMPKGSFX_EABI', True) == "hf" and d.getVar('TRANSLATED_TARGET_ARCH', True) == "arm":
+    if d.getVar('ARMPKGSFX_EABI') == "hf" and d.getVar('TRANSLATED_TARGET_ARCH') == "arm":
         return "--with-float=hard"
-    if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
+    if d.getVar('TARGET_FPU') in [ 'soft' ]:
         return "--with-float=soft"
-    if d.getVar('TARGET_FPU', True) in [ 'ppc-efd' ]:
+    if d.getVar('TARGET_FPU') in [ 'ppc-efd' ]:
         return "--enable-e500_double"
     return ""
 
 get_gcc_float_setting[vardepvalue] = "${@get_gcc_float_setting(bb, d)}"
 
 def get_gcc_mips_plt_setting(bb, d):
-    if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'mips', 'mipsel' ] and bb.utils.contains('DISTRO_FEATURES', 'mplt', True, False, d):
+    if d.getVar('TRANSLATED_TARGET_ARCH') in [ 'mips', 'mipsel' ] and bb.utils.contains('DISTRO_FEATURES', 'mplt', True, False, d):
         return "--with-mips-plt"
     return ""
 
 def get_gcc_ppc_plt_settings(bb, d):
-    if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'powerpc' ] and not bb.utils.contains('DISTRO_FEATURES', 'bssplt', True, False, d):
+    if d.getVar('TRANSLATED_TARGET_ARCH') in [ 'powerpc' ] and not bb.utils.contains('DISTRO_FEATURES', 'bssplt', True, False, d):
         return "--enable-secureplt"
     return ""
 
 def get_long_double_setting(bb, d):
-    if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'powerpc', 'powerpc64' ] and d.getVar('TCLIBC', True) in [ 'uclibc', 'glibc' ]:
+    if d.getVar('TRANSLATED_TARGET_ARCH') in [ 'powerpc', 'powerpc64' ] and d.getVar('TCLIBC') in [ 'uclibc', 'glibc' ]:
         return "--with-long-double-128"
     else:
         return "--without-long-double-128"
     return ""
 
 def get_gcc_multiarch_setting(bb, d):
-    target_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
+    target_arch = d.getVar('TRANSLATED_TARGET_ARCH')
     multiarch_options = {
         "i586":    "--enable-targets=all",
         "i686":    "--enable-targets=all",
@@ -54,7 +54,7 @@ def get_gcc_multiarch_setting(bb, d):
 
 # this is used by the multilib setup of gcc
 def get_tune_parameters(tune, d):
-    availtunes = d.getVar('AVAILTUNES', True)
+    availtunes = d.getVar('AVAILTUNES')
     if tune not in availtunes.split():
         bb.error('The tune: %s is not one of the available tunes: %s' % (tune or None, availtunes))
 
@@ -65,15 +65,15 @@ def get_tune_parameters(tune, d):
 
     retdict = {}
     retdict['tune'] = tune
-    retdict['ccargs'] = localdata.getVar('TUNE_CCARGS', True)
-    retdict['features'] = localdata.getVar('TUNE_FEATURES', True)
+    retdict['ccargs'] = localdata.getVar('TUNE_CCARGS')
+    retdict['features'] = localdata.getVar('TUNE_FEATURES')
     # BASELIB is used by the multilib code to change library paths
-    retdict['baselib'] = localdata.getVar('BASE_LIB', True) or localdata.getVar('BASELIB', True)
-    retdict['arch'] = localdata.getVar('TUNE_ARCH', True)
-    retdict['abiextension'] = localdata.getVar('ABIEXTENSION', True)
-    retdict['target_fpu'] = localdata.getVar('TARGET_FPU', True)
-    retdict['pkgarch'] = localdata.getVar('TUNE_PKGARCH', True)
-    retdict['package_extra_archs'] = localdata.getVar('PACKAGE_EXTRA_ARCHS', True)
+    retdict['baselib'] = localdata.getVar('BASE_LIB') or localdata.getVar('BASELIB')
+    retdict['arch'] = localdata.getVar('TUNE_ARCH')
+    retdict['abiextension'] = localdata.getVar('ABIEXTENSION')
+    retdict['target_fpu'] = localdata.getVar('TARGET_FPU')
+    retdict['pkgarch'] = localdata.getVar('TUNE_PKGARCH')
+    retdict['package_extra_archs'] = localdata.getVar('PACKAGE_EXTRA_ARCHS')
     return retdict
 
 get_tune_parameters[vardepsexclude] = "AVAILTUNES TUNE_CCARGS OVERRIDES TUNE_FEATURES BASE_LIB BASELIB TUNE_ARCH ABIEXTENSION TARGET_FPU TUNE_PKGARCH PACKAGE_EXTRA_ARCHS"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index ddebbb8..00ef89e 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -23,7 +23,7 @@ GCCMULTILIB ?= "--disable-multilib"
 GCCTHREADS ?= "posix"
 
 EXTRA_OECONF = "\
-    ${@['--enable-clocale=generic', ''][d.getVar('USE_NLS', True) != 'no']} \
+    ${@['--enable-clocale=generic', ''][d.getVar('USE_NLS') != 'no']} \
     --with-gnu-ld \
     --enable-shared \
     --enable-languages=${LANGUAGES} \
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index cc465a2..c4f7084 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -5,7 +5,7 @@ EXTRADEPENDS = ""
 DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc ${EXTRADEPENDS} ${NATIVEDEPS}"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 python () {
-    if d.getVar("TARGET_OS", True).startswith("linux"):
+    if d.getVar("TARGET_OS").startswith("linux"):
         d.setVar("EXTRADEPENDS", "linux-libc-headers")
 }
 
diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index a0a2ac0..31b8619 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -21,8 +21,8 @@ python gcc_multilib_setup() {
     import shutil
     import glob
 
-    srcdir = d.getVar('S', True)
-    builddir = d.getVar('B', True)
+    srcdir = d.getVar('S')
+    builddir = d.getVar('B')
     src_conf_dir = '%s/gcc/config' % srcdir
     build_conf_dir = '%s/gcc/config' % builddir
 
@@ -43,12 +43,12 @@ python gcc_multilib_setup() {
             bb.utils.mkdirhier('%s/%s' % (build_conf_dir, parent_dir))
             bb.utils.copyfile(fn, '%s/%s' % (build_conf_dir, rel_path))
 
-    pn = d.getVar('PN', True)
-    multilibs = (d.getVar('MULTILIB_VARIANTS', True) or '').split()
+    pn = d.getVar('PN')
+    multilibs = (d.getVar('MULTILIB_VARIANTS') or '').split()
     if not multilibs and pn != "nativesdk-gcc":
         return
 
-    mlprefix = d.getVar('MLPREFIX', True)
+    mlprefix = d.getVar('MLPREFIX')
 
     if ('%sgcc' % mlprefix) != pn and (not pn.startswith('gcc-cross-canadian')) and pn != "nativesdk-gcc":
         return
@@ -155,10 +155,10 @@ python gcc_multilib_setup() {
     libdirn32 = 'SYSTEMLIBS_DIR'
 
 
-    target_arch = (d.getVar('TARGET_ARCH_MULTILIB_ORIGINAL', True) if mlprefix
-                    else d.getVar('TARGET_ARCH', True))
+    target_arch = (d.getVar('TARGET_ARCH_MULTILIB_ORIGINAL') if mlprefix
+                    else d.getVar('TARGET_ARCH'))
     if pn == "nativesdk-gcc":
-        header_config_files = gcc_header_config_files[d.getVar("SDK_ARCH", True)]
+        header_config_files = gcc_header_config_files[d.getVar("SDK_ARCH")]
         write_headers(builddir, header_config_files, libdir32, libdir64, libdirx32, libdirn32)
         return
 
@@ -188,7 +188,7 @@ python gcc_multilib_setup() {
     optsets = []
 
     for ml in ml_list:
-        tune = d.getVar(ml, True)
+        tune = d.getVar(ml)
         if not tune:
             bb.warn("%s doesn't have a corresponding tune. Skipping..." % ml)
             continue
@@ -212,7 +212,7 @@ python gcc_multilib_setup() {
 
         # take out '-' mcpu='s and march='s from parameters
         opts = []
-        whitelist = (d.getVar("MULTILIB_OPTION_WHITELIST", True) or "").split()
+        whitelist = (d.getVar("MULTILIB_OPTION_WHITELIST") or "").split()
         for i in d.expand(tune_parameters['ccargs']).split():
             if i in whitelist:
                 # Need to strip '-' from option
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index 8a13f54..74e9faa 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -64,18 +64,18 @@ addtask multilib_install after do_install before do_package do_populate_sysroot
 fakeroot python do_multilib_install() {
     import re
 
-    multilibs = d.getVar('MULTILIB_VARIANTS', True)
+    multilibs = d.getVar('MULTILIB_VARIANTS')
     if not multilibs or bb.data.inherits_class('nativesdk', d):
         return
 
-    binv = d.getVar('BINV', True)
+    binv = d.getVar('BINV')
 
-    mlprefix = d.getVar('MLPREFIX', True)
-    if ('%slibgcc' % mlprefix) != d.getVar('PN', True):
+    mlprefix = d.getVar('MLPREFIX')
+    if ('%slibgcc' % mlprefix) != d.getVar('PN'):
         return
 
     if mlprefix:
-        orig_tune = d.getVar('DEFAULTTUNE_MULTILIB_ORIGINAL', True)
+        orig_tune = d.getVar('DEFAULTTUNE_MULTILIB_ORIGINAL')
         orig_tune_params = get_tune_parameters(orig_tune, d)
         orig_tune_baselib = orig_tune_params['baselib']
         orig_tune_bitness = orig_tune_baselib.replace('lib', '')
@@ -83,10 +83,10 @@ fakeroot python do_multilib_install() {
             orig_tune_bitness = '32'
 
         src = '../../../' + orig_tune_baselib + '/' + \
-            d.getVar('TARGET_SYS_MULTILIB_ORIGINAL', True) + '/' + binv + '/'
+            d.getVar('TARGET_SYS_MULTILIB_ORIGINAL') + '/' + binv + '/'
 
-        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
-            d.getVar('TARGET_SYS', True) + '/' + binv + '/' + orig_tune_bitness
+        dest = d.getVar('D') + d.getVar('libdir') + '/' + \
+            d.getVar('TARGET_SYS') + '/' + binv + '/' + orig_tune_bitness
 
         if os.path.lexists(dest):
             os.unlink(dest)
@@ -95,7 +95,7 @@ fakeroot python do_multilib_install() {
 
 
     for ml in multilibs.split():
-        tune = d.getVar('DEFAULTTUNE_virtclass-multilib-' + ml, True)
+        tune = d.getVar('DEFAULTTUNE_virtclass-multilib-' + ml)
         if not tune:
             bb.warn('DEFAULTTUNE_virtclass-multilib-%s is not defined. Skipping...' % ml)
             continue
@@ -118,11 +118,11 @@ fakeroot python do_multilib_install() {
             libcextension = ''
 
         src = '../../../' + tune_baselib + '/' + \
-            tune_arch + d.getVar('TARGET_VENDOR', True) + 'ml' + ml + \
-            '-' + d.getVar('TARGET_OS', True) + libcextension +  '/' + binv + '/'
+            tune_arch + d.getVar('TARGET_VENDOR') + 'ml' + ml + \
+            '-' + d.getVar('TARGET_OS') + libcextension +  '/' + binv + '/'
 
-        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
-            d.getVar('TARGET_SYS', True) + '/' + binv + '/' + tune_bitness
+        dest = d.getVar('D') + d.getVar('libdir') + '/' + \
+            d.getVar('TARGET_SYS') + '/' + binv + '/' + tune_bitness
 
         if os.path.lexists(dest):
             os.unlink(dest)
@@ -131,7 +131,7 @@ fakeroot python do_multilib_install() {
 
 def get_original_os(d):
     vendoros = d.expand('${TARGET_ARCH}${ORIG_TARGET_VENDOR}-${TARGET_OS}')
-    for suffix in [d.getVar('ABIEXTENSION', True), d.getVar('LIBCEXTENSION', True)]:
+    for suffix in [d.getVar('ABIEXTENSION'), d.getVar('LIBCEXTENSION')]:
         if suffix and vendoros.endswith(suffix):
             vendoros = vendoros[:-len(suffix)]
     # Arm must use linux-gnueabi not linux as only the former is accepted by gcc
@@ -144,11 +144,11 @@ BASETARGET_SYS = "${@get_original_os(d)}"
 
 addtask extra_symlinks after do_multilib_install before do_package do_populate_sysroot
 fakeroot python do_extra_symlinks() {
-    targetsys = d.getVar('BASETARGET_SYS', True)
+    targetsys = d.getVar('BASETARGET_SYS')
 
-    if targetsys != d.getVar('TARGET_SYS', True):
-        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + targetsys
-        src = d.getVar('TARGET_SYS', True)
-        if not os.path.lexists(dest) and os.path.lexists(d.getVar('D', True) + d.getVar('libdir', True)):
+    if targetsys != d.getVar('TARGET_SYS'):
+        dest = d.getVar('D') + d.getVar('libdir') + '/' + targetsys
+        src = d.getVar('TARGET_SYS')
+        if not os.path.lexists(dest) and os.path.lexists(d.getVar('D') + d.getVar('libdir')):
             os.symlink(src, dest)
 }
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 58ceb2e..1943635 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -69,7 +69,7 @@ do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 
 python __anonymous () {
-    f = d.getVar("FORTRAN", True)
+    f = d.getVar("FORTRAN")
     if "fortran" not in f:
         raise bb.parse.SkipPackage("libgfortran needs fortran support to be enabled in the compiler")
 }
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 753b047..ade99ec 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -46,7 +46,7 @@ do_install () {
 perl_native_fixup () {
 	sed -i -e 's#${STAGING_BINDIR_NATIVE}/perl-native/#${bindir}/#' \
 	       -e 's#${libdir}/perl-native/#${libdir}/#' \
-	    ${@d.getVar("PERLTOOLS", True).replace(' /',d.getVar('D', True) + '/')}
+	    ${@d.getVar("PERLTOOLS").replace(' /',d.getVar('D') + '/')}
 
 	# ${libdir} is not applicable here, perl-native files are always
 	# installed to /usr/lib on both 32/64 bits targets.
diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
index 9b65a99..09e10c9 100644
--- a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--disable-gconf --disable-qconf"
 
 # Some packages have the version preceeding the .so instead properly
 # versioned .so.<version>, so we need to reorder and repackage.
-SOLIBS = "-${@d.getVar('PV', True)[:-2]}.so"
+SOLIBS = "-${@d.getVar('PV')[:-2]}.so"
 FILES_SOLIBSDEV = "${libdir}/libkconfig-parser.so"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/perl/perl_5.22.1.bb b/meta/recipes-devtools/perl/perl_5.22.1.bb
index 792a65b..6c98cf7 100644
--- a/meta/recipes-devtools/perl/perl_5.22.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.1.bb
@@ -358,7 +358,7 @@ python split_perl_packages () {
     # perl-modules should recommend every perl module, and only the
     # modules. Don't attempt to use the result of do_split_packages() as some
     # modules are manually split (eg. perl-module-unicore).
-    packages = filter(lambda p: 'perl-module-' in p, d.getVar('PACKAGES', True).split())
+    packages = filter(lambda p: 'perl-module-' in p, d.getVar('PACKAGES').split())
     d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), ' '.join(packages))
 }
 
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 0856b1c..4529dbf 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -132,7 +132,7 @@ python do_linkerpaths () {
 }
 
 python () {
-    overrides = d.getVar("OVERRIDES", True).split(":")
+    overrides = d.getVar("OVERRIDES").split(":")
     if "class-target" in overrides:
         bb.build.addtask('do_linkerpaths', 'do_configure', 'do_patch', d)
 }
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/recipes-devtools/python/python-smartpm_git.bb
index 861910c..6daabf4 100644
--- a/meta/recipes-devtools/python/python-smartpm_git.bb
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb
@@ -97,9 +97,9 @@ do_install_append() {
 
 add_native_wrapper() {
         create_wrapper ${D}/${bindir}/smart \
-		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
-		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
+		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm \
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
+		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}/locale
 }
 
 do_install_append_class-native() {
diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-devtools/qemu/qemu-targets.inc
index a3e46a8..66dd675 100644
--- a/meta/recipes-devtools/qemu/qemu-targets.inc
+++ b/meta/recipes-devtools/qemu/qemu-targets.inc
@@ -4,8 +4,8 @@
 
 def get_qemu_target_list(d):
     import bb
-    archs = d.getVar('QEMU_TARGETS', True).split()
-    tos = d.getVar('HOST_OS', True)
+    archs = d.getVar('QEMU_TARGETS').split()
+    tos = d.getVar('HOST_OS')
     softmmuonly = ""
     for arch in ['ppcemb']:
         if arch in archs:
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 182818e..3df4d1f 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -626,13 +626,13 @@ def multilib_rpmmacros(d):
     localdata.delVar('TOOLCHAIN_OPTIONS')
 
     # Set 'localdata' values to be consistent with 'd' values.
-    distromacrodirVal = d.getVar('distromacrodir', True)
-    workdirVal = d.getVar('WORKDIR', True)
-    dval = d.getVar('D', True)
+    distromacrodirVal = d.getVar('distromacrodir')
+    workdirVal = d.getVar('WORKDIR')
+    dval = d.getVar('D')
 
     ret = gen_arch_macro(localdata)
 
-    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+    variants = d.getVar("MULTILIB_VARIANTS") or ""
     for item in variants.split():
         # Load overrides from 'd' to avoid having to reset the value...
         localdata = d.createCopy()
@@ -656,17 +656,17 @@ def gen_arch_macro(d):
     val += "\n"
     val += "# Toolchain configuration\n"
     val += "%TOOLCHAIN_OPTIONS  %{nil}\n"
-    val += "%__ar               ${@d.getVar('AR', True).replace('$','%')}\n"
-    val += "%__as               ${@d.getVar('AS', True).replace('$','%')}\n"
-    val += "%__cc               ${@d.getVar('CC', True).replace('$','%')}\n"
-    val += "%__cpp              ${@d.getVar('CPP', True).replace('$','%')}\n"
-    val += "%__cxx              ${@d.getVar('CXX', True).replace('$','%')}\n"
-    val += "%__ld               ${@d.getVar('LD', True).replace('$','%')}\n"
-    val += "%__nm               ${@d.getVar('NM', True).replace('$','%')}\n"
-    val += "%__objcopy          ${@d.getVar('OBJCOPY', True).replace('$','%')}\n"
-    val += "%__objdump          ${@d.getVar('OBJDUMP', True).replace('$','%')}\n"
-    val += "%__ranlib           ${@d.getVar('RANLIB', True).replace('$','%')}\n"
-    val += "%__strip            ${@d.getVar('STRIP', True).replace('$','%')}\n"
+    val += "%__ar               ${@d.getVar('AR').replace('$','%')}\n"
+    val += "%__as               ${@d.getVar('AS').replace('$','%')}\n"
+    val += "%__cc               ${@d.getVar('CC').replace('$','%')}\n"
+    val += "%__cpp              ${@d.getVar('CPP').replace('$','%')}\n"
+    val += "%__cxx              ${@d.getVar('CXX').replace('$','%')}\n"
+    val += "%__ld               ${@d.getVar('LD').replace('$','%')}\n"
+    val += "%__nm               ${@d.getVar('NM').replace('$','%')}\n"
+    val += "%__objcopy          ${@d.getVar('OBJCOPY').replace('$','%')}\n"
+    val += "%__objdump          ${@d.getVar('OBJDUMP').replace('$','%')}\n"
+    val += "%__ranlib           ${@d.getVar('RANLIB').replace('$','%')}\n"
+    val += "%__strip            ${@d.getVar('STRIP').replace('$','%')}\n"
     val += "EOF\n"
     val += "\n"
     return d.expand(val)
@@ -674,30 +674,30 @@ def gen_arch_macro(d):
 
 add_native_wrapper() {
         create_wrapper ${D}/${bindir}/rpm \
-		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
-		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
+		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm \
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
+		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}/locale
 
         create_wrapper ${D}/${bindir}/rpm2cpio \
-		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
-		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
+		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm \
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
+		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}/locale
 
         create_wrapper ${D}/${bindir}/rpmbuild \
-		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
-		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
+		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm \
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
+		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}/locale
 
         create_wrapper ${D}/${bindir}/rpmconstant \
-		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
-		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
+		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm \
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
+		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}/locale
 
 	for rpm_binary in ${D}/${libdir}/rpm/bin/rpm* ${D}/${libdir}/rpm/bin/debugedit; do
         	create_wrapper $rpm_binary \
-			RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-			RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
-			RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
+			RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm \
+			RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir'), d.getVar('bindir'))}/rpm} \
+			RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}/locale
 	done
 }
 
diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/swig/swig.inc
index 704bb27..8cb6fbd 100644
--- a/meta/recipes-devtools/swig/swig.inc
+++ b/meta/recipes-devtools/swig/swig.inc
@@ -54,8 +54,8 @@ do_install_append_class-nativesdk() {
 }
 
 def swiglib_relpath(d):
-    swiglib = d.getVar('datadir', True) + "/" + d.getVar('BPN', True) + "/" + d.getVar('PV', True)
-    return os.path.relpath(swiglib, d.getVar('bindir', True))
+    swiglib = d.getVar('datadir') + "/" + d.getVar('BPN') + "/" + d.getVar('PV')
+    return os.path.relpath(swiglib, d.getVar('bindir'))
 
 do_install_append_class-native() {
     create_wrapper ${D}${bindir}/swig SWIG_LIB='`dirname $''realpath`'/${@swiglib_relpath(d)}
diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index afa09ec..b338ea0 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -11,7 +11,7 @@ HOMEPAGE = "http://vala-project.org"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
-SHRT_VER = "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', True).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
 inherit autotools pkgconfig upstream-version-is-even
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
index 2474bbc..2f55217 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
@@ -42,7 +42,7 @@ COMPATIBLE_HOST_mipsarch = "${@bb.utils.contains("TARGET_FPU", "soft", "null", "
 inherit autotools ptest
 
 EXTRA_OECONF = "--enable-tls --without-mpicc"
-EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS', True) != '32']}"
+EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS') != '32']}"
 
 # valgrind checks host_cpu "armv7*)", so we need to over-ride the autotools.bbclass default --host option
 EXTRA_OECONF_append_arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 02b6358..e6d24ee 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -83,7 +83,7 @@ do_install () {
 python do_package_append() {
     import subprocess
     # Change permissions back the way they were, they probably had a reason...
-    workdir = d.getVar('WORKDIR', True)
+    workdir = d.getVar('WORKDIR')
     subprocess.call('chmod 0511 %s/install/cups/var/run/cups/certs' % workdir, shell=True)
 }
 
diff --git a/meta/recipes-extended/man/man_1.6g.bb b/meta/recipes-extended/man/man_1.6g.bb
index e78aa18..ff603f8 100644
--- a/meta/recipes-extended/man/man_1.6g.bb
+++ b/meta/recipes-extended/man/man_1.6g.bb
@@ -10,8 +10,8 @@ PR = "r1"
 DEPENDS = "groff less"
 
 def compress_pkg(d):
-    if "compress_doc" in (d.getVar("INHERIT", True) or "").split():
-         compress = d.getVar("DOC_COMPRESS", True)
+    if "compress_doc" in (d.getVar("INHERIT") or "").split():
+         compress = d.getVar("DOC_COMPRESS")
          if compress == "gz":
              return "gzip"
          elif compress == "bz2":
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 47a68a5..49a65f8 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -106,10 +106,10 @@ ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
 ALTERNATIVE_PRIORITY[hostname.1] = "10"
 
 python __anonymous() {
-	for prog in d.getVar('base_sbindir_progs', True).split():
-		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir', True), prog))
-	for prog in d.getVar('base_bindir_progs', True).split():
-		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir', True), prog))
+	for prog in d.getVar('base_sbindir_progs').split():
+		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir'), prog))
+	for prog in d.getVar('base_bindir_progs').split():
+		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir'), prog))
 }
 ALTERNATIVE_PRIORITY = "100"
 
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index a60a68c..d8975f2 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -31,7 +31,7 @@ python __anonymous () {
     namemap["packagegroup-core-full-cmdline-initscripts"] = "packagegroup-core-initscripts"
     namemap["packagegroup-core-full-cmdline-sys-services"] = "packagegroup-core-sys-services"
 
-    packages = d.getVar("PACKAGES", True).split()
+    packages = d.getVar("PACKAGES").split()
     for pkg in packages:
         if pkg.endswith('-dev'):
             mapped = namemap.get(pkg[:-4], None)
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 29564e0..734dda1 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -15,9 +15,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
 # We will skip parsing this packagegeoup for non-glibc systems
 #
 python __anonymous () {
-    if d.getVar('TCLIBC', True) != "glibc":
+    if d.getVar('TCLIBC') != "glibc":
         raise bb.parse.SkipPackage("incompatible with %s C library" %
-                                   d.getVar('TCLIBC', True))
+                                   d.getVar('TCLIBC'))
 }
 
 PACKAGES = "\
diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-extended/pam/libpam_1.3.0.bb
index bb5a4bd..67b9d53 100644
--- a/meta/recipes-extended/pam/libpam_1.3.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
@@ -62,7 +62,7 @@ FILES_${PN}-xtests = "${datadir}/Linux-PAM/xtests"
 PACKAGES_DYNAMIC += "^${MLPREFIX}pam-plugin-.*"
 
 def get_multilib_bit(d):
-    baselib = d.getVar('baselib', True) or ''
+    baselib = d.getVar('baselib') or ''
     return baselib.replace('lib', '')
 
 libpam_suffix = "suffix${@get_multilib_bit(d)}"
@@ -92,30 +92,30 @@ RRECOMMENDS_${PN}_class-native = ""
 python populate_packages_prepend () {
     def pam_plugin_append_file(pn, dir, file):
         nf = os.path.join(dir, file)
-        of = d.getVar('FILES_' + pn, True)
+        of = d.getVar('FILES_' + pn)
         if of:
             nf = of + " " + nf
         d.setVar('FILES_' + pn, nf)
 
     def pam_plugin_hook(file, pkg, pattern, format, basename):
-        pn = d.getVar('PN', True)
-        libpam_suffix = d.getVar('libpam_suffix', True)
+        pn = d.getVar('PN')
+        libpam_suffix = d.getVar('libpam_suffix')
 
-        rdeps = d.getVar('RDEPENDS_' + pkg, True)
+        rdeps = d.getVar('RDEPENDS_' + pkg)
         if rdeps:
             rdeps = rdeps + " " + pn + "-" + libpam_suffix
         else:
             rdeps = pn + "-" + libpam_suffix
         d.setVar('RDEPENDS_' + pkg, rdeps)
 
-        provides = d.getVar('RPROVIDES_' + pkg, True)
+        provides = d.getVar('RPROVIDES_' + pkg)
         if provides:
             provides = provides + " " + pkg + "-" + libpam_suffix
         else:
             provides = pkg + "-" + libpam_suffix
         d.setVar('RPROVIDES_' + pkg, provides)
 
-    mlprefix = d.getVar('MLPREFIX', True) or ''
+    mlprefix = d.getVar('MLPREFIX') or ''
     dvar = bb.data.expand('${WORKDIR}/package', d, True)
     pam_libdir = d.expand('${base_libdir}/security')
     pam_sbindir = d.expand('${sbindir}')
diff --git a/meta/recipes-extended/procps/procps_3.3.12.bb b/meta/recipes-extended/procps/procps_3.3.12.bb
index 4ca1a50..1f793b9 100644
--- a/meta/recipes-extended/procps/procps_3.3.12.bb
+++ b/meta/recipes-extended/procps/procps_3.3.12.bb
@@ -57,10 +57,10 @@ ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
 ALTERNATIVE_LINK_NAME[uptime.1] = "${mandir}/man1/uptime.1"
 
 python __anonymous() {
-    for prog in d.getVar('base_bindir_progs', True).split():
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir', True), prog))
+    for prog in d.getVar('base_bindir_progs').split():
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir'), prog))
 
-    for prog in d.getVar('base_sbindir_progs', True).split():
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir', True), prog))
+    for prog in d.getVar('base_sbindir_progs').split():
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir'), prog))
 }
 
diff --git a/meta/recipes-extended/texinfo/texinfo_6.0.bb b/meta/recipes-extended/texinfo/texinfo_6.0.bb
index 8638bb1..c23c6fc 100644
--- a/meta/recipes-extended/texinfo/texinfo_6.0.bb
+++ b/meta/recipes-extended/texinfo/texinfo_6.0.bb
@@ -11,7 +11,7 @@ PROVIDES_append_class-native = " texinfo-replacement-native"
 
 def compress_pkg(d):
     if bb.data.inherits_class('compress_doc', d):
-         compress = d.getVar("DOC_COMPRESS", True)
+         compress = d.getVar("DOC_COMPRESS")
          if compress == "gz":
              return "gzip"
          elif compress == "bz2":
diff --git a/meta/recipes-extended/tzdata/tzdata_2016i.bb b/meta/recipes-extended/tzdata/tzdata_2016i.bb
index 3801a3f..46488cd 100644
--- a/meta/recipes-extended/tzdata/tzdata_2016i.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2016i.bb
@@ -209,5 +209,5 @@ FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
                 ${datadir}/zoneinfo/iso3166.tab          \
                 ${datadir}/zoneinfo/Etc/*"
 
-CONFFILES_${PN} += "${@ "${sysconfdir}/timezone" if bb.utils.to_boolean(d.getVar('INSTALL_TIMEZONE_FILE', True)) else "" }"
+CONFFILES_${PN} += "${@ "${sysconfdir}/timezone" if bb.utils.to_boolean(d.getVar('INSTALL_TIMEZONE_FILE')) else "" }"
 CONFFILES_${PN} += "${sysconfdir}/localtime"
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
index a5ebeca..9efe374 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
@@ -59,7 +59,7 @@ PACKAGES_DYNAMIC += "^gdk-pixbuf-loader-.*"
 PACKAGES_DYNAMIC_class-native = ""
 
 python populate_packages_prepend () {
-    postinst_pixbufloader = d.getVar("postinst_pixbufloader", True)
+    postinst_pixbufloader = d.getVar("postinst_pixbufloader")
 
     loaders_root = d.expand('${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders')
 
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
index abaa485..3ffd05a 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
@@ -168,6 +168,6 @@ python gobject_introspection_preconfigure () {
 
 SSTATEPOSTINSTFUNCS += "gobject_introspection_postinst"
 python gobject_introspection_postinst () {
-    if d.getVar("BB_CURRENTTASK", True).startswith("populate_sysroot"):
+    if d.getVar("BB_CURRENTTASK").startswith("populate_sysroot"):
         oe.utils.write_ld_so_conf(d)
 }
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 745c6fa..6499ea6 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -125,6 +125,6 @@ python populate_packages_prepend () {
 
     do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
 
-    if (d.getVar('DEBIAN_NAMES', True)):
+    if (d.getVar('DEBIAN_NAMES')):
         d.setVar(d.expand('PKG_${PN}'), '${MLPREFIX}libgtk-3.0')
 }
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.31.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.31.bb
index 84d0b4d..cc31bab 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.31.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.31.bb
@@ -29,6 +29,6 @@ python populate_packages_prepend () {
     d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk-immodule-%s', 'GTK input module for %s')))
     do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk-printbackend-%s', 'GTK printbackend module for %s')
 
-    if (d.getVar('DEBIAN_NAMES', True)):
+    if (d.getVar('DEBIAN_NAMES')):
         d.setVar(d.expand('PKG_${PN}'), '${MLPREFIX}libgtk-2.0')
 }
diff --git a/meta/recipes-graphics/cairo/cairo-fpu.inc b/meta/recipes-graphics/cairo/cairo-fpu.inc
index ef72e89..fe7c533 100644
--- a/meta/recipes-graphics/cairo/cairo-fpu.inc
+++ b/meta/recipes-graphics/cairo/cairo-fpu.inc
@@ -1,6 +1,6 @@
 
 def get_cairo_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
+    if d.getVar('TARGET_FPU') in [ 'soft' ]:
         return "--disable-some-floating-point"
     return ""
 
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 4ec4961..d04670e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -111,7 +111,7 @@ do_install_append () {
 # they don't get Debian-renamed (which would remove the -mesa suffix), and
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
 python __anonymous() {
-    pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
+    pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
     for p in (("egl", "libegl", "libegl1"),
               ("dri", "libgl", "libgl1"),
               ("gles", "libgles1", "libglesv1-cm1"),
@@ -145,7 +145,7 @@ python mesa_populate_packages() {
         d.setVar("RREPLACES_%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
 
     import re
-    dri_drivers_root = oe.path.join(d.getVar('PKGD', True), d.getVar('libdir', True), "dri")
+    dri_drivers_root = oe.path.join(d.getVar('PKGD'), d.getVar('libdir'), "dri")
     if os.path.isdir(dri_drivers_root):
         dri_pkgs = os.listdir(dri_drivers_root)
         lib_name = d.expand("${MLPREFIX}mesa-megadriver")
@@ -157,7 +157,7 @@ python mesa_populate_packages() {
                 d.appendVar("RCONFLICTS_%s" % lib_name, pkg_name)
                 d.appendVar("RREPLACES_%s" % lib_name, pkg_name)
 
-    pipe_drivers_root = os.path.join(d.getVar('libdir', True), "gallium-pipe")
+    pipe_drivers_root = os.path.join(d.getVar('libdir'), "gallium-pipe")
     do_split_packages(d, pipe_drivers_root, '^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
 }
 
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index 57a4c82..fe42f11 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -33,8 +33,8 @@ def _add_xorg_abi_depends(d, name):
     }
 
     output = os.popen("pkg-config xorg-server --variable=%s" % abis[name]).read()
-    mlprefix = d.getVar('MLPREFIX', True) or ''
+    mlprefix = d.getVar('MLPREFIX') or ''
     abi = "%sxorg-abi-%s-%s" % (mlprefix, name, output.split(".")[0])
 
-    pn = d.getVar("PN", True)
+    pn = d.getVar("PN")
     d.appendVar('RDEPENDS_' + pn, ' ' + abi)
diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb
index a967cdc..b454781 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.2.bb
@@ -28,6 +28,6 @@ XORG_PN = "libXft"
 BBCLASSEXTEND = "native"
 
 python () {
-        if d.getVar('DEBIAN_NAMES', True):
+        if d.getVar('DEBIAN_NAMES'):
             d.setVar('PKG_${PN}', '${MLPREFIX}libxft2')
 }
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 269fa63..e037996 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -170,10 +170,10 @@ python populate_packages_prepend() {
                              shell=True, env=newenv, stdout=subprocess.PIPE)
         stdout, stderr = p.communicate()
         output = stdout.decode("utf-8").split(".")[0]
-        mlprefix = d.getVar('MLPREFIX', True) or ''
+        mlprefix = d.getVar('MLPREFIX') or ''
         return "%sxorg-abi-%s-%s" % (mlprefix, name, output)
 
-    pn = d.getVar("PN", True)
+    pn = d.getVar("PN")
     d.appendVar("RPROVIDES_" + pn, " " + get_abi("input"))
     d.appendVar("RPROVIDES_" + pn, " " + get_abi("video"))
 }
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index d15a4dc..928ca44 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # to build multiple virtual/kernel providers, e.g. as dependency of
 # core-image-rt-sdk, core-image-rt.
 python () {
-    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-rt":
+    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 27a4fa3..5684661 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # to build multiple virtual/kernel providers, e.g. as dependency of
 # core-image-rt-sdk, core-image-rt.
 python () {
-    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-rt":
+    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index 26b309d..5049df3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # to build multiple virtual/kernel providers, e.g. as dependency of
 # core-image-rt-sdk, core-image-rt.
 python () {
-    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-rt":
+    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 09cd1f1..556546f 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -12,9 +12,9 @@ INC_PR = "r4"
 # PREFERRED_PROVIDER for virtual/kernel. This avoids network access required
 # by the use of AUTOREV SRCREVs, which are the default for this recipe.
 python () {
-    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != d.getVar("PN", True):
+    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != d.getVar("PN"):
         d.delVar("BB_DONT_CACHE")
-        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to %s to enable it" % (d.getVar("PN", True)))
+        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to %s to enable it" % (d.getVar("PN")))
 }
 
 DEPENDS += "xz-native bc-native"
diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
index 7014541..8a28713 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -28,7 +28,7 @@ do_install_append() {
 }
 
 python do_package_prepend() {
-    if not os.path.exists(os.path.join(d.getVar('D', True), 'lib/modules')):
-        bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN', True))
+    if not os.path.exists(os.path.join(d.getVar('D'), 'lib/modules')):
+        bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN'))
 }
 
diff --git a/meta/recipes-kernel/perf/perf-features.inc b/meta/recipes-kernel/perf/perf-features.inc
index b8859ab..a4402cc 100644
--- a/meta/recipes-kernel/perf/perf-features.inc
+++ b/meta/recipes-kernel/perf/perf-features.inc
@@ -16,7 +16,7 @@ def perf_feature_enabled(feature, trueval, falseval, d):
       perf-tui: enable support for the perf TUI (via libnewt)
 
     """
-    enabled_features = d.getVar("PERF_FEATURES_ENABLE", True) or ""
+    enabled_features = d.getVar("PERF_FEATURES_ENABLE") or ""
     if feature in enabled_features:
         return trueval
     return falseval
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 25ae83c..9f0777f 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -203,7 +203,7 @@ do_configure_prepend () {
 }
 
 python do_package_prepend() {
-    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
+    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-multimedia/alsa/alsa-fpu.inc b/meta/recipes-multimedia/alsa/alsa-fpu.inc
index 5040230..1ca31e7 100644
--- a/meta/recipes-multimedia/alsa/alsa-fpu.inc
+++ b/meta/recipes-multimedia/alsa/alsa-fpu.inc
@@ -1,6 +1,6 @@
 
 def get_alsa_fpu_setting(bb, d):
-	if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
+	if d.getVar('TARGET_FPU') in [ 'soft' ]:
 		return "--with-softfloat"
 	return ""
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index c24493e..3fdb10e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -3,8 +3,8 @@ PACKAGESPLITFUNCS_append = " set_metapkg_rdepends "
 
 python split_gstreamer10_packages () {
     gst_libdir = d.expand('${libdir}/gstreamer-${LIBV}')
-    postinst = d.getVar('plugin_postinst', True)
-    glibdir = d.getVar('libdir', True)
+    postinst = d.getVar('plugin_postinst')
+    glibdir = d.getVar('libdir')
 
     do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
     do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=postinst, extra_depends='')
@@ -16,14 +16,14 @@ python split_gstreamer10_packages () {
 python set_metapkg_rdepends () {
     import os
 
-    pn = d.getVar('PN', True)
+    pn = d.getVar('PN')
     metapkg =  pn + '-meta'
     d.setVar('ALLOW_EMPTY_' + metapkg, "1")
     d.setVar('FILES_' + metapkg, "")
     blacklist = [ pn, pn + '-locale', pn + '-dev', pn + '-dbg', pn + '-doc', pn + '-meta' ]
     metapkg_rdepends = []
-    packages = d.getVar('PACKAGES', True).split()
-    pkgdest = d.getVar('PKGDEST', True)
+    packages = d.getVar('PACKAGES').split()
+    pkgdest = d.getVar('PKGDEST')
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.count('locale') and not pkg.count('-staticdev'):
             # See if the package is empty by looking at the contents of its PKGDEST subdirectory. 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
index 07e5b7d..05562b1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
@@ -18,7 +18,7 @@ GSTREAMER_1_0_OMX_CORE_NAME ?= "${libdir}/libomxil-bellagio.so.0"
 EXTRA_OECONF += "--disable-valgrind --with-omx-target=${GSTREAMER_1_0_OMX_TARGET}"
 
 python __anonymous () {
-    omx_target = d.getVar("GSTREAMER_1_0_OMX_TARGET", True)
+    omx_target = d.getVar("GSTREAMER_1_0_OMX_TARGET")
     if omx_target in ['generic', 'bellagio']:
         # Bellagio headers are incomplete (they are missing the OMX_VERSION_MAJOR,#
         # OMX_VERSION_MINOR, OMX_VERSION_REVISION, and OMX_VERSION_STEP macros);
@@ -26,7 +26,7 @@ python __anonymous () {
         d.appendVar("CFLAGS", " -I${S}/omx/openmax")
     elif omx_target == "rpi":
         # Dedicated Raspberry Pi OpenMAX IL support makes this package machine specific
-        d.setVar("PACKAGE_ARCH", d.getVar("MACHINE_ARCH", True))
+        d.setVar("PACKAGE_ARCH", d.getVar("MACHINE_ARCH"))
 }
 
 set_omx_core_name() {
diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
index 7ddf671..7c1e5bf 100644
--- a/meta/recipes-rt/images/core-image-rt-sdk.bb
+++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
@@ -4,7 +4,7 @@ require recipes-core/images/core-image-minimal.bb
 # PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
 # to build multiple virtual/kernel providers.
 python () {
-    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-rt":
+    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
diff --git a/meta/recipes-rt/images/core-image-rt.bb b/meta/recipes-rt/images/core-image-rt.bb
index 9c86f25..d8bb04a 100644
--- a/meta/recipes-rt/images/core-image-rt.bb
+++ b/meta/recipes-rt/images/core-image-rt.bb
@@ -4,7 +4,7 @@ require recipes-core/images/core-image-minimal.bb
 # PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
 # to build multiple virtual/kernel providers.
 python () {
-    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-rt":
+    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 370e16f..be6ffe5 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -23,8 +23,8 @@ FILES_lib${BPN} = "${base_libdir}/lib*${SOLIBS}"
 
 BBCLASSEXTEND = "native"
 # Only append ldflags for target recipe and if USE_NLS is enabled
-LDFLAGS_append_libc-uclibc_class-target = "${@['', ' -lintl '][(d.getVar('USE_NLS', True) == 'yes')]}"
-EXTRA_OECONF_append_libc-uclibc_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"
+LDFLAGS_append_libc-uclibc_class-target = "${@['', ' -lintl '][(d.getVar('USE_NLS') == 'yes')]}"
+EXTRA_OECONF_append_libc-uclibc_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS') == 'no')]}"
 
 fix_symlink () {
 	if [ "${BB_CURRENTTASK}" != "populate_sysroot" -a "${BB_CURRENTTASK}" != "populate_sysroot_setscene" ]
diff --git a/meta/recipes-support/boost/boost-1.62.0.inc b/meta/recipes-support/boost/boost-1.62.0.inc
index 1e555e1..1138de6 100644
--- a/meta/recipes-support/boost/boost-1.62.0.inc
+++ b/meta/recipes-support/boost/boost-1.62.0.inc
@@ -7,8 +7,8 @@ HOMEPAGE = "http://www.boost.org/"
 LICENSE = "BSL-1.0 & MIT & Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-BOOST_VER = "${@"_".join(d.getVar("PV", True).split("."))}"
-BOOST_MAJ = "${@"_".join(d.getVar("PV", True).split(".")[0:2])}"
+BOOST_VER = "${@"_".join(d.getVar("PV").split("."))}"
+BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 1966d3d..a1a6a90 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -59,7 +59,7 @@ PACKAGES = "${PN}-dbg ${BOOST_PACKAGES}"
 python __anonymous () {
     packages = []
     extras = []
-    for lib in d.getVar('BOOST_LIBS', True).split( ):
+    for lib in d.getVar('BOOST_LIBS').split( ):
         # BJAM does not know '--with-python3' (only --with-python)
         if lib != "python3":
             extras.append("--with-%s" % lib)
@@ -67,10 +67,10 @@ python __anonymous () {
         packages.append(pkg)
         if lib == "python":
             # special: python*.so matches python3.so !!
-            if not d.getVar("FILES_%s" % pkg, True):
+            if not d.getVar("FILES_%s" % pkg):
                     d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s.so.*" % lib)
         else:
-            if not d.getVar("FILES_%s" % pkg, True):
+            if not d.getVar("FILES_%s" % pkg):
                     d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.so.*" % lib)
     d.setVar("BOOST_PACKAGES", " ".join(packages))
     d.setVar("BJAM_EXTRA", " ".join(extras))
@@ -145,7 +145,7 @@ BJAM_TOOLS   = "--ignore-site-config \
 # use PARALLEL_MAKE to speed up the build, but limit it by -j 64, greater parallelism causes bjam to segfault or to ignore -j
 # https://svn.boost.org/trac/boost/ticket/7634
 def get_boost_parallel_make(d):
-    pm = d.getVar('PARALLEL_MAKE', True)
+    pm = d.getVar('PARALLEL_MAKE')
     if pm:
         # look for '-j' and throw other options (e.g. '-l') away
         # because they might have different meaning in bjam
diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 51b9d2b..4a5c3df 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
 DEPENDS = "nettle gmp virtual/libiconv"
 DEPENDS_append_libc-musl = " argp-standalone"
 
-SHRT_VER = "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', True).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz"
 
diff --git a/meta/recipes-support/icu/icu_57.1.bb b/meta/recipes-support/icu/icu_57.1.bb
index 90c2b82..b8821f9 100644
--- a/meta/recipes-support/icu/icu_57.1.bb
+++ b/meta/recipes-support/icu/icu_57.1.bb
@@ -3,7 +3,7 @@ require icu.inc
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=787d3b37867445c1cdd6f6167bd0e347"
 
 def icu_download_version(d):
-    pvsplit = d.getVar('PV', True).split('.')
+    pvsplit = d.getVar('PV').split('.')
     return pvsplit[0] + "_" + pvsplit[1]
 
 ICU_PV = "${@icu_download_version(d)}"
diff --git a/meta/recipes-support/libiconv/libiconv_1.11.1.bb b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
index 6ce4b96..f28e64a 100644
--- a/meta/recipes-support/libiconv/libiconv_1.11.1.bb
+++ b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/libiconv-${PV}"
 inherit autotools pkgconfig gettext
 
 python __anonymous() {
-    if d.getVar("TCLIBC", True) == "glibc":
+    if d.getVar("TCLIBC") == "glibc":
         raise bb.parse.SkipPackage("libiconv is provided for use with uClibc only - glibc already provides iconv")
 }
 
diff --git a/meta/recipes-support/libiconv/libiconv_1.14.bb b/meta/recipes-support/libiconv/libiconv_1.14.bb
index 1b6fe09..9fd5114 100644
--- a/meta/recipes-support/libiconv/libiconv_1.14.bb
+++ b/meta/recipes-support/libiconv/libiconv_1.14.bb
@@ -23,9 +23,9 @@ S = "${WORKDIR}/libiconv-${PV}"
 inherit autotools pkgconfig gettext
 
 python __anonymous() {
-    if d.getVar("TARGET_OS", True) != "linux":
+    if d.getVar("TARGET_OS") != "linux":
         return
-    if d.getVar("TCLIBC", True) == "glibc":
+    if d.getVar("TCLIBC") == "glibc":
         raise bb.parse.SkipPackage("libiconv is provided for use with uClibc only - glibc already provides iconv")
 }
 
diff --git a/meta/recipes-support/libnl/libnl_3.2.28.bb b/meta/recipes-support/libnl/libnl_3.2.28.bb
index 26982f3..04e2d18 100644
--- a/meta/recipes-support/libnl/libnl_3.2.28.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV', True).replace('.','_')}/${BP}.tar.gz \
+SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
            file://fix-pktloc_syntax_h-race.patch \
            file://fix-pc-file.patch \
            file://0001-lib-add-utility-function-nl_strerror_l.patch \
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.56.0.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.56.0.bb
index 16c6068..a1f294e 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.56.0.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.56.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native"
 
-SHRT_VER = "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', True).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 5bff33b..3d668c8 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -5,7 +5,7 @@ SECTION = "libs"
 PE = "3"
 
 def sqlite_download_version(d):
-    pvsplit = d.getVar('PV', True).split('.')
+    pvsplit = d.getVar('PV').split('.')
     if len(pvsplit) < 4:
         pvsplit.append('0')
     return pvsplit[0] + ''.join([part.rjust(2,'0') for part in pvsplit[1:]])
diff --git a/meta/recipes-support/taglib/taglib_1.11.bb b/meta/recipes-support/taglib/taglib_1.11.bb
index c29bda9..7eb7e09 100644
--- a/meta/recipes-support/taglib/taglib_1.11.bb
+++ b/meta/recipes-support/taglib/taglib_1.11.bb
@@ -21,7 +21,7 @@ inherit cmake pkgconfig binconfig-disabled
 PACKAGES =+ "${PN}-c"
 FILES_${PN}-c = "${libdir}/libtag_c.so.*"
 
-EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
+EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 
 do_configure_prepend () {
 	rm -f ${S}/admin/ltmain.sh
diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index 389fb97..7ce7186 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -76,7 +76,7 @@ def collect_pkgs(data_dict):
     for fn in data_dict:
         pkgconfigflags = data_dict[fn].getVarFlags("PACKAGECONFIG")
         pkgconfigflags.pop('doc', None)
-        pkgname = data_dict[fn].getVar("P", True)
+        pkgname = data_dict[fn].getVar("P")
         pkg_dict[pkgname] = sorted(pkgconfigflags.keys())
 
     return pkg_dict
@@ -124,9 +124,9 @@ def display_all(data_dict):
     ''' Display all pkgs and PACKAGECONFIG information '''
     print(str("").ljust(50, '='))
     for fn in data_dict:
-        print('%s' % data_dict[fn].getVar("P", True))
+        print('%s' % data_dict[fn].getVar("P"))
         print(fn)
-        packageconfig = data_dict[fn].getVar("PACKAGECONFIG", True) or ''
+        packageconfig = data_dict[fn].getVar("PACKAGECONFIG") or ''
         if packageconfig.strip() == '':
             packageconfig = 'None'
         print('PACKAGECONFIG %s' % packageconfig)
diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
index d39dd1d..76f1749 100755
--- a/scripts/contrib/verify-homepage.py
+++ b/scripts/contrib/verify-homepage.py
@@ -44,7 +44,7 @@ def verifyHomepage(bbhandler):
             if realfn in checked:
                 continue
             data = bbhandler.parse_recipe_file(realfn)
-            homepage = data.getVar("HOMEPAGE", True)
+            homepage = data.getVar("HOMEPAGE")
             if homepage:
                 try:
                     urllib.request.urlopen(homepage, timeout=5)
diff --git a/scripts/devtool b/scripts/devtool
index 0c32c50..c23999e 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -290,7 +290,7 @@ def main():
     if global_args.bbpath is None:
         tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
         try:
-            global_args.bbpath = tinfoil.config_data.getVar('BBPATH', True)
+            global_args.bbpath = tinfoil.config_data.getVar('BBPATH')
         finally:
             tinfoil.shutdown()
 
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 31ecb65..4348789 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -87,13 +87,13 @@ def exec_watch(cmd, **options):
 def exec_fakeroot(d, cmd, **kwargs):
     """Run a command under fakeroot (pseudo, in fact) so that it picks up the appropriate file permissions"""
     # Grab the command and check it actually exists
-    fakerootcmd = d.getVar('FAKEROOTCMD', True)
+    fakerootcmd = d.getVar('FAKEROOTCMD')
     if not os.path.exists(fakerootcmd):
         logger.error('pseudo executable %s could not be found - have you run a build yet? pseudo-native should install this and if you have run any build then that should have been built')
         return 2
     # Set up the appropriate environment
     newenv = dict(os.environ)
-    fakerootenv = d.getVar('FAKEROOTENV', True)
+    fakerootenv = d.getVar('FAKEROOTENV')
     for varvalue in fakerootenv.split():
         if '=' in varvalue:
             splitval = varvalue.split('=', 1)
@@ -191,7 +191,7 @@ def use_external_build(same_dir, no_same_dir, d):
         logger.info('Using source tree as build directory since --same-dir specified')
     elif bb.data.inherits_class('autotools-brokensep', d):
         logger.info('Using source tree as build directory since recipe inherits autotools-brokensep')
-    elif d.getVar('B', True) == os.path.abspath(d.getVar('S', True)):
+    elif d.getVar('B') == os.path.abspath(d.getVar('S')):
         logger.info('Using source tree as build directory since that would be the default for this recipe')
     else:
         b_is_s = False
@@ -268,7 +268,7 @@ def ensure_npm(config, basepath, fixed_setup=False):
     """
     tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
     try:
-        nativepath = tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE', True)
+        nativepath = tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE')
     finally:
         tinfoil.shutdown()
 
diff --git a/scripts/lib/devtool/build_image.py b/scripts/lib/devtool/build_image.py
index ae75511..e581038 100644
--- a/scripts/lib/devtool/build_image.py
+++ b/scripts/lib/devtool/build_image.py
@@ -34,8 +34,8 @@ def _get_packages(tinfoil, workspace, config):
     result = []
     for recipe in workspace:
         data = parse_recipe(config, tinfoil, recipe, True)
-        if 'class-target' in data.getVar('OVERRIDES', True).split(':'):
-            if recipe in data.getVar('PACKAGES', True).split():
+        if 'class-target' in data.getVar('OVERRIDES').split(':'):
+            if recipe in data.getVar('PACKAGES').split():
                 result.append(recipe)
             else:
                 logger.warning("Skipping recipe %s as it doesn't produce a "
@@ -95,7 +95,7 @@ def build_image_task(config, basepath, workspace, image, add_packages=None, task
             raise TargetNotImageError()
 
         # Get the actual filename used and strip the .bb and full path
-        target_basename = rd.getVar('FILE', True)
+        target_basename = rd.getVar('FILE')
         target_basename = os.path.splitext(os.path.basename(target_basename))[0]
         config.set('SDK', 'target_basename', target_basename)
         config.write()
@@ -132,9 +132,9 @@ def build_image_task(config, basepath, workspace, image, add_packages=None, task
                             afile.write('%s\n' % line)
 
             if task in ['populate_sdk', 'populate_sdk_ext']:
-                outputdir = rd.getVar('SDK_DEPLOY', True)
+                outputdir = rd.getVar('SDK_DEPLOY')
             else:
-                outputdir = rd.getVar('DEPLOY_DIR_IMAGE', True)
+                outputdir = rd.getVar('DEPLOY_DIR_IMAGE')
 
             tmp_tinfoil = tinfoil
             tinfoil = None
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index c4c7bf6..df0d298 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -160,7 +160,7 @@ def deploy(args, config, basepath, workspace):
         except Exception as e:
             raise DevtoolError('Exception parsing recipe %s: %s' %
                             (args.recipename, e))
-        recipe_outdir = rd.getVar('D', True)
+        recipe_outdir = rd.getVar('D')
         if not os.path.exists(recipe_outdir) or not os.listdir(recipe_outdir):
             raise DevtoolError('No files to deploy - have you built the %s '
                             'recipe? If so, the install step has not installed '
diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
index afb5809..495269a 100644
--- a/scripts/lib/devtool/package.py
+++ b/scripts/lib/devtool/package.py
@@ -34,7 +34,7 @@ def package(args, config, basepath, workspace):
 
         image_pkgtype = config.get('Package', 'image_pkgtype', '')
         if not image_pkgtype:
-            image_pkgtype = tinfoil.config_data.getVar('IMAGE_PKGTYPE', True)
+            image_pkgtype = tinfoil.config_data.getVar('IMAGE_PKGTYPE')
 
         deploy_dir_pkg = tinfoil.config_data.getVar('DEPLOY_DIR_%s' % image_pkgtype.upper(), True)
     finally:
diff --git a/scripts/lib/devtool/runqemu.py b/scripts/lib/devtool/runqemu.py
index ae25cee..641664e 100644
--- a/scripts/lib/devtool/runqemu.py
+++ b/scripts/lib/devtool/runqemu.py
@@ -31,8 +31,8 @@ def runqemu(args, config, basepath, workspace):
 
     tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
     try:
-        machine = tinfoil.config_data.getVar('MACHINE', True)
-        bindir_native = tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE', True)
+        machine = tinfoil.config_data.getVar('MACHINE')
+        bindir_native = tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE')
     finally:
         tinfoil.shutdown()
 
diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 922277b..f629db1 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -132,9 +132,9 @@ def sdk_update(args, config, basepath, workspace):
     # Grab variable values
     tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
     try:
-        stamps_dir = tinfoil.config_data.getVar('STAMPS_DIR', True)
-        sstate_mirrors = tinfoil.config_data.getVar('SSTATE_MIRRORS', True)
-        site_conf_version = tinfoil.config_data.getVar('SITE_CONF_VERSION', True)
+        stamps_dir = tinfoil.config_data.getVar('STAMPS_DIR')
+        sstate_mirrors = tinfoil.config_data.getVar('SSTATE_MIRRORS')
+        site_conf_version = tinfoil.config_data.getVar('SITE_CONF_VERSION')
     finally:
         tinfoil.shutdown()
 
@@ -273,7 +273,7 @@ def sdk_install(args, config, basepath, workspace):
             rd = parse_recipe(config, tinfoil, recipe, True)
             if not rd:
                 return 1
-            stampprefixes[recipe] = '%s.%s' % (rd.getVar('STAMP', True), tasks[0])
+            stampprefixes[recipe] = '%s.%s' % (rd.getVar('STAMP'), tasks[0])
             if checkstamp(recipe):
                 logger.info('%s is already installed' % recipe)
             else:
diff --git a/scripts/lib/devtool/search.py b/scripts/lib/devtool/search.py
index b44bed7..054985b 100644
--- a/scripts/lib/devtool/search.py
+++ b/scripts/lib/devtool/search.py
@@ -31,7 +31,7 @@ def search(args, config, basepath, workspace):
 
     tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
     try:
-        pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
+        pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
         defsummary = tinfoil.config_data.getVar('SUMMARY', False) or ''
 
         keyword_rc = re.compile(args.keyword)
@@ -70,7 +70,7 @@ def search(args, config, basepath, workspace):
 
             if match:
                 rd = parse_recipe(config, tinfoil, fn, True)
-                summary = rd.getVar('SUMMARY', True)
+                summary = rd.getVar('SUMMARY')
                 if summary == rd.expand(defsummary):
                     summary = ''
                 print("%s  %s" % (fn.ljust(20), summary))
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e4d2a57..77ed492 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -303,7 +303,7 @@ def _check_compatible_recipe(pn, d):
         raise DevtoolError("The %s recipe is a meta-recipe, and therefore is "
                            "not supported by this tool" % pn, 4)
 
-    if bb.data.inherits_class('externalsrc', d) and d.getVar('EXTERNALSRC', True):
+    if bb.data.inherits_class('externalsrc', d) and d.getVar('EXTERNALSRC'):
         # Not an incompatibility error per se, so we don't pass the error code
         raise DevtoolError("externalsrc is currently enabled for the %s "
                            "recipe. This prevents the normal do_patch task "
@@ -433,7 +433,7 @@ class BbTaskExecutor(object):
                     self.exec_func(taskdepfunc, True)
             if report:
                 logger.info('Executing %s...' % func)
-            fn = self.rdata.getVar('FILE', True)
+            fn = self.rdata.getVar('FILE')
             localdata = bb.build._task_data(fn, func, self.rdata)
             try:
                 bb.build.exec_func(func, localdata)
@@ -452,7 +452,7 @@ class PatchTaskExecutor(BbTaskExecutor):
 
     def exec_func(self, func, report):
         from oe.patch import GitApplyTree
-        srcsubdir = self.rdata.getVar('S', True)
+        srcsubdir = self.rdata.getVar('S')
         haspatches = False
         if func == 'do_patch':
             patchdir = os.path.join(srcsubdir, 'patches')
@@ -514,7 +514,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
     if hasattr(bb.event, 'set_eventfilter'):
         bb.event.set_eventfilter(eventfilter)
 
-    pn = d.getVar('PN', True)
+    pn = d.getVar('PN')
 
     _check_compatible_recipe(pn, d)
 
@@ -552,13 +552,13 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
         workdir = os.path.join(tempdir, 'workdir')
         crd.setVar('WORKDIR', workdir)
         crd.setVar('T', os.path.join(tempdir, 'temp'))
-        if not crd.getVar('S', True).startswith(workdir):
+        if not crd.getVar('S').startswith(workdir):
             # Usually a shared workdir recipe (kernel, gcc)
             # Try to set a reasonable default
             if bb.data.inherits_class('kernel', d):
                 crd.setVar('S', '${WORKDIR}/source')
             else:
-                crd.setVar('S', '${WORKDIR}/%s' % os.path.basename(d.getVar('S', True)))
+                crd.setVar('S', '${WORKDIR}/%s' % os.path.basename(d.getVar('S')))
         if bb.data.inherits_class('kernel', d):
             # We don't want to move the source to STAGING_KERNEL_DIR here
             crd.setVar('STAGING_KERNEL_DIR', '${S}')
@@ -575,7 +575,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
             # Extra step for kernel to populate the source directory
             logger.info('Doing kernel checkout...')
             task_executor.exec_func('do_kernel_checkout', False)
-        srcsubdir = crd.getVar('S', True)
+        srcsubdir = crd.getVar('S')
 
         task_executor.check_git = True
 
@@ -625,7 +625,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
                            "doesn't use any source or the correct source "
                            "directory could not be determined" % pn)
 
-        setup_git_repo(srcsubdir, crd.getVar('PV', True), devbranch, d=d)
+        setup_git_repo(srcsubdir, crd.getVar('PV'), devbranch, d=d)
 
         (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srcsubdir)
         initial_rev = stdout.rstrip()
@@ -642,7 +642,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
             # Store generate and store kernel config
             logger.info('Generating kernel config')
             task_executor.exec_func('do_configure', False)
-            kconfig = os.path.join(crd.getVar('B', True), '.config')
+            kconfig = os.path.join(crd.getVar('B'), '.config')
 
 
         tempdir_localdir = os.path.join(tempdir, 'oe-local-files')
@@ -674,7 +674,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
 
             shutil.move(srcsubdir, srctree)
 
-            if os.path.abspath(d.getVar('S', True)) == os.path.abspath(d.getVar('WORKDIR', True)):
+            if os.path.abspath(d.getVar('S')) == os.path.abspath(d.getVar('WORKDIR')):
                 # If recipe extracts to ${WORKDIR}, symlink the files into the srctree
                 # (otherwise the recipe won't build as expected)
                 local_files_dir = os.path.join(srctree, 'oe-local-files')
@@ -773,7 +773,7 @@ def modify(args, config, basepath, workspace):
         if not rd:
             return 1
 
-        pn = rd.getVar('PN', True)
+        pn = rd.getVar('PN')
         if pn != args.recipename:
             logger.info('Mapping %s to %s' % (args.recipename, pn))
         if pn in workspace:
@@ -795,7 +795,7 @@ def modify(args, config, basepath, workspace):
                 # Error already shown
                 return 1
 
-        recipefile = rd.getVar('FILE', True)
+        recipefile = rd.getVar('FILE')
         appendfile = recipe_to_append(recipefile, config, args.wildcard)
         if os.path.exists(appendfile):
             raise DevtoolError("Another variant of recipe %s is already in your "
@@ -832,8 +832,8 @@ def modify(args, config, basepath, workspace):
                     initial_rev = stdout.rstrip()
 
         # Check that recipe isn't using a shared workdir
-        s = os.path.abspath(rd.getVar('S', True))
-        workdir = os.path.abspath(rd.getVar('WORKDIR', True))
+        s = os.path.abspath(rd.getVar('S'))
+        workdir = os.path.abspath(rd.getVar('WORKDIR'))
         if s.startswith(workdir) and s != workdir and os.path.dirname(s) != workdir:
             # Handle if S is set to a subdirectory of the source
             srcsubdir = os.path.relpath(s, workdir).split(os.sep, 1)[1]
@@ -914,17 +914,17 @@ def rename(args, config, basepath, workspace):
         if not rd:
             return 1
 
-        bp = rd.getVar('BP', True)
-        bpn = rd.getVar('BPN', True)
+        bp = rd.getVar('BP')
+        bpn = rd.getVar('BPN')
         if newname != args.recipename:
             localdata = rd.createCopy()
             localdata.setVar('PN', newname)
-            newbpn = localdata.getVar('BPN', True)
+            newbpn = localdata.getVar('BPN')
         else:
             newbpn = bpn
         s = rd.getVar('S', False)
         src_uri = rd.getVar('SRC_URI', False)
-        pv = rd.getVar('PV', True)
+        pv = rd.getVar('PV')
 
         # Correct variable values that refer to the upstream source - these
         # values must stay the same, so if the name/version are changing then
@@ -1325,8 +1325,8 @@ def _export_local_files(srctree, rd, destdir):
             elif fname != '.gitignore':
                 added[fname] = None
 
-        workdir = rd.getVar('WORKDIR', True)
-        s = rd.getVar('S', True)
+        workdir = rd.getVar('WORKDIR')
+        s = rd.getVar('S')
         if not s.endswith(os.sep):
             s += os.sep
 
@@ -1348,14 +1348,14 @@ def _export_local_files(srctree, rd, destdir):
 
 def _determine_files_dir(rd):
     """Determine the appropriate files directory for a recipe"""
-    recipedir = rd.getVar('FILE_DIRNAME', True)
-    for entry in rd.getVar('FILESPATH', True).split(':'):
+    recipedir = rd.getVar('FILE_DIRNAME')
+    for entry in rd.getVar('FILESPATH').split(':'):
         relpth = os.path.relpath(entry, recipedir)
         if not os.sep in relpth:
             # One (or zero) levels below only, so we don't put anything in machine-specific directories
             if os.path.isdir(entry):
                 return entry
-    return os.path.join(recipedir, rd.getVar('BPN', True))
+    return os.path.join(recipedir, rd.getVar('BPN'))
 
 
 def _update_recipe_srcrev(srctree, rd, appendlayerdir, wildcard_version, no_remove):
@@ -1363,7 +1363,7 @@ def _update_recipe_srcrev(srctree, rd, appendlayerdir, wildcard_version, no_remo
     import bb
     import oe.recipeutils
 
-    recipefile = rd.getVar('FILE', True)
+    recipefile = rd.getVar('FILE')
     logger.info('Updating SRCREV in recipe %s' % os.path.basename(recipefile))
 
     # Get HEAD revision
@@ -1445,7 +1445,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
     import bb
     import oe.recipeutils
 
-    recipefile = rd.getVar('FILE', True)
+    recipefile = rd.getVar('FILE')
     append = workspace[recipename]['bbappend']
     if not os.path.exists(append):
         raise DevtoolError('unable to find workspace bbappend for recipe %s' %
@@ -1456,7 +1456,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
         raise DevtoolError('Unable to find initial revision - please specify '
                            'it with --initial-rev')
 
-    dl_dir = rd.getVar('DL_DIR', True)
+    dl_dir = rd.getVar('DL_DIR')
     if not dl_dir.endswith('/'):
         dl_dir += '/'
 
@@ -1615,7 +1615,7 @@ def update_recipe(args, config, basepath, workspace):
         updated = _update_recipe(args.recipename, workspace, rd, args.mode, args.append, args.wildcard_version, args.no_remove, args.initial_rev)
 
         if updated:
-            rf = rd.getVar('FILE', True)
+            rf = rd.getVar('FILE')
             if rf.startswith(config.workspace_path):
                 logger.warn('Recipe file %s has been updated but is inside the workspace - you will need to move it (and any associated files next to it) out to the desired layer before using "devtool reset" in order to keep any changes' % rf)
     finally:
@@ -1719,7 +1719,7 @@ def reset(args, config, basepath, workspace):
 
 def _get_layer(layername, d):
     """Determine the base layer path for the specified layer name/path"""
-    layerdirs = d.getVar('BBLAYERS', True).split()
+    layerdirs = d.getVar('BBLAYERS').split()
     layers = {os.path.basename(p): p for p in layerdirs}
     # Provide some shortcuts
     if layername.lower() in ['oe-core', 'openembedded-core']:
@@ -1745,7 +1745,7 @@ def finish(args, config, basepath, workspace):
             return 1
 
         destlayerdir = _get_layer(args.destination, tinfoil.config_data)
-        origlayerdir = oe.recipeutils.find_layerdir(rd.getVar('FILE', True))
+        origlayerdir = oe.recipeutils.find_layerdir(rd.getVar('FILE'))
 
         if not os.path.isdir(destlayerdir):
             raise DevtoolError('Unable to find layer or directory matching "%s"' % args.destination)
@@ -1776,7 +1776,7 @@ def finish(args, config, basepath, workspace):
             if not destpath:
                 raise DevtoolError("Unable to determine destination layer path - check that %s specifies an actual layer and %s/conf/layer.conf specifies BBFILES. You may also need to specify a more complete path." % (args.destination, destlayerdir))
             # Warn if the layer isn't in bblayers.conf (the code to create a bbappend will do this in other cases)
-            layerdirs = [os.path.abspath(layerdir) for layerdir in rd.getVar('BBLAYERS', True).split()]
+            layerdirs = [os.path.abspath(layerdir) for layerdir in rd.getVar('BBLAYERS').split()]
             if not os.path.abspath(destlayerdir) in layerdirs:
                 bb.warn('Specified destination layer is not currently enabled in bblayers.conf, so the %s recipe will now be unavailable in your current configuration until you add the layer there' % args.recipename)
 
@@ -1806,7 +1806,7 @@ def finish(args, config, basepath, workspace):
             # associated files to the specified layer
             no_clean = True
             logger.info('Moving recipe file to %s' % destpath)
-            recipedir = os.path.dirname(rd.getVar('FILE', True))
+            recipedir = os.path.dirname(rd.getVar('FILE'))
             for root, _, files in os.walk(recipedir):
                 for fn in files:
                     srcpath = os.path.join(root, fn)
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index a4239f1..86d5561 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -68,7 +68,7 @@ def _remove_patch_dirs(recipefolder):
             shutil.rmtree(os.path.join(root,d))
 
 def _recipe_contains(rd, var):
-    rf = rd.getVar('FILE', True)
+    rf = rd.getVar('FILE')
     varfiles = oe.recipeutils.get_var_files(rf, [var], rd)
     for var, fn in varfiles.items():
         if fn and fn.startswith(os.path.dirname(rf) + os.sep):
@@ -132,7 +132,7 @@ def _write_append(rc, srctree, same_dir, no_same_dir, rev, copied, workspace, d)
         if rev:
             f.write('# initial_rev: %s\n' % rev)
         if copied:
-            f.write('# original_path: %s\n' % os.path.dirname(d.getVar('FILE', True)))
+            f.write('# original_path: %s\n' % os.path.dirname(d.getVar('FILE')))
             f.write('# original_files: %s\n' % ' '.join(copied))
     return af
 
@@ -154,7 +154,7 @@ def _upgrade_error(e, rf, srctree):
     raise DevtoolError(e)
 
 def _get_uri(rd):
-    srcuris = rd.getVar('SRC_URI', True).split()
+    srcuris = rd.getVar('SRC_URI').split()
     if not len(srcuris):
         raise DevtoolError('SRC_URI not found on recipe')
     # Get first non-local entry in SRC_URI - usually by convention it's
@@ -185,7 +185,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
 
     crd = rd.createCopy()
 
-    pv = crd.getVar('PV', True)
+    pv = crd.getVar('PV')
     crd.setVar('PV', newpv)
 
     tmpsrctree = None
@@ -270,15 +270,15 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
 def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil, rd):
     """Creates the new recipe under workspace"""
 
-    bpn = rd.getVar('BPN', True)
+    bpn = rd.getVar('BPN')
     path = os.path.join(workspace, 'recipes', bpn)
     bb.utils.mkdirhier(path)
     copied, _ = oe.recipeutils.copy_recipe_files(rd, path)
 
-    oldpv = rd.getVar('PV', True)
+    oldpv = rd.getVar('PV')
     if not newpv:
         newpv = oldpv
-    origpath = rd.getVar('FILE', True)
+    origpath = rd.getVar('FILE')
     fullpath = _rename_recipe_files(origpath, bpn, oldpv, newpv, path)
     logger.debug('Upgraded %s => %s' % (origpath, fullpath))
 
@@ -341,7 +341,7 @@ def upgrade(args, config, basepath, workspace):
         if not rd:
             return 1
 
-        pn = rd.getVar('PN', True)
+        pn = rd.getVar('PN')
         if pn != args.recipename:
             logger.info('Mapping %s to %s' % (args.recipename, pn))
         if pn in workspace:
@@ -353,12 +353,12 @@ def upgrade(args, config, basepath, workspace):
             srctree = standard.get_default_srctree(config, pn)
 
         standard._check_compatible_recipe(pn, rd)
-        old_srcrev = rd.getVar('SRCREV', True)
+        old_srcrev = rd.getVar('SRCREV')
         if old_srcrev == 'INVALID':
             old_srcrev = None
         if old_srcrev and not args.srcrev:
             raise DevtoolError("Recipe specifies a SRCREV value; you must specify a new one when upgrading")
-        if rd.getVar('PV', True) == args.version and old_srcrev == args.srcrev:
+        if rd.getVar('PV') == args.version and old_srcrev == args.srcrev:
             raise DevtoolError("Current and upgrade versions are the same version")
 
         rf = None
diff --git a/scripts/lib/devtool/utilcmds.py b/scripts/lib/devtool/utilcmds.py
index b761a80..0437e64 100644
--- a/scripts/lib/devtool/utilcmds.py
+++ b/scripts/lib/devtool/utilcmds.py
@@ -39,7 +39,7 @@ def edit_recipe(args, config, basepath, workspace):
             rd = parse_recipe(config, tinfoil, args.recipename, True)
             if not rd:
                 return 1
-            recipefile = rd.getVar('FILE', True)
+            recipefile = rd.getVar('FILE')
         finally:
             tinfoil.shutdown()
     else:
@@ -62,20 +62,20 @@ def configure_help(args, config, basepath, workspace):
         rd = parse_recipe(config, tinfoil, args.recipename, appends=True, filter_workspace=False)
         if not rd:
             return 1
-        b = rd.getVar('B', True)
-        s = rd.getVar('S', True)
+        b = rd.getVar('B')
+        s = rd.getVar('S')
         configurescript = os.path.join(s, 'configure')
         confdisabled = 'noexec' in rd.getVarFlags('do_configure') or 'do_configure' not in (rd.getVar('__BBTASKS', False) or [])
-        configureopts = oe.utils.squashspaces(rd.getVar('CONFIGUREOPTS', True) or '')
-        extra_oeconf = oe.utils.squashspaces(rd.getVar('EXTRA_OECONF', True) or '')
-        extra_oecmake = oe.utils.squashspaces(rd.getVar('EXTRA_OECMAKE', True) or '')
-        do_configure = rd.getVar('do_configure', True) or ''
+        configureopts = oe.utils.squashspaces(rd.getVar('CONFIGUREOPTS') or '')
+        extra_oeconf = oe.utils.squashspaces(rd.getVar('EXTRA_OECONF') or '')
+        extra_oecmake = oe.utils.squashspaces(rd.getVar('EXTRA_OECMAKE') or '')
+        do_configure = rd.getVar('do_configure') or ''
         do_configure_noexpand = rd.getVar('do_configure', False) or ''
         packageconfig = rd.getVarFlags('PACKAGECONFIG') or []
         autotools = bb.data.inherits_class('autotools', rd) and ('oe_runconf' in do_configure or 'autotools_do_configure' in do_configure)
         cmake = bb.data.inherits_class('cmake', rd) and ('cmake_do_configure' in do_configure)
-        cmake_do_configure = rd.getVar('cmake_do_configure', True)
-        pn = rd.getVar('PN', True)
+        cmake_do_configure = rd.getVar('cmake_do_configure')
+        pn = rd.getVar('PN')
     finally:
         tinfoil.shutdown()
 
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 1e0fc1e..575c5dc 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -48,7 +48,7 @@ def find_target_file(targetpath, d, pkglist=None):
     """Find the recipe installing the specified target path, optionally limited to a select list of packages"""
     import json
 
-    pkgdata_dir = d.getVar('PKGDATA_DIR', True)
+    pkgdata_dir = d.getVar('PKGDATA_DIR')
 
     # The mix between /etc and ${sysconfdir} here may look odd, but it is just
     # being consistent with usage elsewhere
@@ -123,8 +123,8 @@ def determine_file_source(targetpath, rd):
     import oe.recipeutils
 
     # See if it's in do_install for the recipe
-    workdir = rd.getVar('WORKDIR', True)
-    src_uri = rd.getVar('SRC_URI', True)
+    workdir = rd.getVar('WORKDIR')
+    src_uri = rd.getVar('SRC_URI')
     srcfile = ''
     modpatches = []
     elements = check_do_install(rd, targetpath)
@@ -203,7 +203,7 @@ def get_source_path(cmdelements):
 
 def get_func_deps(func, d):
     """Find the function dependencies of a shell function"""
-    deps = bb.codeparser.ShellParser(func, logger).parse_shell(d.getVar(func, True))
+    deps = bb.codeparser.ShellParser(func, logger).parse_shell(d.getVar(func))
     deps |= set((d.getVarFlag(func, "vardeps", True) or "").split())
     funcdeps = []
     for dep in deps:
@@ -213,12 +213,12 @@ def get_func_deps(func, d):
 
 def check_do_install(rd, targetpath):
     """Look at do_install for a command that installs/copies the specified target path"""
-    instpath = os.path.abspath(os.path.join(rd.getVar('D', True), targetpath.lstrip('/')))
-    do_install = rd.getVar('do_install', True)
+    instpath = os.path.abspath(os.path.join(rd.getVar('D'), targetpath.lstrip('/')))
+    do_install = rd.getVar('do_install')
     # Handle where do_install calls other functions (somewhat crudely, but good enough for this purpose)
     deps = get_func_deps('do_install', rd)
     for dep in deps:
-        do_install = do_install.replace(dep, rd.getVar(dep, True))
+        do_install = do_install.replace(dep, rd.getVar(dep))
 
     # Look backwards through do_install as we want to catch where a later line (perhaps
     # from a bbappend) is writing over the top
@@ -335,12 +335,12 @@ def appendfile(args):
 def appendsrc(args, files, rd, extralines=None):
     import oe.recipeutils
 
-    srcdir = rd.getVar('S', True)
-    workdir = rd.getVar('WORKDIR', True)
+    srcdir = rd.getVar('S')
+    workdir = rd.getVar('WORKDIR')
 
     import bb.fetch
     simplified = {}
-    src_uri = rd.getVar('SRC_URI', True).split()
+    src_uri = rd.getVar('SRC_URI').split()
     for uri in src_uri:
         if uri.endswith(';'):
             uri = uri[:-1]
@@ -353,7 +353,7 @@ def appendsrc(args, files, rd, extralines=None):
     for newfile, srcfile in files.items():
         src_destdir = os.path.dirname(srcfile)
         if not args.use_workdir:
-            if rd.getVar('S', True) == rd.getVar('STAGING_KERNEL_DIR', True):
+            if rd.getVar('S') == rd.getVar('STAGING_KERNEL_DIR'):
                 srcdir = os.path.join(workdir, 'git')
                 if not bb.data.inherits_class('kernel-yocto', rd):
                     logger.warn('S == STAGING_KERNEL_DIR and non-kernel-yocto, unable to determine path to srcdir, defaulting to ${WORKDIR}/git')
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index ab26531..0801223 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -68,8 +68,8 @@ class RecipeHandler(object):
             return
         # First build up library->package mapping
         shlib_providers = oe.package.read_shlib_providers(d)
-        libdir = d.getVar('libdir', True)
-        base_libdir = d.getVar('base_libdir', True)
+        libdir = d.getVar('libdir')
+        base_libdir = d.getVar('base_libdir')
         libpaths = list(set([base_libdir, libdir]))
         libname_re = re.compile('^lib(.+)\.so.*$')
         pkglibmap = {}
@@ -85,7 +85,7 @@ class RecipeHandler(object):
                         logger.debug('unable to extract library name from %s' % lib)
 
         # Now turn it into a library->recipe mapping
-        pkgdata_dir = d.getVar('PKGDATA_DIR', True)
+        pkgdata_dir = d.getVar('PKGDATA_DIR')
         for libname, pkg in pkglibmap.items():
             try:
                 with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
@@ -109,9 +109,9 @@ class RecipeHandler(object):
         '''Build up development file->recipe mapping'''
         if RecipeHandler.recipeheadermap:
             return
-        pkgdata_dir = d.getVar('PKGDATA_DIR', True)
-        includedir = d.getVar('includedir', True)
-        cmakedir = os.path.join(d.getVar('libdir', True), 'cmake')
+        pkgdata_dir = d.getVar('PKGDATA_DIR')
+        includedir = d.getVar('includedir')
+        cmakedir = os.path.join(d.getVar('libdir'), 'cmake')
         for pkg in glob.glob(os.path.join(pkgdata_dir, 'runtime', '*-dev')):
             with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
                 pn = None
@@ -140,9 +140,9 @@ class RecipeHandler(object):
         '''Build up native binary->recipe mapping'''
         if RecipeHandler.recipebinmap:
             return
-        sstate_manifests = d.getVar('SSTATE_MANIFESTS', True)
-        staging_bindir_native = d.getVar('STAGING_BINDIR_NATIVE', True)
-        build_arch = d.getVar('BUILD_ARCH', True)
+        sstate_manifests = d.getVar('SSTATE_MANIFESTS')
+        staging_bindir_native = d.getVar('STAGING_BINDIR_NATIVE')
+        build_arch = d.getVar('BUILD_ARCH')
         fileprefix = 'manifest-%s-' % build_arch
         for fn in glob.glob(os.path.join(sstate_manifests, '%s*-native.populate_sysroot' % fileprefix)):
             with open(fn, 'r') as f:
@@ -837,7 +837,7 @@ def get_license_md5sums(d, static_only=False):
     md5sums = {}
     if not static_only:
         # Gather md5sums of license files in common license dir
-        commonlicdir = d.getVar('COMMON_LICENSE_DIR', True)
+        commonlicdir = d.getVar('COMMON_LICENSE_DIR')
         for fn in os.listdir(commonlicdir):
             md5value = bb.utils.md5_file(os.path.join(commonlicdir, fn))
             md5sums[md5value] = fn
@@ -1007,7 +1007,7 @@ def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=None, pn
     return outlicenses
 
 def read_pkgconfig_provides(d):
-    pkgdatadir = d.getVar('PKGDATA_DIR', True)
+    pkgdatadir = d.getVar('PKGDATA_DIR')
     pkgmap = {}
     for fn in glob.glob(os.path.join(pkgdatadir, 'shlibs2', '*.pclist')):
         with open(fn, 'r') as f:
@@ -1117,7 +1117,7 @@ def convert_rpm_xml(xmlfile):
 
 
 def check_npm(d, debugonly=False):
-    if not os.path.exists(os.path.join(d.getVar('STAGING_BINDIR_NATIVE', True), 'npm')):
+    if not os.path.exists(os.path.join(d.getVar('STAGING_BINDIR_NATIVE'), 'npm')):
         log_error_cond('npm required to process specified source, but npm is not available - you need to build nodejs-native first', debugonly)
         sys.exit(14)
 
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index e41d81a..53902ab 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -532,11 +532,11 @@ class PythonRecipeHandler(RecipeHandler):
 
     def parse_pkgdata_for_python_packages(self):
         suffixes = [t[0] for t in imp.get_suffixes()]
-        pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
+        pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
 
         ldata = tinfoil.config_data.createCopy()
         bb.parse.handle('classes/python-dir.bbclass', ldata, True)
-        python_sitedir = ldata.getVar('PYTHON_SITEPACKAGES_DIR', True)
+        python_sitedir = ldata.getVar('PYTHON_SITEPACKAGES_DIR')
 
         dynload_dir = os.path.join(os.path.dirname(python_sitedir), 'lib-dynload')
         python_dirs = [python_sitedir + os.sep,
diff --git a/scripts/lib/recipetool/create_kernel.py b/scripts/lib/recipetool/create_kernel.py
index 7dac59f..ca4996c 100644
--- a/scripts/lib/recipetool/create_kernel.py
+++ b/scripts/lib/recipetool/create_kernel.py
@@ -41,7 +41,7 @@ class KernelRecipeHandler(RecipeHandler):
         handled.append('buildsystem')
         del lines_after[:]
         del classes[:]
-        template = os.path.join(tinfoil.config_data.getVar('COREBASE', True), 'meta-skeleton', 'recipes-kernel', 'linux', 'linux-yocto-custom.bb')
+        template = os.path.join(tinfoil.config_data.getVar('COREBASE'), 'meta-skeleton', 'recipes-kernel', 'linux', 'linux-yocto-custom.bb')
         def handle_var(varname, origvalue, op, newlines):
             if varname in ['SRCREV', 'SRCREV_machine']:
                 while newlines[-1].startswith('#'):
@@ -85,7 +85,7 @@ class KernelRecipeHandler(RecipeHandler):
             elif varname == 'COMPATIBLE_MACHINE':
                 while newlines[-1].startswith('#'):
                     del newlines[-1]
-                machine = tinfoil.config_data.getVar('MACHINE', True)
+                machine = tinfoil.config_data.getVar('MACHINE')
                 return machine, op, 0, True
             return origvalue, op, 0, True
         with open(template, 'r') as f:
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 7bb844c..888aa2b 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -49,7 +49,7 @@ class NpmRecipeHandler(RecipeHandler):
 
     def _shrinkwrap(self, srctree, localfilesdir, extravalues, lines_before):
         try:
-            runenv = dict(os.environ, PATH=tinfoil.config_data.getVar('PATH', True))
+            runenv = dict(os.environ, PATH=tinfoil.config_data.getVar('PATH'))
             bb.process.run('npm shrinkwrap', cwd=srctree, stderr=subprocess.STDOUT, env=runenv, shell=True)
         except bb.process.ExecutionError as e:
             logger.warn('npm shrinkwrap failed:\n%s' % e.stdout)
@@ -62,7 +62,7 @@ class NpmRecipeHandler(RecipeHandler):
         lines_before.append('NPM_SHRINKWRAP := "${THISDIR}/${PN}/npm-shrinkwrap.json"')
 
     def _lockdown(self, srctree, localfilesdir, extravalues, lines_before):
-        runenv = dict(os.environ, PATH=tinfoil.config_data.getVar('PATH', True))
+        runenv = dict(os.environ, PATH=tinfoil.config_data.getVar('PATH'))
         if not NpmRecipeHandler.lockdownpath:
             NpmRecipeHandler.lockdownpath = tempfile.mkdtemp('recipetool-npm-lockdown')
             bb.process.run('npm install lockdown --prefix %s' % NpmRecipeHandler.lockdownpath,
@@ -257,7 +257,7 @@ class NpmRecipeHandler(RecipeHandler):
         if version != '*' and not '/' in version:
             pkgfullname += "@'%s'" % version
         logger.debug(2, "Calling getdeps on %s" % pkg)
-        runenv = dict(os.environ, PATH=d.getVar('PATH', True))
+        runenv = dict(os.environ, PATH=d.getVar('PATH'))
         fetchcmd = "npm view %s --json" % pkgfullname
         output, _ = bb.process.run(fetchcmd, stderr=subprocess.STDOUT, env=runenv, shell=True)
         data = self._parse_view(output)
diff --git a/scripts/lib/recipetool/newappend.py b/scripts/lib/recipetool/newappend.py
index fbdd7bc..ccfb726 100644
--- a/scripts/lib/recipetool/newappend.py
+++ b/scripts/lib/recipetool/newappend.py
@@ -72,7 +72,7 @@ def newappend(args):
     if not path_ok:
         logger.warn('Unable to determine correct subdirectory path for bbappend file - check that what %s adds to BBFILES also matches .bbappend files. Using %s for now, but until you fix this the bbappend will not be applied.', os.path.join(args.destlayer, 'conf', 'layer.conf'), os.path.dirname(append_path))
 
-    layerdirs = [os.path.abspath(layerdir) for layerdir in rd.getVar('BBLAYERS', True).split()]
+    layerdirs = [os.path.abspath(layerdir) for layerdir in rd.getVar('BBLAYERS').split()]
     if not os.path.abspath(args.destlayer) in layerdirs:
         logger.warn('Specified layer is not currently enabled in bblayers.conf, you will need to add it before this bbappend will be active')
 
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 5ccc027..d95ccb0 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -89,7 +89,7 @@ def fetch_uri(d, uri, destdir, srcrev=None):
         fetcher.download()
         for u in fetcher.ud:
             ud = fetcher.ud[u]
-            if ud.localpath.rstrip(os.sep) == localdata.getVar('DL_DIR', True).rstrip(os.sep):
+            if ud.localpath.rstrip(os.sep) == localdata.getVar('DL_DIR').rstrip(os.sep):
                 raise Exception('Local path is download directory - please check that the URI "%s" is correct' % uri)
         fetcher.unpack(destdir)
         for u in fetcher.ud:
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index dbffd6a..11af391 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -570,7 +570,7 @@ def main():
         logger.debug('Found bitbake path: %s' % bitbakepath)
         tinfoil = tinfoil_init()
         try:
-            args.pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
+            args.pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
         finally:
             tinfoil.shutdown()
         logger.debug('Value of PKGDATA_DIR is "%s"' % args.pkgdata_dir)
diff --git a/scripts/recipetool b/scripts/recipetool
index 1052cd2..75d80a6 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -79,7 +79,7 @@ def main():
     tinfoil = tinfoil_init(False)
     try:
         for path in ([scripts_path] +
-                    tinfoil.config_data.getVar('BBPATH', True).split(':')):
+                    tinfoil.config_data.getVar('BBPATH').split(':')):
             pluginpath = os.path.join(path, 'lib', 'recipetool')
             scriptutils.load_plugins(logger, plugins, pluginpath)
 
-- 
2.7.4


