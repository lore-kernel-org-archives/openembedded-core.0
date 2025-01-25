Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54D8C0218C
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 15:33:06 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.11836.1737819176777433755
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jan 2025 07:32:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mnlLqSbP;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4362f61757fso31811845e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 07:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737819175; x=1738423975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EDU3f3IuqhzMoMKK4yY5eb8zUt7rw2cZZEUA1u9OAs4=;
        b=mnlLqSbPOXz+GgDMsWUSkYLHc5s7zqCg54T7oJCN1hcFp0xdSd22sOv/HfXn6C7HEk
         9iBsc0espl8+LRqzrSzhF1ZfBeN705r6/kaBFUcOVfmXz347d2EUnikSAl+bvIMrnIEw
         wmeieOpeQA3BI7aelCqVGIxJTCS7ZJC+S/+iTud116uSU+8++OaYEPGbCEak0H+ERaHb
         2wPZfBhydfD2jTydNdDKXTEUNAvL2MskTExNUWEyOlXwEJ5Ej2FFDxU0YB7XwjyOOPSA
         JRBWmWusHXW2YIUwgu629nvJbafDbDRy8kVYL0Ta7Pmv/lSJ8c/n9ItblF0fxso/OF3a
         xYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737819175; x=1738423975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDU3f3IuqhzMoMKK4yY5eb8zUt7rw2cZZEUA1u9OAs4=;
        b=iM7h5OBRre+aoMX418jU7l54bOoTRYakB8TXAlQ9fhyxOU8+2UPI/U39ek7urZlqKM
         VYs9T9cVtXasApXTwqS04f5TF5BjDL+vTZrauwHuWWeiWr8JzpOPWOGTaJsWM2h8iJF3
         kblPye3LAWl8EtKX7lYjKrNSdDv4BDXwJD/n4iW/XUVEeDeoxKhhCZMWEU5X0Czlku50
         WnsPigqAPOME9tZBDnZAfc43CfHNvl8gNsp4wK6QbEqGP/vR1ovyqaajIcrNHGFVXqk4
         z4f4G9M2jCJsmLEfmEjInj8dgC+J+sXvIfQktfOtaV99hxrJIcDLTQF7295eC/xJ6hxv
         OrVw==
X-Gm-Message-State: AOJu0Ywki8BN2KeYCNQpDUqKNo7+m9NuGev1bd1PZSF5Y1WENuA40NWO
	soXu5ZSvoDl62DtH4yIdyctRXG1HvbXGgDpZu7FzY91YQJvgbpnSWlfwZw==
X-Gm-Gg: ASbGncuL35FTuOUGiP5B1b2XlzjK2F9EIVhxGg9yCxdcoZY6OH5AyLJGqqURrmoEZMx
	MRlprKw5wbigYh+j+4NXdE3lAV2cus0XaNi5rqd5xJhOjhUDuweE07Bg2n1zg0z533FQ/RpGhmV
	YkYHS4hBcpZFeo/Vb+Nm5tPuLF596lisU4AArKk1pb2S/nUuW49gkcZeEjJ5TXyj6qRNVyXmC7K
	VuDHMMRRGm9zucONQ+dpR2rRuzEvUDafeJuTq05z96AHajMOMqVQNFqIW7X2fdsnxtX9gs1lPeY
	nqrVXTRTdC+naj5ypbwIndmVpDnycA==
X-Google-Smtp-Source: AGHT+IGHalQrNL0n+rWj19NYdzqBYRxFjDNSp05T6Vz2lKD6NntDQhLx1G9M/gcFH9YYKpoam0huQw==
X-Received: by 2002:a05:600c:1da1:b0:434:a815:2b57 with SMTP id 5b1f17b1804b1-4389141c4ebmr264956905e9.20.1737819174562;
        Sat, 25 Jan 2025 07:32:54 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4857cesm63779385e9.13.2025.01.25.07.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 07:32:52 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] gnupg: remove obsolete patch
Date: Sat, 25 Jan 2025 15:32:42 +0000
Message-ID: <20250125153242.3285322-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 15:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210264

Remove a patch which is already merged in v2.5.1

See for reference:
https://github.com/gpg/gnupg/commit/1d5cfa9b7fd22e1c46eeed5fa9fed2af6f81d34f
https://dev.gnupg.org/T7193

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../0001-fix-compile-failure-with-musl.patch  | 33 -------------------
 meta/recipes-support/gnupg/gnupg_2.5.2.bb     |  1 -
 2 files changed, 34 deletions(-)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch

diff --git a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
deleted file mode 100644
index ec99f4b10c..0000000000
--- a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 81c222ea179ef73fcae4b50c56342bdad4787a28 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 22 Aug 2024 15:31:16 +0800
-Subject: [PATCH] fix compile failure with musl
-
-```
-../../gnupg-2.5.0/scd/app.c:379:3: error: implicit declaration of function 'write'; did you mean 'fwrite'? [-Wimplicit-function-declaration]
-  379 |   write (card_list_lock.notify_pipe[1], "", 1);
-      |   ^~~~~
-      |   fwrite
-```
-To access the Posix low level file interface such as open, read,
-write and close, should include <unistd.h>.
-
-Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=1d5cfa9b7fd22e1c46eeed5fa9fed2af6f81d34f]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- scd/app.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/scd/app.c b/scd/app.c
-index ba7bb23..7d41e53 100644
---- a/scd/app.c
-+++ b/scd/app.c
-@@ -24,6 +24,7 @@
- #include <string.h>
- #include <unistd.h>
- #include <npth.h>
-+#include <unistd.h>
- 
- #ifndef HAVE_W32_SYSTEM
- #include <fcntl.h>		/* F_SETFD F_GETFL F_SETFL O_NONBLOCK fcntl(2) */
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.2.bb b/meta/recipes-support/gnupg/gnupg_2.5.2.bb
index 64c63e31ce..8e87382f12 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.2.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.2.bb
@@ -18,7 +18,6 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
-           file://0001-fix-compile-failure-with-musl.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
-- 
2.43.0


