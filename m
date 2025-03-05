Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2909FC282DE
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 16:14:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16980.1741191291421245111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 08:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5159052c86=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525CYuIY013271
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Mar 2025 16:14:50 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux0wgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 16:14:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 5 Mar 2025 08:14:49 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 5 Mar 2025 08:14:47 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 2/5] ffmpeg: fix CVE-2025-25473
Date: Wed, 5 Mar 2025 16:14:40 +0000
Message-ID: <20250305161443.284930-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250305161443.284930-1-archana.polampalli@windriver.com>
References: <20250305161443.284930-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 31XLAv0XXoN1pg4qjJGbYRxfXCdrKk_A
X-Authority-Analysis: v=2.4 cv=ddB63WXe c=1 sm=1 tr=0 ts=67c8787a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Je6dNV9KNOqH9jOm3oIA:9 a=HLUCug_QN4oeKp6PugZw:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 31XLAv0XXoN1pg4qjJGbYRxfXCdrKk_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_06,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=821 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503050125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 16:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212340

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg git master before commit c08d30 was discovered to contain a NULL pointer
dereference via the component libavformat/mov.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-25473.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch
new file mode 100644
index 0000000000..ea619025d1
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch
@@ -0,0 +1,36 @@
+From c08d300481b8ebb846cd43a473988fdbc6793d1b Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Fri, 17 Jan 2025 00:05:31 -0300
+Subject: [PATCH] avformat/avformat: also clear FFFormatContext packet queue
+ when closing a muxer
+
+packet_buffer is used in mux.c, and if a muxing process fails at a point where
+packets remained in said queue, they will leak.
+
+Fixes ticket #11419
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+
+CVE: CVE-2025-25473
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff/c08d300481b8ebb846cd43a473988fdbc6793d1b]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/avformat.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libavformat/avformat.c b/libavformat/avformat.c
+index 5b8bb78..73f31cd 100644
+--- a/libavformat/avformat.c
++++ b/libavformat/avformat.c
+@@ -138,6 +138,7 @@ void avformat_free_context(AVFormatContext *s)
+     av_dict_free(&si->id3v2_meta);
+     av_packet_free(&si->pkt);
+     av_packet_free(&si->parse_pkt);
++    avpriv_packet_list_free(&si->packet_buffer);
+     av_freep(&s->streams);
+     ff_flush_packet_queue(s);
+     av_freep(&s->url);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 91ee6c6b0d..cb6a50401b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -47,6 +47,7 @@ SRC_URI = " \
     file://CVE-2024-36618.patch \
     file://CVE-2024-36619.patch \
     file://CVE-2024-35369.patch \
+    file://CVE-2025-25473.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


