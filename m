Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8431C46467
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 00:11:23 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.148330.1672099875223810743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Dec 2022 16:11:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XxeiCgYs;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id t15so2305978wro.9
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 16:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJZPHHYX9aWRct1pMYyFoCF+NWcL/g1hEeJFReXuwTw=;
        b=XxeiCgYsh26rTPJR/YRlv+qro6+JqFkN8xOJTnH+v8i+8cF6gd+nvSebUp34Frn3Qg
         sgmOkaZ/0pYcIaitiCjBCyd4ghWDOm8fGOddj0zvQi+jzRiIMSTHIVjg4yOOlzCR0c3b
         82NVKxAtnL85Y3PNyvki4Vh8ZiFSUlOxRv0cqZeBde9Qth0LFqJkuLCI6DePOrwqKW18
         e/nqx3MvHRJz/CMTDW0vdMvQerOZfGgJWcjsc8WT9xm8WeF4BzYIIOGoc9q47/9gC2oM
         W42DzT64X5/hoMtWcGfhAZyNOveuq0DDSJKhe6LRP5mZOZyg0bvuRomzsgnI3Gw3x9ob
         eMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJZPHHYX9aWRct1pMYyFoCF+NWcL/g1hEeJFReXuwTw=;
        b=p2gVEgn4F77/S2S5od9rrQfX1rfjXulkJOQ2RKahw5ixZWwJfCqbwXLVcMFjndexgX
         fOGyZNn7mVQwBcJPrEXbNsCRCeAdADcFCAKK9dIlAVrXYnrPQtaN7ppNSWjlss6zKYEi
         zcHHbbXgz+GXokU6awlwR8Zo8fEU4d/McBHWLAuONDuYCj7ma4zuQkwUK3G476pyLp7a
         UdLViyz4L6Z8q4Z3bvzOOTyHUJ/R6wzdKjfJ9NXFu+FU6nBpYtDspVHEvoKKEjezuttd
         kc+LOXuu9ZkszqUWmNqj5jHVGECiOB4DsjMxp/0BfWh+fK5LmdXnzHH8ho7gIiR+w5s6
         vgVw==
X-Gm-Message-State: AFqh2krvv3nPO4wRPr9YSFS0DNw753bzPiCP50bUYVT9GY5jpXaitQjM
	IX3rvuNVxs393FoCNhgsDonEyq3BJzQ=
X-Google-Smtp-Source: AMrXdXuJegwYeCk+7lOok4YuLf84/mh9WThjFXfcaaDpGyQiqstBDSiVsfAOfQZXrKu55CXVFoHKhg==
X-Received: by 2002:adf:ffc1:0:b0:242:3fa4:8217 with SMTP id x1-20020adfffc1000000b002423fa48217mr12565185wrs.50.1672099873053;
        Mon, 26 Dec 2022 16:11:13 -0800 (PST)
Received: from fio.lan (11.77.115.89.rev.vodafone.pt. [89.115.77.11])
        by smtp.gmail.com with ESMTPSA id q20-20020a1ce914000000b003b4935f04a4sm18160747wmc.5.2022.12.26.16.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 16:11:12 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 2/2] gstreamer1.0: Fix race conditions in gstbin tests
Date: Tue, 27 Dec 2022 00:10:55 +0000
Message-Id: <20221227001055.126232-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221227001055.126232-1-jose.quaresma@foundries.io>
References: <20221227001055.126232-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 00:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175026

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...005-bin-Fix-race-conditions-in-tests.patch | 300 ++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.20.5.bb          |   1 +
 2 files changed, 301 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bin-Fix-race-conditions-in-tests.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bin-Fix-race-conditions-in-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bin-Fix-race-conditions-in-tests.patch
