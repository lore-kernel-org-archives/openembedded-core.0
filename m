Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 673706B4B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:10:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2013 06:10:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="354884555"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2013 06:10:18 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:09:57 +0300
Message-Id: <d4fd41ac7f0e3497a7aa06f3ede228c2d9bea16d.1375275560.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
Subject: [PATCH 13/13] grub_2.00: fix compilation when using flex 2.5.37
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
X-List-Received-Date: Wed, 31 Jul 2013 13:10:22 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../grub-2.00/fix-issue-with-flex-2.5.37.patch     |   21 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub_2.00.bb                 |    4 +++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/grub/grub-2.00/fix-issue-with-flex-2.5.37.patch

diff --git a/meta/recipes-bsp/grub/grub-2.00/fix-issue-with-flex-2.5.37.patch b/meta/recipes-bsp/grub/grub-2.00/fix-issue-with-flex-2.5.37.patch
new file mode 100644
index 0000000..61ae2f5
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-2.00/fix-issue-with-flex-2.5.37.patch
@@ -0,0 +1,21 @@
+Upstream-Status: Backport
+
+This fixes compilation issues when using flex-2.5.37. It was taken from upstream.
+
+Original author is: Vladimir Serbinenko  <phcoder@gmail.com>
+
+Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
+
+Index: grub-2.00/grub-core/script/yylex.l
+===================================================================
+--- grub-2.00.orig/grub-core/script/yylex.l	2012-06-08 23:24:15.000000000 +0300
++++ grub-2.00/grub-core/script/yylex.l	2013-07-31 14:34:40.708100982 +0300
+@@ -29,6 +29,8 @@
+ #pragma GCC diagnostic ignored "-Wmissing-prototypes"
+ #pragma GCC diagnostic ignored "-Wmissing-declarations"
+ #pragma GCC diagnostic ignored "-Wunsafe-loop-optimizations"
++#pragma GCC diagnostic ignored "-Wunused-function"
++#pragma GCC diagnostic ignored "-Wsign-compare"
+ 
+ #define yyfree    grub_lexer_yyfree
+ #define yyalloc   grub_lexer_yyalloc
diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index 5153b6a..e82996d 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -20,7 +20,9 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-2.00-fpmath-sse-387-fix.patch \
           file://remove-gets.patch \
           file://check-if-liblzma-is-disabled.patch \
-          file://40_custom"
+          file://40_custom \
+          file://fix-issue-with-flex-2.5.37.patch \
+          "
 
 SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
 SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
-- 
1.7.9.5


