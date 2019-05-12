Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC3D27E0DD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 08:18:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4C8I6IN024239
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2019 01:18:06 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 12 May 2019 01:18:05 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Sun, 12 May 2019 16:16:29 +0800
Message-ID: <46dd87d8d61ddc5841542a97f8b365b93978ce5d.1557628550.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1557628550.git.hongxu.jia@windriver.com>
References: <cover.1557628550.git.hongxu.jia@windriver.com>
Subject: [PATCH 09/10] libxml2: upgrade 2.9.8 -> 2.9.9
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
X-List-Received-Date: Sun, 12 May 2019 08:18:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

- Drop backported fix-CVE-2017-8872.patch,
  fix-CVE-2018-14404.patch and
  0001-Fix-infinite-loop-in-LZMA-decompression.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...1-Fix-infinite-loop-in-LZMA-decompression.patch |  55 ------
 .../libxml/libxml2/fix-CVE-2017-8872.patch         |  65 -------
 .../libxml/libxml2/fix-CVE-2018-14404.patch        |  45 -----
 .../libxml/libxml2/fix-execution-of-ptests.patch   |  24 ++-
 .../recipes-core/libxml/libxml2/libxml-64bit.patch |  24 ++-
 .../libxml/libxml2/libxml-m4-use-pkgconfig.patch   |  16 +-
 .../libxml/libxml2/python-sitepackages-dir.patch   |  13 +-
 meta/recipes-core/libxml/libxml2/runtest.patch     | 204 ++++++++++++---------
 .../libxml/{libxml2_2.9.8.bb => libxml2_2.9.9.bb}  |   7 +-
 9 files changed, 172 insertions(+), 281 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/0001-Fix-infinite-loop-in-LZMA-decompression.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/fix-CVE-2018-14404.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.8.bb => libxml2_2.9.9.bb} (93%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Fix-infinite-loop-in-LZMA-decompression.patch b/meta/recipes-core/libxml/libxml2/0001-Fix-infinite-loop-in-LZMA-decompression.patch
deleted file mode 100644
index 16c2295..0000000
--- a/meta/recipes-core/libxml/libxml2/0001-Fix-infinite-loop-in-LZMA-decompression.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 28a9dc642ffd759df1e48be247a114f440a6c16e Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Mon, 30 Jul 2018 13:14:11 +0200
-Subject: [PATCH] Fix infinite loop in LZMA decompression
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Check the liblzma error code more thoroughly to avoid infinite loops.
-
-Closes: https://gitlab.gnome.org/GNOME/libxml2/issues/13
-Closes: https://bugzilla.gnome.org/show_bug.cgi?id=794914
-
-This is CVE-2018-9251 and CVE-2018-14567.
-
-Thanks to Dongliang Mu and Simon Wörner for the reports.
-
-CVE: CVE-2018-9251
-CVE: CVE-2018-14567
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/commit/2240fbf5912054af025fb6e01e26375100275e74]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- xzlib.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/xzlib.c b/xzlib.c
-index a839169..0ba88cf 100644
---- a/xzlib.c
-+++ b/xzlib.c
-@@ -562,6 +562,10 @@ xz_decomp(xz_statep state)
-                          "internal error: inflate stream corrupt");
-                 return -1;
-             }
-+            /*
-+             * FIXME: Remapping a couple of error codes and falling through
-+             * to the LZMA error handling looks fragile.
-+             */
-             if (ret == Z_MEM_ERROR)
-                 ret = LZMA_MEM_ERROR;
-             if (ret == Z_DATA_ERROR)
-@@ -587,6 +591,11 @@ xz_decomp(xz_statep state)
-             xz_error(state, LZMA_PROG_ERROR, "compression error");
-             return -1;
-         }
-+        if ((state->how != GZIP) &&
-+            (ret != LZMA_OK) && (ret != LZMA_STREAM_END)) {
-+            xz_error(state, ret, "lzma error");
-+            return -1;
-+        }
-     } while (strm->avail_out && ret != LZMA_STREAM_END);
- 
-     /* update available output and crc check value */
--- 
-2.7.4
-
diff --git a/meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch b/meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch
deleted file mode 100644
index 42a4b0e..0000000
--- a/meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Upstream-Status: Backport
-CVE: CVE-2017-8872
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 123234f2cfcd9e9b9f83047eee1dc17b4c3f4407 Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Tue, 11 Sep 2018 14:52:07 +0200
-Subject: [PATCH] Free input buffer in xmlHaltParser
-
-This avoids miscalculation of available bytes.
-
-Thanks to Yunho Kim for the report.
-
-Closes: #26
----
- parser.c                     |  5 +++++
- result/errors/759573.xml.err | 17 +++++++----------
- 2 files changed, 12 insertions(+), 10 deletions(-)
-
-diff --git a/parser.c b/parser.c
-index ca9fde2c..5813a664 100644
---- a/parser.c
-+++ b/parser.c
-@@ -12462,7 +12462,12 @@ xmlHaltParser(xmlParserCtxtPtr ctxt) {
- 	    ctxt->input->free((xmlChar *) ctxt->input->base);
- 	    ctxt->input->free = NULL;
- 	}
-+        if (ctxt->input->buf != NULL) {
-+            xmlFreeParserInputBuffer(ctxt->input->buf);
-+            ctxt->input->buf = NULL;
-+        }
- 	ctxt->input->cur = BAD_CAST"";
-+        ctxt->input->length = 0;
- 	ctxt->input->base = ctxt->input->cur;
-         ctxt->input->end = ctxt->input->cur;
-     }
-diff --git a/result/errors/759573.xml.err b/result/errors/759573.xml.err
-index 554039f6..38ef5c40 100644
---- a/result/errors/759573.xml.err
-+++ b/result/errors/759573.xml.err
-@@ -21,14 +21,11 @@ Entity: line 1:
-             ^
- ./test/errors/759573.xml:1: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
- 
--<?h?><!DOCTYPEt[<!ELEMENT t (A)><!ENTITY % xx '&#37;<![INCLUDE[000&#37;&#3000;00
--     ^
-+
-+^
- ./test/errors/759573.xml:1: parser error : DOCTYPE improperly terminated
--<?h?><!DOCTYPEt[<!ELEMENT t (A)><!ENTITY % xx '&#37;<![INCLUDE[000&#37;&#3000;00
--     ^
--./test/errors/759573.xml:1: parser error : StartTag: invalid element name
--<?h?><!DOCTYPEt[<!ELEMENT t (A)><!ENTITY % xx '&#37;<![INCLUDE[000&#37;&#3000;00
--      ^
--./test/errors/759573.xml:1: parser error : Extra content at the end of the document
--<?h?><!DOCTYPEt[<!ELEMENT t (A)><!ENTITY % xx '&#37;<![INCLUDE[000&#37;&#3000;00
--      ^
-+
-+^
-+./test/errors/759573.xml:1: parser error : Start tag expected, '<' not found
-+
-+^
--- 
-2.11.0
-
diff --git a/meta/recipes-core/libxml/libxml2/fix-CVE-2018-14404.patch b/meta/recipes-core/libxml/libxml2/fix-CVE-2018-14404.patch
deleted file mode 100644
index 21668e2..0000000
--- a/meta/recipes-core/libxml/libxml2/fix-CVE-2018-14404.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-libxml2-2.9.8: Fix CVE-2018-14404
-
-[No upstream tracking] -- https://gitlab.gnome.org/GNOME/libxml2/issues/5
- -- https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=901817
- -- https://bugzilla.redhat.com/show_bug.cgi?id=1595985
-
-xpath: Fix nullptr deref with XPath logic ops
-
-If the XPath stack is corrupted, for example by a misbehaving extension
-function, the "and" and "or" XPath operators could dereference NULL
-pointers. Check that the XPath stack isn't empty and optimize the
-logic operators slightly.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/commit/a436374994c47b12d5de1b8b1d191a098fa23594]
-CVE: CVE-2018-14404
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-diff --git a/xpath.c b/xpath.c
-index f440696..75cac5c 100644
---- a/xpath.c
-+++ b/xpath.c
-@@ -13297,9 +13297,8 @@ xmlXPathCompOpEval(xmlXPathParserContextPtr ctxt, xmlXPathStepOpPtr op)
- 		return(0);
- 	    }
-             xmlXPathBooleanFunction(ctxt, 1);
--            arg1 = valuePop(ctxt);
--            arg1->boolval &= arg2->boolval;
--            valuePush(ctxt, arg1);
-+	    if (ctxt->value != NULL)
-+		ctxt->value->boolval &= arg2->boolval;
- 	    xmlXPathReleaseObject(ctxt->context, arg2);
-             return (total);
-         case XPATH_OP_OR:
-@@ -13323,9 +13322,8 @@ xmlXPathCompOpEval(xmlXPathParserContextPtr ctxt, xmlXPathStepOpPtr op)
- 		return(0);
- 	    }
-             xmlXPathBooleanFunction(ctxt, 1);
--            arg1 = valuePop(ctxt);
--            arg1->boolval |= arg2->boolval;
--            valuePush(ctxt, arg1);
-+	    if (ctxt->value != NULL)
-+		ctxt->value->boolval |= arg2->boolval;
- 	    xmlXPathReleaseObject(ctxt->context, arg2);
-             return (total);
-         case XPATH_OP_EQUAL:
diff --git a/meta/recipes-core/libxml/libxml2/fix-execution-of-ptests.patch b/meta/recipes-core/libxml/libxml2/fix-execution-of-ptests.patch
index 51a9e19..ad719d4 100644
--- a/meta/recipes-core/libxml/libxml2/fix-execution-of-ptests.patch
+++ b/meta/recipes-core/libxml/libxml2/fix-execution-of-ptests.patch
@@ -1,14 +1,23 @@
-Make sure that Makefile doesn't try to compile these tests again
-on the target where the source dependencies won't be available.
+From 395c0f53ec226aaabedb166e6b3a7f8590b95a5f Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 11 May 2019 20:39:15 +0800
+Subject: [PATCH] Make sure that Makefile doesn't try to compile these tests
+ again on the target where the source dependencies won't be available.
 
 Upstream-Status: Inappropriate [cross-compile specific]
 
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 
-Index: libxml2-2.9.7/Makefile.am
-===================================================================
---- libxml2-2.9.7.orig/Makefile.am
-+++ libxml2-2.9.7/Makefile.am
+Rebase to 2.9.9
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 8f4e43d..5edb930 100644
+--- a/Makefile.am
++++ b/Makefile.am
 @@ -211,8 +211,7 @@ install-ptest:
  	sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
  	$(MAKE) -C python install-ptest
@@ -19,3 +28,6 @@ Index: libxml2-2.9.7/Makefile.am
  	[ -d test   ] || $(LN_S) $(srcdir)/test   .
  	[ -d result ] || $(LN_S) $(srcdir)/result .
  	$(CHECKER) ./runtest$(EXEEXT) && \
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/libxml/libxml2/libxml-64bit.patch b/meta/recipes-core/libxml/libxml2/libxml-64bit.patch
index 1147017..fd8e469 100644
--- a/meta/recipes-core/libxml/libxml2/libxml-64bit.patch
+++ b/meta/recipes-core/libxml/libxml2/libxml-64bit.patch
@@ -1,14 +1,19 @@
-Upstream-Status: Backport [from debian: bugs.debian.org/439843]
+From 056b14345b1abd76a761ab14538f1bc21302781a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 11 May 2019 20:26:51 +0800
+Subject: [PATCH] libxml 64bit
 
+Upstream-Status: Backport [from debian: bugs.debian.org/439843]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- libxml.h |    3 +++
+ libxml.h | 3 +++
  1 file changed, 3 insertions(+)
 
---- libxml2-2.6.29.orig/libxml.h
-+++ libxml2-2.6.29/libxml.h
-@@ -11,10 +11,13 @@
- 
- #ifndef NO_LARGEFILE_SOURCE
+diff --git a/libxml.h b/libxml.h
+index 64e30f7..4e80d90 100644
+--- a/libxml.h
++++ b/libxml.h
+@@ -15,6 +15,9 @@
  #ifndef _LARGEFILE_SOURCE
  #define _LARGEFILE_SOURCE
  #endif
@@ -18,5 +23,6 @@ Upstream-Status: Backport [from debian: bugs.debian.org/439843]
  #ifndef _FILE_OFFSET_BITS
  #define _FILE_OFFSET_BITS 64
  #endif
- #endif
- 
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
index d9ed151..e6998f6 100644
--- a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
+++ b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
@@ -1,11 +1,20 @@
-AM_PATH_XML2 uses xml-config which we disable through
+From 43edc9a445ed66cceb7533eadeef242940b4592c Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 11 May 2019 20:37:12 +0800
+Subject: [PATCH] AM_PATH_XML2 uses xml-config which we disable through
 binconfig-disabled.bbclass, so port it to use pkg-config instead.
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+Rebase to 2.9.9
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libxml.m4 | 186 ++------------------------------------------------------------
+ 1 file changed, 5 insertions(+), 181 deletions(-)
+
 diff --git a/libxml.m4 b/libxml.m4
-index 68cd824..5fa0a9b 100644
+index 2d7a6f5..1c53585 100644
 --- a/libxml.m4
 +++ b/libxml.m4
 @@ -1,188 +1,12 @@
@@ -202,3 +211,6 @@ index 68cd824..5fa0a9b 100644
 -  AC_SUBST(XML_LIBS)
 -  rm -f conf.xmltest
  ])
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/libxml/libxml2/python-sitepackages-dir.patch b/meta/recipes-core/libxml/libxml2/python-sitepackages-dir.patch
index e83c832..956ff3f 100644
--- a/meta/recipes-core/libxml/libxml2/python-sitepackages-dir.patch
+++ b/meta/recipes-core/libxml/libxml2/python-sitepackages-dir.patch
@@ -1,4 +1,7 @@
-Allow us to pass in PYTHON_SITE_PACKAGES
+From b038c3452667ed17ddb0e791cd7bdc7f8774ac29 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 11 May 2019 20:35:20 +0800
+Subject: [PATCH] Allow us to pass in PYTHON_SITE_PACKAGES
 
 The python binary used when building for nativesdk doesn't give us the
 correct path here so we need to be able to specify it ourselves.
