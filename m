Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpMO3-0000dS-7W
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:32:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2011 08:28:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,323,1309762800"; d="scan'208";a="34926368"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2011 08:28:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 08:27:54 -0700
Message-Id: <dfcd152043b9fcfc21ddd57d82cf966b0a60179e.1312557813.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/14] coreutils: Fix build on uclibc
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
X-List-Received-Date: Fri, 05 Aug 2011 15:32:35 -0000

From: Khem Raj <raj.khem@gmail.com>

coreutils has getloadavg.m4 of its own. So we need
to make sure that we remove the portions which look
into hardcoded /usr/local/lib paths. These tests are
only for AIX so we dont lose much

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../remove-usr-local-lib-from-m4.patch             |   31 ++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.12.bb      |    6 ++-
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.12/remove-usr-local-lib-from-m4.patch

diff --git a/meta/recipes-core/coreutils/coreutils-8.12/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.12/remove-usr-local-lib-from-m4.patch
new file mode 100644
index 0000000..aac097a
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.12/remove-usr-local-lib-from-m4.patch
@@ -0,0 +1,31 @@
+We have problem using hardcoded directories like /usr/local here
+which will be checked for cross builds. This is a special case which
+is valid for AIX only. We do not have AIX as one of our supported
+build host or target. Therefore we get rid of the hardcoded paths
+and make life easier for cross compilation process.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [Upstream does care for AIX while we may not]
+
+Index: coreutils-8.12/m4/getloadavg.m4
+===================================================================
+--- coreutils-8.12.orig/m4/getloadavg.m4	2011-08-03 14:03:59.982197767 -0700
++++ coreutils-8.12/m4/getloadavg.m4	2011-08-03 14:04:20.402197763 -0700
+@@ -44,16 +44,6 @@ AC_CHECK_FUNC([getloadavg], [],
+        [LIBS="-lutil $LIBS" gl_have_func=yes])
+    fi
+ 
+-   if test $gl_have_func = no; then
+-     # There is a commonly available library for RS/6000 AIX.
+-     # Since it is not a standard part of AIX, it might be installed locally.
+-     gl_getloadavg_LIBS=$LIBS
+-     LIBS="-L/usr/local/lib $LIBS"
+-     AC_CHECK_LIB([getloadavg], [getloadavg],
+-                  [LIBS="-lgetloadavg $LIBS" gl_have_func=yes],
+-                  [LIBS=$gl_getloadavg_LIBS])
+-   fi
+-
+    # Set up the replacement function if necessary.
+    if test $gl_have_func = no; then
+      AC_LIBOBJ([getloadavg])
diff --git a/meta/recipes-core/coreutils/coreutils_8.12.bb b/meta/recipes-core/coreutils/coreutils_8.12.bb
index 00746b9..0004ce7 100644
--- a/meta/recipes-core/coreutils/coreutils_8.12.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.12.bb
@@ -7,13 +7,15 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
-PR = "r2"
+PR = "r3"
 DEPENDS = "gmp"
 DEPENDS_virtclass-native = ""
 
 inherit autotools gettext
 
-SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.gz \
+           file://remove-usr-local-lib-from-m4.patch \
+          "
 
 SRC_URI[md5sum] = "fce7999953a67243d00d75cc86dbcaa6"
 SRC_URI[sha256sum] = "9e233a62c98a3378a7b0483d2ae3d662dbaf6cd3917d3830d3514665e12a85c8"
-- 
1.7.3.4



