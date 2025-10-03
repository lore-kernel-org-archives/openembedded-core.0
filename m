Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708D6CAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 16:48:13 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.876.1759510085304741876
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 09:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Jmhcbi5o;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b5d80f5a23eso2831164a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 09:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759510084; x=1760114884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTEtzof6NgUpl1t5qflhylg+UXj9Rlu71LnqNRPI67M=;
        b=Jmhcbi5ojkue6ymSmvZmrzi6NSAgh+Xk+1vkJwoZM/k9biaPNLAp3X1bOy6/DRSjFE
         zWDT0bFh0DZCtaBZm5axR0aBYr6S0F5k+KtLUqvwQUDLLibR4wchBspPwTs5ebtnnsrQ
         ZaFF+KPcHGU62F1fLiAnZGryrvw3LBOM4N+C7AfaVr2aKH2W8kpwvMcYdvM6Q41prm21
         wGfRu13e4siK6VYz6Lz8eWDp3ZCfDxYvdT3zQ9jUhtEzAUfs/melTccZWQpHXVvf+Q97
         V1LX4sxrxUuaGJc5THeHRS63CRY4/9/I6rtlIyVtDMA2pn9oDYub1wIotaj4LrFRs/Qf
         yJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759510084; x=1760114884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTEtzof6NgUpl1t5qflhylg+UXj9Rlu71LnqNRPI67M=;
        b=RdNGg/cwo7PAF0+ktjRm6RhAmyZytCBvDKcFxaJUVQ9EnGKwG+2lWxZ72X10kbuTEz
         QsuMzEScAtyVmhyBwdEUOR78O8dy0xIXZl6Z+DDYotksiXSj4qKROK5GZ/ASQeBEHl7m
         ypSeFIn+tXLPQBH/FwXLXegNcMs9ne/h6DcSLv5jqhgz8NQ48lUmILWt3Ct52tP/yFs0
         D+GWcBT4qjbnKV4WXEQh8RZDDkiwXjXEzjzy+bOYlMYsYeEnoQGPiy3kMFvpCX2yXuF7
         9s+6+fzDDfrlbQJnIxKQePhweMicf1EFm52u65MlMlDHE1ZGjGclfCfZVt+M6FaIPaXp
         et8w==
X-Gm-Message-State: AOJu0Yx0BhoSR4g/xIMTE7V9bgymfUUXCGlLEV+h8oPZg2lLCKH8/xTZ
	kSxNuu36IN32EiuhWu04K9Fsh9vDHiPcMBYU3qNZmBNnr0FWLjEpCR5UgFB0fFgfE5xlxQmAMwK
	O69q7
X-Gm-Gg: ASbGncsHjCNgLc/2y/pWZ5eGPdWHL3/poGYW274922rpSMza3VhbB3IEP1rAejP23yw
	dTew2DnSgLxg9yZ5MVc4OZBqlLcBxpdcw1Gcspr5Xb0uGdEvjb8CIJ5eqjc5SAZLiilk/1ZNhAA
	47Oe8vKG2pr7GMWbiZiulPkLZj4yjwjISkOtkIkeKC8leBjL3rENsKTBWgHbOqCrldSC3Gmx5Hg
	maE/ji35ioC7Hr7vyiPY71UbUFN2i0deZWiJmwZ4hEkqbEL49HzzCeWwffzDSVvZWuOw/ayJEkj
	sDFFxmfeedFHb5bYnJpnLIOJOIsr4tM8EmWJHkxdgGS0l4U5q0/4RYbFfntsX4M0A4DkZPb1QxT
	Lh+iEHVHOI6cQ/XeqZSCHg5cqjey+jIZWgrT1qrrAs1B6AEfQ
X-Google-Smtp-Source: AGHT+IHyXEJTkEmbG06oVFz9ueCH2+o3WTzumsduXjSU5ueh4EhjXbNeCwAsFCn28Nq8+5FA093FRg==
X-Received: by 2002:a17:902:f54f:b0:267:912b:2b36 with SMTP id d9443c01a7336-28e99dab947mr44832695ad.23.1759510084423;
        Fri, 03 Oct 2025 09:48:04 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bdb:26c8:eafe:889c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d568bsm54352445ad.100.2025.10.03.09.48.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 09:48:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/8] gstreamer1.0-plugins-bad: Fix CVE-2025-3887
