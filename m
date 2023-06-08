Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2F3C7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 17:18:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.941.1686244684862250667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 10:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Q//klaLC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5523cbc9db=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 358HFXtb004004
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Jun 2023 10:18:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=M74x1/zTn13xsvn9CQc3xkSELl5sysKPL+ymAJM4w4w=;
 b=Q//klaLCMYzT0YfixgQqAHwSlvjsakd53twa120B1EIbZ6qU8p0HBWewLV4jZ7M53CD3
 a6Vu0s5nolxIXGEwUUYvSoSQ0OaucRGZrdlRqOXDTsUr7ShY7ppSS1Bjdf3nN3ccGl1V
 XHGOAe2lW0RviykNQv0x88evJBjTzWTTZ+qh5cBH7F+WYsBgemZ8P7SRZg+nVkq7B49R
 FHqQG55WBPKOD9I9zcwWOBeP/b7RJxAH6L64g/pEMMCrH24qU5nBDZ2zoQRO6VTHIFBQ
 oDwgRwWJBePiFFmkr3taF7+W7T9WoLDWXd72f2pUur8HhzbR6clnJTWOjCvb9qCYIkY8 xg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2av79wb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 10:18:03 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 10:18:03 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 10:18:03 -0700
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] icu: increase command buffer size
Date: Thu, 8 Jun 2023 10:18:02 -0700
Message-ID: <20230608171803.3728701-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7FGjx5wcNQEBcXxbtYgGXCVpt8icq2Ca
X-Proofpoint-GUID: 7FGjx5wcNQEBcXxbtYgGXCVpt8icq2Ca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_12,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=725
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306080152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 17:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182517

From: Joe Slater <joe.slater@windriver.com>

Make cmd in pkg_installLibrary() LARGE_BUFFER_SIZE to avoid
pathname truncation if the install path is longer than about
150 characters.  For default compilation, the U_ASSERT does
not detect buffer overflow but this is not addressed here.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 ...pkgdata-increase-command-buffer-size.patch | 43 +++++++++++++++++++
 meta/recipes-support/icu/icu_72-1.bb          |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch

diff --git a/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch b/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch
new file mode 100644
index 0000000000..ea68e4be9f
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch
@@ -0,0 +1,43 @@
+From ab6b1acdeed76899f8227c38ab7e7675c7673ff1 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Thu, 5 Aug 2021 09:23:48 -0700
+Subject: [PATCH 1/1] pkgdata: increase command buffer size
+
+Make cmd LARGE_BUFFER_SIZE to avoid pathname truncation
+when install paths are longer than about 150 characters.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ source/tools/pkgdata/pkgdata.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/source/tools/pkgdata/pkgdata.cpp b/source/tools/pkgdata/pkgdata.cpp
+index 5ab682e..d4b70ef 100644
+--- a/tools/pkgdata/pkgdata.cpp
++++ b/tools/pkgdata/pkgdata.cpp
+@@ -1131,17 +1131,17 @@ normal_symlink_mode:
+ 
+ static int32_t pkg_installLibrary(const char *installDir, const char *targetDir, UBool noVersion) {
+     int32_t result = 0;
+-    char cmd[SMALL_BUFFER_MAX_SIZE];
++    char cmd[LARGE_BUFFER_MAX_SIZE];
+ 
+     auto ret = snprintf(cmd,
+-            SMALL_BUFFER_MAX_SIZE,
++            LARGE_BUFFER_MAX_SIZE,
+             "cd %s && %s %s %s%s%s",
+             targetDir,
+             pkgDataFlags[INSTALL_CMD],
+             libFileNames[LIB_FILE_VERSION],
+             installDir, PKGDATA_FILE_SEP_STRING, libFileNames[LIB_FILE_VERSION]);
+     (void)ret;
+-    U_ASSERT(0 <= ret && ret < SMALL_BUFFER_MAX_SIZE);
++    U_ASSERT(0 <= ret && ret < LARGE_BUFFER_MAX_SIZE);
+ 
+     result = runCommand(cmd);
+ 
+-- 
+2.29.2
+
diff --git a/meta/recipes-support/icu/icu_72-1.bb b/meta/recipes-support/icu/icu_72-1.bb
index c2eae5298f..af8f5da08c 100644
--- a/meta/recipes-support/icu/icu_72-1.bb
+++ b/meta/recipes-support/icu/icu_72-1.bb
@@ -106,6 +106,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            file://filter.json \
            file://fix-install-manx.patch \
            file://0001-icu-Added-armeb-support.patch \
+           file://0001-pkgdata-increase-command-buffer-size.patch \
            "
 
 SRC_URI:append:class-target = "\
-- 
2.25.1


