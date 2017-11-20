Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5C6788CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 12:15:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2017 04:15:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,426,1505804400"; 
   d="scan'208";a="7294428"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by orsmga001.jf.intel.com with ESMTP; 20 Nov 2017 04:15:34 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 14:15:18 +0200
Message-Id: <2402408636c0e10611588037067eb5b72b592d07.1511179969.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511179969.git.markus.lehtonen@linux.intel.com>
References: <cover.1511179969.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1511179969.git.markus.lehtonen@linux.intel.com>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
	<cover.1511179969.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v6 01/15] python3-native: support profile optimized build
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
X-List-Received-Date: Mon, 20 Nov 2017 12:15:33 -0000

Make it possible to build python3-native with profile directed optimization
enabled. The feature is enabled by specifying
PYTHON3_NATIVE_PROFILE_OPT = "1" in local.conf.

The profile task to be run may be specified with PYTHON3_NATIVE_PROFILE_TASK
variable in local.conf, e.g.
PYTHON3_NATIVE_PROFILE_TASK = "${S}/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck"

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/python/python3-native_3.5.3.bb             | 9 +++++++++
 .../python/python3/0001-cross-compile-support.patch              | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.3.bb b/meta/recipes-devtools/python/python3-native_3.5.3.bb
index 8cd9c88a82..936ea05b29 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.3.bb
@@ -58,11 +58,20 @@ EXTRA_OEMAKE = '\
 # No ctypes option for python 3
 PYTHONLSBOPTS = ""
 
+PYTHON3_NATIVE_MAKE_TARGET ?= "${@'profile-opt' if d.getVar('PYTHON3_NATIVE_PROFILE_OPT', True) == '1' else ''}"
+
 do_configure_append() {
 	autoreconf --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
 	sed -i -e 's,#define HAVE_GETRANDOM 1,/\* #undef HAVE_GETRANDOM \*/,' ${B}/pyconfig.h
 }
 
+do_compile() {
+    if [ -n "${PYTHON3_NATIVE_PROFILE_TASK}" ]; then
+        sed -i -e 's,^PROFILE_TASK=.*,PROFILE_TASK=${PYTHON3_NATIVE_PROFILE_TASK},g' Makefile
+    fi
+    oe_runmake ${PYTHON3_NATIVE_MAKE_TARGET}
+}
+
 do_install() {
 	install -d ${D}${libdir}/pkgconfig
 	oe_runmake 'DESTDIR=${D}' install
diff --git a/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch b/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
index 118d75ddc5..bd599a8b7e 100644
--- a/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
+++ b/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
@@ -34,15 +34,6 @@ index a88b7d5..7cb8bb3 100644
  
  PSRCS=		\
  		Parser/acceler.c \
-@@ -510,7 +512,7 @@ build_all_generate_profile:
- 
- run_profile_task:
- 	: # FIXME: can't run for a cross build
--	$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK) || true
-+	$(LLVM_PROF_FILE) $(RUNSHARED) $(HOSTPYTHON) $(PROFILE_TASK) || true
- 
- build_all_merge_profile:
- 	$(LLVM_PROF_MERGER)
 @@ -787,7 +789,7 @@ $(IO_OBJS): $(IO_H)
  
  $(GRAMMAR_H): @GENERATED_COMMENT@ $(GRAMMAR_INPUT) $(PGEN)
-- 
2.13.6


