Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0FA327312C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489655751; x=1521191751;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=hgqPgEAAvIbqu1XtO1BB/37zpJuVDdQITgft4N1S9fo=;
	b=NJbOLmW+6YsfFBj7ecA655m6qXtWikOdvKVF9b931+qtgP8hnpI2T4yj
	XRJ+j+P3CVSPc+newzA87ixWKujFSw==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2017 02:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="1109062702"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 16 Mar 2017 02:15:50 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 49F592C8001;
	Thu, 16 Mar 2017 02:15:45 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 11:15:33 +0200
Message-Id: <58c7c7863ce1e4b03caec421250349912a358381.1489655518.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1489655518.git.jussi.kukkonen@intel.com>
References: <cover.1489655518.git.jussi.kukkonen@intel.com>
Subject: [PATCH 05/11] python: Remove unused patches
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
X-List-Received-Date: Thu, 16 Mar 2017 09:15:50 -0000

CVE-2016-5636.patch and avoid_parallel_make_races_on_pgen.patch were
removed from SRC_URI as handled upstream in adf4266524d0d.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../python/python/CVE-2016-5636.patch              | 44 ----------------------
 .../python/avoid_parallel_make_races_on_pgen.patch | 27 -------------
 2 files changed, 71 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python/CVE-2016-5636.patch
 delete mode 100644 meta/recipes-devtools/python/python/avoid_parallel_make_races_on_pgen.patch

diff --git a/meta/recipes-devtools/python/python/CVE-2016-5636.patch b/meta/recipes-devtools/python/python/CVE-2016-5636.patch
deleted file mode 100644
index 9a37471..0000000
--- a/meta/recipes-devtools/python/python/CVE-2016-5636.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-
-# HG changeset patch
-# User Benjamin Peterson <benjamin@python.org>
-# Date 1453357424 28800
-# Node ID 985fc64c60d6adffd1138b6cc46df388ca91ca5d
-# Parent  7ec954b9fc54448a35b56d271340ba109eb381b9
-prevent buffer overflow in get_data (closes #26171)
-
-Upstream-Status: Backport
-https://hg.python.org/cpython/rev/985fc64c60d6
-
-CVE: CVE-2016-5636
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-Index: Python-2.7.11/Misc/NEWS
-===================================================================
---- Python-2.7.11.orig/Misc/NEWS
-+++ Python-2.7.11/Misc/NEWS
-@@ -7,6 +7,9 @@ What's New in Python 2.7.11?
- 
- *Release date: 2015-12-05*
- 
-+- Issue #26171: Fix possible integer overflow and heap corruption in
-+  zipimporter.get_data().
-+
- Library
- -------
- 
-Index: Python-2.7.11/Modules/zipimport.c
-===================================================================
---- Python-2.7.11.orig/Modules/zipimport.c
-+++ Python-2.7.11/Modules/zipimport.c
-@@ -895,6 +895,11 @@ get_data(char *archive, PyObject *toc_en
-         PyMarshal_ReadShortFromFile(fp);        /* local header size */
-     file_offset += l;           /* Start of file data */
- 
-+    if (data_size > LONG_MAX - 1) {
-+        fclose(fp);
-+        PyErr_NoMemory();
-+        return NULL;
-+    }
-     raw_data = PyString_FromStringAndSize((char *)NULL, compress == 0 ?
-                                           data_size : data_size + 1);
-     if (raw_data == NULL) {
diff --git a/meta/recipes-devtools/python/python/avoid_parallel_make_races_on_pgen.patch b/meta/recipes-devtools/python/python/avoid_parallel_make_races_on_pgen.patch
deleted file mode 100644
index 8012245..0000000
--- a/meta/recipes-devtools/python/python/avoid_parallel_make_races_on_pgen.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Pending
-
-Avoids parallel make races linking errors when making Parser/PGEN
-
-- Implements Richard Purdie's idea
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
-
-Index: Python-2.7.9/Makefile.pre.in
-===================================================================
---- Python-2.7.9.orig/Makefile.pre.in
-+++ Python-2.7.9/Makefile.pre.in
-@@ -611,12 +611,10 @@ Modules/grpmodule.o: $(srcdir)/Modules/g
- 
- Modules/pwdmodule.o: $(srcdir)/Modules/pwdmodule.c $(srcdir)/Modules/posixmodule.h
- 
--$(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGENSRCS)
-+$(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGENSRCS) $(PGEN)
- 		@$(MKDIR_P) Include
--		$(MAKE) $(PGEN)
- 		$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- $(GRAMMAR_C): $(GRAMMAR_H) $(GRAMMAR_INPUT) $(PGENSRCS)
--		$(MAKE) $(GRAMMAR_H)
- 		touch $(GRAMMAR_C)
- 
- $(PGEN):	$(PGENOBJS)
-- 
2.1.4


