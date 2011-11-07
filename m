Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RNVtw-0002TC-D3
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 21:34:40 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2011 12:28:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="71966810"
Received: from unknown (HELO localhost) ([10.255.15.253])
	by orsmga002.jf.intel.com with ESMTP; 07 Nov 2011 12:28:28 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 14:28:55 -0600
Message-Id: <4768c13e9f66fa82a2bd536ff287a6d003d9df4c.1320697346.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <bb5c0a2e7d5a9ee1c22a0eb1422ae5454b033b53.1320697346.git.tom.zanussi@intel.com>
References: <bb5c0a2e7d5a9ee1c22a0eb1422ae5454b033b53.1320697346.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1320697346.git.tom.zanussi@intel.com>
References: <cover.1320697346.git.tom.zanussi@intel.com>
Subject: [PATCH 6/6] python: skip setup.py 'import check' when cross-compiling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2011 20:34:40 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

build_extension() in setup.py, as part of the build process, does an
'import check' on the built extension.  The import check in turn
dlopen()'s the shared library associated with the extension, which
isn't something that makes sense if that library was cross-compiled
for a different architecture.

This was noticed with an x86_64 target that was compiled with avx
support, because it caused 'illegal instruction' exceptions:

| /bin/sh: line 1: 14575 Illegal instruction ... -E ./setup.py -q build

For other target architectures, it doesn't necessarily cause illegal
instruction exceptions, but still fails.  For example, on arm, the
failure pathway causes this warning:

*** WARNING: renaming "cmath" since importing it failed: .../cmath.so:
    wrong ELF class: ELFCLASS32

This patch to setup.py and the associated recipe changes allow the
whole 'import check' logic to be skipped when cross-compiling.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 .../python/setup_py_skip_cross_import_check.patch  |   27 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    5 +++
 2 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/setup_py_skip_cross_import_check.patch

diff --git a/meta/recipes-devtools/python/python/setup_py_skip_cross_import_check.patch b/meta/recipes-devtools/python/python/setup_py_skip_cross_import_check.patch
new file mode 100644
index 0000000..6ccdb94
--- /dev/null
+++ b/meta/recipes-devtools/python/python/setup_py_skip_cross_import_check.patch
@@ -0,0 +1,27 @@
+This patch skips over the 'import check' setup.py does when building
+extensions.  This generally won't work when cross-compiling.
+
+Upstream-Status: Inappropriate [embedded-specific]
+
+Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
+
+Index: Python-2.7.2/setup.py
+===================================================================
+--- Python-2.7.2.orig/setup.py	2011-11-04 16:46:34.553796410 -0500
++++ Python-2.7.2/setup.py	2011-11-04 16:59:49.692802313 -0500
+@@ -287,6 +287,15 @@
+                           (ext.name, sys.exc_info()[1]))
+             self.failed.append(ext.name)
+             return
++
++        # If we're cross-compiling, we want to skip the import check
++        # i.e. we shouldn't be dynamically loading target shared libs
++        if os.environ.get('CROSS_COMPILE') is not None:
++            self.announce(
++                'WARNING: skipping import check for cross-compiled "%s"' %
++                ext.name)
++            return
++
+         # Workaround for Mac OS X: The Carbon-based modules cannot be
+         # reliably imported into a command-line Python
+         if 'Carbon' in ext.extra_link_args:
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index bb088a4..360e64e 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -18,6 +18,7 @@ SRC_URI += "\
   file://multilib.patch \
   file://cgi_py.patch \
   file://remove_sqlite_rpath.patch \
+  file://setup_py_skip_cross_import_check.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
@@ -57,6 +58,8 @@ do_compile() {
 	# then call do_install twice we get Makefile.orig == Makefile.sysroot
 	install -m 0644 Makefile Makefile.sysroot
 
+	export CROSS_COMPILE="${TARGET_PREFIX}"
+
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
@@ -78,6 +81,8 @@ do_install() {
 	# make install needs the original Makefile, or otherwise the inclues would
 	# go to ${D}${STAGING...}/...
 	install -m 0644 Makefile.orig Makefile
+
+	export CROSS_COMPILE="${TARGET_PREFIX}"
 	
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
-- 
1.7.0.4



