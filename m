Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D499DC43217
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:09:53 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.1795.1645114193250760821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jhT9kLlS;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id d10so8397632eje.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SWT9fjBLHZ/ucVPdyZyzVzM2CehLfMYYrifiraII83I=;
        b=jhT9kLlSjjAL/VmC/wsSf08ahPvwm4mPcOGKuktKZh0LjHVehFcK97gI3Zrer3SJWW
         rGfoGxnnOrdHrWJ1pruKwdtRcxT52oUOQnpdFnKFmZyO1KcNJ9s8foceHwqkpMzoC63Q
         ntc9Zk/4zr0aH7oaNzFo7GFsGBz2QMnP2F7keH4U8JJnCfZ2r/DTBQK8X/hqbmLD6bg6
         esDqKagqa51OPU0wqc/Gesj7p0zauVCv9hROzJXaJAMDES4QfWjZGDKDqTxo+8mP0qlp
         sstTPdj5IJBPAW+OaN1t98p8mjDazOxZ8kpFOw5wRwQzRHsBkjeiJyYsLnu1eoDb1Tjt
         3/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SWT9fjBLHZ/ucVPdyZyzVzM2CehLfMYYrifiraII83I=;
        b=qzjcU8A86JJjm0GHaTbpw1F1fEl+qvPCul2eDyF0hTvlZWAPMrHb8iomfDACEnOeqJ
         prPd972grnzT6FwhL/UXZ4JiTAVW8GhTwerjeCCg5BF2OSJLctjoOpehmjChg+rlqFIo
         RcbQtO0MqQA6fuO789o6+QT4hYmrw9r2taILr1AuUeTi7xlSYgMQIbI98SXfIBC+DkS8
         +xdI4yG+CCYbGMdG2PYnqgggdUop0iJL7JOtamN0NuQEUShnj0z1INdcaktfCvyccJr+
         Z06BH+ATU1UswAi5yRh4q2rYKayi1zMQvK55T05GmuGra+ioLhQqDLag12DvTvsmR8YC
         dF8w==
X-Gm-Message-State: AOAM530bA2+ZBgYpHOWsuOZT5O59uu/lypLbN1jroih3pnqtEH5d04Cb
	ewCK1S5XydoRtxzcwABMUysnwsZiLoU=
X-Google-Smtp-Source: 
 ABdhPJzqBdi5ACVNnmPOK6shvzxUlaE3kOsjvQETbtKXIpT+H+jGZ2IWyHRaomARx/P0cA3W8B0HbA==
X-Received: by 2002:a17:907:3347:b0:6ce:6bc4:d18a with SMTP id
 yr7-20020a170907334700b006ce6bc4d18amr2846626ejb.612.1645114191130;
        Thu, 17 Feb 2022 08:09:51 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:09:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/28] gstreamer1.0: disable flaky
 gstbin:test_watch_for_state_change test
Date: Thu, 17 Feb 2022 17:09:16 +0100
Message-Id: <20220217160939.1424397-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:09:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161822

From: Alexander Kanavin <alex.kanavin@gmail.com>

Upstream issue:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/778

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...bin-test_watch_for_state_change-test.patch | 107 ++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.20.0.bb          |   1 +
 2 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-remove-gstbin-test_watch_for_state_change-test.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-remove-gstbin-test_watch_for_state_change-test.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-remove-gstbin-test_watch_for_state_change-test.patch
