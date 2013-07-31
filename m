Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 421976B4B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:10:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Jul 2013 06:07:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="354884534"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2013 06:10:17 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:09:56 +0300
Message-Id: <d5ae8d136ab3036e7f64600250abdfa099756076.1375275560.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
Subject: [PATCH 12/13] flex: upgrade to 2.5.37
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

Removed patches since they were included upstream.

Added a patch to not compile flex.pdf doc since it needs texi2dvi.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../flex/files/do_not_create_pdf_doc.patch         |   17 ++++++
 .../flex/flex/avoid-FORTIFY-warnings.patch         |   59 --------------------
 .../flex/int-is-not-the-same-size-as-size_t.patch  |   42 --------------
 meta/recipes-devtools/flex/flex_2.5.35.bb          |   11 ----
 meta/recipes-devtools/flex/flex_2.5.37.bb          |   10 ++++
 5 files changed, 27 insertions(+), 112 deletions(-)
 create mode 100644 meta/recipes-devtools/flex/files/do_not_create_pdf_doc.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch
 delete mode 100644 meta/recipes-devtools/flex/flex_2.5.35.bb
 create mode 100644 meta/recipes-devtools/flex/flex_2.5.37.bb

diff --git a/meta/recipes-devtools/flex/files/do_not_create_pdf_doc.patch b/meta/recipes-devtools/flex/files/do_not_create_pdf_doc.patch
new file mode 100644
index 0000000..02ececb
--- /dev/null
+++ b/meta/recipes-devtools/flex/files/do_not_create_pdf_doc.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Inapropriate (embedded specific)
+
+Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
+
+Index: flex-2.5.37/doc/Makefile.am
+===================================================================
+--- flex-2.5.37.orig/doc/Makefile.am	2012-07-21 04:18:27.000000000 +0300
++++ flex-2.5.37/doc/Makefile.am	2013-07-30 17:57:09.834834531 +0300
+@@ -2,7 +2,7 @@
+ 
+ info_TEXINFOS =	flex.texi
+ dist_man_MANS = flex.1
+-dist_doc_DATA= flex.pdf
++EXTRA_DIST= flex.pdf
+ 
+ CLEANFILES = \
+ 	flex.hks \
diff --git a/meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch b/meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
deleted file mode 100644
index c71eb82..0000000
--- a/meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Wrap ECHO macro to avoid FORTIFY warnings
-
-This change will enable flex scanners to be compiled with
--D_FORTIFY_SOURCE=2.
-
-Signed-off-by: Manoj Srivastava <srivasta@debian.org>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
-Origin: Cherry picked from Debian
-Upstream-Status: Pending
-
----
- flex.skl |    2 +-
- scan.c   |    2 +-
- skel.c   |    2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/flex.skl b/flex.skl
-index 6ebf2fd..eaa355e 100644
---- a/flex.skl
-+++ b/flex.skl
-@@ -1074,7 +1074,7 @@ m4_ifdef( [[M4_YY_NOT_IN_HEADER]],
- /* This used to be an fputs(), but since the string might contain NUL's,
-  * we now use fwrite().
-  */
--#define ECHO fwrite( yytext, yyleng, 1, yyout )
-+#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } while (0)
- %endif
- %if-c++-only C++ definition
- #define ECHO LexerOutput( yytext, yyleng )
-diff --git a/scan.c b/scan.c
-index d7f5db3..1a079bf 100644
---- a/scan.c
-+++ b/scan.c
-@@ -2093,7 +2093,7 @@ static int input (void );
- /* This used to be an fputs(), but since the string might contain NUL's,
-  * we now use fwrite().
-  */
--#define ECHO fwrite( yytext, yyleng, 1, yyout )
-+#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } while (0)
- #endif
- 
- /* Gets input and stuffs it into "buf".  number of characters read, or YY_NULL,
-diff --git a/skel.c b/skel.c
-index ee9f6ef..b8a2b4b 100644
---- a/skel.c
-+++ b/skel.c
-@@ -1141,7 +1141,7 @@ const char *skel[] = {
-   "/* This used to be an fputs(), but since the string might contain NUL's,",
-   " * we now use fwrite().",
-   " */",
--  "#define ECHO fwrite( yytext, yyleng, 1, yyout )",
-+  "#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } while (0)",
-   "%endif",
-   "%if-c++-only C++ definition",
-   "#define ECHO LexerOutput( yytext, yyleng )",
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch b/meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch
deleted file mode 100644
index 8d05ee4..0000000
--- a/meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-int is not the same size as size_t.
-
-Signed-off-by: Manoj Srivastava <srivasta@debian.org>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
-Origin: Cherry picked from Debian
-Upstream-Status: Pending
-
----
- gen.c  |    2 +-
- scan.c |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gen.c b/gen.c
-index 848e2c5..5a5daef 100644
---- a/gen.c
-+++ b/gen.c
-@@ -1890,7 +1890,7 @@ void make_tables ()
- 			outn ("\tif ( YY_CURRENT_BUFFER_LVALUE->yy_is_interactive ) \\");
- 			outn ("\t\t{ \\");
- 			outn ("\t\tint c = '*'; \\");
--			outn ("\t\tint n; \\");
-+			outn ("\t\tsize_t n; \\");
- 			outn ("\t\tfor ( n = 0; n < max_size && \\");
- 			outn ("\t\t\t     (c = getc( yyin )) != EOF && c != '\\n'; ++n ) \\");
- 			outn ("\t\t\tbuf[n] = (char) c; \\");
-diff --git a/scan.c b/scan.c
-index 44559b6..15e2058 100644
---- a/scan.c
-+++ b/scan.c
-@@ -2105,7 +2105,7 @@ static int input (void );
- 	if ( YY_CURRENT_BUFFER_LVALUE->yy_is_interactive ) \
- 		{ \
- 		int c = '*'; \
--		int n; \
-+		size_t n; \
- 		for ( n = 0; n < max_size && \
- 			     (c = getc( yyin )) != EOF && c != '\n'; ++n ) \
- 			buf[n] = (char) c; \
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/flex/flex_2.5.35.bb b/meta/recipes-devtools/flex/flex_2.5.35.bb
deleted file mode 100644
index 2218c91..0000000
--- a/meta/recipes-devtools/flex/flex_2.5.35.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require flex.inc
-PR = "r3"
-LICENSE="BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += "file://avoid-FORTIFY-warnings.patch \
-            file://int-is-not-the-same-size-as-size_t.patch"
-
-SRC_URI[md5sum] = "10714e50cea54dc7a227e3eddcd44d57"
-SRC_URI[sha256sum] = "0becbd4b2b36b99c67f8c22ab98f7f80c9860aec70f0350a0018f29a88704e7b"
diff --git a/meta/recipes-devtools/flex/flex_2.5.37.bb b/meta/recipes-devtools/flex/flex_2.5.37.bb
new file mode 100644
index 0000000..418fba6
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex_2.5.37.bb
@@ -0,0 +1,10 @@
+require flex.inc
+PR = "r3"
+LICENSE="BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI += "file://do_not_create_pdf_doc.patch"
+
+SRC_URI[md5sum] = "c75940e1fc25108f2a7b3ef42abdae06"
+SRC_URI[sha256sum] = "17aa7b4ebf19a13bc2dff4115b416365c95f090061539a932a68092349ac052a"
-- 
1.7.9.5


