Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvR-0004HU-KC
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:46:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206439"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:46:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:46 -0800
Message-Id: <25016d158af927e0c9e70c3df4674f53fa54fec8.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 26/35] python: Fix build failure of python-elementtree on x86_64
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
X-List-Received-Date: Tue, 07 Feb 2012 22:54:13 -0000

From: Khem Raj <raj.khem@gmail.com>

The problem is due to mixing of headers from host system
thusly corrected in setup.py by checkinng if we are cross
compiling

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python/host_include_contamination.patch |   27 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
 2 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/host_include_contamination.patch

diff --git a/meta/recipes-devtools/python/python/host_include_contamination.patch b/meta/recipes-devtools/python/python/host_include_contamination.patch
new file mode 100644
index 0000000..62cb8b1
--- /dev/null
+++ b/meta/recipes-devtools/python/python/host_include_contamination.patch
@@ -0,0 +1,27 @@
+when building python for qemux86-64 on ubuntu 11.10/64bit
+it gropes into host includes and then mixes them with cross
+includes and as a result some modules fail to compile and link
+one of the modules is python-elementtree which is then not
+found during image creation
+
+Proble is that setup.py tries to add native includes that newer
+ubuntu has introduced for multiarch support. But that should
+only happen for native builds and not cross building python
+so we add a check here.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: Python-2.7.2/setup.py
+===================================================================
+--- Python-2.7.2.orig/setup.py	2012-02-03 12:10:42.307057756 -0800
++++ Python-2.7.2/setup.py	2012-02-03 12:11:12.363059210 -0800
+@@ -360,6 +360,8 @@
+         # https://wiki.ubuntu.com/MultiarchSpec
+         if not find_executable('dpkg-architecture'):
+             return
++	if os.environ.get('CROSS_COMPILE') is not None:
++	    return
+         tmpfile = os.path.join(self.build_temp, 'multiarch')
+         if not os.path.exists(self.build_temp):
+             os.makedirs(self.build_temp)
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 654c850..fb5e860 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.6"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -20,6 +20,7 @@ SRC_URI += "\
   file://remove_sqlite_rpath.patch \
   file://setup_py_skip_cross_import_check.patch \
   file://add-md5module-support.patch \
+  file://host_include_contamination.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.6.5



