Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF18DECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:39 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.2232.1666901797029634348
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PLpeZsPO;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id ud5so7919234ejc.4
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yV8IThkeMZyDQnw8Q9qf61PHO0iB5p7xs8B+Wywdo8=;
        b=PLpeZsPOmFYYXDR2Dj/BB08f4V6tlUV3VP0JgxxFwH7YsBCfFOvQA7kCeepkWalDRI
         wcfGp+XjTS1h1XBAWG31wyZW8vlAGCDFvauEXJqv67X4RbOMJMXEoSYyq3vFp3UrlXUE
         1MUlfSPN1EWIJ9qPU4e5U+fyGKTMW1QDihu8+NoVjnSQsh/HKT4g0gm/cb0DzNstW/mk
         Yzz3opRX4FOwkF9hJ/NX8ufwQ0yrj7furPd/zuhSTqq538vVxcaG8sMVFkQVw77W1564
         5z7bDxrZ5CD2kj/YahpJ79DHP7gD3nW71Vhy4KtmDMmsqE52tUKciXMin8VDW4R4HbDO
         xaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3yV8IThkeMZyDQnw8Q9qf61PHO0iB5p7xs8B+Wywdo8=;
        b=3lNwDT0+uIjwd3xRMXhl8t16sy+PQPMwWsVe21yDO5KlEmUpIRaMq0oPvwJMPZXk5v
         onmH830yo373MvSsj/aDNTm+fU1YnNq9ffzK+SATsbwrlbYQeMlkQPSnT94/N3CYfA50
         Mhdlejd0mspDK8cP3u4VnFeAFzxqz8sACzzvh/ROmJZPg+qqR+XBByh/Ke+nqNjTpv/M
         xbBatspvEAJFlKJKur29czxQT+aaDkuL5VghU47qUC971znV6TnUmwNas+GfYtAZTLCq
         ObnDHijcZVjmkSJa17JVyu3/hLXEmV2XKJQnJi9ruzpZYebR6VbZf0a9/IhGIGpGGGzz
         7FOA==
X-Gm-Message-State: ACrzQf2AbfYkH0TnYuqUu+IElk7w17jfgl09LaNQlNKs0dk6q9FADpZd
	KB5Nt1RqM8coT5ab/w05Dd/rHrtmAz+CmQ==
X-Google-Smtp-Source: AMsMyM4OYuB4D9VxQzQSpfOPuYe8zxDd0TQCpT7Y2n+DKoUEISMI5wEOOcyfJ4ikXGxEWjbUmJpHbw==
X-Received: by 2002:a17:907:2672:b0:780:8bb5:25a3 with SMTP id ci18-20020a170907267200b007808bb525a3mr43345117ejc.281.1666901795470;
        Thu, 27 Oct 2022 13:16:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/23] shadow: update 4.12.1 -> 4.12.3
Date: Thu, 27 Oct 2022 22:16:06 +0200
Message-Id: <20221027201611.3644334-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172221

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/shadow/shadow.inc                         | 2 +-
 .../shadow/{shadow_4.12.1.bb => shadow_4.12.3.bb}               | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/shadow/{shadow_4.12.1.bb => shadow_4.12.3.bb} (100%)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index a87e23569b..5656a375b7 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -30,7 +30,7 @@ SRC_URI:append:class-native = " \
 SRC_URI:append:class-nativesdk = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
            "
-SRC_URI[sha256sum] = "9fdb73b5d2b44e8ba9fcee1b4493ac75dd5040bda35b9ac8b06570cd192e7ee3"
+SRC_URI[sha256sum] = "f525154adc5605e4ebf03d3e7ee8be4d7f3c7cf9df2c2244043406b6eefca2da"
 
 
 # Additional Policy files for PAM
diff --git a/meta/recipes-extended/shadow/shadow_4.12.1.bb b/meta/recipes-extended/shadow/shadow_4.12.3.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.12.1.bb
rename to meta/recipes-extended/shadow/shadow_4.12.3.bb
-- 
2.30.2