@@ -6,16 +9,18 @@ correct path here so we need to be able to specify it ourselves.
 Upstream-Status: Inappropriate [config]
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
-Rebase to 2.9.2
+Rebase to 2.9.9
+
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  configure.ac | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
+index ca911f3..3bbd654 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -813,7 +813,8 @@ dnl
+@@ -808,7 +808,8 @@ dnl
  
  PYTHON_VERSION=
  PYTHON_INCLUDES=
@@ -26,5 +31,5 @@ diff --git a/configure.ac b/configure.ac
  pythondir=
  if test "$with_python" != "no" ; then
 -- 
-1.9.1
+2.7.4
 
diff --git a/meta/recipes-core/libxml/libxml2/runtest.patch b/meta/recipes-core/libxml/libxml2/runtest.patch
index 544dc05..0dbb353 100644
--- a/meta/recipes-core/libxml/libxml2/runtest.patch
+++ b/meta/recipes-core/libxml/libxml2/runtest.patch
@@ -1,14 +1,28 @@
-Add 'install-ptest' rule.
-Print a standard result line for each test.
+Add 'install-ptest' rule. Print a standard result line for
+each test.
 
 Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 Upstream-Status: Backport
 
-diff -uNr a/Makefile.am b/Makefile.am
---- a/Makefile.am	2017-12-02 09:58:10.000000000 +0100
-+++ b/Makefile.am	2018-03-20 08:27:34.360505864 +0100
-@@ -202,6 +202,15 @@
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.am   |   9 ++++
+ runsuite.c    |   1 +
+ runtest.c     |   2 +
+ runxmlconf.c  |   1 +
+ testapi.c     | 122 ++++++++++++++++++++++++++++++---------------
+ testchar.c    | 156 +++++++++++++++++++++++++++++++++++++++++-----------------
+ testdict.c    |   1 +
+ testlimits.c  |   1 +
+ testrecurse.c |   2 +
+ 9 files changed, 210 insertions(+), 85 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 9c630be..7cfd04b 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -202,6 +202,15 @@ runxmlconf_LDADD= $(LDADDS)
  #testOOM_DEPENDENCIES = $(DEPS)
  #testOOM_LDADD= $(LDADDS)
  
