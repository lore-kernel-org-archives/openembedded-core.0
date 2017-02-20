Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59FC771C56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 08:46:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1K8khd6027594
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 00:46:43 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Feb 2017 00:46:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Feb 2017 00:46:35 -0800
Message-ID: <a9f1245408436f9bdd61b6e5f12a43db5b5e46a3.1487580369.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1487580369.git.liezhi.yang@windriver.com>
References: <cover.1487580369.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] gettext: fix formatting issues
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
X-List-Received-Date: Mon, 20 Feb 2017 08:46:42 -0000
Content-Type: text/plain

Fixed when compile with "-Wformat -Wformat-security -Werror=format-security":
| gettext-tools/gnulib-lib/libcroco/cr-statement.c: In function 'cr_statement_dump_charset':
| gettext-tools/gnulib-lib/libcroco/cr-statement.c:2661:17: error: format not a string literal and no format arguments [-Werror=format-security]
|                  fprintf (a_fp, str) ;

And:
gettext-tools/gnulib-lib/libxml/timsort.h:326:80: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat=]
       fprintf(stderr, "Error allocating temporary storage for tim sort: need %lu bytes", sizeof(SORT_TYPE) * new_size);

[YOCTO #9544]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...atement.c-timsort.h-fix-formatting-issues.patch | 87 ++++++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.19.8.1.bb      |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/cr-statement.c-timsort.h-fix-formatting-issues.patch

diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/cr-statement.c-timsort.h-fix-formatting-issues.patch b/meta/recipes-core/gettext/gettext-0.19.8.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
new file mode 100644
index 00000000000..6af16041987
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.19.8.1/cr-statement.c-timsort.h-fix-formatting-issues.patch
@@ -0,0 +1,87 @@
+From e546de65a333789e83f5485757967cee29ee3681 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 19 Feb 2017 23:32:46 -0800
+Subject: [PATCH] cr-statement.c/timsort.h: fix formatting issues
+
+Fixed when compile with "-Wformat -Wformat-security -Werror=format-security":
+| gettext-tools/gnulib-lib/libcroco/cr-statement.c: In function 'cr_statement_dump_charset':
+| gettext-tools/gnulib-lib/libcroco/cr-statement.c:2661:17: error: format not a string literal and no format arguments [-Werror=format-security]
+|                  fprintf (a_fp, str) ;
+
+And:
+gettext-tools/gnulib-lib/libxml/timsort.h:326:80: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat=]
+       fprintf(stderr, "Error allocating temporary storage for tim sort: need %lu bytes", sizeof(SORT_TYPE) * new_size);
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ gettext-tools/gnulib-lib/libcroco/cr-statement.c | 10 +++++-----
+ gettext-tools/gnulib-lib/libxml/timsort.h        |  2 +-
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/gettext-tools/gnulib-lib/libcroco/cr-statement.c b/gettext-tools/gnulib-lib/libcroco/cr-statement.c
+index 617520f..100104b 100644
+--- a/gettext-tools/gnulib-lib/libcroco/cr-statement.c
++++ b/gettext-tools/gnulib-lib/libcroco/cr-statement.c
+@@ -2607,7 +2607,7 @@ cr_statement_dump_ruleset (CRStatement * a_this, FILE * a_fp, glong a_indent)
+         g_return_if_fail (a_fp && a_this);
+         str = cr_statement_ruleset_to_string (a_this, a_indent);
+         if (str) {
+-                fprintf (a_fp, str);
++                fprintf (a_fp, "%s", str);
+                 g_free (str);
+                 str = NULL;
+         }
+@@ -2658,7 +2658,7 @@ cr_statement_dump_charset (CRStatement * a_this, FILE * a_fp, gulong a_indent)
+         str = cr_statement_charset_to_string (a_this,
+                                               a_indent) ;
+         if (str) {
+-                fprintf (a_fp, str) ;
++                fprintf (a_fp, "%s", str) ;
+                 g_free (str) ;
+                 str = NULL ;
+         }
+@@ -2685,7 +2685,7 @@ cr_statement_dump_page (CRStatement * a_this, FILE * a_fp, gulong a_indent)
+ 
+         str = cr_statement_at_page_rule_to_string (a_this, a_indent) ;
+         if (str) {
+-                fprintf (a_fp, str);
++                fprintf (a_fp, "%s", str);
+                 g_free (str) ;
+                 str = NULL ; 
+         }
+@@ -2711,7 +2711,7 @@ cr_statement_dump_media_rule (CRStatement * a_this,
+ 
+         str = cr_statement_media_rule_to_string (a_this, a_indent) ;
+         if (str) {
+-                fprintf (a_fp, str) ;
++                fprintf (a_fp, "%s", str) ;
+                 g_free (str) ;
+                 str = NULL ;
+         }
+@@ -2737,7 +2737,7 @@ cr_statement_dump_import_rule (CRStatement * a_this, FILE * a_fp,
+ 
+         str = cr_statement_import_rule_to_string (a_this, a_indent) ;
+         if (str) {
+-                fprintf (a_fp, str) ;
++                fprintf (a_fp, "%s", str) ;
+                 g_free (str) ;
+                 str = NULL ;
+         }
+diff --git a/gettext-tools/gnulib-lib/libxml/timsort.h b/gettext-tools/gnulib-lib/libxml/timsort.h
+index 795f272..443918a 100644
+--- a/gettext-tools/gnulib-lib/libxml/timsort.h
++++ b/gettext-tools/gnulib-lib/libxml/timsort.h
+@@ -323,7 +323,7 @@ static void TIM_SORT_RESIZE(TEMP_STORAGE_T *store, const size_t new_size)
+     SORT_TYPE *tempstore = (SORT_TYPE *)realloc(store->storage, new_size * sizeof(SORT_TYPE));
+     if (tempstore == NULL)
+     {
+-      fprintf(stderr, "Error allocating temporary storage for tim sort: need %lu bytes", sizeof(SORT_TYPE) * new_size);
++      fprintf(stderr, "Error allocating temporary storage for tim sort: need %zu bytes", sizeof(SORT_TYPE) * new_size);
+       exit(1);
+     }
+     store->storage = tempstore;
+-- 
+2.10.2
+
diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index 7b8c1e8eb4f..557bf684e5a 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -13,6 +13,7 @@ RCONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://parallel.patch \
 	   file://add-with-bisonlocaledir.patch \
+	   file://cr-statement.c-timsort.h-fix-formatting-issues.patch \
 "
 
 SRC_URI[md5sum] = "97e034cf8ce5ba73a28ff6c3c0638092"
-- 
2.11.0.rc2.dirty


