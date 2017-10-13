Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 17F95606CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 00:42:14 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Oct 2017 17:42:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,368,1503385200"; d="scan'208";a="162107312"
Received: from wrath.jf.intel.com ([10.54.70.9])
	by fmsmga005.fm.intel.com with ESMTP; 12 Oct 2017 17:42:07 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Oct 2017 17:41:47 -0700
Message-Id: <20171013004147.28663-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH v2] powertop: update to v2.9
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
X-List-Received-Date: Fri, 13 Oct 2017 00:42:15 -0000

* Upstream filename added "v" before version:
  - Add UPSTREAM_CHECK_REGEX
  - Update SRC_URI to include the "v"
  - Point ${S} to proper directory

* Patch for required headers no longer needed in current upstream
* Tested on qemux86-64 core-image-full-cmdline image with multilib

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>

---

Changes in v2: use ${BPN} instead of ${PN} so multilib does not fail
---
 ...0001-include-rquired-headers-for-typedefs.patch | 47 ----------------------
 .../powertop/{powertop_2.8.bb => powertop_2.9.bb}  | 10 +++--
 2 files changed, 6 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch
 rename meta/recipes-kernel/powertop/{powertop_2.8.bb => powertop_2.9.bb} (77%)

diff --git a/meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch b/meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch
deleted file mode 100644
index 0fd63106d6..0000000000
--- a/meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0856d8145d187a7e5a49625247abe43a13f95acc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 15 Sep 2015 19:36:28 +0000
-Subject: [PATCH] include rquired headers for typedefs
-
-timeval struct needs to include sys/time.h and sprintf() usage requires
-to include stdio.h headers from system
-
-Fixes
-src/perf/perf_bundle.cpp:141:2: error: use of undeclared identifier 'sprintf'; did you mean 'vswprintf'?
-src/devices/devfreq.h:35:18: error: field has incomplete type 'struct timeval'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/devices/devfreq.h    | 1 +
- src/perf/perf_bundle.cpp | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/devices/devfreq.h b/src/devices/devfreq.h
-index 16a60fb..4bede7c 100644
---- a/src/devices/devfreq.h
-+++ b/src/devices/devfreq.h
-@@ -25,6 +25,7 @@
- #ifndef _INCLUDE_GUARD_DEVFREQ_H
- #define _INCLUDE_GUARD_DEVFREQ_H
- 
-+#include <sys/time.h>
- #include "device.h"
- #include "../parameters/parameters.h"
- 
-diff --git a/src/perf/perf_bundle.cpp b/src/perf/perf_bundle.cpp
-index cf1ae11..232f894 100644
---- a/src/perf/perf_bundle.cpp
-+++ b/src/perf/perf_bundle.cpp
-@@ -27,6 +27,7 @@
- #include <algorithm>
- #include <string.h>
- #include <stdint.h>
-+#include <stdio.h>
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <fcntl.h>
--- 
-2.5.2
-
diff --git a/meta/recipes-kernel/powertop/powertop_2.8.bb b/meta/recipes-kernel/powertop/powertop_2.9.bb
similarity index 77%
rename from meta/recipes-kernel/powertop/powertop_2.8.bb
rename to meta/recipes-kernel/powertop/powertop_2.9.bb
index 4d7a3e7bd0..4fe5447a03 100644
--- a/meta/recipes-kernel/powertop/powertop_2.8.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.9.bb
@@ -6,17 +6,19 @@ DEPENDS = "ncurses libnl pciutils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-${PV}.tar.gz \
-           file://0001-include-rquired-headers-for-typedefs.patch \
+SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-v${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "c55fedb69203e480801b18bd7b886241"
-SRC_URI[sha256sum] = "a87b563f73106babfa3e74dcf92f252938c061e309ace20a361358bbfa579c5a"
+SRC_URI[md5sum] = "583518c5c4434c6e9b9c58c3920950b6"
+SRC_URI[sha256sum] = "aa7fb7d8e9a00f05e7d8a7a2866d85929741e0d03a5bf40cab22d2021c959250"
 
 UPSTREAM_CHECK_URI = "https://01.org/powertop/downloads"
+UPSTREAM_CHECK_REGEX = "powertop-[v]?(?P<pver>\d+(\.\d+)+)\.tar"
 
 inherit autotools gettext pkgconfig
 
+S = "${WORKDIR}/${BPN}-v${PV}"
+
 # we do not want libncursesw if we can
 do_configure_prepend() {
     # configure.ac checks for delwin() in "ncursesw ncurses" so let's drop first one
-- 
2.13.5


