Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427C7EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 19:23:43 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.27510.1686856847531184376
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 12:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=VKr7tcsG;
 spf=pass (domain: baylibre.com, ip: 209.85.221.43, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-311099fac92so2181799f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 12:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686856845; x=1689448845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXl7ykHe8HueUU3zMxLNDXqY5vr0hiWO1KbSES5+VkY=;
        b=VKr7tcsGQfbYra7KkhbLVBzZc8lEXMrNd1n0blHyyHkKKHekroiLmlBlJ+f4UPhPx5
         RwZ2wVg6EDWmakdwXC4UEfFCFclCDtycJfbIGFlqdNiNSRPdReeM/Ph1xZbDHmV4uhhn
         ris09EVBfHKjcCCZkwfroWR2IZP5cX110O0q+F4qrfpYmlDhr7+tEnw2YGHhk9DM0QHb
         WnmQmkZrJH22k2DfrNwlhEqfgtynOKziWHuydwqCHLnoh3Dc+0C0xushL4UxM/cRM8or
         M8zIVwLNBDZ9+mj0XCj8+/0sA2mIUltvgMpqwJw6pSn47x9FRKosDvLHqp+lQ/n1+UIQ
         Nh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686856845; x=1689448845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXl7ykHe8HueUU3zMxLNDXqY5vr0hiWO1KbSES5+VkY=;
        b=HWi4q58khzqD1KPSgSmOEMDJXunob5bSoAz9HPh6GV/f0pxOtWPTe2h6lP43CjEG2Q
         G/DKmElJktqDhCGmKjYT2Zwkdj899MZl4q5mxZ1rC6S/QirT6kyrxOiOP43xGNku/sm0
         X66duOUm4nCBKcY0g929un4UHKNFINIRqScQRjMILiLuu9C4SMBEvm7/gBvbviBBQi9z
         CNlIrfJiYvFpE2xjJpZmOqZiRHRNS2UpFFRoj11xaftJiVcF+NDaPEPchzgebO6cq4Ww
         eNwa/W77GasGM/CU0fSo7HDO0dtWqOvKEMiyiOO+aPEfUkFDCOlFYQOAzoy/1uaW64bW
         DoCQ==
X-Gm-Message-State: AC+VfDwHxluqOdROtKl9/aswmnh5T7UM9zru8PQk6geBW7P4fryG7qRx
	2uucImD47L6KMaIPBhtdCHKqaze3WA/0S7MyBfw=
X-Google-Smtp-Source: ACHHUZ74rCP4a5kfPprtHz1m7dNhGa1KM+HFj7/WJDVqhXB6fX/y8kDbZdJ/3hxPMenz8PsqajfN1g==
X-Received: by 2002:a5d:6811:0:b0:30e:56d9:d7ac with SMTP id w17-20020a5d6811000000b0030e56d9d7acmr12041919wru.35.1686856845667;
        Thu, 15 Jun 2023 12:20:45 -0700 (PDT)
Received: from tapa.fritz.box ([194.110.145.180])
        by smtp.gmail.com with ESMTPSA id e3-20020a056000194300b0030ae901bc54sm21788097wry.62.2023.06.15.12.20.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 12:20:45 -0700 (PDT)
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] wayland-utils: upgrade 1.1.0 -> 1.2.0
Date: Thu, 15 Jun 2023 20:20:38 +0100
Message-Id: <a7b2403a91a78531782b71a3f0f96a5f4b757a1c.1686856412.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686856412.git.pidge@baylibre.com>
References: <cover.1686856412.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 19:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182868

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


