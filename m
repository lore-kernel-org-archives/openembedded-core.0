Return-Path: <n.merinov@inango-systems.com>
Received: from main-1.inango.com (main-1.inango-systems.com [5.189.174.2])
	by mail.openembedded.org (Postfix) with ESMTP id A2E2E6FF80
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 08:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by main-1.inango.com (Postfix) with ESMTP id 005DF4C1251
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 10:02:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.inango-systems.com
Received: from main-1.inango.com ([127.0.0.1])
	by localhost (main-1.inango.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GIreCAGbLH6Q; Thu,  5 Oct 2017 10:02:50 +0200 (CEST)
Received: from nmerinov.inango-sw (unknown [194.60.247.123])
	by main-1.inango.com (Postfix) with ESMTPSA id DC3AE4C1140;
	Thu,  5 Oct 2017 10:02:49 +0200 (CEST)
From: Nikolay Merinov <n.merinov@inango-systems.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 13:02:27 +0500
Message-Id: <20171005080227.20685-1-n.merinov@inango-systems.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH] cross.bbclass: Remove usage of host flags for cross-compilation
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
X-List-Received-Date: Thu, 05 Oct 2017 08:02:51 -0000

BUILD_* flags can't be used as TARGET_* flags even for "cross" packages.

gcc-cross buils leaks config.log's through "gcc-stashed-builddir" and
TARGET_* flags to libgcc cross-build through "gcc/libgcc.mvars" file
on "gcc-stashed-builddir". This means that if BUILD_CFLAGS contains
host-specific flags like "-isystem/usr/include" libgcc build will
fail "do_qa_configure" and "do_package_qa" checks.

Remove host-related flags from TARGET_* flags for gcc-cross build.

Signed-off-by: Nikolay Merinov <n.merinov@inango-systems.com>
---
 meta/classes/cross.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 4887317a9a..29d4424829 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -28,10 +28,10 @@ MULTIMACH_TARGET_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
 export PKG_CONFIG_DIR = "${exec_prefix}/lib/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = ""
 
-TARGET_CPPFLAGS = "${BUILD_CPPFLAGS}"
-TARGET_CFLAGS = "${BUILD_CFLAGS}"
-TARGET_CXXFLAGS = "${BUILD_CXXFLAGS}"
-TARGET_LDFLAGS = "${BUILD_LDFLAGS}"
+TARGET_CPPFLAGS = ""
+TARGET_CFLAGS = ""
+TARGET_CXXFLAGS = ""
+TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
 
 CPPFLAGS = "${BUILD_CPPFLAGS}"
 CFLAGS = "${BUILD_CFLAGS}"
-- 
2.14.2


