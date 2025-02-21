Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1379C021B5
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 06:03:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17158.1740117800643439479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 22:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4147565e18=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L2Y6dv027734
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 06:03:20 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kkb7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 06:03:19 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 20 Feb 2025 22:03:18 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 20 Feb 2025 22:03:17 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 5/5] ffmpeg: fix CVE-2025-25473
Date: Fri, 21 Feb 2025 06:03:07 +0000
Message-ID: <20250221060307.671892-5-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250221060307.671892-1-archana.polampalli@windriver.com>
References: <20250221060307.671892-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: b-Bv3_e69c_egVqa7D-OnDo6zwJrNXiO
X-Proofpoint-ORIG-GUID: b-Bv3_e69c_egVqa7D-OnDo6zwJrNXiO
X-Authority-Analysis: v=2.4 cv=BvtnwZX5 c=1 sm=1 tr=0 ts=67b81727 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Je6dNV9KNOqH9jOm3oIA:9
 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=958 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502210044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 06:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211792

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg git master before commit c08d30 was discovered to contain a NULL pointer
dereference via the component libavformat/mov.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-25473.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch
new file mode 100644
index 0000000000..c9527751b5
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
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/c08d300481b8ebb846cd43a473988fdbc6793d1b]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/utils.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libavformat/utils.c b/libavformat/utils.c
+index cee86ae..fe458dd 100644
+--- a/libavformat/utils.c
++++ b/libavformat/utils.c
+@@ -724,6 +724,7 @@ void avformat_free_context(AVFormatContext *s)
+     av_dict_free(&si->id3v2_meta);
+     av_packet_free(&si->pkt);
+     av_packet_free(&si->parse_pkt);
++    avpriv_packet_list_free(&si->packet_buffer);
+     av_freep(&s->streams);
+     ff_flush_packet_queue(s);
+     av_freep(&s->url);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 560b884913..f7e375911c 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -50,6 +50,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-36618.patch \
            file://CVE-2024-28661.patch \
            file://CVE-2024-35369.patch \
+           file://CVE-2025-25473.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.40.0


