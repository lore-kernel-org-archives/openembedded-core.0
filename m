Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpMO3-0000dV-2F
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:32:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2011 08:28:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,323,1309762800"; d="scan'208";a="34926362"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2011 08:28:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 08:27:53 -0700
Message-Id: <6996bce61f65251c7a47a3c3bce2d609ebfe2872.1312557813.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/14] autoconf: Remove code checking for hardcoded /usr/local
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

This code is only relevant for AIX and causes
problems with OE QA sniffer which detects -L/usr/local/lib
on linker commandline during cross compile and rightly barfs

This only happens when getloadavg() is not found in libc
so we do not reach that code with eglibc but only with uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../autoconf/remove-usr-local-lib-from-m4.patch    |   29 ++++++++++++++++++++
 meta/recipes-devtools/autoconf/autoconf_2.68.bb    |    3 +-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch b/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch
new file mode 100644
index 0000000..55d2e2f
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch
@@ -0,0 +1,29 @@
+We have problem using hardcoded directories like /usr/local here
+which will be checked for cross builds. This is a special case which
+is valid for AIX only. We do not have AIX as one of our supported
+build host or target. Therefore we get rid of the hardcoded paths
+and make life easier for cross compilation process.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [Upstream does care for AIX while we may not]
+Index: autoconf-2.68/lib/autoconf/functions.m4
+===================================================================
+--- autoconf-2.68.orig/lib/autoconf/functions.m4	2010-09-22 14:52:19.000000000 -0700
++++ autoconf-2.68/lib/autoconf/functions.m4	2011-08-03 11:57:05.822199513 -0700
+@@ -749,15 +749,6 @@ if test $ac_have_func = no; then
+     [LIBS="-lutil $LIBS" ac_have_func=yes ac_cv_func_getloadavg_setgid=yes])
+ fi
+ 
+-if test $ac_have_func = no; then
+-  # There is a commonly available library for RS/6000 AIX.
+-  # Since it is not a standard part of AIX, it might be installed locally.
+-  ac_getloadavg_LIBS=$LIBS
+-  LIBS="-L/usr/local/lib $LIBS"
+-  AC_CHECK_LIB(getloadavg, getloadavg,
+-	       [LIBS="-lgetloadavg $LIBS"], [LIBS=$ac_getloadavg_LIBS])
+-fi
+-
+ # Make sure it is really in the library, if we think we found it,
+ # otherwise set up the replacement function.
+ AC_CHECK_FUNCS(getloadavg, [],
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
index 3b196a6..c6209a3 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
@@ -1,6 +1,6 @@
 require autoconf.inc
 
-PR = "r1"
+PR = "r2"
 
 PARALLEL_MAKE = ""
 
@@ -16,6 +16,7 @@ SRC_URI += "file://autoreconf-include.patch \
 	    file://autoheader-nonfatal-warnings.patch \
 	    ${@['file://path_prog_fixes.patch', ''][bb.data.inherits_class('native', d)]} \
             file://config_site.patch \
+            file://remove-usr-local-lib-from-m4.patch \
            "
 
 SRC_URI[md5sum] = "864d785215aa60d627c91fcb21b05b07"
-- 
1.7.3.4



