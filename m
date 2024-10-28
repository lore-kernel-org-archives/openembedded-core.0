Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AA2D13588
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 08:21:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.46628.1730103697783979692
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 01:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nJClIZw/;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43169902057so39352835e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 01:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730103696; x=1730708496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gcQv+ahSrYY/g6Oq5nG7xNoYTH1fJGiivDMGFOmnVGk=;
        b=nJClIZw//EEcRJcoRl9cFpXVJnuumGxrOUnpG4lUnyP0L8Lfl7M8ubKHxuzW8ac4LZ
         Cj+owxADDEdBvAnUr+7a9uGq3zvA5ocXvA69XgLJ0rdK21ucqsiD9djGZy6ZLg+9LEHZ
         tiDwFeiHd1HCd9HQ8X9qhxB9okbTKxHN8aMtRCdT37nfDpH1d2jiDBPT64rIZU9kNA51
         HwcRCFEWL3kIAUI/eo6zD4krIMC05vOmsfMJQhoZ2YkcFSpFdGIJDFi+6AQosJ1eaA21
         VfeeY7mIDcF7pnGsyvYM+O8rEiTthFeXLqlca+4JYm/h/GUggyCyZi7hjZguKzZRnfw5
         dfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730103696; x=1730708496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcQv+ahSrYY/g6Oq5nG7xNoYTH1fJGiivDMGFOmnVGk=;
        b=LP4bEFHrETnfX7RXT4tIp3oAh+mHBCfa2PJLmv6AID2VG02mxkhxJjpZDZNreV5mME
         ZRiWYpFtEtfLbqpDp7vaZx85/x9py8AEZEktxUmYx4zMcIsB6t/jAfS3SZISbs/Ab4sZ
         E/6rBnguSXa+4TWIb8wb/Ius+ZjNUZZtaktNO60Y6VL83KbzIrX8YJEXBtEWBfXqFTJl
         7ZEPkjCMaa5u1mdxQz+a7eKunse0z0/viG2erMRgXk4PYT/ljNnJ6ewO5RxCgnk4jdaN
         32urJbdVl1g4yJxFX0K75snVfaemudX58NTa4L0i7+gzzn6uUFnXl+ooTEn1fj6j+jXE
         R2xQ==
X-Gm-Message-State: AOJu0Yy21NDLrxl1ig3iMz50huE+S4Bq8CU/8vDBUUKffuE8OFs3FBxb
	VFYDr3iyUUkbPFTWrvsqu06/b4/U9D3IbqBbMeKPTwaxBuf9rB6ro/HM/g==
X-Google-Smtp-Source: AGHT+IFqeaookGCRL/YJ9xoLBNg1CnbPTPUKDdcY4Bera4rQWr+b3sobpUq6OZtoxnQ5Yu2pTss2Ng==
X-Received: by 2002:a05:600c:4ec7:b0:431:5459:33c2 with SMTP id 5b1f17b1804b1-4319acacb31mr78628005e9.17.1730103695812;
        Mon, 28 Oct 2024 01:21:35 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935f875esm100762655e9.37.2024.10.28.01.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:21:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH] at-spi2-core: backport a patch to fix build with gcc-14 on host
Date: Mon, 28 Oct 2024 09:21:31 +0100
Message-ID: <20241028082131.989091-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 08:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206425

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
2.47.0


