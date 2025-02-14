Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEACC021A4
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 10:49:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18162.1739530181108701894
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Feb 2025 02:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4140afe1ed=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E8abYJ026385
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 02:49:41 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwtqc6pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 02:49:40 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 14 Feb 2025 02:49:39 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 14 Feb 2025 02:49:38 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 5/5] ffmpeg: fix CVE-2024-36617
Date: Fri, 14 Feb 2025 10:49:29 +0000
Message-ID: <20250214104929.3039901-5-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250214104929.3039901-1-archana.polampalli@windriver.com>
References: <20250214104929.3039901-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NKBu3WnkbHNuFAuvJGDeqH7YiYN8WdAQ
X-Authority-Analysis: v=2.4 cv=DNd14zNb c=1 sm=1 tr=0 ts=67af1fc4 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=BjvQEwEvunn342MFDgYA:9 a=HLUCug_QN4oeKp6PugZw:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: NKBu3WnkbHNuFAuvJGDeqH7YiYN8WdAQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502140078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 10:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211384

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n6.1.1 has an integer overflow vulnerability in the FFmpeg CAF decoder.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-36617.patch        | 38 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch
new file mode 100644
index 0000000000..8b4928d1ca
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch
@@ -0,0 +1,38 @@
+From f0e780370cc1c437d64f10d326b1d656ef490b5f Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 30 Sep 2023 00:38:17 +0200
+Subject: [PATCH 4/4] avformat/cafdec: dont seek beyond 64bit
+
+Fixes: signed integer overflow: 64 + 9223372036854775807 cannot be represented in type 'long long'
+Fixes: 51896/clusterfuzz-testcase-minimized-ffmpeg_dem_CAF_fuzzer-6418242730328064
+Fixes: 62276/clusterfuzz-testcase-minimized-ffmpeg_dem_CAF_fuzzer-6418242730328064
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit d973fcbcc2f944752ff10e6a76b0b2d9329937a7)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-36617
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/f0e780370cc1c437d64f10d326b1d656ef490b5f]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/cafdec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/cafdec.c b/libavformat/cafdec.c
+index d5668bf..aa56a5e 100644
+--- a/libavformat/cafdec.c
++++ b/libavformat/cafdec.c
+@@ -220,7 +220,7 @@ static int read_pakt_chunk(AVFormatContext *s, int64_t size)
+         }
+     }
+
+-    if (avio_tell(pb) - ccount > size) {
++    if (avio_tell(pb) - ccount > size || size > INT64_MAX - ccount) {
+         av_log(s, AV_LOG_ERROR, "error reading packet table\n");
+         return AVERROR_INVALIDDATA;
+     }
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index fc92bb2ec0..b5b11496f4 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -46,6 +46,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2025-0518.patch \
            file://CVE-2024-36613.patch \
            file://CVE-2024-36616.patch \
+           file://CVE-2024-36617.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.40.0


