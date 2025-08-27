Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE5CCA0FF7
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:09 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.6594.1756330200035805895
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EW6hAEPp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-32753ef4e33so265739a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330199; x=1756934999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VudScSBi8nbwJYZKWI32MGtLvhSMlxNvW5599qPCVrU=;
        b=EW6hAEPpZKm/434oGhqyTp6CHrX0jqiXLZl87U+SF0gN4AUI9L5HaFdNze9PNzgDP3
         MUk3rdZrCdKvAfzz8G5BtFxyOotPHdil9N5oFqY/QXpfdeb8MtrNKW9CnRcnHPmbbzHe
         ysOjGj7B+aYgUYiSBn1yagJdWZR/c728wlzGc/MxrYGXeiOlqC2NujceyUCX+R+Wpeb4
         xkMUsskMzt7KAVK7Altg85TX69PcIrRq/1NyQtTdZTks8bPKDXqAqmlcUcx4OGqZ7LuB
         vz+C8VPzeSOWya47tn6bzy5zzG928KIrbMNf+/MSu91NqgHRLEbD6ehUZdcQuzAs33F3
         xCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330199; x=1756934999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VudScSBi8nbwJYZKWI32MGtLvhSMlxNvW5599qPCVrU=;
        b=oyG0sIAdThgbNRGaCOODgJNTTfZBbmgIy6xjHwyl2DIlyd58SYDRusr+qwDa5iiidm
         G0ATrGOlAM3jFQEAL89SdQfPmzL8IzjYUBfdcbAzI0kYODcGNP2xSag/c4XCKtpS9wnX
         e+L65uAWy+XAhwbSk5ykHheaxoSk5gZ9i7Sj+9Co9Ub3tl2LA4TCNfTSZgaoea3FjD/j
         tVgRRvd5h4A4HaTV8KeMCZhA+n5bHXGXp8rH119P4Q3DOfVb9oHU7jdvfjD3sn5v0um1
         fafr6xRONP/4P3HmgQHIPGjdU+nUOIDGV/TjLRRL/keReLNL36+e0LoXSORbfXnb+dEU
         4mCQ==
X-Gm-Message-State: AOJu0YzQi/hN9impkyI+DnRzhitjszSOl3wc1pLkDBrlcXXXp6zILvnB
	cRmY/AOxhjqYUS/7PuG/sRt1juvdg8kQpFc/9pnI1QItVE5kF/TvXWnjiJEVDNRJaVmHx/gPzBH
	W9cht
X-Gm-Gg: ASbGncs7FjnnaYVZpNpU6rmkFBeejO+pQ7kIQ/ffRBFR4BmN1uky9lTaY8T4sXV/XXM
	YNfuR5x2AuAi08znzaUYsOB2MNXXtyQOz/fdZl4vybqEb9ME47S0cTHlUNJ7iTwSPM+INhH4/6y
	ywePWwoFNrstRGgwveFC7gCASpwXOobzLhWmNzxbRvsvYjURQEL28Nh7TK+gIpF+ENe9t2jtaYs
	pCIpYFnC+oZ0MhB1VWUO67sNch2LurUrfxwUJueQPgFxPQhr5PfF0HI2917G/d4e6QD4tKQuIuH
	s/gli7WpiV/ktsMM2YEm8DTh4309Hm65CSPz1VDBQjvl4fLsVoQiEidYONaDw+Q3tqISBbGK7fe
	KTB2kg9udIEb4Rg==
X-Google-Smtp-Source: AGHT+IEzj4mOf8SaZszCNo7MK9xuCx/1DY4qTEKpaqb560uUtiKmrCRgPIAxBIw2hdHNIcKNwU8v8w==
X-Received: by 2002:a17:90b:48d2:b0:325:83ab:230b with SMTP id 98e67ed59e1d1-32583ab2adcmr16078525a91.22.1756330199309;
        Wed, 27 Aug 2025 14:29:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.29.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:29:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/33] ncurses: Pin to C17 standard
Date: Wed, 27 Aug 2025 14:29:13 -0700
Message-ID: <2ee706f58a96f30904ac3d292c0ac532739c91ea.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222514

From: Khem Raj <raj.khem@gmail.com>

Newer snapshots of ncurses have the fixes but they are many needed to get
C23 going. Until next release lets stick with C17 even while GCC 15 switches
to C23 defaults.

For scarthgap also add it in BUILD_CFLAGS.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 3b72f3efdd..5ef735fcf8 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -30,6 +30,10 @@ ENABLE_WIDEC ?= "true"
 # _GNU_SOURCE is required for widec stuff and is not detected automatically
 CPPFLAGS += "-D_GNU_SOURCE"
 
+# Check if we still need it when next release (6.6) happens
+CFLAGS += "-std=gnu17"
+BUILD_CFLAGS += "-std=gnu17"
+
 # natives don't generally look in base_libdir
 base_libdir:class-native = "${libdir}"
 
-- 
2.43.0


