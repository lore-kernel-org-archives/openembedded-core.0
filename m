Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 11C08786B2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jan 2018 10:02:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jan 2018 02:02:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,352,1511856000"; 
   d="scan'208";a="9387362"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.166.180])
	by fmsmga007.fm.intel.com with ESMTP; 13 Jan 2018 02:02:42 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Jan 2018 18:02:37 +0800
Message-Id: <1515837757-5173-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libxml2: fix makefile for ptests
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
X-List-Received-Date: Sat, 13 Jan 2018 10:02:43 -0000

Changes to Makefile in latest version mean when "make -k runtests" is executed,
it leads to errors like:

| make: *** No rule to make target 'runtest.c', needed by 'runtest.o'.
| make: *** No rule to make target 'SAX.c', needed by 'SAX.lo'.
| make: *** No rule to make target 'entities.c', needed by 'entities.lo'.
| make: *** No rule to make target 'encoding.c', needed by 'encoding.lo'.

Make sure that we don't try to check and compile the tests again on the target.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libxml/libxml2/fix-execution-of-ptests.patch    | 21 +++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.7.bb           |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/fix-execution-of-ptests.patch

diff --git a/meta/recipes-core/libxml/libxml2/fix-execution-of-ptests.patch b/meta/recipes-core/libxml/libxml2/fix-execution-of-ptests.patch
new file mode 100644
index 0000000..51a9e19
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/fix-execution-of-ptests.patch
@@ -0,0 +1,21 @@
+Make sure that Makefile doesn't try to compile these tests again
+on the target where the source dependencies won't be available.
+
+Upstream-Status: Inappropriate [cross-compile specific]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+Index: libxml2-2.9.7/Makefile.am
+===================================================================
+--- libxml2-2.9.7.orig/Makefile.am
++++ libxml2-2.9.7/Makefile.am
+@@ -211,8 +211,7 @@ install-ptest:
+ 	sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
+ 	$(MAKE) -C python install-ptest
+ 
+-runtests: runtest$(EXEEXT) testrecurse$(EXEEXT) testapi$(EXEEXT) \
+-          testchar$(EXEEXT) testdict$(EXEEXT) runxmlconf$(EXEEXT)
++runtests:
+ 	[ -d test   ] || $(LN_S) $(srcdir)/test   .
+ 	[ -d result ] || $(LN_S) $(srcdir)/result .
+ 	$(CHECKER) ./runtest$(EXEEXT) && \
diff --git a/meta/recipes-core/libxml/libxml2_2.9.7.bb b/meta/recipes-core/libxml/libxml2_2.9.7.bb
index 996e671..85bfeca 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.7.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.7.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://python-sitepackages-dir.patch \
            file://libxml-m4-use-pkgconfig.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
+           file://fix-execution-of-ptests.patch \
            "
 
 SRC_URI[libtar.md5sum] = "896608641a08b465098a40ddf51cefba"
-- 
2.7.4


