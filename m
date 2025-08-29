Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FCDCA0FF7
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 09:30:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9585.1756459846825509518
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 02:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qFbZ8oN1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1336891142=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57T8jnlA716146
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 09:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=60pgZG/LiIbraQvuooJf
	0Ty6vIPZWYUyR8JnKJkYt44=; b=qFbZ8oN1mgBthMMYh3igeV5pv+RiVr05k9ET
	Y7uJYld6yaJL0re3jwnCCjTeEqpkd6KQHbZhIy6XEezp9kcCevL0c3KQJl88vwdh
	NtFoy5cedCZ/J9xKSs/xMiIYQ0QF/jxTTyT9rGXYfq6RMB4VdXvdGhnd9pFdNNfX
	yTy9dNNHxzRXMygtGvDjHCyuG3rSJQT5sHbfSFWeAbfQIHHSCRty4kXaw2DCijlj
	q8VAYmHzR5HRipEOsSrP/HxWrSG5JZG7DDEVY+PjFGtjvDk62AxQ3DdlLWKX7P88
	AEOL3pY99xuOA2e+Ah0hU94SwpRX7bZb3UaHgPh1UxOfEZCILQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q2v1ex2j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 09:30:44 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 29 Aug 2025 02:30:41 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 1/1] tiff: Security fix for CVE-2024-13978, CVE-2025-8176, CVE-2025-8177
Date: Fri, 29 Aug 2025 15:00:06 +0530
Message-ID: <20250829093006.3949035-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-ORIG-GUID: 532gE3HFU_t9Hk1DUSO0WzvdJ8dWtrJx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI5MDA3OSBTYWx0ZWRfX8sUNoRBXB4JP
 yFM7GqC0kFI3OmPhaldfkV4dwzR1XUNE/Z1z9CtGS3UTHYvCGvaHK9bxpdwcwk2BVDnR2d0DIkg
 wBWrmzFtPEfuWwwHT4F7ksyebTpN89s36goWT13AC2A70d3ZNm7ZbCcwDmal4ZHA9vsq+JQvC+P
 yA3bW6PUJO4ChYqWyFx6cv701ZU0pxRryHMW2KEkPw+O+la+LWwnMsuzGryR4NT/MgnH0iCB7g6
 KF8cjf8XcRUS6gHGJGLrp4xZiuW68GUO5nXLOSEaaOfjgUZ+Jd7Z1NnCclt0CQirUg+sflDK0fm
 dZHGryyC2DBoN95JCBMFqi6rDMHcvoUFClMVw9TwkIz5QBxoMbKqKQHSeaP+a8=
X-Authority-Analysis: v=2.4 cv=T5GMT+KQ c=1 sm=1 tr=0 ts=68b17344 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=2OwXVqhp2XgA:10 a=p0WdMEafAAAA:8 a=Qs8GJauRAAAA:8
 a=fk1lIlRQAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=5vSyN_hxAAAA:8 a=Z8L5J7B3ydqLO9vj1f8A:9 a=TAmfe1b_ajlIZlq0:21
 a=-MsOl3yrPmtpHepMbiy1:22 a=U75ogvRika4pmaD_UPO0:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1zBLIHEOKY9YwKILsQtb:22
X-Proofpoint-GUID: 532gE3HFU_t9Hk1DUSO0WzvdJ8dWtrJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 09:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222609

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/7be20ccaab97455f192de0ac561ceda7cd9e12d1, https://gitlab.com/libtiff/libtiff/-/commit/2ebfffb0e8836bfb1cd7d85c059cd285c59761a4, https://gitlab.com/libtiff/libtiff/-/commit/3994cf3b3bc6b54c32f240ca5a412cffa11633fa, https://gitlab.com/libtiff/libtiff/-/commit/ce46f002eca4148497363f80fab33f9396bcbeda, https://gitlab.com/libtiff/libtiff/-/commit/ecc4ddbf1f0fed7957d1e20361e37f01907898e0, https://gitlab.com/libtiff/libtiff/-/commit/75d8eca6f106c01aadf76b8500a7d062b12f2d82, https://gitlab.com/libtiff/libtiff/-/commit/e8c9d6c616b19438695fd829e58ae4fde5bfbc22]

CVE's Fixed:
CVE-2024-13978 libtiff: LibTIFF Null Pointer Dereference
CVE-2025-8176 libtiff: LibTIFF Use-After-Free Vulnerability
CVE-2025-8177 libtiff: LibTIFF Buffer Overflow

