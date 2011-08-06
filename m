Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpabN-0000Nk-CQ
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 08:43:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2011 23:38:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,327,1309762800"; d="scan'208";a="35941159"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.173])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2011 23:38:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 23:38:39 -0700
Message-Id: <698dedcca15e420163562e8baf29d535ee3a5c05.1312612601.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312612601.git.sgw@linux.intel.com>
References: <cover.1312612601.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312612601.git.sgw@linux.intel.com>
References: <cover.1312612601.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 3/9] python-native: Fix a compiler finding issue
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
X-List-Received-Date: Sat, 06 Aug 2011 06:43:19 -0000

From: Mei Lei <lei.mei@intel.com>

The CC variable sometimes add option information after compiler name, but python can't get the real compiler name if those information added.
Fix this issue by dropping the option information when finding compiler name.

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../python/python-native/unixccompiler.patch       |   20 ++++++++++++++++++++
 .../recipes-devtools/python/python-native_2.6.6.bb |    3 ++-
 2 files changed, 22 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-native/unixccompiler.patch

diff --git a/meta/recipes-devtools/python/python-native/unixccompiler.patch b/meta/recipes-devtools/python/python-native/unixccompiler.patch
new file mode 100644
index 0000000..10a9baf
--- /dev/null
+++ b/meta/recipes-devtools/python/python-native/unixccompiler.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+# The CC variable,sometimes like:"x86_64-poky-linux-gcc   -m64 --sysroot=/${TMPDIR}/sysroots/qemux86-64", contains option information. 
+# This will lead to wrong compiler name "qemux86-64" rather than "x86_64-poky-linux-gcc" when python finding the compiler name.
+
+#Signed-off-by: Mei Lei <lei.mei@intel.com>
+
+diff --git Python-2.6.6/Lib/distutils/unixccompiler.py Python-2.6.6/Lib/distutils/unixccompiler.py
+index 6d0b84d..aaf49cb 100644
+--- Python-2.6.6/Lib/distutils/unixccompiler.py
++++ Python-2.6.6/Lib/distutils/unixccompiler.py
+@@ -282,7 +282,7 @@ class UnixCCompiler(CCompiler):
+         # this time, there's no way to determine this information from
+         # the configuration data stored in the Python installation, so
+         # we use this hack.
+-        compiler = os.path.basename(sysconfig.get_config_var("CC"))
++        compiler = os.path.basename(sysconfig.get_config_var("CC").split()[0])
+         if sys.platform[:6] == "darwin":
+             # MacOSX's linker doesn't understand the -R flag at all
+             return "-L" + dir
diff --git a/meta/recipes-devtools/python/python-native_2.6.6.bb b/meta/recipes-devtools/python/python-native_2.6.6.bb
index 59ed61a..2b00d32 100644
--- a/meta/recipes-devtools/python/python-native_2.6.6.bb
+++ b/meta/recipes-devtools/python/python-native_2.6.6.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
 
@@ -12,6 +12,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
            file://11-distutils-never-modify-shebang-line.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://debug.patch \
+           file://unixccompiler.patch \
            file://nohostlibs.patch"
 S = "${WORKDIR}/Python-${PV}"
 
-- 
1.7.3.4



