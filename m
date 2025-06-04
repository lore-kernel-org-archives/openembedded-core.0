Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB620C5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:17:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14129.1749035829813694019
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8250111c01=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55427bou023528
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 04:17:09 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rtc49-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 04:17:09 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 04:17:06 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Jun 2025 04:17:04 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  2/4] ffmpeg: fix CVE-2025-22919
Date: Wed, 4 Jun 2025 16:46:57 +0530
Message-ID: <20250604111659.3136031-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604111659.3136031-1-archana.polampalli@windriver.com>
References: <20250604111659.3136031-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ie6Tyf7bJ6B_vn8oOwSqKL2VSpvATvdf
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68402b35 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7kzwKhblaiHzeQkmTegA:9 a=HLUCug_QN4oeKp6PugZw:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA4NiBTYWx0ZWRfX0Wwn+97X/Onc ax2ThRpSWjOxLuwPjGBghVpAhU/uscTDPR80nt/xsz23XccCktWaDPEM/kMiL0bYOk6i8b3SQV+ rV2T5K8xc8soqKq/OXlpH1PCIv1eoSs8kRsj0n8YTxlUCln3dDZxawO6GreiGhu8BKgB6vs1cSF
 Oi64u6y1coVrWa50J42il4RW7QFzNF0BpXTLpHboyHXBzJgwUp0CDXha5pj9ob0fMeyA94/w8lP vjbD572OoEfcQDq/6BTpcWqg5oh7v6gaWWC3tS/0kIx4iloouJDIJa5tYRdm05TStO5mHtSNQGE nQSesmHy22xztlpEbCa/lTU38cpmcQwd/76dI87jvaAXQ6vl8c8mqeLQ//8Y9eHL26LhqBsi9xp
 lmmf/Qdr/s0IdmYUOOHoFBXRJRRoXJr3JGfxBY6HyRwQTf6I/12FEs81uR+M1PAiJjgKUZoz
X-Proofpoint-ORIG-GUID: ie6Tyf7bJ6B_vn8oOwSqKL2VSpvATvdf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=712
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217904

From: Archana Polampalli <archana.polampalli@windriver.com>

A reachable assertion in FFmpeg git-master commit N-113007-g8d24a28d06 allows
attackers to cause a Denial of Service (DoS) via opening a crafted AAC file.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-22919.patch        | 41 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch
new file mode 100644
index 0000000000..5e27ad9d5b
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch
@@ -0,0 +1,41 @@
+From 145a3a84550a1c3a3b848c12a64b53c3c41d2888 Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Mon, 30 Dec 2024 00:25:41 -0300
+Subject: [PATCH] avfilter/buffersrc: check for valid sample rate
+
+A sample rate <= 0 is invalid.
+
+Fixes an assert in ffmpeg_enc.c that assumed a valid sample rate would be set.
+Fixes ticket #11385.
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+(cherry picked from commit 1446e37d3d032e1452844778b3e6ba2c20f0c322)
+
+CVE: CVE-2025-22919
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/145a3a84550a1c3a3b848c12a64b53c3c41d2888]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/buffersrc.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libavfilter/buffersrc.c b/libavfilter/buffersrc.c
+index b061187..cd2b05d 100644
+--- a/libavfilter/buffersrc.c
++++ b/libavfilter/buffersrc.c
+@@ -335,6 +335,11 @@ static av_cold int init_audio(AVFilterContext *ctx)
+                                   "channel layout specified\n");
+         return AVERROR(EINVAL);
+     }
++    
++    if (s->sample_rate <= 0) {
++        av_log(ctx, AV_LOG_ERROR, "Sample rate not set\n");
++        return AVERROR(EINVAL);
++    }
+ 
+     if (!s->time_base.num)
+         s->time_base = (AVRational){1, s->sample_rate};
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index 127552396d..49277f9e2b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -46,6 +46,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-28661.patch \
            file://CVE-2024-35369.patch \
            file://CVE-2025-25473.patch \
+           file://CVE-2025-22919.patch \
           "
 
 SRC_URI[sha256sum] = "04c70c377de233a4b217c2fdf76b19aeb225a287daeb2348bccd978c47b1a1db"
-- 
2.49.0


