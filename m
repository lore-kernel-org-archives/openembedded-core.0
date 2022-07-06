Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073ACCCA473
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:32 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.3654.1657094847523500024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GaSHHdf9;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id eq6so18203500edb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CTWtNFSzW1c6cYEs4KUKHRRBaicnSo4F0c6ZgluuzSI=;
        b=GaSHHdf9652tXc6k/6zZJq74Xl4Syl4/7S05uOlfGeGmG5Yjhh9tyahYRtkKcDY74T
         KQB27KPbPbgEMl8IJmqKpvSNpTAVqzjKuzn9Pl8R84RPC+hhppfEhrJfVVO1jCS3TVj/
         4yuAgmzGZifzs5mrHpsE0eMP2bkC+A3x/SFfjVBs4a/uGpLcp9XG7UD8frODBHQsC1i8
         BfrBE3+Ph85f5gZB+ZYQCi4kqaPdnTJKc6+608wnAA3oEOsmNFOYpbQe/hrDrImUyUST
         29T9nbZPtbi4nlbBcOC2OM0p1iU+60GJLzA1MtCnn2r4ETfJr9vf+2zUdCwoOenNrSeC
         SdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CTWtNFSzW1c6cYEs4KUKHRRBaicnSo4F0c6ZgluuzSI=;
        b=hJkxMqvqHQF2NBrdbIBT0mE6KsgavNcYd7aqEZu5qRLLWOSerMaojiwUjsm+ZiNeoL
         fLONZek8Z9H0mEQyXL6srWgF2oYFqtQhnznCDDaVhcaUQFATIDdgoXmIgeMf+gW7unQs
         DN2oXwPiOOVnmxoRr/AvAwWbtD/jBdBh57FFQUG/Gwrdh2XUXOQJMZpfGxt06yvj+p2F
         ExVtpmgB3j0uHU4c8XKUikryTd+2sha5JJT3YFCQamtgNQtOnlJiHR4+5dNaVWvFXwvo
         TaX/C01b3RvNGMfCwSX4xisg41eZsd+aWIEmgkGgwGrus9gSyA6As5ab5/Vo6imFCUVv
         3OEA==
X-Gm-Message-State: AJIora81C+Z8ozcUz28bqOwZ1zittCzPnjXNeL4dZX6bCB4ZT7bmpyt/
	Oe6IV5fAquS8zBVdXK4f3GRAdcFCtEfy+g==
X-Google-Smtp-Source: 
 AGRyM1skNBJ3rjzOfkY21+qRVPQJ+1vbDor7uhJOaGwkGVRIa8LANcdurFeUjI5ywJ8IEBx5Hhpm9g==
X-Received: by 2002:a05:6402:3705:b0:43a:214b:5f40 with SMTP id
 ek5-20020a056402370500b0043a214b5f40mr24021746edb.83.1657094845884;
        Wed, 06 Jul 2022 01:07:25 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/27] openssl: update 3.0.4 -> 3.0.5
Date: Wed,  6 Jul 2022 10:06:55 +0200
Message-Id: <20220706080721.3072553-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167688

CVEs fixed:
https://www.openssl.org/news/secadv/20220705.txt

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../openssl/{openssl_3.0.4.bb => openssl_3.0.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.4.bb => openssl_3.0.5.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.4.bb b/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.4.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.5.bb
index d9d17378d4..e50ff7f8c5 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "2831843e9a668a0ab478e7020ad63d2d65e51f72977472dc73efcefbafc0c00f"
+SRC_URI[sha256sum] = "aa7d8d9bef71ad6525c55ba11e5f4397889ce49c2c9349dcea6d3e4f0b024a7a"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.30.2


