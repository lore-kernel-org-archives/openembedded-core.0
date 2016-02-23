Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8057724B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 10:01:43 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 23 Feb 2016 02:01:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,488,1449561600"; d="scan'208";a="53080866"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 23 Feb 2016 02:01:26 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 707716A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 02:49:15 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Feb 2016 12:05:02 +0200
Message-Id: <1456221902-1753-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] libdrm: fix build with uclibc
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
X-List-Received-Date: Tue, 23 Feb 2016 10:01:44 -0000

Fix 'O_CLOEXEC' undeclared error with uclibc

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../drm/libdrm/fix_O_CLOEXEC_undeclared.patch      | 24 ++++++++++++++++++++++
 meta/recipes-graphics/drm/libdrm_2.4.66.bb         |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch

diff --git a/meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch b/meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch
new file mode 100644
index 0000000..286e548
--- /dev/null
+++ b/meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch
@@ -0,0 +1,24 @@
+drmdevice.c: define _GNU_SOURCE
+
+Include config.h to fix this build error with uclibc:
+
+libdrm-2.4.66/tests/drmdevice.c: In function 'main':
+libdrm-2.4.66/tests/drmdevice.c:96:60: error:
+'O_CLOEXEC' undeclared (first use in this function)
+fd = open(devices[i]->nodes[j],O_RDONLY | O_CLOEXEC, 0);
+
+Upstream-Status: Pending
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+diff -Naur libdrm-2.4.66-orig/tests/drmdevice.c libdrm-2.4.66/tests/drmdevice.c
+--- libdrm-2.4.66-orig/tests/drmdevice.c	2016-02-23 11:34:02.054904502 +0200
++++ libdrm-2.4.66/tests/drmdevice.c	2016-02-23 11:35:34.371750383 +0200
+@@ -21,6 +21,7 @@
+  *
+  */
+ 
++#include <config.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <sys/stat.h>
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.66.bb b/meta/recipes-graphics/drm/libdrm_2.4.66.bb
index 3280920..79cd94a 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.66.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.66.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://installtests.patch \
            file://0001-tests-kms-steal-crtc-Include-sys-select.h.patch \
            file://detect.patch \
+           file://fix_O_CLOEXEC_undeclared.patch \
           "
 
 SRC_URI[md5sum] = "c6809c48538d6e5999588832045ff014"
-- 
2.4.0


