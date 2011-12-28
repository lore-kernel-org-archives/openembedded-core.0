Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rfz2T-0005if-W6
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 20:19:50 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Dec 2011 11:12:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="90309406"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.80])
	by azsmga001.ch.intel.com with ESMTP; 28 Dec 2011 11:12:34 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 11:12:24 -0800
Message-Id: <a51df51291f928ba8250fb05c6b596017d400fc4.1325099431.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325099430.git.sgw@linux.intel.com>
References: <cover.1325099430.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325099430.git.sgw@linux.intel.com>
References: <cover.1325099430.git.sgw@linux.intel.com>
Subject: [PATCH 3/6] python: add md5module support
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
X-List-Received-Date: Wed, 28 Dec 2011 19:19:50 -0000

The internal md5 module is needed for using "waf" to install
other python packages such as pycairo.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-devtools/python/python-native_2.7.2.bb |    6 ++++--
 .../python/python/add-md5module-support.patch      |   13 +++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 ++-
 3 files changed, 19 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/add-md5module-support.patch

diff --git a/meta/recipes-devtools/python/python-native_2.7.2.bb b/meta/recipes-devtools/python/python-native_2.7.2.bb
index d036eca..7d8c597 100644
--- a/meta/recipes-devtools/python/python-native_2.7.2.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI += "file://04-default-is-optimized.patch \
            file://05-enable-ctypes-cross-build.patch \
@@ -11,7 +11,9 @@ SRC_URI += "file://04-default-is-optimized.patch \
            file://debug.patch \
            file://unixccompiler.patch \
            file://nohostlibs.patch \
-           file://multilib.patch "
+           file://multilib.patch \
+           file://add-md5module-support.patch \
+           "
 S = "${WORKDIR}/Python-${PV}"
 
 inherit native
diff --git a/meta/recipes-devtools/python/python/add-md5module-support.patch b/meta/recipes-devtools/python/python/add-md5module-support.patch
new file mode 100644
index 0000000..f715f40
--- /dev/null
+++ b/meta/recipes-devtools/python/python/add-md5module-support.patch
@@ -0,0 +1,13 @@
+Index: Python-2.7.2/Modules/Setup.dist
+===================================================================
+--- Python-2.7.2.orig/Modules/Setup.dist	2011-06-11 08:46:26.000000000 -0700
++++ Python-2.7.2/Modules/Setup.dist	2011-12-27 15:51:41.244623219 -0800
+@@ -248,7 +248,7 @@
+ # Message-Digest Algorithm, described in RFC 1321.  The necessary files
+ # md5.c and md5.h are included here.
+ 
+-#_md5 md5module.c md5.c
++_md5 md5module.c md5.c
+ 
+ 
+ # The _sha module implements the SHA checksum algorithms.
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 5e8e0d7..654c850 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -19,6 +19,7 @@ SRC_URI += "\
   file://cgi_py.patch \
   file://remove_sqlite_rpath.patch \
   file://setup_py_skip_cross_import_check.patch \
+  file://add-md5module-support.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.6.4



