Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3A6E7718F
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 17:29:03 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.66270.1735579740185494160
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 09:29:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LHzeYoJn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202412301728587bf896a6a935a8b331-48bkuu@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202412301728587bf896a6a935a8b331
        for <openembedded-core@lists.openembedded.org>;
        Mon, 30 Dec 2024 18:28:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=EquzGJkdqXzxDTVrj84Zlz95Jndg4r8RIxtvV79CrkI=;
 b=LHzeYoJnQY2ogbpRTqNdHuSe283hQ8trq8HwAchncl/ub+qRbgM0QTwrrn0iHgDIOdOPey
 utTBt6hLtwavoCNa7c40JQjRUY67DuWrFDdoqMCqyBAw7lTImenTe8NrdtLaobf1w01Ab6fB
 gk0IPBLRy2PWuie4EstQPJv+NeDjqwZGNQPUpsWJc0ezHO7I7BhDYSCfre7YMLmThI6uF2f5
 9c27rUYieHdR+pQlH/Wgb7d+96S/f6WclbgCz/8xesw62GjUJgHl0+jRc3YoUBztLz9gw1TX
 QHVaVjaC0+RPtcGUaaMTzLk4T5MXMrf6SKD5M6T7VLJjV37ON3jGqJ0w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 10/16] gstreamer1.0-plugins-base: patch CVE-2024-47600
Date: Mon, 30 Dec 2024 18:27:17 +0100
Message-Id: <20241230172723.3644270-10-peter.marko@siemens.com>
In-Reply-To: <20241230172723.3644270-1-peter.marko@siemens.com>
References: <20241230172723.3644270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 17:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209174

From: Peter Marko <peter.marko@siemens.com>

Pick commit from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8034

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...-print-channel-layout-for-more-than-.patch | 38 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-discoverer-Don-t-print-channel-layout-for-more-than-.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-discoverer-Don-t-print-channel-layout-for-more-than-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-discoverer-Don-t-print-channel-layout-for-more-than-.patch
new file mode 100644
index 00000000000..6762f256e05
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-discoverer-Don-t-print-channel-layout-for-more-than-.patch
@@ -0,0 +1,38 @@
+From aa07d94c10d71fac389dbbb264a59c1f6117eead Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 18:19:30 +0300
+Subject: [PATCH] discoverer: Don't print channel layout for more than 64
+ channels
+
+64+ channels are always unpositioned / unknown layout.
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-248
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3864
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8034>
+
+CVE: CVE-2024-47600
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/aa07d94c10d71fac389dbbb264a59c1f6117eead]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tools/gst-discoverer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/gst-discoverer.c b/tools/gst-discoverer.c
+index e3f048bed5..4a2a1b4bc4 100644
+--- a/tools/gst-discoverer.c
++++ b/tools/gst-discoverer.c
+@@ -222,7 +222,7 @@ format_channel_mask (GstDiscovererAudioInfo * ainfo)
+ 
+   channel_mask = gst_discoverer_audio_info_get_channel_mask (ainfo);
+ 
+-  if (channel_mask != 0) {
++  if (channel_mask != 0 && channels <= 64) {
+     gst_audio_channel_positions_from_mask (channels, channel_mask, position);
+ 
+     for (i = 0; i < channels; i++) {
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index 793b8afc3d7..982389d6575 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0008-ssaparse-Search-for-closing-brace-after-opening-brac.patch \
            file://0009-ssaparse-Don-t-use-strstr-on-strings-that-are-potent.patch \
            file://0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch \
+           file://0011-discoverer-Don-t-print-channel-layout-for-more-than-.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.30.2


