Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABE8EED60A
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 15:22:15 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.23361.1694791329727195064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 08:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nZLGBSFy;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-273e1aec35aso1981902a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 08:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694791329; x=1695396129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcG1ejcraLhAnp370cjIHbUIou3DH0+fZ3VK1Nxn+HE=;
        b=nZLGBSFy/k5Y+UFf++xfGthzRxMVbDsF8W83s+g8S1ckhHiD6pHb38DYy842PHB33C
         WYLCbtRsYSDR6hd6VfpOmc6Y2Rj4JBxt7o2nDSCedHKiJDWNLjtyRaSnfBSsNxgzejbT
         JSVMipk4mD9i+fr88xVJGU+Bi4tJSOE6l2bwcmU/AuHS3GICB3PZ4lgmfoaFdcgpV/l6
         QnFT3fBIh7gmbkqHZocdYhNjy7fTJdr2wwfl9ZOscXLmePNvE8JCxEKOfH3xlFSdIZch
         F9ZNToIA/fJJT1y70IzH+AlDcImXUKqip4kjTtjx66QfR2QZUzil+BTAZl9xLQAugYaf
         4eFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694791329; x=1695396129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcG1ejcraLhAnp370cjIHbUIou3DH0+fZ3VK1Nxn+HE=;
        b=uvodMdYagp436F7sB7mXOoB4XECNYeMZo6FjsCtnydgiEmt2b42hz0pnyExzZ1udtL
         wMyenNnNG01iiiTD4vPnIfrQvF0QrI22/R/VHQIpWgN7szVXKxxoO192fwzAvWgsEFYL
         Xz63rTOHjGl8v19xy2RlzkAwRPqNALBTg5j4FGMY7tdWQdz/5QVus5NKE5RnXctwXnPA
         dlzAfdgjzbLinY6bBj+6jWFRijUzERgugfzzU9gTQF6123krzL0o6l95R3gNJaiKn4rq
         El87bJjIYkcDPUfckC+CJXyxU5tRFbpQGBvEWqtkfKHTkHMmtr2RpYroveYmtoUq9bGb
         lQzw==
X-Gm-Message-State: AOJu0YzkcETcZ75t5foAZIGELa6p+x7PSVNLGgH8GVnbDvKm19Q+tWrH
	Zvw60H6O2e7tliUXvlu+lepVRnjfIYXJetDo30E=
X-Google-Smtp-Source: AGHT+IGdIU1xQw5/cylsCToACbgcdjk5iJ6pZRS/XnZMbVkuqTQorwe3RccPUrRh7i1s/a12wb7Y7A==
X-Received: by 2002:a17:90b:195:b0:26b:f67:9d1b with SMTP id t21-20020a17090b019500b0026b0f679d1bmr1687726pjs.30.1694791328664;
        Fri, 15 Sep 2023 08:22:08 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d21-20020a17090ae29500b002749ae93778sm1375398pjz.23.2023.09.15.08.22.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:22:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 5/8] qemu: fix CVE-2023-3354
Date: Fri, 15 Sep 2023 05:21:43 -1000
Message-Id: <16249cbd2c81e870d5a59bc08e420b2ed0842a74.1694790288.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694790288.git.steve@sakoman.com>
References: <cover.1694790288.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 15:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187673

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was found in the QEMU built-in VNC server. When a client connects
to the VNC server, QEMU checks whether the current number of connections
crosses a certain threshold and if so, cleans up the previous connection.
If the previous connection happens to be in the handshake phase and fails,
QEMU cleans up the connection again, resulting in a NULL pointer dereference
issue. This could allow a remote unauthenticated client to cause a denial
of service.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-3354

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3354.patch             | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index fbfc9f7499..c8e1d28654 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -40,6 +40,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2023-3301.patch \
 	   file://CVE-2023-3255.patch \
 	   file://CVE-2023-2861.patch \
+	   file://CVE-2023-3354.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch
new file mode 100644
index 0000000000..b3958ecbf5
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch
@@ -0,0 +1,88 @@
+From 10be627d2b5ec2d6b3dce045144aa739eef678b4 Mon Sep 17 00:00:00 2001
+From: Daniel P. Berrangé <berrange@redhat.com>
+Date: Tue, 12 Sep 2023 06:38:03 +0000
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
+Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
+
+CVE: CVE-2023-3354
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/10be627d2b5ec2d6b3dce045144aa739eef678b4]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ include/io/channel-tls.h |  1 +
+ io/channel-tls.c         | 18 ++++++++++++------
+ 2 files changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/include/io/channel-tls.h b/include/io/channel-tls.h
+index 5672479e9..ccd510ade 100644
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
+index 4ce890a53..17d73f02e 100644
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
+@@ -374,6 +376,10 @@ static int qio_channel_tls_close(QIOChannel *ioc,
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
+2.35.5
-- 
2.34.1


