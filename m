Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B706EE95A7B
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:26:02 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.27939.1696717557194771682
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2zCwOgjJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c60a514f3aso27646655ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717556; x=1697322356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFVFCv2sAwyvwgH+ZlzlO3jhwt2kuPvbKMeyReBE7oQ=;
        b=2zCwOgjJ3RXD9wx/hjlCrrBPl6HazqVAWHPcAjB9s9LN0H+4svwIiuoeT3ZA/yRP4b
         AO+1xtj1S61L0upEy9Drtyo3xDZtcm9GK57SMynRJFvFtMqJXHvq1pnwa+YmMmdfMtok
         3+X2iV1Ed+/nGwtCyB94t7oolh+NLw+lrTd70KsOFumKl+cZ45FQ2aDR8qfoEZGUp/S4
         QMagwiw+UEABYyMZNLIIwaqfm8SoxfbXLjIBN558FNdDR9Ltz7SiWAtA6vzOrFXOoQRf
         M+pHbqL4gJpnBC9AyG7gJwNRfeH3zKOOxoE6t4o1M+IR6xblMu+LegRSPKHbFwG9vJz+
         Vstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717556; x=1697322356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFVFCv2sAwyvwgH+ZlzlO3jhwt2kuPvbKMeyReBE7oQ=;
        b=LM4U81gjl1IEJ1kbyCAC/gdANCZ8aeIOMy+2WiO7xefragh9jt5rWN/oLHMNnd4Xrx
         NQLnpHdjVx5MFdUVyvMYVhRKzUQvvEdph8rH+CVmnWCWtAc0ZIeVqtuBTHoXwA1P7XVZ
         xlcWsSXqej+cyMYGwdhjFart7TFDS8SSvAljSp9mDl5aNGFT1+7J+6Xx0UmQf0WJiun/
         ix2JdEt9wxDA+BmIIXIDdFSE8Iq/gLvXBEB99B3QUY+OIKrhbnadLrAoT4EJq/n4KyWE
         CuZjXzp9S/rshw11mu4SAMu4Dld25478TGpbq+CnICYaOumZzF6UnMyh3OcQ9xaJD76+
         ggkg==
X-Gm-Message-State: AOJu0YxyAT8EwH4OA28CF4PiCaV0jN4DffNo0Z7R0D8hdibbySr2RvFE
	rXGaNiyncikaUr5gP4lqe1iCMqsN7zRa0DSoLEs=
X-Google-Smtp-Source: AGHT+IGGQbBtaVBThjGOIBKUzstxgEIU4UYiHL5bkS0duywTM72tHJF8UkB6vKr79M6LppjMLE8N2g==
X-Received: by 2002:a17:902:d481:b0:1c8:7d21:fc50 with SMTP id c1-20020a170902d48100b001c87d21fc50mr11018283plg.56.1696717556396;
        Sat, 07 Oct 2023 15:25:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 16/19] nettle: avoid neon on unsupported machines
Date: Sat,  7 Oct 2023 12:25:12 -1000
Message-Id: <9a0c8796cc5788a88b3e4fea50de130185b11a18.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188817

From: Benjamin Bara <benjamin.bara@skidata.com>

Disable neon if the machine does not support it. --enable-fat also
includes the neon assembler code, therefore also disable it.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 768c6bb46e1cc4a1d8c12c6f30408bb821ec4534)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/nettle/nettle_3.8.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/nettle/nettle_3.8.1.bb b/meta/recipes-support/nettle/nettle_3.8.1.bb
index bf49132235..8569b2f95a 100644
--- a/meta/recipes-support/nettle/nettle_3.8.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.8.1.bb
@@ -34,6 +34,9 @@ EXTRA_AUTORECONF += "--exclude=aclocal"
 
 EXTRA_OECONF = "--disable-openssl"
 
+EXTRA_OECONF:append:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon",""," --disable-arm-neon --disable-fat",d)}"
+EXTRA_OECONF:append:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon",""," --disable-arm-neon --disable-fat",d)}"
+
 do_compile_ptest() {
         oe_runmake buildtest
 }
-- 
2.34.1


