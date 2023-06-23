Return-Path: <nat.bailey@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0AAEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 17:49:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4962.1687542540859711255
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 10:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dw4JOydD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55381c39fc=nat.bailey@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35NHInYO030369
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 10:49:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=0gUJe
	IwxrygMyIEqMqwirhrE8Yp5Jg202hx4wlALfBw=; b=dw4JOydDp5ef2hSsF+yYP
	gBw1wW5RU4HvEBOdfS0YR10OwK46yOnJEq3U1cCZxXbH36H69eNPJZEaDCI4DCqW
	BaxdX4I42PYybxMqK+qtDZ4ZtctJ70cjTBz23T4dJD2w7Wnxpn30P/GHqCtNItuP
	+Vh0cVWAbwIFInnTtOEf1f8P8jnDzUhkeJN8mvK9U78lJcw6KMReHhD6BAYUd3jU
	4QluULaHOPpLgPLUxpi8saPBG62+q/1Nn9k8SCz2+PhSLnbcg8/AEkGh8Em1S5pp
	qxIK8fqR2A93SAvQeIPgBtK8myuT6UFpKJxgiJzBvhoMrgRfcUrWbg8chOVNIHZX
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rcy540t1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 10:49:00 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 23 Jun 2023 10:48:59 -0700
Received: from ala-lpggp2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Fri, 23 Jun 2023 10:48:59 -0700
From: Natasha Bailey <nat.bailey@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] tiff: backport a fix for CVE-2023-26965
Date: Fri, 23 Jun 2023 10:47:44 -0700
Message-ID: <20230623174744.54981-1-nat.bailey@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: l_L5eaBBQDBu0vQviaJ0Lv20dlyA7gXT
X-Proofpoint-GUID: l_L5eaBBQDBu0vQviaJ0Lv20dlyA7gXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_10,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=803
 suspectscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306230159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 17:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183350

Fixes a bug where a buffer was used after a potential reallocation.

Signed-off-by: Natasha Bailey <nat.bailey@windriver.com>
---
 .../libtiff/files/CVE-2023-26965.patch        | 99 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.5.0.bb |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch
new file mode 100644
index 0000000000..5fdc1ed013
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch
@@ -0,0 +1,99 @@
+From ec8ef90c1f573c9eb1f17d6a056aa0015f184acf Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Tue, 14 Feb 2023 20:43:43 +0100
+Subject: [PATCH] tiffcrop: Do not reuse input buffer for subsequent images.
+ Fix issue 527
+
+Reuse of read_buff within loadImage() from previous image is quite unsafe, because other functions (like rotateImage() etc.) reallocate that buffer with different size without updating the local prev_readsize value.
+
+Closes #527
+
+CVE: CVE-2023-26965
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/ec8ef90c1f573c9eb1f17d6a056aa0015f184acf]
+Signed-off-by: Natasha Bailey <nat.bailey@windriver.com>
+---
+ tools/tiffcrop.c | 47 +++++++++++++----------------------------------
+ 1 file changed, 13 insertions(+), 34 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index d7ad5ca8..d3e11ba2 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -6771,9 +6771,7 @@ static int loadImage(TIFF *in, struct image_data *image, struct dump_opts *dump,
+     uint32_t tw = 0, tl = 0; /* Tile width and length */
+     tmsize_t tile_rowsize = 0;
+     unsigned char *read_buff = NULL;
+-    unsigned char *new_buff = NULL;
+     int readunit = 0;
+-    static tmsize_t prev_readsize = 0;
+ 
+     TIFFGetFieldDefaulted(in, TIFFTAG_BITSPERSAMPLE, &bps);
+     TIFFGetFieldDefaulted(in, TIFFTAG_SAMPLESPERPIXEL, &spp);
+@@ -7097,43 +7095,25 @@ static int loadImage(TIFF *in, struct image_data *image, struct dump_opts *dump,
+     }
+ 
+     read_buff = *read_ptr;
+-    /* +3 : add a few guard bytes since reverseSamples16bits() can read a bit */
+-    /* outside buffer */
+-    if (!read_buff)
++    /* +3 : add a few guard bytes since reverseSamples16bits() can read a bit
++     * outside buffer */
++    /* Reuse of read_buff from previous image is quite unsafe, because other
++     * functions (like rotateImage() etc.) reallocate that buffer with different
++     * size without updating the local prev_readsize value. */
++    if (read_buff)
+     {
+-        if (buffsize > 0xFFFFFFFFU - 3)
+-        {
+-            TIFFError("loadImage", "Unable to allocate/reallocate read buffer");
+-            return (-1);
+-        }
+-        read_buff =
+-            (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES);
++        _TIFFfree(read_buff);
+     }
+-    else
++    if (buffsize > 0xFFFFFFFFU - 3)
+     {
+-        if (prev_readsize < buffsize)
+-        {
+-            if (buffsize > 0xFFFFFFFFU - 3)
+-            {
+-                TIFFError("loadImage",
+-                          "Unable to allocate/reallocate read buffer");
+-                return (-1);
+-            }
+-            new_buff =
+-                _TIFFrealloc(read_buff, buffsize + NUM_BUFF_OVERSIZE_BYTES);
+-            if (!new_buff)
+-            {
+-                free(read_buff);
+-                read_buff = (unsigned char *)limitMalloc(
+-                    buffsize + NUM_BUFF_OVERSIZE_BYTES);
+-            }
+-            else
+-                read_buff = new_buff;
+-        }
++        TIFFError("loadImage", "Required read buffer size too large");
++        return (-1);
+     }
++    read_buff =
++        (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES);
+     if (!read_buff)
+     {
+-        TIFFError("loadImage", "Unable to allocate/reallocate read buffer");
++        TIFFError("loadImage", "Unable to allocate read buffer");
+         return (-1);
+     }
+ 
+@@ -7141,7 +7121,6 @@ static int loadImage(TIFF *in, struct image_data *image, struct dump_opts *dump,
+     read_buff[buffsize + 1] = 0;
+     read_buff[buffsize + 2] = 0;
+ 
+-    prev_readsize = buffsize;
+     *read_ptr = read_buff;
+ 
+     /* N.B. The read functions used copy separate plane data into a buffer as
+-- 
+2.39.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
index ca4a3eff91..2bde8fe9d6 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
@@ -11,6 +11,7 @@ CVE_PRODUCT = "libtiff"
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-48281.patch \
            file://CVE-2023-2731.patch \
+           file://CVE-2023-26965.patch \
 "
 
 SRC_URI[sha256sum] = "c7a1d9296649233979fa3eacffef3fa024d73d05d589cb622727b5b08c423464"
-- 
2.39.0


