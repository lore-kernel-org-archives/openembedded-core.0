Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6634CE69185
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:05 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87776.1766434077139372327
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GH4b0fvl;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b73161849e1so925554766b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434075; x=1767038875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wy9u+Gi1RiBJyjCyiYoJmjtP3zOglCen8q8NyzSV21A=;
        b=GH4b0fvlr3QtmPU/7RPyMSfBROgtPqLoUtTHpIpAgdDlUnhkWXrKaz7IFU7E4X+ACi
         sGR66hcsgTxs8QxXwf8KA3757+L77W69onxAQ3zTOXMJ/kDwgDsLPUJcdzkDAV1VciMS
         rSqGN418zJxr7BOUKORLT/j2naISMMdaJp6+W/zLGeMvQmF7u7pi7HKxsYKMy3h8X1+D
         Hps0o2RLC35HhgArDxtbl0TkfaSfXsZMzbUs6/7DEiUhxEyn4Cp+I95XI6jB7eV39F79
         4ycN84JMNedlo00onfHnwacMss4OElOtt0k1CqCPrkctCXXD7yzJp84F+oQvcyq/g4V1
         U0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434075; x=1767038875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wy9u+Gi1RiBJyjCyiYoJmjtP3zOglCen8q8NyzSV21A=;
        b=fgXbngw9hcIBlrXLz7Hu5gYYPReoIOac57JEXJXodU3bgJjKhVv8Euwxh82gtY526d
         4roabvd7e3/CpZrg85TlZnVElIofK/rpuS8+7cHfN02k0K+pvb0mYM6dUM02OljXodtF
         wSf1id2o2GZQm7f/GlioixyxZGJxYIVNQanzg3FHYL/dPp501Rl/g0PKW/tIn7cYloDB
         0Royszpltt4XGz+GtcsUGlHWeswcLqkxuwJKsqd3hZFGi310wfLvxbxl4aJtCJHVFL1F
         hMB/dkgDugU1UiTuPgh9tyip8V5HcnaMr78TIWy4tsuUKaDP6ZBLpXZHWbieVeCkuRIu
         U3rg==
X-Gm-Message-State: AOJu0YxkOOxi1SZRAB+zKKh1BsfivKHzzB4nz5T9RlAYcBWv/QY1I67P
	LhvWrccT2+lKGoPDkjS7TOMnCpQqDSEJThYXcBD3F1LAKuCixWhpTqaAxJIw8Q==
X-Gm-Gg: AY/fxX4wQEYK7s0/H6oFJQwfZaFAnUqfRguZhLfpFXx7PP7QEsiEoNFcTep5SLaI42Z
	pufQVDIgjJ7aAUoBGA5kez/0WgKTYROmTE+wvHmICuHAJnnoZNeqMJ5xy2L0iDif1uOBboVNc5b
	NosGYCnoo6OqqZjC7+aHQVKgJAVlDqb2mo069IQ1oAsFCnogCyL54uSCXxJUHWR9RUKoNd+8ndI
	Ev5S4ayl6ufLVNZy+zTHjEVKMgzNjRhH1SYJTLSOgqL0ejdhQarSlUpb2DPjEjmTZjOKmG+mwL9
	qUAkr7sXVkP3ahJCzlNDI3J5NUrEHAvJIOX/NAmES3KpS41PeMw43DGfjIEbOZ6ZIvlMY1KkE01
	7HYcHRBsk41eEooCOZixgmbmnb7yZlUX7xB0zWwZwDTAqEBsBS40kPEDc9b383b4F2MDGSBRi2E
	6mKOyiF6prhzLn6m+234BrE67g7VHuGjNWZsOIGhbI40s4heg=
X-Google-Smtp-Source: AGHT+IE7SSTf84d6vuVsbXJdPFACNKvre7oBMY8p0HBe5N7o3LWWVsd5GgHg7/lJHm0+fS87DbCvuA==
X-Received: by 2002:a17:907:7f14:b0:b76:60ad:77f8 with SMTP id a640c23a62f3a-b803719d8c3mr1503349466b.48.1766434075300;
        Mon, 22 Dec 2025 12:07:55 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 015/114] gnupg: upgrade 2.5.11 -> 2.5.14
Date: Mon, 22 Dec 2025 21:05:57 +0100
Message-ID: <20251222200739.2278706-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228340

From: Alexander Kanavin <alex@linutronix.de>

Release announcement:
https://lists.gnupg.org/pipermail/gnupg-announce/2025q4/000499.html

Note that we ended up on the in-development 2.5.x series by mistake;
in this situation it is best to keep moving forward with upstream
as newest releases presumably will have less issues, and become more
stable over time, and the delta to eventual stable release when it
happens will be minimal.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/gnupg/{gnupg_2.5.11.bb => gnupg_2.5.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.11.bb => gnupg_2.5.14.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.5.11.bb b/meta/recipes-support/gnupg/gnupg_2.5.14.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.11.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.14.bb
index 9cc063f837..e484b03424 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.11.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.14.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "5f765ec1eb605dce9e9c48679cd43b5818d4d4b84c8ea4c0c60eb5dca13c405c"
+SRC_URI[sha256sum] = "25a622e625a1cc9078b5e3f7adf2bd02b86759170e2fbb8542bca8e907214610"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.47.3


