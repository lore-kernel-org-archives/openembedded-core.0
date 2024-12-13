Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0495E7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 08:50:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11435.1734079837528331010
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 00:50:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=207735f8c4=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD4otDj010492
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 00:50:37 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy1xw24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 00:50:36 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 13 Dec 2024 00:50:36 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 13 Dec 2024 00:50:35 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/3] ffmpeg: fix CVE-2024-35366
Date: Fri, 13 Dec 2024 08:50:31 +0000
Message-ID: <20241213085033.3004012-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: gaBCxkyK5nO9jaHojkalDljvF8NfUgnG
X-Authority-Analysis: v=2.4 cv=eePHf6EH c=1 sm=1 tr=0 ts=675bf55d cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Il8eHo93rIquhJNKyUkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: gaBCxkyK5nO9jaHojkalDljvF8NfUgnG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-13_03,2024-12-12_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412130059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 08:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208672

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n6.1.1 is Integer Overflow. The vulnerability exists in the parse_options
function of sbgdec.c within the libavformat module. When parsing certain options,
the software does not adequately validate the input. This allows for negative
duration values to be accepted without proper bounds checking.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35366.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch
new file mode 100644
index 0000000000..2c5e9ca79e
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch
@@ -0,0 +1,36 @@
+From 0bed22d597b78999151e3bde0768b7fe763fc2a6 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Tue, 26 Mar 2024 00:39:49 +0100
+Subject: [PATCH] avformat/sbgdec: Check for negative duration
+
+Fixes: signed integer overflow: 9223372036854775807 - -8000000 cannot be represented in type 'long'
+Fixes: 62276/clusterfuzz-testcase-minimized-ffmpeg_dem_SBG_fuzzer-5133181743136768
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-35366
+
+UPstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/0bed22d597b78999151e3bde0768b7fe763fc2a6]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/sbgdec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/sbgdec.c b/libavformat/sbgdec.c
+index b2662ea..281fe62 100644
+--- a/libavformat/sbgdec.c
++++ b/libavformat/sbgdec.c
+@@ -386,7 +386,7 @@ static int parse_options(struct sbg_parser *p)
+                 case 'L':
+                     FORWARD_ERROR(parse_optarg(p, opt, &oarg));
+                     r = str_to_time(oarg.s, &p->scs.opt_duration);
+-                    if (oarg.e != oarg.s + r) {
++                    if (oarg.e != oarg.s + r || p->scs.opt_duration < 0) {
+                         snprintf(p->err_msg, sizeof(p->err_msg),
+                                  "syntax error for option -L");
+                         return AVERROR_INVALIDDATA;
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 0c18a4a7af..f94c75abe6 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -37,6 +37,7 @@ SRC_URI = " \
     file://CVE-2023-50007.patch \
     file://CVE-2023-49528.patch \
     file://CVE-2024-7055.patch \
+    file://CVE-2024-35366.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


