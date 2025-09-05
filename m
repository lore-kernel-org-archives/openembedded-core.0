Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F554CA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 05:41:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14515.1757050862328904666
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 22:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mzMKqyFi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1343f3b5a0=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5855YsLk316537
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Sep 2025 05:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=MV69C1uc5Fm/YV5IQckn
	DOSgPiya1CWdY6SmFehY3ac=; b=mzMKqyFirsSgRNZB8bJPZ6R9IOm8L/F5UMTQ
	AvPnJ5VflPcWJQNKpUl/rRIWdIJq8g820Yoien/Fvlxow0JOt+idEa7EO/7gZfIS
	TiItE48ZRTfCm5zX0GA/l8dBz6TNgPrdy9DBp8x1HoG44vFhZEU2d6pKiqSlRuTg
	NXmbGxzgl8YWJOLNEWWuMg23T7T0YKigsDuE/JXQPrEesTWQsfpVoTFalR81umD2
	S/DBDUCLT6JDSVNKzUSmjwGRYgbkcQbL7v9TfHWt7PdXGP1YNIek5egbzO9cpEAr
	KnngaiWn//iHGZ3UwQyFMr8Myb2Wo4mCZFTso0F+lY1ErEOYzQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7p7hcc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 05:41:01 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 4 Sep 2025 22:40:56 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 4 Sep 2025 22:40:55 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/3] ffmpeg: fix CVE-2025-7700
Date: Fri, 5 Sep 2025 11:10:43 +0530
Message-ID: <20250905054045.1220093-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDA1MyBTYWx0ZWRfX8NCro2EvAZjX
 5rlB6hkiZYtKHX2KlKp08HLdw8+JCbl9vSCvWcdWvcZVYUYM32VblRPz1uW2VaZ3UHYxEIwWmEt
 mxZSswmNn8T9n3SVWywIxIhFxIroI6MMcf4ept39dhQF9J28LVF/ePQ/uDHbkampFCiWU2h+Av+
 PAIz+6qz3VZ02WXfXCBXaGkySplSYZQUjt/3nyCtBqYgzlZ3l+UUeEQbPBC4AUHVaKwKjcNXhF/
 scy+x7821zDbHAm9Mn9QJtOfGvzPTg2mtw+5Fz/g/mRzIzXdAnUhiq26RGgBNpY1pMHN56mfy83
 1sQuiCUl7mXsxaKBNfWqL8XSIoA8sqWIVbe1x9VNQMMDOxOb1efEJ4xMrX1La4=
X-Proofpoint-GUID: sRMj_fd8sqetSHsVvV73YkxlcclJEpMU
X-Proofpoint-ORIG-GUID: sRMj_fd8sqetSHsVvV73YkxlcclJEpMU
X-Authority-Analysis: v=2.4 cv=faOty1QF c=1 sm=1 tr=0 ts=68ba77ed cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=oBlijfwZ13m-I4tPmekA:9 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 05:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222972

From: Archana Polampalli <archana.polampalli@windriver.com>

NULL Pointer Dereference in FFmpeg ALS Decoder (libavcodec/alsdec.c)

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-7700.patch         | 52 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-7700.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-7700.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-7700.patch
new file mode 100644
index 0000000000..758e38a0b1
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-7700.patch
@@ -0,0 +1,52 @@
+From aad4b59cfee1f0a3cf02f5e2b1f291ce013bf27e Mon Sep 17 00:00:00 2001
+From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
+Date: Thu, 10 Jul 2025 16:26:39 +0000
+Subject: [PATCH] libavcodec/alsdec.c: Add check for av_malloc_array() and
+ av_calloc()
+
+Add check for the return value of av_malloc_array() and av_calloc()
+to avoid potential NULL pointer dereference.
+
+Fixes: dcfd24b10c ("avcodec/alsdec: Implement floating point sample data decoding")
+Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 35a6de137a39f274d5e01ed0e0e6c4f04d0aaf07)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2025-7700
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff/aad4b59cfee1f0a3cf02f5e2b1f291ce013bf27e]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/alsdec.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/alsdec.c b/libavcodec/alsdec.c
+index 9c3be4e..ba85973 100644
+--- a/libavcodec/alsdec.c
++++ b/libavcodec/alsdec.c
+@@ -2115,8 +2115,8 @@ static av_cold int decode_init(AVCodecContext *avctx)
+         ctx->nbits  = av_malloc_array(ctx->cur_frame_length, sizeof(*ctx->nbits));
+         ctx->mlz    = av_mallocz(sizeof(*ctx->mlz));
+
+-        if (!ctx->mlz || !ctx->acf || !ctx->shift_value || !ctx->last_shift_value
+-            || !ctx->last_acf_mantissa || !ctx->raw_mantissa) {
++        if (!ctx->larray || !ctx->nbits || !ctx->mlz || !ctx->acf || !ctx->shift_value
++            || !ctx->last_shift_value || !ctx->last_acf_mantissa || !ctx->raw_mantissa) {
+             av_log(avctx, AV_LOG_ERROR, "Allocating buffer memory failed.\n");
+             ret = AVERROR(ENOMEM);
+             goto fail;
+@@ -2127,6 +2127,10 @@ static av_cold int decode_init(AVCodecContext *avctx)
+
+         for (c = 0; c < avctx->channels; ++c) {
+             ctx->raw_mantissa[c] = av_calloc(ctx->cur_frame_length, sizeof(**ctx->raw_mantissa));
++            if (!ctx->raw_mantissa[c]) {
++                av_log(avctx, AV_LOG_ERROR, "Allocating buffer memory failed.\n");
++                return AVERROR(ENOMEM);
++	    }
+         }
+     }
+
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index 8da11f196d..f205c4a5db 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -48,6 +48,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2025-25473.patch \
            file://CVE-2025-22919.patch \
            file://CVE-2025-22921.patch \
+           file://CVE-2025-7700.patch \
           "
 
 SRC_URI[sha256sum] = "04c70c377de233a4b217c2fdf76b19aeb225a287daeb2348bccd978c47b1a1db"
-- 
2.40.0


