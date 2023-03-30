Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104AFC761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 13:42:22 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.25370.1680183740463483034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 06:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n8nIJdfG;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id t10so76499464edd.12
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 06:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680183738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37qD3HpRuT76ygaYOrVgaAhvhoR6GxtyNRAWwVXHtN8=;
        b=n8nIJdfGt7XNn0vuSXwA6o8u0FUAEl+qNTQldSEvaDFDu3PvLHIm6cttFX+/19stVd
         xw/AZlZb6ruKC3CLb0ZVxFkQsPbTaVtaPwS89n6jx0fil+Z/BjAALFxg9UxWxh3wIAeE
         dvIR6810lzbvABvxZH+TUNPUJ5yeV6tCRqfsXCU1v5Y0dmuD2vkEf43NxAD8wY6NY/B9
         Qs0i0xcxa1rJ143aPDQbQvgbKI1f7dqnG0qi2BFHtsHIfIVyokumebN3KLdrFQL5ApHy
         3o/g5vFYhUqqcPGvKzOgRNkFYWQDH0AL8qjoI/3VUEA7ORH48YTKBLCmBtD/2daJgGNI
         AHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680183738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37qD3HpRuT76ygaYOrVgaAhvhoR6GxtyNRAWwVXHtN8=;
        b=7S3lq4F9e0yqmMyZ+Jdrg/ymNcHM09Tj4IO7zlArwo7bX6O84K735HpVEK5+ccRAji
         CjinSxzyEip7dFW7w+2KFTPtglcwcW1UuEAKcsp3HWS1BTtifqu74KBJfdPwPNZEa0ce
         XxDvhhL3fdmd6NOaZrOWyA1XXy0UfJbXkc7Oc2gX1ZsAwCMKQKpLZrEB+Mhyy/q/oeRS
         2r4b8Bvn6jUFKxPIZBCSU8HjpoIIN3xz6ikRHZPDQydnO6wvLxU6EKt/AN4O2FYCGmr8
         UhYlMhVgUsj4komzn84h+6hryyxuWYVMBpxI4AITuNwRQcVks3AJX22+uYa70jXxDeO/
         wd1Q==
X-Gm-Message-State: AAQBX9fX3e33UkLaNfmopkvKOoasE3JY/pXSwl1XkqoSwlZ9jwIRjgph
	kyhi/gJFxSsZZXi3IewD0mrJ2QKPFZM=
X-Google-Smtp-Source: AKy350YiqhrDmuIM2njhv/GFiWbLemiOXTsVrP+vmRMWjJBcX6Ct6WTfNq25LzIX8EBBk8wkXCaadg==
X-Received: by 2002:a17:906:9453:b0:932:b7ce:2aaa with SMTP id z19-20020a170906945300b00932b7ce2aaamr26291082ejx.28.1680183738101;
        Thu, 30 Mar 2023 06:42:18 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id w17-20020a170906b19100b0093fa8c2e877sm6547256ejy.80.2023.03.30.06.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 06:42:17 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 2/2] libgudev: Allow native build
Date: Thu, 30 Mar 2023 15:42:14 +0200
Message-Id: <20230330134214.2772913-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330134214.2772913-1-zboszor@gmail.com>
References: <20230330134214.2772913-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 13:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179322

libgudev-native is a dependency of libfprint-native, which
is needed to build libfprint.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-gnome/libgudev/libgudev_237.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/libgudev/libgudev_237.bb b/meta/recipes-gnome/libgudev/libgudev_237.bb
index 9ce43ce34b..ad3a16ab99 100644
--- a/meta/recipes-gnome/libgudev/libgudev_237.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_237.bb
@@ -9,6 +9,8 @@ SRC_URI[archive.sha256sum] = "0d06b21170d20c93e4f0534dbb9b0a8b4f1119ffb00b4031aa
 
 DEPENDS = "glib-2.0 udev"
 
+BBCLASSEXTEND = "native"
+
 RCONFLICTS:${PN} = "systemd (<= 220)"
 
 LICENSE = "LGPL-2.1-only"
-- 
2.39.2


