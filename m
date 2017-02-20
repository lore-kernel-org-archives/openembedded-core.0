Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4172C71DEE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:36:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2017 02:36:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,186,1484035200"; d="scan'208";a="1132314459"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2017 02:36:03 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2017 12:35:42 +0200
Message-Id: <20170220103551.20022-11-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170220103551.20022-1-markus.lehtonen@linux.intel.com>
References: <20170220103551.20022-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 11/20] python3-native: support profile optimized build
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
X-List-Received-Date: Mon, 20 Feb 2017 10:36:03 -0000

This feature is virtually identical to that of python-native. Profile
guided optimization is enabled by defining
PYTHON3_NATIVE_PROFILE_OPT = "1"
in local.conf. In addition, the profile task may be defined with
PYTHON3_NATIVE_PROFILE_TASK.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/python/python3-native_3.5.2.bb         | 9 +++++++++
 meta/recipes-devtools/python/python3/000-cross-compile.patch | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.2.bb b/meta/recipes-devtools/python/python3-native_3.5.2.bb
index bf4e686..d289573 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.2.bb
@@ -81,10 +81,19 @@ EXTRA_OEMAKE = '\
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
index 2d82221..d6d7820 100644
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
2.10.2


