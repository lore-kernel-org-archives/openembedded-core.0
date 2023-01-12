Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F05C63797
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 02:33:44 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.45242.1673490820064774024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 18:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=GJPOYzaJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id o13so14245009pjg.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 18:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ul7LwdV60gybaykpx0E+SMqsSYsxLLt3eChOaxMH+zk=;
        b=GJPOYzaJyI5pqfY16jClbacWLWXxsJVZi02tOvmL+kzKbsxUvvQAttkCPo7EOOa7in
         9FxFnKlGbw1Gr/cJOtaFDFDWBIL4CzP1yFkK18wGwFx/RD1AB26ByB79kCt3TxtaMFSq
         gG80mQqsaKH2U87U/xi3nOWUtbQnVQ/zHeOQVg9rHTa6fqyY1v/cMBA7anqb3HnkCex8
         w3h3JnnsU4xUnPLrrUWhvpHKizsmOx2Ym7vZqmPoe3HYSC7arueOlPenX2PgIIdV6wcf
         PGoNa/bM96t0DknM4DOOTXRYQfJeSMZwsmfGI7nxOl+ad48F13hAYdSXPtHCYQ9LJ6wn
         hP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ul7LwdV60gybaykpx0E+SMqsSYsxLLt3eChOaxMH+zk=;
        b=Q3WJoel2dZEr78fsyYRe/7EYUu5L8eq2iCR+0jCevPi/MHcc0jDAh3Th9vT44agIpE
         OKBfvPJsMTakvqQZzGHr3Um++WrhML6wA3Jln93TZmFKHiHiLGbDgBKVDX8lvHKyPKiZ
         25NX3ykDVJIyMrah6J0+ysPdCxSXN30L7bJmtKTdGnCu3vbu+OIjh0G2q2rUebNTxZHE
         YM95MMx2/X5bI6mmMzKbl03g9O12Zc3KpIj7S8u1XzFtqWItQQhc8qCVJEMWXBbp7hBu
         rdng32eqmh2UvqstL8cEq0u1/FkyuakoFEwUUqKE3qSCbkXefcuQQ/M/Li0axLFyKsqP
         JaRw==
X-Gm-Message-State: AFqh2koM2AMLZ+0oQDo36LqTLC4HV7Bx3nQWRq/BChCDXRnVB9nVA70z
	dQezXsX8qyPrnJ05r8ijhtFDB9tD2zlIBUGFi7E=
X-Google-Smtp-Source: AMrXdXv/zmMeX0t+cEBnF325RTRWYyRx58iuI4ylXo2in+j532vTstNvgVYU5fEJzCiCxWuHW0+/hg==
X-Received: by 2002:a17:902:7601:b0:192:8e8b:bcf with SMTP id k1-20020a170902760100b001928e8b0bcfmr51683333pll.56.1673490819018;
        Wed, 11 Jan 2023 18:33:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902cecb00b00192d389db91sm11006719plg.75.2023.01.11.18.33.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 18:33:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/11] Revert "gstreamer1.0: disable flaky gstbin:test_watch_for_state_change test"
Date: Wed, 11 Jan 2023 16:33:10 -1000
Message-Id: <dffca759c7b280282197650f5cd783664789898c.1673490673.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673490673.git.steve@sakoman.com>
References: <cover.1673490673.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 02:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175782

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