@@ -24,10 +38,11 @@ diff -uNr a/Makefile.am b/Makefile.am
  runtests: runtest$(EXEEXT) testrecurse$(EXEEXT) testapi$(EXEEXT) \
            testchar$(EXEEXT) testdict$(EXEEXT) runxmlconf$(EXEEXT)
  	[ -d test   ] || $(LN_S) $(srcdir)/test   .
-diff -uNr a/runsuite.c b/runsuite.c
---- a/runsuite.c	2016-06-07 12:04:14.000000000 +0200
-+++ b/runsuite.c	2018-03-20 08:27:57.478817247 +0100
-@@ -1162,6 +1162,7 @@
+diff --git a/runsuite.c b/runsuite.c
+index aaab13e..9ba2c5d 100644
+--- a/runsuite.c
++++ b/runsuite.c
+@@ -1162,6 +1162,7 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIBUTE_UNUSED) {
  
      if (logfile != NULL)
          fclose(logfile);
@@ -35,20 +50,19 @@ diff -uNr a/runsuite.c b/runsuite.c
      return(ret);
  }
  #else /* !SCHEMAS */
-diff -uNr a/runtest.c b/runtest.c
---- a/runtest.c	2017-11-13 22:00:17.000000000 +0100
-+++ b/runtest.c	2018-03-20 08:28:50.859047551 +0100
-@@ -4496,7 +4496,8 @@
-     }
- 
+diff --git a/runtest.c b/runtest.c
+index addda5c..8ba5d59 100644
+--- a/runtest.c
++++ b/runtest.c
+@@ -4501,6 +4501,7 @@ launchTests(testDescPtr tst) {
      xmlCharEncCloseFunc(ebcdicHandler);
--
-+    
+     xmlCharEncCloseFunc(eucJpHandler);
+ 
 +    printf("%s: %s\n", (err == 0) ? "PASS" : "FAIL", tst->desc);
      return(err);
  }
  
