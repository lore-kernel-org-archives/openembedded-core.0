Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E539C001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 13:17:16 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.16803.1691673427866274160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 06:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JLUFj4t2;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bc6535027aso7892515ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 06:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1691673427; x=1692278227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WhFrHGvL/Z+6av6E9nqonhpeE5B42vLWdXaOe2qyB8U=;
        b=JLUFj4t2ek7OHrRKYdTOnI/hJb7BxALtS3rQVUa/bhbtHqPNucAcn01YTd6F+7c204
         uH/NC9L3Fu11FrAEEbFj7CZAztxJ7yqEFD8fHijatl88HzHP8C/7iX3hLyqE2Ayb8kpU
         WzvuDysVS5Uedz+EQNHxY16yohF88SBbwrqgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691673427; x=1692278227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhFrHGvL/Z+6av6E9nqonhpeE5B42vLWdXaOe2qyB8U=;
        b=EYO4n6LTBybZf7BKOqsilkcUn3k0XtQ1G7KrkxakLAaAby9/ANxA04zrJdeh+zvOjz
         EFbB1g/t1Dco2x75VPXX7BJ+2xXPZMmGYGieSYZNEmI5K/XYg915K7gS1iqBc6gnTy58
         uOt+s7T3C1TkWLeaATY2a5/pQIthOKMKh6AgMmHPf+tCZKTRj9+Z9z5SPvqupTMXBnpm
         bDYk7UnADoUuX3ublJLHBfjoJJO6Q0EZD+HaaNxC5kQWghkLBAvX0qUQa8r9IzRLL7yh
         WV4ERPrjcMzZNyRHptQXY5TOWPm86woU4eBQOc/uD6Sc3uD9qUQ88isX+Rfkepp7Ja4k
         SwEQ==
X-Gm-Message-State: AOJu0YyQr2byIEwYkF/x6NO7hbVZownovZhxsR3kvcNXNmCWDeiP4bF3
	kQYfby2hM5n3EBnyk0Zjjv6Xo9EGpEXg59pr9iM=
X-Google-Smtp-Source: AGHT+IFrABd3x4Qh8ZBfl7yTPF31bf6RYJt7YxQbuQs4APsPIaxdN7U7uzcpf+pUDyhBCtDJs8apQg==
X-Received: by 2002:a17:902:b084:b0:1b8:b41e:66b4 with SMTP id p4-20020a170902b08400b001b8b41e66b4mr2161420plr.67.1691673426983;
        Thu, 10 Aug 2023 06:17:06 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.75.31.66])
        by smtp.googlemail.com with ESMTPSA id jj5-20020a170903048500b001b8c3c7b102sm1706308plb.127.2023.08.10.06.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 06:17:06 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] qemu:fix CVE-2023-3354 VNC: improper I/O watch removal in TLS handshake can lead to remote unauthenticated denial of service
Date: Thu, 10 Aug 2023 18:46:46 +0530
Message-Id: <20230810131646.3520191-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 13:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185745

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
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
2.25.1


