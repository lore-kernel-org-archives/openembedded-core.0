Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVJ8F-0005pP-LI
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 09:33:40 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 00:26:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,590,1315206000"; d="scan'208";a="96419448"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 00:26:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 00:26:36 -0800
Message-Id: <9b13b9024d24953dedb35f62d3d8b06a29036992.1322554983.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/23] python-native: Fix gcc compiler detecting logic
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
X-List-Received-Date: Tue, 29 Nov 2011 08:33:40 -0000

From: Khem Raj <raj.khem@gmail.com>

We have a patch unixccompiler.patch where we try to throw away
everything except first element of CC string but this does not
work if gcc is prepended with something e.g. CC="ccache gcc"
then the logic fails and it ends up in some modules failing on
you silently (_sqlite3) in my case.
The fix here is to drop basename so we keep the whole
string as it is and then the detection function searches
for gcc string in the whole CC. This works in both cases
one the original intent of the patch and the second described
above. One place where it will fail is if someone has non-gcc
compiler installed in some subdir which has gcc in it e.g.
/usr/gcc/fakecc but for OE this should never happen. Ideally
the the detection logic should have tried to execute gcc
and then parsed --version output or something.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python-native/unixccompiler.patch       |   22 ++++++++++----------
 .../recipes-devtools/python/python-native_2.7.2.bb |    2 +-
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native/unixccompiler.patch b/meta/recipes-devtools/python/python-native/unixccompiler.patch
index 10a9baf..4502829 100644
--- a/meta/recipes-devtools/python/python-native/unixccompiler.patch
+++ b/meta/recipes-devtools/python/python-native/unixccompiler.patch
@@ -1,20 +1,20 @@
-Upstream-Status: Inappropriate [embedded specific]
+Upstream-Status: Pending
 
-# The CC variable,sometimes like:"x86_64-poky-linux-gcc   -m64 --sysroot=/${TMPDIR}/sysroots/qemux86-64", contains option information. 
-# This will lead to wrong compiler name "qemux86-64" rather than "x86_64-poky-linux-gcc" when python finding the compiler name.
+The CC variable,sometimes like:"x86_64-poky-linux-gcc   -m64 --sysroot=/${TMPDIR}/sysroots/qemux86-64", contains option information. 
+This will lead to wrong compiler name "qemux86-64" rather than "x86_64-poky-linux-gcc" when python finding the compiler name.
 
-#Signed-off-by: Mei Lei <lei.mei@intel.com>
-
-diff --git Python-2.6.6/Lib/distutils/unixccompiler.py Python-2.6.6/Lib/distutils/unixccompiler.py
-index 6d0b84d..aaf49cb 100644
---- Python-2.6.6/Lib/distutils/unixccompiler.py
-+++ Python-2.6.6/Lib/distutils/unixccompiler.py
-@@ -282,7 +282,7 @@ class UnixCCompiler(CCompiler):
+Signed-off-by: Mei Lei <lei.mei@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: Python-2.7.2/Lib/distutils/unixccompiler.py
+===================================================================
+--- Python-2.7.2.orig/Lib/distutils/unixccompiler.py	2011-11-24 13:51:10.539998722 -0800
++++ Python-2.7.2/Lib/distutils/unixccompiler.py	2011-11-24 15:54:36.872137766 -0800
+@@ -282,7 +282,7 @@
          # this time, there's no way to determine this information from
          # the configuration data stored in the Python installation, so
          # we use this hack.
 -        compiler = os.path.basename(sysconfig.get_config_var("CC"))
-+        compiler = os.path.basename(sysconfig.get_config_var("CC").split()[0])
++        compiler = sysconfig.get_config_var("CC")
          if sys.platform[:6] == "darwin":
              # MacOSX's linker doesn't understand the -R flag at all
              return "-L" + dir
diff --git a/meta/recipes-devtools/python/python-native_2.7.2.bb b/meta/recipes-devtools/python/python-native_2.7.2.bb
index 6b90d5b..d036eca 100644
--- a/meta/recipes-devtools/python/python-native_2.7.2.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://04-default-is-optimized.patch \
            file://05-enable-ctypes-cross-build.patch \
-- 
1.7.6.4



