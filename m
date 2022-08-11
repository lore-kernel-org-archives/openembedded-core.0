Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59253C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 15:40:10 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web08.7997.1660232408759175410
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 08:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XMhM0Ri5;
 spf=pass (domain: konsulko.com, ip: 209.85.160.171,
 mailfrom: trini@konsulko.com)
Received: by mail-qt1-f171.google.com with SMTP id w28so5600345qtc.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 08:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Yp5KI0KJSYuhZVmWl9OnnTubEX2MnYXHtav3C90mjaU=;
        b=XMhM0Ri5LUwABdZKbEf04UShy2+YoqPSdNyjD50QZgwQxSCNR+cpubGlUzlr+EgEHS
         BFtA3M8g8kqI5Yc/+ULpe+IMTnjUjpmoM0DHyX9b1sZMhEqupj9+ZVzlMOJvSJfXEs7Q
         FxsSLFIFYGQZ1SWsXrS35VHYoT7cTelx3z4gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Yp5KI0KJSYuhZVmWl9OnnTubEX2MnYXHtav3C90mjaU=;
        b=4pJRGmdiOAmCAfakAIyYJ8923wEcE0C+UnRCM5Usnkhl3wuw3g0S5kHSgj2ifwPDKf
         ScIkOVVX2s9dkFjfFnYB+6i7o7tA8qQj8JTwTsrviH93By8FHfOxJg4xmi91knLvQejm
         uFa7z3OqY1PdQjZWmGC/FsFSJjVTMu/RJ1lBh2twruqsylJWOy4FDHJAmKVvzFw5MRbY
         uqqIVxmi8xxY/p9oHUs9W8i42kH9k393+9MsrI1WEKqTxveKeHyJ4edYJo14v57ZeEUX
         iBUFUcTR0SHGNsuJB2JpopatoH5XRdZxtIy1Or2F6XadIKHj380107wivMURtmqEEMzQ
         tPWw==
X-Gm-Message-State: ACgBeo25fTA7JReO+yYcoWKqatJez9Vmw6YeZRvhiatDKFfommvt9Hul
	zbc4/14eIR2KBgzttA7/Y4Y5FzrzGbSOJM4C
X-Google-Smtp-Source: 
 AA6agR5MzxSXy5SFYcZya3Jx6qrLU8VwJdodYBGn3U0vMI+O/neg56aQQmtNJJwA1RN9Voh/VZ+zZQ==
X-Received: by 2002:a05:622a:c7:b0:343:2e72:8416 with SMTP id
 p7-20020a05622a00c700b003432e728416mr11004853qtw.92.1660232407529;
        Thu, 11 Aug 2022 08:40:07 -0700 (PDT)
Received: from bill-the-cat.lan (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139])
        by smtp.gmail.com with ESMTPSA id
 bq19-20020a05620a469300b006b59ddb4bc5sm2265369qkb.84.2022.08.11.08.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 08:40:06 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] qemux86-64: Allow higher tunes
Date: Thu, 11 Aug 2022 11:40:05 -0400
Message-Id: <20220811154005.4084669-1-trini@konsulko.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 15:40:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169248

Back in 0be64e54a0e6 ("qemux86: Allow higher tunes") we moved the
qemux86 machine to using the core-i7 tune file, for maximum flexibility
and to allow for enabling advanced processor features if desired or
required by various packagess, without changing the default tune. Do the
same now for qemux86-64.

Cc: Joshua Watt <JPEWhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/conf/machine/qemux86-64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 901353499c81..864086791179 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -10,7 +10,7 @@ PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
 
 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?= "core2-64"
-require conf/machine/include/x86/tune-core2.inc
+require conf/machine/include/x86/tune-corei7.inc
 require conf/machine/include/x86/qemuboot-x86.inc
 
 UBOOT_MACHINE ?= "qemu-x86_64_defconfig"
-- 
2.25.1