new file mode 100644
index 0000000000..f1fac2df57
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bin-Fix-race-conditions-in-tests.patch
@@ -0,0 +1,300 @@
+From e1e2d8d58c1e09e065849cdb1f6466c0537a7c51 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Tue, 21 Jun 2022 11:51:35 +0300
+Subject: [PATCH] bin: Fix race conditions in tests
+
+The latency messages are non-deterministic and can arrive before/after
+async-done or during state-changes as they are posted by e.g. sinks from
+their streaming thread but bins are finishing asynchronous state changes
+from a secondary helper thread.
+
+To solve this, expect latency messages at any time and assert that we
+receive one at some point during the test.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2643>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2643]
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ .../gstreamer/tests/check/gst/gstbin.c        | 132 ++++++++++++------
+ 1 file changed, 92 insertions(+), 40 deletions(-)
+
+diff --git a/subprojects/gstreamer/tests/check/gst/gstbin.c b/subprojects/gstreamer/tests/check/gst/gstbin.c
+index e366d5fe20f..88ff44db0c3 100644
+--- a/subprojects/gstreamer/tests/check/gst/gstbin.c
++++ b/subprojects/gstreamer/tests/check/gst/gstbin.c
+@@ -27,50 +27,95 @@
+ #include <gst/base/gstbasesrc.h>
+ 
+ static void
+-pop_async_done (GstBus * bus)
++pop_async_done (GstBus * bus, gboolean * had_latency)
+ {
+   GstMessage *message;
++  GstMessageType types = GST_MESSAGE_ASYNC_DONE;
++
++  if (!*had_latency)
++    types |= GST_MESSAGE_LATENCY;
+ 
+   GST_DEBUG ("popping async-done message");
+-  message = gst_bus_poll (bus, GST_MESSAGE_ASYNC_DONE, -1);
+ 
+-  fail_unless (message && GST_MESSAGE_TYPE (message)
+-      == GST_MESSAGE_ASYNC_DONE, "did not get GST_MESSAGE_ASYNC_DONE");
++  do {
++    message = gst_bus_poll (bus, types, -1);
+ 
+-  gst_message_unref (message);
+-  GST_DEBUG ("popped message");
++    fail_unless (message);
++    GST_DEBUG ("popped message %s",
++        gst_message_type_get_name (GST_MESSAGE_TYPE (message)));
++
++    if (GST_MESSAGE_TYPE (message) == GST_MESSAGE_LATENCY) {
++      fail_unless (*had_latency == FALSE);
++      *had_latency = TRUE;
++      gst_clear_message (&message);
++      types &= ~GST_MESSAGE_LATENCY;
++      continue;
++    }
++
++    fail_unless (GST_MESSAGE_TYPE (message)
++        == GST_MESSAGE_ASYNC_DONE, "did not get GST_MESSAGE_ASYNC_DONE");
++
++    gst_clear_message (&message);
++    break;
++  } while (TRUE);
+ }
+ 
+ static void
+-pop_latency (GstBus * bus)
++pop_latency (GstBus * bus, gboolean * had_latency)
+ {
+   GstMessage *message;
+ 
+-  GST_DEBUG ("popping async-done message");
++  if (*had_latency)
++    return;
++
++  GST_DEBUG ("popping latency message");
+   message = gst_bus_poll (bus, GST_MESSAGE_LATENCY, -1);
+ 
+-  fail_unless (message && GST_MESSAGE_TYPE (message)
++  fail_unless (message);
++  fail_unless (GST_MESSAGE_TYPE (message)
+       == GST_MESSAGE_LATENCY, "did not get GST_MESSAGE_LATENCY");
+ 
+-  gst_message_unref (message);
+-  GST_DEBUG ("popped message");
++  GST_DEBUG ("popped message %s",
++      gst_message_type_get_name (GST_MESSAGE_TYPE (message)));
++  gst_clear_message (&message);
++
++  *had_latency = TRUE;
+ }
+ 
+ static void
+-pop_state_changed (GstBus * bus, int count)
++pop_state_changed (GstBus * bus, int count, gboolean * had_latency)
+ {
+   GstMessage *message;
+-
++  GstMessageType types = GST_MESSAGE_STATE_CHANGED;
+   int i;
+ 
++  if (!*had_latency)
++    types |= GST_MESSAGE_LATENCY;
++
+   GST_DEBUG ("popping %d messages", count);
+   for (i = 0; i < count; ++i) {
+-    message = gst_bus_poll (bus, GST_MESSAGE_STATE_CHANGED, -1);
+-
+-    fail_unless (message && GST_MESSAGE_TYPE (message)
+-        == GST_MESSAGE_STATE_CHANGED, "did not get GST_MESSAGE_STATE_CHANGED");
+-
+-    gst_message_unref (message);
++    do {
++      message = gst_bus_poll (bus, types, -1);
++
++      fail_unless (message);
++      GST_DEBUG ("popped message %s",
++          gst_message_type_get_name (GST_MESSAGE_TYPE (message)));
++
++      if (GST_MESSAGE_TYPE (message) == GST_MESSAGE_LATENCY) {
++        fail_unless (*had_latency == FALSE);
++        *had_latency = TRUE;
++        gst_clear_message (&message);
++        types &= ~GST_MESSAGE_LATENCY;
++        continue;
++      }
++
++      fail_unless (GST_MESSAGE_TYPE (message)
++          == GST_MESSAGE_STATE_CHANGED,
++          "did not get GST_MESSAGE_STATE_CHANGED");
++
++      gst_message_unref (message);
++      break;
++    } while (TRUE);
+   }
+   GST_DEBUG ("popped %d messages", count);
+ }
+@@ -538,6 +583,7 @@ GST_START_TEST (test_message_state_changed_children)
+   GstBus *bus;
+   GstStateChangeReturn ret;
+   GstState current, pending;
++  gboolean had_latency = FALSE;
+ 
+   pipeline = GST_PIPELINE (gst_pipeline_new (NULL));
+   fail_unless (pipeline != NULL, "Could not create pipeline");
+@@ -576,7 +622,7 @@ GST_START_TEST (test_message_state_changed_children)
+   ASSERT_OBJECT_REFCOUNT (sink, "sink", 2);
+   ASSERT_OBJECT_REFCOUNT (pipeline, "pipeline", 2);
+ 
+-  pop_state_changed (bus, 3);
++  pop_state_changed (bus, 3, &had_latency);
+   fail_if (gst_bus_have_pending (bus), "unexpected pending messages");
+ 
+   ASSERT_OBJECT_REFCOUNT (bus, "bus", 2);
+@@ -619,9 +665,9 @@ GST_START_TEST (test_message_state_changed_children)
+    * its state_change message */
+   ASSERT_OBJECT_REFCOUNT_BETWEEN (pipeline, "pipeline", 3, 4);
+ 
+-  pop_state_changed (bus, 3);
+-  pop_async_done (bus);
+-  pop_latency (bus);
++  pop_state_changed (bus, 3, &had_latency);
++  pop_async_done (bus, &had_latency);
++  pop_latency (bus, &had_latency);
+   fail_if ((gst_bus_pop (bus)) != NULL);
+ 
+   ASSERT_OBJECT_REFCOUNT_BETWEEN (bus, "bus", 2, 3);
+@@ -648,7 +694,7 @@ GST_START_TEST (test_message_state_changed_children)
+   ASSERT_OBJECT_REFCOUNT_BETWEEN (sink, "sink", 2, 4);
+   ASSERT_OBJECT_REFCOUNT (pipeline, "pipeline", 3);
+ 
+-  pop_state_changed (bus, 3);
++  pop_state_changed (bus, 3, &had_latency);
+   fail_if ((gst_bus_pop (bus)) != NULL);
+ 
+   ASSERT_OBJECT_REFCOUNT (bus, "bus", 2);
+@@ -669,7 +715,7 @@ GST_START_TEST (test_message_state_changed_children)
+   ASSERT_OBJECT_REFCOUNT_BETWEEN (sink, "sink", 3, 4);
+   ASSERT_OBJECT_REFCOUNT (pipeline, "pipeline", 3);
+ 
+-  pop_state_changed (bus, 6);
++  pop_state_changed (bus, 6, &had_latency);
+   fail_if ((gst_bus_pop (bus)) != NULL);
+ 
+   ASSERT_OBJECT_REFCOUNT (src, "src", 1);
+@@ -696,6 +742,7 @@ GST_START_TEST (test_watch_for_state_change)
+   GstElement *src, *sink, *bin;
+   GstBus *bus;
+   GstStateChangeReturn ret;
++  gboolean had_latency = FALSE;
+ 
+   bin = gst_element_factory_make ("bin", NULL);
+   fail_unless (bin != NULL, "Could not create bin");
+@@ -722,9 +769,9 @@ GST_START_TEST (test_watch_for_state_change)
+       GST_CLOCK_TIME_NONE);
+   fail_unless (ret == GST_STATE_CHANGE_SUCCESS);
+ 
+-  pop_state_changed (bus, 6);
+-  pop_async_done (bus);
+-  pop_latency (bus);
++  pop_state_changed (bus, 6, &had_latency);
++  pop_async_done (bus, &had_latency);
++  pop_latency (bus, &had_latency);
+ 
+   fail_unless (gst_bus_have_pending (bus) == FALSE,
+       "Unexpected messages on bus");
+@@ -732,16 +779,17 @@ GST_START_TEST (test_watch_for_state_change)
+   ret = gst_element_set_state (GST_ELEMENT (bin), GST_STATE_PLAYING);
+   fail_unless (ret == GST_STATE_CHANGE_SUCCESS);
+ 
+-  pop_state_changed (bus, 3);
++  pop_state_changed (bus, 3, &had_latency);
+ 
++  had_latency = FALSE;
+   /* this one might return either SUCCESS or ASYNC, likely SUCCESS */
+   ret = gst_element_set_state (GST_ELEMENT (bin), GST_STATE_PAUSED);
+   gst_element_get_state (GST_ELEMENT (bin), NULL, NULL, GST_CLOCK_TIME_NONE);
+ 
+-  pop_state_changed (bus, 3);
++  pop_state_changed (bus, 3, &had_latency);
+   if (ret == GST_STATE_CHANGE_ASYNC) {
+-    pop_async_done (bus);
+-    pop_latency (bus);
++    pop_async_done (bus, &had_latency);
++    pop_latency (bus, &had_latency);
+   }
+ 
+   fail_unless (gst_bus_have_pending (bus) == FALSE,
+@@ -898,6 +946,7 @@ GST_START_TEST (test_children_state_change_order_flagged_sink)
+   GstStateChangeReturn ret;
+   GstState current, pending;
+   GstBus *bus;
++  gboolean had_latency = FALSE;
+ 
+   pipeline = gst_pipeline_new (NULL);
+   fail_unless (pipeline != NULL, "Could not create pipeline");
+@@ -951,10 +1000,11 @@ GST_START_TEST (test_children_state_change_order_flagged_sink)
+   ASSERT_STATE_CHANGE_MSG (bus, sink, GST_STATE_READY, GST_STATE_PAUSED, 107);
+ #else
+ 
+-  pop_state_changed (bus, 2);   /* pop remaining ready => paused messages off the bus */
++  pop_state_changed (bus, 2, &had_latency);     /* pop remaining ready => paused messages off the bus */
+   ASSERT_STATE_CHANGE_MSG (bus, pipeline, GST_STATE_READY, GST_STATE_PAUSED,
+       108);
+-  pop_async_done (bus);
++  pop_async_done (bus, &had_latency);
++  pop_latency (bus, &had_latency);
+ #endif
+   /* PAUSED => PLAYING */
+   GST_DEBUG ("popping PAUSED -> PLAYING messages");
+@@ -972,8 +1022,8 @@ GST_START_TEST (test_children_state_change_order_flagged_sink)
+   fail_if (ret != GST_STATE_CHANGE_SUCCESS, "State change to READY failed");
+ 
+   /* TODO: do we need to check downwards state change order as well? */
+-  pop_state_changed (bus, 4);   /* pop playing => paused messages off the bus */
+-  pop_state_changed (bus, 4);   /* pop paused => ready messages off the bus */
++  pop_state_changed (bus, 4, &had_latency);     /* pop playing => paused messages off the bus */
++  pop_state_changed (bus, 4, &had_latency);     /* pop paused => ready messages off the bus */
+ 
+   while (GST_OBJECT_REFCOUNT_VALUE (pipeline) > 1)
+     THREAD_SWITCH ();
+@@ -1002,6 +1052,7 @@ GST_START_TEST (test_children_state_change_order_semi_sink)
+   GstStateChangeReturn ret;
+   GstState current, pending;
+   GstBus *bus;
++  gboolean had_latency = FALSE;
+ 
+   /* (2) Now again, but check other code path where we don't have
+    *     a proper sink correctly flagged as such, but a 'semi-sink' */
+@@ -1056,10 +1107,11 @@ GST_START_TEST (test_children_state_change_order_semi_sink)
+   ASSERT_STATE_CHANGE_MSG (bus, src, GST_STATE_READY, GST_STATE_PAUSED, 206);
+   ASSERT_STATE_CHANGE_MSG (bus, sink, GST_STATE_READY, GST_STATE_PAUSED, 207);
+ #else
+-  pop_state_changed (bus, 2);   /* pop remaining ready => paused messages off the bus */
++  pop_state_changed (bus, 2, &had_latency);     /* pop remaining ready => paused messages off the bus */
+   ASSERT_STATE_CHANGE_MSG (bus, pipeline, GST_STATE_READY, GST_STATE_PAUSED,
+       208);
+-  pop_async_done (bus);
++  pop_async_done (bus, &had_latency);
++  pop_latency (bus, &had_latency);
+ 
+   /* PAUSED => PLAYING */
+   GST_DEBUG ("popping PAUSED -> PLAYING messages");
+@@ -1076,8 +1128,8 @@ GST_START_TEST (test_children_state_change_order_semi_sink)
+   fail_if (ret != GST_STATE_CHANGE_SUCCESS, "State change to READY failed");
+ 
+   /* TODO: do we need to check downwards state change order as well? */
+-  pop_state_changed (bus, 4);   /* pop playing => paused messages off the bus */
+-  pop_state_changed (bus, 4);   /* pop paused => ready messages off the bus */
++  pop_state_changed (bus, 4, &had_latency);     /* pop playing => paused messages off the bus */
++  pop_state_changed (bus, 4, &had_latency);     /* pop paused => ready messages off the bus */
+ 
+   GST_DEBUG ("waiting for pipeline to reach refcount 1");
+   while (GST_OBJECT_REFCOUNT_VALUE (pipeline) > 1)
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
index 5a96764780..ce9c1c116f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0002-tests-add-support-for-install-the-tests.patch;striplevel=3 \
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
+           file://0005-bin-Fix-race-conditions-in-tests.patch;striplevel=3 \
            "
 SRC_URI[sha256sum] = "5a19083faaf361d21fc391124f78ba6d609be55845a82fa8f658230e5fa03dff"
 
-- 
2.39.0


