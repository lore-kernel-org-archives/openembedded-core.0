Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D17EC87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 12:24:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.23862.1754483083200873952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 05:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=031303e4df=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 576AGY1M3209416
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Aug 2025 05:24:42 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpy7gt8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 05:24:41 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 6 Aug 2025 05:24:39 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/2] tiff: fix CVE-2025-8176
Date: Wed, 6 Aug 2025 17:54:12 +0530
Message-ID: <20250806122413.3600531-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=G5McE8k5 c=1 sm=1 tr=0 ts=6893498a cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=2OwXVqhp2XgA:10 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8
 a=Qs8GJauRAAAA:8 a=t7CeM3EgAAAA:8 a=5vSyN_hxAAAA:8 a=o-6IZ725JCalPhnO0bMA:9
 a=-MsOl3yrPmtpHepMbiy1:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1zBLIHEOKY9YwKILsQtb:22
X-Proofpoint-GUID: x5HA9wMwyGgfDl_QT9CDyn3Y6RYJCNiJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA3OSBTYWx0ZWRfX+rK+oURe6XHC
 xsn9Hp3pWkpJk6+7NVjy/+J02c+v2uNuOE04c9zDQuaqG+EseAPjBHHBo+tUbosen1d2H6myO63
 e/oynQW5MLIj/M4/tuzbuzpAVKYyHn/muj3RTe1mNwrlBViPvzE8honFZ0EnXstgpxTU/6auuVh
 CwLJM3MPQZj282UqeyyRbtgy/kbA36uy7sMPmruVvg+Iz1sYmUrxX1l5ng43IYKU5VVpbKJylYo
 M0FM15wXBxlokWRVp/MtN1D1k/bh2DLqt+ammCP2Whk0IW9HVI6OgaiW5n5AuMfevdob5T3ESLe
 x9JCAQikyyYUP1O7VBTLlAczNk5x6yq1rHeL+incAVPsfxAPW+ODvDLZeBqS/o=
X-Proofpoint-ORIG-GUID: x5HA9wMwyGgfDl_QT9CDyn3Y6RYJCNiJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 12:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221534

From: Yogita Urade <yogita.urade@windriver.com>

A vulnerability was found in LibTIFF up to 4.7.0. It has
been declared as critical. This vulnerability affects the
function get_histogram of the file tools/tiffmedian.c. The
manipulation leads to use after free. The attack needs to
be approached locally. The exploit has been disclosed to
the public and may be used. The patch is identified as
fe10872e53efba9cc36c66ac4ab3b41a839d5172. It is recommended
to apply a patch to fix this issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-8176

Upstream patches:
https://gitlab.com/libtiff/libtiff/-/commit/3994cf3b3bc6b54c32f240ca5a412cffa11633fa
https://gitlab.com/libtiff/libtiff/-/commit/ce46f002eca4148497363f80fab33f9396bcbeda
https://gitlab.com/libtiff/libtiff/-/commit/ecc4ddbf1f0fed7957d1e20361e37f01907898e0

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../libtiff/tiff/CVE-2025-8176-0001.patch     | 61 +++++++++++++++++++
 .../libtiff/tiff/CVE-2025-8176-0002.patch     | 31 ++++++++++
 .../libtiff/tiff/CVE-2025-8176-0003.patch     | 28 +++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  3 +
 4 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0001.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0002.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0003.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0001.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0001.patch
