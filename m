Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBCCE7718F
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 07:11:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.26102.1735888306439819947
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 23:11:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3098560207=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5036MDT5021966
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Jan 2025 07:11:45 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t8a84w0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 07:11:45 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 2 Jan 2025 23:11:44 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 2 Jan 2025 23:11:43 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 3/3] ffmpeg: fix CVE-2024-35368
Date: Fri, 3 Jan 2025 07:11:38 +0000
Message-ID: <20250103071138.3650340-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250103071138.3650340-1-archana.polampalli@windriver.com>
References: <20250103071138.3650340-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7b5D7aG_Cy9pPUGgwkgou-P1xZrhwsce
X-Proofpoint-ORIG-GUID: 7b5D7aG_Cy9pPUGgwkgou-P1xZrhwsce
X-Authority-Analysis: v=2.4 cv=f8qyBPyM c=1 sm=1 tr=0 ts=67778db1 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=UqCG9HQmAAAA:8 a=MVx2jJ9Z82B9YExYSzsA:9
 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501030060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 07:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209323

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n7.0 is affected by a Double Free via the rkmpp_retrieve_frame
function within libavcodec/rkmppdec.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35368.patch        | 41 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch
new file mode 100644
index 0000000000..555d569825
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch
@@ -0,0 +1,41 @@
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
+index 7665098c6a..6889545b20 100644
+--- a/libavcodec/rkmppdec.c
++++ b/libavcodec/rkmppdec.c
+@@ -463,8 +463,8 @@ static int rkmpp_retrieve_frame(AVCodecContext *avctx, AVFrame *frame)
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index ac4ade276c..9aecdf07e0 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -42,6 +42,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-7055.patch \
            file://CVE-2024-35366.patch \
            file://CVE-2024-35367.patch \
+           file://CVE-2024-35368.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.40.0


