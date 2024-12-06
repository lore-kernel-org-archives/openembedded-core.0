Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B19E7717F
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 13:12:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.36523.1733490714494867020
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 05:11:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=207081cc16=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6AwVYT008723
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Dec 2024 05:11:54 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7y7b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 05:11:53 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 6 Dec 2024 05:11:53 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 6 Dec 2024 05:11:52 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 2/5] ffmpeg: fix CVE-2024-28661
Date: Fri, 6 Dec 2024 13:11:45 +0000
Message-ID: <20241206131148.1870788-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241206131148.1870788-1-archana.polampalli@windriver.com>
References: <20241206131148.1870788-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: DqIM95SUJnAJ4JP9A1wSeiggMcqFH7Fi
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=6752f81a cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=ajGdKPU5l2Q5fPos1_wA:9
 a=tbo0nzVOYwoA:10 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: DqIM95SUJnAJ4JP9A1wSeiggMcqFH7Fi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_09,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412060099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 13:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208423

From: Archana Polampalli <archana.polampalli@windriver.com>

Some of the changes are already present in recipe version

Ref:
https://github.com/FFmpeg/FFmpeg/commit/148ada5577262c6c18ae97604df8fe1c18b096e2
https://ffmpeg.org/security.html

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-28661.patch        | 37 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch
new file mode 100644
index 0000000000..b42badb567
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch
@@ -0,0 +1,37 @@
+From 66b50445cb36cf6adb49c2397362509aedb42c71 Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Fri, 16 Feb 2024 11:17:13 -0300
+Subject: [PATCH 1/3] avcodec/speexdec: check for sane frame_size values
+
+Regression since ab39cc36c72bb73318bb911acb66873de850a107.
+
+Fixes heap buffer overflows
+Fixes ticket #10866
+
+Reported-by: sploitem <sploitem@gmail.com>
+Reviewed-by: Michael Niedermayer <michael@niedermayer.cc>
+Signed-off-by: James Almer <jamrial@gmail.com>
+
+CVE: CVE-2024-28661
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/66b50445cb36cf6adb49c2397362509aedb42c71]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/speexdec.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libavcodec/speexdec.c b/libavcodec/speexdec.c
+index 08c7e77..23b8605 100644
+--- a/libavcodec/speexdec.c
++++ b/libavcodec/speexdec.c
+@@ -1422,6 +1422,7 @@ static int parse_speex_extradata(AVCodecContext *avctx,
+     s->frame_size = bytestream_get_le32(&buf);
+     if (s->frame_size < NB_FRAME_SIZE << s->mode)
+         return AVERROR_INVALIDDATA;
++    s->frame_size *= 1 + (s->mode > 0);
+     s->vbr = bytestream_get_le32(&buf);
+     s->frames_per_packet = bytestream_get_le32(&buf);
+     if (s->frames_per_packet <= 0 ||
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 894f47f56b..9903b86006 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -33,6 +33,7 @@ SRC_URI = " \
     file://CVE-2023-50008.patch \
     file://CVE-2024-32230.patch \
     file://CVE-2023-49501.patch \
+    file://CVE-2024-28661.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


