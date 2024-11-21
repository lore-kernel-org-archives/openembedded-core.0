Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEFCD75BC9
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 06:46:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5257.1732171559593196315
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 22:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10557af3af=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL5p4Ox003401
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 06:45:58 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xjc8d71w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 06:45:58 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 20 Nov 2024 22:45:56 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 20 Nov 2024 22:45:55 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 2/5] ffmpeg: fix CVE-2023-51793
Date: Thu, 21 Nov 2024 06:45:49 +0000
Message-ID: <20241121064552.1847413-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241121064552.1847413-1-archana.polampalli@windriver.com>
References: <20241121064552.1847413-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: c5n2EcNYDZmFm0V9KmscULhh_n9YtJqb
X-Authority-Analysis: v=2.4 cv=R6hRGsRX c=1 sm=1 tr=0 ts=673ed726 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=PvYiNcKvq6rx3_0i8jgA:9 a=HLUCug_QN4oeKp6PugZw:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: c5n2EcNYDZmFm0V9KmscULhh_n9YtJqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_05,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411210051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 06:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207513

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.N113007-g8d24a28d06 allows a local
attacker to execute arbitrary code via the libavutil/imgutils.c:353:9 in image_copy_plane.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-51793.patch        | 67 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51793.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51793.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51793.patch
new file mode 100644
index 0000000000..71eeb92422
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51793.patch
@@ -0,0 +1,67 @@
+From 0ecc1f0e48930723d7a467761b66850811c23e62 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Fri, 22 Dec 2023 12:31:35 +0100
+Subject: [PATCH 2/5] avfilter/vf_weave: Fix odd height handling
+
+Fixes: out of array access
+Fixes: tickets/10743/poc10ffmpeg
+
+Found-by: Zeng Yunxiang and Li Zeyuan
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2023-51793
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/0ecc1f0e48930723d7a467761b66850811c23e62]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/vf_weave.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/libavfilter/vf_weave.c b/libavfilter/vf_weave.c
+index 2bd3994..de9f79c 100644
+--- a/libavfilter/vf_weave.c
++++ b/libavfilter/vf_weave.c
+@@ -30,6 +30,7 @@ typedef struct WeaveContext {
+     int double_weave;
+     int nb_planes;
+     int planeheight[4];
++    int outheight[4];
+     int linesize[4];
+
+     AVFrame *prev;
+@@ -79,6 +80,9 @@ static int config_props_output(AVFilterLink *outlink)
+     s->planeheight[1] = s->planeheight[2] = AV_CEIL_RSHIFT(inlink->h, desc->log2_chroma_h);
+     s->planeheight[0] = s->planeheight[3] = inlink->h;
+
++    s->outheight[1] = s->outheight[2] = AV_CEIL_RSHIFT(2*inlink->h, desc->log2_chroma_h);
++    s->outheight[0] = s->outheight[3] = 2*inlink->h;
++
+     s->nb_planes = av_pix_fmt_count_planes(inlink->format);
+
+     return 0;
+@@ -104,19 +108,20 @@ static int weave_slice(AVFilterContext *ctx, void *arg, int jobnr, int nb_jobs)
+         const int height = s->planeheight[i];
+         const int start = (height * jobnr) / nb_jobs;
+         const int end = (height * (jobnr+1)) / nb_jobs;
++        const int compensation = 2*end > s->outheight[i];
+
+         av_image_copy_plane(out->data[i] + out->linesize[i] * field1 +
+                             out->linesize[i] * start * 2,
+                             out->linesize[i] * 2,
+                             in->data[i] + start * in->linesize[i],
+                             in->linesize[i],
+-                            s->linesize[i], end - start);
++                            s->linesize[i], end - start - compensation * field1);
+         av_image_copy_plane(out->data[i] + out->linesize[i] * field2 +
+                             out->linesize[i] * start * 2,
+                             out->linesize[i] * 2,
+                             s->prev->data[i] + start * s->prev->linesize[i],
+                             s->prev->linesize[i],
+-                            s->linesize[i], end - start);
++                            s->linesize[i], end - start - compensation * field2);
+     }
+
+     return 0;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 40963d1254..9a99951f91 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch \
            file://CVE-2022-48434.patch \
            file://CVE-2024-32230.patch \
+           file://CVE-2023-51793.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.40.0


