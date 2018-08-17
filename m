Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0153E791F0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 04:29:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7H4TcnC002674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 21:29:39 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 16 Aug 2018 21:29:38 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2018 21:29:37 -0700
Message-ID: <20180817042938.59347-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 1/2] populate_sdk_base: only depend on nativesdk-glibc-locale when SDK_OS is not mingw32
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
X-List-Received-Date: Fri, 17 Aug 2018 04:29:38 -0000
Content-Type: text/plain

When we add the nativesdk-glibc-locale dependence for libc-glibc, if the SDK_OS
is mingw32, it will broken the building with the following error:
>NOTE: Resolving any missing task queue dependencies
>ERROR: Nothing RPROVIDES 'nativesdk-glibc' (but virtual:nativesdk:layers/oe-core/meta/recipes-core/glibc/glibc-locale_2.24.bb
>RDEPENDS on or otherwise requires it)
>ERROR: nativesdk-glibc was skipped: PREFERRED_PROVIDER_virtual/nativesdk-libc set to nativesdk-mingw-w64-runtime, not nativesdk-glibc
>NOTE: Runtime target 'nativesdk-glibc' is unbuildable, removing...
>Missing or unbuildable dependency chain was: ['nativesdk-glibc']
>ERROR: Required build target 'meta-toolchain' has no buildable providers.
>Missing or unbuildable dependency chain was: ['meta-toolchain', 'nativesdk-glibc-locale', 'nativesdk-glibc']

mingw32 SDK_OS doesn't need to depend on nativesdk-glibc-locale.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index c456c52866..65c27b0077 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -48,7 +48,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
 SDK_DEPENDS = "virtual/fakeroot-native xz-native cross-localedef-native nativesdk-qemuwrapper-cross ${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross"
 PATH_prepend = "${STAGING_DIR_HOST}${SDKPATHNATIVE}${bindir}/crossscripts:${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
-SDK_DEPENDS_append_libc-glibc = " nativesdk-glibc-locale"
+SDK_DEPENDS_append_libc-glibc = " ${@bb.utils.contains('SDK_OS', 'mingw32', '', 'nativesdk-glibc-locale', d)}"
 
 # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
 # could be set to the MACHINE_ARCH
-- 
2.17.1


