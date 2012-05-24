Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfuY-0002x9-Q0
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125516"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:27 -0700
Message-Id: <8eb3e52d39147f8cb98ec95857be17db0444098e.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 16/32] python: Add patch to search for db.h in inc_dirs and remove warning
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
X-List-Received-Date: Thu, 24 May 2012 21:49:35 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

python should search for db.h in inc_dirs and not in a hardcoded path.
If db.h is found but HASHVERSION is not 2 we avoid a warning by not.
adding this module to missing variable.

[YOCTO #1937]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...search_db_h_in_inc_dirs_and_avoid_warning.patch |   40 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_and_avoid_warning.patch

diff --git a/meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_and_avoid_warning.patch b/meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_and_avoid_warning.patch
new file mode 100644
index 0000000..0c1f174
--- /dev/null
+++ b/meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_and_avoid_warning.patch
@@ -0,0 +1,40 @@
+python should search for db.h in inc_dirs and not in a hardcoded path.
+If db.h is found but HASHVERSION is not 2 we avoid a warning by not 
+adding this module to missing variable.
+
+Upstream-Status: Inappropriate [distribution]
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: Python-2.7.2/setup.py
+===================================================================
+--- Python-2.7.2.orig/setup.py	2012-04-05 22:27:22.437199989 +0300
++++ Python-2.7.2/setup.py	2012-04-05 22:26:38.000000000 +0300
+@@ -1141,12 +1141,12 @@
+         # the more recent berkeleydb's db.h file first in the include path
+         # when attempting to compile and it will fail.
+         f = "/usr/include/db.h"
+-
++        if len(inc_dirs) != 0:
++            f = os.path.join(inc_dirs[0], "db.h")
+         if sys.platform == 'darwin':
+             if is_macosx_sdk_path(f):
+                 sysroot = macosx_sdk_root()
+                 f = os.path.join(sysroot, f[1:])
+-
+         if os.path.exists(f) and not db_incs:
+             data = open(f).read()
+             m = re.search(r"#s*define\s+HASHVERSION\s+2\s*", data)
+@@ -1161,8 +1161,10 @@
+                                           libraries=libraries))
+                 else:
+                     exts.append(Extension('bsddb185', ['bsddbmodule.c']))
+-            else:
+-                missing.append('bsddb185')
++            # If a newer version is detected don't report an useless
++            # warning
++            #else:
++            #    missing.append('bsddb185')
+         else:
+             missing.append('bsddb185')
+ 
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index bfe3ee0..d25b882 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.16"
+PR = "${INC_PR}.17"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -23,6 +23,7 @@ SRC_URI += "\
   file://fix_for_using_different_libdir.patch \
   file://setuptweaks.patch \
   file://check-if-target-is-64b-not-host.patch \
+  file://search_db_h_in_inc_dirs_and_avoid_warning.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.9.5



