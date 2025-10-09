Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECB2CCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:29 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.9237.1760038280986873791
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=K58rfgo/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so1106534b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038280; x=1760643080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svI1iKRSpRCatu8c/C1HYiLHrGxbwILsgJvS1n8sPtg=;
        b=K58rfgo/l4omGjf427rWJjSyNWeCH7xitx529VqCQfdLsqIkdtV4twJiX9hPXOvIX1
         AGwImXNkLcjuKWLBVTcCh8QYnl8l4d28JLnRY2gwvtEzd8HHThspHUXzFwup7qwih4Wl
         kcfYWGCPDLJiXX1idvrBnu4U6kt/qzzEbGQjjHuoldk9sTLBIDn6q4ThEgRm2XEFBKCY
         dV1RCBgLmYldGfRN9liS4V7RJyo4PF1S1MWWvoQlQP0+FjKv8RRzL2YFrOEhVdv8HmKo
         obOrDsz1PhAsmxJdp+XkYp2FUeP1Debj5fs31kDnJKeJybh+3usCWDbtCdZ+4IRyEk5L
         7RjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038280; x=1760643080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svI1iKRSpRCatu8c/C1HYiLHrGxbwILsgJvS1n8sPtg=;
        b=OWAPFQVLw1RKCYONzHDSqh3S2n6y4+zgWXi0TVYc+SvI2EgVg4lt8VwRv/WfRkHtSn
         TtalFOF86YQfNy5AeTsmBLoOU2FJIKaH+dRsoZrDbbGYH+Nmhhzbq1ywAGDbKbEp58wk
         5WzAP+I363xgUUI/wWJ5KKyANeWExgZafZLLnHxroulLlPRITUrkQMw6L8NLbYZ0RMiD
         +OiLFNKFhg79La32sWeOCyu9DZlD1U4RAM579hicNsfP8otRQmnlcex4rnBPmbTATvcK
         9klemw+f3VPUks3Tbu6kQgdmrqsIFVk7gI6l6qxc/JZgdo+YTL37z9GOgvHQKTj4Qt9j
         xFBw==
X-Gm-Message-State: AOJu0Yzo9ukw58kiPZ5TK3iZoWMbBmqHZCy7wOqi/nSn1hcH9wkICxUb
	wXxb2L6r9TNjNjKL2taBlkPfopQxdmjDdK7+MhInXAcn2tqHB+qoLJDbHD3jpZVCCwNxz66J2cM
	P/eu4
X-Gm-Gg: ASbGnct/CxwgDdgK7XRMp8dWKQGP62v1gbdVWSfhSYAW5sqkD6NuGTtBGQw2fbbYjZc
	K+ca9Yvfg6WjtE+tSgxR88Bdti2/muly811Q9u0Gt36UNU9FjkkyFdnvLnSfQIDqizflSsWSI0+
	4xFVXpTGP3g/hYa2yBkPyLSZ4/IMXzl55GXhMt/pTohZNezzfBrVnRbs2Jow3jAdoXgSMQGMY8G
	HkmRe4KLZ/IS78ofuTVokm8hTHWlmkeLqVkOHkWCjTmZ9mO/SdlwB4U1QTC5wST5HP9fH4gVc5t
	Hjx6RVDocQrHckFR4ajhh53w8MQaRe8Ri7dj6s4Jo1wXwfsdLviGxVUs05KnngDffMoD4lkxK8F
	G0DMO7e9JTVKmA/38z4xD+i7M1EDB6CRcsTjIgg==
X-Google-Smtp-Source: AGHT+IFciNw8bu2djuutK2uDV4rSM4GndywPk1FGO2pOnLLBc8WAen/kiJ8Jks459uMthhBUJN+gKg==
X-Received: by 2002:a05:6a00:8c8:b0:781:27a7:dd0e with SMTP id d2e1a72fcca58-79385ed5786mr8355318b3a.9.1760038279970;
        Thu, 09 Oct 2025 12:31:19 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/24] gstreamer1.0-plugins-bad: Fix CVE-2025-3887
Date: Thu,  9 Oct 2025 12:30:46 -0700
Message-ID: <a35bdbdb4d1dd77de7b85ab19d7354be6a11e8b2.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224621

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/5463f0e09768ca90aa8c58357c1f4c645db580db
& https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/bcaab3609805ea10fb3d9ac0c9d947b4c3563948

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2025-3887-1.patch                     | 50 ++++++++++
 .../CVE-2025-3887-2.patch                     | 93 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |  2 +
 3 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-1.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-2.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-1.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-1.patch