new file mode 100644
index 0000000000..83dc695528
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0001.patch
@@ -0,0 +1,61 @@
+From 3994cf3b3bc6b54c32f240ca5a412cffa11633fa Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Mon, 19 May 2025 10:53:30 -0700
+Subject: [PATCH] Don't skip the first line of the input image.  Addresses
+ issue #703
+
+CVE: CVE-2025-8176
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/3994cf3b3bc6b54c32f240ca5a412cffa11633fa]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiffdither.c | 4 ++--
+ tools/tiffmedian.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tools/tiffdither.c b/tools/tiffdither.c
+index 062fd60..d352554 100644
+--- a/tools/tiffdither.c
++++ b/tools/tiffdither.c
+@@ -95,7 +95,7 @@ fsdither(TIFF* in, TIFF* out)
+	nextptr = nextline;
+	for (j = 0; j < imagewidth; ++j)
+		*nextptr++ = *inptr++;
+-	for (i = 1; i < imagelength; ++i) {
++	for (i = 0; i < imagelength; ++i) {
+		tmpptr = thisline;
+		thisline = nextline;
+		nextline = tmpptr;
+@@ -138,7 +138,7 @@ fsdither(TIFF* in, TIFF* out)
+					nextptr[0] += v / 16;
+			}
+		}
+-		if (TIFFWriteScanline(out, outline, i-1, 0) < 0)
++		if (TIFFWriteScanline(out, outline, i, 0) < 0)
+			goto skip_on_error;
+	}
+	goto exit_label;
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index 93a1741..93e57cf 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -844,7 +844,7 @@ quant_fsdither(TIFF* in, TIFF* out)
+	outline = (unsigned char *) _TIFFmalloc(TIFFScanlineSize(out));
+
+	GetInputLine(in, 0, goto bad);		/* get first line */
+-	for (i = 1; i <= imagelength; ++i) {
++	for (i = 0; i <= imagelength; ++i) {
+		SWAP(short *, thisline, nextline);
+		lastline = (i >= imax);
+		if (i <= imax)
+@@ -915,7 +915,7 @@ quant_fsdither(TIFF* in, TIFF* out)
+				nextptr += 3;
+			}
+		}
+-		if (TIFFWriteScanline(out, outline, i-1, 0) < 0)
++		if (TIFFWriteScanline(out, outline, i, 0) < 0)
+			break;
+	}
+ bad:
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0002.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0002.patch
new file mode 100644
index 0000000000..c28969e1d8
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0002.patch
@@ -0,0 +1,31 @@
+From ce46f002eca4148497363f80fab33f9396bcbeda Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 24 May 2025 21:25:16 -0700
+Subject: [PATCH] Fix tiffmedian bug #707
+
+CVE: CVE-2025-8176
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/ce46f002eca4148497363f80fab33f9396bcbeda]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiffmedian.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index 93e57cf..a0b4b5d 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -385,7 +385,10 @@ get_histogram(TIFF* in, Colorbox* box)
+	}
+	for (i = 0; i < imagelength; i++) {
+		if (TIFFReadScanline(in, inputline, i, 0) <= 0)
+-			break;
++                {
++                    fprintf(stderr, "Error reading scanline\n");
++                    exit(EXIT_FAILURE);
++                }
+		inptr = inputline;
+		for (j = imagewidth; j-- > 0;) {
+			red = (*inptr++) & 0xff >> COLOR_SHIFT;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0003.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0003.patch
new file mode 100644
index 0000000000..b5ee36c5b8
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0003.patch
@@ -0,0 +1,28 @@
+From ecc4ddbf1f0fed7957d1e20361e37f01907898e0 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 24 May 2025 21:38:09 -0700
+Subject: [PATCH] conflict resolution
+
+CVE: CVE-2025-8176
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/ecc4ddbf1f0fed7957d1e20361e37f01907898e0]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiffmedian.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index a0b4b5d..ca1c51f 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -847,7 +847,7 @@ quant_fsdither(TIFF* in, TIFF* out)
+	outline = (unsigned char *) _TIFFmalloc(TIFFScanlineSize(out));
+
+	GetInputLine(in, 0, goto bad);		/* get first line */
+-	for (i = 0; i <= imagelength; ++i) {
++	for (i = 0; i < imagelength; ++i) {
+		SWAP(short *, thisline, nextline);
+		lastline = (i >= imax);
+		if (i <= imax)
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 5ec7b20e61..6ff31bd0bb 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -55,6 +55,9 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-6277-4.patch \
            file://CVE-2024-7006.patch \
            file://CVE-2023-3164.patch \
+           file://CVE-2025-8176-0001.patch \
+           file://CVE-2025-8176-0002.patch \
+           file://CVE-2025-8176-0003.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.40.0


