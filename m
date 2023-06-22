Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4C3EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:09:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.13139.1687444943632291683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 07:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=r5J5mKUX;
 spf=pass (domain: baylibre.com, ip: 209.85.221.52, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31297125334so780225f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 07:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687444942; x=1690036942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXl7ykHe8HueUU3zMxLNDXqY5vr0hiWO1KbSES5+VkY=;
        b=r5J5mKUXhQFvnI0/Mnkt5KU09UnjHB6A1XYQrEl2jSBTT5h5FGa1mb1ZowOptjsa3m
         7wwTaWPy8pezc7u8fEvv3tpruOLVk9ueNyYk87NZ7ARQeEcnuVfbMFoTC9Jz8UJ8OYy8
         jXgKcUfhpU9PWio+f5tWMN0/0rz3l04s0lJ+pbBPztBcPb524fVGULUp/+7zEsntlxzW
         lolwCal8baH1W7yo6IRYGYWhoKrvLsAqorfSiZwFLtKzfeyD3SB17yhFr/sW1PrggAjg
         b3YFimh3Y9bO7gC9YSUDW7/tkJxjuoJljpGJWRRrTrDfjmoLlhVnZhgkvNv1cRcI2xrh
         cQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687444942; x=1690036942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXl7ykHe8HueUU3zMxLNDXqY5vr0hiWO1KbSES5+VkY=;
        b=ExYi5S5BAAV8D7ZfKxIKSyB8DWRZ5q8+h7N5/+ttoRnprhioUJPlZL2aBL2+6nTM1C
         EZ0wr9xFQm2DKxXEFPxng34b4VgzlK8GHtPJY/HG2WeRmdnh3a7F6HS7w2+tk+WP2P6e
         q20EdqD8qe6qDyX954jdHbADuvtHCqtFRF0q2r851S13AUJg2XJwU/Tq4nS+9VN1F586
         zbT0b/enfc1oeXxrmuiwDpVC7Jast4QBwScDcTyqxQdkgB5e/f14KmBc2e0QIP0uPhV8
         a87gl1B5OUttzN8WH4iiTMpkS6HUAi28h2nZfFmDCSik9Gq816OPnIxQmYlthEyvJo11
         yMaQ==
X-Gm-Message-State: AC+VfDzqVvZuXZVDfN0NYWxy1JnaAVmGXOk19gOxzS9WywrTK0/Eukoi
	GtsWUnYjuajXKPdSj0ThTxPsRak6J2uRGYu8nj4=
X-Google-Smtp-Source: ACHHUZ57hik+1zTM8RCZkJIiXDEwWkFUR4KSDq3PDQMZknvl5ItF45uH9/bZGfA4DFgAH8FjpGY9cA==
X-Received: by 2002:a5d:4587:0:b0:303:daff:f1a3 with SMTP id p7-20020a5d4587000000b00303dafff1a3mr21729285wrq.1.1687444941713;
        Thu, 22 Jun 2023 07:42:21 -0700 (PDT)
Received: from tapa.fritz.box ([194.110.145.167])
        by smtp.gmail.com with ESMTPSA id f20-20020a1c6a14000000b003f8f884ebe5sm7968951wmc.2.2023.06.22.07.42.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:42:21 -0700 (PDT)
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/3] wayland-utils: Upgrade 1.1.0 -> 1.2.0
Date: Thu, 22 Jun 2023 15:42:15 +0100
Message-Id: <ecb952eb0e56cac19463509b24e33d7b7c1aec30.1687444823.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687444823.git.pidge@baylibre.com>
References: <cover.1687444823.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 17:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183273

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 ...ayland-info-Fix-build-without-libdrm.patch | 42 -------------------
 ...-utils_1.1.0.bb => wayland-utils_1.2.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/files/0001-wayland-info-Fix-build-without-libdrm.patch
 rename meta/recipes-graphics/wayland/{wayland-utils_1.1.0.bb => wayland-utils_1.2.0.bb} (82%)

diff --git a/meta/recipes-graphics/wayland/files/0001-wayland-info-Fix-build-without-libdrm.patch b/meta/recipes-graphics/wayland/files/0001-wayland-info-Fix-build-without-libdrm.patch
deleted file mode 100644
index 86c44d4480..0000000000
--- a/meta/recipes-graphics/wayland/files/0001-wayland-info-Fix-build-without-libdrm.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From c79a3fb51718c4286b74edf0f758df9219994844 Mon Sep 17 00:00:00 2001
-From: Olivier Fourdan <ofourdan@redhat.com>
-Date: Wed, 14 Sep 2022 09:07:10 +0200
-Subject: [PATCH] wayland-info: Fix build without libdrm
-
-wayland-info can optionally use libdrm to provide a description of the
-dmabuf format modifiers.
-
-When not using libdrm however, the build fails because "dev_t" is not
-defined.
-
-The definition of "dev_t" comes from <sys/types.h> which is included
-from <libdrm.h>, which is not included without libdrm support, hence the
-build failure.
-
-Simply include <sys/types.h> unconditionally to make sure "dev_t" is
-defined regardless of libdrm support, to fix the build failure.
-
-Closes: https://gitlab.freedesktop.org/wayland/wayland-utils/-/issues/6
-Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
-Fixes: 240cb739 - "Add support for linux_dmabuf version 4"
-Reviewed-by: Simon Ser <contact@emersion.fr>
-Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/wayland/wayland-utils/-/commit/baa65ba9f62e6a05c32b9202b524158a21f24245]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- wayland-info/wayland-info.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/wayland-info/wayland-info.c b/wayland-info/wayland-info.c
-index 53cd04b..98ff205 100644
---- a/wayland-info/wayland-info.c
-+++ b/wayland-info/wayland-info.c
-@@ -34,6 +34,7 @@
- #include <ctype.h>
- #include <unistd.h>
- #include <sys/mman.h>
-+#include <sys/types.h>
- 
- #include <wayland-client.h>
- #if HAVE_HUMAN_FORMAT_MODIFIER
diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
similarity index 82%
rename from meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb
rename to meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
index dcee87e2cd..16a5dc072c 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
@@ -10,9 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=548a66038a77415e1df51118625e832f \
                    "
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
-           file://0001-wayland-info-Fix-build-without-libdrm.patch \
            "
-SRC_URI[sha256sum] = "9e685863025b4feade36d53bbc8e31b43e26498be743dea84c7a84912959410a"
+SRC_URI[sha256sum] = "d9278c22554586881802540751bcc42569262bf80cd9ac9b0fd12ff4bd09a9e4"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.34.1


