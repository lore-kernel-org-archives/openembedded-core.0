Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0DFE77185
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:08:21 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.20318.1734012497568889419
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:08:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bMV36A+I;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2164b1f05caso5883205ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734012497; x=1734617297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bMNG5EWO5ieMYCnp41tx/NWntbhUk1bE1N5UaXPWLaY=;
        b=bMV36A+IZ8ijyPR+mUm+9wzBA+OifqYsSCOAOP0TRTXTtszhctl8NLJq1EjyizpyQm
         jHIRAQrlSkwifgE3YslcgbymLBjGqFw/I4yEi1iUNQ762kqREuif4MRNMVp02HAotXwQ
         JATAhqoIEa0znK4jErqpzhtTxN4EI9nVknjwGWZ1yBAMAspj+jY09dDyzV5Wj9lJe67s
         /i2Svq+IlllhZL0DxdwP59J9oZNJVRNZentT1Mvh116LuLiEauCXWuGppADaARJbvX9p
         vTCY1cjehY4nYRkxlXFXNT6hcvWF4MYcK1uZQLrlqd8n3UfdlpZGVQPdP7xloAndifCs
         k/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734012497; x=1734617297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMNG5EWO5ieMYCnp41tx/NWntbhUk1bE1N5UaXPWLaY=;
        b=Z1I6nLPeAZbSt6Qi2kPVlvNb2JPb/jW9Bfb+wx++fulzxkykf4+ncASjuF/hj8/fZF
         lTVC2wB3t6ofQGrQRhQr0ULDXUdjwZgKiIH5D7mD0bfkNFP0PlSaeRnz+uNcDzFPcmG7
         a0l47RFxvFA/tLA+8/njVzoBHSyEm9yduUk9OsGA9XZ/FEkyup+3kHDUL6RHHtvLwc4S
         w3rTBQwryoTJId3f2xwAe67oKl3GDy6x6ANQyZ5kRE2aR8u+pMywV5vCq8XXQ/3a5uBu
         DAFv2nM/gdjrm9vBue/bnvjKTurXH6ZMqXWYrbYR6AdDxzqZ8wOTXxPuWO6n0acw9+A8
         dK+g==
X-Gm-Message-State: AOJu0YwyvsybmOk9P1aJyOLfrw8jKY+n3M1o/QGK1wS5lBTN5P1jnuYe
	uTfr9VxDD4i3f+7/UZ8tBetjTjh4eXxdv1T1WgLEQ8pzTP1t5cGr8hxyV4mahb/8EltRwY3G4fo
	A
X-Gm-Gg: ASbGncuhdnSx7/xsYZPAQb2x5R2tp7MvzRkK97A7glYC+otDaaXuUDh8vF8CKK1E9Jt
	ohO1utQi4f9w67ZYUQ/1MglpQHkGrA4SWIitIpaKs1iViL21Ai7h4NCRlSZJyLfmJcw/gu63WR7
	u1GdfDOMAeC7Y2KBkW1/r/bZb/KxmZrmURRI3frP2cV2p0c4Epe1hmmqFB8bHRfuK8h5K1fVADJ
	8CetYysmzY4ngyIL3eqEADfrH01fZ62ReQvtgFZxoxcOg==
X-Google-Smtp-Source: AGHT+IFFEodoajYs8igA2jYn1QqJTbsekddMT11RH6MTTtH9Ss7NFXL488kNsWdiDtXPmP6l/MdTeQ==
X-Received: by 2002:a17:902:e5cf:b0:216:2c3b:61ba with SMTP id d9443c01a7336-21778516510mr112659445ad.56.1734012496861;
        Thu, 12 Dec 2024 06:08:16 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21630fee27bsm88847705ad.269.2024.12.12.06.08.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:08:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 08/12] systemd: drop intltool-native from DEPENDS
Date: Thu, 12 Dec 2024 06:07:54 -0800
Message-Id: <5c6254279c8b7faf76809024ebbc02856030179e.1734012352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734012352.git.steve@sakoman.com>
References: <cover.1734012352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208642

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

intltool was dropped as a dependency in v236
See commit for reference:
https://github.com/systemd/systemd/pull/7313/commits/c81217920effddc93fb780cf8f9eb699d6fe1319

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_256.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_256.5.bb b/meta/recipes-core/systemd/systemd_256.5.bb
index af810c0fcd..ca164657bc 100644
--- a/meta/recipes-core/systemd/systemd_256.5.bb
+++ b/meta/recipes-core/systemd/systemd_256.5.bb
@@ -4,7 +4,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "intltool-native gperf-native libcap util-linux python3-jinja2-native"
+DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
 
 SECTION = "base/shell"
 
-- 
2.34.1


