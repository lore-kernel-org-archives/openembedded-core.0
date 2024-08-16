Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C32C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 19:38:17 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.156370.1723837086207292705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Aug 2024 12:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Niv+zzWL;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7d2a9a23d9so282002066b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 12:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723837084; x=1724441884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vqY5/MGb6snRHqgfKq765CwHsdU9bv9Exabu+KdJ6BI=;
        b=Niv+zzWL44+i2QWgYYOaBYn7bR/T0cOG80GwoIezc7K+l9bg9wJHEaRua8jm1/Zj+Q
         uUay1b/wEUCXoHmNISGsALY9hGMGuq5VgvUiyvakxb1ftB1FiuvJi2q+fRM8lNjTs+Ca
         nYUt6OZuVlZXP+Q099jRVFLQtEWu6p6+jXtSuVrye91//cXvJrdri6YTYodgPST6QEJO
         5pR9/zdioHJDvzCZrBfE4o78G6rwwZjLb8l/gzDN9EEtFW8KbUagI9psrQckhPyWJ2wo
         CWadZFrGzwxg148NFp/nnTdRKoMZrU7bM1hhf4v8oFM/jJ+H+jDY982plOoy4x3IoVxD
         xDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723837084; x=1724441884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqY5/MGb6snRHqgfKq765CwHsdU9bv9Exabu+KdJ6BI=;
        b=e5cziOADx2MO9w2fLJ+Sig9rfFGDoQ/vraMqzwMtbcceQ2y+8AEkg7NgrjrEzrPztW
         gbm2Zv2E/BLPTijFu5B2eOtc6vkT56xipRjiYpI8+263y5nE05Ga9ffgyjnvXz/NqTKD
         gLp4yAV1h4aDBq80Hf0pRvx+/IiKWJaAG8EZczHN1ZSqEvJ6Va6yQWRpEiFHjsbJZwkR
         bu2CB1OzrKIDN7/YvPTMEJV3UxuvYdpyhVPDoX4nPxZCXcp/ynvQaISC9laXS6pc7/Ra
         ASLevQy4ZXRWQBKxkVheU7AzPzGRifMeJ5JOWCb9+cpOMe39CGeTGLoHgEyF0NoSx6AP
         iUBA==
X-Gm-Message-State: AOJu0YyoInDZJt8ycIVSuwAfF09vMOEgJFZFWh0mq4bFishmsfiP1lwT
	fkUInBRTvu5tePcnD0HrrjdYm6uSpIjw2c8IzSQed7XXQ+BVs+DI4oZdyQ==
X-Google-Smtp-Source: AGHT+IGBasFPK7LgPsF4ojR0Q5+2mUSCDagoQTrI6stxnWnWTTtLUVcnDGYIgE4XxMLklVD/HVyyUA==
X-Received: by 2002:a17:907:d3de:b0:a7a:a2e3:3734 with SMTP id a640c23a62f3a-a8392933639mr278914066b.28.1723837083790;
        Fri, 16 Aug 2024 12:38:03 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383935710sm294760766b.129.2024.08.16.12.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 12:38:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] populate_sdk_base: inherit nopackages
Date: Fri, 16 Aug 2024 21:37:52 +0200
Message-ID: <20240816193752.995911-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 19:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203474

Since this bbclass sets PACKAGES = "", inherit the nopackages
class to skip the various packaging functions which wouldn't
do anything anyway.

This fixes errors from buildhistory changes where packages-split would be empty.

e.g. meta-toolchain build now fails with:
| DEBUG: Executing shell function buildhistory_list_pkg_files
| find: ".../meta-toolchain/1.0/packages-split/*": No such file or directory
| WARNING: exit code 1 from a shell command.
| DEBUG: Python function buildhistory_emit_pkghistory finished

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 2f6e7b4076..16013d5872 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -13,7 +13,7 @@ PACKAGES = ""
 # SDK processing context.  This class happens to be common to these usages.
 SPDX_MULTILIB_SSTATE_ARCHS = "${@all_multilib_tune_values(d, 'SSTATE_ARCHS')}"
 
-inherit image-postinst-intercepts image-artifact-names
+inherit image-postinst-intercepts image-artifact-names nopackages
 
 # Wildcards specifying complementary packages to install for every package that has been explicitly
 # installed into the rootfs
-- 
2.46.0


