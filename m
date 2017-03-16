Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C6F6F774EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:15:47 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 16 Mar 2017 02:15:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="77589410"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 16 Mar 2017 02:15:49 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 31DD92C8001;
	Thu, 16 Mar 2017 02:15:43 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 11:15:32 +0200
Message-Id: <73c7531481106a72ed133c4872a10a0e3d26022f.1489655518.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1489655518.git.jussi.kukkonen@intel.com>
References: <cover.1489655518.git.jussi.kukkonen@intel.com>
Subject: [PATCH 04/11] python3: Remove unused patches
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
X-List-Received-Date: Thu, 16 Mar 2017 09:15:49 -0000

CVE-2016-5636.patch and use_packed_importlib.patch were removed from
SRC_URI as handled in upstream in b192bc02bbf91.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../python/python3/CVE-2016-5636.patch             | 44 ----------------------
 .../python/python3/use_packed_importlib.patch      | 31 ---------------
 2 files changed, 75 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2016-5636.patch
 delete mode 100644 meta/recipes-devtools/python/python3/use_packed_importlib.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2016-5636.patch b/meta/recipes-devtools/python/python3/CVE-2016-5636.patch
deleted file mode 100644
index 0d494d2..0000000
--- a/meta/recipes-devtools/python/python3/CVE-2016-5636.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-
-# HG changeset patch
-# User Benjamin Peterson <benjamin@python.org>
-# Date 1453357506 28800
-# Node ID 10dad6da1b28ea4af78ad9529e469fdbf4ebbc8f
-# Parent  a3ac2cd93db9d5336dfd7b5b27efde2c568d8794# Parent  01ddd608b85c85952537d95a43bbabf4fb655057
-merge 3.4 (#26171)
-
-Upstream-Status: Backport
-CVE: CVE-2016-5636
-
-https://hg.python.org/cpython/raw-rev/10dad6da1b28
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-Index: Python-3.5.1/Misc/NEWS
-===================================================================
---- Python-3.5.1.orig/Misc/NEWS
-+++ Python-3.5.1/Misc/NEWS
-@@ -91,6 +91,9 @@ Core and Builtins
-   Python.h header to fix a compilation error with OpenMP. PyThreadState_GET()
-   becomes an alias to PyThreadState_Get() to avoid ABI incompatibilies.
- 
-+- Issue #26171: Fix possible integer overflow and heap corruption in
-+  zipimporter.get_data().
-+
- Library
- -------
- 
-Index: Python-3.5.1/Modules/zipimport.c
-===================================================================
---- Python-3.5.1.orig/Modules/zipimport.c
-+++ Python-3.5.1/Modules/zipimport.c
-@@ -1112,6 +1112,11 @@ get_data(PyObject *archive, PyObject *to
-     }
-     file_offset += l;           /* Start of file data */
- 
-+    if (data_size > LONG_MAX - 1) {
-+        fclose(fp);
-+        PyErr_NoMemory();
-+        return NULL;
-+    }
-     bytes_size = compress == 0 ? data_size : data_size + 1;
-     if (bytes_size == 0)
-         bytes_size++;
diff --git a/meta/recipes-devtools/python/python3/use_packed_importlib.patch b/meta/recipes-devtools/python/python3/use_packed_importlib.patch
deleted file mode 100644
index 70708a0..0000000
--- a/meta/recipes-devtools/python/python3/use_packed_importlib.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-
-Upstream-Status: Inappropriate [embedded specific] 
-  
-The binary _freeze_importlib is built and also used during build time to generate
-importlib*.h files, this is impossible to do on a cross-compile environment,
-this avoids executing the binary and forces it to use the packed importlib*.h files.
-
- 
-Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com> 
-
-Index: Python-3.5.0/Makefile.pre.in
-===================================================================
---- Python-3.5.0.orig/Makefile.pre.in
-+++ Python-3.5.0/Makefile.pre.in
-@@ -700,12 +700,12 @@ Programs/_freeze_importlib.o: Programs/_
- Programs/_freeze_importlib: Programs/_freeze_importlib.o $(LIBRARY_OBJS_OMIT_FROZEN)
- 	$(LINKCC) $(PY_LDFLAGS) -o $@ Programs/_freeze_importlib.o $(LIBRARY_OBJS_OMIT_FROZEN) $(LIBS) $(MODLIBS) $(SYSLIBS) $(LDLAST)
- 
--Python/importlib_external.h: $(srcdir)/Lib/importlib/_bootstrap_external.py Programs/_freeze_importlib
--	./Programs/_freeze_importlib \
-+#Python/importlib_external.h: $(srcdir)/Lib/importlib/_bootstrap_external.py Programs/_freeze_importlib
-+#	./Programs/_freeze_importlib \
- 		$(srcdir)/Lib/importlib/_bootstrap_external.py Python/importlib_external.h
- 
--Python/importlib.h: $(srcdir)/Lib/importlib/_bootstrap.py Programs/_freeze_importlib
--	./Programs/_freeze_importlib \
-+#Python/importlib.h: $(srcdir)/Lib/importlib/_bootstrap.py Programs/_freeze_importlib
-+#	./Programs/_freeze_importlib \
- 		$(srcdir)/Lib/importlib/_bootstrap.py Python/importlib.h
- 
- 
-- 
2.1.4


