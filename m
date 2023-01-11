Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8E8C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 16:22:01 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.28424.1673454121156034449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 08:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=IKNHJ2QS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id q64so16381838pjq.4
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 08:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ul7LwdV60gybaykpx0E+SMqsSYsxLLt3eChOaxMH+zk=;
        b=IKNHJ2QSd61Xryp8+vx7lZVaBAvFRrc0uRdXMA1gINTavF/2kjXWvH9LhVZvT2yxrJ
         2k6rrS9mBRyWARxe8vCWSiEBwGhl7qwvHj4p5A+C9tejjIgzSz/FI+NH3+Wsu0AuRtF0
         RosDkwp8yhCeexQCvDhHI6b9+ZHcpZLMtwEqMEFyax7OdbT5I4H8DAhAQi4ODhjnjQdE
         Ht0XdDZBC8dOoe99ajFpNRP8a0Zwpevc+WamYWLk+QGmlrQ5D92V8su4rFF8T2U8QAts
         ykFAOsT5J78FY1jZf7vHhcBkEUM7g+aGDnvFObt476zzqfXOYHfqrrRYJO2nLBWNeEcV
         PXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ul7LwdV60gybaykpx0E+SMqsSYsxLLt3eChOaxMH+zk=;
        b=YQMWcBegur3ZT1yQN0j0wfdqzH1IGw/RTDzP3jKfEi36CdpvIQBhgWbKrQHaO3v7LS
         IEFN4kWHYejvs9MpF/7v5B8KH6Tw0cuZP13LOOsBZPaTGFS3rJxLJeqk5MEObZ3EPZ4u
         6DJpaV53cq5DMlOjiHVMDEqVCS44GTiAcN5FoFKqEpfzmk6QHkzod7asMzdpaZNvSY39
         6wFFR3SGXyXPdc8WJxyPWsOD/NGq36jQWxzXF3+zihu5WEwc1lfPGpO9VoPgh0NEYsh0
         XqyXy53HstA8QqlX37yTxDepmapPpd/S8/s5+3wabYfPZQ7QXZSt6rrLgU2YvTowBWY8
         8UUA==
X-Gm-Message-State: AFqh2kogE7w9D+RQ2nEND/obbwuke7I/mmz9cuGRVQlHvN+c3XywO90S
	mxDzH9pmSdvdQf2l9tF31EoqJiMyiO6wWHIaIlk=
X-Google-Smtp-Source: AMrXdXs1yUjbGWKpBPALnEIZpLaCjqqj7CUQ+AFGK9hd48l88XwJUBO3ptNcL+p+krkOMS4kOVSqyQ==
X-Received: by 2002:a17:903:228a:b0:191:cd3:aa74 with SMTP id b10-20020a170903228a00b001910cd3aa74mr96788451plh.24.1673454120133;
        Wed, 11 Jan 2023 08:22:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id u14-20020a63ef0e000000b0046feca0883fsm8685384pgh.64.2023.01.11.08.21.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 08:21:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/11] Revert "gstreamer1.0: disable flaky gstbin:test_watch_for_state_change test"
Date: Wed, 11 Jan 2023 06:21:35 -1000
Message-Id: <4576d4f014f7ac0831e37e760372e62d2e0ea17e.1673453368.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673453368.git.steve@sakoman.com>
References: <cover.1673453368.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 16:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175765

From: Jose Quaresma <quaresma.jose@gmail.com>

This reverts commit 220a527d269f146bdabd66040b5bee7de9e3fd3f.

- Drop this patch and use the upstream solution
  https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2643

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9660045d07a2b492ac48a1f1b08aa4288b45d64a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


