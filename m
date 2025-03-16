Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23968C35FFA
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:13:13 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.31821.1742141587291108179
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KxwgN4hj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so3057495e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141584; x=1742746384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1dHmLhW170obQ8zhQ9R4htiCl3Q3s02LdG3CM+gXlw=;
        b=KxwgN4hjGPvxgQkt3cMjJTs1kuzGyDL3nIT4UjEEOmJWM7LGB7ziiv6NCxHQBXMYg0
         OqgIuPyOXY3yFid5p3aLZbIADh8023WBqo+6oh157+eoNH+nI5YWLVt+mB+xe1kBebpR
         F7af0QsxvMHeTulvmE5qgOM5l3B7DyDdfQjSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141584; x=1742746384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1dHmLhW170obQ8zhQ9R4htiCl3Q3s02LdG3CM+gXlw=;
        b=M+TUZ/lJAte/b7brti7cy5iRWwRDEVR9QP9XFmhpF6ilYw34K7kdrXkDbwsrsaycbR
         qzaAeqS4EDqUrouFs0Sm4FTbsyZK94I78rnk4Fm/45a49sc2plZjMEhdMN4ehMlIA0Ah
         yL4BJDExK/PK5fx9QRVDe+QbiurJOBn4eksKzyGtpT+ZLtqzal0fvzR8oNYjVgmsZwZG
         ZHLSLe1l1VNQzYl3PKpo1dP/Q7Y02hR1PPOON2Php+5ELnt9g2ddCwKLHX7077VTw0uD
         T6XgoeJMyTGeqPhpWpUIz61xe9trPfH2xzI2HL5y3rGkZ/9XMUq7ZWecAdjTay3OeGcU
         fPow==
X-Gm-Message-State: AOJu0Yw73XdJYktP6yCXYylDQe4BqFFu5zGzrP7Q9rRhjPxrVvrtHkE+
	2fnSbY4Oth+ccwVhbCgysFqNBZ3xbGW2cjJ61+oETTStGKSqRGJDjdswfkfAsSIyVBXojwxeiLL
	K
X-Gm-Gg: ASbGncsJfBBmSLk3S99c4zBeF7rjsT18Z0NbG2GUK5+B2fWoVZoOMiynGgczenh6P0J
	LSZen7rL4XJZ+pjolCzWsNTNGAiXuaGQg1glA7hu+BBFWzjvEPLa8uCuIR6BmTD1+ISffiFQ7xu
	fdzTNYn/dUJxm5HHs2j4F5ML04B0zz+5gvHUJNyt40X+/w8FDAwYlD+52n6YXqXI9rLIK7FidUp
	Et64J+M07EpfrtBm3U4tcgm2i6thsG06EUtR3BSncR+0lVDKyJCwSokj7VueN5gaiavYkgzzdp3
	Rmz/BiJiigBssPfg8SJL3FPJWZ4YxTz//XGRQrQvmDjIS+GCDSJ6Dx8URIONW6QdD1uEaoNFRA=
	=
X-Google-Smtp-Source: AGHT+IFxG8yZfnekfcjp1VTyF3gH0el2kChzuRwAYD+nPgzAtEGn+MqtInJtbqegFY3mdzulnj8LLg==
X-Received: by 2002:a05:600c:3515:b0:43c:f5e4:895e with SMTP id 5b1f17b1804b1-43d1ec622ccmr71828405e9.1.1742141584587;
        Sun, 16 Mar 2025 09:13:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.13.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:13:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 37/43] xauth: upgrade 1.1.3 -> 1.1.4
Date: Sun, 16 Mar 2025 16:12:03 +0000
Message-ID: <20250316161209.3629986-37-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213040

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-app/{xauth_1.1.3.bb => xauth_1.1.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xauth_1.1.3.bb => xauth_1.1.4.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-app/xauth_1.1.3.bb b/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-app/xauth_1.1.3.bb
rename to meta/recipes-graphics/xorg-app/xauth_1.1.4.bb
index b0ca33bf4b8..919457bca65 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb
@@ -9,7 +9,7 @@ DEPENDS += "libxau libxext libxmu"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "e7075498bae332f917f01d660f9b940c0752b2556a8da61ccb62a44d0ffe9d33"
+SRC_URI[sha256sum] = "e9318141464ad7b4dc0f8564a580f0d20f977c85a388cc40d5a766206151c690"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"

