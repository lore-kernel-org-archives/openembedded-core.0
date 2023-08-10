Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A29C001DE
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 09:41:25 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.13557.1691660483365148176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 02:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AVsJeesT;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1bda9207132so1383555ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 02:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1691660482; x=1692265282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YhYPzROr3ThOgZ9GF/iYrTaj9D1Vp+w++6nhaZafc+Y=;
        b=AVsJeesT2svBPIcfaoRvBFh8Qg0avH+UKt03z3HRNq+KxdefU6D3vPNSsnaENRJGrU
         mOPIWCDQH+VdwGaKVtmqEXYWZYE/noFydWzF5KWQbbzqug72aPJ0LJXxGmR0Eg7MfR9+
         kLX7abjkeN4qDNrROnt+7Rfzcf2JZw2vtiaE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691660482; x=1692265282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YhYPzROr3ThOgZ9GF/iYrTaj9D1Vp+w++6nhaZafc+Y=;
        b=eZ75/yfJaQhjzw2eFY1u2deMniNq92cONMGntVzPDdNYR/tIqhfofLRdH3AZaMDlmM
         HCaJayprljqJCTAIG4pYbgfQSUJTZGs79KmZEq/rpj7GVYf0FCHFCjrQX+jfA/fhphJf
         ywi6VwZ/2AZrVgtJS8OXaHeESJapcM7Ysn1ZwtnvIxB+7ToPnc4+UsJRWdbemSQ5wQry
         VuUfPt9xArwm6QaMpfBguHZojPovpigL2vdBo76ayofEQlMzccHI5txSAFenFMQ6hObJ
         vtVFPmcSI5M9TDAvteAlwZEhfA2KlE2GqTvqWBkQtxHokwo6wsZoGFG5kAc2wB2MP+R0
         2WFg==
X-Gm-Message-State: AOJu0YweChK6nKihVgBChfs4BIApfjjbzJcMQq0nOFyWM5ebQpcRVZqK
	x3iurvqGWR+o+Uh4jLiH2uvcDAv6Krkry30JWuc=
X-Google-Smtp-Source: AGHT+IFqECo3MFpmnirJZfR6tYkeHDNNbjWH3EbycQk1NvA/HGmXL3GVMoA+Lk9VCqUuQyyIWMxhYQ==
X-Received: by 2002:a17:902:d353:b0:1bc:5b36:a2e8 with SMTP id l19-20020a170902d35300b001bc5b36a2e8mr2154716plk.34.1691660482430;
        Thu, 10 Aug 2023 02:41:22 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.75.31.66])
        by smtp.googlemail.com with ESMTPSA id w3-20020a170902a70300b001b53c8659fesm1239098plq.30.2023.08.10.02.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:41:22 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] qemu: fix CVE-2023-3354 VNC: improper I/O watch removal in TLS handshake can lead to remote unauthenticated denial of service
Date: Thu, 10 Aug 2023 15:11:02 +0530
Message-Id: <20230810094102.1723386-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185732

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
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
2.25.1


