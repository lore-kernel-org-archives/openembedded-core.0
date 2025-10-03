Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1A7CCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 11:13:30 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.4922.1759490002902052720
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 04:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HYN3OaDT;
 spf=pass (domain: mvista.com, ip: 209.85.216.47, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3352018e050so1986703a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 04:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1759490002; x=1760094802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g9AVcdvKJl0veocp8zEffQNg6iDxXVlByYU3NGhoQlY=;
        b=HYN3OaDTbCxxGnMmirRhNq5xOhDGgBL4lWP9hqEuk7toHldFm5ZbrSbBDUhlt2OFqw
         6czBo4hjQpLNy0urEEFiEY1HCB9YtCt8I8p5qcQBH5ohZqYW3GUz6OGr5ypVP0G6VPLK
         Wr8mwigUpMB5amtGF84cZ9DGT1mx6ABM9KZho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759490002; x=1760094802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9AVcdvKJl0veocp8zEffQNg6iDxXVlByYU3NGhoQlY=;
        b=Eb56edZETiiEHowvLi+ciuY2NQD0J287ctS8zuLSso+8lhD/xmN7NlKqEeh8s17Qa2
         V6rOXGR4bJQEGLYQy1fn3d8pfKKPL9ugn8fJCRp7/aeweFe/pW+6J2/H6KFGCJliq8i6
         9mv4YDUOFMuS6+HQkjkGGsSWRJmwUYPZWZfwVxyb/85RRAhXtmDoBv0ytrKPG+o3eCBd
         sfOFRJ4Od5P65gf4eZBFClNlpzO9HTxyXcMUEBV6/+r7h1rjVXqMao+cdCnf4ipCGxUm
         ykdmQBqUaUPYJmYXHYtbNfJC40QUalN07DRKapjfAJNs9xmo1IHGJCpr1npetJh2G825
         ZHog==
X-Gm-Message-State: AOJu0YwlPNeCayB52eI6+pdXlrRJ5fBaYl/B630enZozyGV1Is7jmzaN
	2DJqVBbwJCFGhKiIkFS5abiLiDRZK/pI4RCBQQCewl/h3aab749bV2YoonJOHSLMtzpkdpaZI3V
	YpTEwUKs=
X-Gm-Gg: ASbGncuJ0sCtl9cV0YO4JxcoG22W5fUWt6ziFRAXmUlOR9OFZuMG3pa4YOYoOzYCHNg
	wBxA+ZmeRWsE31bYIWV0GJq0vtP72lhnQE11zZP99Hq7S/Zsl5MUmp8pQU2x2lIonJKoSzVzUxa
	sGQ3LeE5lobC1XhQVg2+2hQcxu7hbGNHPlee2xHdf9QpXM/Hwdl4aARjLSncwjaPArsnkrAv0xr
	RcEZoRBmqFubJm+sQjB82lhzJuA5Qz2iF8LNwTGhVuzhmSgr6+tdyWn80mbAhaorrojbC2k2gXh
	yfhdu1a9Wf84s2nfASQTGKKCPKhscgm/tQwa6cMhS2C65kNZOEf3+Zw4fBbKSu6ZyziRpFbpimD
	isaM+lStc0PhQu6v945SlTDqNbNLaixOYxWY9AS2vl9HJach1NvAf231EHT0cVw==
X-Google-Smtp-Source: AGHT+IGZCnq9yMaxR3fepGupoy+crbiNgSX6LJoSg1xB2T9c7D94vnPMiE+v+3Hbe+cMV87CW27ijg==
X-Received: by 2002:a17:90b:3e8d:b0:32b:9750:10e4 with SMTP id 98e67ed59e1d1-339c278597emr3246842a91.27.1759490001791;
        Fri, 03 Oct 2025 04:13:21 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8fcf:2616:d5f3:9b1a:e858:c159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3399ce04af0sm4854105a91.5.2025.10.03.04.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 04:13:21 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] gstreamer1.0-plugins-bad: Fix CVE-2025-3887
Date: Fri,  3 Oct 2025 16:43:13 +0530
Message-Id: <20251003111313.1785492-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 11:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224387

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/5463f0e09768ca90aa8c58357c1f4c645db580db
& https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/bcaab3609805ea10fb3d9ac0c9d947b4c3563948

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