new file mode 100644
index 0000000000..f51df6d20b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-remove-gstbin-test_watch_for_state_change-test.patch
@@ -0,0 +1,107 @@
+From b935abba3d8fa3ea1ce384c08e650afd8c20b78a Mon Sep 17 00:00:00 2001
+From: Claudius Heine <ch@denx.de>
+Date: Wed, 2 Feb 2022 13:47:02 +0100
+Subject: [PATCH] tests: remove gstbin:test_watch_for_state_change testcase
+
+This testcase seems to be flaky, and upstream marked it as such:
+https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/778
+
+This patch removes the testcase to avoid it interfering with out ptest.
+
+Signed-off-by: Claudius Heine <ch@denx.de>
+
+Upstream-Status: Inappropriate [needs proper upstream fix]
+---
+ tests/check/gst/gstbin.c        | 69 -------------------
+ 1 file changed, 69 deletions(-)
+
+diff --git a/tests/check/gst/gstbin.c b/tests/check/gst/gstbin.c
+index e366d5fe20..ac29d81474 100644
+--- a/tests/check/gst/gstbin.c
++++ b/tests/check/gst/gstbin.c
+@@ -691,74 +691,6 @@ GST_START_TEST (test_message_state_changed_children)
+ 
+ GST_END_TEST;
+ 
+-GST_START_TEST (test_watch_for_state_change)
+-{
+-  GstElement *src, *sink, *bin;
+-  GstBus *bus;
+-  GstStateChangeReturn ret;
+-
+-  bin = gst_element_factory_make ("bin", NULL);
+-  fail_unless (bin != NULL, "Could not create bin");
+-
+-  bus = g_object_new (gst_bus_get_type (), NULL);
+-  gst_object_ref_sink (bus);
+-  gst_element_set_bus (GST_ELEMENT_CAST (bin), bus);
+-
+-  src = gst_element_factory_make ("fakesrc", NULL);
+-  fail_if (src == NULL, "Could not create fakesrc");
+-  sink = gst_element_factory_make ("fakesink", NULL);
+-  fail_if (sink == NULL, "Could not create fakesink");
+-
+-  gst_bin_add (GST_BIN (bin), sink);
+-  gst_bin_add (GST_BIN (bin), src);
+-
+-  fail_unless (gst_element_link (src, sink), "could not link src and sink");
+-
+-  /* change state, spawning two times three messages */
+-  ret = gst_element_set_state (GST_ELEMENT (bin), GST_STATE_PAUSED);
+-  fail_unless (ret == GST_STATE_CHANGE_ASYNC);
+-  ret =
+-      gst_element_get_state (GST_ELEMENT (bin), NULL, NULL,
+-      GST_CLOCK_TIME_NONE);
+-  fail_unless (ret == GST_STATE_CHANGE_SUCCESS);
+-
+-  pop_state_changed (bus, 6);
+-  pop_async_done (bus);
+-  pop_latency (bus);
+-
+-  fail_unless (gst_bus_have_pending (bus) == FALSE,
+-      "Unexpected messages on bus");
+-
+-  ret = gst_element_set_state (GST_ELEMENT (bin), GST_STATE_PLAYING);
+-  fail_unless (ret == GST_STATE_CHANGE_SUCCESS);
+-
+-  pop_state_changed (bus, 3);
+-
+-  /* this one might return either SUCCESS or ASYNC, likely SUCCESS */
+-  ret = gst_element_set_state (GST_ELEMENT (bin), GST_STATE_PAUSED);
+-  gst_element_get_state (GST_ELEMENT (bin), NULL, NULL, GST_CLOCK_TIME_NONE);
+-
+-  pop_state_changed (bus, 3);
+-  if (ret == GST_STATE_CHANGE_ASYNC) {
+-    pop_async_done (bus);
+-    pop_latency (bus);
+-  }
+-
+-  fail_unless (gst_bus_have_pending (bus) == FALSE,
+-      "Unexpected messages on bus");
+-
+-  gst_bus_set_flushing (bus, TRUE);
+-
+-  ret = gst_element_set_state (GST_ELEMENT (bin), GST_STATE_NULL);
+-  fail_unless (ret == GST_STATE_CHANGE_SUCCESS);
+-
+-  /* clean up */
+-  gst_object_unref (bus);
+-  gst_object_unref (bin);
+-}
+-
+-GST_END_TEST;
+-
+ GST_START_TEST (test_state_change_error_message)
+ {
+   GstElement *src, *sink, *bin;
+@@ -1956,7 +1888,6 @@ gst_bin_suite (void)
+   tcase_add_test (tc_chain, test_message_state_changed);
+   tcase_add_test (tc_chain, test_message_state_changed_child);
+   tcase_add_test (tc_chain, test_message_state_changed_children);
+-  tcase_add_test (tc_chain, test_watch_for_state_change);
+   tcase_add_test (tc_chain, test_state_change_error_message);
+   tcase_add_test (tc_chain, test_add_linked);
+   tcase_add_test (tc_chain, test_add_self);
+-- 
+2.33.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
index 243f99fee9..ba4fa24911 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0002-tests-add-support-for-install-the-tests.patch;striplevel=3 \
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
+           file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
            "
 SRC_URI[sha256sum] = "edf4bffff85591d4fff7b21bb9ed7f0feabc123ac4a4eff29e73cbce454f9db7"
 
-- 
2.20.1


