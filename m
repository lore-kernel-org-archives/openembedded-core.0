Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D904CA0FE9
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 10:49:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.61773.1756205350204155125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 03:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=S8kJWQL2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=033363bb87=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57Q6vpcw2366497
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 03:49:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=h14PFiUa6m6TBpnF/+siEHLbgq66y3hzXxAswq1YOEQ=; b=S8kJWQL2mJSJ
	s4C2HXMR0fdI0R5uMk8Qrhe8LlfB9kEM6gkQ1jKJaxOSxCS5slLbLHuMSAnFIMwd
	hZa/6oIbbJnp+2aNU4oSbzWccsr2078rZbN0tz4gXfOhDLcmAH0pF9Oe3lVlI8Di
	bXsx4QcjZgylNWoCsVTeM4cQUrp/NGg6zCwcedEdAYDPlPDZgpqQW3pgnDDnKtjg
	kW7oguQeFeck0fn+k+SSRrBm0LEDz2T8/jXCL9xo+IAUD+m2mC4f+mUwdYKQzd8B
	Ws6q1W9X0v6Cl4TVyJcdi7vTuH9In5NPXfB1iCU2Dx5RtS9nSa48nGHVcMtXv3Yx
	XmDW9ZKDWw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q8x22s43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 03:49:09 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 26 Aug 2025 03:49:07 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 3/3] tiff: fix CVE-2025-8851
Date: Tue, 26 Aug 2025 16:18:34 +0530
Message-ID: <20250826104834.2432179-3-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250826104834.2432179-1-yogita.urade@windriver.com>
References: <20250826104834.2432179-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-ORIG-GUID: 5aH8VdcJO4QVfQyaQYJyNkSzIhie-VTg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDA5NSBTYWx0ZWRfXy1LPtKDXJej6
 fcklQj8bxpI6D+4M40R96Fw8NhVpq90XhLjWcjO6y8khZXQim68IsuFbik5AsRldmqHJv9QYjeH
 rOU4G+sfmi1Fbrrvy/EOMwhCaZi+2jh0+exp6gFRPTT9vl4wSY1xvGVcoXInOc6ULjydG6moB8U
 2GZ5Zu997pB7ld8jGnC5tyYctRIAP7UqVEeXh0BsbkRgaQ4omUK51jejGq7v72OWbms2WGo/9I+
 0yWFhiMPhARkm5fRy+H2/aAecYX9WK6/XWaJw+pqOgE64RGyDcynAMzMY3/E30OJwW2XRTf4KQa
 f9Ph7oIeXRRWBZHpNllezc197tz7oe33iQyVz1z2blhVb+02BCe9lvBckykTCo=
X-Authority-Analysis: v=2.4 cv=JfW8rVKV c=1 sm=1 tr=0 ts=68ad9125 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=2OwXVqhp2XgA:10 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8
 a=Qs8GJauRAAAA:8 a=t7CeM3EgAAAA:8 a=5vSyN_hxAAAA:8 a=jJJpTqQTVEfwAdH8KjEA:9
 a=-MsOl3yrPmtpHepMbiy1:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1zBLIHEOKY9YwKILsQtb:22
X-Proofpoint-GUID: 5aH8VdcJO4QVfQyaQYJyNkSzIhie-VTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 10:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222439

From: Yogita Urade <yogita.urade@windriver.com>

A vulnerability was determined in LibTIFF up to 4.5.1. Affected
by this issue is the function readSeparateStripsetoBuffer of the
file tools/tiffcrop.c of the component tiffcrop. The manipulation
leads to stack-based buffer overflow. Local access is required to
approach this attack. The patch is identified as
8a7a48d7a645992ca83062b3a1873c951661e2b3. It is recommended to
apply a patch to fix this issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-8851

Upstream patch:
https://gitlab.com/libtiff/libtiff/-/commit/8a7a48d7a645992ca83062b3a1873c951661e2b3

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../libtiff/tiff/CVE-2025-8851.patch          | 71 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8851.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8851.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8851.patch
new file mode 100644
index 0000000000..29089ab833
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8851.patch
@@ -0,0 +1,71 @@
+From 8a7a48d7a645992ca83062b3a1873c951661e2b3 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sun, 11 Aug 2024 16:01:07 +0000
+Subject: [PATCH] Attempt to address tiffcrop Coverity scan issues 1605444, 
+ 1605445, and 1605449.
+
+CVE: CVE-2025-8851
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/8a7a48d7a645992ca83062b3a1873c951661e2b3]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiffcrop.c | 17 ++++++++++++-----
+ 1 file changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 1b072d4..e16bc2d 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -5024,7 +5024,14 @@ static int readSeparateStripsIntoBuffer (TIFF *in, uint8_t *obuf, uint32_t lengt
+       buff = srcbuffs[s];
+       strip = (s * strips_per_sample) + j; 
+       bytes_read = TIFFReadEncodedStrip (in, strip, buff, stripsize);
+-      rows_this_strip = (uint32_t)(bytes_read / src_rowsize);
++      if (bytes_read < 0)
++      {
++         rows_this_strip = 0;
++      }
++      else
++      {
++         rows_this_strip = (uint32_t)(bytes_read / src_rowsize);
++      }
+       if (bytes_read < 0 && !ignore)
+         {
+         TIFFError(TIFFFileName(in),
+@@ -5434,14 +5441,14 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+       rmargin = _TIFFClampDoubleToUInt32(crop->margins[3] * scale * xres);
+       }
+ 
+-    if ((lmargin + rmargin) > image->width)
++    if (lmargin == 0xFFFFFFFFU || rmargin == 0xFFFFFFFFU || (lmargin + rmargin) > image->width)
+       {
+       TIFFError("computeInputPixelOffsets", "Combined left and right margins exceed image width");
+       lmargin = (uint32_t) 0;
+       rmargin = (uint32_t) 0;
+       return (-1);
+       }
+-    if ((tmargin + bmargin) > image->length)
++    if (tmargin == 0xFFFFFFFFU || bmargin == 0xFFFFFFFFU || (tmargin + bmargin) > image->length)
+       {
+       TIFFError("computeInputPixelOffsets", "Combined top and bottom margins exceed image length"); 
+       tmargin = (uint32_t) 0;
+@@ -5977,14 +5984,14 @@ computeOutputPixelOffsets (struct crop_mask *crop, struct image_data *image,
+       vmargin = _TIFFClampDoubleToUInt32(page->vmargin * scale * ((image->bps + 7) / 8));
+       }
+ 
+-    if ((hmargin * 2.0) > (pwidth * page->hres))
++    if (hmargin == 0xFFFFFFFFU || (hmargin * 2.0) > (pwidth * page->hres))
+       {
+       TIFFError("computeOutputPixelOffsets", 
+                 "Combined left and right margins exceed page width");
+       hmargin = (uint32_t) 0;
+       return (-1);
+       }
+-    if ((vmargin * 2.0) > (plength * page->vres))
++    if (vmargin == 0xFFFFFFFFU || (vmargin * 2.0) > (plength * page->vres))
+       {
+       TIFFError("computeOutputPixelOffsets", 
+                 "Combined top and bottom margins exceed page length"); 
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 137dc7f478..6db4d80cdf 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -61,6 +61,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2025-8177.patch \
            file://CVE-2024-13978.patch \
            file://CVE-2025-8534.patch \
+           file://CVE-2025-8851.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.40.0


