Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B505E77185
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 20:56:57 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.3947.1733864208367577080
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 12:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OQgvOEmH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ef6af22ea8so4200075a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733864207; x=1734469007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HtJi1jI08unfJI9Yw1XbgfbgvoZ1s4oBFmNozbZggOw=;
        b=OQgvOEmHig8M0nClrBAXcBi0+X8QYMUCIFxakL5hFx/v2A4roontSb01P4C0gKwOBx
         zFV7m2K/3UI8XEP1joVDGiI/ok8XOpcGVXiyg2sMU75UOaVlFc3ET71Y1gyrkLHE1faH
         /ErU/c2k234ZAcLIpGbMC7pwlqu2raGZPwLfn4krsEP9uKHTu8QGhP1U7qFI/awIPTaX
         vFA5BsBsVXb6/AukgfegRErwTEbOHpwtz6W+aBQiJPrd8QBrkjcN9Sf+dwLySYvdHmYI
         dW15HBuEWeXnQNQy+ODWVmHR8edv2cKLJ1zV7FrANfXr5Nqwz2I/5uW0OXbS3hnvpsKw
         GlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864207; x=1734469007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtJi1jI08unfJI9Yw1XbgfbgvoZ1s4oBFmNozbZggOw=;
        b=X4oioIlN7Zk20i1Yd7iVNJx2z3d0qqpA/EB9E87jpMO+d7OD2PKg1igGeKIsOHDykJ
         B36vcgJ5bzBPPHXc1YlP5kf5mvyL84yXcNyc2wUL28UsqloO5LgDIisig2RthWwR0b1X
         az/GkLpMz72BUkhzbe5Wx1n4agqI3PtYT0PpArgllUIYVroVINzl4j0G2fQU52ZKIDz0
         Edjt1hREXlD6dEJNZtY35Cx890RvO3nE/jF9pemdNHSzejWd3UOXKs+/L3EL13UPvEC+
         CEnV2E245JtsLWaltU6iKBK2yIu/mQqJqnAiFlCzsSc8ni6K3W5/k/WVPkBFAFXqACVC
         k/Hg==
X-Gm-Message-State: AOJu0Yyoys03hWQa+iv+RX+nw3oYHvuWjD2xuP+6V8Eu8ulaBtuexPwk
	a5ECnhM/T4Wb7uh5gJuQDTuQ4gtM+8FnHgr/bYr4h0S9qklLID1khOR9IK+PyVYNU3zg9vc67GP
	C
X-Gm-Gg: ASbGncsmGSqve4pRdh3jzkhAFJTi6MfhjdKCjGYQm20za2UJrGxGC4Ww87cXm/6BOSB
	59VWhDr4vCR1ZHbz95fZDRpCGCegfgpLQ3ttbkK1Z64WAjzVlHnB1tXs8JjijKLvG6O6197P8UJ
	6gUuyYNNxHez8o20z2YWZMN5ssxtBWG4lP72EXbNYGCE4Kcn/h5QlJOOs52tShEvV2PMWlmtpsr
	tdJ7krT0Z4YbuW6F11uXSHSQI8Opbmw0IR+Jkt8DSc=
X-Google-Smtp-Source: AGHT+IHJzhNK7tliX86O3VLEyZO+oqWTbyryVtMeD95rHheWQFR4L1QguvN9sraE8ED7aSGTwUlK6A==
X-Received: by 2002:a17:90b:35c8:b0:2ee:ab11:fab2 with SMTP id 98e67ed59e1d1-2f127fee426mr590466a91.22.1733864207656;
        Tue, 10 Dec 2024 12:56:47 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45ff77b9sm10245470a91.36.2024.12.10.12.56.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:56:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/12] systemd: drop intltool-native from DEPENDS
Date: Tue, 10 Dec 2024 12:56:24 -0800
Message-Id: <60e6fd2b7e3adfbe4260cd266dbe245c745344a9.1733863624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733863624.git.steve@sakoman.com>
References: <cover.1733863624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 20:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208551

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

intltool was dropped as a dependency in v236
See commit for reference:
https://github.com/systemd/systemd/pull/7313/commits/c81217920effddc93fb780cf8f9eb699d6fe1319

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_255.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_255.13.bb b/meta/recipes-core/systemd/systemd_255.13.bb
index 0ccca8a567..fa3ad1d2cd 100644
--- a/meta/recipes-core/systemd/systemd_255.13.bb
+++ b/meta/recipes-core/systemd/systemd_255.13.bb
@@ -4,7 +4,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "intltool-native gperf-native libcap util-linux python3-jinja2-native"
+DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
 
 SECTION = "base/shell"
 
-- 
2.34.1


