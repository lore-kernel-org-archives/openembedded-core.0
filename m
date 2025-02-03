Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BDAC02196
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:50 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.92645.1738600902107280530
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PlcgY9QC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso32204605e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600900; x=1739205700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPnnSTuXqAKcZxoRKtd8tzTioxwHayNiCilmNS0ITtE=;
        b=PlcgY9QC65kizn+3P0DcYhT2uHLHcRQLshe7AIOK5+J2ae2cb2Z7iGL8g2Q+UJIaOe
         N35uXMSW3eXtZQVtn7qDn5KQj8oDfW80b8TAVwrIiBlTwIry1gSSlw6y/W8rYQugaRNz
         pG71bxWDAQtpWi1nYsuyDyqhfpjTKxjv5nthw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600900; x=1739205700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPnnSTuXqAKcZxoRKtd8tzTioxwHayNiCilmNS0ITtE=;
        b=Le9ibktrT8THc0OkvtvXQUe33qI3snNqv1AuWHI49VKW/XKQH+HWLcw0vYMbeYRbQM
         6xsvhvDwT6S6fBLfv6zsZ7w8HhL09f10amVgBqj6zp6sA3PkHItKHRqkV8r3ZO07QnGI
         zEc0NO2bvMU8prcQQP3aYB3sufWXMnsyE8gLbbzCaNy6TeV7nggRQPVhm9AdtSnwbmiS
         48IL+az9VYxtK9ufo1ovtzCVGjJvAhVfqZK/ZKIBAv+qDYr8kudJxwMulQ3y5iPV1BwN
         hpITanJyD5WqymJZC63Te8j7ZquM0ugO5NJbzINhzHiZ3CgPaDS5at+ZERGK0vlpVWp7
         TXGQ==
X-Gm-Message-State: AOJu0YxgIJ3fGLvVotwGYgYSlN88YRgFFTZrIosig0+WhoW1jzgeoB6P
	Sv/Un60NC43gIj2E377IKqfQxPsAyK4GDaIiyWRDX1v0ij/jEsIsS9uPA20zJ+TR2C6HktMLSGs
	p
X-Gm-Gg: ASbGncvPRzLIfy5uVV+LH3vkLpu2UCtvlWFB2xaQWEzy7KHxtktvbWrYCGXZkKXoGEE
	7XXVjO/BREBEul8Yw4yITGD9IdjmhN6NOKs5p/fhH9yMpBVvEu6jFvLbrqOkOO+sKQNmMqllvfM
	KFzIasQzcYlSn/CZxm2UIoj+dUvKQZS6gV8p6HQusDbjZkP2rpWYUeKEQSUs8Gbnc6fm+oqSDhG
	n3EUydZHe2g+SxltlO9LhIhMjvStwK+TLX3pt05fFPFMzAHoZ/aqW84DFpx/zNiQm6wGSRFMSq8
	+8SNLMgIDoGHVb0X3xtNdwu17juNoOkJG8qwztPFC01j
X-Google-Smtp-Source: AGHT+IFxznPp1dtfxciw0M9P8rSRjLiYBNlwVQxwrNWqIbOK458i7bZVSI6CTIp9hyGeQQhdGNqXNQ==
X-Received: by 2002:a05:600c:1391:b0:431:60ec:7a96 with SMTP id 5b1f17b1804b1-438dc4223c4mr168458945e9.25.1738600899568;
        Mon, 03 Feb 2025 08:41:39 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:38 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/46] gstreamer1.0-plugins-{bad,ugly,base,good,rtsp-server}: upgrade 1.24.10 -> 1.24.12
Date: Mon,  3 Feb 2025 16:40:53 +0000
Message-ID: <20250203164130.3403325-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210682

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ninitialized-warnings-when-compiling-with.patch |  2 +-
 .../0002-avoid-including-sys-poll.h-directly.patch |  2 +-
 ...lve-missing-opencv-data-dir-in-yocto-buil.patch |  2 +-
 ...4.10.bb => gstreamer1.0-plugins-bad_1.24.12.bb} |  2 +-
 ...515-get-caps-from-src-pad-when-query-caps.patch |  2 +-
 ...2-ssaparse-enhance-SSA-text-lines-parsing.patch | 14 +++++++-------
 ...003-viv-fb-Make-sure-config.h-is-included.patch |  2 +-
 ....10.bb => gstreamer1.0-plugins-base_1.24.12.bb} |  2 +-
 ....10.bb => gstreamer1.0-plugins-good_1.24.12.bb} |  2 +-
 ....10.bb => gstreamer1.0-plugins-ugly_1.24.12.bb} |  2 +-
 ...4.10.bb => gstreamer1.0-rtsp-server_1.24.12.bb} |  2 +-
 11 files changed, 17 insertions(+), 17 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.10.bb => gstreamer1.0-plugins-bad_1.24.12.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.10.bb => gstreamer1.0-plugins-base_1.24.12.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.10.bb => gstreamer1.0-plugins-good_1.24.12.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.10.bb => gstreamer1.0-plugins-ugly_1.24.12.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.10.bb => gstreamer1.0-rtsp-server_1.24.12.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index f721103229b..4dd9febbf64 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From fce75512714cc21bd02fa1df95da4cea34bc3118 Mon Sep 17 00:00:00 2001
