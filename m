Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 696F960620
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:11:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 20 Nov 2015 06:11:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,323,1444719600"; d="scan'208";a="855904261"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 20 Nov 2015 06:11:19 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 16:08:48 +0200
Message-Id: <ea9390c0c962c3e5446a1cc648db4bbea7eeb3d0.1448028339.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
References: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
References: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/9] package_regex.inc: split GITTAGREGEX entries into recipe files
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
X-List-Received-Date: Fri, 20 Nov 2015 14:11:19 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/package_regex.inc         | 26 ----------------------
 .../glibc/cross-localedef-native_2.22.bb           |  1 +
 meta/recipes-core/glibc/glibc_2.22.bb              |  1 +
 meta/recipes-core/uclibc/uclibc-git.inc            |  3 +++
 meta/recipes-devtools/binutils/binutils-2.25.1.inc |  2 ++
 .../bootchart2/bootchart2_0.14.7.bb                |  2 ++
 meta/recipes-devtools/file/file_5.24.bb            |  3 +++
 meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb |  1 +
 .../recipes-devtools/sgmlspl/sgmlspl-native_git.bb |  1 +
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |  1 +
 .../chkconfig-alternatives-native_1.3.59.bb        |  1 +
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |  3 +++
 meta/recipes-graphics/mx/mx-1.0_1.4.7.bb           |  3 +++
 .../xorg-driver/xf86-video-omapfb_git.bb           |  3 +++
 meta/recipes-kernel/linux/linux-yocto.inc          |  2 ++
 15 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/meta/conf/distro/include/package_regex.inc b/meta/conf/distro/include/package_regex.inc
index 2216b41..2eaaca4 100644
--- a/meta/conf/distro/include/package_regex.inc
+++ b/meta/conf/distro/include/package_regex.inc
@@ -182,32 +182,6 @@ REGEX_URI_pn-pcmanfm = "http://sourceforge.net/projects/pcmanfm/files/PCManFM%20
 REGEX_URI_pn-libcgroup = "http://sourceforge.net/projects/libcg/files/libcgroup/"
 REGEX_URI_pn-cdrtools = "http://sourceforge.net/projects/cdrtools/files/alpha/"
 
-# GIT
-GITTAGREGEX_COMMON = "(?P<pver>\d+\.\d+(\.\d+)*)"
-
-GITTAGREGEX_pn-linux-yocto = "${GITTAGREGEX_COMMON}"
-GITTAGREGEX_pn-linux-yocto-tiny = "${GITTAGREGEX_COMMON}"
-GITTAGREGEX_pn-linux-yocto-dev = "${GITTAGREGEX_COMMON}"
-GITTAGREGEX_pn-uclibc = "${GITTAGREGEX_COMMON}"
-GITTAGREGEX_pn-glibc = "${GITTAGREGEX_COMMON}"
-GITTAGREGEX_pn-cross-localedef = "${GITTAGREGEX_COMMON}"
-GITTAGREGEX_pn-binutils = "binutils-(?P<pver>\d+_(\d_?)*)"
-GITTAGREGEX_pn-bootchart2 = "${GITTAGREGEX_COMMON}"
-GITTAGREGEX_pn-remake = "(?P<pver>(\d+(\.\d+)+)\+dbg.+)"
-GITTAGREGEX_pn-tcf-agent = "(?P<pver>(\d+(\.\d+)+))"
-GITTAGREGEX_pn-chkconfig-alternatives = "chkconfig-(?P<pver>(\d+(\.\d+)+))"
-GITTAGREGEX_pn-sgmlspl = "(?P<pver>(\d+(\.\d+)+))"
-
-# Exclude x.99.x versions
-GITTAGREGEX_pn-mx-1.0 = "(?P<pver>^\d+(\.(?!99)\d+)+)"
-
-# Blacklist a bogus tag
-GITTAGREGEX_pn-file = "FILE(?P<pver>(?!6_23).+)"
-GITTAGREGEX_pn-xinetd = "xinetd-(?P<pver>(?!20030122).+)"
-
-# Blacklist debian-specific tags
-GITTAGREGEX_pn-xf86-video-omapfb = "(?P<pver>\d+(\.\d+)+)(?!-)"
-
 # Keep old gcc versions at their major versions
 REGEX_pn-gcc-source-4.9.3 = "gcc-(?P<pver>4\.9\.\d+).tar"
 REGEX_pn-gcc-source-4.8.4 = "gcc-(?P<pver>4\.8\.\d+).tar"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
index 03be9c0..7cfd698 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
@@ -16,6 +16,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
 SRCBRANCH ?= "release/${PV}/master"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
+GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
diff --git a/meta/recipes-core/glibc/glibc_2.22.bb b/meta/recipes-core/glibc/glibc_2.22.bb
index 1b23597..947beef 100644
--- a/meta/recipes-core/glibc/glibc_2.22.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -12,6 +12,7 @@ SRCREV ?= "a34d1c6afc86521d6ad17662a3b5362d8481514c"
 SRCBRANCH ?= "release/${PV}/master"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
+GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0004-Backport-https-sourceware.org-ml-libc-ports-2007-12-.patch \
diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index dcb616d..958a4ec 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -21,3 +21,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
         file://0001-wire-in-syncfs.patch \
 "
 S = "${WORKDIR}/git"
+
+GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
+
diff --git a/meta/recipes-devtools/binutils/binutils-2.25.1.inc b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
index f3817fa..6b9a152 100644
--- a/meta/recipes-devtools/binutils/binutils-2.25.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
@@ -16,6 +16,8 @@ def binutils_branch_version(d):
 
 BINUPV = "${@binutils_branch_version(d)}"
 
+GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
+
 SRCREV = "2bd25930221dea4bf33c13a89c111514491440e2"
 SRC_URI = "\
      git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb
index 4b0a980..7c82e4e 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb
@@ -88,6 +88,8 @@ HOMEPAGE = "https://github.com/mmeeks/bootchart"
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=44ac4678311254db62edf8fd39cb8124"
 
+GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
+
 SRC_URI = "git://github.com/mmeeks/bootchart.git \
            file://bootchartd_stop.sh \
           "
diff --git a/meta/recipes-devtools/file/file_5.24.bb b/meta/recipes-devtools/file/file_5.24.bb
index d04f121..e67ffdc 100644
--- a/meta/recipes-devtools/file/file_5.24.bb
+++ b/meta/recipes-devtools/file/file_5.24.bb
@@ -11,6 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03
 DEPENDS = "zlib file-replacement-native"
 DEPENDS_class-native = "zlib-native"
 
+# Blacklist a bogus tag in upstream check
+GITTAGREGEX = "FILE(?P<pver>(?!6_23).+)"
+
 SRC_URI = "git://github.com/file/file.git \
         file://debian-742262.patch \
         file://0001-Add-P-prompt-into-Usage-info.patch \
diff --git a/meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb b/meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb
index c61913d..3ba31f4 100644
--- a/meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb
+++ b/meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://glob/COPYING.LIB;md5=4a770b67e6be0f60da244beb2de0fce4"
 require remake.inc
 
+GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+)\+dbg.+)"
 SRC_URI += "file://version-remake.texi.patch \
            "
 SRCREV = "cf54641d50a0165bb17622b3e9770f426ccbc561"
diff --git a/meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb b/meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb
index 5e3460f..9091f3d 100644
--- a/meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb
+++ b/meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb
@@ -4,6 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
+GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 SRC_URI = "git://github.com/gitpan/SGMLSpm \
           "
 
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index f8fd390..fd63cb0 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 SRCREV = "b9a735e9c7cf82f80d412b7ab15d08b89d5a4ccc"
 PV = "1.3.0+git${SRCPV}"
 
+GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;branch=1.3_mars_bugfix \
            file://fix_ranlib.patch \
            file://tcf-agent.init \
diff --git a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb b/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
index 7fd34aa..72f446e 100644
--- a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 # support for alternatives.
 SRC_URI = "git://github.com/kergoth/chkconfig;branch=sysroot"
 S = "${WORKDIR}/git"
+GITTAGREGEX = "chkconfig-(?P<pver>(\d+(\.\d+)+))"
 
 SRCREV = "cd437ecbd8986c894442f8fce1e0061e20f04dee"
 PV = "1.3.59+${SRCPV}"
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 9af45a5..334220e 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -9,6 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
 DEPENDS = ""
 PR = "r2"
 
+# Blacklist a bogus tag in upstream check
+GITTAGREGEX = "xinetd-(?P<pver>(?!20030122).+)"
+
 SRC_URI = "git://github.com/xinetd-org/xinetd.git;protocol=https \
       file://xinetd.init \
       file://xinetd.conf \
diff --git a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb b/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
index ce35b61..0f19271 100644
--- a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
+++ b/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
@@ -4,6 +4,9 @@ require mx.inc
 SRCREV = "9b1db6b8060bd00b121a692f942404a24ae2960f"
 PV = "1.4.7+git${SRCPV}"
 
+# Exclude x.99.x versions from upstream checks
+GITTAGREGEX = "(?P<pver>^\d+(\.(?!99)\d+)+)"
+
 SRC_URI = "git://github.com/clutter-project/mx.git;branch=mx-1.4 \
 	   file://fix-build-dir.patch \
 	   file://fix-test-includes.patch \
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
index 0eeb870..9a058ec 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
@@ -13,6 +13,9 @@ SRCREV = "33e36c12dde336edbdd34626dd8adfcaebc8fbb8"
 PR = "${INC_PR}.7"
 PV = "0.1.1+gitr${SRCPV}"
 
+# Blacklist debian-specific tags in upstream version check
+GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)(?!-)"
+
 SRC_URI = "git://anonscm.debian.org/collab-maint/xf86-video-omapfb.git \
   file://0001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch \
   file://0001-Revert-Set-a-large-CRTC-upper-limit-to-not-prune-lar.patch \
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index e0524de..79d6876 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -4,6 +4,8 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
+GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
+
 INC_PR = "r4"
 
 DEPENDS += "xz-native bc-native"
-- 
2.6.2


