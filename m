Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB313C77B73
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 01:12:08 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.1870.1682039522701392364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 18:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cnhs0LLe;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1a66b9bd893so16021355ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 18:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682039522; x=1684631522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpJAwmav4JahHXIiaXN/04bRR97qZ+RtjPIrG8yoWM4=;
        b=cnhs0LLed8G/QllplCu0W1dcK56jM78zOzjOW7MoEZNcdShOUSRw5Z0bBYCoyyqZbB
         GeMZ74aDDkVpoav20attkutz2XWjhH83UWrgHBkcB+/J9o2qTgw9WsRFo9GztCZl3vaC
         zKLEE8Wal5COK18juu8T/d9h9QIro5I2qN/t/2xEvwvwf+MVYBDcU4uGAniYNYyol03M
         fKsSGJ2ng+FVLKdG1RhG/si+0kUCBNQ4bWDEzaOLWAYDRwkt9jxjNc6ygzvCK29rm6gO
         Mp5PL6jia6HXZq737uaMulBhK7QU58dNag3gshjrK7dBVnse9nJTZd6JFQhTEeOn26xM
         zyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682039522; x=1684631522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MpJAwmav4JahHXIiaXN/04bRR97qZ+RtjPIrG8yoWM4=;
        b=GFekLXDZsOVpGHJy0d7ylCOx3lfKSAr5HJgdo406WbKhzUVhHvDUoEss0ejuqMZ/RL
         +o9EdfqeBV12bK7shpn7aQFi1AJsvReEmfo5UZbASK8TmxuxVuBuuFrjNhRDHDxniF19
         DPBACj1oNWUdT99TmpxzZZq/1JO9lAH1SdX0cBnSm4bhBV6Hcrv9GBEuYR363X+RE6EW
         iOr9Lg/U95u3wTSBXFUtHZaRddrqXHTwgwPfRu6cv4nfENhzTlsi8QU6wn9J9iPOlLot
         io9MhFaUo42wRNpwt0PigYABXH4uZFIVKtKx/AiXkDT7In9tDolLxhm+SewVcm/4b3J/
         SotQ==
X-Gm-Message-State: AAQBX9dEtjx0KCh9dvWisXZUj7SmfcAgd2NFsmq8ve0vQhfFHrc3hJw9
	F9v7bkdF+N6myx2/kYgVoA7WtD2bKDlMpg==
X-Google-Smtp-Source: AKy350bsSWg1fQt0EUtQ7gnb86hty0AoE5auVeYhuIyKLb4s84azeJpWo3r3CBXJbshwf+kxnUZJMA==
X-Received: by 2002:a17:902:bd94:b0:1a6:ef75:3c53 with SMTP id q20-20020a170902bd9400b001a6ef753c53mr3264366pls.11.1682039521754;
        Thu, 20 Apr 2023 18:12:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902bd0400b0019462aa090bsm1639256pls.284.2023.04.20.18.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 18:12:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] lua: Disable locale dependent tests on musl
Date: Thu, 20 Apr 2023 18:11:58 -0700
Message-Id: <20230421011158.790929-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421011158.790929-1-raj.khem@gmail.com>
References: <20230421011158.790929-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 01:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180259

These tests depend on features of locale which is not fully available on
musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/lua/lua_5.4.4.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/lua/lua_5.4.4.bb b/meta/recipes-devtools/lua/lua_5.4.4.bb
index 4fa5c593cf..26ec35f997 100644
--- a/meta/recipes-devtools/lua/lua_5.4.4.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.4.bb
@@ -56,6 +56,12 @@ do_install_ptest () {
         cp -R --no-dereference --preserve=mode,links -v ${WORKDIR}/lua-${PV_testsuites}-tests ${D}${PTEST_PATH}/test
 }
 
+do_install_ptest:append:libc-musl () {
+        # locale tests does not work on musl, due to limited locale implementation
+        # https://wiki.musl-libc.org/open-issues.html#Locale-limitations
+        sed -i -e 's|os.setlocale("pt_BR") or os.setlocale("ptb")|false|g' ${D}${PTEST_PATH}/test/literals.lua
+}
+
 BBCLASSEXTEND = "native nativesdk"
 
 inherit multilib_script
-- 
2.40.0


