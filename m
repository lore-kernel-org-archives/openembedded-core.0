Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F070FE77180
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 08:50:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11438.1734079841057441067
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 00:50:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=207735f8c4=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD4u9cp018927
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 00:50:40 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy1xw27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 00:50:40 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 13 Dec 2024 00:50:40 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 13 Dec 2024 00:50:38 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 3/3] ffmpeg: fix CVE-2024-35368
Date: Fri, 13 Dec 2024 08:50:33 +0000
Message-ID: <20241213085033.3004012-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241213085033.3004012-1-archana.polampalli@windriver.com>
References: <20241213085033.3004012-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: DVowiHmdNPBR-EVWRvk0NP6avSIkGPAR
X-Authority-Analysis: v=2.4 cv=eePHf6EH c=1 sm=1 tr=0 ts=675bf560 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=UqCG9HQmAAAA:8 a=pxSFZGnM-uByvBOc380A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DVowiHmdNPBR-EVWRvk0NP6avSIkGPAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-13_03,2024-12-12_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412130059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 08:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208674

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n7.0 is affected by a Double Free via the rkmpp_retrieve_frame
function within libavcodec/rkmppdec.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35368.patch        | 42 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch
new file mode 100644
index 0000000000..2c49e3598e
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch
@@ -0,0 +1,42 @@
+From 4513300989502090c4fd6560544dce399a8cd53c Mon Sep 17 00:00:00 2001
+From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+Date: Sun, 24 Sep 2023 13:15:48 +0200
+Subject: [PATCH] avcodec/rkmppdec: Fix double-free on error
+
+After having created the AVBuffer that is put into frame->buf[0],
+ownership of several objects (namely an AVDRMFrameDescriptor,
+an MppFrame and some AVBufferRefs framecontextref and decoder_ref)
+has passed to the AVBuffer and therefore to the frame.
+Yet it has nevertheless been freed manually on error
+afterwards, which would lead to a double-free as soon
+as the AVFrame is unreferenced.
+
+Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+
+CVE: CVE-2024-35368
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/4513300989502090c4fd6560544dce399a8cd53c]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/rkmppdec.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/rkmppdec.c b/libavcodec/rkmppdec.c
+index 5768568..2ca368e 100644
+--- a/libavcodec/rkmppdec.c
++++ b/libavcodec/rkmppdec.c
+@@ -462,8 +462,8 @@ static int rkmpp_retrieve_frame(AVCodecContext *avctx, AVFrame *frame)
+ 
+             frame->hw_frames_ctx = av_buffer_ref(decoder->frames_ref);
+             if (!frame->hw_frames_ctx) {
+-                ret = AVERROR(ENOMEM);
+-                goto fail;
++                av_frame_unref(frame);
++                return AVERROR(ENOMEM);
+             }
+ 
+             return 0;
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index fdb8d55cc2..c050b03fd6 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -39,6 +39,7 @@ SRC_URI = " \
     file://CVE-2024-7055.patch \
     file://CVE-2024-35366.patch \
     file://CVE-2024-35367.patch \
+    file://CVE-2024-35368.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