Date: Fri,  3 Oct 2025 09:47:48 -0700
Message-ID: <7ef632c2a85e42c16b5509edec822705a236cafb.1759509931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759509931.git.steve@sakoman.com>
References: <cover.1759509931.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 16:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224404

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/5463f0e09768ca90aa8c58357c1f4c645db580db
& https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/bcaab3609805ea10fb3d9ac0c9d947b4c3563948

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2025-3887-1.patch                     | 50 ++++++++++
 .../CVE-2025-3887-2.patch                     | 95 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.22.12.bb       |  2 +
 3 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-1.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-2.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-1.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-1.patch
new file mode 100644
index 0000000000..3508f62409
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-1.patch
@@ -0,0 +1,50 @@
+From 5463f0e09768ca90aa8c58357c1f4c645db580db Mon Sep 17 00:00:00 2001
+From: Seungha Yang <seungha@centricular.com>
+Date: Sat, 15 Mar 2025 22:39:44 +0900
+Subject: [PATCH] h265parser: Fix max_dec_pic_buffering_minus1 bound check
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
+index 44b7237..5d5a2db 100644
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
+@@ -1861,7 +1863,7 @@ gst_h265_parse_vps (GstH265NalUnit * nalu, GstH265VPS * vps)
+   for (i =
+       (vps->sub_layer_ordering_info_present_flag ? 0 :
+           vps->max_sub_layers_minus1); i <= vps->max_sub_layers_minus1; i++) {
+-    READ_UE_MAX (&nr, vps->max_dec_pic_buffering_minus1[i], G_MAXUINT32 - 1);
++    READ_UE_MAX (&nr, vps->max_dec_pic_buffering_minus1[i], MAX_DPB_SIZE - 1);
+     READ_UE_MAX (&nr, vps->max_num_reorder_pics[i],
+         vps->max_dec_pic_buffering_minus1[i]);
+     READ_UE_MAX (&nr, vps->max_latency_increase_plus1[i], G_MAXUINT32 - 1);
+@@ -2048,7 +2050,7 @@ gst_h265_parse_sps (GstH265Parser * parser, GstH265NalUnit * nalu,
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
index 0000000000..be663c2530
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-2.patch
@@ -0,0 +1,95 @@
+From bcaab3609805ea10fb3d9ac0c9d947b4c3563948 Mon Sep 17 00:00:00 2001
+From: Seungha Yang <seungha@centricular.com>
+Date: Sat, 15 Mar 2025 23:48:52 +0900
+Subject: [PATCH] h265parser: Fix num_long_term_pics bound check
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
+index 5d5a2db..abcc05d 100644
+--- a/gst-libs/gst/codecparsers/gsth265parser.c
++++ b/gst-libs/gst/codecparsers/gsth265parser.c
+@@ -2779,6 +2779,8 @@ gst_h265_parser_parse_slice_hdr (GstH265Parser * parser,
+       READ_UINT8 (&nr, slice->colour_plane_id, 2);
+ 
+     if (!GST_H265_IS_NAL_TYPE_IDR (nalu->type)) {
++      const GstH265ShortTermRefPicSet *ref_pic_sets = NULL;
++
+       READ_UINT16 (&nr, slice->pic_order_cnt_lsb,
+           (sps->log2_max_pic_order_cnt_lsb_minus4 + 4));
+ 
+@@ -2795,23 +2797,55 @@ gst_h265_parser_parse_slice_hdr (GstH265Parser * parser,
+         slice->short_term_ref_pic_set_size =
+             (nal_reader_get_pos (&nr) - pos) -
+             (8 * (nal_reader_get_epb_count (&nr) - epb_pos));
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
+         guint pos = nal_reader_get_pos (&nr);
+         guint epb_pos = nal_reader_get_epb_count (&nr);
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
index 01c95ac85f..e4fa2a412f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
@@ -9,6 +9,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch \
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
+           file://CVE-2025-3887-1.patch \
+           file://CVE-2025-3887-2.patch \
            "
 SRC_URI[sha256sum] = "388b4c4412f42e36a38b17cc34119bc11879bd4d9fbd4ff6d03b2c7fc6b4d494"
 
-- 
2.43.0


