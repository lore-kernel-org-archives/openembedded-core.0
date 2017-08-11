Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 46D6378279
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 09:48:42 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Aug 2017 02:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,356,1498546800"; d="scan'208";a="117958437"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 11 Aug 2017 02:48:42 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 12:45:19 +0300
Message-Id: <20170811094519.27645-5-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170811094519.27645-1-alexander.kanavin@linux.intel.com>
References: <20170811094519.27645-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/5] selftest: fix distrodata.py to use per-recipe UPSTREAM_VERSION_UNKNOWN setting
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
X-List-Received-Date: Fri, 11 Aug 2017 09:48:42 -0000

... instead of a global exception list which was problematic.

[YOCTO #11896]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-selftest/files/distrodata/checkpkg_exceptions | 28 ----------------------
 meta/lib/oeqa/selftest/cases/distrodata.py         | 15 +++++-------
 meta/recipes-core/dbus-wait/dbus-wait_git.bb       |  1 +
 meta/recipes-core/ovmf/ovmf_git.bb                 |  1 +
 meta/recipes-core/psplash/psplash_git.bb           |  1 +
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |  1 +
 .../build-compare/build-compare_git.bb             |  1 +
 meta/recipes-devtools/distcc/distcc_3.2.bb         |  1 +
 meta/recipes-devtools/gnu-config/gnu-config_git.bb |  2 +-
 meta/recipes-devtools/llvm/llvm_git.bb             |  1 +
 meta/recipes-devtools/mmc/mmc-utils_git.bb         |  1 +
 meta/recipes-devtools/rpm/rpm_git.bb               |  1 +
 .../squashfs-tools/squashfs-tools_git.bb           |  1 +
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |  1 +
 meta/recipes-extended/lsb/lsb_4.1.bb               |  1 +
 meta/recipes-extended/unzip/unzip_6.0.bb           |  1 +
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |  1 +
 meta/recipes-extended/zip/zip_3.0.bb               |  1 +
 meta/recipes-graphics/fstests/fstests_git.bb       |  1 +
 meta/recipes-graphics/kmscube/kmscube_git.bb       |  1 +
 meta/recipes-graphics/piglit/piglit_git.bb         |  1 +
 meta/recipes-graphics/vulkan/vulkan-demos_git.bb   |  1 +
 .../xcursor-transparent-theme_git.bb               |  1 +
 .../recipes-graphics/xorg-lib/libxcalibrate_git.bb |  1 +
 .../xorg-proto/calibrateproto_git.bb               |  2 ++
 .../xvideo-tests/xvideo-tests_git.bb               |  1 +
 .../linux-firmware/linux-firmware_git.bb           |  1 +
 .../recipes-multimedia/gstreamer/gst-player_git.bb |  1 +
 meta/recipes-multimedia/x264/x264_git.bb           |  1 +
 meta/recipes-sato/puzzles/puzzles_git.bb           |  1 +
 30 files changed, 35 insertions(+), 38 deletions(-)
 delete mode 100644 meta-selftest/files/distrodata/checkpkg_exceptions

diff --git a/meta-selftest/files/distrodata/checkpkg_exceptions b/meta-selftest/files/distrodata/checkpkg_exceptions
deleted file mode 100644
index d87a80de7a7..00000000000
--- a/meta-selftest/files/distrodata/checkpkg_exceptions
+++ /dev/null
@@ -1,28 +0,0 @@
-build-compare
-calibrateproto
-dbus-wait
-distcc
-fstests
-gnu-config
-gst-player
-kmscube
-libxcalibrate
-linux-firmware
-llvm
-lsb
-mmc-utils
-ovmf
-piglit
-psplash
-puzzles
-rpm
-squashfs-tools
-tcf-agent
-unzip
-update-rc.d
-vulkan-demos
-x264
-xcursor-transparent-theme
-xinetd
-xvideo-tests
-zip
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index d5d286d5cc3..ecb15d9aea8 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -8,7 +8,6 @@ class Distrodata(OESelftestTestCase):
     @classmethod
     def setUpClass(cls):
         super(Distrodata, cls).setUpClass()
-        cls.exceptions_path = os.path.join(cls.testlayer_path, 'files', 'distrodata', "checkpkg_exceptions")
 
     def test_checkpkg(self):
         """
@@ -23,21 +22,19 @@ class Distrodata(OESelftestTestCase):
         self.write_config(feature)
         bitbake('-c checkpkg world')
         checkpkg_result = open(os.path.join(get_bb_var("LOG_DIR"), "checkpkg.csv")).readlines()[1:]
-        exceptions = [exc.strip() for exc in open(self.exceptions_path).readlines()]
-        failed_upstream_checks = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[11] == '']
-        regressed_failures = set(failed_upstream_checks) - set(exceptions)
-        regressed_successes = set(exceptions) - set(failed_upstream_checks)
+        regressed_failures = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[11] == 'UNKNOWN_BROKEN']
+        regressed_successes = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[11] == 'KNOWN_BROKEN']
         msg = ""
         if len(regressed_failures) > 0:
             msg = msg + """
 The following packages failed upstream version checks. Please fix them using UPSTREAM_CHECK_URI/UPSTREAM_CHECK_REGEX
 (when using tarballs) or UPSTREAM_CHECK_GITTAGREGEX (when using git). If an upstream version check cannot be performed
-(for example, if upstream does not use git tags), you can add the package to list of exceptions in
-meta-selftest/files/distrodata/checkpkg_exceptions.
+(for example, if upstream does not use git tags), you can set UPSTREAM_VERSION_UNKNOWN to '1' in the recipe to acknowledge
+that the check cannot be performed.
 """ + "\n".join(regressed_failures)
         if len(regressed_successes) > 0:
             msg = msg + """
-The following packages have been checked successfully for upstream versions (or they no longer exist in oe-core),
-but are in the exceptions list in meta-selftest/files/distrodata/checkpkg_exceptions. Please remove them from that list.
+The following packages have been checked successfully for upstream versions,
+but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please remove that line from the recipes.
 """ + "\n".join(regressed_successes)
         self.assertTrue(len(regressed_failures) == 0 and len(regressed_successes) == 0, msg)
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index 691dc86e928..4afb90c20a5 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -11,6 +11,7 @@ PV = "0.1+git${SRCPV}"
 PR = "r2"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN}"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 28f0cde1d9b..1872c950cab 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
 	file://0001-ia32-Dont-use-pie.patch \
 	file://no-stack-protector-all-archs.patch \
         "
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 OPENSSL_RELEASE = "openssl-1.1.0e"
 
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 44297e1a69d..1339f1eec11 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -12,6 +12,7 @@ PR = "r15"
 SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://psplash-init \
            ${SPLASH_IMAGES}"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 SPLASH_IMAGES = "file://psplash-poky-img.h;outsuffix=default"
 
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
index 3b965c50b40..72d2cbdbc1c 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/philb/update-rc.d.git \
            file://check-if-symlinks-are-valid.patch \
            file://fix-to-handle-priority-numbers-correctly.patch \
           "
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index c60c1641031..84d04cfa0d3 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/openSUSE/build-compare.git \
 SRCREV = "c5352c054c6ef15735da31b76d6d88620f4aff0a"
 PE = "1"
 PV = "2015.02.10+git${SRCPV}"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb b/meta/recipes-devtools/distcc/distcc_3.2.bb
index ea3d7c10be8..b6da65a582a 100644
--- a/meta/recipes-devtools/distcc/distcc_3.2.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.2.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/distcc/distcc.git;branch=${PV} \
            file://distcc.service"
 SRCREV = "d8b18df3e9dcbe4f092bed565835d3975e99432c"
 S = "${WORKDIR}/git"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 inherit autotools pkgconfig update-rc.d useradd systemd
 
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index f1c77884ea1..4fded60f197 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -13,8 +13,8 @@ PV = "20150728+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-
 S = "${WORKDIR}/git"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 CLEANBROKEN = "1"
 
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index f36e6978ede..93bb13f2d1f 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=release_50;protocol=http
            file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
            file://0002-llvm-allow-env-override-of-exe-path.patch \
           "
+UPSTREAM_VERSION_UNKNOWN = "1"
 S = "${WORKDIR}/git"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 6dcc3676c28..50acdb1cc2a 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -9,6 +9,7 @@ SRCREV = "37c86e60c0442fef570b75cd81aeb1db4d0cbafd"
 PV = "0.1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH}"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index d9ff2c7fa5b..59836d0b11d 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm \
            file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
            file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
            "
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 PV = "4.13.90+git${SRCPV}"
 PE = "1"
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 33ed09ae8a0..4f68d011310 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
            file://0001-mksquashfs.c-get-inline-functions-work-with-C99.patch;striplevel=2 \
            file://fix-compat.patch \
 "
+UPSTREAM_VERSION_UNKNOWN = "1"
 SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
 SRC_URI[lzma.sha256sum] = "c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e0880aa0fa1e"
 
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 6d6ba76ba88..9db26dccc7c 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent;branch=1.4_ne
            file://tcf-agent.init \
            file://tcf-agent.service \
           "
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 DEPENDS = "util-linux openssl"
 RDEPENDS_${PN} = "bash"
diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index c8db1a8156b..07856108b04 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar
            file://lsb_pidofproc \
            file://lsb_start_daemon \
            "
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
 SRC_URI[sha256sum] = "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fdf17172"
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index d4ee4874179..105d048f55b 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://18-cve-2014-9913-unzip-buffer-overflow.patch \
 	file://19-cve-2016-9844-zipinfo-buffer-overflow.patch \
 "
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
 SRC_URI[sha256sum] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 6bfaabe829c..1beb5456e19 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/xinetd-org/xinetd.git;protocol=https \
       file://0001-configure-Use-HAVE_SYS_RESOURCE_H-to-guard-sys-resou.patch \
       file://xinetd.service \
       "
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 SRCREV = "68bb9ab9e9f214ad8a2322f28ac1d6733e70bc24"
 
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 087423a0453..de779e94aae 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -11,6 +11,7 @@ S = "${WORKDIR}/zip30"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.gz \
            file://fix-security-format.patch"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 SRC_URI[md5sum] = "7b74551e63f8ee6aab6fbc86676c0d37"
 SRC_URI[sha256sum] = "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369"
diff --git a/meta/recipes-graphics/fstests/fstests_git.bb b/meta/recipes-graphics/fstests/fstests_git.bb
index 95c33f410b1..9e09cd2685b 100644
--- a/meta/recipes-graphics/fstests/fstests_git.bb
+++ b/meta/recipes-graphics/fstests/fstests_git.bb
@@ -8,6 +8,7 @@ SRCREV = "e5939ff608b95cdd4d0ab0e1935781ab9a276ac0"
 PV = "0.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN}"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 LIC_FILES_CHKSUM = "file://test-pango-gdk.c;endline=24;md5=1ee74ec851ecda57eb7ac6cc180f7655"
 
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 9050671ab16..cab68fffb43 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315
 
 SRCREV = "0d8de4ce3a03f36af1817f9b0586d132ad2c5d2e"
 SRC_URI = "git://anongit.freedesktop.org/mesa/kmscube;branch=master;protocol=git"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 3f437981094..d274a8fbd56 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
            "
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 # From 2017-07-03
 SRCREV = "c8f4fd9eeb298a2ef0855927f22634f794ef3eff"
diff --git a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
index e088277a7ae..828ef501a7e 100644
--- a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/SaschaWillems/Vulkan.git \
            file://0001-Don-t-build-demos-with-questionably-licensed-data.patch \
            file://0001-Fix-build-on-x86.patch \
 "
+UPSTREAM_VERSION_UNKNOWN = "1"
 SRCREV = "18df00c7b4677b0889486e16977857aa987947e2"
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
index b871d89f9fa..733ebce7450 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
@@ -11,6 +11,7 @@ SRCREV = "23c8af5ba4a1b7efbaf0bbca59a65ff7e10a1a06"
 PV = "0.1.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb b/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
index 455e869c7a9..7c7fa3ddb3c 100644
--- a/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
@@ -16,6 +16,7 @@ PV = "0.0+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate \
            file://fix-xcb.patch"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb b/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb
index b88d1579238..3a989262c1d 100644
--- a/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb
+++ b/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb
@@ -17,3 +17,5 @@ PR = "r2"
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/calibrateproto \
            file://fix.patch;apply=yes"
 S = "${WORKDIR}/git"
+UPSTREAM_VERSION_UNKNOWN = "1"
+
diff --git a/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
index 51839ddf79f..2667dd899d9 100644
--- a/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
+++ b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
@@ -8,6 +8,7 @@ SRCREV = "7d38b881e99eb74169d292b40f7164e461a65092"
 PV = "0.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/test-xvideo"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 53089f27678..62271574014 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -186,6 +186,7 @@ SRC_URI += "https://git.kernel.org/cgit/linux/kernel/git/iwlwifi/linux-firmware.
 
 SRC_URI[iwlwifi-19.md5sum] = "132fbaee36beec5e98714f0bd66f7a1d"
 SRC_URI[iwlwifi-19.sha256sum] = "2034470df64d323b827c4f2d4d0d55be2846b7360179b5574aa28ff77b6c9471"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index cb12a464a4c..f3580570b4e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/sdroege/gst-player.git \
 
 SRCREV = "ee3c226c82767a089743e4e06058743e67f73cdb"
 PV = "0.0.1+git${SRCPV}"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 69f52c2b36b..c5476c7a9b3 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/mirror/x264;branch=stable \
            file://don-t-default-to-cortex-a9-with-neon.patch \
            file://Fix-X32-build-by-disabling-asm.patch \
            "
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 SRCREV = "2b741f81e51f92d053d87a49f59ff1026553a0f6"
 
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 7b8495ff75d..decd2a8b300 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://0001-Clarify-conditions-to-avoid-compiler-errors.patch \
            file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
            "
+UPSTREAM_VERSION_UNKNOWN = "1"
 SRCREV = "8dfe5cec31e784e4ece2955ecc8cc35ee7e8fbb3"
 PE = "1"
 PV = "0.0+git${SRCPV}"
-- 
2.13.2


