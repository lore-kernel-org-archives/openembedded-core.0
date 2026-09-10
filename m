Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D561AC88E45
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:34:14 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14218.1789047242011078389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=FiwXxiXW;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=2830; q=dns/txt;
  s=NAESA-Selector1; t=1789047253; x=1820583253;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rf5PYzrs+2P9lyO+6GCLfXOrAlZwAwv6UL+MNOpZ3uo=;
  b=FiwXxiXWM/RorsaeMcHjl3f6PBQPj6pP85C6ibOt+1bioBnhXbFWj5E7
   //CKWmZ/6yhT9Sm31ACKQoPXMFCimn4d5fjG2ITpRKEecfd0KKz/pg/Jl
   +/vccfBzHH5Y9v256/UGfKnWL/Y2gtQp/+eTmHfmVTvvvcCvW3o+oWVxZ
   Y0H/eYPlYDe+L67+wWv9E4FaflcjpxStXV71ACgWlUlPQQZ6P/QhZwiW6
   cMW/Ry//lmeyYwS7Sqf6JzeXpKhy7sCYbwZQbO13ioixq/n5XUNXilbnW
   jKgUUwq6FYpCQk0AvobKdW1vhAsRkJ8HGllOH02hZf+Ok8Dp8yi5UD4ww
   w==;
X-CSE-ConnectionGUID: gzRF+7FwQWaHBmDN4guxMg==
X-CSE-MsgGUID: wyUfDTiWRmCpD81ojh+DvA==
X-IronPort-AV: E=Sophos;i="6.27,95,1787032800"; 
   d="scan'208";a="122105809"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa03out.arrow.com with ESMTP; 10 Sep 2026 07:34:12 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][oe-core][PATCH 05/10] ffmpeg: Fix for CVE-2026-64834
Date: Thu, 10 Sep 2026 19:01:39 +0530
Message-ID: <20260910133357.452394-5-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
References: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245574

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/11d5f475be95d22d5f0692220cc772b116abc632
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-64834

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-64834.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64834.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64834.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64834.patch
new file mode 100644
index 0000000000..d4a44d293c
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64834.patch
@@ -0,0 +1,36 @@
+From 9ac8fe453e443c3fc07bf85099cc93ca100d302f Mon Sep 17 00:00:00 2001
+From: Pavel Kohout <disclosure@aisle.com>
+Date: Tue, 30 Jun 2026 21:55:16 +0200
+Subject: [PATCH 3/9] avformat/rtpdec_asf: reject ASF objects smaller than
+ their header
+
+Fixes: infinite loop
+Fixes: MzWwJdpZF2Ls
+Fixes: c2f3eec445389d67afc8c699ba23915a20cae51c (Implement RTSP-MS/ASF packet parsing.)
+Found-by: Pavel Kohout (Aisle Research)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-64834
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/11d5f475be95d22d5f0692220cc772b116abc632]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavformat/rtpdec_asf.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libavformat/rtpdec_asf.c b/libavformat/rtpdec_asf.c
+index b3b346f..f7fa69e 100644
+--- a/libavformat/rtpdec_asf.c
++++ b/libavformat/rtpdec_asf.c
+@@ -56,6 +56,8 @@ static int rtp_asf_fix_header(uint8_t *buf, int len)
+         uint64_t chunksize = AV_RL64(p + sizeof(ff_asf_guid));
+         int skip = 6 * 8 + 3 * 4 + sizeof(ff_asf_guid) * 2;
+         if (memcmp(p, ff_asf_file_header, sizeof(ff_asf_guid))) {
++            if (chunksize < sizeof(ff_asf_guid) + 8)
++                return -1;
+             if (chunksize > end - p)
+                 return -1;
+             p += chunksize;
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index df7e218305..b988fe2293 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
            file://CVE-2026-64830.patch \
            file://CVE-2026-64833.patch \
+           file://CVE-2026-64834.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


