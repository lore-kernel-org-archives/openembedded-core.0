Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 44A7960557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 08:49:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t698nBH5023014
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jul 2015 01:49:11 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 9 Jul 2015 01:49:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Jul 2015 01:49:10 -0700
Message-ID: <16a9c9dec5e36b652e35a37a0e6bb4aa78d4ce60.1436431714.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436431714.git.liezhi.yang@windriver.com>
References: <cover.1436431714.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] populate_sdk_base.bbclass: don't inherit toolchain-scripts.bbclass
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
X-List-Received-Date: Thu, 09 Jul 2015 08:49:11 -0000
Content-Type: text/plain

Fixed when enable multilib:
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake core-image-minimal
No lib32 package should be built since we don't build
lib32-core-image-minimal, but a lot them are built:
lib32-opkg-utils
lib32-cryptodev-linux
lib32-sqlite3
lib32-libtool-cross
lib32-ncurses
lib32-db
lib32-diffutils
lib32-zlib
lib32-gcc-cross-i686
lib32-gcc-cross-initial-i686
lib32-flex
lib32-libgcc-initial
lib32-libffi
lib32-linux-libc-headers
lib32-expat
lib32-openssl
lib32-glibc
lib32-binutils-cross-i686
lib32-gcc-runtime

The are introduced by toolchain-scripts.bbclass' anonymous function (the
MULTILIB_VARIANTS), but it doesn't need toolchain-scripts.bbclass, in
fact, so remove it to fix the problem.

[YOCTO #7961]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index a4a0193..398e943 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -1,4 +1,4 @@
-inherit meta toolchain-scripts
+inherit meta
 
 # Wildcards specifying complementary packages to install for every package that has been explicitly
 # installed into the rootfs
-- 
1.7.9.5


