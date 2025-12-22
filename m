Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902F2E6B244
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:45:08 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88512.1766436304454264578
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ns07O7wF;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b79ea617f55so776568266b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766436303; x=1767041103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6wLz6dCmo57G8skRWEO9/OMKsyKzqOUQ09YHaK0qt0=;
        b=Ns07O7wFIPFgiPqD+iNXd8HNVx+s9tL3+ofPZHaLy80l5b4I9JHV+uGm0UbDq8eIg1
         yMB0n09q5y91tkA9oBkSzzvZZwrGif51RA/O1bLcUQvLXSHoK1mXR7eA3wLSFVb7qHZj
         emHHK1vOZH6UX6P5FqS82cvaLCkIlMFSJ6GCA9lDILaiEq908lIa3Lypw63BJYhtbgnW
         RrGIclFNT480YHLLB5/Fv+V8fNZ7gbP+jrcxukmH/nXNpScwtfGXaRnd0+ymVtJzxNA1
         bvAmvUERNKlGC0LAOTy2xg8uEV37taIT/vqQkg1K/7muL9AaOWmikdd6i34+qyko3u+0
         YiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766436303; x=1767041103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G6wLz6dCmo57G8skRWEO9/OMKsyKzqOUQ09YHaK0qt0=;
        b=op2uZadm4t0Qr+zQhN8tHv1BJ6hjgvFftnWSQEjWL9/9sauPtAuaVkpVVsYIriqkYn
         d8t9j3FJRpVuQ862OZWF7Q3XVzuss2LWDJwYMfbapFlycwiNVaC0Xm3G//K4pBG67ujl
         TySO9JWadVo9iBtgnDnzB8EyjN5k/jeKGWr4gXBnIXHI5ugvSSILTDZgyBUKtVZpBKBM
         yJ8MrwVgDPe1QV1FdUYiLY81k9O2cBCGHvN7QHjmXTpj8SWGlz36xZBZ+sAkwPeq3PFW
         v09bcJkzgfXX/QdrUEH6/OoQ+An29jp0OloZ4C91TYb2MmcwfqJ9b1H+KuzadLH2gbL0
         AyJg==
X-Gm-Message-State: AOJu0YwIMZQ0w+DOEDclBx0OEj4HHUGvDoXhSY/DAw4+QcSiWHgz/glX
	Vr9QeKxK/5NgeVYolp+egrfEMC4oaGzyZ4Lfq34Uv20JSSH9AK8LDICn3IfGCA==
X-Gm-Gg: AY/fxX4jgEk4cxRTz6bJh6rBkyOhsmr1y8k9rLDcbP3DOVUV9S1S33ASOcNJh8at3C9
	m+1ejAdPBnzKcCW326M71WH5/B5G/YenNvWjAGdXEK5XoOZChgw4fKF7sZlkKE2phsjSw1GtBL6
	JkVhtkrgVhGoaQxHp6SO7iCjxQOfIN5Dp8Uggw6sX0itJ/mU+jdQD6CSRV/OQ6f6QU3ALenSeFi
	jbSsxM1N6xZ/MBrZqBO//WunqOZ1/f2lBDj/NrtRWK4KImtbLLXblm5bF8QV0bD2x/X2DCtOXjk
	a/Z1kzLF+EHn7L/GY8eUUlmRWpSHJkFWxu084BZM9oDt5EVuFYtH+Y6JndEE9AY7Qkp5zrygiun
	8nfE++5nRSOsanfbtBaMGh4sS8zT6iTDPZzljets4Wd1i75joPwv2V4Jukq6ozSWCFk8qeFV5SH
	WbZ9t9lbQhD2DVX+C3jCzuknKE/Y7aZPbdh2MgcnOdUF4bktXYbsB2PLKY3Q==
X-Google-Smtp-Source: AGHT+IH9hej1LG86wEVfQENjYFNvRedHFS4fJrS2l3h2t5i6T4tlFMrgZDIFhQWtEQKLmywI5qD47A==
X-Received: by 2002:a17:907:ca05:b0:b80:3fb3:bea0 with SMTP id a640c23a62f3a-b803fb3cademr946136366b.56.1766436302677;
        Mon, 22 Dec 2025 12:45:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1189860066b.60.2025.12.22.12.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:45:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/15] wayland-protocols: upgrade 1.45 -> 1.47
Date: Mon, 22 Dec 2025 21:44:25 +0100
Message-ID: <20251222204455.2284529-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222204455.2284529-1-alex.kanavin@gmail.com>
References: <20251222204455.2284529-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228432

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{wayland-protocols_1.45.bb => wayland-protocols_1.47.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.45.bb => wayland-protocols_1.47.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.47.bb
index d98ccf964f..e19045fed0 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4d2b2a9e3e099d017dc8107bf1c334d27bb87d9e4aff19a0c8d856d17cd41ef0"
+SRC_URI[sha256sum] = "5fd4349bcbc9bab9a46f8cf77d1f434296a7a052c87440a094f63fcf62a58e20"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.47.3


