Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EB2E77179
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 13:12:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.36521.1733490712832373857
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 05:11:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=207081cc16=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6AwVYS008723
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Dec 2024 05:11:52 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7y7b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 05:11:52 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 6 Dec 2024 05:11:51 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 6 Dec 2024 05:11:50 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/5] ffmpeg: fix CVE-2023-49501
Date: Fri, 6 Dec 2024 13:11:44 +0000
Message-ID: <20241206131148.1870788-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: aMHAkhVeS86kO17C7yFr2M9-U9I4NGH7
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=6752f818 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=bxxVfP89Vecm7M3Bs_kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: aMHAkhVeS86kO17C7yFr2M9-U9I4NGH7
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208422

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.n6.1-3-g466799d4f5 allows a
local attacker to execute arbitrary code via the config_eq_output function
in the libavfilter/asrc_afirsrc.c:495:30 component.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-49501.patch        | 30 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch
new file mode 100644
index 0000000000..80d542952a
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch
@@ -0,0 +1,30 @@
+From 4adb93dff05dd947878c67784d98c9a4e13b57a7 Mon Sep 17 00:00:00 2001
+From: Paul B Mahol <onemda@gmail.com>
+Date: Thu, 23 Nov 2023 14:58:35 +0100
+Subject: [PATCH] avfilter/asrc_afirsrc: fix by one smaller allocation of
+ buffer
+
+CVE: CVE-2023-49501
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/4adb93dff05dd947878c67784d98c9a4e13b57a7]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/asrc_afirsrc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavfilter/asrc_afirsrc.c b/libavfilter/asrc_afirsrc.c
+index e2359c1..ea04c35 100644
+--- a/libavfilter/asrc_afirsrc.c
++++ b/libavfilter/asrc_afirsrc.c
+@@ -480,7 +480,7 @@ static av_cold int config_eq_output(AVFilterLink *outlink)
+         if (ret < 0)
+             return ret;
+
+-        s->magnitude = av_calloc(s->nb_magnitude, sizeof(*s->magnitude));
++        s->magnitude = av_calloc(s->nb_magnitude + 1, sizeof(*s->magnitude));
+         if (!s->magnitude)
+             return AVERROR(ENOMEM);
+         memcpy(s->magnitude, eq_presets[s->preset].gains, sizeof(*s->magnitude) * s->nb_magnitude);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 13051f4e36..894f47f56b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -32,6 +32,7 @@ SRC_URI = " \
     file://CVE-2024-31582.patch \
     file://CVE-2023-50008.patch \
     file://CVE-2024-32230.patch \
+    file://CVE-2023-49501.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


