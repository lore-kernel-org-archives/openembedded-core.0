Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66584E69179
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:15 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87677.1766434093635977073
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W1AVJhgN;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8018eba13cso550548366b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434092; x=1767038892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=raeMszdilhDMVqdllwOn7riXdBV7xWsuKp2zizfq/A0=;
        b=W1AVJhgNI/WWnf1oydnHgHELRLXov9n5R61fPyejsFXFA3AKi9K2WCkPb6V6icHGxj
         4FDBVb2/W4CTAusECMuic2aYy1OIqFehGBnBVYDGY0yIPxe+RvXAB8AsaIvPjCAbVzO1
         2FySQJEaeYHJ3QOgNQz4Pjl+LKl8FclkzqVECxVjrOzbBNewju0XHgyvU8jLoyCYlK7X
         V7t75sCZ14p76g9coJT44dGX9xswsFpE2kAE3KsIcTsnC9FjroCLFVG+UHXorWMQ8z0l
         zzGwHiq+V2wpZoRJhr6xPp3ZQdq5qix0ngpteyIH/eX+8m6VhhTu36lI8UQ0aT2L1aLN
         BRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434092; x=1767038892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=raeMszdilhDMVqdllwOn7riXdBV7xWsuKp2zizfq/A0=;
        b=BtYYIub19qiojhKRgHqABExrALZ5mXKhHDa9XWFcUG6Y88ZkMho6B83z7+G/KqIw8E
         NJGRJwB+JrdMmQ2KrF3IgONJeAQ9e+JjH8b6mcp6aNDML80UyZ4WoYBLd1gQehbzulcI
         pBXWab3mtRwAfeaKJwkw+qSaJOA7DygQiKmuReiHbi0mzid3fTMbisBeADWLuprbQNmd
         OOmECcrJXKAA2f8DawfTMK+MF1vZ7J4e/mBeDbuVy2X+ylKyhyPz/aJBE/vNr0ArAebn
         o6TS/niQcfRuB+iNKaAshGjvhUuF7uSwf3Hm3m4TEzJfPwf2AR9VHRu+Lq7kCbZ1MSnT
         0IBA==
X-Gm-Message-State: AOJu0Yym1yx5oum4+kuBpMfFNRaU0333G2jTOtgP9zJ14FPmUPr2x8Cy
	cFv+W/g7XgxfGpNAXaHhVJlizm79qJTAIgTScyrshbdITvWTwBrep5337ELjRA==
X-Gm-Gg: AY/fxX6lxzquw2LJ85Z+96SJCqKgd4ASpsa/42YPPbL9GGE0zOxhU2WyzbnXg98Z8iC
	3sDbZZpAf6HKtTw80RaZ9BgFEoZerkVgI2XEn/3NVnF6QZ5p7Pp2CnPPCABxz9UhSeYjrrQZzcS
	PB4zN3DVww80OS+F+Y229wd8koXSVjk5egzJa8QLqzbaeLF8YrD6ORzPRnjJZPGdkERSQuDgk7z
	5IJwmkz+T/rsbDPYtlszSiPYqlJRk0QIZhXFlO/B3Xtnvgs0K2FN4S+f+dRpAMpg6Cb0lW0L4du
	OKv5TD03onpD579C6Kx9zgdjgM/GbkfgeSqgmBUAyKCpNn6t2Cy+U/F2D9d7tiFJ3y33Udb2DlE
	tMjytyI1pQVQNH3J8Y03pQV9mperKUlBz2j22eCBqSLSWxzrmcyt9dIqTbBg7WjojqTOJGOH9Pv
	l8Ui0RKqep/uNg2ONe7EyhNsyS+ZXZVC/ou27fxgGUjCIwBBY=
X-Google-Smtp-Source: AGHT+IHITXcpcoIMCX6sn0/pf8/N4xc4yYRR6j/1DbGvKKZQVH/N8QCG97J3e1blY9DMNvKo0RdTuA==
X-Received: by 2002:a17:907:94ca:b0:b40:b54d:e687 with SMTP id a640c23a62f3a-b80371d1dd3mr1311526266b.47.1766434091944;
        Mon, 22 Dec 2025 12:08:11 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 037/114] libproxy: upgrade 0.5.11 -> 0.5.12
Date: Mon, 22 Dec 2025 21:06:19 +0100
Message-ID: <20251222200739.2278706-37-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228362

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libproxy/{libproxy_0.5.11.bb => libproxy_0.5.12.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.11.bb => libproxy_0.5.12.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.11.bb b/meta/recipes-support/libproxy/libproxy_0.5.12.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.11.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.12.bb
index 1efa3cdc0e..c3b3b6ef56 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.11.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.12.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=${PV}"
-SRCREV = "3fd3a6e845c0386d91abc742453d0f29bf28c404"
+SRCREV = "99da01926b1b1e303a4d2331bbd74bed424863e7"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
 GIDOCGEN_MESON_OPTION = 'docs'
-- 
2.47.3


