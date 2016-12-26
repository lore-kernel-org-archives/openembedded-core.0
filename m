Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A988C60621
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 08:09:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBQ89H5x023320
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 00:09:17 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 26 Dec 2016 00:09:16 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Dec 2016 16:10:32 +0800
Message-ID: <46d94601d67973b17516241cea3b6afce9a2914d.1482739038.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1482739038.git.Qi.Chen@windriver.com>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] flex: upgrade to 2.6.2
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
X-List-Received-Date: Mon, 26 Dec 2016 08:09:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Upgrade flex to 2.6.2.

The following two patches are removed as they have been merged.
  0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
  CVE-2016-6354.patch

do_not_create_pdf_doc.patch is removed as it's not suitable for the new
version.

0001-use-stage1flex-from-flex-native-to-fix-cross-compili.patch is added
to fix cross compiling problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...lex-from-flex-native-to-fix-cross-compili.patch | 51 +++++++++++++++++
 ...oid-c-comments-in-c-code-fails-with-gcc-6.patch | 64 ----------------------
 .../recipes-devtools/flex/flex/CVE-2016-6354.patch | 59 --------------------
 .../flex/flex/do_not_create_pdf_doc.patch          | 17 ------
 .../flex/{flex_2.6.0.bb => flex_2.6.2.bb}          | 16 +++---
 5 files changed, 60 insertions(+), 147 deletions(-)
 create mode 100644 meta/recipes-devtools/flex/flex/0001-use-stage1flex-from-flex-native-to-fix-cross-compili.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
 rename meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.2.bb} (79%)

