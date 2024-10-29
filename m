Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259C3D3A692
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:44 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.1960.1730228436544866111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DrQ/V5Z/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e3fce4a60so4199849b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228436; x=1730833236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQpEM8rMnNfdZI/0nqnxwRCKKTWYBO8kb2SF1zz2zNM=;
        b=DrQ/V5Z/jDzmx3DnKZGCQNGifFrB5twH2VyX/8Hripqcgbs4ieQAP0qmj19i3R9QBY
         PDfzHUuwy1os+PrL00c9kAQG+fL+15NotUgAHQuEbGp+oTYcSv5mbKtYDrSdnlGQumAJ
         pDX1pNR/Y+L5goa+cFol8kD63QAc4IMPC9vFUz/MgYNZulN+9a0Ik7CP04JborcaXA3+
         J0Ss3SrMHK3xNr47SHPryXQFeD/d0tXhRpSyuk8raelME6SqcdD0CImhMNN1vgTt3Nd2
         00HAhISTgyftTO+CuwUrwZYS5AYkJdduV2ZjZ5bAr9i69EPrL09ndz3Qbr9PjPQJFVH9
         ceJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228436; x=1730833236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQpEM8rMnNfdZI/0nqnxwRCKKTWYBO8kb2SF1zz2zNM=;
        b=a+KRWSSLykCpJijO1Y1IWrXclb1mSplJF+abs8TLeT7kK0K9hi6KVDSI10sURfhUDH
         cbvg3QPmiTmM7mgZALTAykEeSTHCDkl40E6tJLXdWRu1z0vEKnymH+7fTttkR7NP28z/
         8kjlp8cuqu6KJCldMQPJBF7dfIZsbyuGXA+Z9+LVEoK5uHtEoYaHDHm+zg8v/gAtF4HR
         T9l0RKBc9+WBiFF/F/CsjPexPhQPweGfg62iuv6ZVApf4Py0mGSmgvUOtgDIPiYz5M5k
         /K1zAXDm64fd9uQbTOZyKoa3wWAHgwrRM/Kn2oDmQhc5a25mx5MmVgmrLfNxki7F6iNX
         1rTw==
X-Gm-Message-State: AOJu0YziR0uuc1HAsGQ4fpd/7Bvhg00qQqcSK9pCjXwGXTPbPFCsEDeI
	G6oTiUD4apumY+ixBpSsJ9gwr8Iaa/raH6QfTMQMi+1l/DuMwRy8KTavM3zqS761wbt9N4bneeq
	t
X-Google-Smtp-Source: AGHT+IG8miW9no1Ih1Qti05Vvz6zX0k4Bvvm3awfWLIw9C6TWG3hHtq+RIo8QRKTH7u562anHCm9+A==
X-Received: by 2002:a05:6a00:84c:b0:71e:4e2a:38bf with SMTP id d2e1a72fcca58-72063028f7bmr18839846b3a.18.1730228435605;
        Tue, 29 Oct 2024 12:00:35 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.12.00.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:00:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/19] at-spi2-core: backport a patch to fix build with gcc-14 on host
Date: Tue, 29 Oct 2024 11:59:51 -0700
Message-Id: <e361d9e1021d7715d2b4e3af95832c910de67cad.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730228268.git.steve@sakoman.com>
References: <cover.1730228268.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206528

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
| ../at-spi2-core-2.42.0/atspi/atspi-device-listener.c: In function ?atspi_device_listener_new_simple?:
| ../at-spi2-core-2.42.0/atspi/atspi-device-listener.c:252:37: error: passing argument 1 of ?atspi_device_listener_new? from incompatible pointer type [-Wincompatible-pointer-types]
|   252 |   return atspi_device_listener_new (device_remove_datum, callback, callback_destroyed);
|       |                                     ^~~~~~~~~~~~~~~~~~~
|       |                                     |
|       |                                     gboolean (*)(const AtspiDeviceEvent *, void *) {aka int (*)(const struct _AtspiDeviceEvent *, void *)}
| ../at-spi2-core-2.42.0/atspi/atspi-device-listener.c:222:50: note: expected ?AtspiDeviceListenerCB? {aka ?int (*)(struct _AtspiDeviceEvent *, void *)?} but argument is of type ?gboolean (*)(const AtspiDeviceEvent *, void *)? {aka ?int (*)(const struct _AtspiDeviceEvent *, void *)?}
|   222 | atspi_device_listener_new (AtspiDeviceListenerCB callback,
|       |                            ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Fix-function-prototype.patch         | 27 +++++++++++++++++++
 .../atk/at-spi2-core_2.42.0.bb                |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-support/atk/at-spi2-core/0001-Fix-function-prototype.patch

diff --git a/meta/recipes-support/atk/at-spi2-core/0001-Fix-function-prototype.patch b/meta/recipes-support/atk/at-spi2-core/0001-Fix-function-prototype.patch
new file mode 100644
index 0000000000..4fe7866ff7
--- /dev/null
+++ b/meta/recipes-support/atk/at-spi2-core/0001-Fix-function-prototype.patch
@@ -0,0 +1,27 @@
+From b29826379068a05cdd42ba6e956d17e4d6681c7b Mon Sep 17 00:00:00 2001
+From: Federico Mena Quintero <federico@gnome.org>
+Date: Tue, 23 Nov 2021 11:18:51 -0600
+Subject: [PATCH] Fix function prototype
+
+device_remove_datum already implicitly casts its cb to a
+AtspiDeviceListenerSimpleCB, which takes a const *event.
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [v2.43.92 https://github.com/GNOME/at-spi2-core/commit/1e91fc4cff2080696be914e26f4cdf0bf32d1550]
+---
+ atspi/atspi-device-listener.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/atspi/atspi-device-listener.c b/atspi/atspi-device-listener.c
+index 69f77d1..9776ebd 100644
+--- a/atspi/atspi-device-listener.c
++++ b/atspi/atspi-device-listener.c
+@@ -53,7 +53,7 @@ device_event_handler_new (AtspiDeviceListenerCB callback,
+ }
+ 
+ static gboolean
+-device_remove_datum (const AtspiDeviceEvent *event, void *user_data)
++device_remove_datum (AtspiDeviceEvent *event, void *user_data)
+ {
+   AtspiDeviceListenerSimpleCB cb = user_data;
+   return cb (event);
diff --git a/meta/recipes-support/atk/at-spi2-core_2.42.0.bb b/meta/recipes-support/atk/at-spi2-core_2.42.0.bb
index 9ca969cbb8..97e09202fd 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.42.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.42.0.bb
@@ -11,6 +11,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Ensure-x11_dep-is-defined.patch \
+           file://0001-Fix-function-prototype.patch \
            "
 
 SRC_URI[sha256sum] = "4b5da10e94fa3c6195f95222438f63a0234b99ef9df772c7640e82baeaa6e386"
-- 
2.34.1


