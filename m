Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52395EE49B3
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:35 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71907.1767125546835517570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ghRcdPcu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0c09bb78cso74193355ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125546; x=1767730346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvrohyNRa9x9g/+07R5y7k1C3EgwOVGjcA4BNZnbaV0=;
        b=ghRcdPcu2hYV3KZAU4iU8OfTUqjTl8GN7bwXi7neh+qWpdNbTP1+py0/DZRCYjzWO8
         o+ylFBbSk12dmHZyVJVVciZAtKBOBqnBqmdGkYXOgB9e+Cm0m059WCJiO1h6O7F9VWaF
         pcsYMej8eGoJH+9Ii3objUq0leKdj9aiPnSd2rEZiQr9cnPLVK8E49pll0HGW2n3h7Y2
         LIx27I0XPB8KVTCKYiWdEk4sgwRZEdLBQP2HJkp8yhh+lu5tadJ2zhE0po2iWpYDIwgo
         G5uMJRba4D76r7lcQjUkQo+A0ADbBwRa8RRR0WF67Xqsms/REw3uNfjyghk+udoXF1if
         yPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125546; x=1767730346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LvrohyNRa9x9g/+07R5y7k1C3EgwOVGjcA4BNZnbaV0=;
        b=eXjBHJT5MmxtXU6wUVoYrZu6EqZHy1hJ/V8Gf0b1h/z8v7hLULWjPVKhHFKI3rYAcu
         k9ptIoiAn88dFxXZs6Mn5CpBpcSpmV2lqSsLiMWeUZjwYD84VYX5jv4EekwsiFTT9Y6f
         mUl9j8nVtQHd8DakVzIz/n4SHb8r/lP6HuSJe+5v+CVkr0ml6Pgoc3QaeWQNhDfQlPMO
         dx0SXZDVePGhN2/7ZWxNkGJKIOEdGJorIBtiAl8mkwSsZmd784gOW1db2htTaZiV7pgH
         JoBluHpYym2ht61JdirhkSRL2K8A+jlgif6bdKlshluX0krgE2HPz2VCJXYEvnTjQK5H
         aF8g==
X-Gm-Message-State: AOJu0Yy02pSEwpmUFk0bDE9jge/pe6qhNsFwdOEANjKTdooEBZIEPl3K
	fyGSwfgBLzXLv8yiTHj53UMDJspc+Xyr1KpurZdH10x9MEioCqMm6CesTu4UFR8YDaUEN/ohErP
	63p/C
X-Gm-Gg: AY/fxX64RuNHjzO5Sba0ic/Zz94ZyjXf0YAEPMUU2Y9id8Fl5q8Ce1muD62NL8FYgY7
	HQdUltVF1zn7CklLrXPYxnwTBMhFZHOZsCgIiL+wIl3ea6GL6LuHaZprj5SjpojF2yhgYuHA7pJ
	3X9Zbw9UzAmIsPm31m+Bpr7aSVFAYo9D2W/NbT0R4fI0PkfMtNXqFNNzK3RXVwJ5dw9NX0Y43GT
	EsK52jzTiropbS7GoWLpypjk6f3ZhHhTiaOwdkPxfewhi6QgkpkxIsxPBXSEPQsQOq+h/IyBBsV
	qg8jJppwMxnflKBsGDDh81VFxHFU1dzyQ9KWN+/MeoNBJm6Pu6PRtRktIj2ljZ/KWa+mdJVWtD3
	s5gdmiy8kSzXXPlZJpNx/rODboKGGH3lJLnXqjtb/cU4kANPzshPP1Lw4foLEnqDJdeFeSoqCm+
	940A==
X-Google-Smtp-Source: AGHT+IHSlmeRYcqrHkTYcTnmm0C3+u7dLTG3NlRTsv77S37T6mS4YQM5soEH169mWJOYH/vLqSY0mA==
X-Received: by 2002:a17:903:3c65:b0:2a0:835f:3d5b with SMTP id d9443c01a7336-2a2caa9d530mr374771095ad.6.1767125546062;
        Tue, 30 Dec 2025 12:12:26 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 10/29] gst-devtools: upgrade 1.26.5 -> 1.26.7
Date: Tue, 30 Dec 2025 12:11:40 -0800
Message-ID: <3b1f1917fc18d61ab4102003e3263e8825c6b9bf.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228702

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 8abbe8c533f91780f4d315084290489c052d737e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gst-devtools_1.26.5.bb => gst-devtools_1.26.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.5.bb => gst-devtools_1.26.7.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.26.7.bb
index b0de19c10d..dab66c3c9c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "63d46a8effa8a225e25a464ba7538ace853fe0dc1e70366b27c208135e5401ce"
+SRC_URI[sha256sum] = "6912330ecfaf4f4f1329defbe97b9daf92e9aeaf8375e327a0dd30524d79f0a0"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.43.0


