Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A546C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 19:23:33 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29032.1785698605335352368
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 12:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Gu0VnyRt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202608021923236f7d23982c00020742-0r3rjc@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202608021923236f7d23982c00020742
        for <openembedded-core@lists.openembedded.org>;
        Sun, 02 Aug 2026 21:23:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=JTLTyvZ+nCnLczzsV2XAAAqSTkNDhggiCKdeXqnxhUE=;
 b=Gu0VnyRtz+ozHwP94V8jJvEJ5LK/J5LMI9oEjHutUWDHYSgku/kxAdcuqdzxLBCGFqs859
 YvLNdivdoQTAf3/bzqGIfMaUobm4bEPPz64/PmRfPUzfGQQLMsktzodC9TrR+KLFdHSk/IyP
 pLeE/O9Lq0HD8U2nUq6DOg+anV09NEUIpgrS6SLPcodZXFxoHsSO5xMNrLpm6zqSTLVGjP4e
 MfRDS2wGsXVL6NaqIbGIdJl2D7OpHfAl3mJsKitc4ehZTuXgi2ffhBRuDAGdWdWnsW+uxQl4
 TMbxUD4JEo/AoXDJ7qyeJYFtjMGaNXK8l38ViuzSKdcaSHQf0RcmqYxA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 5/7] gstreamer1.0: disable an intermittently failing test
Date: Sun,  2 Aug 2026 21:22:32 +0200
Message-ID: <20260802192234.1725830-5-peter.marko@siemens.com>
In-Reply-To: <20260802192234.1725830-1-peter.marko@siemens.com>
References: <20260802192234.1725830-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 19:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242568

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 79ec3a84acc65594942ca9352fddf93d90952d71)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
index 44dc350eb3..83a78fabd0 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
@@ -23,4 +23,8 @@ GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,parser_pull_short_read"
 # https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3524
 GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,parser_convert_duration,parser_pull_frame_growth,parser_reverse_playback"
 
+# Intermittent fail
+# https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5163
+GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,test_device_monitor"
+
 gnome-desktop-testing-runner --parallel=4 gstreamer "$@"

