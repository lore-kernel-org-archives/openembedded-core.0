Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 47FF971B50
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:35:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2017 02:35:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,186,1484035200"; d="scan'208";a="1132314370"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2017 02:35:52 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2017 12:35:32 +0200
Message-Id: <20170220103551.20022-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 01/20] python-native: support profile optimized build
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
X-List-Received-Date: Mon, 20 Feb 2017 10:35:53 -0000

Make it possible to build python-native with profile directed
optimization enabled.  The feature is enabled by setting
PYTHON_NATIVE_PROFILE_OPT = "1" in local.conf.

The profile task to run may be specified with PYTHON_NATIVE_PROFILE_TASK
variable in local.conf, e.g.
PYTHON_NATIVE_PROFILE_TASK = "${S}/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck"

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 ...x-.so-loading-when-when-running-profile-t.patch | 26 ++++++++++++++++++++++
 .../python/python-native_2.7.12.bb                 | 10 +++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-native/Makefile-fix-.so-loading-when-when-running-profile-t.patch

diff --git a/meta/recipes-devtools/python/python-native/Makefile-fix-.so-loading-when-when-running-profile-t.patch b/meta/recipes-devtools/python/python-native/Makefile-fix-.so-loading-when-when-running-profile-t.patch
new file mode 100644
index 0000000..e4c89db
--- /dev/null
+++ b/meta/recipes-devtools/python/python-native/Makefile-fix-.so-loading-when-when-running-profile-t.patch
@@ -0,0 +1,26 @@
+Makefile: fix .so loading when when running profile task
+
+Use correct search path when doing profiling for profile-optimized
+build. This way we load the correct Python libraries, i.e. the ones from
+our build directory, and not the ones from the host os.
+
+Upstream-Status: Pending
+
+Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 2affc41..4355e7f 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -458,7 +458,7 @@ build_all_generate_profile:
+ 
+ run_profile_task:
+ 	: # FIXME: can't run for a cross build
+-	$(LLVM_PROF_FILE) ./$(BUILDPYTHON) $(PROFILE_TASK) || true
++	$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK) || true
+ 
+ build_all_merge_profile:
+ 	$(LLVM_PROF_MERGER)
+-- 
+2.6.6
+
diff --git a/meta/recipes-devtools/python/python-native_2.7.12.bb b/meta/recipes-devtools/python/python-native_2.7.12.bb
index de83cbd..2359b47 100644
--- a/meta/recipes-devtools/python/python-native_2.7.12.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.12.bb
@@ -17,6 +17,7 @@ SRC_URI += "\
             file://builddir.patch \
             file://parallel-makeinst-create-bindir.patch \
             file://revert_use_of_sysconfigdata.patch \
+            file://Makefile-fix-.so-loading-when-when-running-profile-t.patch \
            "
 
 S = "${WORKDIR}/Python-${PV}"
@@ -35,10 +36,19 @@ EXTRA_OEMAKE = '\
   STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
 '
 
+PYTHON_NATIVE_MAKE_TARGET ?= "${@'profile-opt' if d.getVar('PYTHON_NATIVE_PROFILE_OPT', True) == '1' else ''}"
+
 do_configure_append() {
 	autoreconf --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
 }
 
+do_compile() {
+    if [ -n "${PYTHON_NATIVE_PROFILE_TASK}" ]; then
+        sed -i -e 's,^PROFILE_TASK=.*,PROFILE_TASK=${PYTHON_NATIVE_PROFILE_TASK},g' Makefile
+    fi
+    oe_runmake ${PYTHON_NATIVE_MAKE_TARGET}
+}
+
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install
 	install -d ${D}${bindir}/${PN}
-- 
2.10.2


