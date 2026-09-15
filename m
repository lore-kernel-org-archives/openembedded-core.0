Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C23EC88E73
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 08:10:21 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18191.1789458585421841345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 74.125.225.76, mailfrom: aurelien.desbrieres@gmail.com)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485843116d2so313116f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 00:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789458584; x=1790063384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p9Tp+iSpv1Y4SGRa+Ub90WbgscWzNSStCZ7ysJLyeIw=;
        b=zjWcOrh0u0R4ZxX0Hc8F+jiR3rPmFuCjdT8MBw5zKuGAxR5EVYh9LhjfJX04lLXguE
         mckD+O8Hq9uUFCPXbmiJxsBKW7PKwA170fIptq1bzuovMrvdfvNg60oiXOX8Talv+sXO
         d1BpsAmfBB/jIBZUbUBWo8qvKmxb2pFJBp2hTMZlezAfrLAtaIb4Rl+yjP5XEo0xXm3M
         2coFHMjmZF6IsTJRCCYII/jfDgnp7x7J4Ra/s8UUkoWAW1gQThRt2cYiJcLCYIM4oWvg
         hMV5EXwMU6tutc+jFdJIY7gRbXLbPuSGtfK/C8IbR9+QNbWfjubRr+kaB8IFwCW1UYbf
         3fpw==
X-Gm-Message-State: AFuF++kqMF56NRCyWsXoOssBUv2yjXUFnLWSJJp9xqjQLJFTUrNGbUPx
	RxKIr0Y54nAbDe8n08a0JzrtEPW7A/KeVBp53odZpFnC4FvOqs90ZUex
X-Gm-Gg: AYBFou3A80/7ZGZRSiVXe0cPN/p2Qj95GmbezARMENgHce8DHq1UsZeELLQ9ShovyBe
	kmmT8z5caFI9DDkLtWq8HjQwepzMq6mhqCYyjUvSVAbPVqca/xPpklQ4ok23l5gdVNGhljzLFKq
	bhRtNd6F6b/7m+8Trk1nwUydXxuCj6jlie7uD/eLMSnihHH6MbhGztbEPZbuqaUfW+mp3b4rG9l
	e+hP3ZfvDT2ESKDuT94LH0VkNLGtt2galC06u32KDpPNlO+LjA+l8GGhKuyynMVXL9WGOe6PFHC
	ERzhyhw0kmsRu/8YrBrjeWPWuHOoqhyLIIL/90UEBBBni8B5u7HedWiC0jGrcD/yNgw5SJS4rn3
	Y3xwLjeGZhubTbO5oHxcPZRbDG7d6dau17OZEcy77KBVZrfrULnQUSnC1ZriMtdVU8YKy7vltw5
	HjjO8CV/Fhty2OWdxittbV5X2ExWdCf30pio/43wXcUDrJo77AFBF8CHeIBwUAGZnwsi16v/LGK
	Gl/qWAcqAltX2eoYNDoKLNTSbg9PrXbWTtxmWFKSXb9ogEg
X-Received: by 2002:a5d:64c2:0:b0:486:e596:1253 with SMTP id ffacd0b85a97d-48702b876bdmr7254338f8f.3.1789458583507;
        Tue, 15 Sep 2026 00:49:43 -0700 (PDT)
Received: from spartian.home ([2a01:cb1c:76:ed00:602f:c5f4:d108:b925])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bd1esm32565257f8f.31.2026.09.15.00.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:49:42 -0700 (PDT)
From: Aurelien DESBRIERES <aurelien@hackers.camp>
To: antonin.godard@bootlin.com
Cc: openembedded-core@lists.openembedded.org,
	aurelien.desbrieres@gmail.com
Subject: Re: [OE-core] [PATCH v2] flex: backport the upstream malloc prototype fix
Date: Tue, 15 Sep 2026 09:49:41 +0200
Message-ID: <20260915074941.992096-1-aurelien@hackers.camp>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <DLFPV7E70LU9.32YF2D5IUTKH8@bootlin.com>
References: <20260914085318.67139-1-aurelien@hackers.camp> <DLFPV7E70LU9.32YF2D5IUTKH8@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 08:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245826

Thanks, you are right -- 98f2376d82 carries the same upstream commit and
I was working from walnascar. Please drop this one.

Aurelien

