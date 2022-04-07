Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E1EC38A05
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:15 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.7279.1649341468146101542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 07:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BPct/qXE;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id c42so6610406edf.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7uhC7x0eyLsmpBGJajwjXHiDUQyGT4pzaEjj76Yl7YM=;
        b=BPct/qXE1clSmaG56CnjDzRHMeSyzuFS+cbcWah81C5Vb6NttRPkNXjQPKLw45D77p
         pxOV/L3xA2MSIAlyVwPXUHQli3sqPCyBxaSPSSbn46kWdNab6QkUQN42Vf0Wrk5yJrsW
         iClJboy6F8vVbFZ3/EM01bcPn/5A+T9BYtEFAEpibNYoo5EU7JgpBF71UZdeBHtuwzfe
         CAPDQ4IWvleNg9LEwjuHv4nRWzmcKNFZZsKV3uGO2t8WCk5+evRfCh+3YDU1rT4F1cCX
         AMyTsuUltoA8aNJ1ZQx0hdeOUudUfoge6ezlLM1uFgxBq0J1GbAtn4NzRrrGJCeMlwF4
         FZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7uhC7x0eyLsmpBGJajwjXHiDUQyGT4pzaEjj76Yl7YM=;
        b=2r1kaOGKuW76fl6M0zkqKU566keLE8aH7D19Vkz73CjS/aKu9n2YyQzJDbVB4pFCk1
         2vBwhcpIUdEqfV4eQzAzDgBj5M/FsGH3jp6xzbYA+coX+Smc/pqX4Y3YFni8GjHftpYe
         fjf0QsSHA36WShmB0sr3Avr/SDQF/LkAjIUQrMapVcsQGMY8KT4vluMMR4D6v7KU48ZX
         AKSrnvtPVGDAmZ+nIPpgk8dvNSJU4KZ+FP1B0rTVyDSUYzg/msupx/5lQdSSbIVWhRbA
         Nf5MaTCw1vt5JjnSk5iIAtOwFCB8fxCcP7vWQ4cPXjWP3OMWtHjXh1J5Q4Rn9uOGUls8
         +Qbg==
X-Gm-Message-State: AOAM533F1TqjiU2H0VhCpTo5hLdnenHTp9voQj2vYCwKYYsYKkG8ERDM
	FMtDgnfeYM9KpYJgb4L9morirwdLmoiMCg==
X-Google-Smtp-Source: 
 ABdhPJzWuxlKMztmktZk2jten4B+peYxN9JHbfKV1AC9QZo5CnoWksBsjSsC9kOWPk379eFrR+tdJw==
X-Received: by 2002:a05:6402:289f:b0:41c:d9af:ce39 with SMTP id
 eg31-20020a056402289f00b0041cd9afce39mr14858196edb.415.1649341466311;
        Thu, 07 Apr 2022 07:24:26 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 hr38-20020a1709073fa600b006e0280f3bbdsm7755395ejc.110.2022.04.07.07.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 07:24:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] systemd-boot: remove outdated EFI_LD comment
Date: Thu,  7 Apr 2022 16:24:19 +0200
Message-Id: <20220407142419.2396854-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164110

* efi-ld meson option was changed in systemd 250:
  https://github.com/systemd/systemd/commit/fe330f02dfebbaa462e0f4590de1049e47da54b9

  the value was changed with the systemd upgrade in:
  https://git.openembedded.org/openembedded-core/commit/?id=e22188e47d2fce2406d9db9c95289b3878eda69f
  but the comment originally from:
  https://git.openembedded.org/openembedded-core/commit/?id=603e50f3db224a0e36a65decb9a98df41b9e22b3
  no longer makes any sense, remove it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_250.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_250.4.bb b/meta/recipes-core/systemd/systemd-boot_250.4.bb
index 23a64bf30d..b67706b731 100644
--- a/meta/recipes-core/systemd/systemd-boot_250.4.bb
+++ b/meta/recipes-core/systemd/systemd-boot_250.4.bb
@@ -19,7 +19,6 @@ objcopy = ${@meson_array('OBJCOPY', d)}
 EOF
 }
 
-# need to use ${HOST_PREFIX} here, otherwise ld.bfd could be used from HOSTTOOLS_NONFATAL
 EFI_LD = "bfd"
 
 EXTRA_OEMESON += "-Defi=true \
-- 
2.35.1


