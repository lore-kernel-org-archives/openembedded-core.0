Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EEACA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 13:38:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.39807.1756993107871084273
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 06:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DXgRYi9C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1342749dfd=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58491rm42471678
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Sep 2025 06:38:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=8MoQ+DajsUJs8lM713pm
	6iSTDCOk0Tr/cfLH5UzMn7Y=; b=DXgRYi9CrUUj22ILeO6Xf0Ss77zHuf9hrVzg
	nc8DWmUzb/ulOFV9E54gF2f4ss2zJZORPKjO0xw8NhbdkxshJDEEeda0vEAJG70w
	PqEprYUAWisYH4lMshWUTWAAXRxHB3uwiX3xLPbzKS/XdbDFIh2q8THpzA4GSHAN
	RjHill9CiVFdY3FnmVBqLJ4UIujMBGN+zQU9DEeiaVjV1+dtgl6ExrvutkU85nT9
	jHDbMl/jUK79HBqA190ukGSGCZmzKDqETMhOI6323rvuxWnKRDsVlHLWQOESRr/B
	xV1dvkGxtq2tY+11bS2yVP8vAGX81XVp6NkKsoz00/Tfa8xKaw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7sb07kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 06:38:27 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 4 Sep 2025 06:36:46 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 4 Sep 2025 06:36:44 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/3] ffmpeg: fix CVE-2025-7700
Date: Thu, 4 Sep 2025 19:08:10 +0530
Message-ID: <20250904133812.2881582-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDEzMyBTYWx0ZWRfXyAyeydmtBXBx
 DDd7sMicCCVkNkDpmo3OTQQ3giYK7IWR0Wl/rBUjYq+glN8DkC2iWS9vALoOSOlY5q6g+sKpqB+
 yGvvy/PrmuiEjPDBLXxO7GhrH5a2NU2clTawSqgn26PJ+rFvZsMLBTQQ+FKn00EbEFYQIkBGXJ/
 I1ar/mbXOHgXDgGS35YEvGy0dBT+gaJFeqUvZj/QApI/e0cnyr0J3ck1/AT8nusK2g1tPltCjYe
 aMLztsh9ZrCkJ6Crzd6Cm+LHdRmeWEjqDJaWlt0lRoeUqw2RwKaekExksJAP0/mWnOf/bsmlyHy
 eOrtS2g3oisqx6rae7vKKmm+WJc63VuLpFDByF7p4GvABzDWDdjWsB8K7Z7cAE=
X-Proofpoint-GUID: NDUwspSpJCc9LORj7ZFg_OAQI2BNiPUe
X-Authority-Analysis: v=2.4 cv=M5BNKzws c=1 sm=1 tr=0 ts=68b99653 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=oBlijfwZ13m-I4tPmekA:9 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NDUwspSpJCc9LORj7ZFg_OAQI2BNiPUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 13:38:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222928

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
index 0000000000..f61fab7bae
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
+UPstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff/aad4b59cfee1f0a3cf02f5e2b1f291ce013bf27e]
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


