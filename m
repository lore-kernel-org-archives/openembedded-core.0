Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F81BCA1016
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 13:38:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.39808.1756993110616869093
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 06:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oJVzq5yc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1342749dfd=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5849jTwg2540780
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Sep 2025 06:38:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=tY3MJa3ET3rj2Q8P95/g8UTqTSaOg5ewK1KqJfC2AXc=; b=oJVzq5ycJ2Aj
	nVcLb/O4IHdUBdIDuKJPQvXCuShnKi1Smt0kkFvUeopol7t6woDfsoeKdLLSE59a
	PvnfmIid2/lneiYZfzB+uBlUt5N3sHT22ccZbfb7Y49sP+5nBL5GwjB0Tzkm3rVc
	89yZNztXKUI/hCaMr3k4tBmCkRCE8DFGfTPVLFYWQ682H04CXEbikbMT8fOy8u15
	1tmaEkI+IqGYWUaHo21QaXtH5909kF/HOORfW2Vkb2LW6ozczuB15IAhJ0O6/Qwz
	MN8izro9ZqHG+AyatRA2AbMDiwet6ub3ww0N/ff91QvsRyYiq8LA1pvZNw4UzxiY
	wKDGhz23BQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7sb07m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 06:38:30 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 4 Sep 2025 06:36:49 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 4 Sep 2025 06:36:48 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 3/3] ffmpeg: fix CVE-2025-1594
Date: Thu, 4 Sep 2025 19:08:12 +0530
Message-ID: <20250904133812.2881582-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250904133812.2881582-1-archana.polampalli@windriver.com>
References: <20250904133812.2881582-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDEzMyBTYWx0ZWRfX/kTlqgmXWwns
 QQ+ErzCog8/sj4NEA7HSd68BLkxm2Pt3X7bwdaev4S3tu2A+C8/fgBOD05B5b7UbZs4dlItw7Dp
 A16Hfp0i/z21nE7W/LuJKGKWRbCPaNtlVZJvGC+fB+qlqX8KdOKnvGDP29MMOHi1jNU3MfQRAhO
 4sHB3qFyW0Lfvf9INZZ3DoimYaHq+laoV3ydA5CGMfCBD4MhWQM7NCDVH3kIlqOaRsAAkDKJkvY
 UYCsdJ9M7eRKW36M3kyLwPPm17qXBmFL7gWtvIhUZZRHgA763/sxGEhUCkSyEWWEz5rbN3gSiMx
 JRtn+n6hoFMo+orOrVcFnOBnUI4tJRwYp7DZnZVWFDgxj1UkT1DJArjzLyHl5w=
