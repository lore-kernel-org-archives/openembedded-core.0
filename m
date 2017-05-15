Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD9E71CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 11:57:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 04:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,344,1491289200"; d="scan'208";a="968514912"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.60])
	by orsmga003.jf.intel.com with ESMTP; 15 May 2017 04:57:30 -0700
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 14:54:32 +0300
Message-Id: <20170515115432.27466-1-dmitry.rozhkov@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] boost: backport a regression fix for forgotten header
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
X-List-Received-Date: Mon, 15 May 2017 11:57:32 -0000

The v1.64 release has broken array serialization code with issues
reported in

https://svn.boost.org/trac/boost/ticket/12516
https://github.com/bmwcarit/meta-ros/issues/505

Backport the fix from boost::serialization's master.

Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
---
 ...or-which-appeared-when-compiling-non-c-co.patch | 28 ++++++++++++++++++++++
 meta/recipes-support/boost/boost_1.64.0.bb         |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-correct-error-which-appeared-when-compiling-non-c-co.patch

diff --git a/meta/recipes-support/boost/boost/0001-correct-error-which-appeared-when-compiling-non-c-co.patch b/meta/recipes-support/boost/boost/0001-correct-error-which-appeared-when-compiling-non-c-co.patch
new file mode 100644
index 0000000..2598d2b
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-correct-error-which-appeared-when-compiling-non-c-co.patch
@@ -0,0 +1,28 @@
+From 02fa5cee1b8d0321787113e2dc10b162c657f333 Mon Sep 17 00:00:00 2001
+From: Robert Ramey <ramey@rrsd.com>
+Date: Wed, 1 Feb 2017 16:43:59 -0800
+Subject: [PATCH] correct error which appeared when compiling non c++ compliant
+ code for arrays
+
+Upstream-Status: Backported [expected to be released in v1.65]
+
+---
+ boost/serialization/array.hpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/boost/serialization/array.hpp b/boost/serialization/array.hpp
+index 61708b3..612d1a6 100644
+--- a/boost/serialization/array.hpp
++++ b/boost/serialization/array.hpp
+@@ -23,6 +23,8 @@ namespace std{
+ } // namespace std
+ #endif
+ 
++#include <boost/serialization/array_wrapper.hpp>
++
+ #ifndef BOOST_NO_CXX11_HDR_ARRAY
+ 
+ #include <array>
+-- 
+2.9.3
+
diff --git a/meta/recipes-support/boost/boost_1.64.0.bb b/meta/recipes-support/boost/boost_1.64.0.bb
index 119eb0a..d1c20e1 100644
--- a/meta/recipes-support/boost/boost_1.64.0.bb
+++ b/meta/recipes-support/boost/boost_1.64.0.bb
@@ -9,4 +9,5 @@ SRC_URI += "\
     file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
     file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
     file://0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch \
+    file://0001-correct-error-which-appeared-when-compiling-non-c-co.patch \
 "
-- 
2.9.3


