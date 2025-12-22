Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0154E6ADCB
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:26 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87682.1766434097934342939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WOmNY8cd;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7ffa421f1bso932210766b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434096; x=1767038896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltgcp9gUPNz0YXCgkJMwJQqWHilMxTbSkslr02talGI=;
        b=WOmNY8cdwyzf1gx7D3r/tPOB/WlqBueEelNjox/jCXQJp+zniGrl/mTm3cCHOtPUPm
         65NiiIRUyojIgWceIUYuuhJMSZ9qE/eBHR1z1gtqF4uLCfzJ7COp2UdXrcl5+6lhc5D7
         EzTjdJSDj0JOkmHVG9jiZKgEnMNyatMvC/j6M4X64KztOg5RI3g1GWYY5ftI+b81nzY2
         6zUxHtzRTDwoXdoifSdjBMOeQIBgTjrgKIq6udDg0gz9WFDWDwTod7I7nZPTenR8r+6h
         70j8u5OwosVv2/WZrbM63prGUq0L2dmWOA78mfRBpAo7CqUSzRhCWOC+K943uJYwjo2/
         2qaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434096; x=1767038896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ltgcp9gUPNz0YXCgkJMwJQqWHilMxTbSkslr02talGI=;
        b=cQdaiAYVY0OmbJ1WO4Q5V8C20L8/TAtb8/6tqkiEJ9B9lYUt5nNoYHMxZsDhTHyKfz
         z0RSKnfs6VaMTmhHRV2z6dR9BBF6+7CYBhkYYZ5NHtGiTLS8j0u46FCl+23EvE6YEfVu
         w2aUzu4jWyQoYhuJ8Lwzp6iJEQbOTWVDHVt0C2D1oiI8+KqGcNNoojK6ZKHMkJc6Y+D9
         qhjgsBNXQLlH/fJvJDVNzghJ/YBMaiY5V1XhMs1F8cYhUJfd+cf9hbXtsTNFU7Jq4s3i
         7BFvM/J+Okk6ji+XH/tXD8POqTFVOrKC7G5PuIYcRNMAiyL7bVsO9VM4LWn8fKYMBdZc
         tYMA==
X-Gm-Message-State: AOJu0YzI7DnTlqpyuX5y2Du3L9BsE3i9+qMjm6qGfKVMhtLnBy5eeaYY
	i1wMdwUKYUROhbb6wcoJvJ/grRk4N7Nv6FoVvk0bb2NeoEhFVL14d2dpNwTBww==
X-Gm-Gg: AY/fxX4rcXn5wIUJE9nt9BDzjvgApBijTamZNEJbRERXVUyVd7kyN/n2zl4pp4hKdWe
	D5JiyAp8Sw11QWWfs8Cf5B0gQiIpOv1xN/I/FmdKS6dSt7ks3tm4pff/uUlfLeXk3dQrsaDLstc
	zhXs38ZGzESjWEp35LBCLfwudXIrhzhFymmR5FBurvX80EyMmzyByPfEaFZZeQloYhE998tN9j9
	BkrAb4hbvM3RGryjlqY7zcQ99aLRLgoZ5nL3ECgyvUepirAUCQlHluVn3YwI4yJbb84feWH4cjN
	oki7RaDm3M9umajVKlR3QosyGt3yMkrDzJOB8HgXeEW80jqdZbBIk4NkfCYv3WkYudNGdNbn+/3
	E7gMAC04Zxwj1q/n5kNFGSA1FPddK6YHcj76faMTN/x9ksEt+aA9oIlPQRKEg/cE3h8zSgy0ZQb
	sqPfR/fCNsL9Q1rlDM4E7tkhQR5vnY+bNmie4iYATlWgWj5tk=
X-Google-Smtp-Source: AGHT+IHqPIqKVMqZdoUCjSnKFgnd8vRVnM0zkctiqNVtiayWJxyG5f8rroajXlLvwKOIseqUHJBlHw==
X-Received: by 2002:a17:907:96a2:b0:b76:afa4:933f with SMTP id a640c23a62f3a-b80205de9dcmr1507635866b.22.1766434096102;
        Mon, 22 Dec 2025 12:08:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 043/114] libxkbcommon: upgrade 1.11.0 -> 1.13.1
Date: Mon, 22 Dec 2025 21:06:25 +0100
Message-ID: <20251222200739.2278706-43-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228368

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{libxkbcommon_1.11.0.bb => libxkbcommon_1.13.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.11.0.bb => libxkbcommon_1.13.1.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb
index c953058275..42e6458090 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb
@@ -7,9 +7,9 @@ LICENSE = "MIT & MIT-open-group & HPND & HPND-sell-variant & X11"
 
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master;tag=xkbcommon-${PV}"
+SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=releases/v1.13;tag=xkbcommon-${PV}"
 
-SRCREV = "0f9cefb1fedb23433666fa5d9045e48ff030c006"
+SRCREV = "6f76d19db72b5d450e927b41e1e96cbe3252aba8"
 
 inherit meson pkgconfig bash-completion
 
-- 
2.47.3


