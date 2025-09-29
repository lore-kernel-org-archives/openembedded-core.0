Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F37CAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 07:32:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.48089.1759131134895338156
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 00:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gSHphmcX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23674a5978=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58T4IZgd223562
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 07:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=QxCMAjB0b0pYK+mEq784
	X5XchNKIvmnyGIawzwaimcI=; b=gSHphmcXoZwEYoJvad6L6v417w3grFaod3MT
	8zjewFmOnKmkxdJopvkF7lKfEwv0bdNfACjCfAjr0S2DawXS60FQWvYOt8DVQrKE
	IWgbSjTpTu5ksIBYcLXJtc2PZlx5PXiGGwRLD0FtvkPMAZolPmVXDB+FApLDBU1Y
	2BTgCp0uHoEqtd+bDiOdDtS16Ziu+i6F7up+XlyVpvDrMWNKGIELtwxbjrpxuDOd
	xelWVqL1feajAQiAsfoRpLZLP6A2v6pLBg52xAAWJhL5bepwhxAyzWzEgUogu5Aw
	neuUU2UQUvVzCgKU+pM6IwwLEOZfgNq4UwgalGbX4IdMvqVPiw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49e54wsq1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 07:32:13 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 29 Sep 2025 00:32:11 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 1/1] tiff: fix CVE-2025-9900
Date: Mon, 29 Sep 2025 13:01:51 +0530
Message-ID: <20250929073151.3420836-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA3MSBTYWx0ZWRfXxULOPw5Qh0YP
 y8LU14S1aqFGAeA8uTcC+STEZn1m0e2gpU0t6+E9ZD1FROnlH2Xh/eEfe/P3Bx590MTM7rk1Zcf
 HmNsc9BUSyM3GygC6rROEQOmlNLH+w2kC9E7OBfQtraB2BUEIwsSP1SS/yQQ7/m44lln+ccNM1p
 oGmiPSXq6eEFNZiWPBdq5IoR2mqVW2xuMLhMg4HksX1kB+c/M5zAViJ+kxeKR2tqfIV45FZEle1
 yBPki0ADq1KufbNLO6uO14DVfm2zKr1L4IpFPsR7ymNFTGdOF+L9yjI7UOs98DP1ZNCXz1Ji9I9
 4PN1upVrr/eAWXdYSYBeW1ZHEX6A9raVCvR6PjFp/Fn7xdqkilrC0YmosfttzLjaK0GmhRs5yUt
 /N4bgx+5ZiCv/SqG9QJf+pV9Q7Qphw==
X-Authority-Analysis: v=2.4 cv=ZNPaWH7b c=1 sm=1 tr=0 ts=68da35fd cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8
 a=Qs8GJauRAAAA:8 a=t7CeM3EgAAAA:8 a=5-NjjZwsQCTHZl0p56MA:9
 a=-MsOl3yrPmtpHepMbiy1:22 a=FdTzh2GWekK77mhwV6Dw:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-ORIG-GUID: kLkZEe1418cIHjtulEYgLzD70OMEN3D0
X-Proofpoint-GUID: kLkZEe1418cIHjtulEYgLzD70OMEN3D0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509290071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 07:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224119

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was found in Libtiff. This vulnerability is a "write-what-where"
condition, triggered when the library processes a specially crafted TIFF
image file.[EOL][EOL]By providing an abnormally large image height value
in the file's metadata, an attacker can trick the library into writing
attacker-controlled color data to an arbitrary memory location. This
memory corruption can be exploited to cause a denial of service (application
crash) or to achieve arbitrary code execution with the permissions of the user.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-9900

Upstream patch:
https://gitlab.com/libtiff/libtiff/-/commit/3e0dcf0ec651638b2bd849b2e6f3124b36890d99

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../libtiff/tiff/CVE-2025-9900.patch          | 54 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.7.0.bb |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch
new file mode 100644
index 0000000000..6101f0f4a4
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch
@@ -0,0 +1,54 @@
+From 3e0dcf0ec651638b2bd849b2e6f3124b36890d99 Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Wed, 11 Jun 2025 19:45:19 +0000
+Subject: [PATCH] tif_getimage.c: Fix buffer underflow crash for less raster
+ rows at TIFFReadRGBAImageOriented()
+
+CVE: CVE-2025-9900
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/3e0dcf0ec651638b2bd849b2e6f3124b36890d99]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ libtiff/tif_getimage.c | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index 6c7b503..6a08a5b 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -600,6 +600,22 @@ int TIFFRGBAImageGet(TIFFRGBAImage *img, uint32_t *raster, uint32_t w,
+             "No \"put\" routine setupl; probably can not handle image format");
+         return (0);
+     }
++    /* Verify raster width and height against image width and height. */
++    if (h > img->height)
++    {
++        /* Adapt parameters to read only available lines and put image at
++         * the bottom of the raster. */
++        raster += (size_t)(h - img->height) * w;
++        h = img->height;
++    }
++    if (w > img->width)
++    {
++        TIFFWarningExtR(img->tif, TIFFFileName(img->tif),
++                        "Raster width of %d shall not be larger than image "
++                        "width of %d -> raster width adapted for reading",
++                        w, img->width);
++        w = img->width;
++    }
+     return (*img->get)(img, raster, w, h);
+ }
+
+@@ -617,9 +633,7 @@ int TIFFReadRGBAImageOriented(TIFF *tif, uint32_t rwidth, uint32_t rheight,
+     if (TIFFRGBAImageOK(tif, emsg) && TIFFRGBAImageBegin(&img, tif, stop, emsg))
+     {
+         img.req_orientation = (uint16_t)orientation;
+-        /* XXX verify rwidth and rheight against width and height */
+-        ok = TIFFRGBAImageGet(&img, raster + (rheight - img.height) * rwidth,
+-                              rwidth, img.height);
++        ok = TIFFRGBAImageGet(&img, raster, rwidth, rheight);
+         TIFFRGBAImageEnd(&img);
+     }
+     else
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
index 91e7bfbe17..f94b0dec7f 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2025-8534.patch \
            file://CVE-2025-9165.patch \
            file://CVE-2025-8961.patch \
+           file://CVE-2025-9900.patch \
 	   "
 
 SRC_URI[sha256sum] = "67160e3457365ab96c5b3286a0903aa6e78bdc44c4bc737d2e486bcecb6ba976"
-- 
2.40.0


