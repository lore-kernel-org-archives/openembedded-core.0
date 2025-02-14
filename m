Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC8EC021A6
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 10:49:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18158.1739530175502210785
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Feb 2025 02:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4140afe1ed=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E5XG8i015448
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 02:49:35 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwy6m5u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 02:49:34 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 14 Feb 2025 02:49:34 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 14 Feb 2025 02:49:32 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 2/5] ffmpeg: CVE-2025-0518
Date: Fri, 14 Feb 2025 10:49:26 +0000
Message-ID: <20250214104929.3039901-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250214104929.3039901-1-archana.polampalli@windriver.com>
References: <20250214104929.3039901-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: dpMBcHyj7aCNrYZxNUDafIWhA0DMdzdr
X-Proofpoint-ORIG-GUID: dpMBcHyj7aCNrYZxNUDafIWhA0DMdzdr
X-Authority-Analysis: v=2.4 cv=G8nmE8k5 c=1 sm=1 tr=0 ts=67af1fbe cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=-uYbXFN5AAAA:8 a=cIrKRBxnfGgReSfDivgA:9
 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22 a=BgOh09bUvQbaRh_aUNoE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502140078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 10:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211381

From: Archana Polampalli <archana.polampalli@windriver.com>

Unchecked Return Value, Out-of-bounds Read vulnerability in FFmpeg allows Read
Sensitive Constants Within an Executable. This vulnerability is associated with
program files https://github.Com/FFmpeg/FFmpeg/blob/master/libavfilter/af_pan.C .
This issue affects FFmpeg: 7.1. Issue was
fixed:  https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a
https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a
This issue was discovered by: Simcha Kosman

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-0518.patch         | 34 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
new file mode 100644
index 0000000000..d7623a5b9d
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
@@ -0,0 +1,34 @@
+From b5b6391d64807578ab872dc58fb8aa621dcfc38a Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Mon, 6 Jan 2025 22:01:39 +0100
+Subject: [PATCH 1/4] avfilter/af_pan: Fix sscanf() use
+
+Fixes: Memory Data Leak
+
+Found-by: Simcha Kosman <simcha.kosman@cyberark.com>
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2025-0518
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/af_pan.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavfilter/af_pan.c b/libavfilter/af_pan.c
+index a8a1896..6f8d2a4 100644
+--- a/libavfilter/af_pan.c
++++ b/libavfilter/af_pan.c
+@@ -178,7 +178,7 @@ static av_cold int init(AVFilterContext *ctx)
+         sign = 1;
+         while (1) {
+             gain = 1;
+-            if (sscanf(arg, "%lf%n *%n", &gain, &len, &len))
++            if (sscanf(arg, "%lf%n *%n", &gain, &len, &len) >= 1)
+                 arg += len;
+             if (parse_channel_name(&arg, &in_ch_id, &named)){
+                 av_log(ctx, AV_LOG_ERROR,
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 9aecdf07e0..049d9fd9ec 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-35366.patch \
            file://CVE-2024-35367.patch \
            file://CVE-2024-35368.patch \
+           file://CVE-2025-0518.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.40.0


