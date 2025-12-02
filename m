Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F680D12682
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 22:20:02 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.940.1764713994427927050
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 14:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2qZR5Xtb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2984dfae0acso93155785ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 14:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764713994; x=1765318794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLDHOlsO+EORVH6SOR+vgFVFI+7v48RxhgDvTujgf4Y=;
        b=2qZR5Xtbr2XMc195RKFBGb8zBRVP/woH2a7I00zmZIa22D3RhP5J7kNHT6w0iioM8B
         G0Q8SamabmXyXrtRMV6UmhgldzJMivINHvzJUw2SW1n+9wZgXRt/Ur+kEYod6XsPn1ud
         cdUvmaQABEhHhBUtCEfoxmkPTMOj4swQK1t9Jdvev7WcagkhxjmdgeaA4D7w9I5SqUq1
         4Cy6udV+l18voc+s2FPMl1EKAOe+n/0thmwUUakLWri/A+A4eWAp8s6Q0Z+rfAEUIu/X
         e/xnavHmgN93WLlsOq1CcVdW5LgLUvPCaFidWaZQI2hRxu+7rQ7yF2QbTS+5vUY3Vf+D
         DZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713994; x=1765318794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MLDHOlsO+EORVH6SOR+vgFVFI+7v48RxhgDvTujgf4Y=;
        b=rVnSENRP+VV2+cQ4tMVySOisfBp8vssCqtDwNFBeE04OOtOaObd97atiBRE9bhAfCv
         7Xd01kbHqRBcpwZr92JU6arqX8soEyRZoAXgcw63ZkZk1ezS94Nr8s81zg24kx/hfSVk
         oHXrIS9F+WsNobGnvIRu9XHezjB8NjrZWl28pTT3FnQWwf5CTteHvV4QlckMxVwDyd8B
         xx3oKrRNrqblQsl27ENEyhVKT53rZ6UBxqmtQHNLPTsqPh/h9fNmKa1TKX9h52xU2Fwy
         JGvkjTwXMvR+Uk69rZxvXlVo6Ox+tUiP0dD4A0h51gKu7zKqg3Dwdpnfd/aQMy9+3hHP
         PqjQ==
X-Gm-Message-State: AOJu0Yw6erFlqeiuAJCvqRnStFzpXgJZkXKs73le4Qut6E80hYqF0SXO
	31rCsSBa2VurycFJu8Y+EkKl8IjKOqRpIS4HKh26yk1o02S36eGCp0x7d9kJGKkmFiCC/aclZ0Z
	XKPCh
X-Gm-Gg: ASbGnctC8yJCzdueIlSKau4YGzhqXyu2e0IXRJO+s6xkXDBZGwIg5qxmOXCv58Z3kyH
	uN7+xGfkjDey5Dps72Q83YWfVYopWkRff8jelazwUG2V12sO+PY+aMtbf/Y5BQrDpUgAJzE7IHI
	KIWNQbV2em2tEhNP4GPQoLGL5gnsFagCl5po0bAKODKVRQ7TrWJEiSt0oDyI0YrcKLY0X+3xFD5
	rJkz2aOCTEjlATeOHvFGfCoYjQEoYKa+pgRgvxYXNicHXMBKM1ikRUjYfWKCD8K5+wW5J2bjfRE
	HA8FqQ0ps2sSqEnOkSa6u440fl/wG/EUa51p7KFgq4AfNljKd+73pbf2i6veFWFkyrEOjZtyNXe
	wIr8BXaM2vCUceJRe1yg6op1nFeKPsXpvMz6gKhhUZkNrVX3/u9W7AmEBZR5XtSF4oU4Und/Rgk
	hN67X1C9HUIOqe
X-Google-Smtp-Source: AGHT+IH+km+jxvxh+C7OoPb46CyqvehHElammGSt0qAvw9XJArTJ3VUOSirLgSaY66cLd24qfpjuOg==
X-Received: by 2002:a17:903:3503:b0:295:565b:c691 with SMTP id d9443c01a7336-29d68336edbmr1707245ad.17.1764713993601;
        Tue, 02 Dec 2025 14:19:53 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40acc7sm163700565ad.2.2025.12.02.14.19.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:19:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/8] libpng: patch CVE-2025-64720
Date: Tue,  2 Dec 2025 14:19:28 -0800
Message-ID: <ad0f645816f548e557928460af8db94f3c03fb50.1764713862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764713862.git.steve@sakoman.com>
References: <cover.1764713862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 22:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227192

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpng/files/CVE-2025-64720.patch         | 103 ++++++++++++++++++
 .../libpng/libpng_1.6.42.bb                   |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch
