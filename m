Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66DDB75796
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 10:00:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t66A0a9Y010805
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jul 2015 03:00:36 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 6 Jul 2015 03:00:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jul 2015 03:00:35 -0700
Message-ID: <27d428c02194a09a74f09380bcbd99f874192d27.1436176809.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436176809.git.liezhi.yang@windriver.com>
References: <cover.1436176809.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] file: fix long-options
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
X-List-Received-Date: Mon, 06 Jul 2015 10:00:36 -0000
Content-Type: text/plain

Backport two patches to fix bug with long options:
* 0001-Fix-bug-with-long-options-and-explicitly-number-them.patch
* 0002-fix-bug-with-5.23-long-options.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...h-long-options-and-explicitly-number-them.patch |  116 ++++++++++++++++++++
 .../file/0002-fix-bug-with-5.23-long-options.patch |   26 +++++
 meta/recipes-devtools/file/file_5.23.bb            |    2 +
 3 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-devtools/file/file/0001-Fix-bug-with-long-options-and-explicitly-number-them.patch
 create mode 100644 meta/recipes-devtools/file/file/0002-fix-bug-with-5.23-long-options.patch

diff --git a/meta/recipes-devtools/file/file/0001-Fix-bug-with-long-options-and-explicitly-number-them.patch b/meta/recipes-devtools/file/file/0001-Fix-bug-with-long-options-and-explicitly-number-them.patch
new file mode 100644
index 0000000..0a3e27a
--- /dev/null
+++ b/meta/recipes-devtools/file/file/0001-Fix-bug-with-long-options-and-explicitly-number-them.patch
@@ -0,0 +1,116 @@
+From 21f9d5f0e0340ada998f7f9d316368c7167a4afa Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Thu, 11 Jun 2015 12:52:32 +0000
+Subject: [PATCH 1/2] Fix bug with long options and explicitly number them to
+ avoid this in the future.
+
+Upstream-Status: Backport
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+---
+ src/file.c      |   44 +++++++++++++++++++++++----------------------
+ src/file_opts.h |   10 +++++-----
+ 2 files changed, 27 insertions(+), 26 deletions(-)
+
+diff --git a/src/file.c b/src/file.c
+index f60dde0..c700f66 100644
+--- a/src/file.c
++++ b/src/file.c
+@@ -89,10 +89,15 @@ private int 		/* Global command-line options 		*/
+ 
+ private const char *separator = ":";	/* Default field separator	*/
+ private const struct option long_options[] = {
++#define OPT_HELP		1
++#define OPT_APPLE		2
++#define OPT_EXTENSIONS		3
++#define OPT_MIME_TYPE		4
++#define OPT_MIME_ENCODING	5
+ #define OPT(shortname, longname, opt, doc)      \
+     {longname, opt, NULL, shortname},
+-#define OPT_LONGONLY(longname, opt, doc)        \
+-    {longname, opt, NULL, 0},
++#define OPT_LONGONLY(longname, opt, doc, id)        \
++    {longname, opt, NULL, id},
+ #include "file_opts.h"
+ #undef OPT
+ #undef OPT_LONGONLY
+@@ -182,24 +187,20 @@ main(int argc, char *argv[])
+ 	while ((c = getopt_long(argc, argv, OPTSTRING, long_options,
+ 	    &longindex)) != -1)
+ 		switch (c) {
+-		case 0 :
+-			switch (longindex) {
+-			case 0:
+-				help();
+-				break;
+-			case 10:
+-				flags |= MAGIC_APPLE;
+-				break;
+-			case 11:
+-				flags |= MAGIC_EXTENSION;
+-				break;
+-			case 12:
+-				flags |= MAGIC_MIME_TYPE;
+-				break;
+-			case 13:
+-				flags |= MAGIC_MIME_ENCODING;
+-				break;
+-			}
++		case OPT_HELP:
++			help();
++			break;
++		case OPT_APPLE:
++			flags |= MAGIC_APPLE;
++			break;
++		case OPT_EXTENSIONS:
++			flags |= MAGIC_EXTENSION;
++			break;
++		case OPT_MIME_TYPE:
++			flags |= MAGIC_MIME_TYPE;
++			break;
++		case OPT_MIME_ENCODING:
++			flags |= MAGIC_MIME_ENCODING;
+ 			break;
+ 		case '0':
+ 			nulsep = 1;
+@@ -595,7 +596,7 @@ help(void)
+ #define OPT(shortname, longname, opt, doc)      \
+ 	fprintf(stdout, "  -%c, --" longname, shortname), \
+ 	docprint(doc);
+-#define OPT_LONGONLY(longname, opt, doc)        \
++#define OPT_LONGONLY(longname, opt, doc, id)        \
+ 	fprintf(stdout, "      --" longname),	\
+ 	docprint(doc);
+ #include "file_opts.h"
+diff --git a/src/file_opts.h b/src/file_opts.h
+index 036505f..2e30d06 100644
+--- a/src/file_opts.h
++++ b/src/file_opts.h
+@@ -12,7 +12,7 @@
+  * switch statement!
+  */
+ 
+-OPT_LONGONLY("help", 0, "                 display this help and exit\n")
++OPT_LONGONLY("help", 0, "                 display this help and exit\n", OPT_HELP)
+ OPT('v', "version", 0, "              output version information and exit\n")
+ OPT('m', "magic-file", 1, " LIST      use LIST as a colon-separated list of magic\n"
+     "                               number files\n")
+@@ -29,10 +29,10 @@ OPT('f', "files-from", 1, " FILE      read the filenames to be examined from FIL
+ OPT('F', "separator", 1, " STRING     use string as separator instead of `:'\n")
+ OPT('i', "mime", 0, "                 output MIME type strings (--mime-type and\n"
+     "                               --mime-encoding)\n")
+-OPT_LONGONLY("apple", 0, "                output the Apple CREATOR/TYPE\n")
+-OPT_LONGONLY("extension", 0, "            output a slash-separated list of extnsions\n")
+-OPT_LONGONLY("mime-type", 0, "            output the MIME type\n")
+-OPT_LONGONLY("mime-encoding", 0, "        output the MIME encoding\n")
++OPT_LONGONLY("apple", 0, "                output the Apple CREATOR/TYPE\n", OPT_APPLE)
++OPT_LONGONLY("extension", 0, "            output a slash-separated list of extensions\n", OPT_EXTENSIONS)
++OPT_LONGONLY("mime-type", 0, "            output the MIME type\n", OPT_MIME_TYPE)
++OPT_LONGONLY("mime-encoding", 0, "        output the MIME encoding\n", OPT_MIME_ENCODING)
+ OPT('k', "keep-going", 0, "           don't stop at the first match\n")
+ OPT('l', "list", 0, "                 list magic strength\n")
+ #ifdef S_IFLNK
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/file/file/0002-fix-bug-with-5.23-long-options.patch b/meta/recipes-devtools/file/file/0002-fix-bug-with-5.23-long-options.patch
new file mode 100644
index 0000000..a9f2eda
--- /dev/null
+++ b/meta/recipes-devtools/file/file/0002-fix-bug-with-5.23-long-options.patch
@@ -0,0 +1,26 @@
+From 5c40ae1728f08bb7e1229d3aa90e38d2c342fc53 Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Thu, 11 Jun 2015 12:53:26 +0000
+Subject: [PATCH 2/2] fix bug with 5.23 long options
+
+Upstream-Status: Backport
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ ChangeLog |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index 1ac5ad2..0922fc7 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,6 @@
++2015-06-11   8:52  Christos Zoulas <christos@zoulas.com>
++
++	* redo long option encoding to fix off-by-one in 5.23
+ 
+ 2015-06-10  13:50  Christos Zoulas <christos@zoulas.com>
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/file/file_5.23.bb b/meta/recipes-devtools/file/file_5.23.bb
index d71f290..04a1d7b 100644
--- a/meta/recipes-devtools/file/file_5.23.bb
+++ b/meta/recipes-devtools/file/file_5.23.bb
@@ -14,6 +14,8 @@ DEPENDS_class-native = "zlib-native"
 SRC_URI = "ftp://ftp.astron.com/pub/file/${BP}.tar.gz \
 	   file://debian-742262.patch \
 	   file://0001-Add-P-prompt-into-Usage-info.patch \
+	   file://0001-Fix-bug-with-long-options-and-explicitly-number-them.patch \
+	   file://0002-fix-bug-with-5.23-long-options.patch \
           "
 
 SRC_URI[md5sum] = "61db35209ce71a6d576392ce6e1d2f80"
-- 
1.7.9.5


