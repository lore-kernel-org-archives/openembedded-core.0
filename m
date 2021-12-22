Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940ADC433F5
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 14:13:13 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.19596.1640182392510292955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:13:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gLmyzNJ3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso2740064pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mUMpZJwi6ez/BrebpAjVAQqiHYaKlTqXHyMgeLrcjL0=;
        b=gLmyzNJ300bT8Y7g2wruQBT6RFhxn7a2teKM0pWBlInJMMf1C+cc80S+dGzOgKQk+g
         PMxmPMn73qedgnhmJl/aOkBktRmRWcLlmltzcv2H0yyQG3QKggbzlofnOUsEOHxECImW
         A6fCtwdn/QW4AJblg68VpueyPe07EVs+rsTmEtfv9l+Awr5V1KNVQ3GXKTN5gn00Y9ji
         l6EFaNuOKN351QijBSeXeSmDyKJGGhyTdXm8tTDXhoPSzm49/2I1OgFWORrife6vm/7I
         1ZrhYJH21ztCqidtyFP9LSSpJtkAIzwNjFK2OiBBAFN3z2Uj6SFFoqwNZyVV8DQgK3PI
         olwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mUMpZJwi6ez/BrebpAjVAQqiHYaKlTqXHyMgeLrcjL0=;
        b=Rn46VnR8rObBY3NQ0ihp1UW6G69zYLxWzJjzzePSYKNuSgIvQvp6hIhnB9LxT8LpUh
         +Wgr9RDU1OOlqt42vgdVXg1Bt4dR3h5mbVp7lKGIpBpgdb3rEGdTr6TkQQEOEQymXZM5
         qNJuWDBY3A8land/G64C9Mln21nX6v4lwP51VIWWWjI2kA6hvJPOWbf/gv7LNFkoaDtu
         tN9BdPeBYvu7voth/oEa4lUPiEpuJ17OeucKNwBDyvjMiKGJ1hNCxNc/g6eHmr+chxuH
         Wbn5IgFCbbK2y8QoNfTJmpR4BzKctWevWrYlperM9qpNYSyqGAN9l/76OkLoNRdJ/clb
         kJGw==
X-Gm-Message-State: AOAM531jJMiv+TTWl5TBOLRMwwR9OjbLuWvDO3JS3yiHbtgQV0KRdrNg
	9Jf/10iLruH5sbEUxg//YeR+WoUBdGLGwf3y
X-Google-Smtp-Source: 
 ABdhPJzznIKC53nHAAE35co7EAGTlaKRzOQvIEeP2rBoLAScScMoxMBULbtk7n7YbJcchP5WEmd/9g==
X-Received: by 2002:a17:902:7609:b0:148:daa5:8133 with SMTP id
 k9-20020a170902760900b00148daa58133mr2912007pll.48.1640182391503;
        Wed, 22 Dec 2021 06:13:11 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id l6sm902849pfu.63.2021.12.22.06.13.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 06:13:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/14] gstreamer1.0: fix failing ptest
Date: Wed, 22 Dec 2021 04:12:26 -1000
Message-Id: 
 <a3fe157cfd965d46d7ba30df92a0e80b5ab24a1f.1640181998.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640181998.git.steve@sakoman.com>
References: <cover.1640181998.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 14:13:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159958

From: Anuj Mittal <anuj.mittal@intel.com>

Backport a patch to increase the timeout that might help with the
intermittent seek test failure.

[YOCTO #14194]
[YOCTO #14669]

(From OE-Core rev: a7dc7a35334ad634926a1386f4a56b27aad3ce68)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b90027aac9fa41b3dc98765151d761df8dabb97)
Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-use-too-strict-timeout-for-validati.patch | 33 +++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.16.3.bb          |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
new file mode 100644
index 0000000000..e32f3c101f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
@@ -0,0 +1,33 @@
+From 1db36347d05d88835519368442e9aa89c64091ad Mon Sep 17 00:00:00 2001
+From: Seungha Yang <seungha@centricular.com>
+Date: Tue, 15 Sep 2020 00:54:58 +0900
+Subject: [PATCH] tests: seek: Don't use too strict timeout for validation
+
+Expected segment-done message might not be seen within expected
+time if system is not powerful enough.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/625>
+
+Upstream-Status: Backport [https://cgit.freedesktop.org/gstreamer/gstreamer/commit?id=f44312ae5d831438fcf8041162079c65321c588c]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ tests/check/pipelines/seek.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/check/pipelines/seek.c b/tests/check/pipelines/seek.c
+index 28bb8846d..5f7447bc5 100644
+--- a/tests/check/pipelines/seek.c
++++ b/tests/check/pipelines/seek.c
+@@ -521,7 +521,7 @@ GST_START_TEST (test_loopback_2)
+ 
+   GST_INFO ("wait for segment done message");
+ 
+-  msg = gst_bus_timed_pop_filtered (bus, (GstClockTime) 2 * GST_SECOND,
++  msg = gst_bus_timed_pop_filtered (bus, GST_CLOCK_TIME_NONE,
+       GST_MESSAGE_SEGMENT_DONE | GST_MESSAGE_ERROR);
+   fail_unless (msg, "no message within the timed window");
+   fail_unless_equals_string (GST_MESSAGE_TYPE_NAME (msg), "segment-done");
+-- 
+2.29.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
index a516fabdaf..236d6034d6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://0003-meson-Add-valgrind-feature.patch \
     file://0004-meson-Add-option-for-installed-tests.patch \
     file://0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch \
+    file://0006-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
 "
 SRC_URI[md5sum] = "beecf6965a17fb17fa3b262fd36df70a"
 SRC_URI[sha256sum] = "692f037968e454e508b0f71d9674e2e26c78475021407fcf8193b1c7e59543c7"
-- 
2.25.1


