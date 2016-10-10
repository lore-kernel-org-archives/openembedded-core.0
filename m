Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8291F71957
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 08:30:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Oct 2016 01:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,471,1473145200"; d="scan'208";a="1068367619"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 10 Oct 2016 01:30:09 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Oct 2016 11:30:03 +0300
Message-Id: <906b22995c7e75cf4e43bc34e43ea977040ea837.1476087291.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b37e5eddccd2448a5ba13b752b198540617dd5c1.1476087291.git.jussi.kukkonen@intel.com>
References: <b37e5eddccd2448a5ba13b752b198540617dd5c1.1476087291.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1476087291.git.jussi.kukkonen@intel.com>
References: <cover.1476087291.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/4] flex: Backport buffer overflow fix
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
X-List-Received-Date: Mon, 10 Oct 2016 08:30:32 -0000

Fix a heap-based buffer overflow in yy_get_next_buffer()
(CVE-2016-6354).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-devtools/flex/flex/CVE-2016-6354.patch | 59 ++++++++++++++++++++++
 meta/recipes-devtools/flex/flex_2.6.0.bb           |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch

diff --git a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch b/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
new file mode 100644
index 0000000..216ac7a
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
@@ -0,0 +1,59 @@
+From 3939eccdff598f47e5b37b05d58bf1b44d3796e7 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 7 Oct 2016 14:15:38 +0300
+Subject: [PATCH] Prevent buffer overflow in yy_get_next_buffer
+
+This is upstream commit a5cbe929ac3255d371e698f62dc256afe7006466
+with some additional backporting to make binutils build again.
+
+Upstream-Status: Backport
+CVE: CVE-2016-6354
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ src/flex.skl | 2 +-
+ src/scan.c   | 2 +-
+ src/skel.c   | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/flex.skl b/src/flex.skl
+index ed71627..814d562 100644
+--- a/src/flex.skl
++++ b/src/flex.skl
+@@ -1718,7 +1718,7 @@ int yyFlexLexer::yy_get_next_buffer()
+ 
+ 	else
+ 		{
+-			yy_size_t num_to_read =
++			int num_to_read =
+ 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
+ 
+ 		while ( num_to_read <= 0 )
+diff --git a/src/scan.c b/src/scan.c
+index f1dce75..1949872 100644
+--- a/src/scan.c
++++ b/src/scan.c
+@@ -4181,7 +4181,7 @@ static int yy_get_next_buffer (void)
+ 
+ 	else
+ 		{
+-			yy_size_t num_to_read =
++			int num_to_read =
+ 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
+ 
+ 		while ( num_to_read <= 0 )
+diff --git a/src/skel.c b/src/skel.c
+index 26cc889..0344d18 100644
+--- a/src/skel.c
++++ b/src/skel.c
+@@ -1929,7 +1929,7 @@ const char *skel[] = {
+   "",
+   "	else",
+   "		{",
+-  "			yy_size_t num_to_read =",
++  "			int num_to_read =",
+   "			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;",
+   "",
+   "		while ( num_to_read <= 0 )",
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.0.bb
index 3a45752..ab35b09 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
            file://do_not_create_pdf_doc.patch \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch \
+           file://CVE-2016-6354.patch \
            ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)} \
            "
 
-- 
2.1.4


