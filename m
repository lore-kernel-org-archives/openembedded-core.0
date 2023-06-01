Return-Path: <nat.bailey@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0F0C7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 20:09:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2813.1685650188557756764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 13:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=feYdXZlH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5516a9a59a=nat.bailey@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351CiIYB028318
	for <openembedded-core@lists.openembedded.org>; Thu, 1 Jun 2023 20:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=tpa4CxSMMFBopdzAliyDsF2Y0J0mf1uoYBlePH/Zd0w=;
 b=feYdXZlHk9iempq1DerXUcivEXBBU/Z6zBFh8uHjeD/84CAknbPUWtS5oL9zFHMuYv39
 6vIewviR11wVOflCopceCQYhvcay9A5qjjHj9yWUvdBfg+RUXuTRTSZYM/7hJ8oky1yD
 yb2KsL2O9rMILM8kecpTfGHfKHNIKlT3Xy/BHT44ySCtkeA/8u07W/RaW+YvEq7myr+S
 maLFlozvYuJFS3oKXsEJAHoJ1HB7l8e7dE+uo/GMf/1X/bphyY4RnsQvh1SaDWR3RpqI
 Tm/kIEs0Au+GKSAVXC/ei4snCngdRXw3+cPLc1P+R+ai6wIS5lA03OW9MzPZJHSqT6U/ vg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qwqgj2b4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 20:09:47 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 13:09:46 -0700
Received: from dreyna-dlerner-T5600.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 13:09:46 -0700
From: Nat Bailey <nat.bailey@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <nat.bailey@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][mickledore][PATCH v2] tiff: backport a fix for CVE-2023-2731
Date: Thu, 1 Jun 2023 13:03:09 -0700
Message-ID: <20230601200309.3570903-1-nat.bailey@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4Nk_u569iZE8RWKB8S-v3hTlBieJ8orH
X-Proofpoint-ORIG-GUID: 4Nk_u569iZE8RWKB8S-v3hTlBieJ8orH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=342 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306010173
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 20:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182120

From: Natasha Bailey <nat.bailey@windriver.com>

This patch fixes an issue in libtiff's LZWDecode function which could cause a null pointer dereference.

Signed-off-by: Natasha Bailey <nat.bailey@windriver.com>
---
 .../libtiff/files/CVE-2023-2731.patch         | 40 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.5.0.bb |  4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
new file mode 100644
index 0000000000..52fba661c9
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
@@ -0,0 +1,40 @@
+From 9be22b639ea69e102d3847dca4c53ef025e9527b Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sat, 29 Apr 2023 12:20:46 +0200
+Subject: [PATCH] LZWDecode(): avoid crash when trying to read again from a
+ strip whith a missing end-of-information marker (fixes #548)
+
+CVE: CVE-2023-2731
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/9be22b639ea69e102d3847dca4c53ef025e9527b]
+Signed-off-by: Natasha Bailey <nat.bailey@windriver.com>
+
+---
+ libtiff/tif_lzw.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libtiff/tif_lzw.c b/libtiff/tif_lzw.c
+index ba75a07e..d631fa10 100644
+--- a/libtiff/tif_lzw.c
++++ b/libtiff/tif_lzw.c
+@@ -423,6 +423,10 @@ static int LZWDecode(TIFF *tif, uint8_t *op0, tmsize_t occ0, uint16_t s)
+ 
+     if (sp->read_error)
+     {
++        TIFFErrorExtR(tif, module,
++                      "LZWDecode: Scanline %" PRIu32 " cannot be read due to "
++                      "previous error",
++                      tif->tif_row);
+         return 0;
+     }
+ 
+@@ -742,6 +746,7 @@ after_loop:
+     return (1);
+ 
+ no_eoi:
++    sp->read_error = 1;
+     TIFFErrorExtR(tif, module,
+                   "LZWDecode: Strip %" PRIu32 " not terminated with EOI code",
+                   tif->tif_curstrip);
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
index f8a2482a84..ce371a15f9 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a3e32d664d6db1386b4689c8121531c3"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-           file://CVE-2022-48281.patch"
+           file://CVE-2022-48281.patch \
+           file://CVE-2023-2731.patch \
+           "
 
 SRC_URI[sha256sum] = "c7a1d9296649233979fa3eacffef3fa024d73d05d589cb622727b5b08c423464"
 
-- 
2.34.1


