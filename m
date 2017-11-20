Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3F758788CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 12:15:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2017 04:15:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,426,1505804400"; 
   d="scan'208";a="7294477"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by orsmga001.jf.intel.com with ESMTP; 20 Nov 2017 04:15:47 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 14:15:30 +0200
Message-Id: <6d840ff0f2fab06c4137d0d198d6177710a916f5.1511179969.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511179969.git.markus.lehtonen@linux.intel.com>
References: <cover.1511179969.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1511179969.git.markus.lehtonen@linux.intel.com>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
	<cover.1511179969.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v6 13/15] python3: fix profile-optimized build of modules
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
X-List-Received-Date: Mon, 20 Nov 2017 12:15:46 -0000

Without this the pgo-related compiler flags are not used in
cross-builds.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 ...-CFLAGS-for-extensions-when-cross-compili.patch | 56 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.3.bb      |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch

diff --git a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
new file mode 100644
index 0000000000..2e299b3c59
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
@@ -0,0 +1,56 @@
+From d721ebabbf8567d42dfdcd17e170846ba837b04a Mon Sep 17 00:00:00 2001
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
+index 4fcaafc..2d20753 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -510,7 +510,7 @@ profile-opt:
+ 	$(MAKE) profile-removal
+ 
+ build_all_generate_profile:
+-	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
++	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
+ 
+ run_profile_task:
+ 	: # FIXME: can't run for a cross build
+@@ -520,7 +520,7 @@ build_all_merge_profile:
+ 	$(LLVM_PROF_MERGER)
+ 
+ build_all_use_profile:
+-	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(PGO_PROF_USE_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) @LTOFLAGS@"
++	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_USE_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) @LTOFLAGS@"
+ 
+ # Compile and run with gcov
+ .PHONY=coverage coverage-lcov coverage-report
+diff --git a/setup.py b/setup.py
+index 7fa9cc3..ef18fe4 100644
+--- a/setup.py
++++ b/setup.py
+@@ -263,7 +263,8 @@ class PyBuildExt(build_ext):
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
+2.12.3
+
diff --git a/meta/recipes-devtools/python/python3_3.5.3.bb b/meta/recipes-devtools/python/python3_3.5.3.bb
index 844139dfa3..16097e4236 100644
--- a/meta/recipes-devtools/python/python3_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3_3.5.3.bb
@@ -40,6 +40,7 @@ SRC_URI += "\
             file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
             file://Fix-29519-weakref-spewing-exceptions-during-interp-f.patch \
             file://pass-missing-libraries-to-Extension-for-mul.patch \
+            file://Use-correct-CFLAGS-for-extensions-when-cross-compili.patch \
            "
 SRC_URI[md5sum] = "57d1f8bfbabf4f2500273fb0706e6f21"
 SRC_URI[sha256sum] = "eefe2ad6575855423ab630f5b51a8ef6e5556f774584c06beab4926f930ddbb0"
-- 
2.13.6


