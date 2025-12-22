Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CAE6E6917D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:15 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87792.1766434093075615919
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WsrbkKIW;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7636c96b9aso749309166b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434091; x=1767038891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loFYZTlH6SsK5vi3OP05n4MmrbRH6yVpQ1wY526et6o=;
        b=WsrbkKIWRMTUyz2Oj/Y7/M4BlzvCyIIhqBNRxiQXNXxzFFEX+Kc/75Fp3EghQLm5lx
         68GD4gziip8LPBKPftbqf9Z+pNp2QmmYUZdZianS1qslOJxEGipZfcC9VridVe3GCtS6
         jokbYLvKRihNBV28e+Xj4yJLg70Sc32Z1uBmXD5HEJ4qoTdvPmfPvUR31hKdwPhleHGT
         azZBPXREBbwQfUS0VkO3Uefdv2uf3aODToSmPY3oTRUVjXeVHdLwc4XYJxasjZsVrnXh
         SbfVOLpwX9KkLiY/sQOe38b0S5EqDyDya45LK6Wh/82ilqlY7TzMoCTQyRl48bROp06i
         dc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434091; x=1767038891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=loFYZTlH6SsK5vi3OP05n4MmrbRH6yVpQ1wY526et6o=;
        b=oPPmQzI2dUVGd6nRkyskkr02QljWh8m3JUT4ttzSY4DKRMDP066CNItr2bgB+ReQC6
         JCQOCkiM35+rjqaR/hz8DMwMQvrlCf88E0/rxnqSm151Zj6WBYYMEKYRHhfSFwpjuZkj
         XTC3mb9pkFVKqGEcIU8R4U9vARdmAmK6jBjSTG/Hu4Wh06g1Dm0o0DddO2GfebBzlqZP
         9WAta3ZbB7ZLDeU3zzwSfi2xbBGYfRIGnWxn94Nlw1fs+AAoH5tLbLM4sALSx/LN7lhB
         nk2Nb4R5Lpb2pTjMLWlWSp2iIdyez7Cq79T4LYCPRk4x1KAJuUNKJwfafXyWV/uV0ZdH
         LZgg==
X-Gm-Message-State: AOJu0YwlljxZM8+shSjcxpIOo/QWnpvZZVIBjVGVVRrqPEh5lEtD+Rwp
	SDfKLCGu4E+0iDE6sGvubVoQnJmfQ75z3h/CcS05aMfJ+iQslO++2jnCa+Aq5g==
X-Gm-Gg: AY/fxX7Fyn65oRZXyfc2HwYWpwwAyqfUNDqFD3DC3CBN24LUtmIXYExsiz5eQ3PfHoE
	zq4H0AVC86medOf6GyzEkBtELLnztbPCRz8r0vmEKGXplr0l+nqktODRAi/hDfzuFPZCefYp0ZH
	m9GsHaz5rzkJqpZ3++ujwzHclqlLQ9KdbdVf616K9qY/2GAZWOfKoDSdqxd3cC0hGf83Cysr7wa
	M8n07OJdgY0xiigcTdhUOsZ92ogIlzt5GFV9Aiyx6vMzxsS5JsnX8wkctrdMVliSvqTUHtKRGxf
	va8c0lSZ/pBUTSlSXlU9sJhsbrj1qDWcomCJ86CqkmI+mOApfLnkyv9I/a25rU3eNee8Q45qYz1
	8yIu5yP004UZI3+iBa8YSMx8Sf016Mg2U37Tpub3gWPRCmsYVECOJWITLWR9vNJW+Mfws8v4lsG
	bLFwsjqrhyikuXewcKfrrC1Chlg9pJQfcWB7BUB10yfL8MQ5Hgm0wsEF5W+A==
X-Google-Smtp-Source: AGHT+IHgVpwr+885uHNRcD1ZbNfqLDmJVZ9ASHMsoYkMFU2HYaH0TedxXnymlsiTvvLdLg+UjrImlQ==
X-Received: by 2002:a17:907:980f:b0:b73:8b79:a322 with SMTP id a640c23a62f3a-b8036f1222emr1338833566b.11.1766434091267;
        Mon, 22 Dec 2025 12:08:11 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 036/114] libpng: upgrade 1.6.52 -> 1.6.53
Date: Mon, 22 Dec 2025 21:06:18 +0100
Message-ID: <20251222200739.2278706-36-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228361

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libpng/{libpng_1.6.52.bb => libpng_1.6.53.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.52.bb => libpng_1.6.53.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.52.bb b/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.52.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.53.bb
index fba6e77b1c..956cd243b1 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.52.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "36bd726228ec93a3b6c22fdb49e94a67b16f2fe9b39b78b7cb65772966661ccc"
+SRC_URI[sha256sum] = "1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.47.3


