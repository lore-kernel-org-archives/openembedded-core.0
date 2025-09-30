Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0C4CCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 11:57:50 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.23638.1759233465771967364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 04:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AkfDu0VN;
 spf=pass (domain: mvista.com, ip: 209.85.210.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77f343231fcso3311424b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 04:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1759233465; x=1759838265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XPOnP6nd4OWmaU4GmGFrTh2gTbHeXtxgbbylUv9tKzw=;
        b=AkfDu0VNlQ2E8LLrSm6r08f9c2MIOhOnObRgBPtRbhXoqDyFuvWGw5jmNXVrEGfhc1
         Eb8Yn9ncRg9NGXoWemmD7VNpxlG/iazuY4sIa7iDmxekrf1S5+eWHPDH5GlAavaPAlOf
         B4Sl0BpM3w/kUozRBrWRnF5m/9oDRCxA8YZQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759233465; x=1759838265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPOnP6nd4OWmaU4GmGFrTh2gTbHeXtxgbbylUv9tKzw=;
        b=KqeH3j2iVHDVJsjhJtaBReOpb2MevI9EwfUQZhQhm2wL+aOy4LGhZfJuW27pLe+1Wi
         lg9/I7dyGIdTt2vbDi/xZybkZF/PuySXRsOTXAd/VI+jUnz63YXB23V9/J92h/xyscT0
         XiiuE0b8MBA09HdPpaE4vwFO5GEwBggpY7ZlEg8/RHXbYKuqUZW2bLUf9Gg03+pqCWEZ
         qzLG3OeBewGkrQhzkYnQrtUxuh0ID4zw45p6rCcTJ2WqQYkGbrDKhsiPdcIyD7psve4b
         XMk4N+UYg/IHcw+tyuhZwzdVVqhNgAmkbu7ylHHzM/ZPwHqfHG8Czggy8OlQy7QMDO60
         javg==
X-Gm-Message-State: AOJu0Yx7EVxw8TbxQxnkRGBVmqO1ApA06TKommHbETItngk+UjiaH0PA
	ZOqhzdc43gdLqxa0efMX+TqPkzToGM9yypcBfNywqfFHoxEVd1gZjqaHU9XUW44JweeOUAq3VK9
	Vhpv+gDI=
X-Gm-Gg: ASbGncvUjvYIExbVpESRY6Hb6GRSRICj3ZKNcRt+KR+geZ7ePZQztL2BY5O7VLthrjI
	xh/j6jYE5YbekABMYIZzJGw8XnQrEGanAcv6TrpvtIIhMIApVLCN7PX53JwD5zL1+DNJksqHkjQ
	TeYNOnBF7uZZ/zxOWTZknT3y3p+3z+YT0SQSrCC2q+375jCldgfKBwM/wxoMdotXWqTOsdhOHMT
	OMICqAA0jLbttFHYYxTZAdemEkcKEc3MOzWiuDnklybo78Ehp/q+7G5oWba3c4V5+3m1qaFh6PJ
	Ci10JBz5fob5FkHCk3u3BdoqhQuDPw5Q2gDhW866Wy1iWx3+yjMkjw71Z93Px60ghQG52xxy0+n
	g24932YqwHdFKkIUhZskJAzU+ZIL7JoYWFs6fh07FQHdWpe9JSKWT15eSd7noS34/y09txwU=
X-Google-Smtp-Source: AGHT+IEe1Ob4D77h4ovBHBZnNzjRYGM1jhxpPyqM7cnTzJFa5bDCCGHyndv2bqNLnFK1i4C+AuTnCw==
X-Received: by 2002:a05:6a21:78c:b0:300:f598:9179 with SMTP id adf61e73a8af0-300f5989321mr14713083637.15.1759233464485;
        Tue, 30 Sep 2025 04:57:44 -0700 (PDT)
Received: from localhost.localdomain ([123.201.170.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53bb255sm13828115a12.5.2025.09.30.04.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 04:57:43 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] gstreamer1.0-plugins-bad: Fix CVE-2025-3887
Date: Tue, 30 Sep 2025 17:27:24 +0530
Message-Id: <20250930115724.239288-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 11:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224184

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/5463f0e09768ca90aa8c58357c1f4c645db580db
& https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/bcaab3609805ea10fb3d9ac0c9d947b4c3563948

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


