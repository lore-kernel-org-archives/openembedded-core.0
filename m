Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FC6C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 19:35:26 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.113747.1671046521366791160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Dec 2022 11:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rc/HT26F;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id f13-20020a1cc90d000000b003d08c4cf679so193704wmb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 11:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1eaZ7HzabNHVMyKDpOX73WLL72oVqICR4C6yKnzttwM=;
        b=Rc/HT26FkbM4S0GOJXfMn8Te9z7PDJdfRowgnZTW7hM7OXnCRMVCOOoHOHxvO9Yq2C
         XphN/Ogi2D40L0dyxaq7eou9z/nl2C7Q0CdBcnxWlDG5BX5P+Lvqz7LL40EOVlF7KqHi
         af6csTE3e4hxz/mHelo74YoDooT0nyA/C+KNv2Z74l8eQc1XWmevelPZAedB7YqWKPKv
         tztmHbzog4fBawGg1rqjbqdqg1tWcwSU8d4jOEbkq8Ch1eG/Cokopmn54wUDImDs43mD
         uA80hOM3BuQi/XrJhsAwJ9d2kwGlZVYHNqTYjLf6hgH7Ll52aC96Yk6ZwHT+oNupMk57
         R+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1eaZ7HzabNHVMyKDpOX73WLL72oVqICR4C6yKnzttwM=;
        b=vDxPBsYKvgL8BiS6afIF4L893KHhv9+BGeCPXOHaQ3XfX9NqGdCp58CMPOreTeoMJ0
         TBIXDzR0WKHVykDUUfKr39eu0WOdtUpH6E1mob9s0yLgEFG4WZN+R7I8YoCZXz7LWROD
         01jfhhSNwasaAA9pAlppS+zAUK7FKLRutJ2xdV+9VxGTm6sj45kgANrfkRSOZYLGrpXC
         Sn5QXvYplEq+ISKJZ9wwA/kGgtsC1WSCGrcA3uA7qduz1ANYcUeDQwRSNjhzWK0Nuz+7
         2G9tH5PVxAOvdQLTqZtse9zGnTPcSjJhO9DXnCXoFHvJDsu4GVJjvM6aWFM5L9tqfoJF
         3e2Q==
X-Gm-Message-State: ANoB5pkbURZRPA1nHZLIJeU5mtQXafeuNnqYdXZFLznP5oIiqOpNw/pn
	PUVVfAJov3dJ/1DjsW0HKxxef+oDHIU=
X-Google-Smtp-Source: AA0mqf7WBqzV/tpA6WC5Ckss8Unj5mmej+1xYemWUOknGtZ9m9Z3MP0Sm/2l2NDrWEviF9yClcUdXw==
X-Received: by 2002:a05:600c:3b8f:b0:3d2:2830:b8bb with SMTP id n15-20020a05600c3b8f00b003d22830b8bbmr9220956wms.34.1671046519542;
        Wed, 14 Dec 2022 11:35:19 -0800 (PST)
Received: from localhost.localdomain (91-161-217-16.subs.proxad.net. [91.161.217.16])
        by smtp.gmail.com with ESMTPSA id i26-20020a1c541a000000b003c6c182bef9sm4314236wmb.36.2022.12.14.11.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 11:35:18 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@linaro.org>
Subject: [OE-core][langdale][PATCH] efibootmgr: update compilation with musl
Date: Wed, 14 Dec 2022 20:35:13 +0100
Message-Id: <20221214193514.1231884-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 19:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174559

Since the commit 005b6aba89eaf1b79fdd7565dd028fdd9bbfcc7d
(efivar: add musl libc compatibility) efibootmgr compiles with
musl too. Update the variable to take that into account.

Signed-off-by: Marta Rybczynska <marta.rybczynska@linaro.org>
---
 meta/recipes-bsp/efibootmgr/efibootmgr_18.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
index cbcaac1e97..fbd2f5dbc8 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
@@ -30,6 +30,3 @@ do_install () {
 }
 
 CLEANBROKEN = "1"
-# https://github.com/rhboot/efivar/issues/202
-COMPATIBLE_HOST:libc-musl = 'null'
-
-- 
2.35.1


