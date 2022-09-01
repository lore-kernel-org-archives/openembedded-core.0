Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8678ECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 14:23:37 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.12792.1662042214789963202
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 07:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FB1j7B+9;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so1471395wmk.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 07:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Ux2EJqmqc6+3XPtyYX9pKY0ebiI31jcj5KIXKI/OYyc=;
        b=FB1j7B+9bNKdOooeNINCo+n4eUq9db28c/lziQFyErQ7sTkjvKGyqGrn6IzwXLNut4
         q20XtjOKPggvQV4LILh91ObK1EdHUH0tUrb9pnvSoL22C81rlOr42NOMfO553uI5qGz0
         ck2gh9w7JvV7IzQP1z+/7kJpPOYM/ghTFDd9ZW8GNfvUpIuqt0SXTioELvG1YJhbHqfq
         aB4fUER/ybguIjSc49xKAWuDz5NOzHpzS55KHfJktjYC15veCPIp/PoVMzspkQUcUQYo
         IzPaTUmk9bVOxWbZZV/JrShds45vONF5fk0Xrj7eLH8jFsPn1of5Ow3CmMrpLXSAHPM6
         9gmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Ux2EJqmqc6+3XPtyYX9pKY0ebiI31jcj5KIXKI/OYyc=;
        b=VF1IAkgeWVSunJBsu/UPqQ/wD4qby8GjeHIg1HhzZGE+kDbo+KVsTKmR9gPxpRs6LT
         vPjvMr+HYyKp6RM29xaVPJFa3ceLDJQHr2TC7wdbmtj4xqFcP36RLqs7kSHt2jMVVQds
         URfLc0fGQ7a4T04VzFRojZ2Nyh63p4QEMDWT7+i1SsHVSQJcquSkpxaMuIrlwJ4GIMNq
         d9Dqbge+0UaYR/tHXXgQElbyd42Ard6BDway0KKlc6MXXoD9rKmAPHMW8v9OvUn2uAW6
         ngXNPUjR+0rfO1Lc76JZMqsd+ai1oKae5DNapiheqNZSE4Uty0EoaQWJF6KKcIy1dreH
         J9Xg==
X-Gm-Message-State: ACgBeo3ovByMBHvDRoQ/suca53TGJcBMAtPFvkGuuM7TJanDqKx0gotp
	py5wq4PzCRIuQP4YQOs3knBZnE7NJkU=
X-Google-Smtp-Source: 
 AA6agR65kCHctgEhjHYT9zLdBq3vFOmqHtgUmn8WiAybC3PyjZO50bzbRjWbcSR+p3exIG5lennqKg==
X-Received: by 2002:a7b:c844:0:b0:3a9:70d2:bf23 with SMTP id
 c4-20020a7bc844000000b003a970d2bf23mr2368624wml.165.1662042213169;
        Thu, 01 Sep 2022 07:23:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c10-20020a05600c0a4a00b003a541d893desm5490273wmq.38.2022.09.01.07.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 07:23:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] scripts/oe-setup-builddir: migrate
 build/conf/templateconf.cfg to new template locations
Date: Thu,  1 Sep 2022 16:23:28 +0200
Message-Id: <20220901142328.268769-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 14:23:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170222

This is done only for default oe-core/poky templates; for anything
else the locations themselves need to be migrated first, and there
is no way to tell where they would be.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-builddir | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index bf832ee0ca..32bc6580eb 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -40,6 +40,12 @@ cd "$BUILDDIR"
 
 if [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
     TEMPLATECONF=$(cat "$BUILDDIR/conf/templateconf.cfg")
+    # The following two are no longer valid; unsetting them will automatically get them replaced
+    # with correct ones.
+    if [ $TEMPLATECONF = "meta/conf" -o $TEMPLATECONF = "meta-poky/conf" ]; then
+        unset TEMPLATECONF
+        rm $BUILDDIR/conf/templateconf.cfg
+    fi
 fi
 
 . "$OEROOT"/.templateconf
-- 
2.30.2


