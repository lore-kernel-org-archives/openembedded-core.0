Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A19C3DA40
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:19:19 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.94019.1691961551273907568
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=LEL7bPBZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-564d6aa9abdso3254328a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961550; x=1692566350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGlWB35IW0aK3bSQlMc+n2us/mqGC42a92Sv5nQJtEc=;
        b=LEL7bPBZ6S94gOcA7IvoEwJc62BlRqt/8XXVUygQ5g6w6bQ9WHX91d+DcTBj4lzVYX
         uB812gpBj64+kUa7tmFRc4+7S8t/IYgSmTThXmZNifNXrO435eJE859iHKc9lh8SlvX8
         ZfjJ2M9nyV1/8mtQ0pBKZh2P7n870fwxavxfw5pvduIBAHnHy3RxGd4A8ZvMEFGAJrUA
         hW2uu/L1KNDZujVjzPHYbEHtrXnLeH/UWRUErkTlW+sQzk7xnZdCMo4YoZQAPUaBkAMk
         8la9v+FJSyOUtndYW9AACODumoRdZRp5Vh4DcgE8pljvihLPbMC8Etll26pSnfZUv3O1
         dBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961550; x=1692566350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGlWB35IW0aK3bSQlMc+n2us/mqGC42a92Sv5nQJtEc=;
        b=It1jpJhW6H28A4+XZIfrZEwWqHQnPsLvYbXLOSK+4bLA8VxhmV7aeIvilQFoRkK8Eb
         DzTY5Dq2ms49AKGGWYisYguFgKCLpg+hTml5wI8MxIuS5lMMkv9uOteqddodbYARdvC5
         YwA9lNBxkO2wAQrT4vVIHd1QvvsFiHvzY111/kSfdvpA8GJWrrgSU1wlJq6kHb4Jvl+2
         KcfbWBwOoWZpP84OsK7iIMK1mwd91afRXfvQm+ZBIjhTvHYRbkcNIEhi/le7j8i+e7o8
         QL6fWlFR19f4XwS2TXfidzb7CxzdqQ5SjCelHFGsmAzd6grM0yWB0QJa7tCpwhlE6K1B
         epNA==
X-Gm-Message-State: AOJu0Yw7vt7wG7a6od36xblMxbL4PkIAHwyXA+UlUHZPjpemnq98JIMr
	v8Zjylk6wDrNQc/b5IDvVNIf1dXNIZyc2ioEc09TWg==
X-Google-Smtp-Source: AGHT+IHzON8apBU4m10TO+PKv5DvBhvxL/IjaxeqCighxvh90E0o0fCTYG0UUG1Hg/77nwkQ98R8hw==
X-Received: by 2002:a17:90b:68f:b0:269:3757:54bb with SMTP id m15-20020a17090b068f00b00269375754bbmr9614339pjz.11.1691961550318;
        Sun, 13 Aug 2023 14:19:10 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.19.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:19:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/22] qemu:fix CVE-2023-3354 VNC: improper I/O watch removal in TLS handshake can lead to remote unauthenticated denial of service
Date: Sun, 13 Aug 2023 11:18:17 -1000
Message-Id: <447bab76f9ac465ad36540e3bfb9a2a3cdbfa6b6.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185902

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3354.patch             | 87 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 352277573b..2871818cb1 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -138,6 +138,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3409-5.patch \
            file://hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch \
            file://CVE-2023-0330.patch \
+           file://CVE-2023-3354.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch
new file mode 100644
index 0000000000..2942e84cac
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch
@@ -0,0 +1,87 @@
+From 10be627d2b5ec2d6b3dce045144aa739eef678b4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
+Date: Tue, 20 Jun 2023 09:45:34 +0100
+Subject: [PATCH] io: remove io watch if TLS channel is closed during handshake
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The TLS handshake make take some time to complete, during which time an
+I/O watch might be registered with the main loop. If the owner of the
+I/O channel invokes qio_channel_close() while the handshake is waiting
+to continue the I/O watch must be removed. Failing to remove it will
+later trigger the completion callback which the owner is not expecting
+to receive. In the case of the VNC server, this results in a SEGV as
+vnc_disconnect_start() tries to shutdown a client connection that is
+already gone / NULL.
+
+CVE-2023-3354
+Reported-by: jiangyegen <jiangyegen@huawei.com>
+Signed-off-by: Daniel P. BerrangÃ© <berrange@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/10be627d2b5ec2d6b3dce045144aa739eef678b4]
+CVE: CVE-2023-3354
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ include/io/channel-tls.h |  1 +
+ io/channel-tls.c         | 18 ++++++++++++------
+ 2 files changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/include/io/channel-tls.h b/include/io/channel-tls.h
+index fdbdf12f..e49e2831 100644
+--- a/include/io/channel-tls.h
++++ b/include/io/channel-tls.h
+@@ -49,6 +49,7 @@ struct QIOChannelTLS {
+     QIOChannel *master;
+     QCryptoTLSSession *session;
+     QIOChannelShutdown shutdown;
++    guint hs_ioc_tag;
+ };
+ 
+ /**
+diff --git a/io/channel-tls.c b/io/channel-tls.c
+index 7ec8ceff..8b32fbde 100644
+--- a/io/channel-tls.c
++++ b/io/channel-tls.c
+@@ -194,12 +194,13 @@ static void qio_channel_tls_handshake_task(QIOChannelTLS *ioc,
+         }
+ 
+         trace_qio_channel_tls_handshake_pending(ioc, status);
+-        qio_channel_add_watch_full(ioc->master,
+-                                   condition,
+-                                   qio_channel_tls_handshake_io,
+-                                   data,
+-                                   NULL,
+-                                   context);
++        ioc->hs_ioc_tag =
++            qio_channel_add_watch_full(ioc->master,
++                                       condition,
++                                       qio_channel_tls_handshake_io,
++                                       data,
++                                       NULL,
++                                       context);
+     }
+ }
+ 
+@@ -214,6 +215,7 @@ static gboolean qio_channel_tls_handshake_io(QIOChannel *ioc,
+     QIOChannelTLS *tioc = QIO_CHANNEL_TLS(
+         qio_task_get_source(task));
+ 
++    tioc->hs_ioc_tag = 0;
+     g_free(data);
+     qio_channel_tls_handshake_task(tioc, task, context);
+ 
+@@ -371,6 +373,10 @@ static int qio_channel_tls_close(QIOChannel *ioc,
+ {
+     QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);
+ 
++    if (tioc->hs_ioc_tag) {
++        g_clear_handle_id(&tioc->hs_ioc_tag, g_source_remove);
++    }
++
+     return qio_channel_close(tioc->master, errp);
+ }
+ 
+-- 
+2.25.1
+
-- 
2.34.1