(From OE-Core rev: 16d8a873c57b174e4d6581b58d890f2157aa2f2c)

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../libtiff/tiff/CVE-2024-13978_1.patch       | 77 +++++++++++++++++++
 .../libtiff/tiff/CVE-2024-13978_2.patch       | 45 +++++++++++
 .../libtiff/tiff/CVE-2025-8176_1.patch        | 61 +++++++++++++++
 .../libtiff/tiff/CVE-2025-8176_2.patch        | 31 ++++++++
 .../libtiff/tiff/CVE-2025-8176_3.patch        | 28 +++++++
 .../libtiff/tiff/CVE-2025-8177_1.patch        | 36 +++++++++
 .../libtiff/tiff/CVE-2025-8177_2.patch        | 29 +++++++
 meta/recipes-multimedia/libtiff/tiff_4.7.0.bb | 10 ++-
 8 files changed, 316 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_3.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_2.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_1.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_1.patch
new file mode 100644
index 0000000000..8bb7cf280d
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_1.patch
@@ -0,0 +1,77 @@
+From 6dd7006103f9612fbd22e9c7c1b93d16691370a4 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Fri, 27 Sep 2024 11:21:57 -0700
+Subject: [PATCH 1/7] Fix issue #649 in fax2ps caused by regression in commit
+ https://gitlab.com/libtiff/libtiff/-/commit/28c38d648b64a66c3218778c4745225fe3e3a06d
+ where TIFFTAG_FAXFILLFUNC is being used rather than an output buffer.
+
+CVE: CVE-2024-13978
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/7be20ccaab97455f192de0ac561ceda7cd9e12d1]
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ libtiff/tif_read.c | 21 ++++++++++++++++-----
+ 1 file changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/libtiff/tif_read.c b/libtiff/tif_read.c
+index 7efab59..964f119 100644
+--- a/libtiff/tif_read.c
++++ b/libtiff/tif_read.c
+@@ -466,7 +466,9 @@ int TIFFReadScanline(TIFF *tif, void *buf, uint32_t row, uint16_t sample)
+     }
+     else
+     {
+-        memset(buf, 0, (size_t)tif->tif_scanlinesize);
++        /* See TIFFReadEncodedStrip comment regarding TIFFTAG_FAXFILLFUNC. */
++        if (buf)
++            memset(buf, 0, (size_t)tif->tif_scanlinesize);
+     }
+     return (e > 0 ? 1 : -1);
+ }
+@@ -554,7 +556,10 @@ tmsize_t TIFFReadEncodedStrip(TIFF *tif, uint32_t strip, void *buf,
+         stripsize = size;
+     if (!TIFFFillStrip(tif, strip))
+     {
+-        memset(buf, 0, (size_t)stripsize);
++        /* The output buf may be NULL, in particular if TIFFTAG_FAXFILLFUNC
++           is being used. Thus, memset must be conditional on buf not NULL. */
++        if (buf)
++            memset(buf, 0, (size_t)stripsize);
+         return ((tmsize_t)(-1));
+     }
+     if ((*tif->tif_decodestrip)(tif, buf, stripsize, plane) <= 0)
+@@ -976,7 +981,9 @@ tmsize_t TIFFReadEncodedTile(TIFF *tif, uint32_t tile, void *buf, tmsize_t size)
+         size = tilesize;
+     if (!TIFFFillTile(tif, tile))
+     {
+-        memset(buf, 0, (size_t)size);
++        /* See TIFFReadEncodedStrip comment regarding TIFFTAG_FAXFILLFUNC. */
++        if (buf)
++            memset(buf, 0, (size_t)size);
+         return ((tmsize_t)(-1));
+     }
+     else if ((*tif->tif_decodetile)(tif, (uint8_t *)buf, size,
+@@ -1569,7 +1576,9 @@ int TIFFReadFromUserBuffer(TIFF *tif, uint32_t strile, void *inbuf,
+         if (!TIFFStartTile(tif, strile))
+         {
+             ret = 0;
+-            memset(outbuf, 0, (size_t)outsize);
++            /* See related TIFFReadEncodedStrip comment. */
++            if (outbuf)
++                memset(outbuf, 0, (size_t)outsize);
+         }
+         else if (!(*tif->tif_decodetile)(
+                      tif, (uint8_t *)outbuf, outsize,
+@@ -1596,7 +1605,9 @@ int TIFFReadFromUserBuffer(TIFF *tif, uint32_t strile, void *inbuf,
+             if (!TIFFStartStrip(tif, strile))
+             {
+                 ret = 0;
+-                memset(outbuf, 0, (size_t)outsize);
++                /* See related TIFFReadEncodedStrip comment. */
++                if (outbuf)
++                    memset(outbuf, 0, (size_t)outsize);
+             }
+             else if (!(*tif->tif_decodestrip)(
+                          tif, (uint8_t *)outbuf, outsize,
+-- 
+2.47.3
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_2.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_2.patch
new file mode 100644
index 0000000000..a022fd41e2
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_2.patch
@@ -0,0 +1,45 @@
+From a80b9eb70a8137e2571b2f32bd05d1a22a5603c4 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 5 Oct 2024 09:45:30 -0700
+Subject: [PATCH 2/7] Check TIFFTAG_TILELENGTH and TIFFTAGTILEWIDTH for valid
+ input, addresses issue #650
+
+CVE: CVE-2024-13978
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/2ebfffb0e8836bfb1cd7d85c059cd285c59761a4]
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ tools/tiff2pdf.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/tools/tiff2pdf.c b/tools/tiff2pdf.c
+index 6dfc239..2010fee 100644
+--- a/tools/tiff2pdf.c
++++ b/tools/tiff2pdf.c
+@@ -1371,8 +1371,24 @@ void t2p_read_tiff_init(T2P *t2p, TIFF *input)
+             t2p->pdf_xrefcount += (t2p->tiff_tiles[i].tiles_tilecount - 1) * 2;
+             TIFFGetField(input, TIFFTAG_TILEWIDTH,
+                          &(t2p->tiff_tiles[i].tiles_tilewidth));
++            if (t2p->tiff_tiles[i].tiles_tilewidth < 1)
++            {
++                TIFFError(TIFF2PDF_MODULE, "Invalid tile width (%d), %s",
++                          t2p->tiff_tiles[i].tiles_tilewidth,
++                          TIFFFileName(input));
++                t2p->t2p_error = T2P_ERR_ERROR;
++                return;
++            }
+             TIFFGetField(input, TIFFTAG_TILELENGTH,
+                          &(t2p->tiff_tiles[i].tiles_tilelength));
++            if (t2p->tiff_tiles[i].tiles_tilelength < 1)
++            {
++                TIFFError(TIFF2PDF_MODULE, "Invalid tile length (%d), %s",
++                          t2p->tiff_tiles[i].tiles_tilelength,
++                          TIFFFileName(input));
++                t2p->t2p_error = T2P_ERR_ERROR;
++                return;
++            }
+             t2p->tiff_tiles[i].tiles_tiles = (T2P_TILE *)_TIFFmalloc(
+                 TIFFSafeMultiply(tmsize_t, t2p->tiff_tiles[i].tiles_tilecount,
+                                  sizeof(T2P_TILE)));
+-- 
+2.47.3
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_1.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_1.patch
new file mode 100644
index 0000000000..14d3cb445e
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_1.patch
@@ -0,0 +1,61 @@
+From ed35364de1e3ad444e6f954514ee68eb9be496d2 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Mon, 19 May 2025 10:53:30 -0700
+Subject: [PATCH 3/7] Don't skip the first line of the input image. Addresses
+ issue #703
+
+CVE: CVE-2025-8176
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/3994cf3b3bc6b54c32f240ca5a412cffa11633fa]
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ tools/tiffdither.c | 4 ++--
+ tools/tiffmedian.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tools/tiffdither.c b/tools/tiffdither.c
+index 714fe03..bfed6df 100644
+--- a/tools/tiffdither.c
++++ b/tools/tiffdither.c
+@@ -98,7 +98,7 @@ static int fsdither(TIFF *in, TIFF *out)
+     nextptr = nextline;
+     for (j = 0; j < imagewidth; ++j)
+         *nextptr++ = *inptr++;
+-    for (i = 1; i < imagelength; ++i)
++    for (i = 0; i < imagelength; ++i)
+     {
+         tmpptr = thisline;
+         thisline = nextline;
+@@ -146,7 +146,7 @@ static int fsdither(TIFF *in, TIFF *out)
+                     nextptr[0] += v / 16;
+             }
+         }
+-        if (TIFFWriteScanline(out, outline, i - 1, 0) < 0)
++        if (TIFFWriteScanline(out, outline, i, 0) < 0)
+             goto skip_on_error;
+     }
+     goto exit_label;
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index 02b0bc2..f6cf26c 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -917,7 +917,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
+     outline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
+ 
+     GetInputLine(in, 0, goto bad); /* get first line */
+-    for (i = 1; i <= imagelength; ++i)
++    for (i = 0; i <= imagelength; ++i)
+     {
+         SWAP(short *, thisline, nextline);
+         lastline = (i >= imax);
+@@ -997,7 +997,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
+                 nextptr += 3;
+             }
+         }
+-        if (TIFFWriteScanline(out, outline, i - 1, 0) < 0)
++        if (TIFFWriteScanline(out, outline, i, 0) < 0)
+             break;
+     }
+ bad:
+-- 
+2.47.3
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_2.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_2.patch
new file mode 100644
index 0000000000..74cf5ae277
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_2.patch
@@ -0,0 +1,31 @@
+From c090daf37e7f2ad09ec7e9cfabd1c5fde3dee6eb Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 24 May 2025 21:25:16 -0700
+Subject: [PATCH 4/7] Fix tiffmedian bug #707
+
+CVE: CVE-2025-8176
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/ce46f002eca4148497363f80fab33f9396bcbeda]
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ tools/tiffmedian.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index f6cf26c..8c9978b 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -414,7 +414,10 @@ static void get_histogram(TIFF *in, Colorbox *box)
+     for (i = 0; i < imagelength; i++)
+     {
+         if (TIFFReadScanline(in, inputline, i, 0) <= 0)
+-            break;
++        {
++            fprintf(stderr, "Error reading scanline\n");
++            exit(EXIT_FAILURE);
++        }
+         inptr = inputline;
+         for (j = imagewidth; j-- > 0;)
+         {
+-- 
+2.47.3
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_3.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_3.patch
new file mode 100644
index 0000000000..e0f41f8d71
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_3.patch
@@ -0,0 +1,28 @@
+From bd645550275963797343e8e91a9a8fee318428e0 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 24 May 2025 21:38:09 -0700
+Subject: [PATCH 5/7] conflict resolution
+
+CVE: CVE-2025-8176
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/ecc4ddbf1f0fed7957d1e20361e37f01907898e0]
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ tools/tiffmedian.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index 8c9978b..47e0524 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -920,7 +920,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
+     outline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
+ 
+     GetInputLine(in, 0, goto bad); /* get first line */
+-    for (i = 0; i <= imagelength; ++i)
++    for (i = 0; i < imagelength; ++i)
+     {
+         SWAP(short *, thisline, nextline);
+         lastline = (i >= imax);
+-- 
+2.47.3
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_1.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_1.patch
new file mode 100644
index 0000000000..9437ffcc20
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_1.patch
@@ -0,0 +1,36 @@
+From 01bf5ba7f4a27c5e28ce467a66b13e066556e545 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Thu, 19 Jun 2025 11:51:33 -0700
+Subject: [PATCH 6/7] Fix for thumbnail issue #715
+
+CVE: CVE-2025-8177
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/75d8eca6f106c01aadf76b8500a7d062b12f2d82]
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ tools/thumbnail.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/tools/thumbnail.c b/tools/thumbnail.c
+index b4cb114..432d172 100644
+--- a/tools/thumbnail.c
++++ b/tools/thumbnail.c
+@@ -620,7 +620,15 @@ static void setrow(uint8_t *row, uint32_t nrows, const uint8_t *rows[])
+             }
+             acc += bits[*src & mask1];
+         }
+-        *row++ = cmap[(255 * acc) / area];
++        if (255 * acc / area < 256)
++        {
++            *row++ = cmap[(255 * acc) / area];
++        }
++        else
++        {
++            fprintf(stderr, "acc=%d, area=%d\n", acc, area);
++            row++;
++        }
+     }
+ }
+ 
+-- 
+2.47.3
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_2.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_2.patch
new file mode 100644
index 0000000000..356e3ba402
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_2.patch
@@ -0,0 +1,29 @@
+From c3ad38afb9986b9ddcd7d95367ded152488260cd Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Mon, 23 Jun 2025 10:09:07 -0700
+Subject: [PATCH 7/7] set a default value - assumes cmap[0] was not, itself,
+ uninitialized
+
+CVE: CVE-2025-8177
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/e8c9d6c616b19438695fd829e58ae4fde5bfbc22]
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ tools/thumbnail.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/thumbnail.c b/tools/thumbnail.c
+index 432d172..110ea42 100644
+--- a/tools/thumbnail.c
++++ b/tools/thumbnail.c
+@@ -627,7 +627,7 @@ static void setrow(uint8_t *row, uint32_t nrows, const uint8_t *rows[])
+         else
+         {
+             fprintf(stderr, "acc=%d, area=%d\n", acc, area);
+-            row++;
++            *row++ = cmap[0];
+         }
+     }
+ }
+-- 
+2.47.3
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
index 5a6939d584..26e3811ff8 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
@@ -8,7 +8,15 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a3e32d664d6db1386b4689c8121531c3"
 
 CVE_PRODUCT = "libtiff"
 
-SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz"
+SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
+	   file://CVE-2024-13978_1.patch \
+	   file://CVE-2024-13978_2.patch \
+	   file://CVE-2025-8176_1.patch \
+	   file://CVE-2025-8176_2.patch \
+	   file://CVE-2025-8176_3.patch \
+	   file://CVE-2025-8177_1.patch \
+	   file://CVE-2025-8177_2.patch \
+	   "
 
 SRC_URI[sha256sum] = "67160e3457365ab96c5b3286a0903aa6e78bdc44c4bc737d2e486bcecb6ba976"
 
-- 
2.40.0


