Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC0ECA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 06:50:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3283.1755759055183849158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 23:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AlpT94GU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0328589c10=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L5Ysaj1787075
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 23:50:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=EEerTaX1FoL1Au0jCRIx
	r2FRkWpJ26q1bg1BjH56rTA=; b=AlpT94GUtTeakK3lgfeTGP76tIZdST7iuljb
	qAypCGXkN/q131i0493KPTHOVMmpNmUESaJq23tbpxxnT4Go1V7BqQEPIWZNOMiY
	ME5LFMPM0gNjihMCM6WaT2QuaHR7ppgfFL0jhBmSX6VEm/LZ7ARPdzNThdIhaI7O
	qsymz5ZCivDIldxdLJrhtRzPVRAqxpsyu0fd+HvVXLIQEPQ2l11sWbYWow9bfTKo
	2EAgVpyFXq09k6qOXIYdrCewX8/Z6Gpjdfp5XVORQI7WI5ZaDMZdOQOmb+dGEJdG
	GEfhI31T3Mte9XLtCeKT1Zz03cB9wpIIw84v6V/EEsI5NiQnZQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydq9srd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 23:50:54 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 20 Aug 2025 23:50:32 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 20 Aug 2025 23:50:31 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/1] ffmpeg: fix CVE-2025-1594
Date: Thu, 21 Aug 2025 12:20:43 +0530
Message-ID: <20250821065043.2408702-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDA1MSBTYWx0ZWRfX9k/zx8SIUm85
 63yDlJ5k8XPDvoGqP9j6jyg1fL77XVC4GlbOmmpEMFtOwQcL11cyd8X2qmG1OkTyPe1Hl5Gx7Yd
 01WhO/ga5oCruO27kpQ5wiffVZ3cP8sLsa51VyRgXnB+jGxivxPz1Zt4XzYUwKULBNl8rLe4dZQ
 av0ND/fx18uaAuDThy7vkrz49X1Y5MwkBYMJb3u4WJLrwnkv8UeM4CGzFw7SETM5xZIxUwM8/du
 Ocf5Y26Q1VuRS/X4+fxEZgHb0hN842FFtB09qOO4IeiDFoWTd21cMRjuBVYNkcSHiYpuHTfh4h0
 4qw8kr0/Qi851Xf5+2VT2V6v2EqITvRZ/evElZLblvPtAysE40iroxEjpSF+Co5SqKe9QLxav30
 7zG0Qu9QlnuSdc7KsU1i6x/hLffcqg==
X-Proofpoint-GUID: mFYBt10VJLDi-sstO35B3Nr_7JwD9gmH
X-Authority-Analysis: v=2.4 cv=aKupab9m c=1 sm=1 tr=0 ts=68a6c1ce cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=Lc-MQgJufMy_30ze4IUA:9
 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: mFYBt10VJLDi-sstO35B3Nr_7JwD9gmH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 06:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222218

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability, which was classified as critical, was found in FFmpeg up to 7.1.
This affects the function ff_aac_search_for_tns of the file libavcodec/aacenc_tns.c
of the component AAC Encoder. The manipulation leads to stack-based buffer overflow.
It is possible to initiate the attack remotely. The exploit has been disclosed to the
public and may be used.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-1594.patch         | 105 ++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
new file mode 100644
index 0000000000..af71055c02
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
@@ -0,0 +1,105 @@
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
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
index c0112757f0..dbd0a3f270 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
@@ -34,6 +34,7 @@ SRC_URI = " \
     file://CVE-2024-35369.patch \
     file://CVE-2025-25473.patch \
     file://CVE-2025-22921.patch \
+    file://CVE-2025-1594.patch \
 "
 
 SRC_URI[sha256sum] = "bc5f1e4a4d283a6492354684ee1124129c52293bcfc6a9169193539fbece3487"
-- 
2.40.0


