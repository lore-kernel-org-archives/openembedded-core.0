Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1886BC4451B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 05:35:41 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2707.1784525732149072705
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 22:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MeRa8m+A;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3811f512167so9600973a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 22:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784525731; x=1785130531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BKtNK5sGf45A67olY4snbv3P1pfhp7CjSWTHdikyRV8=;
        b=MeRa8m+ANPkRRCKeGmqFIzSYT06aJeuYKvfoqprzKJq20sKi25Xey6+jqhW9nXo/su
         t/AR+4HUzBpI3gsGyhSh0iku+PGy9rmpqL5BGoIvupkvGwq2DhO8dEhmi3vRgXwN2vA0
         kbFfF65SPbCK+ktlQNgi6EkEcfWmlkog/CSRucO+JkjP32cFIbiaaVNe98ZbrvV7UnUO
         4oFJnCWKWCwXNkvr/UDUglDqLL9cWdPlUibcS/2OHTxnspZBBsTqR/dZLHIN0pQk/fdQ
         gXjiQFIxKm8YqGu4IGHZRdLX/byLXnOKVy05Bqx5CHhNNSPwqlbaDMjbOsJdl864V3L4
         mF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784525731; x=1785130531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKtNK5sGf45A67olY4snbv3P1pfhp7CjSWTHdikyRV8=;
        b=S1kvF37vRZYUoja1GHYVaObOx2Nvv98TMm5J6h+74g4kSbaIppbVXaO74Oh5weSfaw
         Gb7ZQrIsDiSoVhjAZOsfyfeTcVq8M0QvC/Ng/QqM54cZ3mfZ9cvqr5omB9VHZG994UvJ
         mJb9NkSrcgEM8XS2brBH8/Tzp0Cv0T5PLb+bPOkkhYizrvk57ZwzmKo/UBD2UUKNs+qW
         WsoZGHGFUnZ9umdmAn7LCQUeU5vO1fVErEQdw4YS4v8gp5yAF1ttF3DFy2pDvT2GU+N5
         Q46ugkQHmeg9FZf/qtdiyA9NFEmw2qY2eTnF2qzQtBEmfB1aCq0fD4aa4Y1+JGOSOjsG
         sN2g==
X-Gm-Message-State: AOJu0YyqAZr9T0gcq7P2QCILuADtAE7Zp/dFUd9IoPmO/KyI1G+pa/iC
	4kBzi0eqwv9kpsiEDu6F77AbvzdeKbPjno9vBa4/NStZtR/Q+S3dqGZNWY2isQ==
X-Gm-Gg: AfdE7cn69luIg9jUQAZDjb8VbLuNJ/bHKA+8BL9HEWxC7Zzqg0xXs8MakoL1POQ/0yp
	fv3m1Ugy2aHaSWpi6o9QoiuNXwbDDSf+7KIBjWmZtuyNbRgzytGvO2x1RrY1BESz0ZWCLl4fd0U
	nI/KWGKk9T6CHa2t/SyjQGYaq80NJVwPbwt1z9IEooR3rB4+CqPmT4TMtu/bLJrF0tUlkOSwv6Q
	xETN9fDjff3H8ATJL6A4LOYhaSqRHcL/FM6GNQvfKGEsGLEM61N2805WMXd05UVL5SQ33r3wfAI
	33ZX3TBTbFjnmif3X/h//TOaFEOauljjZxlnsI46myUtcQW8lD/knEz2NUcL/b6jXbTLlsD2StZ
	i8UATJRyBZnEFgwVd9RDH3RDR+EgYrzAyRIgUm9N8KtjBkZZTHD8UIuW49xqKYQvh27QtWtK3qe
	6AGs4pguHUhyrVw7BMuDg2kGtmZOA4eutYgIxlAnYsU8I7UKNYhblokSq8fqMtiszJtTd5WvMxb
	GDTEb5OCiqY/G6NN8CS1izeK/TL/BPqt9FThm3s1hbQWkeW8oiXyRTsLDaAbl9VhImUNYmQUDp5
	sA3EkO6rejYovC2ExWQ=
X-Received: by 2002:a17:90b:5604:b0:37f:e1af:df22 with SMTP id 98e67ed59e1d1-38e4b4312b7mr14289603a91.17.1784525731327;
        Sun, 19 Jul 2026 22:35:31 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2dcdsm28450119c88.1.2026.07.19.22.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 22:35:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 1/2] libpsl: upgrade 0.22.0 -> 0.23.0
Date: Sun, 19 Jul 2026 22:35:25 -0700
Message-ID: <20260720053526.1992240-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 05:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241320

License-Update: copyright notice reworded, MIT terms unchanged

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libpsl/{libpsl_0.22.0.bb => libpsl_0.23.0.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpsl/{libpsl_0.22.0.bb => libpsl_0.23.0.bb} (79%)

diff --git a/meta/recipes-support/libpsl/libpsl_0.22.0.bb b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
similarity index 79%
rename from meta/recipes-support/libpsl/libpsl_0.22.0.bb
rename to meta/recipes-support/libpsl/libpsl_0.23.0.bb
index 1e5e9c74b4..793fe0d73b 100644
--- a/meta/recipes-support/libpsl/libpsl_0.22.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
@@ -7,13 +7,13 @@ HOMEPAGE = "https://rockdaboot.github.io/libpsl/"
 BUGTRACKER = "https://github.com/rockdaboot/libpsl/issues"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9f9e317096db2a598fc44237c5b8a4f7 \
-                    file://COPYING;md5=9f9e317096db2a598fc44237c5b8a4f7 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=49296c1806ef92c28297fb264163d81e \
+                    file://COPYING;md5=49296c1806ef92c28297fb264163d81e \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            "
-SRC_URI[sha256sum] = "c45c3aa17576b99873e05a9b09a44041b065bbfa390e6d474d06fbfaeb9c7722"
+SRC_URI[sha256sum] = "f39b9631b3d369a21259ea4654f8875c0ec6995ce9551c0eb5d423e4c011f911"
 
 GITHUB_BASE_URI = "https://github.com/rockdaboot/libpsl/releases"
 

