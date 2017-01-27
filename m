Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9820877384
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 10:13:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 27 Jan 2017 02:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,294,1477983600"; d="scan'208";a="36227397"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 27 Jan 2017 02:13:38 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 12:13:28 +0200
Message-Id: <20170127101331.14389-8-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170127101331.14389-1-markus.lehtonen@linux.intel.com>
References: <20170127101331.14389-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH RFC 07/10] python3: fix profile-optimized build of modules
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
X-List-Received-Date: Fri, 27 Jan 2017 10:13:38 -0000

Without this the pgo-related compiler flags are not used in
cross-builds.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 ...-CFLAGS-for-extensions-when-cross-compili.patch | 56 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.2.bb      |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch

diff --git a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
new file mode 100644
index 0000000..bf239c6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
@@ -0,0 +1,56 @@
+From 0fd8b986888ddf1995b503edf46ac827e83114d9 Mon Sep 17 00:00:00 2001
+From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+Date: Wed, 23 Nov 2016 16:08:04 +0200
+Subject: [PATCH] Use correct CFLAGS for extensions when cross-compiling
+
+Take PY_CFLAGS_NODIST into account, like in native build. This is needed
+in order to to profile-optimized build. Also, pass EXTRA_CFLAGS to
+profile-optimized build.
+
+Upstream-Status: Pending
+
+Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+---
+ Makefile.pre.in | 4 ++--
+ setup.py        | 3 ++-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index bace00e..9635aa4 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -509,7 +509,7 @@ profile-opt:
+ 	$(MAKE) profile-removal
+ 
+ build_all_generate_profile:
+-	$(MAKE) all CFLAGS_NODIST="$(CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
++	$(MAKE) all CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
+ 
+ run_profile_task:
+ 	: # FIXME: can't run for a cross build
+@@ -519,7 +519,7 @@ build_all_merge_profile:
+ 	$(LLVM_PROF_MERGER)
+ 
+ build_all_use_profile:
+-	$(MAKE) all CFLAGS_NODIST="$(CFLAGS) $(PGO_PROF_USE_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) @LTOFLAGS@"
++	$(MAKE) all CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_USE_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) @LTOFLAGS@"
+ 
+ # Compile and run with gcov
+ .PHONY=coverage coverage-lcov coverage-report
+diff --git a/setup.py b/setup.py
+index c1ce87e..72d37cf 100644
+--- a/setup.py
++++ b/setup.py
+@@ -271,7 +271,8 @@ class PyBuildExt(build_ext):
+         # compilers
+         if compiler is not None:
+             if cross_compiling:
+-                (ccshared,cflags) = (os.environ.get('CCSHARED') or '', os.environ.get('CFLAGS') or '')
++                (ccshared,cflags) = (os.environ.get('CCSHARED') or '',
++                                     (os.environ.get('CFLAGS') or '') + ' ' + sysconfig.get_config_var('PY_CFLAGS_NODIST'))
+             else:
+                 (ccshared,cflags) = sysconfig.get_config_vars('CCSHARED','CFLAGS')
+             args['compiler_so'] = compiler + ' ' + ccshared + ' ' + cflags
+-- 
+2.6.6
+
diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb b/meta/recipes-devtools/python/python3_3.5.2.bb
index 7e629b8..77ab071 100644
--- a/meta/recipes-devtools/python/python3_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3_3.5.2.bb
@@ -34,6 +34,7 @@ SRC_URI += "\
             file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
             file://configure.ac-fix-LIBPL.patch \
             file://python3-fix-CVE-2016-1000110.patch \
+            file://Use-correct-CFLAGS-for-extensions-when-cross-compili.patch \
            "
 SRC_URI[md5sum] = "8906efbacfcdc7c3c9198aeefafd159e"
 SRC_URI[sha256sum] = "0010f56100b9b74259ebcd5d4b295a32324b58b517403a10d1a2aa7cb22bca40"
-- 
2.10.2


