Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874DCCA0EE4
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 21:29:03 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.7880.1755120540184976487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 14:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IgpnM/2b;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b47174beccfso149407a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 14:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755120539; x=1755725339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtZFpoB/ByAmMdEUfvCgi3kiu+a9JmTOLLKRDzwjINE=;
        b=IgpnM/2br6KIDsSXyMvPhbZoJ1iqZDwtZdzgiSBXUhfV3y7pt/TdxlgUm8DJtEWpdA
         kIBVWBmPaPISPO4BXtWvZMoVWfrWIx21qVIxi2UHcZM9XjzZJxcTAraJXPLxs2MVnYUh
         /ri+qlX51+Kd5GGCROv5AYkJD8UJUZjoBUcc8K4yH5AyQB5WXJSq3DLWu5DmsRE4FYFH
         /VGZ8AiAlchn7NE5fWpEukWuwohvF7kQw01svjM0OzpfxzGuSLUOzCz7dyI4EFf+e8OD
         bPVcr2hZ+I3sidYSVhQCNkC0Y6smmMtzQhESX76w6aGtyJPl5TntwZbacSD6ebbJ5Szl
         gSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120539; x=1755725339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtZFpoB/ByAmMdEUfvCgi3kiu+a9JmTOLLKRDzwjINE=;
        b=Xu0pt4a33GXWlyEjoH+8cRD5+lGtfG5585txCyOL9ojKGCRrOMUnXQLVcrcOUj48kW
         SeCjZUYBkKv/90zOT6P0ddCwqssfsAW2Z7mpRAfnE6d4n4htOOvEHqPNfHW+h6mLS93H
         VIvCk4LswumQPms/v0UvXJC8AhWo4b48jAfYkPPD1drKd4tvJ/3pf9MQ1th2ak8awgjI
         usiGbiS5z9jf7NmvNH/qmtBVaBFxbXdeirUKu4I4jlVjuKV2yd//Z5tvgaJQaQfAHtKN
         o68vS9uW+4QmZNTYmFHauz8HyHGXlsPYDdY25aFJD10N9M8wVr5lNLLsUCbYV8N1UJij
         rhuw==
X-Gm-Message-State: AOJu0Yw+jzwfmtxYSKedMoLZ9LV+ZVjLvTZkM2J0kFFQ6P7rcjIQtMW5
	RbcD4vl23HpHByKFco+4Dt4CwW9++kGqSn2i6a6N7/k79TREd+uORgVHP68QpQiS98q98XiixBB
	l2QDD
X-Gm-Gg: ASbGncslLFJTuhpX9e6jxOMjFvIIzKCDXmCVeku7ICgfw74ris+S0kMaU+yfD7V2fkh
	aKA+kHGy/7a98GuXVv9m8+C5aEyXn/gAJ1ELCuwtYnRjfNgd4/rJxkGe5tZgOMLXdW2G8TJOBy8
	5lT55J0nqidBskcV3XgggC86nqQiZjPX9f4vnYM41jExJzNJ+XG8b2HZ9ha9gc966RLmm/2JgCd
	fT2hgkE62WpvlYo5AK9RKP9f9xuVJjN7xKSURgyZFR0kMJG8ekKMHZQsFg1rInra7JIje32LOJo
	ZsZDQFj0HJpoKJQ+zNVmDX4H2zJTr4soNjHbsscPWB+bQKngDjsObgig85u37h/l8GY6asRgQtw
	3vCrCYXqbm2+unw==
X-Google-Smtp-Source: AGHT+IHIgKZpx/7scKatjrmtI7j3Krp61nwskPpNAM1wiFdU1ykiPZZcuHpte0ws07WTisZ8Hhm4mA==
X-Received: by 2002:a17:902:d591:b0:240:2145:e53b with SMTP id d9443c01a7336-244584b5545mr10008905ad.9.1755120539355;
        Wed, 13 Aug 2025 14:28:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:38b9:9a51:8a43:9529])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a48esm336178545ad.114.2025.08.13.14.28.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 14:28:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/8] tiff: fix CVE-2025-8177
Date: Wed, 13 Aug 2025 14:28:43 -0700
Message-ID: <fbf3238630c104c9e17d6e902986358cea5986ff.1755102550.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755102550.git.steve@sakoman.com>
References: <cover.1755102550.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221833

From: Yogita Urade <yogita.urade@windriver.com>

A vulnerability was found in LibTIFF up to 4.7.0. It has been
rated as critical. This issue affects the function setrow of the
file tools/thumbnail.c. The manipulation leads to buffer overflow.
An attack has to be approached locally. The patch is named
e8c9d6c616b19438695fd829e58ae4fde5bfbc22. It is recommended to
apply a patch to fix this issue. This vulnerability only affects
products that are no longer supported by the maintainer.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-8177

Upstream patch:
https://gitlab.com/libtiff/libtiff/-/commit/e8de4dc1f923576dce9d625caeebd93f9db697e1

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2025-8177.patch          | 35 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177.patch
new file mode 100644
index 0000000000..30dbccd94f
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177.patch
@@ -0,0 +1,35 @@
+From e8de4dc1f923576dce9d625caeebd93f9db697e1 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Wed, 25 Jun 2025 17:14:18 +0000
+Subject: [PATCH] Fix for thumbnail issue #715
+
+CVE: CVE-2025-8177
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/e8de4dc1f923576dce9d625caeebd93f9db697e1]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/thumbnail.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/tools/thumbnail.c b/tools/thumbnail.c
+index 274705d..8960d36 100644
+--- a/tools/thumbnail.c
++++ b/tools/thumbnail.c
+@@ -538,7 +538,15 @@ setrow(uint8_t* row, uint32_t nrows, const uint8_t* rows[])
+	    }
+	    acc += bits[*src & mask1];
+	}
++	if (255 * acc / area < 256)
++        {
+	*row++ = cmap[(255*acc)/area];
++        }
++	else
++        {
++            fprintf(stderr, "acc=%d, area=%d\n", acc, area);
++            *row++ = cmap[0];
++        }
+     }
+ }
+
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 6ff31bd0bb..4c9c212312 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -58,6 +58,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2025-8176-0001.patch \
            file://CVE-2025-8176-0002.patch \
            file://CVE-2025-8176-0003.patch \
+           file://CVE-2025-8177.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.43.0


