Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 281C16BDD2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 19:19:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2EJJFex016885
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 12:19:36 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 14 Mar 2019 12:19:24 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Mar 2019 12:19:24 -0700
Message-ID: <20190314191924.44162-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] puzzles: fix uninitialized variable compiler error
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
X-List-Received-Date: Thu, 14 Mar 2019 19:19:46 -0000
Content-Type: text/plain

In tree234.c, change a while() loop to a for() loop so
that the compiler will realize we loop at least once.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../puzzles/files/fix-ki-uninitialized.patch       | 25 ++++++++++++++++++++++
 meta/recipes-sato/puzzles/puzzles_git.bb           |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch

diff --git a/meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch b/meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch
new file mode 100644
index 0000000..7218d62
--- /dev/null
+++ b/meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch
@@ -0,0 +1,25 @@
+puzzles: avoid compiler unitialized variable error
+
+The compiler does not realize that we must go through the while()
+loop at least once, so we replace it with a for() loop.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+--- a/tree234.c
++++ b/tree234.c
+@@ -326,8 +326,11 @@ static void *add234_internal(tree234 *t,
+ 	return orig_e;
+     }
+ 
+-    n = t->root;
+-    while (n) {
++    /*
++     * We know t->root is not NULL.  The logic
++     * to break out of this is at the end of the loop.
++     */
++    for (n = t->root;;) {
+ 	LOG(("  node %p: %p/%d \"%s\" %p/%d \"%s\" %p/%d \"%s\" %p/%d\n",
+ 	     n,
+ 	     n->kids[0], n->counts[0], n->elems[0],
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 0766bd4..59b9525 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
            file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
            file://0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch \
+           file://fix-ki-uninitialized.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.7.4