+From 9456674cea4a933d5fbc24230d307fe0f52588f3 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index 28d834dbd40..e6ae7f4bfec 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 48b7c48d484096f44ef5f6ac9df35c1e8c1aceff Mon Sep 17 00:00:00 2001
+From dd2b92fb70fed2799809c423fea79221a3e17108 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 5143009657a..4d0d0e26938 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 21bf2b1bb9f98d83c7257b0492a0dc70f5d0b9d9 Mon Sep 17 00:00:00 2001
+From bd389203124592cfd91fb020ea05a5e4ad1c1394 Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb
index 789e1aef8e3..91d91503596 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "1707e3103950c9baed364a8af2ba0495d6b113fcd36e1062dda5f582b8f8904d"
+SRC_URI[sha256sum] = "3d386af3d1dbd1a06c74a6251250c269b481e703f0e3255ba89ef6c1e063afea"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index cec68bd1f4a..e35ec026e4b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From 87865e7c96e40553bc39f7697fbc2ef68451725c Mon Sep 17 00:00:00 2001
+From e0478a9b3bb1b49c34aaf076152ed8e49cf909e0 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index 9e2e9a702c3..810a4ba6764 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 2dee5ae9ad92a06c73dd72f2ff2f731ce85a8baa Mon Sep 17 00:00:00 2001
+From 1b9887421de593854632571327b4918b880900c6 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
@@ -17,10 +17,10 @@ Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
 diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
 old mode 100644
 new mode 100755
-index 42fbb42..2dab51c
+index c162a54..bd8afd9
 --- a/gst/subparse/gstssaparse.c
 +++ b/gst/subparse/gstssaparse.c
-@@ -270,6 +270,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
+@@ -304,6 +304,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
   * gst_ssa_parse_push_line:
   * @parse: caller element
   * @txt: text to push
@@ -28,7 +28,7 @@ index 42fbb42..2dab51c
   * @start: timestamp for the buffer
   * @duration: duration for the buffer
   *
-@@ -279,27 +280,133 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
+@@ -313,27 +314,133 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
   * Returns: result of the push of the created buffer
   */
  static GstFlowReturn
@@ -173,7 +173,7 @@ index 42fbb42..2dab51c
    GST_LOG_OBJECT (parse, "Text : %s", t);
  
    if (gst_ssa_parse_remove_override_codes (parse, t)) {
-@@ -317,13 +424,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse, gchar * txt,
+@@ -351,13 +458,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse, gchar * txt,
    gst_buffer_fill (buf, 0, escaped, len + 1);
    gst_buffer_set_size (buf, len);
    g_free (escaped);
@@ -200,7 +200,7 @@ index 42fbb42..2dab51c
  
    ret = gst_pad_push (parse->srcpad, buf);
  
-@@ -343,6 +459,7 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
+@@ -377,6 +493,7 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
    GstClockTime ts;
    gchar *txt;
    GstMapInfo map;
@@ -208,7 +208,7 @@ index 42fbb42..2dab51c
  
    if (G_UNLIKELY (!parse->framed))
      goto not_framed;
-@@ -360,13 +477,14 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
+@@ -394,13 +511,14 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
    /* make double-sure it's 0-terminated and all */
    gst_buffer_map (buf, &map, GST_MAP_READ);
    txt = g_strndup ((gchar *) map.data, map.size);
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 032be93692c..8fa46d809ac 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 170070d4e7c653c68cdc6401eebfa94fa7d58838 Mon Sep 17 00:00:00 2001
+From 22a0e3a5288486991a15c48fdcb730eaa6dc08e5 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb
index 452685d2ea1..f4505d831e7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "ebd57b1be924c6e24f327dd55bab9d8fbaaebe5e1dc8fca784182ab2b12d23eb"
+SRC_URI[sha256sum] = "f6efbaa8fea8d00bc380bccca76a530527b1f083e8523eafb3e9b1e18bc653d3"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.12.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.12.bb
index 653aa1cfc4d..9cc2d462f69 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.12.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "fce748fa66d7a8ee1fb261489e59d01e3fa787623d6d5c35068416fe7cd0acb3"
+SRC_URI[sha256sum] = "d0e66e2f935d1575f6adbef7d0a2b3faba7360344383c51bf0233b39e0489a64"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb
index 607dc71971d..75f528216f2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "9df6fd85a7256241efbb25f84b337575e3b345266f5dab3849371e4694779f18"
+SRC_URI[sha256sum] = "19ed6eef4ea1a742234fb35e2cdb107168595a4dd409a9fac0b7a16543eee78b"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb
index a33c8c0027f..b23634dcf0e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "db21dfdd7bf2e718564d557378ada5358b411efe2a3e89e9f0f87a74537e2adc"
+SRC_URI[sha256sum] = "a335f73687d2efe22db94348c6893c73b53a2c6bc55ee7a590028ba196ddc623"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 

