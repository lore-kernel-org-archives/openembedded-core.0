Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AB0A27372E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 03:01:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="58310738"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Feb 2015 10:57:34 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1Q30J54025468
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 11:00:19 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 26 Feb 2015 11:01:14 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Feb 2015 10:55:46 +0800
Message-ID: <1424919346-39779-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [RFC] [PATCH] [dizzy]gcc-4.9: fix bug of 0056-top-level-reorder_gcc-bug-61144.patch
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
X-List-Received-Date: Thu, 26 Feb 2015 03:01:32 -0000
Content-Type: text/plain

The patch 0056-top-level-reorder_gcc-bug-61144.patch looks wrong.

It looks like a mistake, we shoud patch gcc/varpool.c not create the file
 meta/recipes-devtools/gcc/gcc-4.9/0056-top-level-reorder_gcc-bug-61144.patch

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../0056-top-level-reorder_gcc-bug-61144.patch     | 42 ++++++++++------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0056-top-level-reorder_gcc-bug-61144.patch b/meta/recipes-devtools/gcc/gcc-4.9/0056-top-level-reorder_gcc-bug-61144.patch
index f448932..3d7b249 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9/0056-top-level-reorder_gcc-bug-61144.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0056-top-level-reorder_gcc-bug-61144.patch
@@ -4,28 +4,24 @@ Upstream-Status: Backport
 Originally-submitted-by: Peter Urbanec <openembedded-devel@urbanec.net>
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
---- /dev/null
-+++ b/meta/recipes-devtools/gcc/gcc-4.9/0056-top-level-reorder_gcc-bug-61144.patch
-@@ -0,0 +1,21 @@
-+--- a/gcc/varpool.c    2014/10/05 02:50:01     215895
-++++ b/gcc/varpool.c    2014/10/05 04:52:19     215896
-+@@ -329,8 +329,16 @@
+--- a/gcc/varpool.c    2014/10/05 02:50:01     215895
++++ b/gcc/varpool.c    2014/10/05 04:52:19     215896
+@@ -329,8 +329,16 @@
+
+   /* Variables declared 'const' without an initializer
+      have zero as the initializer if they may not be
+-     overridden at link or run time.  */
+-  if (!DECL_INITIAL (real_decl)
++     overridden at link or run time.
 +
-+   /* Variables declared 'const' without an initializer
-+      have zero as the initializer if they may not be
-+-     overridden at link or run time.  */
-+-  if (!DECL_INITIAL (real_decl)
-++     overridden at link or run time.
-++
-++     It is actually requirement for C++ compiler to optimize const variables
-++     consistently. As a GNU extension, do not enfore this rule for user defined
-++     weak variables, so we support interposition on:
-++     static const int dummy = 0;
-++     extern const int foo __attribute__((__weak__, __alias__("dummy")));
-++   */
-++  if ((!DECL_INITIAL (real_decl)
-++       || (DECL_WEAK (decl) && !DECL_COMDAT (decl)))
-+       && (DECL_EXTERNAL (decl) || decl_replaceable_p (decl)))
-+     return error_mark_node;
-+ 
++     It is actually requirement for C++ compiler to optimize const variables
++     consistently. As a GNU extension, do not enfore this rule for user defined
++     weak variables, so we support interposition on:
++     static const int dummy = 0;
++     extern const int foo __attribute__((__weak__, __alias__("dummy")));
++   */
++  if ((!DECL_INITIAL (real_decl)
++       || (DECL_WEAK (decl) && !DECL_COMDAT (decl)))
+       && (DECL_EXTERNAL (decl) || decl_replaceable_p (decl)))
+     return error_mark_node;
 
-- 
1.9.1


