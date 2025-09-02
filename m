Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D982CA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 04:58:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.70172.1756789100679693299
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 21:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AC9CvLqj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1340c0b1e4=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5824ntaI1015126
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Sep 2025 04:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=BYr8BmaD9Fj8i3NIcBf8
	b3+oYP7AosphkHeoZNXV084=; b=AC9CvLqjpazSIl/2z2DSXJT2Up5gl5SE2Mxh
	lX4xLiwZNbvYeWbH/cRGXUcq2B9465Nc7F/tKGR0YlhqRn+P2apIU78qiIouG9BU
	u/U9Ysw0vxQr8VoT14CNvv94BXUqpsHszmDr4LFZerqd6Q3nU3ATQ0obQLHDhj5i
	adKo/2S6jJU4hazFM2PiwsO59k2rN5RS8fkiaLTrGmofYpUcE0KzgR3wKI4q/zB7
	5g6/zxF1tkbCXc0GkQnprL2jSeVfNlAW+OXjwW5tpFMN2dCjYB69gp97ssiO9lJV
	XfmtNzL10jNOG3YoLDsaPcgK9oLhWn0/Kuq7+bFUbS5IfZclHA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48ur99t8ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 04:58:18 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 1 Sep 2025 21:58:12 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] tiff: fix CVE-2025-8534
Date: Tue, 2 Sep 2025 10:27:42 +0530
Message-ID: <20250902045742.560728-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=FqYF/3rq c=1 sm=1 tr=0 ts=68b6796b cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8
 a=Qs8GJauRAAAA:8 a=t7CeM3EgAAAA:8 a=x9kpsMKOyEzXabdzLssA:9
 a=-MsOl3yrPmtpHepMbiy1:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: M2YV1f_IuiW-cFh8YiRUGvRV5XA4p0ra
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA0NyBTYWx0ZWRfXxn560xpZUf3t
 FEsceiZ6/TTajHgK+XZ5Z0V2preErSohDJBJi8YK4x0jPp+7gxzKyMZ91cA31ceN/gXTX03TbNA
 /XPABd9MKt1n2CoMyUr5i7NrsHWjmxpAvGPu1r9HeR8s5TDtf9c6P3cIrd0zoRidR8rh4Vh4Gxv
 pOX+x8YfvXSO3TjDLQOoIZmHjxaH4xMDSzZiCpX7FAF2c9RGYQIuAUV0bWY4vejNdGR3sQUOLlB
 6CW8qc+tczRKJ++oNe+aNMMVqGZOkPqo3ZqGwo9wzUiRsNPpgCOT7NFn16j4l5zD8wGUuC9OcEn
 455blTvgJ7Cp5L0fb3U9tmTGqZ4SLGjgB6cLGmYL1dgHG+5Lm2je6ppLEvEECs=
X-Proofpoint-ORIG-GUID: M2YV1f_IuiW-cFh8YiRUGvRV5XA4p0ra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 04:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222702

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
 .../libtiff/tiff/CVE-2025-8534.patch          | 62 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.7.0.bb |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch
new file mode 100644
index 0000000000..b3bc0e0d94
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch
@@ -0,0 +1,62 @@
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
+index e5425bf..5c54205 100644
+--- a/tools/tiff2ps.c
++++ b/tools/tiff2ps.c
+@@ -2432,12 +2432,22 @@ int PS_Lvl2page(FILE *fd, TIFF *tif, uint32_t w, uint32_t h)
+     if (tiled_image)
+     {
+         num_chunks = TIFFNumberOfTiles(tif);
+-        TIFFGetField(tif, TIFFTAG_TILEBYTECOUNTS, &bc);
++        if (!TIFFGetField(tif, TIFFTAG_TILEBYTECOUNTS, &bc))
++        {
++            TIFFError(filename,
++                      "Can't read bytecounts of tiles at PS_Lvl2page()");
++            return (FALSE);
++        }
+     }
+     else
+     {
+         num_chunks = TIFFNumberOfStrips(tif);
+-        TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc);
++        if (!TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc))
++        {
++            TIFFError(filename,
++                      "Can't read bytecounts of strips at PS_Lvl2page()");
++            return (FALSE);
++        }
+     }
+ 
+     if (use_rawdata)
+@@ -3107,7 +3117,11 @@ void PSRawDataBW(FILE *fd, TIFF *tif, uint32_t w, uint32_t h)
+     (void)w;
+     (void)h;
+     TIFFGetFieldDefaulted(tif, TIFFTAG_FILLORDER, &fillorder);
+-    TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc);
++    if (!TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc))
++    {
++        TIFFError(filename, "Can't read bytecounts of strips at PSRawDataBW()");
++        return;
++    }
+ 
+     /*
+      * Find largest strip:
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
index 26e3811ff8..2155ac8df4 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
 	   file://CVE-2025-8176_3.patch \
 	   file://CVE-2025-8177_1.patch \
 	   file://CVE-2025-8177_2.patch \
+           file://CVE-2025-8534.patch \
 	   "
 
 SRC_URI[sha256sum] = "67160e3457365ab96c5b3286a0903aa6e78bdc44c4bc737d2e486bcecb6ba976"
-- 
2.40.0


