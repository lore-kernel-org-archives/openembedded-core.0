Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCCDE77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 17:29:23 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.66661.1735579759984276247
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 09:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LmCiHnE7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20241230172921b31466cfc5d2ee7a70-y6ixf1@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20241230172921b31466cfc5d2ee7a70
        for <openembedded-core@lists.openembedded.org>;
        Mon, 30 Dec 2024 18:29:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=LhvLc1x9+PlRCkWpE3msB9WW4JMuaTnzY8I/tdjEe3o=;
 b=LmCiHnE7Ym4FkmJ+q/EERUkglppx8IDa7662Q5hJJubIHeSkbWNdUNG39kQynDv9SAwj7v
 0YPYWIPqM6HqzHRb/gk9Msy1bH6R2xgiUzLQsO4T+fQL3W4+oPZEwVC8sQ01mf9u4pgBcSLn
 1Et+mPpWf17flhoMy5g4wuSFRwaLCs3TzcCpey4L4ths06s+MOU9KRSNJlHwI0Ef1Cwq87ur
 759ilQNgkQ0vVbt5L/kA9pm/74oc9S3cBWPtoJhHH0Ggq2SKBxeCr2R4HTs9DMSFhvCYhk1U
 OE2pD38hNVkGgJhRmwNzuefEKpBfuw352i4LM0dsj4g3pX8G0ydeNMLA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 15/16] gstreamer1.0-plugins-base: patch CVE-2024-47835
Date: Mon, 30 Dec 2024 18:27:22 +0100
Message-Id: <20241230172723.3644270-15-peter.marko@siemens.com>
In-Reply-To: <20241230172723.3644270-1-peter.marko@siemens.com>
References: <20241230172723.3644270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 17:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209179

From: Peter Marko <peter.marko@siemens.com>

Pick commit from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8039

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...or-NULL-return-of-strchr-when-parsin.patch | 39 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0012-subparse-Check-for-NULL-return-of-strchr-when-parsin.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0012-subparse-Check-for-NULL-return-of-strchr-when-parsin.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0012-subparse-Check-for-NULL-return-of-strchr-when-parsin.patch
new file mode 100644
index 00000000000..b778e7053b4
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0012-subparse-Check-for-NULL-return-of-strchr-when-parsin.patch
@@ -0,0 +1,39 @@
+From 4c40f73b7002967e824ef34a5435282f4a0ea363 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Wed, 9 Oct 2024 11:23:47 -0400
+Subject: [PATCH] subparse: Check for NULL return of strchr() when parsing LRC
+ subtitles
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-263
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3892
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8039>
+
+CVE: CVE-2024-47835
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/4c40f73b7002967e824ef34a5435282f4a0ea363]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/subparse/gstsubparse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gst/subparse/gstsubparse.c b/gst/subparse/gstsubparse.c
+index 8d925524a6..7d286ed318 100644
+--- a/gst/subparse/gstsubparse.c
++++ b/gst/subparse/gstsubparse.c
+@@ -1068,6 +1068,11 @@ parse_lrc (ParserState * state, const gchar * line)
+     return NULL;
+ 
+   start = strchr (line, ']');
++  // sscanf() does not check for the trailing ] but only up to the last
++  // placeholder, so there might be no ] at the end.
++  if (!start)
++    return NULL;
++
+   if (start - line == 9)
+     milli = 10;
+   else
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index 982389d6575..05cb9568154 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0009-ssaparse-Don-t-use-strstr-on-strings-that-are-potent.patch \
            file://0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch \
            file://0011-discoverer-Don-t-print-channel-layout-for-more-than-.patch \
+           file://0012-subparse-Check-for-NULL-return-of-strchr-when-parsin.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.30.2


