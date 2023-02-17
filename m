Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C419EC05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 23:01:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1779.1676674884999070395
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Feb 2023 15:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=n5ujYS6p;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1412f5127e=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31HID92Y010666
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 15:01:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=knvVm23YLlGNdlfoHjLh7OUL0l3NvxaRH0yJlMYJZoY=;
 b=n5ujYS6pR7Wwv7aRwoypV12EctTl6mDOTyg7ZkiqQWfipCgWwmbx8sM1aBv2ktyuX+Ep
 0W04CoXh4j3GAdcgtDCEMd2bEcKLAKG0JH/vaj9dxmsM5QVN0a0uAz9/sxBPLXECP/s2
 7Eq+fYWqMnFC7hZQbt1bvddb3q4HogD5xZJFWHszueukSF/hvqeCvtJ10W59V1ZPEIr5
 P9XgbDx9cVwcSBLFiAJ84W8wdntl9LtBP+7hJzBYaRmPkWVMeRmfIntIBVUzfrYB3ZBw
 8L9RyVJgwG1TVl/tsE9SXxSG288kbqWGQgoSeBQ1Ff20qBKLKlXHvlOMfy/kBr2BPs0B Ag== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsbxat01c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 15:01:24 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 17 Feb 2023 15:01:23 -0800
Received: from ala-jslater-lx1.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.18 via Frontend Transport; Fri, 17 Feb 2023 15:01:23 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>,
        <rodolfo.zumbado@windriver.com>
Subject: [oe-core][PATCH 1/2] Revert "tar: Fix CVE-2022-48303"
Date: Fri, 17 Feb 2023 15:01:22 -0800
Message-ID: <20230217230123.579622-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OAChqLW5280PN5y0ElYRgnV_M-PCD15f
X-Proofpoint-ORIG-GUID: OAChqLW5280PN5y0ElYRgnV_M-PCD15f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_15,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=948
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1011 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170201
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 23:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177314

This reverts commit 4573a584397f197fbc9170abec3c590ea36667f7.

A fix is available from gnu.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../tar/files/CVE-2022-48303.patch            | 36 -------------------
 meta/recipes-extended/tar/tar_1.34.bb         |  4 +--
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta/recipes-extended/tar/files/CVE-2022-48303.patch

diff --git a/meta/recipes-extended/tar/files/CVE-2022-48303.patch b/meta/recipes-extended/tar/files/CVE-2022-48303.patch
deleted file mode 100644
index a8e9f4ac7d..0000000000
--- a/meta/recipes-extended/tar/files/CVE-2022-48303.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1d530107a24d71e798727d7f0afa0833473d1074 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Matej=20Mu=C5=BEila?= <mmuzila@gmail.com>
-Date: Wed, 11 Jan 2023 08:55:58 +0100
-Subject: [PATCH] Fix savannah bug #62387
-
-* src/list.c (from_header): Check for the end of field after leading byte
-  (0x80 or 0xff) of base-256 encoded header value
-
-Upstream-Status: Backport
-[https://savannah.gnu.org/patch/download.php?file_id=54212]
-CVE: CVE-2022-48303
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- src/list.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/list.c b/src/list.c
-index 9fafc425..bf41b581 100644
---- a/src/list.c
-+++ b/src/list.c
-@@ -895,6 +895,12 @@ from_header (char const *where0, size_t digs, char const *type,
- 			   << (CHAR_BIT * sizeof (uintmax_t)
- 			       - LG_256 - (LG_256 - 2)));
-       value = (*where++ & ((1 << (LG_256 - 2)) - 1)) - signbit;
-+      if (where == lim)
-+        {
-+          if (type && !silent)
-+            ERROR ((0, 0, _("Archive base-256 value is invalid")));
-+          return -1;
-+        }
-       for (;;)
- 	{
- 	  value = (value << LG_256) + (unsigned char) *where++;
--- 
-2.38.1
-
diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
index 22c04ba70a..7307cd57a2 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -6,9 +6,7 @@ SECTION = "base"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
-           file://CVE-2022-48303.patch \
-           "
+SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
 
 SRC_URI[sha256sum] = "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a511079255646ff"
 
-- 
2.25.1


