Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R9J1L-0007R6-MD
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 17:59:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Sep 2011 08:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,461,1312182000"; d="scan'208";a="56990214"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.50])
	by azsmga001.ch.intel.com with ESMTP; 29 Sep 2011 08:54:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2011 08:54:04 -0700
Message-Id: <71c8312f76626dede6d6b21e9a489f61c94f323c.1317311558.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317311558.git.sgw@linux.intel.com>
References: <cover.1317311558.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317311558.git.sgw@linux.intel.com>
References: <cover.1317311558.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] python: fix sqlite RPATH issue
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
X-List-Received-Date: Thu, 29 Sep 2011 15:59:36 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../python/python/remove_sqlite_rpath.patch        |   19 +++++++++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb       |    3 ++-
 2 files changed, 21 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/remove_sqlite_rpath.patch

diff --git a/meta/recipes-devtools/python/python/remove_sqlite_rpath.patch b/meta/recipes-devtools/python/python/remove_sqlite_rpath.patch
new file mode 100644
index 0000000..4ec627e
--- /dev/null
+++ b/meta/recipes-devtools/python/python/remove_sqlite_rpath.patch
@@ -0,0 +1,19 @@
+This patch removes the RPATH setting which contains a pointer to
+the target relocated sysroot, which is incorrect.
+
+Upstream-Status: Inappropriate [Embedded Specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: Python-2.6.6/setup.py
+===================================================================
+--- Python-2.6.6.orig/setup.py	2011-09-28 14:22:57.000000000 -0700
++++ Python-2.6.6/setup.py	2011-09-28 16:11:25.147279633 -0700
+@@ -1079,7 +1079,6 @@
+                                   include_dirs=["Modules/_sqlite",
+                                                 sqlite_incdir],
+                                   library_dirs=sqlite_libdir,
+-                                  runtime_library_dirs=sqlite_libdir,
+                                   extra_link_args=sqlite_extra_link_args,
+                                   libraries=["sqlite3",]))
+         else:
diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-devtools/python/python_2.6.6.bb
index aa7ec3c..77c0ff4 100644
--- a/meta/recipes-devtools/python/python_2.6.6.bb
+++ b/meta/recipes-devtools/python/python_2.6.6.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.10"
+PR = "${INC_PR}.11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
@@ -21,6 +21,7 @@ SRC_URI = "\
   file://multilib.patch \
   file://security_issue_2254_fix.patch \
   file://cgi_py.patch \
+  file://remove_sqlite_rpath.patch \
 "
 
 SRC_URI[md5sum] = "cf4e6881bb84a7ce6089e4a307f71f14"
-- 
1.7.6



