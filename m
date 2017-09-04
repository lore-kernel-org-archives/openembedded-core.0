Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 47ABF6022F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 08:23:48 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id b9so4033518wra.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 01:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=YKz5eAKDo1rMvqj6v/eaRTMNbKbx1a+s9marSAUSRrM=;
	b=TZQmU5LdzXbC5RsFv+82IZaqCgKkujAN096JqFOJGsImbgJ9DCjnJLYqbQAbrsozEh
	yxyiaVkymxWDYMUtHzz/YdZLN7UtGAatozn5+Xm398373a6mwYVcKAS/eIdYiuSdcA+d
	pmm/ZIXBaBuqfDCuiRpM9tD+4yde1a9U7M4MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YKz5eAKDo1rMvqj6v/eaRTMNbKbx1a+s9marSAUSRrM=;
	b=Fomv820XsHzj2puPrWig9T5aw9jjKS0faU1WYBrkqavKVIGqjr5azlMlVynZepuPrL
	3wc4fpptKghjnXiVM2RLP31NqXSts6AUT0h+KhT2hj+9m29jeqdkdauIl2+N30CiMDgU
	gDKncWSvJC92SgIcNHPdhvHIadsgcBj151CqBcWgm/+YzYlooEqpmrfTp2R/ka0QDgSC
	O8ZhGFYpubDJJsJuRbBBmu9+bt6hwKFilzlbwlCka9OF2e+Tr47Y25GkvX/m/kwwhr1e
	JPqlflsQmwLLnof89xpW1+whuzNqPj903wQwQnwzgBWo95rrVloUWrguFoFHFru1LWMz
	/vPw==
X-Gm-Message-State: AHPjjUia8qoMBEr7i7AuQ1DZBvbqZvYuMA16nhos/ZJABHdDKBWVLkx1
	mLDsuS1C17jCeXchs7I+Rw==
X-Google-Smtp-Source: ADKCNb6IT/6v3AfutHkISMV5a4RhwEDxq4TbX6M6OdNKOVqgx9B3Y4ezSF176gyKdPNmuFss7JDqpw==
X-Received: by 10.223.142.101 with SMTP id n92mr241635wrb.174.1504513429522;
	Mon, 04 Sep 2017 01:23:49 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	g15sm5204177wrb.79.2017.09.04.01.23.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Sep 2017 01:23:48 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Sep 2017 10:23:34 +0200
Message-Id: <20170904082334.28661-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH v2] gstreamer1.0-plugins-good: fix 4k playback for v4l2 decoder
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Sep 2017 08:23:49 -0000

Backport a fix already merged upstream in master and 1.12 branch, it fixes 4K video
playback on any platform that uses v4l2 codecs, such as Dragonboard 820c.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../0001-v4l2-Fix-4K-colorimetry.patch             | 48 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_1.12.2.bb  |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Fix-4K-colorimetry.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Fix-4K-colorimetry.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Fix-4K-colorimetry.patch
new file mode 100644
index 0000000000..f78818aa17
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Fix-4K-colorimetry.patch
@@ -0,0 +1,48 @@
+From 545646cccba243236e10362fe7325f89be57da1f Mon Sep 17 00:00:00 2001
+From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
+Date: Tue, 18 Jul 2017 11:28:37 -0400
+Subject: [PATCH] v4l2: Fix 4K colorimetry
+
+Since 1.6, the transfer function for BT2020 has been changed from BT709
+to BT2020_12. It's the same function, but with more precision. As a side
+effect, the V4L2 colorpsace didn't match GStreamer colorspace. When
+GStreamer ended up making a guess, it would not match anything supported
+by V4L2 anymore. This this by using BT2020_12 for BT2020 colorspace and
+BT2020 transfer function in replacement of BT709 whenever a 4K
+resolution is detected.
+
+Upstream-Status: Backport
+Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
+
+---
+ sys/v4l2/gstv4l2object.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
+index 61244455f..aae2c55e7 100644
+--- a/sys/v4l2/gstv4l2object.c
++++ b/sys/v4l2/gstv4l2object.c
+@@ -1960,7 +1960,7 @@ gst_v4l2_object_get_colorspace (struct v4l2_format *fmt,
+     case V4L2_COLORSPACE_BT2020:
+       cinfo->range = GST_VIDEO_COLOR_RANGE_16_235;
+       cinfo->matrix = GST_VIDEO_COLOR_MATRIX_BT2020;
+-      cinfo->transfer = GST_VIDEO_TRANSFER_BT709;
++      cinfo->transfer = GST_VIDEO_TRANSFER_BT2020_12;
+       cinfo->primaries = GST_VIDEO_COLOR_PRIMARIES_BT2020;
+       break;
+     case V4L2_COLORSPACE_SMPTE240M:
+@@ -2062,7 +2062,10 @@ gst_v4l2_object_get_colorspace (struct v4l2_format *fmt,
+ 
+   switch (transfer) {
+     case V4L2_XFER_FUNC_709:
+-      cinfo->transfer = GST_VIDEO_TRANSFER_BT709;
++      if (fmt->fmt.pix.height > 2160)
++        cinfo->transfer = GST_VIDEO_TRANSFER_BT2020_12;
++      else
++        cinfo->transfer = GST_VIDEO_TRANSFER_BT709;
+       break;
+     case V4L2_XFER_FUNC_SRGB:
+       cinfo->transfer = GST_VIDEO_TRANSFER_SRGB;
+-- 
+2.14.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.2.bb
index 3d38f007dc..f9593c99aa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.2.bb
@@ -10,6 +10,7 @@ SRC_URI = " \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
+    file://0001-v4l2-Fix-4K-colorimetry.patch \
 "
 SRC_URI[md5sum] = "20254217d9805484532e08ff1c3aa296"
 SRC_URI[sha256sum] = "5591ee7208ab30289a30658a82b76bf87169c927572d9b794f3a41ed48e1ee96"
-- 
2.11.0