diff --git a/meta/recipes-devtools/flex/flex/0001-use-stage1flex-from-flex-native-to-fix-cross-compili.patch b/meta/recipes-devtools/flex/flex/0001-use-stage1flex-from-flex-native-to-fix-cross-compili.patch
new file mode 100644
index 0000000..08f7688
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/0001-use-stage1flex-from-flex-native-to-fix-cross-compili.patch
@@ -0,0 +1,51 @@
+Subject: use stage1flex from flex-native to fix cross compiling
+
+When cross compiling, we would have failure because stage1flex cannot run on host.
+Use stage1flex from flex-native to fix this problem.
+
+This patch is OE specific as upstream may have other way to fix this cross compilation
+problem.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/Makefile.am | 11 ++---------
+ 1 file changed, 2 insertions(+), 9 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 77ddf4b..09ffddb 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -6,17 +6,10 @@ LIBS = @LIBS@
+ m4 = @M4@
+ 
+ bin_PROGRAMS = flex
+-noinst_PROGRAMS = stage1flex
+ lib_LTLIBRARIES = \
+ 	libfl.la \
+ 	libfl_pic.la
+ 
+-stage1flex_SOURCES = \
+-	scan.l \
+-	$(COMMON_SOURCES)
+-
+-stage1flex_CFLAGS = $(AM_CFLAGS)
+-
+ flex_SOURCES = \
+ 	$(COMMON_SOURCES)
+ 
+@@ -89,8 +82,8 @@ skel.c: flex.skl mkskel.sh flexint.h tables_shared.h tables_shared.c
+ 	  $(SHELL) $(srcdir)/mkskel.sh > $@.tmp
+ 	mv $@.tmp $@
+ 
+-stage1scan.c: scan.l stage1flex$(EXEEXT)
+-	./stage1flex$(EXEEXT) -o $@ $<
++stage1scan.c: scan.l
++	stage1flex$(EXEEXT) -o $@ $<
+ 
+ # make needs to be told to make parse.h so that parallelized runs will
+ # not fail.
+-- 
+2.1.0
+
diff --git a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch b/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
deleted file mode 100644
index 438ca5f..0000000
--- a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 7072befe1397af4eb01c3ff7edf99f0cd5076089 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 30 Aug 2016 14:25:32 +0200
-Subject: [PATCH] avoid c++ comments in c-code - fails with gcc-6
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-fixes:
-
-| error: C++ style comments are not allowed in ISO C90
-| num_to_alloc = 1; // After all that talk, this was set to 1 anyways...
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/flex.skl | 2 +-
- src/scan.c   | 2 +-
- src/skel.c   | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/flex.skl b/src/flex.skl
-index 73a0b9e..ed71627 100644
---- a/src/flex.skl
-+++ b/src/flex.skl
-@@ -2350,7 +2350,7 @@ void yyFlexLexer::yyensure_buffer_stack(void)
- 		 * scanner will even need a stack. We use 2 instead of 1 to avoid an
- 		 * immediate realloc on the next call.
-          */
--		num_to_alloc = 1; // After all that talk, this was set to 1 anyways...
-+		num_to_alloc = 1; /* After all that talk, this was set to 1 anyways... */
- 		YY_G(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc
- 								(num_to_alloc * sizeof(struct yy_buffer_state*)
- 								M4_YY_CALL_LAST_ARG);
-diff --git a/src/scan.c b/src/scan.c
-index b55df2d..f1dce75 100644
---- a/src/scan.c
-+++ b/src/scan.c
-@@ -4672,7 +4672,7 @@ static void yyensure_buffer_stack (void)
- 		 * scanner will even need a stack. We use 2 instead of 1 to avoid an
- 		 * immediate realloc on the next call.
-          */
--		num_to_alloc = 1; // After all that talk, this was set to 1 anyways...
-+		num_to_alloc = 1; /* After all that talk, this was set to 1 anyways...*/
- 		(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc
- 								(num_to_alloc * sizeof(struct yy_buffer_state*)
- 								);
-diff --git a/src/skel.c b/src/skel.c
-index ef657d3..26cc889 100644
---- a/src/skel.c
-+++ b/src/skel.c
-@@ -2561,7 +2561,7 @@ const char *skel[] = {
-   "		 * scanner will even need a stack. We use 2 instead of 1 to avoid an",
-   "		 * immediate realloc on the next call.",
-   "         */",
--  "		num_to_alloc = 1; // After all that talk, this was set to 1 anyways...",
-+  "		num_to_alloc = 1; /* After all that talk, this was set to 1 anyways... */",
-   "		YY_G(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc",
-   "								(num_to_alloc * sizeof(struct yy_buffer_state*)",
-   "								M4_YY_CALL_LAST_ARG);",
--- 
-2.5.5
-
diff --git a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch b/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
deleted file mode 100644
index 216ac7a..0000000
--- a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 3939eccdff598f47e5b37b05d58bf1b44d3796e7 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Fri, 7 Oct 2016 14:15:38 +0300
-Subject: [PATCH] Prevent buffer overflow in yy_get_next_buffer
-
-This is upstream commit a5cbe929ac3255d371e698f62dc256afe7006466
-with some additional backporting to make binutils build again.
-
-Upstream-Status: Backport
-CVE: CVE-2016-6354
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- src/flex.skl | 2 +-
- src/scan.c   | 2 +-
- src/skel.c   | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/flex.skl b/src/flex.skl
-index ed71627..814d562 100644
---- a/src/flex.skl
-+++ b/src/flex.skl
-@@ -1718,7 +1718,7 @@ int yyFlexLexer::yy_get_next_buffer()
- 
- 	else
- 		{
--			yy_size_t num_to_read =
-+			int num_to_read =
- 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
- 
- 		while ( num_to_read <= 0 )
-diff --git a/src/scan.c b/src/scan.c
-index f1dce75..1949872 100644
---- a/src/scan.c
-+++ b/src/scan.c
-@@ -4181,7 +4181,7 @@ static int yy_get_next_buffer (void)
- 
- 	else
- 		{
--			yy_size_t num_to_read =
-+			int num_to_read =
- 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
- 
- 		while ( num_to_read <= 0 )
-diff --git a/src/skel.c b/src/skel.c
-index 26cc889..0344d18 100644
---- a/src/skel.c
-+++ b/src/skel.c
-@@ -1929,7 +1929,7 @@ const char *skel[] = {
-   "",
-   "	else",
-   "		{",
--  "			yy_size_t num_to_read =",
-+  "			int num_to_read =",
-   "			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;",
-   "",
-   "		while ( num_to_read <= 0 )",
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch b/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
deleted file mode 100644
index 032833ae..0000000
--- a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate (embedded specific)
-
-Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
-
-Index: flex-2.5.37/doc/Makefile.am
-===================================================================
---- flex-2.5.37.orig/doc/Makefile.am	2012-07-21 04:18:27.000000000 +0300
-+++ flex-2.5.37/doc/Makefile.am	2013-07-30 17:57:09.834834531 +0300
-@@ -2,7 +2,7 @@
- 
- info_TEXINFOS =	flex.texi
- dist_man_MANS = flex.1
--dist_doc_DATA= flex.pdf
-+EXTRA_DIST= flex.pdf
- 
- CLEANFILES = \
- 	flex.hks \
diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.2.bb
similarity index 79%
rename from meta/recipes-devtools/flex/flex_2.6.0.bb
rename to meta/recipes-devtools/flex/flex_2.6.2.bb
index ab35b09..e723124 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.2.bb
@@ -5,22 +5,23 @@ HOMEPAGE = "http://sourceforge.net/projects/flex/"
 SECTION = "devel"
 LICENSE = "BSD"
 
-DEPENDS = "${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-native flex-native', '', d)}"
+DEPENDS = "flex-native ${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-native', '', d)}"
 BBCLASSEXTEND = "native nativesdk"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/westes/flex/releases/download/v${PV}/flex-${PV}.tar.gz \
            file://run-ptest \
-           file://do_not_create_pdf_doc.patch \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
-           file://0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch \
-           file://CVE-2016-6354.patch \
            ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)} \
            "
 
-SRC_URI[md5sum] = "266270f13c48ed043d95648075084d59"
-SRC_URI[sha256sum] = "24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd46f3636e587e9b8e9"
+SRC_URI_append_class-target = " \
+           file://0001-use-stage1flex-from-flex-native-to-fix-cross-compili.patch \
+           "
+
+SRC_URI[md5sum] = "cc6d76c333db7653d5caf423a3335239"
+SRC_URI[sha256sum] = "9a01437a1155c799b7dc2508620564ef806ba66250c36bf5f9034b1c207cb2c9"
 
 # Flex has moved to github from 2.6.1 onwards
 UPSTREAM_CHECK_URI = "https://github.com/westes/flex/releases"
@@ -37,6 +38,7 @@ EXTRA_OEMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', 'FLEX=${STAGING_BIND
 
 do_install_append_class-native() {
 	create_wrapper ${D}/${bindir}/flex M4=${M4}
+	cp ${B}/src/stage1flex ${D}/${bindir}
 }
 
 do_install_append_class-nativesdk() {
-- 
1.9.1


