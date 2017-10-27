Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7CDBE782C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 10:08:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Oct 2017 03:08:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; d="scan'208";a="1236012597"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2017 03:08:02 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Oct 2017 13:07:51 +0300
Message-Id: <07f69a41f96c5e641a5cdfae8ffbf93a97e476e4.1509094533.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v5 08/10] python3: fix profile-optimized build of modules
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
X-List-Received-Date: Fri, 27 Oct 2017 10:08:01 -0000

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
index 1115c3feba..b8d89b5979 100644
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


