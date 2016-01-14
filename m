Return-Path: <Peter.Seebach@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 453F0731EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 21:04:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0EL4iCm019263
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:04:44 -0800
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 13:04:43 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jan 2016 15:04:41 -0600
Message-ID: <f6baa71e96dbb72af5d9a48fcea142544bc47795.1452805356.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <cover.1452805356.git.peter.seebach@windriver.com>
References: <cover.1452805356.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] Use TUNE_CCARGS for target compilation
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
X-List-Received-Date: Thu, 14 Jan 2016 21:04:44 -0000
Content-Type: text/plain

The initial gcc configuration is using TARGET_CFLAGS, but this is
probably not what is intended, because TARGET_CFLAGS doesn't include
any architecture-specific flags.

For PPC64, it's possible to end up with gcc configured to pass -a64 to
the assembler, but be itself getting invoked without -m64, which can result
in alignment problems in generated code. Solution: Instead of setting
CFLAGS_FOR_TARGET to TARGET_CFLAGS, set it to TARGET_CFLAGS + TUNE_CCARGS.

However, for crosssdk cases, we need to prevent that from having any
effect; this can be done by emptying out the TUNE_*ARGS flags in the
crosssdk bbclass, because there is no "target tune" in crosssdk cases.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/crosssdk.bbclass                      | 4 ++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc            | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 7315c38..ccff3ce 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -6,6 +6,10 @@ PACKAGE_ARCH = "${SDK_ARCH}"
 python () {
 	# set TUNE_PKGARCH to SDK_ARCH
 	d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH', True))
+	# We're not running a 'target', so clear these...
+	d.setVar('TUNE_CCARGS', '')
+	d.setVar('TUNE_LDARGS', '')
+	d.setVar('TUNE_ASARGS', '')
 }
 
 STAGING_DIR_TARGET = "${STAGING_DIR}/${SDK_ARCH}-${SDKPKGSUFFIX}${SDK_VENDOR}-${SDK_OS}"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 45b3f15..4b4d91d 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -120,7 +120,7 @@ do_configure () {
 	export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
 	export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
 	export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
-	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
+	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS} ${TUNE_CCARGS}"
 	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
 	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
 	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index aa10633..b6020a4 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -43,7 +43,7 @@ do_compile () {
 	export LD_FOR_TARGET="${TARGET_SYS}-ld"
 	export NM_FOR_TARGET="${TARGET_SYS}-nm"
 	export CC_FOR_TARGET="${CCACHE} ${TARGET_SYS}-gcc"
-	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
+	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS} ${TUNE_CCARGS}"
 	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
 	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
 	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
-- 
2.3.1


