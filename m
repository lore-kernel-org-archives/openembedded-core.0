Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8408D75BD9
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 08:51:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6640.1732179068644621775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 00:51:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10557af3af=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL6D17w026868
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 00:51:08 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7w98f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 00:51:08 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 21 Nov 2024 00:51:07 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 21 Nov 2024 00:51:06 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] ffmpeg: fix CVE-2023-51794
Date: Thu, 21 Nov 2024 08:51:04 +0000
Message-ID: <20241121085104.4070674-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: WJrbXoSolsVCVA-mFtTOT76h92w8tF7J
X-Proofpoint-GUID: WJrbXoSolsVCVA-mFtTOT76h92w8tF7J
X-Authority-Analysis: v=2.4 cv=Sb6ldeRu c=1 sm=1 tr=0 ts=673ef47c cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=-nRtE4NwH-syrzJktWMA:9 a=HLUCug_QN4oeKp6PugZw:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_07,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411210069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 08:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207518

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.N113007-g8d24a28d06 allows a
local attacker to execute arbitrary code via the libavfilter/af_stereowiden.c:120:69.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-51794.patch        | 35 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51794.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51794.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51794.patch
new file mode 100644
index 0000000000..a33ae5ffe9
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51794.patch
@@ -0,0 +1,35 @@
+From 50f0f8c53c818f73fe2d752708e2fa9d2a2d8a07 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 23 Dec 2023 04:03:01 +0100
+Subject: [PATCH] avfilter/af_stereowiden: Check length
+
+Fixes: out of array access
+Fixes: tickets/10746/poc13ffmpeg
+
+Found-by: Zeng Yunxiang
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2023-51794
+
+Upstream-Status: Backport [https://github.com/ffmpeg/FFmpeg/commit/50f0f8c53c818f73fe2d752708e2fa9d2a2d8a07]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/af_stereowiden.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libavfilter/af_stereowiden.c b/libavfilter/af_stereowiden.c
+index 7cce1a8..f1a5b10 100644
+--- a/libavfilter/af_stereowiden.c
++++ b/libavfilter/af_stereowiden.c
+@@ -74,6 +74,8 @@ static int config_input(AVFilterLink *inlink)
+
+     s->length = s->delay * inlink->sample_rate / 1000;
+     s->length *= 2;
++    if (s->length == 0)
++        return AVERROR(EINVAL);
+     s->buffer = av_calloc(s->length, sizeof(*s->buffer));
+     if (!s->buffer)
+         return AVERROR(ENOMEM);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index ae02310af8..80a4e5b96f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -34,6 +34,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2023-50008.patch \
            file://CVE-2024-31582.patch \
            file://CVE-2024-31578.patch \
+           file://CVE-2023-51794.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.40.0


