Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 672B870016
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:54:02 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:54:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498127"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:54:04 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:54:13 +0300
Message-Id: <04131abc27115f0e551b9c0482db85e8ec80ee49.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 24/45] gdb: move to Python 3
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
X-List-Received-Date: Tue, 24 May 2016 11:54:02 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc         |  2 +-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 12 ++++++------
 meta/recipes-devtools/gdb/gdb-cross.inc          |  4 ++--
 meta/recipes-devtools/gdb/gdb_7.11.bb            |  6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 3e00a2e..a5a9adf 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -61,7 +61,7 @@ EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x --disable-werror \
 PACKAGECONFIG ??= "readline"
 # Use --without-system-readline to compile with readline 5.
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
-PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python,python python-codecs"
+PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3,python3 python3-codecs"
 PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
 
 GDBPROPREFIX = "--program-prefix=''"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 6e42af1..e53081d 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -1,5 +1,5 @@
 inherit cross-canadian
-inherit python-dir
+inherit python3-dir
 
 SUMMARY = "GNU debugger (cross-canadian gdb for ${TARGET_ARCH} target)"
 PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
@@ -12,9 +12,9 @@ GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
 # Overrides PACKAGECONFIG variables in gdb-common.inc
 PACKAGECONFIG ??= "python readline"
-PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,nativesdk-python, \
-                         nativesdk-python-core nativesdk-python-lang nativesdk-python-re \
-                         nativesdk-python-codecs nativesdk-python-netclient"
+PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,nativesdk-python3, \
+                         nativesdk-python3-core nativesdk-python3-lang nativesdk-python3-re \
+                         nativesdk-python3-codecs nativesdk-python3-netclient"
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,nativesdk-readline"
 
 SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"
@@ -23,8 +23,8 @@ do_configure_prepend() {
 cat > ${WORKDIR}/python << EOF
 #! /bin/sh
 case "\$2" in
-        --includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}/" ;;
-        --ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
+        --includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}/" ;;
+        --ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}${PYTHON_ABI}" ;;
         --exec-prefix) echo "${exec_prefix}" ;;
         *) exit 1 ;;
 esac
diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index c62715f..7579205 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -2,11 +2,11 @@ require gdb-common.inc
 
 DEPENDS = "expat-native ncurses-native"
 
-inherit pythonnative
+inherit python3native
 
 # Overrides PACKAGECONFIG variables in gdb-common.inc
 PACKAGECONFIG ??= "python readline"
-PACKAGECONFIG[python] = "--with-python=${STAGING_BINDIR_NATIVE}/python-native/python,--without-python,python-native"
+PACKAGECONFIG[python] = "--with-python=${STAGING_BINDIR_NATIVE}/python-native/python,--without-python,python3-native"
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline-native"
 
 do_compile_prepend() {
diff --git a/meta/recipes-devtools/gdb/gdb_7.11.bb b/meta/recipes-devtools/gdb/gdb_7.11.bb
index ccc33b8..f02e643 100644
--- a/meta/recipes-devtools/gdb/gdb_7.11.bb
+++ b/meta/recipes-devtools/gdb/gdb_7.11.bb
@@ -1,15 +1,15 @@
 require gdb.inc
 require gdb-${PV}.inc
 
-inherit python-dir
+inherit python3-dir
 
 do_configure_prepend() {
 	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}" ]; then
 		cat > ${WORKDIR}/python << EOF
 #!/bin/sh
 case "\$2" in
-	--includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}/" ;;
-	--ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
+	--includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}/" ;;
+	--ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}${PYTHON_ABI}" ;;
 	--exec-prefix) echo "${exec_prefix}" ;;
 	*) exit 1 ;;
 esac
-- 
2.8.1


