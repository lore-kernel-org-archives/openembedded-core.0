Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 73B3077E94
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 08:42:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 May 2017 01:43:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,358,1491289200"; d="scan'208";a="88535183"
Received: from dmcgahon-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.14.225])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2017 01:42:59 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 May 2017 11:42:51 +0300
Message-Id: <44699ac4b14f4e2255d843ed438bd1adc883f329.1495095863.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1495095863.git.markus.lehtonen@linux.intel.com>
References: <cover.1495095863.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1495095863.git.markus.lehtonen@linux.intel.com>
References: <cover.1495095863.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v3 1/8] python3-native: support profile optimized build
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
X-List-Received-Date: Thu, 18 May 2017 08:42:59 -0000

Make it possible to build python3-native with profile directed optimization
enabled. The feature is enabled by specifying
PYTHON3_NATIVE_PROFILE_OPT = "1" in local.conf.

The profile task to be run may be specified with PYTHON3_NATIVE_PROFILE_TASK
variable in local.conf, e.g.
PYTHON3_NATIVE_PROFILE_TASK = "${S}/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck"

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/python/python3-native_3.5.2.bb         | 9 +++++++++
 meta/recipes-devtools/python/python3/000-cross-compile.patch | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.2.bb b/meta/recipes-devtools/python/python3-native_3.5.2.bb
index edcf2244f5..1d99e56054 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.2.bb
@@ -56,10 +56,19 @@ EXTRA_OEMAKE = '\
 # No ctypes option for python 3
 PYTHONLSBOPTS = ""
 
+PYTHON3_NATIVE_MAKE_TARGET ?= "${@'profile-opt' if d.getVar('PYTHON3_NATIVE_PROFILE_OPT', True) == '1' else ''}"
+
 do_configure_append() {
 	autoreconf --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
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
diff --git a/meta/recipes-devtools/python/python3/000-cross-compile.patch b/meta/recipes-devtools/python/python3/000-cross-compile.patch
index 2d822218f4..d6d7820ee8 100644
--- a/meta/recipes-devtools/python/python3/000-cross-compile.patch
+++ b/meta/recipes-devtools/python/python3/000-cross-compile.patch
@@ -29,15 +29,6 @@ Index: Python-3.5.2/Makefile.pre.in
  
  PSRCS=		\
  		Parser/acceler.c \
-@@ -509,7 +511,7 @@ build_all_generate_profile:
- 
- run_profile_task:
- 	: # FIXME: can't run for a cross build
--	$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK) || true
-+	$(LLVM_PROF_FILE) $(RUNSHARED) $(HOSTPYTHON) $(PROFILE_TASK) || true
- 
- build_all_merge_profile:
- 	$(LLVM_PROF_MERGER)
 @@ -792,7 +794,7 @@ $(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGEN)
  	@$(MKDIR_P) Include
  	# Avoid copying the file onto itself for an in-tree build
-- 
2.12.0


