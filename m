Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0C3C87FCE
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 20:05:02 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.66852.1753646696209473144
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 13:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=S7zvx2tv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235f9ea8d08so35091925ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 13:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753646695; x=1754251495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1PpTLvvJ6QAbuZsp/n0QbRaxYZw62LC/s0RkbCt/HQ=;
        b=S7zvx2tvlzWQyUtrlftywV0dGAngaIx7pC+YRUlUP+d6ELbJ2t5rh7bA9CyIGVkvD1
         DoIG0L9F71XTGAajxo9Qr8ZW173qMo0YJBVkqCPJ4oLnztgbVygcXqJzDVK/bDTpZhBc
         Wa1uf+/pLOvVMEWsIx9rSNDEna8o1+JWbeE15Iec+sn56ZqZmE4QXTfOmx5kgIYBCB86
         bss0qdWzl+TKF6Cx1Gi+7qrLLIpZDoET9mbI8d2KfdLVpGu+0eRf5eRzD1CaQ+X+tdkv
         gMg3zXNkTEJ9hTi943CtnH7a5A/SAGMYuHqCe2Z0kKysi3HnUSg0rbjiAYQ/b1RVnqXO
         ANYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753646695; x=1754251495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1PpTLvvJ6QAbuZsp/n0QbRaxYZw62LC/s0RkbCt/HQ=;
        b=CgIDzVoMVLGonrx/XFLH07yVwYdKLKGewNQje2Nw5b+9gypa8uNVOyxeSflCoVStU3
         mw4A00GYWiYo2LyWlh1Ppcxj2ZU6ZXseTfHyVNuSaYTXpuP+rHeABVD1ugHlAqM9EZsu
         J3h8BE/bBCN6wdXMgoCaB2uQYeMfB0td3YUsDgOwahb8BVIJn3ilbORFrHV9O1YskbUL
         Rx42/sOjp4AlEaVuZSoB5oY2k/HgxcpVEuZ16hxTWfMWvxiqk5G+3M+slSL9/f9N5zEd
         FO0QaYjSxyZGtFontneOSNsSpKX8yYwpLerPiP8lZjEDEDEz00Whpj4oXifdljNcQOoE
         mPsA==
X-Gm-Message-State: AOJu0YxmUKkM9ftDuSuGX0z5KGHMSeHpOf9O1PEsOYiXnLY5WTihCYhQ
	pZgaLFO3e9oaWYnWSsOThEA6vbejAk+JYjyJINAg3GzKYGLFMQ7/EOf95C6Movdn2JoE47yaVaq
	dE/uDDAA=
X-Gm-Gg: ASbGncuMcIt9FsvjLRt/FM6WH9SmjszGyQu5hYA6HyqF+Gj8PEz0HM2KGx6ahBkzWBf
	grvfqvYBUBnRaSNIX62Kiq2zbfACiyoTSGMaUsvn2aE7Tk+ize6kSluOzdwCDruva2HwfShKzEp
	a0IaoglDpMG7boLe5NTT28skUZoK9Y4le0ba/3S2eF/wi1+GCnVk0J5p3g+3drm0zm1Qq1/AQ/O
	eNy3HDuoWSnypjdjfTNLz12rkYpfRkOfsTuVihX08Ff0rNFoOlQy1+kqr3BiVf7nm9QuvaEobc7
	OnPGeXzms7pVXceiBMmqTgbahDLKNl76ykdfAH4XTxDHMvRhqWXlTMD4m3LliLRhuBdJCKhsN4r
	Yp3G6C+ditE9w6Q==
X-Google-Smtp-Source: AGHT+IGPhhAsrZFEPjXSZ7SDaDmY5IrTv53Nq1W/FnTNofX3Ogwtf8iGA/kkd/+5lNC1HEwrSXNPNw==
X-Received: by 2002:a17:903:1b28:b0:234:11f9:a72b with SMTP id d9443c01a7336-23fb3155fddmr156482055ad.50.1753646695399;
        Sun, 27 Jul 2025 13:04:55 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:22e3:7abf:ace0:e5ff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe512ef7sm38905665ad.131.2025.07.27.13.04.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 13:04:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/10] ffmpeg: Ignore two CVEs fixed in 5.0.3
Date: Sun, 27 Jul 2025 13:04:36 -0700
Message-ID: <78aef4b1002c515aa2c1a64fea5bb013c9bc86a8.1753646578.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753646578.git.steve@sakoman.com>
References: <cover.1753646578.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220975

From: Daniel Díaz <daniel.diaz@sonos.com>

These two CVEs were fixed via the 5.0.3 release, and the
backported patches that fixed them were subsequently left
behind (although not deleted) by dadb16481810 ("ffmpeg:
upgrade 5.0.1 -> 5.0.3")

* CVE-2022-3109: An issue was discovered in the FFmpeg
  package, where vp3_decode_frame in libavcodec/vp3.c lacks
  check of the return value of av_malloc() and will cause a
  null pointer dereference, impacting availability.

* CVE-2022-3341: A null pointer dereference issue was
  discovered in 'FFmpeg' in decode_main_header() function of
  libavformat/nutdec.c file. The flaw occurs because the
  function lacks check of the return value of
  avformat_new_stream() and triggers the null pointer
  dereference error, causing an application to crash.

`bitbake ffmpeg` reports these two as "Unpatched".

Ignore them for now, until the NVD updates the versions where
these do not affect anymore.

Signed-off-by: Daniel Díaz <daniel.diaz@sonos.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index 57bd4c5442..8da11f196d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -90,6 +90,12 @@ CVE_CHECK_IGNORE += "CVE-2025-1373"
 # bugfix: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/3bc28e9d1ab33627cea3c632dd6b0c33e22e93ba
 CVE_CHECK_IGNORE += "CVE-2022-48434"
 
+# These two vulnerabilities were fixed in 5.0.3
+# bugfix: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/2cdddcd6ec90c7a248ffe792d85faa4d89eab9f7
+CVE_CHECK_IGNORE += "CVE-2022-3109"
+# bugfix: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/481e81be1271ac9a0124ee615700390c2371bd89
+CVE_CHECK_IGNORE += "CVE-2022-3341"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.43.0