new file mode 100644
index 0000000000..08df7c3210
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch
@@ -0,0 +1,103 @@
+From 08da33b4c88cfcd36e5a706558a8d7e0e4773643 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Wed, 12 Nov 2025 13:46:23 +0200
+Subject: [PATCH] Fix a buffer overflow in `png_init_read_transformations`
+
+The palette compositing code in `png_init_read_transformations` was
+incorrectly applying background compositing when PNG_FLAG_OPTIMIZE_ALPHA
+was set. This violated the premultiplied alpha invariant
+`component <= alpha` expected by `png_image_read_composite`, causing
+values that exceeded the valid range for the PNG_sRGB_FROM_LINEAR lookup
+tables.
+
+When PNG_ALPHA_OPTIMIZED is active, palette entries should contain pure
+premultiplied RGB values without background compositing. The background
+compositing must happen later in `png_image_read_composite` where the
+actual background color from the PNG file is available.
+
+The fix consists in introducing conditional behavior based on
+PNG_FLAG_OPTIMIZE_ALPHA: when set, the code performs only
+premultiplication using the formula `component * alpha + 127) / 255`
+with proper gamma correction. When not set, the original background
+compositing calculation based on the `png_composite` macro is preserved.
+
+This prevents buffer overflows in `png_image_read_composite` where
+out-of-range premultiplied values would cause out-of-bounds array access
+in `png_sRGB_base[]` and `png_sRGB_delta[]`.
+
+Reported-by: Samsung-PENTEST <Samsung-PENTEST@users.noreply.github.com>
+Analyzed-by: John Bowler <jbowler@acm.org>
+
+CVE: CVE-2025-64720
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/08da33b4c88cfcd36e5a706558a8d7e0e4773643]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pngrtran.c | 52 ++++++++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 42 insertions(+), 10 deletions(-)
+
+diff --git a/pngrtran.c b/pngrtran.c
+index 548780030..2f5202255 100644
+--- a/pngrtran.c
++++ b/pngrtran.c
+@@ -1698,19 +1698,51 @@ png_init_read_transformations(png_structrp png_ptr)
+                   }
+                   else /* if (png_ptr->trans_alpha[i] != 0xff) */
+                   {
+-                     png_byte v, w;
++                     if ((png_ptr->flags & PNG_FLAG_OPTIMIZE_ALPHA) != 0)
++                     {
++                        /* Premultiply only:
++                         * component = round((component * alpha) / 255)
++                         */
++                        png_uint_32 component;
+ 
+-                     v = png_ptr->gamma_to_1[palette[i].red];
+-                     png_composite(w, v, png_ptr->trans_alpha[i], back_1.red);
+-                     palette[i].red = png_ptr->gamma_from_1[w];
++                        component = png_ptr->gamma_to_1[palette[i].red];
++                        component =
++                            (component * png_ptr->trans_alpha[i] + 128) / 255;
++                        palette[i].red = png_ptr->gamma_from_1[component];
+ 
+-                     v = png_ptr->gamma_to_1[palette[i].green];
+-                     png_composite(w, v, png_ptr->trans_alpha[i], back_1.green);
+-                     palette[i].green = png_ptr->gamma_from_1[w];
++                        component = png_ptr->gamma_to_1[palette[i].green];
++                        component =
++                            (component * png_ptr->trans_alpha[i] + 128) / 255;
++                        palette[i].green = png_ptr->gamma_from_1[component];
+ 
+-                     v = png_ptr->gamma_to_1[palette[i].blue];
+-                     png_composite(w, v, png_ptr->trans_alpha[i], back_1.blue);
+-                     palette[i].blue = png_ptr->gamma_from_1[w];
++                        component = png_ptr->gamma_to_1[palette[i].blue];
++                        component =
++                            (component * png_ptr->trans_alpha[i] + 128) / 255;
++                        palette[i].blue = png_ptr->gamma_from_1[component];
++                     }
++                     else
++                     {
++                        /* Composite with background color:
++                         * component =
++                         *    alpha * component + (1 - alpha) * background
++                         */
++                        png_byte v, w;
++
++                        v = png_ptr->gamma_to_1[palette[i].red];
++                        png_composite(w, v,
++                            png_ptr->trans_alpha[i], back_1.red);
++                        palette[i].red = png_ptr->gamma_from_1[w];
++
++                        v = png_ptr->gamma_to_1[palette[i].green];
++                        png_composite(w, v,
++                            png_ptr->trans_alpha[i], back_1.green);
++                        palette[i].green = png_ptr->gamma_from_1[w];
++
++                        v = png_ptr->gamma_to_1[palette[i].blue];
++                        png_composite(w, v,
++                            png_ptr->trans_alpha[i], back_1.blue);
++                        palette[i].blue = png_ptr->gamma_from_1[w];
++                     }
+                   }
+                }
+                else
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index ab043e3338..6f5b69b754 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2025-64505-02.patch \
            file://CVE-2025-64505-03.patch \
            file://CVE-2025-64506.patch \
+           file://CVE-2025-64720.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
-- 
2.43.0


