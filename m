Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6263D6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 15:18:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 11 Dec 2015 07:18:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,414,1444719600"; d="scan'208";a="705526845"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 11 Dec 2015 07:18:10 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 05F156A4087;
	Fri, 11 Dec 2015 08:06:11 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Dec 2015 17:19:15 +0200
Message-Id: <1449847155-18845-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] libical: Fix parallel build failure
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
X-List-Received-Date: Fri, 11 Dec 2015 15:18:56 -0000

Parallel builds occasionally fail because generated headers are only
partially built when they're being used.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../Depend-on-headers-to-fix-parallel-build.patch  | 46 ++++++++++++++++++++++
 meta/recipes-support/libical/libical_1.0.1.bb      |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch

diff --git a/meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch b/meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch
new file mode 100644
index 0000000..4d65c81
--- /dev/null
+++ b/meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch
@@ -0,0 +1,46 @@
+From 56a10a14c0a544df99c97ce279801ddf40b0df52 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Mon, 14 Sep 2015 13:35:42 +0300
+Subject: [PATCH] WIP: Depend on headers to fix parallel build
+
+Parallel builds occasionally fail because generated headers are only
+half built when they're being used.
+
+This fix is extracted
+from https://github.com/libical/libical/commit/dcc40c7ae2d337a0d83c077bf9d8f283499c6717
+
+Upstream-Status: Backport
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+---
+ examples/CMakeLists.txt    | 1 +
+ src/libical/CMakeLists.txt | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
+index 3379ffd..514956b 100644
+--- a/examples/CMakeLists.txt
++++ b/examples/CMakeLists.txt
+@@ -16,6 +16,7 @@ set(doesnothing_SRCS
+ )
+ 
+ add_executable(doesnothing ${doesnothing_SRCS})
++add_dependencies(doesnothing ical icalss icalvcal)
+ 
+ target_link_libraries(doesnothing ical icalss icalvcal ical icalss icalvcal)
+ 
+diff --git a/src/libical/CMakeLists.txt b/src/libical/CMakeLists.txt
+index 6774352..468a7d9 100644
+--- a/src/libical/CMakeLists.txt
++++ b/src/libical/CMakeLists.txt
+@@ -261,6 +261,7 @@ add_library(ical ${LIBRARY_TYPE} ${ical_LIB_SRCS})
+ add_library(ical-static STATIC ${ical_LIB_SRCS})
+ 
+ add_dependencies(ical ical-header)
++add_dependencies(ical-static ical-header)
+ 
+ target_link_libraries(ical ${CMAKE_THREAD_LIBS_INIT})
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/libical/libical_1.0.1.bb b/meta/recipes-support/libical/libical_1.0.1.bb
index 0dcee46..e18b803 100644
--- a/meta/recipes-support/libical/libical_1.0.1.bb
+++ b/meta/recipes-support/libical/libical_1.0.1.bb
@@ -9,6 +9,7 @@ SECTION = "libs"
 SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz \
            file://Remove-cmake-check-for-Perl.patch \
            file://Fix-x32-ABI-build.patch \
+           file://Depend-on-headers-to-fix-parallel-build.patch \
            "
 SRC_URI[md5sum] = "af91db06b22559f863869c5a382ad08a"
 SRC_URI[sha256sum] = "7d5f613454ec6c7d1bcfb441c919215be53292aa15cd1cb14249d1413d6c610c"
-- 
2.4.0


