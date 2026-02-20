Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3A8C531FC
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 04:33:59 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31951.1771562032998647575
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 20:33:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=REByGUvf;
 spf=pass (domain: mvista.com, ip: 74.125.82.52, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1275910b930so1314793c88.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 20:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771562032; x=1772166832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ApQHej8PtPvXykq9B+gMes/eVepLaalky/l6YlitBpM=;
        b=REByGUvfeQ3qxla3vsrsCAI5kHa5TPWUVtTOxsSKivn5CxFiDYLYWWCd4H9GXSgX3R
         aC+p2h6WXe+ZeGjQL4mTCiIHWz5IyA6dzJmmnJDlFk4mgKHdWqkFOPrRIuFcrUuKU9EO
         XJQxvzjktZRvmIY6SOz76ltBsllQVd3YWAcvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771562032; x=1772166832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApQHej8PtPvXykq9B+gMes/eVepLaalky/l6YlitBpM=;
        b=mv6ir13xy91mOB72S6tBKGrTpShS/xk9tQN12+jTLNTfnqcXzotFoFqy8OoBowh6ln
         3LQlijS4Ko95MHj3eFZ4256Jcw/NEWYBgyPIy7zxZ33AEJ9OiENH3SqkQV89twt/aI2m
         dmtUeTRa0tsiuciRWmWfqxSfXixc7GkR9oxtnkZPQyy89lxp7eUjVUjnZJ4AjT853AHA
         5WL4wgcYoDFkQYKMdXKnSWW885diU1WExsuBHXg27r+/JQ5MY1TjNCSN2u+A5OoblZ3D
         fhMaWRuOJneB3Ee2UAL3OyJeEImt6DJ31iHkHHj6Ex/SS6CQ2DK+033QrKBRiDSm1VFv
         qvRg==
X-Gm-Message-State: AOJu0YxkbozNV6kT35VJpTzCqnkBu90uZCT7AqZNtWK94DPHzxPmKcd7
	pzWkzCwFRahO9urW+G7uVEr5uUq3mYORTtsGRidmoXKyIfiYiKieCi4MfRyS0LIkLU6zvsPaHI8
	xrzt9L+M=
X-Gm-Gg: AZuq6aLJYcWpjN9JcdqwzBwkqNC96Pn7fzmRmNOggnuKQC8cmDXH4cFFcqv1x87jqGR
	WSRmt1pHZZOvlP8LVJfFxDMeYRGvlX6kx5jT8rgZy4ezRfrhybAiotoklqvBPBuxWhRJvc13O/8
	WBSBRZHSAPU3RSAtr64phfywsRThdWFznF4vQCPZCD89aLCHcpX9mCcOJSjESzzAKKG1vrH/ZoD
	I9w73bHDYQ6zS+MyhFllwpRNRzmkbqAmw+5U2k9VEMZ9dP00xDSYWdnJTLJ2yAiHskR5e4rPeCo
	2enT9/U7Pa9l/1HyBqY7jWau1Bw4u7BqaEIOra6c36k2yKJeNYsBs0AuCiQYlVRF+Bx7QY4+8YK
	iT65FhSnphiPR7QZ2Ne98Ho4vsW6Zn4LAV64ix9mDRYPGzbQMvFcY2UpepBS9BULdwULQd/utEU
	6EUfD1wFWx6YCBbxZWWF4NS8qcloEdgC146A==
X-Received: by 2002:a05:7022:122:b0:124:b18c:dcf8 with SMTP id a92af1059eb24-1275fa68457mr1580124c88.11.1771562032049;
        Thu, 19 Feb 2026 20:33:52 -0800 (PST)
Received: from MVIN00013.mvista.com ([152.59.0.2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742b62455sm28656141c88.1.2026.02.19.20.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 20:33:51 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCHv2] qemu: fix for CVE-2025-11234
Date: Fri, 20 Feb 2026 10:01:39 +0530
Message-ID: <20260220043141.7238-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 04:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231448

This patch fix use after free in websocket handshake code.
Backport patch from debian refer : https://security-tracker.debian.org/tracker/CVE-2025-11234

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2025-11234-01.patch         |  72 ++++++++
 .../qemu/qemu/CVE-2025-11234-02.patch         | 174 ++++++++++++++++++
 3 files changed, 248 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 764f0e110a..78f4e2c3f1 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -130,6 +130,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2024-3447.patch \
            file://CVE-2024-8354.patch \
            file://CVE-2025-12464.patch \
+           file://CVE-2025-11234-01.patch \
+           file://CVE-2025-11234-02.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
new file mode 100644
index 0000000000..a49bd51cab
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
+index 70889bb54..9f82a7399 100644
+--- a/io/channel-websock.c
++++ b/io/channel-websock.c
+@@ -921,13 +921,13 @@ static void qio_channel_websock_finalize(Object *obj)
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
+@@ -1216,6 +1216,15 @@ static int qio_channel_websock_close(QIOChannel *ioc,
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
index 0000000000..a63e522c59
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
+index 9f82a7399..4773e08e7 100644
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
+@@ -906,11 +909,12 @@ void qio_channel_websock_handshake(QIOChannelWebsock *ioc,
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
+@@ -921,6 +925,9 @@ static void qio_channel_websock_finalize(Object *obj)
+     buffer_free(&ioc->encinput);
+     buffer_free(&ioc->encoutput);
+     buffer_free(&ioc->rawinput);
++    if (ioc->hs_io_tag) {
++        g_source_remove(ioc->hs_io_tag);
++    }
+     if (ioc->io_tag) {
+         g_source_remove(ioc->io_tag);
+     }
+@@ -1219,6 +1226,9 @@ static int qio_channel_websock_close(QIOChannel *ioc,
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


