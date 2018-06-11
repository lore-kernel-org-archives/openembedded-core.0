Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 1A18F78BB9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 13:38:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jun 2018 06:38:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,502,1520924400"; d="scan'208";a="46241318"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga007.fm.intel.com with ESMTP; 11 Jun 2018 06:38:01 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2018 16:38:21 +0300
Message-Id: <20180611133822.32004-5-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180611133822.32004-1-alexander.kanavin@linux.intel.com>
References: <20180611133822.32004-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/6] image.bbclass, populate_sdk_base.bbclass: make all variants of qemuwrapper-cross available in sysroots
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
X-List-Received-Date: Mon, 11 Jun 2018 13:38:01 -0000

The variants are needed in particular when executing postinst_intercepts as
those may require running binaries built for different architectures and
against different sets of library paths, when multilib is in use (or nativesdk host
packages are installed), so a single global variant of the script was not working.

I do understand expanding PATH and DEPENDS in this manner is hackish, however
every other approach I could think of is worse.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/image.bbclass             | 3 ++-
 meta/classes/populate_sdk_base.bbclass | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2247b305da8..16c6b1256e2 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -11,9 +11,10 @@ POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks; "
 
 LICENSE ?= "MIT"
 PACKAGES = ""
-DEPENDS += "${MLPREFIX}qemuwrapper-cross depmodwrapper-cross"
+DEPENDS += "${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross depmodwrapper-cross"
 RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
 RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
+PATH_prepend = "${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 3da350747e2..aae6786e586 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -46,7 +46,8 @@ TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-SDK_DEPENDS = "virtual/fakeroot-native xz-native cross-localedef-native ${MLPREFIX}qemuwrapper-cross"
+SDK_DEPENDS = "virtual/fakeroot-native xz-native cross-localedef-native nativesdk-qemuwrapper-cross ${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross"
+PATH_prepend = "${STAGING_DIR_HOST}${SDKPATHNATIVE}${bindir}/crossscripts:${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
 SDK_DEPENDS_append_libc-glibc = " nativesdk-glibc-locale"
 
 # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
-- 
2.17.0


