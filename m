Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 84AB2784E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 01:45:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAU1jnJh021961
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 17:45:49 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 29 Nov 2017 17:45:47 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Nov 2017 09:45:13 +0800
Message-ID: <d59d7504408b53c4f51fb89f50eb1739333698b1.1512006081.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1512006081.git.liezhi.yang@windriver.com>
References: <cover.1512006081.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] ninja: fix for llvm build when len(TMPDIR) == 410
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
X-List-Received-Date: Thu, 30 Nov 2017 01:45:47 -0000
Content-Type: text/plain

It is used for saving path components, 30 is a little small, use 100.

Fixed when build llvm:
ninja: fatal: path has too many components

[YOCTO #12347]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...src-util.cc-use-larger-kMaxPathComponents.patch | 33 ++++++++++++++++++++++
 meta/recipes-devtools/ninja/ninja_1.7.2.bb         |  5 +++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/ninja/ninja/0001-src-util.cc-use-larger-kMaxPathComponents.patch

diff --git a/meta/recipes-devtools/ninja/ninja/0001-src-util.cc-use-larger-kMaxPathComponents.patch b/meta/recipes-devtools/ninja/ninja/0001-src-util.cc-use-larger-kMaxPathComponents.patch
new file mode 100644
index 0000000..64cac7b
--- /dev/null
+++ b/meta/recipes-devtools/ninja/ninja/0001-src-util.cc-use-larger-kMaxPathComponents.patch
@@ -0,0 +1,33 @@
+From 04534ec915e08f59b66bf6044290faeea4610394 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 15 Nov 2017 16:01:01 +0800
+Subject: [PATCH] src/util.cc: use larger kMaxPathComponents
+
+It is used for saving path components, 30 is a little small, use 100.
+
+Fixed when build llvm:
+ninja: fatal: path has too many components
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ src/util.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/util.cc b/src/util.cc
+index e31fd1f..f84a12e 100644
+--- a/src/util.cc
++++ b/src/util.cc
+@@ -125,7 +125,7 @@ bool CanonicalizePath(char* path, size_t* len, unsigned int* slash_bits,
+     return false;
+   }
+ 
+-  const int kMaxPathComponents = 30;
++  const int kMaxPathComponents = 100;
+   char* components[kMaxPathComponents];
+   int component_count = 0;
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/ninja/ninja_1.7.2.bb b/meta/recipes-devtools/ninja/ninja_1.7.2.bb
index 4d3b272..0ef2ea0 100644
--- a/meta/recipes-devtools/ninja/ninja_1.7.2.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.7.2.bb
@@ -7,7 +7,10 @@ DEPENDS = "re2c-native ninja-native"
 
 SRCREV = "717b7b4a31db6027207588c0fb89c3ead384747b"
 
-SRC_URI = "git://github.com/martine/ninja.git;branch=release"
+SRC_URI = "git://github.com/martine/ninja.git;branch=release \
+           file://0001-src-util.cc-use-larger-kMaxPathComponents.patch \
+"
+
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


