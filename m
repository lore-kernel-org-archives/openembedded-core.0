Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C27FEE14B2
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:56:42 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.4169.1694019401245241769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=InI5WbFu;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2bcb50e194dso1558491fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694019399; x=1694624199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Htn5Lt+fYer6jcRkFMa8iqlN+Dgd6h6wbDLJ1s/TrJ8=;
        b=InI5WbFugU8jqQxHjk9OLLkJ4RZTXYP1r1bG1f3reAS50+JsN8huTeptzxJR6rzehc
         mHQs2x12MG2kEGtgqd0OurCqMwLAuoMQGGTKLpvhn/fuGz84AXDoXH3e8Sz+MEn7FMND
         BUX31KCJCQGslYughdoV9xREdJA8achCijfCIIz5eV2zl2qrR4TPQCVEk21HFFqSbbha
         TjjFxHs8YrmQa3z2qo86eDlseXpVXlsa493uUDqbeTEpLczV4Bb2uLISq4MwTiyBSYiE
         z694y+06V/NIA+w9D5lLB06G5Sm89N3H/LwXzDQRrwzx/VEpwYHQ0GQcF+KLzRfTVPxO
         lCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694019399; x=1694624199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Htn5Lt+fYer6jcRkFMa8iqlN+Dgd6h6wbDLJ1s/TrJ8=;
        b=U2t5TZJRAutGGfshgXJKq3nxGjDzJEQFIL5PBKLLbPZ+yE5R5g5oMZYKJpfGEBRdJN
         2FwWE8Fk+nH1civw9KmGTnTtYe0smN9bBXw/k5JO1ga80rpio3+h7NUr39OGlVxFhk+5
         JECorP44c1/drPUJHB+zBDA6XXztIif5I4RSIgwvOZZYI3vBaWOyf5J/D+c6jTHcrC1L
         k6Z3B0Evx0LX30dt0ZRw2e5dCSxcceo1xGHDaaZzmPYdGyjIPpVoA4CHdIACClN5nrp+
         Yu3D628sN403Vb4+BtkE4AfFU/6F+CwAeVyPX9uvwFCDOB3KZ9/yLfHznrf/7GlvjKK8
         xfcg==
X-Gm-Message-State: AOJu0YzQ/snW426/T7MkOpy7dikzU69IWXrg4DoQ1ZiYxBnxOOAcL9KV
	MkehNZCmTw0hAKPxUHPpfXYO/9Wodzc=
X-Google-Smtp-Source: AGHT+IG6ihTKP5UWkpUeWetbbWaNcCIuc7QZZYJKUsA/j8mp+A77bEpYz1vOERTvb2zSERoX3tWYbA==
X-Received: by 2002:a2e:9a8e:0:b0:2bb:8eea:755a with SMTP id p14-20020a2e9a8e000000b002bb8eea755amr2465407lji.49.1694019399005;
        Wed, 06 Sep 2023 09:56:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lh7-20020a170906f8c700b0098e34446464sm9284848ejb.25.2023.09.06.09.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 09:56:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/17] openssl: build and install manpages only if they are enabled
Date: Wed,  6 Sep 2023 18:56:17 +0200
Message-Id: <20230906165633.2382629-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187323

This significantly speeds up the build by default.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/openssl/openssl_3.1.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.2.bb b/meta/recipes-connectivity/openssl/openssl_3.1.2.bb
index 817bfedee14..3f77c218c84 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.2.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.2.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
 
 SRC_URI[sha256sum] = "a0ce69b8b97ea6a35b96875235aa453b966ba3cba8af2de23657d8b6767d6539"
 
-inherit lib_package multilib_header multilib_script ptest perlnative
+inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
 
 PACKAGECONFIG ?= ""
@@ -30,6 +30,7 @@ PACKAGECONFIG:class-nativesdk = ""
 PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
 PACKAGECONFIG[no-tls1] = "no-tls1"
 PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
+PACKAGECONFIG[manpages] = ""
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
@@ -145,7 +146,7 @@ do_configure () {
 }
 
 do_install () {
-	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
+	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install_sw install_ssldirs ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'install_docs', '', d)}
 
 	oe_multilib_header openssl/opensslconf.h
 	oe_multilib_header openssl/configuration.h
-- 
2.30.2


