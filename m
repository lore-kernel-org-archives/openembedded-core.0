Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4B0D116F6
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 06:19:27 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10206.1764310763256958560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 22:19:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EYRbuM86;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297d4a56f97so21672945ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 22:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764310762; x=1764915562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dx4Ght9JhpfGjz3LDyBVGJ2AGPZ0tDv0GxllWDNnO+E=;
        b=EYRbuM86A6e5Q5n6VYpFIOqfEvH/rvgFIMO0yvw97Zslv5XCabtyZDV73PwK2QC9m+
         GqG3lkJzBueunulfn96M2qFojU6j3U/abC3+iMiiWv4gT+id73iRfUWZvsBvgJXWj/wU
         kgVv6pRY01pBmZaDdVRO/8kEP3ehknutmMxo+78CS9EEMTEAwzyWsOYDeOm5sYFhWzX8
         SGdzQfVOGgCQGTJv/rJ9MViUCrtYjfj078+9PrVdK5cZ2/3yxzYIdnIVv1JQEBNn7C2c
         gMXIoAIO8TecnawX5ejjkJlKcWI5kFF8l/gGhpnwuX5knoxspnrhoElhJf8VkNenfVN4
         GjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310762; x=1764915562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dx4Ght9JhpfGjz3LDyBVGJ2AGPZ0tDv0GxllWDNnO+E=;
        b=JVfDIJJtkQjhwGfynX14T0zl+dRKlIx65GOgj9wYzn8fWVZku4tfSbX4W58h2yG8HP
         sMa+Uyxbx7A7xWFAzD3H1cL2q9q1MOGDdQPQnIkv4IVy+AqU18T2AzebsYhQIfuy6cgL
         0HwdbErMQyBNjyjH27lKAx31pxaSR3n8MU7Q78lffvZWVjP0gx8LWWRiq1MzKKS6M0WA
         8JGOQngPGwC6jDo/h/78zU8yOhbec48R4Q2zfJicibqnlG82givXwFi3ZQaiRAELuERk
         zaetlHv8K8Xpfjy9NTw22/y9xvSM+bwlY/y/KtHtDz8DDDIsTh6N8ZUjJ2JIqhHAZgmv
         6ZDA==
X-Gm-Message-State: AOJu0Ywontu9Uxuk/qdCJL/JkMb/4IuYn7Ypj3qihkEp4b9W7GA9s4pD
	KWV5PC/HFtCbrRy1H8WkNWgaEF5NKugcFwuKVupjQqOQdfAKN9c7kvYRmZOafw==
X-Gm-Gg: ASbGnctGdpubkf6cwXs/euVLwmF6HtkQlIqOQabhIm0SWq/uqkYzDs+N689wOL3ZcpT
	3gBqjjxaJ0PUD1rUs6Onnn8jVYdMYfDE2Mtozam7Xe3GQuYGrPUmrQzM/Sl6kXw41JSOJHN2rkj
	qsmKswB6BEsrBgv6ucqL/yVXA7vtzgj55uPLbeP/+xQd4w2JVvscphjZdVKo7ZhB8Dts0daptAn
	YjEfzYNaoBrPq6H1zMkj8ouiy/5WDiVioZeLIIQJVC6ooyVleeywq65j8Gd5cfasT389iDq00s/
	mN0yrgpc1Yc6b8O/YAd07m05J9JKutfNbNs1PXmeZNQU8f5bvs6nj1U4vUounmuJ3dgyldLwAzM
	XvPslC/D9LudXFTTGuJrnjn85+tzIopaHUKod/FIQy1HKaboHmolik8uH4oBVDqPDp6/tXwk8Fg
	cLnbQm1ZswbPQ/0DDkqKaeyzAO
X-Google-Smtp-Source: AGHT+IG0qH0ilLXXpbTBpal4XH4ufk8GSjQ3S6vJxVqU3LC+yTG/Rzl6lOqyIIZKDSxcEeHyPK0z4g==
X-Received: by 2002:a17:902:dac6:b0:297:e1f5:191b with SMTP id d9443c01a7336-29b6c3c5cc6mr285309465ad.11.1764310762457;
        Thu, 27 Nov 2025 22:19:22 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40a60asm35427335ad.19.2025.11.27.22.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:19:22 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 14/14] libproxy: upgrade 0.5.10 -> 0.5.11
Date: Fri, 28 Nov 2025 19:18:51 +1300
Message-ID: <20251128061851.1634479-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
References: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226897

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/libproxy/libproxy/compare/0.5.10...0.5.11

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libproxy/{libproxy_0.5.10.bb => libproxy_0.5.11.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.10.bb => libproxy_0.5.11.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.10.bb b/meta/recipes-support/libproxy/libproxy_0.5.11.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.10.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.11.bb
index 21930ada00..1efa3cdc0e 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.10.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.11.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=${PV}"
-SRCREV = "7e4852f9658084c61a95973b8a1d720b1763437a"
+SRCREV = "3fd3a6e845c0386d91abc742453d0f29bf28c404"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
 GIDOCGEN_MESON_OPTION = 'docs'

