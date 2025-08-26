Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BDACA0FED
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 10:49:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.61382.1756205349111254196
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 03:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jd9bIM6G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=033363bb87=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57Q6Z1HY1038565
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 10:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=k4fBOIiLc3wvXa36VhA7hTyckaKtG6S7qLO+l2lHlAM=; b=jd9bIM6GHUMr
	gwx7/W2ROy/QQwzCo8PYcS2gmubg4L429PdsHjp2VLulenjA9IY3gyB161TSRAPm
	oQpsaMhdo0iimkJ4OsyJLjtF6FFVPh6GNhK0iAZukPdUawajY4lcP4qF/lWGb475
	naCWCgadWQxFo5UaU0t097D6aXOSu3lrjQDBubDaC7Wm/va4qEdchJfQCyPUa2QE
	hKrn6GN2RolP3vUZVt/lXxrWkoWk1uSFZCYLVkUu5y0PjercQzHnGyvaUySakJGv
	d+K74vs+nA/y8KZ6oXctuHYPGchaUTsnrVgfplDWZ1GbuFk58lAqQH1meiTYyylx
	hHerQuI2Lg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q4m3txjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 10:49:07 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 26 Aug 2025 03:49:05 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 2/3] tiff: fix CVE-2025-8534
Date: Tue, 26 Aug 2025 16:18:33 +0530
Message-ID: <20250826104834.2432179-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250826104834.2432179-1-yogita.urade@windriver.com>
References: <20250826104834.2432179-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDA5NSBTYWx0ZWRfX+BKMgebvGSGl
 nS5Ce9Tw586GOPj5ziMWv2lT1oe3ljAIYGbR2wXqOXtX4kbazcriFO50kX5/zrWrMcdHD2IJ73o
 jOPK5rpQoG6AErNTcuIyU3TsBfRvKsjZmUSwU2Psx/Yr6Flr5YYjMadbnYHEZOrPSSj3m31tBbX
 FlGosqb825NeGCdFXxZh1B26oNgZs8fJ4fAKDn38DItbjInniTqes3E1M2gylMRjv+NTD5SHgHS
 HqKLw0nFlzhX0Kfc+hQXDDmZzRgbbGvv+9LStwwyKGZzSOnjFq620IWPN5yrow2RDgxOPOnnVkC
 D7alhz8TWWU/JHz0KT5yuBagovr28s0t1y9RvHtHt7iPr8/u8WbnmgFjt+NyCg=
X-Proofpoint-ORIG-GUID: YJ0ChrXC1k0vYhlojN5_sL5CrCtbqQbX
X-Proofpoint-GUID: YJ0ChrXC1k0vYhlojN5_sL5CrCtbqQbX
X-Authority-Analysis: v=2.4 cv=CcwI5Krl c=1 sm=1 tr=0 ts=68ad9124 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=2OwXVqhp2XgA:10 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8
 a=Qs8GJauRAAAA:8 a=t7CeM3EgAAAA:8 a=x9kpsMKOyEzXabdzLssA:9
 a=-MsOl3yrPmtpHepMbiy1:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 10:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222438

From: Yogita Urade <yogita.urade@windriver.com>

A vulnerability classified as problematic was found in libtiff
4.6.0. This vulnerability affects the function PS_Lvl2page of
the file tools/tiff2ps.c of the component tiff2ps. The
manipulation leads to null pointer dereference. It is possible
to launch the attack on the local host. The complexity of an
attack is rather high. The exploitation appears to be difficult.
The exploit has been disclosed to the public and may be used.
The name of the patch is 6ba36f159fd396ad11bf6b7874554197736ecc8b.
It is recommended to apply a patch to fix this issue. One of the
maintainers explains, that "[t]his error only occurs if
DEFER_STRILE_LOAD (defer-strile-load:BOOL=ON) or TIFFOpen( .. "rD")
option is used."

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-8534

Upstream patch:
https://gitlab.com/libtiff/libtiff/-/commit/6ba36f159fd396ad11bf6b7874554197736ecc8b

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../libtiff/tiff/CVE-2025-8534.patch          | 60 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch
new file mode 100644
index 0000000000..59c14e2703
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch
@@ -0,0 +1,60 @@
+From 6ba36f159fd396ad11bf6b7874554197736ecc8b Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sat, 2 Aug 2025 18:55:54 +0200
+Subject: [PATCH] tiff2ps: check return of TIFFGetFiled() for 
+ TIFFTAG_STRIPBYTECOUNTS and TIFFTAG_TILEBYTECOUNTS to avoid NULL pointer 
+ dereference.
+
+Closes #718
+
+CVE: CVE-2025-8534
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/6ba36f159fd396ad11bf6b7874554197736ecc8b]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiff2ps.c | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/tools/tiff2ps.c b/tools/tiff2ps.c
+index a598ede..05a346a 100644
+--- a/tools/tiff2ps.c
++++ b/tools/tiff2ps.c
+@@ -2193,10 +2193,20 @@ PS_Lvl2page(FILE* fd, TIFF* tif, uint32_t w, uint32_t h)
+ 	tiled_image = TIFFIsTiled(tif);
+ 	if (tiled_image) {
+ 		num_chunks = TIFFNumberOfTiles(tif);
+-		TIFFGetField(tif, TIFFTAG_TILEBYTECOUNTS, &bc);
++		if (!TIFFGetField(tif, TIFFTAG_TILEBYTECOUNTS, &bc))
++                {
++                   TIFFError(filename,
++                             "Can't read bytecounts of tiles at PS_Lvl2page()");
++                   return (FALSE);
++                }
+ 	} else {
+ 		num_chunks = TIFFNumberOfStrips(tif);
+-		TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc);
++		if (!TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc))
++                {
++                   TIFFError(filename,
++                             "Can't read bytecounts of strips at PS_Lvl2page()");
++                   return (FALSE);
++                 }
+ 	}
+ 
+ 	if (use_rawdata) {
+@@ -2791,7 +2801,11 @@ PSRawDataBW(FILE* fd, TIFF* tif, uint32_t w, uint32_t h)
+ 
+ 	(void) w; (void) h;
+ 	TIFFGetFieldDefaulted(tif, TIFFTAG_FILLORDER, &fillorder);
+-	TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc);
++        if (!TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc))
++        {
++           TIFFError(filename, "Can't read bytecounts of strips at PSRawDataBW()");
++           return;
++        }
+ 
+ 	/*
+ 	 * Find largest strip:
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index d5ae82bc7c..137dc7f478 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -60,6 +60,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2025-8176-0003.patch \
            file://CVE-2025-8177.patch \
            file://CVE-2024-13978.patch \
+           file://CVE-2025-8534.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.40.0


