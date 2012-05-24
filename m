Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfua-0002yu-4b
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125515"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:26 -0700
Message-Id: <22ae3959f40845ebcc00413ccf733539472a1a81.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 15/32] python: Add patch for 64bit platform
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
X-List-Received-Date: Thu, 24 May 2012 21:49:37 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

This patch was added for 64bit host machines. In the compile process python
is checking if platform is a 64bit platform using sys.maxint which is the host's
value. The patch fixes this issue so that python would check if TARGET machine
is 64bit not the HOST machine. In this way will have "dl" and "imageop" modules
built if HOST machine is 64bit but the target machine is 32bit.

[YOCTO #1937]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/check-if-target-is-64b-not-host.patch   |   57 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python/check-if-target-is-64b-not-host.patch

diff --git a/meta/recipes-devtools/python/python/check-if-target-is-64b-not-host.patch b/meta/recipes-devtools/python/python/check-if-target-is-64b-not-host.patch
new file mode 100644
index 0000000..2b62db3
--- /dev/null
+++ b/meta/recipes-devtools/python/python/check-if-target-is-64b-not-host.patch
@@ -0,0 +1,57 @@
+Author: Andrei Gherzan <andrei@gherzan.ro>
+Date:   Sun Mar 25 02:02:27 2012 +0200
+
+This patch was added for 64bit host machines. In the compile process python
+is checking if platform is a 64bit platform using sys.maxint which is the host's
+value. The patch fixes this issue so that python would check if TARGET machine
+is 64bit not the HOST machine. In this way will have "dl" and "imageop" modules
+built if HOST machine is 64bit but the target machine is 32bit.
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Upstream-Status: Pending
+
+Index: Python-2.7.2/setup.py
+===================================================================
+--- Python-2.7.2.orig/setup.py	2012-03-25 01:10:41.540163187 +0200
++++ Python-2.7.2/setup.py	2012-03-25 01:26:06.092539990 +0200
+@@ -23,6 +23,21 @@
+ # This global variable is used to hold the list of modules to be disabled.
+ disabled_module_list = []
+ 
++def target_is_64bit_platform ():
++    """
++    In case of cross-compile, some modules are not build as setup checks if HOST
++    is 64bit and not TARGET.
++    As python was built for TARGET we can check this in pyconfig.h in this way:
++	Sizeof LONG on a 32 bit platform is 4 bytes
++	Sizeof LONG on a 64 bit platform is 8 bytes
++    """
++    pyconf = open("pyconfig.h").read()
++    aux = re.search(r"#s*define\s+SIZEOF_LONG\s+8\s*", pyconf)
++    if aux is not None:
++	return True
++    else:
++	return False
++
+ def add_dir_to_list(dirlist, dir):
+     """Add the directory 'dir' to the list 'dirlist' (at the front) if
+     1) 'dir' is not already in 'dirlist'
+@@ -628,7 +643,7 @@
+         exts.append( Extension('audioop', ['audioop.c']) )
+ 
+         # Disabled on 64-bit platforms
+-        if sys.maxint != 9223372036854775807L:
++        if not target_is_64bit_platform():
+             # Operations on images
+             exts.append( Extension('imageop', ['imageop.c']) )
+         else:
+@@ -1418,7 +1433,7 @@
+                 missing.append('_codecs_%s' % loc)
+ 
+         # Dynamic loading module
+-        if sys.maxint == 0x7fffffff:
++        if not target_is_64bit_platform():
+             # This requires sizeof(int) == sizeof(long) == sizeof(char*)
+             dl_inc = find_file('dlfcn.h', [], inc_dirs)
+             if (dl_inc is not None) and (platform not in ['atheos']):
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 9ba561b..bfe3ee0 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.15"
+PR = "${INC_PR}.16"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -22,6 +22,7 @@ SRC_URI += "\
   file://sys_platform_is_now_always_linux2.patch \
   file://fix_for_using_different_libdir.patch \
   file://setuptweaks.patch \
+  file://check-if-target-is-64b-not-host.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.9.5



