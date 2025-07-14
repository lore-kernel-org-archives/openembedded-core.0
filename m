Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDE1C83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 12:02:31 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.76397.1752494549740603829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 05:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PgytGmma;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-455b002833bso8549975e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 05:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752494547; x=1753099347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KUc0vnOVhZoL8VpGBISzHDmP1rtsFMd+o36JcLuRq5I=;
        b=PgytGmmarS7PK7vJNe/kSP+gr+PMt2a7tE84cXuroRy97ZmPwVU2nUS/Y9gU5gGKWA
         Q62u5d4InssgbjH8BOESAI0zrpPbJkrLE1G/UYvsl2vVOoVgjW+QtPBDehkMOZ34VVBX
         98Oj/nimeKVJ04RqUzmkynwK94plGgj25Wmxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752494547; x=1753099347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUc0vnOVhZoL8VpGBISzHDmP1rtsFMd+o36JcLuRq5I=;
        b=iBQ/NKqKX3yyFSVl1yUY+cTKIBAPFI5HzglnL6+QrQFcOC0fu7GYgfUAZtQmlVqH+k
         E0Q9gR+Ptx1Oh18peRlmYiI86zI3M1kWtVFPO7X1mWD0mPTZIDhhxkX6fk+d13rHRa4e
         E5ykZeNtxy6s3q44cShGzPMAkAQEDabkh9n1XH+Hzi2V6mCBeXVrQL24pVO29KsRqOXH
         MWM3vCMIHmTRgOtS4iT/UXZeX5TokIrU7yWWuV6srWJvodOs6upVJ5Nif13sUj8oeO7C
         I3NRmGC2XiRvAycU9qSp9Sz0ksh+eMdpJaFI7NtOMunbDiWDO92Y6mH6sdFN7LwRt+9j
         aOUg==
X-Gm-Message-State: AOJu0Yx70UdZ/y+UIxVobHILma8DMtkeUL6S5admoNojgAsiDqO683zw
	1YzEBv7adU/H8nPIRmnM/2N3mWGVpwcEjgpBH5CsYfRxKGEJcoSJL7fEjRDnWhu/Oa01xUeJH4j
	9Uye7
X-Gm-Gg: ASbGncsSMaUe74haLPGlI2Hp0a82gBcDcVwOXO2p0xJ0zsf+tEgIqISA1eSTaM9SX2u
	XMmk3t4SU30liN6L989xWJt23vt+IIWyXqrJozHEBOWiSnfDo/aO2LaUsDh3J3PTunzz2ChK+0K
	yB8cHwq0C+iyOslhTPBdAA5mMoM6GzC/dGzqp44LrG4iuwO0D/ISBup+bF/hBLiaKkBWqAWAU1Z
	h81Y9zgdTbC2z/53nsFXS7cA+2hl4O2u+7iyjqcs0KbKFxgeShGoQdTWwJiPlEdfOnZ3pr/EiW4
	TBArRk0bSyz3K6NcQnfdnyWgG87C6RUtjrfjwP2I3ZUWJFJ8Y7pTikH9e9CUArjyq2QaOFkV1A1
	M7QRPzLX7grbGQttfQNwqZjA1BAgJP1rfH4rWDTYtceMIFeyUJXY=
X-Google-Smtp-Source: AGHT+IGv7bZ80ayKMvbTKNtRvUNkVKbhqNbhLpsred+s4xAbHP5/dmEDLFfTwIJZOV9ANXWUX4zX2Q==
X-Received: by 2002:a05:600c:8b07:b0:456:1752:2b39 with SMTP id 5b1f17b1804b1-45617523462mr37385395e9.33.1752494546862;
        Mon, 14 Jul 2025 05:02:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7cb4:487f:cc4e:53c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2131sm11984174f8f.29.2025.07.14.05.02.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 05:02:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc: Add flags to CFLAGS instead of CC
Date: Mon, 14 Jul 2025 13:02:25 +0100
Message-ID: <20250714120225.1113086-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 12:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220225

Recent changes mean toolchain variables are initialized via inherit_defer.
It is therefore no longer possible to add to CC using the += operator.
Instead, add to CFLAGS.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc_2.41.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glibc/glibc_2.41.bb
index 7771fac0412..0852bb4bdbe 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -111,7 +111,7 @@ do_configure () {
 }
 
 LDFLAGS += "-fuse-ld=bfd"
-CC += "-fuse-ld=bfd"
+CFLAGS += "-fuse-ld=bfd"
 
 do_compile () {
 	base_do_compile