-@@ -4573,6 +4574,7 @@
+@@ -4577,6 +4578,7 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIBUTE_UNUSED) {
      xmlCleanupParser();
      xmlMemoryDump();
  
@@ -56,10 +70,11 @@ diff -uNr a/runtest.c b/runtest.c
      return(ret);
  }
  
-diff -uNr a/runxmlconf.c b/runxmlconf.c
---- a/runxmlconf.c	2016-06-07 12:04:14.000000000 +0200
-+++ b/runxmlconf.c	2018-03-20 08:29:17.944862893 +0100
-@@ -595,6 +595,7 @@
+diff --git a/runxmlconf.c b/runxmlconf.c
+index cef20f4..4f291fb 100644
+--- a/runxmlconf.c
++++ b/runxmlconf.c
+@@ -595,6 +595,7 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIBUTE_UNUSED) {
  
      if (logfile != NULL)
          fclose(logfile);
@@ -67,15 +82,15 @@ diff -uNr a/runxmlconf.c b/runxmlconf.c
      return(ret);
  }
  
-diff -uNr a/testapi.c b/testapi.c
---- a/testapi.c	2018-01-25 07:39:15.000000000 +0100
-+++ b/testapi.c	2018-03-20 09:08:35.323980145 +0100
-@@ -1246,49 +1246,91 @@
+diff --git a/testapi.c b/testapi.c
+index 4a751e2..7ccc066 100644
+--- a/testapi.c
++++ b/testapi.c
+@@ -1246,49 +1246,91 @@ static int
  testlibxml2(void)
  {
      int test_ret = 0;
-+    int ret = 0;
- 
+-
 -    test_ret += test_HTMLparser();
 -    test_ret += test_HTMLtree();
 -    test_ret += test_SAX2();
@@ -115,6 +130,8 @@ diff -uNr a/testapi.c b/testapi.c
 -    test_ret += test_xpath();
 -    test_ret += test_xpathInternals();
 -    test_ret += test_xpointer();
++    int ret = 0;
++
 +    test_ret += (ret = test_HTMLparser());
 +    printf("%s: HTMLparser\n", (ret == 0) ? "PASS" : "FAIL");
 +    test_ret += (ret = test_HTMLtree());
@@ -201,20 +218,11 @@ diff -uNr a/testapi.c b/testapi.c
      return(test_ret);
  }
  
