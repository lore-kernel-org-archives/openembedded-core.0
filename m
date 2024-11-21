Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065DDD75BC8
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 06:46:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5286.1732171562989117965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 22:46:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10557af3af=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL5JKVd022259
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 06:46:02 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xjc8d721-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 06:46:02 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 20 Nov 2024 22:46:00 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 20 Nov 2024 22:45:59 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 4/5] ffmpeg: fix CVE-2024-31582
Date: Thu, 21 Nov 2024 06:45:51 +0000
Message-ID: <20241121064552.1847413-4-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241121064552.1847413-1-archana.polampalli@windriver.com>
References: <20241121064552.1847413-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bQGU0VE-5Av0UCvFeAwDt_3H-FvzEmGo
X-Authority-Analysis: v=2.4 cv=R6hRGsRX c=1 sm=1 tr=0 ts=673ed72a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=GvQkQWPkAAAA:8 a=_HRyTWBlU1BcCFoby0EA:9
 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: bQGU0VE-5Av0UCvFeAwDt_3H-FvzEmGo
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
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 06:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207515

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg version n6.1 was discovered to contain a heap buffer overflow vulnerability
in the draw_block_rectangle function of libavfilter/vf_codecview.c. This vulnerability
allows attackers to cause undefined behavior or a Denial of Service (DoS) via crafted input.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-31582.patch        | 34 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch
new file mode 100644
index 0000000000..99b46dc4ea
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch
@@ -0,0 +1,34 @@
+From 99debe5f823f45a482e1dc08de35879aa9c74bd2 Mon Sep 17 00:00:00 2001
+From: Zhao Zhili <zhilizhao@tencent.com>
+Date: Fri, 29 Dec 2023 05:56:43 +0800
+Subject: [PATCH 4/5] avfilter/vf_codecview: fix heap buffer overflow
+
+And improve the performance by a little bit.
+
+Signed-off-by: Zhao Zhili <zhilizhao@tencent.com>
+
+CVE: CVE-2024-31582
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/99debe5f823f45a482e1dc08de35879aa9c74bd2]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/vf_codecview.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/libavfilter/vf_codecview.c b/libavfilter/vf_codecview.c
+index aac038e..816d633 100644
+--- a/libavfilter/vf_codecview.c
++++ b/libavfilter/vf_codecview.c
+@@ -215,9 +215,6 @@ static void draw_block_rectangle(uint8_t *buf, int sx, int sy, int w, int h, int
+         buf[sx + w - 1] = color;
+         buf += stride;
+     }
+-
+-    for (int x = sx; x < sx + w; x++)
+-        buf[x] = color;
+ }
+
+ static int filter_frame(AVFilterLink *inlink, AVFrame *frame)
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index ee7485a445..4a743c6dd7 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -32,6 +32,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-32230.patch \
            file://CVE-2023-51793.patch \
            file://CVE-2023-50008.patch \
+           file://CVE-2024-31582.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.40.0


