Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03018C47077
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 05:52:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5395.1705557167806380197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 21:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=e8QyYq70;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1747f05bad=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40I5L8IG004812
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 21:52:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=thaP1
	+Km1da+27dDw/+vrSGuH7FHKSUNwPZRAF1Zeps=; b=e8QyYq70cZgpMGD2tm+6c
	aW9WRVTIcLZu92XhchxMdWvIFNvG+8hNVN/0f3xsRdCM8t3sQEHYAgwKQO6aypKe
	zk0wwqojXQnYH3aqR6DCZQUmC/rMfH/etwEXnPgO8S+NnkXT8ZqGAEkzdK1zOSTk
	nptDSxP6QaX04htJBawDOwP6tKK8Tlk14aO/04gZzG89Ba7SYovWXDWOJ7njesqv
	gAtCi4DPETRgSH1tq6yb7OqS3txxlFydA+K5L5KrsqsSMPSnUmZ0Z8VlHMwL4mUm
	9t9AyCKQYiJBQWdraIRaVOct5uAkpPkhbPPoPcdwb3RVNOVVeyuKtnCFLSrht3JI
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vktwkn1kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 21:52:47 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 21:52:57 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] tiff: fix CVE-2023-6228
Date: Thu, 18 Jan 2024 05:52:29 +0000
Message-ID: <20240118055229.3779682-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: t2Ro6Pe8QsP2FMVWiggH7U2zFU0ZIz0b
X-Proofpoint-GUID: t2Ro6Pe8QsP2FMVWiggH7U2zFU0ZIz0b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_02,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401180038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 05:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193963

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
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch
new file mode 100644
index 0000000000..2020508fdf
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch
@@ -0,0 +1,31 @@
+From 1e7d217a323eac701b134afc4ae39b6bdfdbc96a Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Wed, 17 Jan 2024 06:57:08 +0000
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
+index aff0626..a4f7f6b 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -846,6 +846,8 @@ static int tiffcp(TIFF *in, TIFF *out)
+     if (!TIFFIsCODECConfigured(compression))
+         return FALSE;
+     TIFFGetFieldDefaulted(in, TIFFTAG_COMPRESSION, &input_compression);
++    if (!TIFFIsCODECConfigured(input_compression))
++	    return FALSE;
+     TIFFGetFieldDefaulted(in, TIFFTAG_PHOTOMETRIC, &input_photometric);
+     if (input_compression == COMPRESSION_JPEG)
+     {
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
index 4c472f8ef6..eb8a096f19 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data.patch \
            file://CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data-2.patch \
            file://CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch \
+           file://CVE-2023-6228.patch \
            "
 
 SRC_URI[sha256sum] = "88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a"
-- 
2.40.0


