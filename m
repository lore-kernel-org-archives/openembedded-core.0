Return-Path: <Lu.Jiang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CD30A76059
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 02:17:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7V2H9Lr021866
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 19:17:09 -0700 (PDT)
Received: from pek-ljiang0-d1.wrs.com (128.224.162.214) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 30 Aug 2018 19:17:08 -0700
From: Jiang Lu <lu.jiang@windriver.com>
To: <lu.jiang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Aug 2018 10:15:04 +0800
Message-ID: <1535681710-29461-2-git-send-email-lu.jiang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] wic:enable wic compile as individual package
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
X-List-Received-Date: Fri, 31 Aug 2018 02:17:07 -0000
Content-Type: text/plain

Enable wic compile as an individual package.

Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
---
 meta/recipes-support/wic/files/setup.py | 18 ++++++++++++++++++
 meta/recipes-support/wic/wic_0.2.0.bb   | 24 ++++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-support/wic/files/setup.py
 create mode 100644 meta/recipes-support/wic/wic_0.2.0.bb

diff --git a/meta/recipes-support/wic/files/setup.py b/meta/recipes-support/wic/files/setup.py
new file mode 100644
index 0000000..5a147f9
--- /dev/null
+++ b/meta/recipes-support/wic/files/setup.py
@@ -0,0 +1,18 @@
+#!/usr/bin/env python3
+
+import os
+from distutils.core import setup
+
+packages = [
+            "wic",
+            "wic/plugins/imager",
+            "wic/plugins/source",
+           ]
+
+setup(name = "wic",
+      version="0.2.0",
+      description="wic' is the OpenEmbedded Image Creator",
+      author="Tom Zanussi",
+      author_email="tom.zanussi@linux.intel.com",
+      packages=packages
+)
diff --git a/meta/recipes-support/wic/wic_0.2.0.bb b/meta/recipes-support/wic/wic_0.2.0.bb
new file mode 100644
index 0000000..1224768
--- /dev/null
+++ b/meta/recipes-support/wic/wic_0.2.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Wic installer script"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+RDEPENDS_${PN} += "mtools"
+
+SRC_URI = " \
+	file://wic.py \
+	file://setup.py \
+	file://wic \
+"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}:${THISDIR}/files:"
+
+S = "${WORKDIR}/"
+
+inherit setuptools3
+
+do_install_append() {
+    install -d 0755 ${D}/${bindir}
+    install -m 0755 ${S}/wic.py ${D}${bindir}/wic
+}
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