new file mode 100644
index 0000000000..8f4922a4ab
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-1.patch
@@ -0,0 +1,50 @@
+From 5463f0e09768ca90aa8c58357c1f4c645db580db Mon Sep 17 00:00:00 2001
+From: Seungha Yang <seungha@centricular.com>
+Date: Sat, 15 Mar 2025 22:39:44 +0900
+Subject: [PATCH 1/2] h265parser: Fix max_dec_pic_buffering_minus1 bound check
+
+Allowed max value is MaxDpbSize - 1
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8885>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/5463f0e09768ca90aa8c58357c1f4c645db580db]
+CVE: CVE-2025-3887
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ gst-libs/gst/codecparsers/gsth265parser.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/gst-libs/gst/codecparsers/gsth265parser.c b/gst-libs/gst/codecparsers/gsth265parser.c
+index 3db1c38..d02e32d 100644
+--- a/gst-libs/gst/codecparsers/gsth265parser.c
++++ b/gst-libs/gst/codecparsers/gsth265parser.c
+@@ -72,6 +72,8 @@
+ #include <string.h>
+ #include <math.h>
+ 
++#define MAX_DPB_SIZE 16
++
+ #ifndef GST_DISABLE_GST_DEBUG
+ #define GST_CAT_DEFAULT gst_h265_debug_category_get()
+ static GstDebugCategory *
+@@ -1686,7 +1688,7 @@ gst_h265_parse_vps (GstH265NalUnit * nalu, GstH265VPS * vps)
+   for (i =
+       (vps->sub_layer_ordering_info_present_flag ? 0 :
+           vps->max_sub_layers_minus1); i <= vps->max_sub_layers_minus1; i++) {
+-    READ_UE_MAX (&nr, vps->max_dec_pic_buffering_minus1[i], G_MAXUINT32 - 1);
++    READ_UE_MAX (&nr, vps->max_dec_pic_buffering_minus1[i], MAX_DPB_SIZE - 1);
+     READ_UE_MAX (&nr, vps->max_num_reorder_pics[i],
+         vps->max_dec_pic_buffering_minus1[i]);
+     READ_UE_MAX (&nr, vps->max_latency_increase_plus1[i], G_MAXUINT32 - 1);
+@@ -1882,7 +1884,7 @@ gst_h265_parse_sps (GstH265Parser * parser, GstH265NalUnit * nalu,
+   for (i =
+       (sps->sub_layer_ordering_info_present_flag ? 0 :
+           sps->max_sub_layers_minus1); i <= sps->max_sub_layers_minus1; i++) {
+-    READ_UE_MAX (&nr, sps->max_dec_pic_buffering_minus1[i], 16);
++    READ_UE_MAX (&nr, sps->max_dec_pic_buffering_minus1[i], MAX_DPB_SIZE - 1);
+     READ_UE_MAX (&nr, sps->max_num_reorder_pics[i],
+         sps->max_dec_pic_buffering_minus1[i]);
+     READ_UE_MAX (&nr, sps->max_latency_increase_plus1[i], G_MAXUINT32 - 1);
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-2.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-2.patch
new file mode 100644
index 0000000000..3f156f274d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-2.patch
@@ -0,0 +1,93 @@
+From bcaab3609805ea10fb3d9ac0c9d947b4c3563948 Mon Sep 17 00:00:00 2001
+From: Seungha Yang <seungha@centricular.com>
+Date: Sat, 15 Mar 2025 23:48:52 +0900
+Subject: [PATCH 2/2] h265parser: Fix num_long_term_pics bound check
+
+As defined in the spec 7.4.7.1, calculates allowed maximum
+value of num_long_term_pics
+
+Fixes ZDI-CAN-26596
+
+Fixes: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4285
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8885>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/bcaab3609805ea10fb3d9ac0c9d947b4c3563948]
+CVE: CVE-2025-3887
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ gst-libs/gst/codecparsers/gsth265parser.c | 40 +++++++++++++++++++++--
+ 1 file changed, 37 insertions(+), 3 deletions(-)
+
+diff --git a/gst-libs/gst/codecparsers/gsth265parser.c b/gst-libs/gst/codecparsers/gsth265parser.c
+index d02e32d..ad9751f 100644
+--- a/gst-libs/gst/codecparsers/gsth265parser.c
++++ b/gst-libs/gst/codecparsers/gsth265parser.c
+@@ -2513,6 +2513,8 @@ gst_h265_parser_parse_slice_hdr (GstH265Parser * parser,
+       READ_UINT8 (&nr, slice->colour_plane_id, 2);
+ 
+     if (!GST_H265_IS_NAL_TYPE_IDR (nalu->type)) {
++      const GstH265ShortTermRefPicSet *ref_pic_sets = NULL;
++
+       READ_UINT16 (&nr, slice->pic_order_cnt_lsb,
+           (sps->log2_max_pic_order_cnt_lsb_minus4 + 4));
+ 
+@@ -2525,21 +2527,53 @@ gst_h265_parser_parse_slice_hdr (GstH265Parser * parser,
+           goto error;
+ 
+         slice->short_term_ref_pic_set_size = nal_reader_get_pos (&nr) - pos;
++
++	ref_pic_sets = &slice->short_term_ref_pic_sets;
+       } else if (sps->num_short_term_ref_pic_sets > 1) {
+         const guint n = ceil_log2 (sps->num_short_term_ref_pic_sets);
+         READ_UINT8 (&nr, slice->short_term_ref_pic_set_idx, n);
+         CHECK_ALLOWED_MAX (slice->short_term_ref_pic_set_idx,
+             sps->num_short_term_ref_pic_sets - 1);
++	ref_pic_sets =
++	    &sps->short_term_ref_pic_set[slice->short_term_ref_pic_set_idx];
++      } else {
++	ref_pic_sets = &sps->short_term_ref_pic_set[0];
+       }
+ 
+       if (sps->long_term_ref_pics_present_flag) {
+         guint32 limit;
++	gint max_num_long_term_pics = 0;
++	gint TwoVersionsOfCurrDecPicFlag = 0;
+ 
+-        if (sps->num_long_term_ref_pics_sps > 0)
++        if (sps->num_long_term_ref_pics_sps > 0) {
+           READ_UE_MAX (&nr, slice->num_long_term_sps,
+               sps->num_long_term_ref_pics_sps);
+-
+-        READ_UE_MAX (&nr, slice->num_long_term_pics, 16);
++	}
++
++	/* 7.4.3.3.3 */
++	if (pps->pps_scc_extension_flag &&
++	    pps->pps_scc_extension_params.pps_curr_pic_ref_enabled_flag &&
++	    (sps->sample_adaptive_offset_enabled_flag ||
++	        !pps->deblocking_filter_disabled_flag ||
++		pps->deblocking_filter_override_enabled_flag)) {
++	  TwoVersionsOfCurrDecPicFlag = 1;
++	}
++
++	/* Calculated upper bound num_long_term_pics can have. 7.4.7.1 */
++	max_num_long_term_pics =
++	    /* sps_max_dec_pic_buffering_minus1[TemporalId], allowed max is
++	     * MaxDpbSize - 1 */
++	    MAX_DPB_SIZE - 1
++	    - (gint) slice->num_long_term_sps
++	    - (gint) ref_pic_sets->NumNegativePics
++	    - (gint) ref_pic_sets->NumPositivePics -
++	    TwoVersionsOfCurrDecPicFlag;
++	if (max_num_long_term_pics < 0) {
++	  GST_WARNING ("Invalid stream, too many reference pictures");
++	  goto error;
++	}
++
++        READ_UE_MAX (&nr, slice->num_long_term_pics, max_num_long_term_pics);
+         limit = slice->num_long_term_sps + slice->num_long_term_pics;
+         for (i = 0; i < limit; i++) {
+           if (i < slice->num_long_term_sps) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
index dbe2b64c32..80f6929c16 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
@@ -17,6 +17,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://CVE-2024-0444.patch \
            file://CVE-2023-44446.patch \
            file://CVE-2023-50186.patch \
+           file://CVE-2025-3887-1.patch \
+           file://CVE-2025-3887-2.patch \
            "
 SRC_URI[sha256sum] = "87251beebfd1325e5118cc67774061f6e8971761ca65a9e5957919610080d195"
 
-- 
2.43.0


