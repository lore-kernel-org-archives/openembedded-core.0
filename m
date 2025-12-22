Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD604E6ADFE
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:45:18 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88339.1766436308613221378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N1PvKe1O;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b736d883ac4so777581766b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766436307; x=1767041107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6F4HnE9WSt/1/Eq88tgQaZma7EyoObyMFgAVBd9j1xA=;
        b=N1PvKe1OkvQQzY1aOJkJT979CTpNyQJDqKvIqvhIv1Qaiup+f6MSFpC1YX4oA7UWQH
         or/hmuQy7TtkKJGdezHKQ0hdFDE78kA7n7yFdAkSXDonHQtVeXR4lpnnoT9Tn21/M0ar
         L8Vf5ymUuPkyDDDXWHa6m5CMRofUiiecG+AxxI8Srt4v0C+7jZj/cghY4rzWwCmWJQZb
         ZImAKuPxzkT9CsVOWO47G9+lyg0qcBKh52/NBfb/cYmPtkWGVV4ZIFXFL3mNe7WDPSd6
         NBY8fs2S09uBziGxZ9loHd2vu13+3w2wPjcbzTY5YnsNk1rKPJt238C4jQjW4d4FCzTC
         vlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766436307; x=1767041107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6F4HnE9WSt/1/Eq88tgQaZma7EyoObyMFgAVBd9j1xA=;
        b=ELrdlX+vv33N4s8bCKnJCcGod7qIaSaRrcc4DNamUX/i6L8kGh50Mc6xyX6LWu1qLy
         Hljm27WIpOb4sybyRR5g38Or8YjMPw9e6Wfamn78NajdLITQOjFbE1v+B0IR4yaFBTTz
         BqPeS+wjNCQzgaFjQjKrpWtEz1pW0WFnGF9gJW92PnMhp7117zeul/4I0XMCoenCnonP
         2DbHFk0gJxWT9TPHKCQI0If2PPHsp8mh1f9xufT2vxR/zTWBJBflw5WSQlFGt1BiDNdN
         QW9eWocnjq93o7yDup9JOjwThjvTyoWVKfL7UIPuAW42WBU4cg3hLxIKle26EFjfKkIP
         SSfg==
X-Gm-Message-State: AOJu0YydJVO36oxb0CouEWbG726byP2mCZ30aK/LapeApnhqJnvIrGvp
	jCYDrfy+YwmxAWTeSrPKLUeGVIrQhbO6YdCqOg2Rdkf5otvbMMpyjf322AVNaw==
X-Gm-Gg: AY/fxX4aSqKKcX2366k8RGukkEuS5K2iY2XCQqJpQ1OXeOT/vlkJ6oW2yPDInMd7aC9
	ZsxCHZ7MeKlNN9HLWKpEs9NBA5jE104JbbBRi3WWaI6JMB/54hEaYf7Nf9d0siE2kURCTW6mjBy
	GQI7MKxteVnV+X5tPAQyVN4LIRxDP/L7LFDl8kaWSrcnWQS4p8fKeStv35p8Npnuk+uGP4zwhon
	2FH3Mo2JZGXBgeEv/PwMrLoKy8y3gzubsvlxGaj4s6IPaEzRgEDNh+h+hA6S5pEa4p0Bt5yOskH
	3BFdOuZKc4isKp+T7CUvFqU2JoXoajLCtFkUDyjoIyOCafzLiStsQdNO1kjoG3V+xomgO75QDnC
	WScv4Vd4NLJ9eqmJ1SUK19eA3suSUeo3kSpRahsGJ+dMzDfLfnUoM17BcRJ+f3C2T14g5g5rP54
	RbM4+A+4ni8HYL8QPzuQw39YMMkcVlNKd3jBb+VhcojZzkpnyak9gJnW1zWw==
X-Google-Smtp-Source: AGHT+IEeVN8AoJSa/+QCc24dqG78bvNJPatIwk1yX3f30yv1kuM10uhpsD9Qy0OL3VNuUfObz3tYcQ==
X-Received: by 2002:a17:907:3fa8:b0:b80:2315:b2f7 with SMTP id a640c23a62f3a-b803717908bmr1316150766b.41.1766436306925;
        Mon, 22 Dec 2025 12:45:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1189860066b.60.2025.12.22.12.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:45:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/15] xkeyboard-config: upgrade 2.45 -> 2.46
Date: Mon, 22 Dec 2025 21:44:31 +0100
Message-ID: <20251222204455.2284529-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222204455.2284529-1-alex.kanavin@gmail.com>
References: <20251222204455.2284529-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228438

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{xkeyboard-config_2.45.bb => xkeyboard-config_2.46.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.45.bb => xkeyboard-config_2.46.bb} (91%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb
similarity index 91%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb
index 5153b76d98..cfefa53a0f 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=faa756e04053029ddc602caf99e5ef1d"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "169e075a92d957a57787c199e84e359df2931b7196c1c5b4a3d576ee6235a87c"
+SRC_URI[sha256sum] = "10c58218fb60d08fb1f7b30304deb3ba47613195aa8a08a81f1972775ccc3640"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.47.3


