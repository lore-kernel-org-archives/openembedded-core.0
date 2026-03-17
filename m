Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E72FB5E9B
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:03:45 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65369.1773705820777441248
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gW0zksGs;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-662b5bf4b10so9242612a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773705819; x=1774310619; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXgtcdM6sQcrcTtvm+pxNx7KOyDb+lv7c+H0GA8LGZg=;
        b=gW0zksGsANvrldWhrzJv2LRXgT6ShXaQpUpp36WEIaYUAELT82MbDQjLncmS6f6/0m
         ETOG2KQu9dgkKi+musgi+wrr083jpmaOJ/kAmLF1cECd8p0zlZgcKpb2UJBvjfbgznYn
         4UrB6wFLItK2xfvKJ6FUSL2v8S6kRFNWaxmRUt2i+nHpJsUuIlwDo11/QRW9ivwn5/uy
         iVcnqGADuAF36s2goSq7yD1GHvd9bS8IgKEfnuNASqAoDNIMEqjsRYWbLZ68s3klun46
         ZvQKWXC6UW2S/cHF2V9ruregaA+52dMjpyAsrIoBdNVuUiSHw8kNiXPLFjeR0lt9PJMd
         klQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773705819; x=1774310619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jXgtcdM6sQcrcTtvm+pxNx7KOyDb+lv7c+H0GA8LGZg=;
        b=ppjkDQOiZIAdGXW1Eqq3Qg1cqzzqbEmtJVw6V/eurF8SHQUTD9oAx4grOLTAz1nC6C
         0rRF80GKIVHLvD4TRaCWy7iUpdI+AsUuVxw60MHYCOkCMeoo3Dbi3Bp5jnfNpVVLDVLK
         kN0zsyG4/xskJwzEQSSAVpaz7rOTRHANWexJB/iE0XScHqXxA7zqJJF/E0wLspP4jCYM
         4z8WR0qYUc3OgRW9tq/ZDftmdOV3xr033nIWbNoweStQnpXGw5ppp4rmB0W9Mtj6oWYR
         02gyFhVuCfaENxpjuixVLZ46OnHZe2tL2D5EtuUPZLEU8/H7J+NHWWRXJTI/FUZ7KujD
         GEjA==
X-Gm-Message-State: AOJu0YwoHqIVatyDtvy262Ov6tcSa2HoAeQvMyAJIW7vHEboeH/Sm0Mk
	jGbw7HnLbtrxU043ILE+SlPH/RMGdngInVPYtauqNp5vEy3gP7iL4KSP343n7Rqh
X-Gm-Gg: ATEYQzwLSVqO7BIH19nOt5yVcjztZ2HJ/z2FWpgJlnSyoobBOkJ6I21R8bUpoJdAMAm
	QGCKGOZBSitfW/Nx7x0ovjtiAXg1XV2muO90ezaxlLNU+4D0Y7CDG+bZGTBTlvyvTzS+GWuEhtc
	o7+W3dzqBDKc8xwn2iv7umM7qlB9JYa2AFlwOQ/0imQrwUR4EbE/7yeMnWaRBA5kEhRDfeav7OH
	tIggf1F+8+pjI66O8W/zsHwNqY3FkHRuw8LRFz1b8bf3460XkyM6/opWNlhC05QKeHzUNLYY8dI
	60VW4YgcKcH8u+zEqLBFkjtd8HT4ux2gCb3VOfItgIUmZYd7Hffn6hdJpcaPeLLrsIKxZMkOG2M
	N3nB8zgIx+Kzj0SWI82CE+gX6KvzF7gWYq31opQJJll7muD+/iuaXjt1DUH/7/e2FPNTEADjL62
	7U1bcdc8qnzzZuyVm8o4zG6r7pTxJBLGSzGtNr1Jdgf2DVNid3NJtCX/+gviT/fqbzSA==
X-Received: by 2002:a17:907:e106:b0:b8f:9525:1099 with SMTP id a640c23a62f3a-b9765345c16mr554111166b.35.1773705818990;
        Mon, 16 Mar 2026 17:03:38 -0700 (PDT)
Received: from [127.0.1.1] (93-159-20-97.cgnat.inetia.pl. [93.159.20.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm654584766b.58.2026.03.16.17.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:03:38 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 01:03:13 +0100
Subject: [PATCH v2 09/12] ovmf: Convert confusing append to override syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v2-9-5c65ae5787d9@gmail.com>
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233282

The only reason why this append wasn't overriding qemu-system-native
entry from the line above is because that one was also defined with
:class-target override. To avoid any surprises in the future let's use
`:append:class-target =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index ec6c3b516c..6f9390e6d4 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -247,7 +247,7 @@ FILES:ovmf-shell-efi = " \
 
 DEPLOYDEP = ""
 DEPLOYDEP:class-target = "qemu-system-native:do_populate_sysroot"
-DEPLOYDEP:class-target += " ${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'openssl-native:do_populate_sysroot', '', d)}"
+DEPLOYDEP:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'openssl-native:do_populate_sysroot', '', d)}"
 do_deploy[depends] += "${DEPLOYDEP}"
 
 do_deploy() {

-- 
2.53.0


