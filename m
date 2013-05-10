Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Uaka5-0001Yc-AA
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 12:29:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 May 2013 03:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,647,1363158000"; d="scan'208";a="300393454"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by azsmga001.ch.intel.com with ESMTP; 10 May 2013 03:11:32 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 13:15:10 +0300
Message-Id: <1368180910-17476-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] flex: updated to 2.5.37
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2013 10:29:50 -0000

Removed the patches to flex, because they are now applied to the
latest version.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../flex/flex/avoid-FORTIFY-warnings.patch         |   59 --------------------
 .../flex/int-is-not-the-same-size-as-size_t.patch  |   42 --------------
 meta/recipes-devtools/flex/flex_2.5.35.bb          |   11 ----
 meta/recipes-devtools/flex/flex_2.5.37.bb          |    7 +++
 4 files changed, 7 insertions(+), 112 deletions(-)
 delete mode 100644 meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch
 delete mode 100644 meta/recipes-devtools/flex/flex_2.5.35.bb
 create mode 100644 meta/recipes-devtools/flex/flex_2.5.37.bb

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
index 0000000..e699fee
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex_2.5.37.bb
@@ -0,0 +1,7 @@
+require flex.inc
+LICENSE="BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI[md5sum] = "c75940e1fc25108f2a7b3ef42abdae06"
+SRC_URI[sha256sum] = "17aa7b4ebf19a13bc2dff4115b416365c95f090061539a932a68092349ac052a"
-- 
1.7.10.4



