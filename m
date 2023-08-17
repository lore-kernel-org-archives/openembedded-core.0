Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F168C2FC18
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 02:50:06 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.178857.1692240602500245705
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 19:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=e11f0mji;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.45, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-56ce936f7c0so5084740eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 19:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692240601; x=1692845401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2K6cVNx8FC6ljxQatskzEJOFE1r0ruH6RVrE2R2/7Cs=;
        b=e11f0mjiG2WogKi/jXOrFuwpJDK0ErhL2/CnPlGyRhOmG7xgybcPYYN5iYD5Z7y7MQ
         L9PKgihOi7/womRz53EIbjsujE1NCDTaxf9fO/Zz4Vv87mRoLGutdTOrnjQPa8hibUIm
         tQCycZ3xwfnwqOtMqC3U4hMVG93jsZMScS5kK+AG9SN4kaUHclB727YDupREgYmnGaAY
         fdvken4TzWjfwYCWmtUmnGAY4HGC4yIAgldvUJfZ2bRvxQoC35at1eKf0rEtA25VN+5W
         HkLJU0kh+3BAEfzZzDWWzB3bQLyEoB19q/wOSUJ3v+g8SGohqzR5iKv8k52NcykKo2w+
         R8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692240601; x=1692845401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2K6cVNx8FC6ljxQatskzEJOFE1r0ruH6RVrE2R2/7Cs=;
        b=MXP+krCBheClJm9zVC265bsTqJrKb1BMpDIhiacl8lMd+xwGVNphXKqgq5ENs5cTSz
         vNTlb/oHsWEATwL4yEQtFmymXbCPGrEh+eOXME86ZZGCn9ey9CaukEeHvmiGKkIjB/dj
         pJ5jC3YhQaInd4i+D2K9HaFXNGwWjAbCdo/08cv8TgNQ6y6T6MtwRx2TBveJtHmG5WIn
         soJQE151lLmWHsTbWD9S+MVyFYpmUcX7ZLiJkuxFmWQS3SkAjA5yhwGiikOO2t6zrUAY
         cmlLd4fhnPY3zXmDg1biMBWYfhRyGvG8tcaGsCLRjS2D/7JzjKORTG48hShSLbT1lxT7
         yLtA==
X-Gm-Message-State: AOJu0Yzrmspe3LkByXyR1o6PiFLcgcH2r5l0ZImVfjnJHXYE/0Z70cBd
	soWitPCzOfbv+zvdMV5szMnLLR4wHcZtp8Xn3P8=
X-Google-Smtp-Source: AGHT+IFgAxTPj8Muse+otB8NlW2pb3BUS7hcv4mRRp/h0SrW1aju4ECXUqLUMnXXC+Wq3yRj2BviNw==
X-Received: by 2002:a05:6870:a1a3:b0:1bb:9de5:badb with SMTP id a35-20020a056870a1a300b001bb9de5badbmr4341800oaf.19.1692240600620;
        Wed, 16 Aug 2023 19:50:00 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902d4c500b001bb9bc8d232sm13827594plg.61.2023.08.16.19.49.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:50:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/16] qemu: fix CVE-2023-3354 VNC: improper I/O watch removal in TLS handshake can lead to remote unauthenticated denial of service
Date: Wed, 16 Aug 2023 16:49:35 -1000
Message-Id: <42859fe600e5dddba3c51fa8d1e680721b73e5dc.1692239433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692239433.git.steve@sakoman.com>
References: <cover.1692239433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 02:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186268

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3354.patch             | 87 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8182342f92..3347a99e19 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -98,6 +98,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2023-3255.patch \
            file://CVE-2023-2861.patch \
 	   file://CVE-2020-14394.patch \
+	   file://CVE-2023-3354.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch
new file mode 100644
index 0000000000..250716fcfc
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
+index 5672479e9..26c67f17e 100644
+--- a/include/io/channel-tls.h
++++ b/include/io/channel-tls.h
+@@ -48,6 +48,7 @@ struct QIOChannelTLS {
+     QIOChannel *master;
+     QCryptoTLSSession *session;
+     QIOChannelShutdown shutdown;
++    guint hs_ioc_tag;
+ };
+ 
+ /**
+diff --git a/io/channel-tls.c b/io/channel-tls.c
+index 2ae1b92fc..34476e6b7 100644
+--- a/io/channel-tls.c
++++ b/io/channel-tls.c
+@@ -195,12 +195,13 @@ static void qio_channel_tls_handshake_task(QIOChannelTLS *ioc,
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
+@@ -215,6 +216,7 @@ static gboolean qio_channel_tls_handshake_io(QIOChannel *ioc,
+     QIOChannelTLS *tioc = QIO_CHANNEL_TLS(
+         qio_task_get_source(task));
+ 
++    tioc->hs_ioc_tag = 0;
+     g_free(data);
+     qio_channel_tls_handshake_task(tioc, task, context);
+ 
+@@ -373,6 +375,10 @@ static int qio_channel_tls_close(QIOChannel *ioc,
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


