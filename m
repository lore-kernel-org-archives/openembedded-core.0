Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SHoFG-0004pi-GV
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 05:29:22 +0200
Received: by mail-yx0-f175.google.com with SMTP id m3so291427yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 20:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ekhF0RWYOQPomVqtz8z+DnOY5Pc14/PKgajO9iDcTGY=;
	b=UAOln94wmUfWkoWu8W+k9JahIbl48M8yRAWhwF1TEQrxzYyS0K1/2gwPz8MqHNonBm
	7u/m3tFh0Bz9Hka8USEzV3VgEVypYiJGSgOEI80L+A8kSlO9TTAyIgzTa4limExICaMs
	sqKIdrYwNoYmbetBFDTHlCsJzmtsg3tN03jbU1YmbpGFRIISVYSeOhKKSJ65xxKaTCH5
	nuBnmc3BzU0sMoRaGX/UUfKz6RwsX/WyiP7UxEm36CxHQ3+CkK5kw1kheAaBJmLZJ8SV
	nA3/rYY0pTeJylS5KbM5gXl8yG2HmdpYZEsEIIsnYGc2wIYZ+EqCVrJvGdqb5Hd1wO3m
	qu1Q==
Received: by 10.236.76.74 with SMTP id a50mr11777393yhe.42.1334114406168;
	Tue, 10 Apr 2012 20:20:06 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id r62sm5091146yhb.14.2012.04.10.20.20.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 20:20:05 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 03:19:52 +0000
Message-Id: <1efe08c4369a5ab7efe784aec62cc3c4e39ae7ac.1334114318.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1334114318.git.otavio@ossystems.com.br>
References: <cover.1334114318.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1334114318.git.otavio@ossystems.com.br>
References: <cover.1334114318.git.otavio@ossystems.com.br>
Subject: [PATCH 3/3] flex: backport Debian patches to fix generated code warnings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 03:29:22 -0000

The generated parser had warnings regarding signess and return check
which makes Linux Kernel's perf tool from 3.4 release to fail without
those patches.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../flex/flex/avoid-FORTIFY-warnings.patch         |   59 ++++++++++++++++++++
 .../flex/int-is-not-the-same-size-as-size_t.patch  |   42 ++++++++++++++
 meta/recipes-devtools/flex/flex_2.5.35.bb          |    5 +-
 3 files changed, 105 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
 create mode 100644 meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch

diff --git a/meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch b/meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
new file mode 100644
index 0000000..c71eb82
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
@@ -0,0 +1,59 @@
+Wrap ECHO macro to avoid FORTIFY warnings
+
+This change will enable flex scanners to be compiled with
+-D_FORTIFY_SOURCE=2.
+
+Signed-off-by: Manoj Srivastava <srivasta@debian.org>
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+Origin: Cherry picked from Debian
+Upstream-Status: Pending
+
+---
+ flex.skl |    2 +-
+ scan.c   |    2 +-
+ skel.c   |    2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/flex.skl b/flex.skl
+index 6ebf2fd..eaa355e 100644
+--- a/flex.skl
++++ b/flex.skl
+@@ -1074,7 +1074,7 @@ m4_ifdef( [[M4_YY_NOT_IN_HEADER]],
+ /* This used to be an fputs(), but since the string might contain NUL's,
+  * we now use fwrite().
+  */
+-#define ECHO fwrite( yytext, yyleng, 1, yyout )
++#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } while (0)
+ %endif
+ %if-c++-only C++ definition
+ #define ECHO LexerOutput( yytext, yyleng )
+diff --git a/scan.c b/scan.c
+index d7f5db3..1a079bf 100644
+--- a/scan.c
++++ b/scan.c
+@@ -2093,7 +2093,7 @@ static int input (void );
+ /* This used to be an fputs(), but since the string might contain NUL's,
+  * we now use fwrite().
+  */
+-#define ECHO fwrite( yytext, yyleng, 1, yyout )
++#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } while (0)
+ #endif
+ 
+ /* Gets input and stuffs it into "buf".  number of characters read, or YY_NULL,
+diff --git a/skel.c b/skel.c
+index ee9f6ef..b8a2b4b 100644
+--- a/skel.c
++++ b/skel.c
+@@ -1141,7 +1141,7 @@ const char *skel[] = {
+   "/* This used to be an fputs(), but since the string might contain NUL's,",
+   " * we now use fwrite().",
+   " */",
+-  "#define ECHO fwrite( yytext, yyleng, 1, yyout )",
++  "#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } while (0)",
+   "%endif",
+   "%if-c++-only C++ definition",
+   "#define ECHO LexerOutput( yytext, yyleng )",
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch b/meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch
new file mode 100644
index 0000000..8d05ee4
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch
@@ -0,0 +1,42 @@
+int is not the same size as size_t.
+
+Signed-off-by: Manoj Srivastava <srivasta@debian.org>
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+Origin: Cherry picked from Debian
+Upstream-Status: Pending
+
+---
+ gen.c  |    2 +-
+ scan.c |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gen.c b/gen.c
+index 848e2c5..5a5daef 100644
+--- a/gen.c
++++ b/gen.c
+@@ -1890,7 +1890,7 @@ void make_tables ()
+ 			outn ("\tif ( YY_CURRENT_BUFFER_LVALUE->yy_is_interactive ) \\");
+ 			outn ("\t\t{ \\");
+ 			outn ("\t\tint c = '*'; \\");
+-			outn ("\t\tint n; \\");
++			outn ("\t\tsize_t n; \\");
+ 			outn ("\t\tfor ( n = 0; n < max_size && \\");
+ 			outn ("\t\t\t     (c = getc( yyin )) != EOF && c != '\\n'; ++n ) \\");
+ 			outn ("\t\t\tbuf[n] = (char) c; \\");
+diff --git a/scan.c b/scan.c
+index 44559b6..15e2058 100644
+--- a/scan.c
++++ b/scan.c
+@@ -2105,7 +2105,7 @@ static int input (void );
+ 	if ( YY_CURRENT_BUFFER_LVALUE->yy_is_interactive ) \
+ 		{ \
+ 		int c = '*'; \
+-		int n; \
++		size_t n; \
+ 		for ( n = 0; n < max_size && \
+ 			     (c = getc( yyin )) != EOF && c != '\n'; ++n ) \
+ 			buf[n] = (char) c; \
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/flex/flex_2.5.35.bb b/meta/recipes-devtools/flex/flex_2.5.35.bb
index 28a4f1f..7419f10 100644
--- a/meta/recipes-devtools/flex/flex_2.5.35.bb
+++ b/meta/recipes-devtools/flex/flex_2.5.35.bb
@@ -1,8 +1,11 @@
 require flex.inc
-PR = "r2"
+PR = "r3"
 LICENSE="BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
 BBCLASSEXTEND = "native"
 
+SRC_URI += "file://avoid-FORTIFY-warnings.patch \
+            file://int-is-not-the-same-size-as-size_t.patch"
+
 SRC_URI[md5sum] = "10714e50cea54dc7a227e3eddcd44d57"
 SRC_URI[sha256sum] = "0becbd4b2b36b99c67f8c22ab98f7f80c9860aec70f0350a0018f29a88704e7b"
-- 
1.7.2.5



