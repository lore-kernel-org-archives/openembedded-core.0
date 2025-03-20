Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AE3C36002
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 23:13:15 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.8790.1742512387706742712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 16:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=RlWCdjYw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250320231309354ad89aaa8192a7ed-9vzjzz@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250320231309354ad89aaa8192a7ed
        for <openembedded-core@lists.openembedded.org>;
        Fri, 21 Mar 2025 00:13:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6dvn8RMUFwAlR3a/gmF9VQKEp1MCGDOW9y9wVGvOuW4=;
 b=RlWCdjYwjs9mwTmMbDqUWzt3qDXmjo07l0dHE5YmfBhK9SacE/ezHr5w5dzx7YWUI+Qxhf
 /TEmyqzvC8MHSTAiHGQpChfKm17EKbZv7ruwMC54olthtsEEqp2KC/XAkMApX9mcyfEj13uB
 y8of7LINTlrMBhy6izEDCZeuq8aEJQrOMZ+MpHl4COt87ra9UiwS+Y2L83XqLVbrttRx0KkS
 uluYHWK/zUvocYVRdHUXpdcGwIkQJBCqpoyr11Ip5hFSZkqAbNju7EhXmzNi5lKCVMsoVDhK
 /B1G0oudD0peHlvaehKljypNojTlZUGaQriBF2e5zDiItEFRuWiGTiHw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 3/4] libmad: patch CVE-2017-8372 and CVE-2017-8373
Date: Fri, 21 Mar 2025 00:12:07 +0100
Message-Id: <20250320231208.1692902-3-peter.marko@siemens.com>
In-Reply-To: <20250320231208.1692902-1-peter.marko@siemens.com>
References: <20250320231208.1692902-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 23:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213431

From: Peter Marko <peter.marko@siemens.com>

Pick patch [1] from Debian based on [2] and [3].

[1] https://salsa.debian.org/multimedia-team/libmad/-/blob/debian/0.15.1b-11/debian/patches/md_size.diff?ref_type=tags
[2] https://security-tracker.debian.org/tracker/CVE-2017-8372
[3] https://security-tracker.debian.org/tracker/CVE-2017-8373

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libmad/CVE-2017-8372_CVE-2017-8373.patch  | 69 +++++++++++++++++++
 .../libmad/libmad_0.15.1b.bb                  |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-8372_CVE-2017-8373.patch

diff --git a/meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-8372_CVE-2017-8373.patch b/meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-8372_CVE-2017-8373.patch
new file mode 100644
index 0000000000..a57df492d0
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-8372_CVE-2017-8373.patch
@@ -0,0 +1,69 @@
+From 7e8f6e5118e31455924940141a761a1589e8d85d Mon Sep 17 00:00:00 2001
+From: Kurt Roeckx <kurt@roeckx.be>
+Date: Sun, 28 Jan 2018 15:44:08 +0100
+Subject: [PATCH] Check the size of the main data
+
+The main data to decode a frame can come from the current frame and part of the
+previous frame, the so called bit reservoir. si.main_data_begin is the part of
+the previous frame we need for this frame. frame_space is the amount of main
+data that can be in this frame, and next_md_begin is the part of this frame that
+is going to be used for the next frame.
+
+The maximum amount of data from a previous frame that the format allows is 511
+bytes. The maximum frame size for the defined bitrates is at MPEG 2.5 layer 2
+at 320 kbit/s and 8 kHz sample rate which gives 72 * (320000 / 8000) + 1 = 2881.
+So those defines are not large enough:
+ # define MAD_BUFFER_GUARD      8
+ # define MAD_BUFFER_MDLEN      (511 + 2048 + MAD_BUFFER_GUARD)
+
+There is also support for a "free" bitrate which allows you to create any frame
+size, which can be larger than the buffer.
+
+Changing the defines is not an option since it's part of the ABI, so we check
+that the main data fits in the bufer.
+
+The previous frame data is stored in *stream->main_data and contains
+stream->md_len bytes. If stream->md_len is larger than the data we
+need from the previous frame (si.main_data_begin) it still wouldn't fit
+in the buffer, so just keep the data that we need.
+
+Source: https://salsa.debian.org/multimedia-team/libmad/-/blob/debian/0.15.1b-11/debian/patches/md_size.diff?ref_type=tags
+
+CVE: CVE-2017-8372
+CVE: CVE-2017-8373
+Upstream-Status: Inactive-Upstream [lastrelease: 2018]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ layer3.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/layer3.c b/layer3.c
+index 4e5d3fa..7dc4ca6 100644
+--- a/layer3.c
++++ b/layer3.c
+@@ -2608,6 +2608,11 @@ int mad_layer_III(struct mad_stream *stream, struct mad_frame *frame)
+     next_md_begin = 0;
+ 
+   md_len = si.main_data_begin + frame_space - next_md_begin;
++  if (md_len + MAD_BUFFER_GUARD > MAD_BUFFER_MDLEN) {
++    stream->error = MAD_ERROR_LOSTSYNC;
++    stream->sync = 0;
++    return -1;
++  }
+ 
+   frame_used = 0;
+ 
+@@ -2625,8 +2630,11 @@ int mad_layer_III(struct mad_stream *stream, struct mad_frame *frame)
+       }
+     }
+     else {
+-      mad_bit_init(&ptr,
+-		   *stream->main_data + stream->md_len - si.main_data_begin);
++      memmove(stream->main_data,
++	*stream->main_data + stream->md_len - si.main_data_begin,
++	si.main_data_begin);
++      stream->md_len = si.main_data_begin;
++      mad_bit_init(&ptr, *stream->main_data);
+ 
+       if (md_len > si.main_data_begin) {
+ 	assert(stream->md_len + md_len -
diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index 2d63f9a804..b6668980da 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://downloads.sourceforge.net/mad/libmad-${PV}.tar.gz \
     file://obsolete_automake_macros.patch \
     file://automake-foreign.patch \
     file://0001-configure-Respect-the-cflags-from-environment.patch \
+    file://CVE-2017-8372_CVE-2017-8373.patch \
 "
 SRC_URI:append:toolchain-clang = " file://0004-Remove-clang-unsupported-compiler-flags.patch "
 

