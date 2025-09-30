Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3398CAC5B9
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 08:19:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.20326.1759220387923855960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 01:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LetDed56;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2368835a42=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58U6UMm62903808
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 01:19:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=YGT5aSPME83N7DiqMFAA
	1nWZ4xqCGYRnff9mFU73EqI=; b=LetDed56sCSCUGwocH2yiqh6e/eIvA6flRjt
	Q2PwrVgvQYWo6Me//9d0RuP7GwwMzZW3jhWlKXBu2XQhuF7a1WPsd60nI+fndMSH
	09J9hub+GZYW4lLkhtWLWzcv51M9Ot8kAhcV80vnMFlaImckBIUO1RLFfjQNHsDI
	kBK5WrQzHVNa+U28bWL7Wm2WBPvYiCpbCvSd8iXxu4Kxrw+cfj1zOAhPwpCT/OZ4
	cj3JZwY4GMwgu41/gJmt5xLzZgYg6gDeJY5Oc+kIUad3rPaqd+2QjNrCh2dnNBLM
	CcG8vnCjcxM5MIqA/1OVRuwMF8Mtrh2vdEz04h7fmyt/FumgnA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49eb6yjy7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 01:19:47 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 30 Sep 2025 01:19:45 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] tiff: fix CVE-2025-9900
Date: Tue, 30 Sep 2025 13:49:25 +0530
Message-ID: <20250930081925.2774032-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-ORIG-GUID: SW0drADimjhk32rYTsnu13wFUaLsBWVi
X-Authority-Analysis: v=2.4 cv=cYHfb3DM c=1 sm=1 tr=0 ts=68db92a3 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8
 a=Qs8GJauRAAAA:8 a=t7CeM3EgAAAA:8 a=5-NjjZwsQCTHZl0p56MA:9
 a=-MsOl3yrPmtpHepMbiy1:22 a=FdTzh2GWekK77mhwV6Dw:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDA3NCBTYWx0ZWRfX5mvcNhJqAmhP
 ALF8+2gIiX2kUFK60YNHvn4YSqvxwl6tRV0W6Pt2zlns+N9B2XutWfGzW60WyLLzutorOmTDIS+
 xPTCWV+AidGVOlkzDy3cmwHoM8+5yaeiefKT4ULjrI70qQbY7bkdsgYTvfHYhyRbhhCpIcnCpyR
 tr4zQhdGhao1Vq4pm6OQeejGIXJm0Pirzh3EwBc0h8IsbbHzsrh6UV0uC0OUw84LN8CAbNr7Fdc
 vCjE0GKxWrg9a7lkUtCUytkYW3mtOyx57d3zm6BwbBLFWI+gC6CSSnK/2GUW6+Quh/txR3dhCkh
 JMSBt71DTN9DtzyoRNrkD8YZo4RV0xk6311a7/Y7riEpN+091Cbfw/E8X/dp4jFpXPAJHljrr4Z
 F96IuUkHgr8RGUE0RkZecgy2Hfi3tQ==
X-Proofpoint-GUID: SW0drADimjhk32rYTsnu13wFUaLsBWVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509300074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 08:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224179

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
 .../libtiff/tiff/CVE-2025-9900.patch          | 57 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch
new file mode 100644
index 0000000000..9199cc6090
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch
@@ -0,0 +1,57 @@
+From 3e0dcf0ec651638b2bd849b2e6f3124b36890d99 Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Wed, 11 Jun 2025 19:45:19 +0000
+Subject: [PATCH] tif_getimage.c: Fix buffer underflow crash for less raster
+ rows at TIFFReadRGBAImageOriented()
+
+CVE: CVE-2025-9900
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/3e0dcf0ec651638b2bd849b2e6f3124b36890d99]
+
+Changes-
+- Use old API TIFFWarningExt instead of TIFFWarningExtR.
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ libtiff/tif_getimage.c | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index a9cd48f..4c807ad 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -509,6 +509,22 @@ TIFFRGBAImageGet(TIFFRGBAImage* img, uint32_t* raster, uint32_t w, uint32_t h)
+		"No \"put\" routine setupl; probably can not handle image format");
+		return (0);
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
++        TIFFWarningExt(img->tif, TIFFFileName(img->tif),
++                        "Raster width of %d shall not be larger than image "
++                        "width of %d -> raster width adapted for reading",
++                        w, img->width);
++        w = img->width;
++    }
+     return (*img->get)(img, raster, w, h);
+ }
+
+@@ -527,9 +543,7 @@ TIFFReadRGBAImageOriented(TIFF* tif,
+
+	if (TIFFRGBAImageOK(tif, emsg) && TIFFRGBAImageBegin(&img, tif, stop, emsg)) {
+		img.req_orientation = (uint16_t)orientation;
+-		/* XXX verify rwidth and rheight against width and height */
+-		ok = TIFFRGBAImageGet(&img, raster+(rheight-img.height)*rwidth,
+-			rwidth, img.height);
++        ok = TIFFRGBAImageGet(&img, raster, rwidth, rheight);
+		TIFFRGBAImageEnd(&img);
+	} else {
+		TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif), "%s", emsg);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 6db4d80cdf..0b4bef4c41 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -62,6 +62,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2024-13978.patch \
            file://CVE-2025-8534.patch \
            file://CVE-2025-8851.patch \
+           file://CVE-2025-9900.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.40.0


