Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A769BC4332F
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 00:11:23 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.148329.1672099873636968439
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Dec 2022 16:11:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qY0bTdcj;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so5969335wms.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 16:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t5XiPsdx2ZOM8RNYhzeuKFnJseashWq0Oggaz83gv1w=;
        b=qY0bTdcjQAqnUD3Sl2rBshF2YMhH0M+WxIbONxXy7+RdMFi6e/6OZlIfpUcV4AvRE4
         cado6qi4102FcExZEe+h/9N9Pt3HLvwAz9j2ZeQoowa/tPb6saHW0+WbiAARij50wCUZ
         1Ejg2BAiuqVU2rIz3mVSmXpyxPG3Y+J8eco2d9rr5AVaVQwdoIO5bKJvezTWR3D+f0T5
         Hfc5yvXc2JCVboifcOUs/C2X+RLf7ILJryoBGbkEfGJhorAWgKDclXraaPU/CuSZN4+6
         XZbzdpKgTgf4BdamnKhabZH8Ei5CNG18Q5XvZ1b3kd5Ck1XJWPaWlc/HAU7eqgcZ7jJp
         ND/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5XiPsdx2ZOM8RNYhzeuKFnJseashWq0Oggaz83gv1w=;
        b=z/wRgt1Q3TgH41Y14HlfAMN9WXZZrKvdJq+puInQLl1O1PvMkyIZzfo/qkK6fmVCEn
         AcLhVv5fEfg9KPmHlk16RXS7BTNzUQS8M0/h40QMNKrR/Jga97pdJuzQ4/6EAFXcfsIV
         WGY6NCQraH/94Hhpp+zvvTCp3TJcQj09XBzaMZdUDK7/JpeziEmz9zZnSsKINx1YqhOh
         NvSa8l8LdvTYDT9zrHAFKK37l0pY0Lu7c2O5DtWyn7LuyOtAI2K1BO/twXHDYcPT5GAS
         in+ojp4uG1xnV7WspnsRtVU0/wW4nou4EiDe65b1/Kf8g9Kby9mccC9f7oFRtS69yzpq
         1NAg==
X-Gm-Message-State: AFqh2krXwvARcYWvRVJrXfDWT18Fg/6WOIsp6cmTcFcYdYoEZ6E8HA14
	zttPVFBpzFSXT/8nq9hsSm5H7x4iosk=
X-Google-Smtp-Source: AMrXdXtWuc1CIIVgxPq6oZao9oRyHUKsM8SI9iuU4Y33Qw0LJGZSsUaVyFU7/UYXnv+oKL6y4jKTzg==
X-Received: by 2002:a05:600c:4e4f:b0:3cf:9d32:db67 with SMTP id e15-20020a05600c4e4f00b003cf9d32db67mr13900185wmq.3.1672099871457;
        Mon, 26 Dec 2022 16:11:11 -0800 (PST)
Received: from fio.lan (11.77.115.89.rev.vodafone.pt. [89.115.77.11])
        by smtp.gmail.com with ESMTPSA id q20-20020a1ce914000000b003b4935f04a4sm18160747wmc.5.2022.12.26.16.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 16:11:11 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 1/2] Revert "gstreamer1.0: disable flaky gstbin:test_watch_for_state_change test"
Date: Tue, 27 Dec 2022 00:10:54 +0000
Message-Id: <20221227001055.126232-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 00:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175025

This reverts commit 220a527d269f146bdabd66040b5bee7de9e3fd3f.

- Drop this patch and use the upstream solution
  https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2643

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...bin-test_watch_for_state_change-test.patch | 107 ------------------
 .../gstreamer/gstreamer1.0_1.20.5.bb          |   1 -
 2 files changed, 108 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-remove-gstbin-test_watch_for_state_change-test.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-remove-gstbin-test_watch_for_state_change-test.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-remove-gstbin-test_watch_for_state_change-test.patch
