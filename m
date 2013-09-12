Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04DD56BCB6
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 17:20:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8CHK3m4005435
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Sep 2013 10:20:03 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 12 Sep 2013 10:20:04 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 12 Sep 2013 12:19:44 -0500
Message-ID: <1379006387-20186-3-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
References: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 2/5] cdrtools-native: Update from 3.00 to 3.01a17
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
X-List-Received-Date: Thu, 12 Sep 2013 17:20:02 -0000
Content-Type: text/plain

The update is needed to support generation of EFI boot images that
work with optical media.  Specifically the "-eltorito-platform efi"
capability for mkisofs is needed.

[YOCTO #4100]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 .../cdrtools/cdrtools-native_3.00.bb               |   30 -------------------
 .../cdrtools/cdrtools-native_3.01a17.bb            |   31 ++++++++++++++++++++
 2 files changed, 31 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb
deleted file mode 100644
index 7e4c381..0000000
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-# cdrtools-native OE build file
-# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-SUMMARY = "A set of tools for CD recording, including cdrecord"
-DESCRIPTION = "A set of tools for CD recording, including cdrecord"
-HOMEPAGE = "http://cdrecord.berlios.de/private/cdrecord.html"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8d16123ffd39e649a5e4a6bc1de60e6d"
-PR = "r0"
-
-SRC_URI = "ftp://ftp.berlios.de/pub/cdrecord/cdrtools-${PV}.tar.bz2 \
-           file://no_usr_src.patch"
-
-SRC_URI[md5sum] = "f9fbab08fbd458b0d2312976d8c5f558"
-SRC_URI[sha256sum] = "7f9cb64820055573b880f77b2f16662a512518336ba95ab49228a1617973423d"
-
-inherit native
-
-STAGE_TEMP = "${WORKDIR}/image-temp"
-
-FILESPATH = "${FILE_DIRNAME}/cdrtools-native/"
-
-do_install() {
-	install -d ${STAGE_TEMP}
-	make install INS_BASE=${STAGE_TEMP}
-
-	install -d ${D}${bindir}/
-	install ${STAGE_TEMP}/bin/* ${D}${bindir}/
-}
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
new file mode 100644
index 0000000..4a7a160
--- /dev/null
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
@@ -0,0 +1,31 @@
+# cdrtools-native OE build file
+# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+SUMMARY = "A set of tools for CD recording, including cdrecord"
+DESCRIPTION = "A set of tools for CD recording, including cdrecord"
+HOMEPAGE = "http://cdrecord.berlios.de/private/cdrecord.html"
+SECTION = "console/utils"
+LICENSE = "GPLv2 & CDDL-1.0 & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
+PR = "r0"
+
+SRC_URI = "ftp://ftp.berlios.de/pub/cdrecord/alpha/cdrtools-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "4cef9db0cf15a770c52d65b00bbee2db"
+SRC_URI[sha256sum] = "3d613965b213ad83e4be0ba2535e784901839ea4d11a20a2beb6765f0eb76dfa"
+
+S = "${WORKDIR}/cdrtools-3.01"
+
+inherit native
+
+STAGE_TEMP = "${WORKDIR}/image-temp"
+
+FILESPATH = "${FILE_DIRNAME}/cdrtools-native/"
+
+do_install() {
+	install -d ${STAGE_TEMP}
+	make install INS_BASE=${STAGE_TEMP}
+
+	install -d ${D}${bindir}/
+	install ${STAGE_TEMP}/bin/* ${D}${bindir}/
+}
-- 
1.7.9.5


