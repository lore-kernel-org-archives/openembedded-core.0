Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA9EC02199
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 15:41:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.72480.1738942877891616398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 07:41:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4133c6c9d8=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517FY2DF010078
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Feb 2025 07:41:17 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hm0pxj0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 07:41:17 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 7 Feb 2025 07:41:16 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 7 Feb 2025 07:41:15 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/8] ffmpeg: fix CVE-2024-35365
Date: Fri, 7 Feb 2025 15:41:06 +0000
Message-ID: <20250207154113.281835-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=PqlpbxM3 c=1 sm=1 tr=0 ts=67a6299d cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=UqCG9HQmAAAA:8 a=YH4T7oyaAAAA:8 a=b4Hp6kgha0tOKkJaIcgA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=yvBOfwjK7_2gsrmNK_ll:22
X-Proofpoint-ORIG-GUID: vQUaBmvrbm_KALXSkzE3m2Y0uH8dUHgp
X-Proofpoint-GUID: vQUaBmvrbm_KALXSkzE3m2Y0uH8dUHgp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_07,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502070119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 15:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210984

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg version n6.1.1 has a double-free vulnerability in the fftools/ffmpeg_mux_init.c
component of FFmpeg, specifically within the new_stream_audio function.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35365.patch        | 62 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch
new file mode 100644
index 0000000000..2b5646e07c
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch
@@ -0,0 +1,62 @@
+From ced5c5fdb8634d39ca9472a2026b2d2fea16c4e5 Mon Sep 17 00:00:00 2001
+From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+Date: Mon, 25 Mar 2024 16:54:25 +0100
+Subject: [PATCH] fftools/ffmpeg_mux_init: Fix double-free on error
+
+MATCH_PER_STREAM_OPT iterates over all options of a given
+OptionDef and tests whether they apply to the current stream;
+if so, they are set to ost->apad, otherwise, the code errors
+out. If no error happens, ost->apad is av_strdup'ed in order
+to take ownership of this pointer.
+
+But this means that setting it originally was premature,
+as it leads to double-frees when an error happens lateron.
+This can simply be reproduced with
+ffmpeg -filter_complex anullsrc  -apad bar -apad:n baz -f null -
+This is a regression since 83ace80bfd80fcdba2c65fa1d554923ea931d5bd.
+
+Fix this by using a temporary variable instead of directly
+setting ost->apad. Also only strdup the string if it actually
+is != NULL.
+
+Reviewed-by: Marth64 <marth64@proxyid.net>
+Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+
+CVE: CVE-2024-35365
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/ced5c5fdb8634d39ca9472a2026b2d2fea16c4e5]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ fftools/ffmpeg_mux_init.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/fftools/ffmpeg_mux_init.c b/fftools/ffmpeg_mux_init.c
+index 63a25a3..685c064 100644
+--- a/fftools/ffmpeg_mux_init.c
++++ b/fftools/ffmpeg_mux_init.c
+@@ -845,6 +845,7 @@ static int new_stream_audio(Muxer *mux, const OptionsContext *o,
+         int channels = 0;
+         char *layout = NULL;
+         char *sample_fmt = NULL;
++        const char *apad = NULL;
+
+         MATCH_PER_STREAM_OPT(audio_channels, i, channels, oc, st);
+         if (channels) {
+@@ -882,8 +883,12 @@ static int new_stream_audio(Muxer *mux, const OptionsContext *o,
+
+         MATCH_PER_STREAM_OPT(audio_sample_rate, i, audio_enc->sample_rate, oc, st);
+
+-        MATCH_PER_STREAM_OPT(apad, str, ost->apad, oc, st);
+-        ost->apad = av_strdup(ost->apad);
++        MATCH_PER_STREAM_OPT(apad, str, apad, oc, st);
++        if (apad) {
++            ost->apad = av_strdup(apad);
++            if (!ost->apad)
++                return AVERROR(ENOMEM);
++        }
+
+ #if FFMPEG_OPT_MAP_CHANNEL
+         /* check for channel mapping for this audio stream */
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index c3cfc87669..fb3f954904 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -40,6 +40,7 @@ SRC_URI = " \
     file://CVE-2024-35366.patch \
     file://CVE-2024-35367.patch \
     file://CVE-2024-35368.patch \
+    file://CVE-2024-35365.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


