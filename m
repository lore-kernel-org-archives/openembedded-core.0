Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D0EC3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:12:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.2187.1743577943965106790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RwJwenqQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso69133675e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577942; x=1744182742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j00Ta7YEc6dcJjTnlaexgFB/Nwlfgk70KWWYdXzjGN0=;
        b=RwJwenqQJfMa465/FBC23M7Gr1dib45u7Bw71wQGNehBBEB4MY0wfKYSBzvUOBsDl8
         aw/96gII1MfLRtZoUjeW8858WIaR4eY+NpsYtHujspiT4fkXpLc5rIP6GTEM5Q3ReAZn
         uWVNKrZi016JMfkVcBwJSjdi7+f2/ldopyJEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577942; x=1744182742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j00Ta7YEc6dcJjTnlaexgFB/Nwlfgk70KWWYdXzjGN0=;
        b=ZbLy/cQMhDr+ZmvP11PKPetCqL12nLS5+bk9IpQRd/GnORjI+lkFjFY+6JUFr2tiNa
         Fqih41Fo62sYSKWaO72yPnxKAcKZjAK16Izkefz99pRYHNGfznRkKpz6teWimuXnROg4
         KKdlq8P0q93xtSB1YA6vuL8u6VXWVfrOOTo67Jo8jBZsHrGzlTFk45nn8qhz0eJL7Cho
         3tLAboJBWOsnQbVoCaBas1j2WvgFk555WPkglDdvaYKnU09tught4iJdO5RzUwGZ7s01
         mDkHCGl9BOsJ2otklsgFoVy/XyDP6OxPWYA7jJjitD42D7OZEq0dqzl8KONoLxMa6so4
         fenQ==
X-Gm-Message-State: AOJu0YwxoNowZ0plB7PRMTcr/0J2yFgpsJoCMS1dldjCyQ5d9oQJVyXI
	96NVSYFZsEOevsvGHWuUubqZXo0/6bbYwhHaqaS5ga6KGMx4h/NP9iTWaenrdsWgr7PVT+3JkU1
	+
X-Gm-Gg: ASbGnctOI1ArjJRM4eG91RJ004GP+dUktMPcynpJ8XrTUOLkOWlLwLGbCZZ1asP04N9
	QrziFzHwWZdbZIxwg52U6TnCk2hvXxM/sDyai0TTOUA9IFJga4BzzqMXtzqAXCB6SLqfWofYXfq
	dF6m8phSe/+kTKWmfRDbn3KJvLV6XFt6i211QxD9NAgM0NRFEajMfS7bYToBW9xWAsRiySkEZCA
	x1v4iFVssEdZm1gx0aOafrH8Ud/rgzktCKtHIC1kcOL+5XHOre3l6x1Z4SmqZiJRiDd35aUe9pW
	2e3KgFtwjlKKX5GlknxduOfMqnNNW96/+gU/SEsJwC23zcUrRhxzLQmU7vjT+7uffBB3Uu6VUw=
	=
X-Google-Smtp-Source: AGHT+IEsRxu5cAocqIdzXWMSziSOlb+Gp5BUo2L2UFeATC3p+mlTJj4cRbn+yzgLSWUhNWg002U5Kg==
X-Received: by 2002:a05:600c:4f03:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-43eb5c2bee4mr10645955e9.18.1743577941854;
        Wed, 02 Apr 2025 00:12:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.12.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:12:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 48/48] wayland-protocols: upgrade 1.41 -> 1.42
Date: Wed,  2 Apr 2025 08:10:17 +0100
Message-ID: <20250402071017.2157620-48-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214221

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{wayland-protocols_1.41.bb => wayland-protocols_1.42.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.41.bb => wayland-protocols_1.42.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.41.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.42.bb
index e8ab9d84fce..7cbb650cda9 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2786b6b1b79965e313f2c289c12075b9ed700d41844810c51afda10ee329576b"
+SRC_URI[sha256sum] = "23ba80d410d1200a86fe29592c19766eae8f1c350b67289999e9e7ea12d9f7aa"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"

