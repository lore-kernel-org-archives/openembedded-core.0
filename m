Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F67E7717B
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 13:12:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.36299.1733490718246106470
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 05:11:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=207081cc16=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6BljWZ008553
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Dec 2024 05:11:58 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43833q71nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 05:11:57 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 6 Dec 2024 05:11:57 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 6 Dec 2024 05:11:55 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 4/5] ffmpeg: fix CVE-2023-49528
Date: Fri, 6 Dec 2024 13:11:47 +0000
Message-ID: <20241206131148.1870788-4-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241206131148.1870788-1-archana.polampalli@windriver.com>
References: <20241206131148.1870788-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8lOLbNQlIFoDNcJrXvgy9rIEF3e2hfNs
X-Authority-Analysis: v=2.4 cv=bqq2BFai c=1 sm=1 tr=0 ts=6752f81d cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=LTNQxL8gvObQ-oxyMaoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 8lOLbNQlIFoDNcJrXvgy9rIEF3e2hfNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_09,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412060099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 13:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208425

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in FFmpeg version n6.1-3-g466799d4f5, allows a
local attacker to execute arbitrary code and cause a denial of service (DoS)
via the af_dialoguenhance.c:261:5 in the de_stereo component.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-49528.patch        | 58 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49528.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49528.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49528.patch
new file mode 100644
index 0000000000..37e1ab61d1
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49528.patch
@@ -0,0 +1,58 @@
+From 2d9ed64859c9887d0504cd71dbd5b2c15e14251a Mon Sep 17 00:00:00 2001
+From: Paul B Mahol <onemda@gmail.com>
+Date: Sat, 25 Nov 2023 12:54:28 +0100
+Subject: [PATCH 3/3] avfilter/af_dialoguenhance: fix overreads
+
+CVE: CVE-2023-49528
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/2d9ed64859c9887d0504cd71dbd5b2c15e14251a]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/af_dialoguenhance.c | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/libavfilter/af_dialoguenhance.c b/libavfilter/af_dialoguenhance.c
+index 1762ea7..29c8ab1 100644
+--- a/libavfilter/af_dialoguenhance.c
++++ b/libavfilter/af_dialoguenhance.c
+@@ -96,12 +96,12 @@ static int config_input(AVFilterLink *inlink)
+     if (!s->window)
+         return AVERROR(ENOMEM);
+
+-    s->in_frame       = ff_get_audio_buffer(inlink, s->fft_size * 4);
+-    s->center_frame   = ff_get_audio_buffer(inlink, s->fft_size * 4);
+-    s->out_dist_frame = ff_get_audio_buffer(inlink, s->fft_size * 4);
+-    s->windowed_frame = ff_get_audio_buffer(inlink, s->fft_size * 4);
+-    s->windowed_out   = ff_get_audio_buffer(inlink, s->fft_size * 4);
+-    s->windowed_prev  = ff_get_audio_buffer(inlink, s->fft_size * 4);
++    s->in_frame       = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
++    s->center_frame   = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
++    s->out_dist_frame = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
++    s->windowed_frame = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
++    s->windowed_out   = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
++    s->windowed_prev  = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
+     if (!s->in_frame || !s->windowed_out || !s->windowed_prev ||
+         !s->out_dist_frame || !s->windowed_frame || !s->center_frame)
+         return AVERROR(ENOMEM);
+@@ -250,6 +250,7 @@ static int de_stereo(AVFilterContext *ctx, AVFrame *out)
+     float *right_osamples  = (float *)out->extended_data[1];
+     float *center_osamples = (float *)out->extended_data[2];
+     const int offset = s->fft_size - s->overlap;
++    const int nb_samples = FFMIN(s->overlap, s->in->nb_samples);
+     float vad;
+
+     // shift in/out buffers
+@@ -258,8 +259,8 @@ static int de_stereo(AVFilterContext *ctx, AVFrame *out)
+     memmove(left_out, &left_out[s->overlap], offset * sizeof(float));
+     memmove(right_out, &right_out[s->overlap], offset * sizeof(float));
+
+-    memcpy(&left_in[offset], left_samples, s->overlap * sizeof(float));
+-    memcpy(&right_in[offset], right_samples, s->overlap * sizeof(float));
++    memcpy(&left_in[offset], left_samples, nb_samples * sizeof(float));
++    memcpy(&right_in[offset], right_samples, nb_samples * sizeof(float));
+     memset(&left_out[offset], 0, s->overlap * sizeof(float));
+     memset(&right_out[offset], 0, s->overlap * sizeof(float));
+
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index cac122f8b9..20ad368594 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -35,6 +35,7 @@ SRC_URI = " \
     file://CVE-2023-49501.patch \
     file://CVE-2024-28661.patch \
     file://CVE-2023-50007.patch \
+    file://CVE-2023-49528.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