X-Proofpoint-GUID: d-wXcbYldoMPuvsAHPxGN-69iNhfVydS
X-Authority-Analysis: v=2.4 cv=M5BNKzws c=1 sm=1 tr=0 ts=68b99656 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=Lc-MQgJufMy_30ze4IUA:9
 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: d-wXcbYldoMPuvsAHPxGN-69iNhfVydS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 13:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222929

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability, which was classified as critical, was found in FFmpeg up to 7.1.
This affects the function ff_aac_search_for_tns of the file libavcodec/aacenc_tns.c
of the component AAC Encoder. The manipulation leads to stack-based buffer overflow.
It is possible to initiate the attack remotely. The exploit has been disclosed to
the public and may be used.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-1594.patch         | 104 ++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
new file mode 100644
index 0000000000..b8f0bc5781
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
@@ -0,0 +1,104 @@
+From bedfb6eca402037f5cbb115fa767d106b8c14f1c Mon Sep 17 00:00:00 2001
+From: Lynne <dev@lynne.ee>
+Date: Sat, 8 Feb 2025 04:35:31 +0100
+Subject: [PATCH] aacenc_tns: clamp filter direction energy measurement
+
+The issue is that:
+
+float en[2];
+...
+tns->n_filt[w] = is8 ? 1 : order != TNS_MAX_ORDER ? 2 : 3;
+for (g = 0; g < tns->n_filt[w]; g++) {
+    tns->direction[w][g] = slant != 2 ? slant : en[g] < en[!g];
+
+When using the AAC Main profile, n_filt = 3, and slant is by
+default 2 (normal long frames), g can go above 1.
+
+en is the evolution of energy in the frequency domain for every
+band at the given window. E.g. whether the energy is concentrated
+at the top of each band, or the bottom.
+
+For 2-pole filters, its straightforward.
+For 3-pole filters, we need more than 2 measurements.
+
+This commit properly implements support for 3-pole filters, by measuring
+the band energy across three areas.
+
+Do note that even xHE-AAC caps n_filt to 2, and only AAC Main allows
+n_filt == 3.
+
+Fixes https://trac.ffmpeg.org/ticket/11418
+
+CVE: CVE-2025-1594
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/bedfb6eca402037f5cbb115fa767d106b8c14f1c]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/aacenc_tns.c | 33 ++++++++++++++++++++++++---------
+ 1 file changed, 24 insertions(+), 9 deletions(-)
+
+diff --git a/libavcodec/aacenc_tns.c b/libavcodec/aacenc_tns.c
+index 8dc6dfc..9ea3506 100644
+--- a/libavcodec/aacenc_tns.c
++++ b/libavcodec/aacenc_tns.c
+@@ -172,6 +172,7 @@ void ff_aac_search_for_tns(AACEncContext *s, SingleChannelElement *sce)
+                       sce->ics.window_sequence[0] == LONG_START_SEQUENCE ? 0 : 2;
+     const int sfb_len = sfb_end - sfb_start;
+     const int coef_len = sce->ics.swb_offset[sfb_end] - sce->ics.swb_offset[sfb_start];
++    const int n_filt = is8 ? 1 : order != TNS_MAX_ORDER ? 2 : 3;
+
+     if (coef_len <= 0 || sfb_len <= 0) {
+         sce->tns.present = 0;
+@@ -179,16 +180,30 @@ void ff_aac_search_for_tns(AACEncContext *s, SingleChannelElement *sce)
+     }
+
+     for (w = 0; w < sce->ics.num_windows; w++) {
+-        float en[2] = {0.0f, 0.0f};
++	float en[4] = {0.0f, 0.0f, 0.0f, 0.0f};
+         int oc_start = 0, os_start = 0;
+         int coef_start = sce->ics.swb_offset[sfb_start];
+
+-        for (g = sfb_start; g < sce->ics.num_swb && g <= sfb_end; g++) {
+-            FFPsyBand *band = &s->psy.ch[s->cur_channel].psy_bands[w*16+g];
+-            if (g > sfb_start + (sfb_len/2))
+-                en[1] += band->energy;
+-            else
+-                en[0] += band->energy;
++	if (n_filt == 2) {
++            for (g = sfb_start; g < sce->ics.num_swb && g <= sfb_end; g++) {
++                FFPsyBand *band = &s->psy.ch[s->cur_channel].psy_bands[w*16+g];
++                    if (g > sfb_start + (sfb_len/2))
++                        en[1] += band->energy; /* End */
++                    else
++                        en[0] += band->energy; /* Start */
++            }
++            en[2] = en[0];
++        } else {
++            for (g = sfb_start; g < sce->ics.num_swb && g <= sfb_end; g++) {
++                FFPsyBand *band = &s->psy.ch[s->cur_channel].psy_bands[w*16+g];
++                    if (g > sfb_start + (sfb_len/2) + (sfb_len/4))
++                        en[2] += band->energy; /* End */
++                    else if (g > sfb_start + (sfb_len/2) - (sfb_len/4))
++                        en[1] += band->energy; /* Middle */
++                    else
++                        en[0] += band->energy; /* Start */
++            }
++            en[3] = en[0];
+         }
+
+         /* LPC */
+@@ -198,9 +213,9 @@ void ff_aac_search_for_tns(AACEncContext *s, SingleChannelElement *sce)
+         if (!order || !isfinite(gain) || gain < TNS_GAIN_THRESHOLD_LOW || gain > TNS_GAIN_THRESHOLD_HIGH)
+             continue;
+
+-        tns->n_filt[w] = is8 ? 1 : order != TNS_MAX_ORDER ? 2 : 3;
++	tns->n_filt[w] = n_filt;
+         for (g = 0; g < tns->n_filt[w]; g++) {
+-            tns->direction[w][g] = slant != 2 ? slant : en[g] < en[!g];
++	    tns->direction[w][g] = slant != 2 ? slant : en[g] < en[g + 1];
+             tns->order[w][g] = g < tns->n_filt[w] ? order/tns->n_filt[w] : order - oc_start;
+             tns->length[w][g] = g < tns->n_filt[w] ? sfb_len/tns->n_filt[w] : sfb_len - os_start;
+             quantize_coefs(&coefs[oc_start], tns->coef_idx[w][g], tns->coef[w][g],
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index 27a9a80e8c..a46cb3480a 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -52,6 +52,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0001.patch \
            file://CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch \
            file://CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0003.patch \
+           file://CVE-2025-1594.patch \
           "
 
 SRC_URI[sha256sum] = "04c70c377de233a4b217c2fdf76b19aeb225a287daeb2348bccd978c47b1a1db"
-- 
2.40.0


