Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86758C4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 10:54:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8827.1705575270761150118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 02:54:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nObNvvKc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1747f05bad=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40IAdwA1002493
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 10:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=/93Me
	96BJ89pDZNyyuFHXig+W2jTf6RK6l+RzMMe/Nw=; b=nObNvvKcAMwy1qUqltmdV
	a7tgxQwu9BOIihFal2H0MFtKrzbtBHhnarHU6AQ+D19vR/cRTpc7LywUqFQ60NmD
	4HN7babMwWX1DFa/KIrwn/QX66ErX0y9swGpQrPnT5N3ORJEWcEH5CnguQ00eUkt
	t6K64EjQj9KNogzRPRepA+VSUfjWUJNxjSAwgvi3WCGSmx1VrLoeX24mL4hXNU5B
	N27j6W51NRQdh1pU/mY/NpYnG0dkF0AeviboTMQPBnqfL76c5hdI70dORVrv2IGO
	ZHcfzC93Vb1Zgr0BImHqfxWv9HF5+aUQhm+tdLpO+dFALWbLVvzqR2lb8nPbn02c
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkfqxdq0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 10:54:29 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 02:54:38 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] tiff: fix CVE-2023-6228
Date: Thu, 18 Jan 2024 10:54:02 +0000
Message-ID: <20240118105402.837322-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: xCuqsaETE_KMKXajv6y3388fZxq4jBqG
X-Proofpoint-ORIG-GUID: xCuqsaETE_KMKXajv6y3388fZxq4jBqG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_06,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=634 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401180078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 10:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193973

From: Yogita Urade <yogita.urade@windriver.com>

CVE-2023-6228:
An issue was found in the tiffcp utility distributed by the
libtiff package where a crafted TIFF file on processing may
cause a heap-based buffer overflow leads to an application
crash.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-6228
https://gitlab.com/libtiff/libtiff/-/issues/606

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../libtiff/tiff/CVE-2023-6228.patch          | 31 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch
new file mode 100644
index 0000000000..f15cc96e19
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch
@@ -0,0 +1,31 @@
+From 1e7d217a323eac701b134afc4ae39b6bdfdbc96a Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Wed, 17 Jan 2024 06:38:24 +0000
+Subject: [PATCH] codec of input image is available, independently from codec
+ check of output image and return with error if not.
+
+Fixes #606.
+
+CVE: CVE-2023-6228
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/1e7d217a323eac701b134afc4ae39b6bdfdbc96a]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiffcp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index 34b6ef2..17c6524 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -724,6 +724,8 @@ tiffcp(TIFF* in, TIFF* out)
+	else
+		CopyField(TIFFTAG_COMPRESSION, compression);
+	TIFFGetFieldDefaulted(in, TIFFTAG_COMPRESSION, &input_compression);
++	if (!TIFFIsCODECConfigured(input_compression))
++		return FALSE;
+	TIFFGetFieldDefaulted(in, TIFFTAG_PHOTOMETRIC, &input_photometric);
+	if (input_compression == COMPRESSION_JPEG) {
+		/* Force conversion to RGB */
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 11e3818c69..d284100ab2 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-1916.patch \
            file://CVE-2023-40745.patch \
            file://CVE-2023-41175.patch \
+           file://CVE-2023-6228.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.40.0


