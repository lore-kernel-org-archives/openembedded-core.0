Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C84C982C3
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 12:13:17 +0000 (UTC)
Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13334.1789560785946635924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 05:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=j6hdNRsa;
 spf=pass (domain: einfochips.com, ip: 216.150.161.27, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=2834; q=dns/txt;
  s=NAESA-Selector1; t=1789560793; x=1821096793;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=hw5fgZe/sFV5aS0VEuFa099h0M2Jvkv+GZJCe1zh4hk=;
  b=j6hdNRsaD0OOjvlFsuUb4Kt3mMNsloSJHN2axhsGp48lEYS9pAtoH9m7
   vZQdOYSUpoP0nILkiDa/1hcIhICRhl28kWLMWyvB5KcGqpAyZmsMvb5qV
   Zp8REXGbXI1IhASSV0695qxVO9j2dRI//z8+61ptB6hrp2bHtVV+wmHwQ
   nLzOzwbYuvqs5MWyjUbxWoJ6o/OwbwrAz1AfdaSIseexe68Al3bqtmEGB
   vXIG5gkvI1UH/K27dvs8E63hUluJ8UeFd+5E2WC34SMGX5fUtsZ1dlOBX
   B0RBrFZKQdw2BSW4Z82Pp+U2HqLDIWacsI2a/nznUhc4Nx5Jdj/g2EXaS
   g==;
X-CSE-ConnectionGUID: W9ZQUbDFR9qsqWI3RS3ing==
X-CSE-MsgGUID: SleASL9fQ+eB1aL2A+QKlw==
X-IronPort-AV: E=Sophos;i="6.27,103,1787032800"; 
   d="scan'208";a="63580023"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa06out.arrow.com with ESMTP; 16 Sep 2026 06:13:12 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose,v2][oe-core][PATCH 05/10] ffmpeg: Fix for CVE-2026-64834
Date: Wed, 16 Sep 2026 17:39:28 +0530
Message-ID: <20260916121258.1699611-5-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916121258.1699611-1-bhavesh.maheshwari@einfochips.com>
References: <20260916121258.1699611-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245959

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/11d5f475be95d22d5f0692220cc772b116abc632
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-64834

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
changes in v2:
- rebased on new CVE fix
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
index 35153b81a9..c00c3f32b7 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-64831.patch \
            file://CVE-2026-64832.patch \
            file://CVE-2026-64833.patch \
+           file://CVE-2026-64834.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


