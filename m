Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9E0C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 15:08:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14318.1672844878598449781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 07:07:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oZAvCA8z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03685ce3be=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 304DvuNt024976
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jan 2023 07:07:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=bppWPncNEHQ6GCgjspW1f3oNl2SKqnReSEP29DopQbM=;
 b=oZAvCA8zveNF28GKt4hu7kImDuktNkQtaKQNa850ODNk7+fBsP3tOH80jWYaq63QAeaW
 J7QOs0MjwE2z4E/gLp9zgmnE8HcBbhQ3hFStgtDU9mCceahdjF1cqQrMMO45ZPSZwezI
 IMwPbgNOvF5gRbosck5BZGPJojWvFt60gBF3EPzomIgqWHiM0t3aIxlQ63285UPQTvZE
 tZoQ9IRnRWd/SPeNgtuHdPdulT1pET6m2r1Zn8PurLR7bULm2njXUAlsfzhaXu69NcBu
 fT4rI3hl8i3N+/0BAJM7DGeZ3g/caCYbN7Or+pcK8++9pdjIL3p1hHzonyc6ThzuN/61 Bw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mth87te8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 07:07:58 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 4 Jan 2023 07:07:57 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 4 Jan 2023 07:07:55 -0800
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/1] ffmpeg: fix for CVE-2022-3109
Date: Wed, 4 Jan 2023 15:06:55 +0000
Message-ID: <20230104150655.2630360-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ut4nUa1C36X7OO_6K5XSTG4LLp3KERCs
X-Proofpoint-GUID: ut4nUa1C36X7OO_6K5XSTG4LLp3KERCs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 15:08:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175484

An issue was discovered in the FFmpeg package, where vp3_decode_frame in libavcodec/vp3.c lacks check of
the return value of av_malloc() and will cause a null pointer dereference, impacting availability.

CVE: CVE-2022-3109

Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568]

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 ...-vp3-Add-missing-check-for-av_malloc.patch | 44 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
new file mode 100644
index 0000000000..94858a6cdd
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
@@ -0,0 +1,44 @@
+From 656cb0450aeb73b25d7d26980af342b37ac4c568 Mon Sep 17 00:00:00 2001
+From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
+Date: Tue, 15 Feb 2022 17:58:08 +0800
+Subject: [PATCH] avcodec/vp3: Add missing check for av_malloc
+
+Since the av_malloc() may fail and return NULL pointer,
+it is needed that the 's->edge_emu_buffer' should be checked
+whether the new allocation is success.
+
+Fixes: d14723861b ("VP3: fix decoding of videos with stride > 2048")
+Reviewed-by: Peter Ross <pross@xvid.org>
+Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
+
+CVE: CVE-2022-3109
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ libavcodec/vp3.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/libavcodec/vp3.c b/libavcodec/vp3.c
+index e9ab54d736..e2418eb6fa 100644
+--- a/libavcodec/vp3.c
++++ b/libavcodec/vp3.c
+@@ -2679,8 +2679,13 @@ static int vp3_decode_frame(AVCodecContext *avctx,
+                                         AV_GET_BUFFER_FLAG_REF)) < 0)
+         goto error;
+ 
+-    if (!s->edge_emu_buffer)
++    if (!s->edge_emu_buffer) {
+         s->edge_emu_buffer = av_malloc(9 * FFABS(s->current_frame.f->linesize[0]));
++        if (!s->edge_emu_buffer) {
++            ret = AVERROR(ENOMEM);
++            goto error;
++        }
++    }
+ 
+     if (s->keyframe) {
+         if (!s->theora) {
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 95b4bf50ac..c5bebe9c2d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -26,7 +26,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
            file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
-           "
+           file://0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch \
+          "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
 
-- 
2.34.1