-diff -uNr a/testdict.c b/testdict.c
---- a/testdict.c	2016-06-07 12:04:14.000000000 +0200
-+++ b/testdict.c	2018-03-20 08:59:16.864275812 +0100
-@@ -440,5 +440,6 @@
-     clean_strings();
-     xmlCleanupParser();
-     xmlMemoryDump();
-+    printf("%s: testdict\n\n", (ret == 0) ? "PASS" : "FAIL");
-     return(ret);
- }
-diff -uNr a/testchar.c b/testchar.c
---- a/testchar.c	2016-06-07 12:04:14.000000000 +0200
-+++ b/testchar.c	2018-03-20 09:11:20.383573912 +0100
-@@ -23,7 +23,7 @@
+diff --git a/testchar.c b/testchar.c
+index 0d08792..f555d3b 100644
+--- a/testchar.c
++++ b/testchar.c
+@@ -23,7 +23,7 @@ static void errorHandler(void *unused, xmlErrorPtr err) {
  char document1[100] = "<doc>XXXX</doc>";
  char document2[100] = "<doc foo='XXXX'/>";
  
@@ -223,7 +231,7 @@ diff -uNr a/testchar.c b/testchar.c
                    int len,  char *data, int forbid1, int forbid2) {
      int i;
      xmlDocPtr res;
-@@ -37,33 +37,41 @@
+@@ -37,33 +37,41 @@ static void testDocumentRangeByte1(xmlParserCtxtPtr ctxt, char *document,
  	res = xmlReadMemory(document, len, "test", NULL, 0);
  
  	if ((i == forbid1) || (i == forbid2)) {
@@ -269,7 +277,7 @@ diff -uNr a/testchar.c b/testchar.c
                    int len,  char *data) {
      int i, j;
      xmlDocPtr res;
-@@ -80,10 +88,12 @@
+@@ -80,10 +88,12 @@ static void testDocumentRangeByte2(xmlParserCtxtPtr ctxt, char *document,
  
  	/* if first bit of first char is set, then second bit must too */
  	if ((i & 0x80) && ((i & 0x40) == 0)) {
@@ -283,7 +291,7 @@ diff -uNr a/testchar.c b/testchar.c
  	}
  
  	/*
-@@ -91,10 +101,12 @@
+@@ -91,10 +101,12 @@ static void testDocumentRangeByte2(xmlParserCtxtPtr ctxt, char *document,
  	 * bits must be 10
  	 */
  	else if ((i & 0x80) && ((j & 0xC0) != 0x80)) {
@@ -297,7 +305,7 @@ diff -uNr a/testchar.c b/testchar.c
  	}
  
  	/*
-@@ -102,10 +114,12 @@
+@@ -102,10 +114,12 @@ static void testDocumentRangeByte2(xmlParserCtxtPtr ctxt, char *document,
  	 * than 0x80, i.e. one of bits 5 to 1 of i must be set
  	 */
  	else if ((i & 0x80) && ((i & 0x1E) == 0)) {
@@ -311,7 +319,7 @@ diff -uNr a/testchar.c b/testchar.c
  	}
  
  	/*
-@@ -113,10 +127,12 @@
+@@ -113,10 +127,12 @@ static void testDocumentRangeByte2(xmlParserCtxtPtr ctxt, char *document,
  	 * at least 3 bytes, but we give only 2 !
  	 */
  	else if ((i & 0xE0) == 0xE0) {
@@ -325,7 +333,7 @@ diff -uNr a/testchar.c b/testchar.c
  	}
  
  	/*
-@@ -125,11 +141,13 @@
+@@ -125,11 +141,13 @@ static void testDocumentRangeByte2(xmlParserCtxtPtr ctxt, char *document,
  	else if ((lastError != 0) || (res == NULL)) {
  	    fprintf(stderr,
  		"Failed to parse document for Bytes 0x%02X 0x%02X\n", i, j);
@@ -339,7 +347,7 @@ diff -uNr a/testchar.c b/testchar.c
  }
  
  /**
-@@ -141,9 +159,10 @@
+@@ -141,9 +159,10 @@ static void testDocumentRangeByte2(xmlParserCtxtPtr ctxt, char *document,
   * CDATA in text or in attribute values.
   */
  
@@ -351,7 +359,7 @@ diff -uNr a/testchar.c b/testchar.c
  
      /*
       * Set up a parsing context using the first document as
-@@ -152,7 +171,7 @@
+@@ -152,7 +171,7 @@ static void testDocumentRanges(void) {
      ctxt = xmlNewParserCtxt();
      if (ctxt == NULL) {
          fprintf(stderr, "Failed to allocate parser context\n");
@@ -360,7 +368,7 @@ diff -uNr a/testchar.c b/testchar.c
      }
  
      printf("testing 1 byte char in document: 1");
-@@ -163,7 +182,7 @@
+@@ -163,7 +182,7 @@ static void testDocumentRanges(void) {
      data[2] = ' ';
      data[3] = ' ';
      /* test 1 byte injection at beginning of area */
@@ -369,7 +377,7 @@ diff -uNr a/testchar.c b/testchar.c
                             data, -1, -1);
      printf(" 2");
      fflush(stdout);
-@@ -172,7 +191,7 @@
+@@ -172,7 +191,7 @@ static void testDocumentRanges(void) {
      data[2] = ' ';
      data[3] = ' ';
      /* test 1 byte injection at end of area */
@@ -378,7 +386,7 @@ diff -uNr a/testchar.c b/testchar.c
                             data + 3, -1, -1);
  
      printf(" 3");
-@@ -183,7 +202,7 @@
+@@ -183,7 +202,7 @@ static void testDocumentRanges(void) {
      data[2] = ' ';
      data[3] = ' ';
      /* test 1 byte injection at beginning of area */
@@ -387,7 +395,7 @@ diff -uNr a/testchar.c b/testchar.c
                             data, '\'', -1);
      printf(" 4");
      fflush(stdout);
-@@ -192,7 +211,7 @@
+@@ -192,7 +211,7 @@ static void testDocumentRanges(void) {
      data[2] = ' ';
      data[3] = ' ';
      /* test 1 byte injection at end of area */
@@ -396,7 +404,7 @@ diff -uNr a/testchar.c b/testchar.c
                             data + 3, '\'', -1);
      printf(" done\n");
  
-@@ -204,7 +223,7 @@
+@@ -204,7 +223,7 @@ static void testDocumentRanges(void) {
      data[2] = ' ';
      data[3] = ' ';
      /* test 2 byte injection at beginning of area */
@@ -405,7 +413,7 @@ diff -uNr a/testchar.c b/testchar.c
                             data);
      printf(" 2");
      fflush(stdout);
-@@ -213,7 +232,7 @@
+@@ -213,7 +232,7 @@ static void testDocumentRanges(void) {
      data[2] = ' ';
      data[3] = ' ';
      /* test 2 byte injection at end of area */
@@ -414,7 +422,7 @@ diff -uNr a/testchar.c b/testchar.c
                             data + 2);
  
      printf(" 3");
-@@ -224,7 +243,7 @@
+@@ -224,7 +243,7 @@ static void testDocumentRanges(void) {
      data[2] = ' ';
      data[3] = ' ';
      /* test 2 byte injection at beginning of area */
@@ -423,7 +431,7 @@ diff -uNr a/testchar.c b/testchar.c
                             data);
      printf(" 4");
      fflush(stdout);
-@@ -233,14 +252,15 @@
+@@ -233,14 +252,15 @@ static void testDocumentRanges(void) {
      data[2] = ' ';
      data[3] = ' ';
      /* test 2 byte injection at end of area */
@@ -441,7 +449,7 @@ diff -uNr a/testchar.c b/testchar.c
      int i = 0;
      int len, c;
  
-@@ -255,19 +275,25 @@
+@@ -255,19 +275,25 @@ static void testCharRangeByte1(xmlParserCtxtPtr ctxt, char *data) {
          c = xmlCurrentChar(ctxt, &len);
  	if ((i == 0) || (i >= 0x80)) {
  	    /* we must see an error there */
@@ -470,7 +478,7 @@ diff -uNr a/testchar.c b/testchar.c
      int i, j;
      int len, c;
  
-@@ -284,10 +310,12 @@
+@@ -284,10 +310,12 @@ static void testCharRangeByte2(xmlParserCtxtPtr ctxt, char *data) {
  
  	    /* if first bit of first char is set, then second bit must too */
  	    if ((i & 0x80) && ((i & 0x40) == 0)) {
@@ -484,7 +492,7 @@ diff -uNr a/testchar.c b/testchar.c
  	    }
  
  	    /*
-@@ -295,10 +323,12 @@
+@@ -295,10 +323,12 @@ static void testCharRangeByte2(xmlParserCtxtPtr ctxt, char *data) {
  	     * bits must be 10
  	     */
  	    else if ((i & 0x80) && ((j & 0xC0) != 0x80)) {
@@ -498,7 +506,7 @@ diff -uNr a/testchar.c b/testchar.c
  	    }
  
  	    /*
-@@ -306,10 +336,12 @@
+@@ -306,10 +336,12 @@ static void testCharRangeByte2(xmlParserCtxtPtr ctxt, char *data) {
  	     * than 0x80, i.e. one of bits 5 to 1 of i must be set
  	     */
  	    else if ((i & 0x80) && ((i & 0x1E) == 0)) {
@@ -512,7 +520,7 @@ diff -uNr a/testchar.c b/testchar.c
  	    }
  
  	    /*
-@@ -317,10 +349,12 @@
+@@ -317,10 +349,12 @@ static void testCharRangeByte2(xmlParserCtxtPtr ctxt, char *data) {
  	     * at least 3 bytes, but we give only 2 !
  	     */
  	    else if ((i & 0xE0) == 0xE0) {
@@ -526,7 +534,7 @@ diff -uNr a/testchar.c b/testchar.c
  	    }
  
              /*
-@@ -329,6 +363,7 @@
+@@ -329,6 +363,7 @@ static void testCharRangeByte2(xmlParserCtxtPtr ctxt, char *data) {
  	    else if ((lastError != 0) || (len != 2)) {
  		fprintf(stderr,
  		    "Failed to parse char for Bytes 0x%02X 0x%02X\n", i, j);
@@ -534,7 +542,7 @@ diff -uNr a/testchar.c b/testchar.c
  	    }
  
              /*
-@@ -338,12 +373,14 @@
+@@ -338,12 +373,14 @@ static void testCharRangeByte2(xmlParserCtxtPtr ctxt, char *data) {
  		fprintf(stderr,
  	"Failed to parse char for Bytes 0x%02X 0x%02X: expect %d got %d\n",
  	                i, j, ((j & 0x3F) + ((i & 0x1F) << 6)), c);
@@ -550,7 +558,7 @@ diff -uNr a/testchar.c b/testchar.c
      int i, j, k, K;
      int len, c;
      unsigned char lows[6] = {0, 0x80, 0x81, 0xC1, 0xFF, 0xBF};
-@@ -368,20 +405,24 @@
+@@ -368,20 +405,24 @@ static void testCharRangeByte3(xmlParserCtxtPtr ctxt, char *data) {
  	 * at least 4 bytes, but we give only 3 !
  	 */
  	if ((i & 0xF0) == 0xF0) {
@@ -577,7 +585,7 @@ diff -uNr a/testchar.c b/testchar.c
  	}
  
  	/*
-@@ -390,10 +431,12 @@
+@@ -390,10 +431,12 @@ static void testCharRangeByte3(xmlParserCtxtPtr ctxt, char *data) {
  	 * the 6th byte of data[1] must be set
  	 */
  	else if (((i & 0xF) == 0) && ((j & 0x20) == 0)) {
@@ -591,7 +599,7 @@ diff -uNr a/testchar.c b/testchar.c
  	}
  
          /*
-@@ -401,10 +444,12 @@
+@@ -401,10 +444,12 @@ static void testCharRangeByte3(xmlParserCtxtPtr ctxt, char *data) {
  	 */
  	else if (((value > 0xD7FF) && (value <0xE000)) ||
  	         ((value > 0xFFFD) && (value <0x10000))) {
@@ -605,7 +613,7 @@ diff -uNr a/testchar.c b/testchar.c
  	}
  
  	/*
-@@ -414,6 +459,7 @@
+@@ -414,6 +459,7 @@ static void testCharRangeByte3(xmlParserCtxtPtr ctxt, char *data) {
  	    fprintf(stderr,
  		"Failed to parse char for Bytes 0x%02X 0x%02X 0x%02X\n",
  		    i, j, K);
@@ -613,7 +621,7 @@ diff -uNr a/testchar.c b/testchar.c
  	}
  
  	/*
-@@ -423,13 +469,15 @@
+@@ -423,13 +469,15 @@ static void testCharRangeByte3(xmlParserCtxtPtr ctxt, char *data) {
  	    fprintf(stderr,
      "Failed to parse char for Bytes 0x%02X 0x%02X 0x%02X: expect %d got %d\n",
  		i, j, data[2], value, c);
@@ -630,7 +638,7 @@ diff -uNr a/testchar.c b/testchar.c
      int i, j, k, K, l, L;
      int len, c;
      unsigned char lows[6] = {0, 0x80, 0x81, 0xC1, 0xFF, 0xBF};
-@@ -458,10 +506,12 @@
+@@ -458,10 +506,12 @@ static void testCharRangeByte4(xmlParserCtxtPtr ctxt, char *data) {
  	 * at least 5 bytes, but we give only 4 !
  	 */
  	if ((i & 0xF8) == 0xF8) {
@@ -644,7 +652,7 @@ diff -uNr a/testchar.c b/testchar.c
  	}
  
          /*
-@@ -469,10 +519,12 @@
+@@ -469,10 +519,12 @@ static void testCharRangeByte4(xmlParserCtxtPtr ctxt, char *data) {
  	 */
  	else if (((j & 0xC0) != 0x80) || ((K & 0xC0) != 0x80) ||
  	         ((L & 0xC0) != 0x80)) {
@@ -658,7 +666,7 @@ diff -uNr a/testchar.c b/testchar.c
  	}
  
  	/*
-@@ -481,10 +533,12 @@
+@@ -481,10 +533,12 @@ static void testCharRangeByte4(xmlParserCtxtPtr ctxt, char *data) {
  	 * the 6 or 5th byte of j must be set
  	 */
  	else if (((i & 0x7) == 0) && ((j & 0x30) == 0)) {
@@ -672,7 +680,7 @@ diff -uNr a/testchar.c b/testchar.c
  	}
  
          /*
-@@ -493,10 +547,12 @@
+@@ -493,10 +547,12 @@ static void testCharRangeByte4(xmlParserCtxtPtr ctxt, char *data) {
  	else if (((value > 0xD7FF) && (value <0xE000)) ||
  	         ((value > 0xFFFD) && (value <0x10000)) ||
  		 (value > 0x10FFFF)) {
@@ -686,7 +694,7 @@ diff -uNr a/testchar.c b/testchar.c
  	}
  
  	/*
-@@ -506,6 +562,7 @@
+@@ -506,6 +562,7 @@ static void testCharRangeByte4(xmlParserCtxtPtr ctxt, char *data) {
  	    fprintf(stderr,
  		"Failed to parse char for Bytes 0x%02X 0x%02X 0x%02X\n",
  		    i, j, K);
@@ -694,7 +702,7 @@ diff -uNr a/testchar.c b/testchar.c
  	}
  
  	/*
-@@ -515,11 +572,13 @@
+@@ -515,11 +572,13 @@ static void testCharRangeByte4(xmlParserCtxtPtr ctxt, char *data) {
  	    fprintf(stderr,
      "Failed to parse char for Bytes 0x%02X 0x%02X 0x%02X: expect %d got %d\n",
  		i, j, data[2], value, c);
@@ -708,7 +716,7 @@ diff -uNr a/testchar.c b/testchar.c
  }
  
  /**
-@@ -530,11 +589,12 @@
+@@ -530,11 +589,12 @@ static void testCharRangeByte4(xmlParserCtxtPtr ctxt, char *data) {
   * cover the full range of UTF-8 chars accepted by XML-1.0
   */
  
@@ -722,7 +730,7 @@ diff -uNr a/testchar.c b/testchar.c
  
      memset(data, 0, 5);
  
-@@ -545,17 +605,19 @@
+@@ -545,17 +605,19 @@ static void testCharRanges(void) {
      ctxt = xmlNewParserCtxt();
      if (ctxt == NULL) {
          fprintf(stderr, "Failed to allocate parser context\n");
@@ -743,7 +751,7 @@ diff -uNr a/testchar.c b/testchar.c
  	goto error;
      }
      input->filename = NULL;
-@@ -567,25 +629,28 @@
+@@ -567,25 +629,28 @@ static void testCharRanges(void) {
  
      printf("testing char range: 1");
      fflush(stdout);
@@ -776,7 +784,7 @@ diff -uNr a/testchar.c b/testchar.c
      /*
       * this initialize the library and check potential ABI mismatches
       * between the version it was compiled for and the actual shared
-@@ -602,8 +667,9 @@
+@@ -602,8 +667,9 @@ int main(void) {
      /*
       * Run the tests
       */
@@ -788,20 +796,33 @@ diff -uNr a/testchar.c b/testchar.c
  
      /*
       * Cleanup function for the XML library.
-diff -uNr a/testlimits.c b/testlimits.c
---- a/testlimits.c	2016-11-07 09:41:40.000000000 +0100
-+++ b/testlimits.c	2018-03-20 08:59:38.965581280 +0100
-@@ -1634,5 +1634,6 @@
+diff --git a/testdict.c b/testdict.c
+index 40bebd0..114b934 100644
+--- a/testdict.c
++++ b/testdict.c
+@@ -440,5 +440,6 @@ int main(void)
+     clean_strings();
+     xmlCleanupParser();
+     xmlMemoryDump();
++    printf("%s: testdict\n\n", (ret == 0) ? "PASS" : "FAIL");
+     return(ret);
+ }
+diff --git a/testlimits.c b/testlimits.c
+index 68c94db..1584434 100644
+--- a/testlimits.c
++++ b/testlimits.c
+@@ -1634,5 +1634,6 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIBUTE_UNUSED) {
      xmlCleanupParser();
      xmlMemoryDump();
  
 +    printf("%s: testlimits\n", (ret == 0) ? "PASS" : "FAIL");
      return(ret);
  }
-diff -uNr a/testrecurse.c b/testrecurse.c
---- a/testrecurse.c	2017-10-26 09:54:40.000000000 +0200
-+++ b/testrecurse.c	2018-03-20 09:00:46.781628749 +0100
-@@ -892,6 +892,7 @@
+diff --git a/testrecurse.c b/testrecurse.c
+index f95ae1c..74c8f8b 100644
+--- a/testrecurse.c
++++ b/testrecurse.c
+@@ -892,6 +892,7 @@ launchTests(testDescPtr tst) {
  	    err++;
  	}
      }
@@ -809,10 +830,13 @@ diff -uNr a/testrecurse.c b/testrecurse.c
      return(err);
  }
  
-@@ -961,5 +962,6 @@
+@@ -961,5 +962,6 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIBUTE_UNUSED) {
      xmlCleanupParser();
      xmlMemoryDump();
  
 +    printf("%s: testrecurse\n\n", (ret == 0) ? "PASS" : "FAIL");
      return(ret);
  }
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb b/meta/recipes-core/libxml/libxml2_2.9.9.bb
similarity index 93%
rename from meta/recipes-core/libxml/libxml2_2.9.8.bb
rename to meta/recipes-core/libxml/libxml2_2.9.9.bb
index 62643bc..c38f883 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.9.bb
@@ -20,13 +20,10 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml-m4-use-pkgconfig.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            file://fix-execution-of-ptests.patch \
-           file://fix-CVE-2017-8872.patch \
-           file://fix-CVE-2018-14404.patch \
-           file://0001-Fix-infinite-loop-in-LZMA-decompression.patch \
            "
 
-SRC_URI[libtar.md5sum] = "b786e353e2aa1b872d70d5d1ca0c740d"
-SRC_URI[libtar.sha256sum] = "0b74e51595654f958148759cfef0993114ddccccbb6f31aee018f3558e8e2732"
+SRC_URI[libtar.md5sum] = "c04a5a0a042eaa157e8e8c9eabe76bd6"
+SRC_URI[libtar.sha256sum] = "94fb70890143e3c6549f265cee93ec064c80a84c42ad0f23e85ee1fd6540a871"
 SRC_URI[testtar.md5sum] = "ae3d1ebe000a3972afa104ca7f0e1b4a"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
-- 
2.7.4


