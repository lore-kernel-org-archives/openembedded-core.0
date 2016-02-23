Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 513C07718C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 09:09:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 23 Feb 2016 01:09:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,488,1449561600"; d="scan'208";a="919139006"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 23 Feb 2016 01:09:03 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id E256B6A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 01:56:49 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Feb 2016 11:12:36 +0200
Message-Id: <1456218756-22996-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] libdrm: fix build with uclibc
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
X-List-Received-Date: Tue, 23 Feb 2016 09:09:04 -0000

Fix 'O_CLOEXEC' undeclared error with uclibc

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../drm/libdrm/fix_O_CLOEXEC_undeclared.patch      | 26 ++++++++++++++++++++++
 meta/recipes-graphics/drm/libdrm_2.4.66.bb         |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch

diff --git a/meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch b/meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch
new file mode 100644
index 0000000..8d1b13b
--- /dev/null
+++ b/meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch
@@ -0,0 +1,26 @@
+drmdevice.c: define _GNU_SOURCE
+
+Define _GNU_SOURCE to fix this build error with uclibc:
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
+--- libdrm-2.4.66-orig/tests/drmdevice.c	2016-02-22 18:20:35.623091574 +0200
++++ libdrm-2.4.66/tests/drmdevice.c	2016-02-22 18:21:37.281320740 +0200
+@@ -21,6 +21,9 @@
+  *
+  */
+ 
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE
++#endif
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


