Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504D6C44525
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 13:25:31 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6027.1784381123686523547
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 06:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eVkp8Fz8;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: adam.blank.g@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4955158f26aso2820285e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 06:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784381122; x=1784985922; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWWRky8xS21EcHIdPyBDD4ayORp1Jq2kFZks/EHU16o=;
        b=eVkp8Fz82grBoU8P8wHVJ/L9PtIj5iWOr3F0c2lN/NAmha1100XasWT8IMOxZQptPd
         UI8LkjRZHv31mstuDwPek5r17uxkchPiBHcglkLzpj3jzNcCsCUJ84oE8NwBPH8cMI2E
         9zAOGek+R/hF/fBQ6ku59r0XoPmZgx5BS2IMTpaYrfGD6QRt0+MKTVge8bzsBwjmXY7g
         J18X7ak0Qt5rW9l9H8HtYCTVn95cVPD8wwdN6efeQePgyAutaoHc5OkujLVTp7BHPSqC
         rX9sxTkeldkDUK5tbWB/qQNAEn3S4vYZxjGx5umuDkNkP5ikB33TFVUz9koMtGj1Y7yQ
         MsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784381122; x=1784985922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWWRky8xS21EcHIdPyBDD4ayORp1Jq2kFZks/EHU16o=;
        b=FnZjnPD+UOhccX8qcwmyEMA0lwybRc2cGr6siTmaBq1m2kXW9Vf3IF6X0qzdfrFNE2
         M7Lrw52fn/viVgiCQM1dUnk5uwmHKFHH10t13p6cM6KYY7AGuoziwispQjeQb4l8XRD3
         KHq08djsd9s0kx3ggm1uRx+mXj4w9v3/9wjE+WL16iX6kq+9+dNBf3BZxC6AxE2dh+R7
         Urf9uyktozSVLDRHfWl2yKxszTQEsuJTgWymD7oNPFm+3Y55CJwG3293cG+e1alUClkW
         8P9AWHP1Im/EAAPubNui/TbzsDb4W1YT0HjIMHmEj3jNw+2aUvFzD9saWa6LJrSDwTYL
         7Cwg==
X-Gm-Message-State: AOJu0Yx8cHrlSaMCYIK+NDAgPoUOqvx9ZkQYpbNk+vzwGzSTaoeZIczP
	THOZfUlpOpXAO3LKdJT031R9agBoMy3UrcIwLeI9VTowIQgo6R70k7UEnIc+3Q==
X-Gm-Gg: AfdE7ckWy9sTJTcoiwzfFme83MffATpXk7WyxPefRyQiarRX12eaRfRYMSzS5FezsVW
	nJusTojgtWrFh0WNllpOvSKO3hgvRT0AJO2Wv0lvz5CghjHDbBLm5mo95uE4KBubnns+ojDQhge
	HinPXBm+QyqzbLiSdXrF/zvp64glTnKRiC8XMjeqVY2Ki1dhvZqxJvBhJHuSOtypwK1yu5nSB1Z
	LvSs4TjsBLZ/HYWKPjwBZfvMyH7/Ri6nztEHgreoaNI8cyXUqLzufCK0Xy2o3C+o9oKdCpNkrKy
	JuQDsjNjvbc4J1BqC8mZZxvhl7ZYfJkbakEtQh6kc7CkcJVjUnhvHZmpsjusPBXAfD3bR4Bxw7y
	o6GVz6XrZY56oHRrUlkOxOjwOlfVnB0/LOoJmKdxuhfu9MldGkzBiWywq4MERtza7e3d9/i5UA2
	puDUt7IlaT
X-Received: by 2002:a05:600c:3b9c:b0:493:e57e:7aa5 with SMTP id 5b1f17b1804b1-4954dff444bmr57277225e9.22.1784381121860;
        Sat, 18 Jul 2026 06:25:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:689d:c0a3:3de0:7033])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2504sm136563175e9.2.2026.07.18.06.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:25:21 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 18 Jul 2026 15:25:11 +0200
Subject: [PATCH v2 5/6] gcc-runtime: add 'extend_recipe_sysroot' to
 'vardepsexclude'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-extend_recipe_sysroot-v2-5-b7cbf35d00ec@gmail.com>
References: <20260718-extend_recipe_sysroot-v2-0-b7cbf35d00ec@gmail.com>
In-Reply-To: <20260718-extend_recipe_sysroot-v2-0-b7cbf35d00ec@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784381116; l=1020;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=eV2QAmdooWby1o9D0bZuWzze1nOYBf/LgqpsI25UdXM=;
 b=+JcJErqKzcetKaSHhwBOeDqvQm7KyuRNnHjY4A4l2whYxvcrtjtrNI/vF+uPS+K3kffBp1q+9
 Rc3apQDBfOLAMg3185PUn+/zIKuUwJ3fhX6pUTdvSpMVscjGJSPdVrU
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 13:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241263

'do_check' did not declare this explicitly,
but made use of the fact, that 'extend_recipe_sysroot' is
ignored on the base hash level.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index e305180c64..15ae9c337f 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -309,6 +309,7 @@ do_check[depends] += "virtual/libc:do_populate_sysroot"
 do_check[depends] += "${@'qemu-native:do_populate_sysroot' if "user" in d.getVar('TOOLCHAIN_TEST_TARGET') else ''}"
 # extend the recipe sysroot to include the built libraries (for qemu usermode)
 do_check[prefuncs] += "extend_recipe_sysroot"
+do_check[vardepsexclude] += "extend_recipe_sysroot"
 do_check[prefuncs] += "check_prepare"
 do_check[dirs] = "${WORKDIR}/dejagnu ${B}"
 do_check[nostamp] = "1"

-- 
2.43.0


