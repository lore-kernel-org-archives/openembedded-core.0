Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0F460289
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 20:02:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Jul 2013 12:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,647,1367996400"; d="scan'208";a="368667731"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.73])
	by orsmga002.jf.intel.com with ESMTP; 11 Jul 2013 13:02:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jul 2013 13:02:18 -0700
Message-Id: <1373572938-1891-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] boost: backport glibc patch for new eglibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jul 2013 20:02:19 -0000

The newer eglibc removed a macro that was being checked by the boost
code, this patch replaces that.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/boost/boost_1.54.0.bb   |    1 +
 meta/recipes-support/boost/files/glibc.patch |   26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-support/boost/files/glibc.patch

diff --git a/meta/recipes-support/boost/boost_1.54.0.bb b/meta/recipes-support/boost/boost_1.54.0.bb
index 68f483c..3cf88fa 100644
--- a/meta/recipes-support/boost/boost_1.54.0.bb
+++ b/meta/recipes-support/boost/boost_1.54.0.bb
@@ -2,4 +2,5 @@ include boost-${PV}.inc
 include boost.inc
 
 SRC_URI += "file://arm-intrinsics.patch \
+            file://glibc.patch \
            "
diff --git a/meta/recipes-support/boost/files/glibc.patch b/meta/recipes-support/boost/files/glibc.patch
new file mode 100644
index 0000000..c33ea64
--- /dev/null
+++ b/meta/recipes-support/boost/files/glibc.patch
@@ -0,0 +1,26 @@
+------------------------------------------------------------------------
+r84950 | johnmaddock | 2013-07-04 02:13:23 -0700 (Thu, 04 Jul 2013) | 2 lines
+
+Patch for recent versions of glibc which always assume int64_t support.
+Fixes #8731.
+
+Upstream-Status: Backport
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: boost_1_54_0/boost/cstdint.hpp
+===================================================================
+--- boost_1_54_0.orig/boost/cstdint.hpp
++++ boost_1_54_0/boost/cstdint.hpp
+@@ -41,7 +41,10 @@
+ // so we disable use of stdint.h when GLIBC does not define __GLIBC_HAVE_LONG_LONG.
+ // See https://svn.boost.org/trac/boost/ticket/3548 and http://sources.redhat.com/bugzilla/show_bug.cgi?id=10990
+ //
+-#if defined(BOOST_HAS_STDINT_H) && (!defined(__GLIBC__) || defined(__GLIBC_HAVE_LONG_LONG))
++#if defined(BOOST_HAS_STDINT_H)					\
++  && (!defined(__GLIBC__)					\
++      || defined(__GLIBC_HAVE_LONG_LONG)			\
++      || (defined(__GLIBC__) && ((__GLIBC__ > 2) || ((__GLIBC__ == 2) && (__GLIBC_MINOR__ >= 17)))))
+ 
+ // The following #include is an implementation artifact; not part of interface.
+ # ifdef __hpux
-- 
1.7.10.4


