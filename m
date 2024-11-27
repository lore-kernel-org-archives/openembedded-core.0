Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26733D609C0
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 09:24:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.67972.1732699487877571640
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 01:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10610f3413=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR9K22g007507
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 01:24:47 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433b79c4a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 01:24:47 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 27 Nov 2024 01:24:46 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 27 Nov 2024 01:24:45 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 4/5] ffmpeg: fix CVE-2023-51796
Date: Wed, 27 Nov 2024 09:24:37 +0000
Message-ID: <20241127092438.760275-4-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241127092438.760275-1-archana.polampalli@windriver.com>
References: <20241127092438.760275-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=atbgCjZV c=1 sm=1 tr=0 ts=6746e55f cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=wXqpBGkOYNkGGS9n2XwA:9 a=HLUCug_QN4oeKp6PugZw:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: vKnFYGF9pC7ehxGZ5GPy4kq52abD_kyg
X-Proofpoint-ORIG-GUID: vKnFYGF9pC7ehxGZ5GPy4kq52abD_kyg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-27_04,2024-11-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=836 bulkscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411270077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 09:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207921

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.N113007-g8d24a28d06 allows a local
attacker to execute arbitrary code via the libavfilter/f_reverse.c:269:26
in areverse_request_frame.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-51796.patch        | 39 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51796.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51796.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51796.patch
new file mode 100644
index 0000000000..4ec0aa5aee
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51796.patch
@@ -0,0 +1,39 @@
+From 61e73851a33f0b4cb7662f8578a4695e77bd3c19 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 23 Dec 2023 18:04:32 +0100
+Subject: [PATCH 3/4] avfilter/f_reverse: Apply PTS compensation only when pts
+ is  available
+
+Fixes: out of array access
+Fixes: tickets/10753/poc16ffmpeg
+
+Regression since: 45dc668aea0edac34969b5a1ff76cf9ad3a09be1
+Found-by: Zeng Yunxiang
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2023-51796
+
+Upstream-Status: Backport [https://github.com/ffmpeg/FFmpeg/commit/61e73851a33f0b4cb7662f8578a4695e77bd3c19]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/f_reverse.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/libavfilter/f_reverse.c b/libavfilter/f_reverse.c
+index f7a7e71..7b919d6 100644
+--- a/libavfilter/f_reverse.c
++++ b/libavfilter/f_reverse.c
+@@ -251,7 +251,9 @@ static int areverse_request_frame(AVFilterLink *outlink)
+     if (ret == AVERROR_EOF && s->nb_frames > 0) {
+         AVFrame *out = s->frames[s->nb_frames - 1];
+         out->pts     = s->pts[s->flush_idx++] - s->nb_samples;
+-        s->nb_samples += s->pts[s->flush_idx] - s->pts[s->flush_idx - 1] - out->nb_samples;
++        if (s->nb_frames > 1)
++            s->nb_samples += s->pts[s->flush_idx] - s->pts[s->flush_idx - 1] - out->nb_samples;
++
+
+         if (av_sample_fmt_is_planar(out->format))
+             reverse_samples_planar(out);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index ee13081e4d..8e0fc090ac 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -38,6 +38,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2023-51798.patch \
            file://CVE-2023-47342.patch \
            file://CVE-2023-50007.patch \
+           file://CVE-2023-51796.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.40.0


