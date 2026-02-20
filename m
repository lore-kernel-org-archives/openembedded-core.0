Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F275C53215
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:12:29 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32145.1771564340607900070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:12:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Xx06re8G;
 spf=pass (domain: mvista.com, ip: 74.125.82.174, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b86671f87eso3297530eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 21:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771564340; x=1772169140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+EenwFtkS/mVVO38Xy5vGySuw4OlshPopoo9FOBni24=;
        b=Xx06re8GZxaDrH5L3z56EQQ+icXdw7DlPIyRzuCpnyUYHNH8pxFzcs81zMAN1NAXAb
         10giLbDqT4SKm5is4lDxQfRYI49d/wniKN4lb3h3hqa0bP21gya4xjN5xyerRPIGITMQ
         AHSIRJxr78V6R80UP2NqFGdb6Q64FGXJO8BH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771564340; x=1772169140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EenwFtkS/mVVO38Xy5vGySuw4OlshPopoo9FOBni24=;
        b=or6XGKwx3Oloz0P0OlNMBzHfnb8TyvUN5iqOLJl85c14gXJ26pBXVXzK+uG0gLlqyl
         CwWVIWJX6IPJNBq0bxsjofvhDnzqmxayd2u4KPdYTkEC6NsldLZvIVak0YlgZs9MTKZf
         6ab05ydq50LtDGciEspTHSwjIMVXfrY2D7AQvsA2UWpTw33fHJj/mgcJ75IWdmrC+9Tx
         JNEuHIeaqnnovddcroFnG/dsJkGzFZY6nP45fArrnfKW+WJPeJ69XAE4LdgeJTiBMlId
         uvxRvdgq2IDW5zddN8s6ht7JhTln9DYKmC5knxJ/0VJ6UlpaAxU98XIttx3Bl8vJrQCS
         XF+w==
X-Gm-Message-State: AOJu0Yw+E5Cnw25480L+GCaLQ6HwiHBT94Jo2hSwdL6xWfxRnI9B3jQC
	dJeue3s0Lo4R/8SxvMWlRAokBpw/GM4MJ/T4KOVLbn4OP5dXyXKJmGq4BCu+G54cfyp51TFH211
	5dB+znd4=
X-Gm-Gg: AZuq6aLvAjhyToBT9aY0aJKh3ZGASPI1b/vdg8qC46byQIUy+Na4jhbm1wzjtGXZ4iY
	PqYr+oDnx7sHh8tPMjcMv4/MGVhD1trgFEtiCsaZZsoKDII1jYd8K8kLZpOVRDrXkqX3PsWzh6I
	N0d9qTZZbeXS19UmUAdFDXCgB2n2siCqnCjF0X5Gw+RrVN+ALe4jGRYdhX6sJPJZUG4JmNis5No
	eZIbAOFxE3TVEKW6qDIiatw5AfjsSmaCJV/Z0pDICaErUG2Lf+ap5AH84OsRieeR+FnuiJ9KP9C
	L6yKSWb3PZKmO2WrKRIDpLJ5hSxH/cXUZ1KArVrTfxfWCVkho9h1TEwEp9v43ByahH7pz6w4yzo
	PVxSZ6MN263gzBD0Nlhr2aOfJWuo51tCvj9RAuelQcoV4+MgOboSLaxpYeVUr9RlO35FXqVETRW
	XSRZb9GVSseeGtcUqqkTL4wTrDkibDU4ijsFQ8dPjkPC85
X-Received: by 2002:a05:7300:691f:b0:2ba:8854:e4da with SMTP id 5a478bee46e88-2bd733be0d0mr247573eec.25.1771564339541;
        Thu, 19 Feb 2026 21:12:19 -0800 (PST)
Received: from MVIN00013.mvista.com ([152.59.0.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb658521sm21745057eec.16.2026.02.19.21.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 21:12:19 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv2] qemu: fix for CVE-2025-11234
Date: Fri, 20 Feb 2026 10:40:09 +0530
Message-ID: <20260220051011.11250-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231452

This patch fix use after free in websocket handshake code.

Backport patch from debian refer :
https://security-tracker.debian.org/tracker/CVE-2025-11234

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2025-11234-01.patch         |  72 ++++++++
 .../qemu/qemu/CVE-2025-11234-02.patch         | 174 ++++++++++++++++++
 3 files changed, 248 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 748a32215e..ba21d57010 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -43,6 +43,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://qemu-guest-agent.udev \
            file://CVE-2024-8354.patch \
            file://CVE-2025-12464.patch \
+           file://CVE-2025-11234-01.patch \
+           file://CVE-2025-11234-02.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
new file mode 100644
index 0000000000..c3797bc66f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
@@ -0,0 +1,72 @@
+From 911c814c8cc5f836286bd96694843036db83e99f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
+Date: Tue, 30 Sep 2025 11:58:35 +0100
+Subject: [PATCH] io: move websock resource release to close method
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The QIOChannelWebsock object releases all its resources in the
+finalize callback. This is later than desired, as callers expect
+to be able to call qio_channel_close() to fully close a channel
+and release resources related to I/O.
+
+The logic in the finalize method is at most a failsafe to handle
+cases where a consumer forgets to call qio_channel_close.
+
+This adds equivalent logic to the close method to release the
+resources, using g_clear_handle_id/g_clear_pointer to be robust
+against repeated invocations. The finalize method is tweaked
+so that the GSource is removed before releasing the underlying
+channel.
+
+Reviewed-by: Eric Blake <eblake@redhat.com>
+Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
+(cherry picked from commit 322c3c4f3abee616a18b3bfe563ec29dd67eae63)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+
+CVE: CVE-2025-11234
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/911c814c8cc5f836286bd96694843036db83e99f]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ io/channel-websock.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/io/channel-websock.c b/io/channel-websock.c
+index de39f0d18..1aac3c88a 100644
+--- a/io/channel-websock.c
++++ b/io/channel-websock.c
+@@ -922,13 +922,13 @@ static void qio_channel_websock_finalize(Object *obj)
+     buffer_free(&ioc->encinput);
+     buffer_free(&ioc->encoutput);
+     buffer_free(&ioc->rawinput);
+-    object_unref(OBJECT(ioc->master));
+     if (ioc->io_tag) {
+         g_source_remove(ioc->io_tag);
+     }
+     if (ioc->io_err) {
+         error_free(ioc->io_err);
+     }
++    object_unref(OBJECT(ioc->master));
+ }
+ 
+ 
+@@ -1219,6 +1219,15 @@ static int qio_channel_websock_close(QIOChannel *ioc,
+     QIOChannelWebsock *wioc = QIO_CHANNEL_WEBSOCK(ioc);
+ 
+     trace_qio_channel_websock_close(ioc);
++    buffer_free(&wioc->encinput);
++    buffer_free(&wioc->encoutput);
++    buffer_free(&wioc->rawinput);
++    if (wioc->io_tag) {
++        g_clear_handle_id(&wioc->io_tag, g_source_remove);
++    }
++    if (wioc->io_err) {
++        g_clear_pointer(&wioc->io_err, error_free);
++    }
+     return qio_channel_close(wioc->master, errp);
+ }
+ 
+-- 
+2.50.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch
new file mode 100644
index 0000000000..364d19457d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch
@@ -0,0 +1,174 @@
+From cebdbd038e44af56e74272924dc2bf595a51fd8f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
+Date: Tue, 30 Sep 2025 12:03:15 +0100
+Subject: [PATCH] io: fix use after free in websocket handshake code
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If the QIOChannelWebsock object is freed while it is waiting to
+complete a handshake, a GSource is leaked. This can lead to the
+callback firing later on and triggering a use-after-free in the
+use of the channel. This was observed in the VNC server with the
+following trace from valgrind:
+
+==2523108== Invalid read of size 4
+==2523108==    at 0x4054A24: vnc_disconnect_start (vnc.c:1296)
+==2523108==    by 0x4054A24: vnc_client_error (vnc.c:1392)
+==2523108==    by 0x4068A09: vncws_handshake_done (vnc-ws.c:105)
+==2523108==    by 0x44863B4: qio_task_complete (task.c:197)
+==2523108==    by 0x448343D: qio_channel_websock_handshake_io (channel-websock.c:588)
+==2523108==    by 0x6EDB862: UnknownInlinedFun (gmain.c:3398)
+==2523108==    by 0x6EDB862: g_main_context_dispatch_unlocked.lto_priv.0 (gmain.c:4249)
+==2523108==    by 0x6EDBAE4: g_main_context_dispatch (gmain.c:4237)
+==2523108==    by 0x45EC79F: glib_pollfds_poll (main-loop.c:287)
+==2523108==    by 0x45EC79F: os_host_main_loop_wait (main-loop.c:310)
+==2523108==    by 0x45EC79F: main_loop_wait (main-loop.c:589)
+==2523108==    by 0x423A56D: qemu_main_loop (runstate.c:835)
+==2523108==    by 0x454F300: qemu_default_main (main.c:37)
+==2523108==    by 0x73D6574: (below main) (libc_start_call_main.h:58)
+==2523108==  Address 0x57a6e0dc is 28 bytes inside a block of size 103,608 free'd
+==2523108==    at 0x5F2FE43: free (vg_replace_malloc.c:989)
+==2523108==    by 0x6EDC444: g_free (gmem.c:208)
+==2523108==    by 0x4053F23: vnc_update_client (vnc.c:1153)
+==2523108==    by 0x4053F23: vnc_refresh (vnc.c:3225)
+==2523108==    by 0x4042881: dpy_refresh (console.c:880)
+==2523108==    by 0x4042881: gui_update (console.c:90)
+==2523108==    by 0x45EFA1B: timerlist_run_timers.part.0 (qemu-timer.c:562)
+=2523108==    by 0x45EC765: main_loop_wait (main-loop.c:600)
+==2523108==    by 0x423A56D: qemu_main_loop (runstate.c:835)
+==2523108==    by 0x454F300: qemu_default_main (main.c:37)
+==2523108==    by 0x73D6574: (below main) (libc_start_call_main.h:58)
+==2523108==  Block was alloc'd at
+==2523108==    at 0x5F343F3: calloc (vg_replace_malloc.c:1675)
+==2523108==    by 0x6EE2F81: g_malloc0 (gmem.c:133)
+==2523108==    by 0x4057DA3: vnc_connect (vnc.c:3245)
+==2523108==    by 0x448591B: qio_net_listener_channel_func (net-listener.c:54)
+==2523108==    by 0x6EDB862: UnknownInlinedFun (gmain.c:3398)
+==2523108==    by 0x6EDB862: g_main_context_dispatch_unlocked.lto_priv.0 (gmain.c:4249)
+==2523108==    by 0x6EDBAE4: g_main_context_dispatch (gmain.c:4237)
+==2523108==    by 0x45EC79F: glib_pollfds_poll (main-loop.c:287)
+==2523108==    by 0x45EC79F: os_host_main_loop_wait (main-loop.c:310)
+==2523108==    by 0x45EC79F: main_loop_wait (main-loop.c:589)
+==2523108==    by 0x423A56D: qemu_main_loop (runstate.c:835)
+==2523108==    by 0x454F300: qemu_default_main (main.c:37)
+==2523108==    by 0x73D6574: (below main) (libc_start_call_main.h:58)
+==2523108==
+
+The above can be reproduced by launching QEMU with
+
+  $ qemu-system-x86_64 -vnc localhost:0,websocket=5700
+
+and then repeatedly running:
+
+  for i in {1..100}; do
+     (echo -n "GET / HTTP/1.1" && sleep 0.05) | nc -w 1 localhost 5700 &
+  done
+
+CVE-2025-11234
+Reported-by: Grant Millar | Cylo <rid@cylo.io>
+Reviewed-by: Eric Blake <eblake@redhat.com>
+Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
+(cherry picked from commit b7a1f2ca45c7865b9e98e02ae605a65fc9458ae9)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+
+CVE: CVE-2025-11234
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/cebdbd038e44af56e74272924dc2bf595a51fd8f]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ include/io/channel-websock.h |  3 ++-
+ io/channel-websock.c         | 22 ++++++++++++++++------
+ 2 files changed, 18 insertions(+), 7 deletions(-)
+
+diff --git a/include/io/channel-websock.h b/include/io/channel-websock.h
+index e180827c5..6700cf894 100644
+--- a/include/io/channel-websock.h
++++ b/include/io/channel-websock.h
+@@ -61,7 +61,8 @@ struct QIOChannelWebsock {
+     size_t payload_remain;
+     size_t pong_remain;
+     QIOChannelWebsockMask mask;
+-    guint io_tag;
++    guint hs_io_tag; /* tracking handshake task */
++    guint io_tag; /* tracking watch task */
+     Error *io_err;
+     gboolean io_eof;
+     uint8_t opcode;
+diff --git a/io/channel-websock.c b/io/channel-websock.c
+index 1aac3c88a..583ea8618 100644
+--- a/io/channel-websock.c
++++ b/io/channel-websock.c
+@@ -545,6 +545,7 @@ static gboolean qio_channel_websock_handshake_send(QIOChannel *ioc,
+         trace_qio_channel_websock_handshake_fail(ioc, error_get_pretty(err));
+         qio_task_set_error(task, err);
+         qio_task_complete(task);
++        wioc->hs_io_tag = 0;
+         return FALSE;
+     }
+ 
+@@ -560,6 +561,7 @@ static gboolean qio_channel_websock_handshake_send(QIOChannel *ioc,
+             trace_qio_channel_websock_handshake_complete(ioc);
+             qio_task_complete(task);
+         }
++        wioc->hs_io_tag = 0;
+         return FALSE;
+     }
+     trace_qio_channel_websock_handshake_pending(ioc, G_IO_OUT);
+@@ -586,6 +588,7 @@ static gboolean qio_channel_websock_handshake_io(QIOChannel *ioc,
+         trace_qio_channel_websock_handshake_fail(ioc, error_get_pretty(err));
+         qio_task_set_error(task, err);
+         qio_task_complete(task);
++        wioc->hs_io_tag = 0;
+         return FALSE;
+     }
+     if (ret == 0) {
+@@ -597,7 +600,7 @@ static gboolean qio_channel_websock_handshake_io(QIOChannel *ioc,
+     error_propagate(&wioc->io_err, err);
+ 
+     trace_qio_channel_websock_handshake_reply(ioc);
+-    qio_channel_add_watch(
++    wioc->hs_io_tag = qio_channel_add_watch(
+         wioc->master,
+         G_IO_OUT,
+         qio_channel_websock_handshake_send,
+@@ -907,11 +910,12 @@ void qio_channel_websock_handshake(QIOChannelWebsock *ioc,
+ 
+     trace_qio_channel_websock_handshake_start(ioc);
+     trace_qio_channel_websock_handshake_pending(ioc, G_IO_IN);
+-    qio_channel_add_watch(ioc->master,
+-                          G_IO_IN,
+-                          qio_channel_websock_handshake_io,
+-                          task,
+-                          NULL);
++    ioc->hs_io_tag = qio_channel_add_watch(
++        ioc->master,
++        G_IO_IN,
++        qio_channel_websock_handshake_io,
++        task,
++        NULL);
+ }
+ 
+ 
+@@ -922,6 +926,9 @@ static void qio_channel_websock_finalize(Object *obj)
+     buffer_free(&ioc->encinput);
+     buffer_free(&ioc->encoutput);
+     buffer_free(&ioc->rawinput);
++    if (ioc->hs_io_tag) {
++        g_source_remove(ioc->hs_io_tag);
++    }
+     if (ioc->io_tag) {
+         g_source_remove(ioc->io_tag);
+     }
+@@ -1222,6 +1229,9 @@ static int qio_channel_websock_close(QIOChannel *ioc,
+     buffer_free(&wioc->encinput);
+     buffer_free(&wioc->encoutput);
+     buffer_free(&wioc->rawinput);
++    if (wioc->hs_io_tag) {
++        g_clear_handle_id(&wioc->hs_io_tag, g_source_remove);
++    }
+     if (wioc->io_tag) {
+         g_clear_handle_id(&wioc->io_tag, g_source_remove);
+     }
+-- 
+2.50.1
+
-- 
2.50.1


