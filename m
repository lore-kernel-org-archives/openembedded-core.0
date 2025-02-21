Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2B3C021AA
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 06:03:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17157.1740117798781481684
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 22:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4147565e18=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L4aRFh000365
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 06:03:18 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00jbb5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 06:03:17 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 20 Feb 2025 22:03:16 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 20 Feb 2025 22:03:15 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 4/5] ffmpeg: fix CVE-2024-35369
Date: Fri, 21 Feb 2025 06:03:06 +0000
Message-ID: <20250221060307.671892-4-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250221060307.671892-1-archana.polampalli@windriver.com>
References: <20250221060307.671892-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: knSgpTV3O5ZqFd5qmOMw5lciLZ_ljLPY
X-Authority-Analysis: v=2.4 cv=I4GfRMgg c=1 sm=1 tr=0 ts=67b81725 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=dVbcMJabyFHDJSEgKt4A:9
 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: knSgpTV3O5ZqFd5qmOMw5lciLZ_ljLPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502210044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 06:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211791

From: Archana Polampalli <archana.polampalli@windriver.com>

In FFmpeg version n6.1.1, specifically within the avcodec/speexdec.c module,
a potential security vulnerability exists due to insufficient validation of
certain parameters when parsing Speex codec extradata. This vulnerability
could lead to integer overflow conditions, potentially resulting in undefined
behavior or crashes during the decoding process.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35369.patch        | 38 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch
new file mode 100644
index 0000000000..b408ee2edc
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch
@@ -0,0 +1,38 @@
+From 0895ef0d6d6406ee6cd158fc4d47d80f201b8e9c Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Sat, 17 Feb 2024 09:45:57 -0300
+Subject: [PATCH] avcodec/speexdec: further check for sane frame_size
+ values
+
+Prevent potential integer overflows.
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+
+CVE: CVE-2024-35369
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/0895ef0d6d6406ee6cd158fc4d47d80f201b8e9c]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/speexdec.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/speexdec.c b/libavcodec/speexdec.c
+index 5b016df..f1f739a 100644
+--- a/libavcodec/speexdec.c
++++ b/libavcodec/speexdec.c
+@@ -1419,9 +1419,10 @@ static int parse_speex_extradata(AVCodecContext *avctx,
+         return AVERROR_INVALIDDATA;
+     s->bitrate = bytestream_get_le32(&buf);
+     s->frame_size = bytestream_get_le32(&buf);
+-    if (s->frame_size < NB_FRAME_SIZE << (s->mode > 0))
++    if (s->frame_size < NB_FRAME_SIZE << (s->mode > 0) ||
++        s->frame_size >     INT32_MAX >> (s->mode > 0))
+         return AVERROR_INVALIDDATA;
+-    s->frame_size *= 1 + (s->mode > 0);
++    s->frame_size <<= (s->mode > 0);
+     s->vbr = bytestream_get_le32(&buf);
+     s->frames_per_packet = bytestream_get_le32(&buf);
+     if (s->frames_per_packet <= 0 ||
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 07376cc36f..560b884913 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-36617.patch \
            file://CVE-2024-36618.patch \
            file://CVE-2024-28661.patch \
+           file://CVE-2024-35369.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.40.0