deleted file mode 100644
index f51df6d20b..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-remove-gstbin-test_watch_for_state_change-test.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From b935abba3d8fa3ea1ce384c08e650afd8c20b78a Mon Sep 17 00:00:00 2001
-From: Claudius Heine <ch@denx.de>
-Date: Wed, 2 Feb 2022 13:47:02 +0100
-Subject: [PATCH] tests: remove gstbin:test_watch_for_state_change testcase
-
-This testcase seems to be flaky, and upstream marked it as such:
-https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/778
-
-This patch removes the testcase to avoid it interfering with out ptest.
-
-Signed-off-by: Claudius Heine <ch@denx.de>
-
-Upstream-Status: Inappropriate [needs proper upstream fix]
----
- tests/check/gst/gstbin.c        | 69 -------------------
- 1 file changed, 69 deletions(-)
-
-diff --git a/tests/check/gst/gstbin.c b/tests/check/gst/gstbin.c
-index e366d5fe20..ac29d81474 100644
---- a/tests/check/gst/gstbin.c
-+++ b/tests/check/gst/gstbin.c
-@@ -691,74 +691,6 @@ GST_START_TEST (test_message_state_changed_children)
- 
- GST_END_TEST;
- 
--GST_START_TEST (test_watch_for_state_change)
--{
--  GstElement *src, *sink, *bin;
--  GstBus *bus;
--  GstStateChangeReturn ret;
--
--  bin = gst_element_factory_make ("bin", NULL);
--  fail_unless (bin != NULL, "Could not create bin");
--
--  bus = g_object_new (gst_bus_get_type (), NULL);
--  gst_object_ref_sink (bus);
--  gst_element_set_bus (GST_ELEMENT_CAST (bin), bus);
--
--  src = gst_element_factory_make ("fakesrc", NULL);
--  fail_if (src == NULL, "Could not create fakesrc");
--  sink = gst_element_factory_make ("fakesink", NULL);
--  fail_if (sink == NULL, "Could not create fakesink");
--
--  gst_bin_add (GST_BIN (bin), sink);
--  gst_bin_add (GST_BIN (bin), src);
--
--  fail_unless (gst_element_link (src, sink), "could not link src and sink");
--
--  /* change state, spawning two times three messages */
--  ret = gst_element_set_state (GST_ELEMENT (bin), GST_STATE_PAUSED);
--  fail_unless (ret == GST_STATE_CHANGE_ASYNC);
--  ret =
--      gst_element_get_state (GST_ELEMENT (bin), NULL, NULL,
--      GST_CLOCK_TIME_NONE);
--  fail_unless (ret == GST_STATE_CHANGE_SUCCESS);
--
--  pop_state_changed (bus, 6);
--  pop_async_done (bus);
--  pop_latency (bus);
--
--  fail_unless (gst_bus_have_pending (bus) == FALSE,
--      "Unexpected messages on bus");
--
--  ret = gst_element_set_state (GST_ELEMENT (bin), GST_STATE_PLAYING);
--  fail_unless (ret == GST_STATE_CHANGE_SUCCESS);
--
--  pop_state_changed (bus, 3);
--
--  /* this one might return either SUCCESS or ASYNC, likely SUCCESS */
--  ret = gst_element_set_state (GST_ELEMENT (bin), GST_STATE_PAUSED);
--  gst_element_get_state (GST_ELEMENT (bin), NULL, NULL, GST_CLOCK_TIME_NONE);
--
--  pop_state_changed (bus, 3);
--  if (ret == GST_STATE_CHANGE_ASYNC) {
--    pop_async_done (bus);
--    pop_latency (bus);
--  }
--
--  fail_unless (gst_bus_have_pending (bus) == FALSE,
--      "Unexpected messages on bus");
--
--  gst_bus_set_flushing (bus, TRUE);
--
--  ret = gst_element_set_state (GST_ELEMENT (bin), GST_STATE_NULL);
--  fail_unless (ret == GST_STATE_CHANGE_SUCCESS);
--
--  /* clean up */
--  gst_object_unref (bus);
--  gst_object_unref (bin);
--}
--
--GST_END_TEST;
--
- GST_START_TEST (test_state_change_error_message)
- {
-   GstElement *src, *sink, *bin;
-@@ -1956,7 +1888,6 @@ gst_bin_suite (void)
-   tcase_add_test (tc_chain, test_message_state_changed);
-   tcase_add_test (tc_chain, test_message_state_changed_child);
-   tcase_add_test (tc_chain, test_message_state_changed_children);
--  tcase_add_test (tc_chain, test_watch_for_state_change);
-   tcase_add_test (tc_chain, test_state_change_error_message);
-   tcase_add_test (tc_chain, test_add_linked);
-   tcase_add_test (tc_chain, test_add_self);
--- 
-2.33.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
index bb4dba3861..5a96764780 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
@@ -21,7 +21,6 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0002-tests-add-support-for-install-the-tests.patch;striplevel=3 \
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
-           file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
            "
 SRC_URI[sha256sum] = "5a19083faaf361d21fc391124f78ba6d609be55845a82fa8f658230e5fa03dff"
 
-- 
2.39.0


