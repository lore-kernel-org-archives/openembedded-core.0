Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CC9C83F17
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:23:43 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.82440.1752510214293551676
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 09:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KX3ZS+WP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-748e378ba4fso5286956b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 09:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752510213; x=1753115013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gx6RaiZnOAKPx1bP6RwEN6o3O9wOR1gZy3AlpgAUgeQ=;
        b=KX3ZS+WPHzhIf37ptgulXSTlEp3bW+SHitl1Eq0hSSWSvMiXbxhGqUrkPCvKr8qI1u
         ZHxir3TVSwR0eaGkQOvjgKXm8GVT75fjfK5srKSd0RNEx2Mn86kpK6Z1ikMWTLuvVh4X
         7ltt4GsDYeDnpvL1Gp3wDg0j5NDXz2FcRXOSxkYvVA9NFNs/v16gtmLqgtfm2RJ4G5G6
         LivQZILZNYk2+GrZsV46WkvfmZBswll2XCAaNq3AX+PxAT9TBhrY9JZ2VKU5QYFmme74
         Kq308GwgRDn4dGpvjjSQIP1ktyhciq5NGBwRQPic3hQsORhBCh8Lifd/RAFIlLDGA2hY
         yH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510213; x=1753115013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gx6RaiZnOAKPx1bP6RwEN6o3O9wOR1gZy3AlpgAUgeQ=;
        b=hkAH9E7S/nB9I+g48/+B+rVMItr4gilnM+8ZBaJSN7/wLN7+Kg0EXy+F2K8SImF6bR
         NnVq28UJT2ZGOeJlk0UIp8oorqNH/Q8W2Xc5LJK098my9LUfXoEJpFm3/32uPkbIaz5G
         zx6eBCqGQmtAGHI3IAJpXWPM7f3JuvRBTibCzIBvJ9YRoeXwqTRhC9Mf+kImLl5cVjKW
         7v4zp0u18r3njoWoIrQQZlEPhC3aojjAAvpWwNkx7DibDKcNbs/fB4chFtH2VKxFwtPp
         NZunWhuOPO9WrPwrxSnHjx8dnpraQ6iKAKhnDoL44hPfP/2FEaEcdjf0P9EnA1d8APUe
         9dPg==
X-Gm-Message-State: AOJu0YxrnUk8i2RM9UH9c3AhRU4nE4epQPH5cpY+ltf1uIoqW4YQaJgY
	jgQHpbTBFbhUUiDQqUbILF0dRgSGug+C0dDNXRZA9HkWkNzD1eAy5D4JysaNaVFkhF5LB0O0nNB
	9Ad55
X-Gm-Gg: ASbGnctii1SkjiP1mVunkPqb9eO2AJPfEt+4ymSPJS9VIDiKeOfGRP1hvaYD047YiFw
	PmJn2IowJloNPncR7qqneq8y3f3F9nteRRmixbpTmCZ4F5P6NNBX1wcqWCMKjmrlNdnvETNqxGt
	kiq2cTgEIdYftHeQi7VyJB3Hq/yl2tGg23tzZw/X84OypFcClf7sPAvjiCgEqhbdR+rNqjfxsmf
	qlyIPh/KzPLdRRKxcSVg8DYLAPlCQZAunNR75+X30/t6gcAT2RkV3P1ZLhxU/ielJGeLtGljTuV
	MVx6CtTlWHqefsCXAHzRWsm9mMtHwVtUu9JwbKKMfVLASbKkl6vxAZbS/EZWxrUl2hBu/hxp9R8
	02QwyO0LStcK5D7e3SuXAi0M=
X-Google-Smtp-Source: AGHT+IHuuqmtVzQcNyaIWY9SyY2VMlR0QoG5fEb1RxnWsxCqxY2OWeOwgIfexXQXCvtwVjugisutTA==
X-Received: by 2002:a05:6a00:2194:b0:749:464a:a77b with SMTP id d2e1a72fcca58-74ee3142ac8mr19117414b3a.18.1752510213486;
        Mon, 14 Jul 2025 09:23:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4aa7:6b72:b465:3a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5e8fsm10456053b3a.29.2025.07.14.09.23.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:23:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 11/15] openssl: upgrade 3.4.1 -> 3.4.2
Date: Mon, 14 Jul 2025 09:23:05 -0700
Message-ID: <8803e5b629b3dd2f0fb9f4ad226a0005f8ce94ad.1752509862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752509862.git.steve@sakoman.com>
References: <cover.1752509862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 16:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220249

From: Archana Polampalli <archana.polampalli@windriver.com>

https://github.com/openssl/openssl/blob/openssl-3.4.2/NEWS.md

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_3.4.1.bb => openssl_3.4.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.4.1.bb => openssl_3.4.2.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.4.1.bb b/meta/recipes-connectivity/openssl/openssl_3.4.2.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.4.1.bb
rename to meta/recipes-connectivity/openssl/openssl_3.4.2.bb
index 8da64aea6a..2998e37e75 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.4.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.4.2.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "002a2d6b30b58bf4bea46c43bdd96365aaf8daa6c428782aa4feee06da197df3"
+SRC_URI[sha256sum] = "17b02459fc28be415470cccaae7434f3496cac1306b86b52c83886580e82834c"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.43.0


