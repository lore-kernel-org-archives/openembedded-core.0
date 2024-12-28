Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4F3E77191
	for <webhook@archiver.kernel.org>; Sat, 28 Dec 2024 22:04:40 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.36408.1735423477039108938
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Dec 2024 14:04:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ucmOYxtB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202412282204349a45e5d9a1f2e4143a-vbp8yy@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202412282204349a45e5d9a1f2e4143a
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Dec 2024 23:04:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=wIDv53t5gfypb2JQSbM+sBH/4FGOmNi/ynboiDRQgq0=;
 b=ucmOYxtBUtE7vdVa0MXfeGN+DatWShNZsl3KClZuOU/vS4iSfNcyPtVVwn60p49a+xP8Py
 rANisg3tv47vKadanfV4lK6qucc5VJvB/H4udBHjK+38vnKwIy+CS3KU8eIXrSdHq9oJWZVp
 HOP2fe5vBP9VwZRWs5Y9xxYBBT4BHToCRUZDVaQLSz5GqRa9pLoAVpS0GIyPYnmEfvaK6Wcb
 RSVut4YKJ9PULPIgkX00hYtYMd4sP7DHDCG4aSCh/d+1A7qYu6QO3+rAYKwQWpYmbIbkAehL
 zrIvGcBL+04ncRhtZq8KsL7ODjB9+ZdVbxV4CR6crvWXEineBQ4k5R5A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH 2/4] gstreamer1.0: run ptests in parallel
Date: Sat, 28 Dec 2024 21:49:06 +0100
Message-Id: <20241228204908.2470952-3-peter.marko@siemens.com>
In-Reply-To: <20241228204908.2470952-1-peter.marko@siemens.com>
References: <20241228204908.2470952-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Dec 2024 22:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209125

From: Ross Burton <ross.burton@arm.com>

Run the ptests in four parallel jobs (reduces runtime from ~80s to ~20s
on my machine), and also pass any arguments in the scripts to make it
easier to run individual tests.

(From OE-Core rev: 87a9fadc71c8d3c1eb841c84c96146d5c56f1241)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...004-tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index 629b0563f6b..cd795fe0ec8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -59,7 +59,7 @@ index 0000000..cf7d31b
 +GST_PLUGIN_LOADING_WHITELIST="@GST_PLUGIN_LOADING_WHITELIST@"
 +GST_REGISTRY=@GST_REGISTRY@
 +GST_STATE_IGNORE_ELEMENTS="@GST_STATE_IGNORE_ELEMENTS@"
-+exec @TEST@
++exec @TEST@ "$@"
 diff --git a/tests/check/template.test.in b/tests/check/template.test.in
 index f701627..b74ef6a 100644
 --- a/tests/check/template.test.in
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
index 7fee5a3d09c..44dc350eb3b 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
@@ -23,4 +23,4 @@ GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,parser_pull_short_read"
 # https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3524
 GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,parser_convert_duration,parser_pull_frame_growth,parser_reverse_playback"
 
-gnome-desktop-testing-runner gstreamer
+gnome-desktop-testing-runner --parallel=4 gstreamer "$@"
-- 
2.30.2


