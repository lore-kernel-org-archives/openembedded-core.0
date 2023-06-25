Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB0EEB64DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:47 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.20165.1687728166804383773
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jr3xZ8Li;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31114b46d62so3209862f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728165; x=1690320165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G47PTVe4sVv0+eCCLfw4gJ+y1vl14tTAzDnxOjjWoIY=;
        b=jr3xZ8LiG0sDzVy4XLgLK3kF7z2lJOCwX+g7kLoyFCaAm8gKjRGSejh7VMT1sNbKxW
         kSZ8NVvCGX616bQczPDbjP5lAaftuvQ8XDS12LKNq3xV9BROWR9czsntBNSjE5eRHptH
         PahMoZLSu7wm7MtvJ2Eoys/lHeGlwf2tOLnyPm9wjKl4v5CHlTrvcZek8JN4dloc74R5
         nymqYITbIWSWrOi/ucmuYN7lVh+9MmyE0If8G6XVwIM+8IChisg4UHrYwsTwAS+92Sml
         MyuCmh0uj0SZtmi5p7+u1DvbUOMcGmpFHjAQua/u44EgJ3ymHUH65ckpGxZxLg+GL5jZ
         wxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728165; x=1690320165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G47PTVe4sVv0+eCCLfw4gJ+y1vl14tTAzDnxOjjWoIY=;
        b=FGnjd4a8aXLnrx8eoSXbaoj7+TuOpWJ/mn0nMhGlNRs/xVDlC6iqXh+s2LeZBR1gTQ
         B90nTup4c7GSInecc/BPyDEbo0jE2J8FbNB9hNji/3mwgFrYPd3n8QvtQ+N1UxhQFB4u
         dW/9KuXnNXpSkocmNza5KsUopGggTeDy4N35c7W5SqHjP9U3qsSsPOR6kpQoTyBIwjJy
         uyu8zCe1IAmlDvN9cjyZoOdWrYX/6Fvr6CXWV2JpeHcw0ypnumKBefdd4PD3ptfcmu8e
         1liHBYxhoHNgfwD8E+LP62Hg+NFoz+7W33ZW6D0oJgW7KkPEGu4Kj4dsB9aTPGSXZbQy
         x4Jg==
X-Gm-Message-State: AC+VfDzc/pxzUjqMtCbpljvK+3dKr5X55CGDk0fp+CIGDVoOssowQcJ2
	1BEIa/vRSZMxzfUPtYrEc6IOKnrF8QZbaw==
X-Google-Smtp-Source: ACHHUZ7Q7FioaIoHMJG9fImcYLBZOHa+42avKutP6tsOsr5pY6yLoT8gY9bYF67OJUECnEy0BCnTug==
X-Received: by 2002:a5d:4741:0:b0:306:30ea:a060 with SMTP id o1-20020a5d4741000000b0030630eaa060mr23757850wrs.51.1687728164980;
        Sun, 25 Jun 2023 14:22:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/21] libxcrypt: upgrade 4.4.34 -> 4.4.35
Date: Sun, 25 Jun 2023 23:22:21 +0200
Message-Id: <20230625212241.915739-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183376

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{libxcrypt-compat_4.4.34.bb => libxcrypt-compat_4.4.35.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 .../libxcrypt/{libxcrypt_4.4.34.bb => libxcrypt_4.4.35.bb}      | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.34.bb => libxcrypt-compat_4.4.35.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.34.bb => libxcrypt_4.4.35.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.34.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.35.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.34.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.35.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 4d145cf3ccd..2e4db283bf2 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
-SRCREV = "e80cfde51bb4fe4bcf27585810e0b4ea3d1e4d7d"
+SRCREV = "321222c91c4060362b1085b3ca7c29867812ac0a"
 SRCBRANCH ?= "master"
 
 SRC_URI += "file://fix_cflags_handling.patch"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.34.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.35.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.34.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.35.bb
-- 
2.30.2


