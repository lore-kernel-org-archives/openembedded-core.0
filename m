Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpvYe-0008UB-TC
	for openembedded-core@lists.openembedded.org;
	Sun, 07 Aug 2011 07:05:53 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Aug 2011 22:01:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,331,1309762800"; d="scan'208";a="36580327"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.173])
	by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2011 22:01:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Aug 2011 22:01:05 -0700
Message-Id: <461df79fbb655e4c6894d9a9e9ce52656b96303d.1312692935.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312692935.git.sgw@linux.intel.com>
References: <cover.1312692935.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312692935.git.sgw@linux.intel.com>
References: <cover.1312692935.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (Updated) 03/15] python-native: Fix a compiler finding issue
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
X-List-Received-Date: Sun, 07 Aug 2011 05:05:53 -0000

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



