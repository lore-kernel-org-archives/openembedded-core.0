Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95316CD98FF
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:40 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10387.1781682331407797472
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iUAP7dI9;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49222b6e871so38427365e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682329; x=1782287129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lz2ZpdfSne27IV20SjkyS8MzuKZCTZiCdHyzgWS1/SM=;
        b=iUAP7dI9wC+Az1RD865fo1i5uEBGSbsvw2BZ4NbEfp+dwkRyR7rNhihiwQMEWNtyFC
         9QNp48PAMbU5Fjb0F63porLQXoDuU7Qv6obQPNaFqYQWF2sbgEWJ5cE08khqep5PXKYH
         cc1CszDGVPGYYG72pZPS/26Q2qtM7N5AurrNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682329; x=1782287129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lz2ZpdfSne27IV20SjkyS8MzuKZCTZiCdHyzgWS1/SM=;
        b=gKJEPdycPb+eSqC82R8Y0OH7+UBY+BYBlAdkL1UpLeIOS6ZDUx8sE2MQQjVSlnStmp
         x20URtfB1L9z+NgORroZpY6F55WppmvlEIED+uEWeTNmMbS16b63EueyzGHqjGvvD7o/
         nIU8GCdvQq55z/1zBF3E6xEO9UolGaOvsVsBJnfbzVKA+B1D+wRbIGwj/TLIFSPPGusV
         acllxXDigD0j4a/tLIQeBwA3f9B/ykfhsNN2OJRz77LVLY54X6hkLdrMXCLXuAL0lQh/
         v+xqWBo+6M9KNecoCLVY/USsclBh8QW3vW+Hev/3H6lCwtExRjBPGuQ43RJGYrKZ1Ktp
         mtqw==
X-Gm-Message-State: AOJu0YyFJuTielPVN8rniMrSMkzcU0XaOLGHS+rLFL2qZF2L+3RjnmfO
	pB5/kxo8TKUUyDxuDAWI/ibDsrrCa+oZgIf4DOxzrrfEJ6QU04j1POwFyCINqmUTrfDKAdAaLdC
	Gg/NV
X-Gm-Gg: Acq92OFbYlKUAqoBG6JCkk57dc4vIOlVhYIJsJDurVWS2WMFXVvTxyfe6ak35euqNAc
	jHwBiPB0lBDKac/LqCd5Bn+ZMZ7zVY8OtQa2XoCQ53nkp7j6B5vtbVuQ8pN9ne25Ea5KiXvPE1J
	+xr2Iv0B0mFQ7tTNRhiTCKhQXmk2eEN0oZ11B1yw7r2ZbLz7VuJa+Fib1S4GCIvSvx6JEAdmzEN
	WUnrKcv4pwAPqYKFyg/BS22OHPfL+6FjwxIUE8QGSb4UY+hfB1sMtRW/u/r2flcwDHYx8zX/WWZ
	lUSzB09wnxnBkzqszRfuEVUbKL88b7CtVIBNaeJ3v1ZA4AaJPEBfnMyMlsnHLwWFtopPylk4fpg
	8gkiwG+Ogf+d3j62M5jbBcyFhuIC4Kqme0z4ShTId7kfP4aVHkOv5ls8wj5+cTMB/fuvSx5JbCt
	cse18RJeenJ1az4aWB0lB6tTeKoVM69Lk5QHABysqm9F3gAXJlb7q9QBq8rD9R9cN8UtV0QSIE5
	W6dn7ZqL2TCpuDsJA==
X-Received: by 2002:a05:600c:470d:b0:490:e5c1:b897 with SMTP id 5b1f17b1804b1-4923412f115mr31616245e9.20.1781682329409;
        Wed, 17 Jun 2026 00:45:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/30] qemu: fix for CVE-2025-11234
Date: Wed, 17 Jun 2026 09:44:41 +0200
Message-ID: <f8e3cdf31d6d613e54fe2ffaee875811c52754f5.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238988

From: Hitendra Prajapati <hprajapati@mvista.com>

This patch fix use after free in websocket handshake code.

Backport patch from debian refer :
https://security-tracker.debian.org/tracker/CVE-2025-11234

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2025-11234-01.patch         |  72 ++++++++
 .../qemu/qemu/CVE-2025-11234-02.patch         | 174 ++++++++++++++++++
 3 files changed, 248 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 54644dd9241..b688c2bd125 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -45,6 +45,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2025-12464.patch \
            file://0001-python-backport-Remove-deprecated-get_event_loop-cal.patch \
            file://0002-python-backport-avoid-creating-additional-event-loop.patch \
+           file://CVE-2025-11234-01.patch \
+           file://CVE-2025-11234-02.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
new file mode 100644
index 00000000000..c3797bc66f6
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
index 00000000000..364d19457da
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

