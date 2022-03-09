Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23762C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 09:13:55 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web09.3745.1646817234238638808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 01:13:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jWCk8HyI;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id l12so2071336ljh.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 01:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k7DJC1GQlkNFyXrmI/0tpddm6Zu/EgBWGQ4uJBGGf80=;
        b=jWCk8HyIxzUBqn8WiXpp6om0epM6Isgain1gC/tnb5N/HtNWswSStQz0+xR05q/08v
         RunHa3lV7pqYyDsdxXz+MW13M8JoxPLjYic0oN3KJtQMFhxbrgHlSy6NQQcK3V6pkCs7
         VEOzk/z7Y7LMXVwTuj/69g8TgXiMr+IpWCYYAcG98+QWJM8c1srxp/MXP5lcK0njlruZ
         jmsI2s6kRHcT3R9RbAOOurGTy1eRtX6dFCbf8cV+HqsOVXvQNf796kDmKuMBHM8WpYLi
         KTt5ueIrPSEuS2w5nt3ROXorqmIDsNcU6qaLmKVQwQu9MPqNzDPW53X3M5BdW6FSlSRp
         MKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k7DJC1GQlkNFyXrmI/0tpddm6Zu/EgBWGQ4uJBGGf80=;
        b=i34txx4T6XmYj8/PMZw7vGFqvpB1Gc1womTfnZko+kQtupUj2ZP4OUsW/E2YWfuG7M
         EhwsPz/RWhvXVfa1oKoW0e/dNjFOOO9jzryia7C8Ueima0SyO6Q6MuM89dL4F5pdBfMz
         1wO2fer4/tJiF3DX0d/cqFlto5te2ar5/+kIWy6bQDjRnQ1SKCLn2jOvIVrSN1TKWKid
         Zf3oXKDZWdmHtna0r02PfSpT78DQMmYKfTlvEUIt2NqVFap+zZ4vFaHFUFhzekg9RxV8
         kLvqGQQozl8GK65ZD0Zz5WmSi7aMZeQSpaXiA11sX61AMpu28m18dqukxv2DK+aC17HF
         OsfA==
X-Gm-Message-State: AOAM532EOKrIEw+FahJJ0RkJC+UxT8LNW9HiiYlg1zzUBxIrQmEh+h7o
	97R3wmlDlFBz8S3CWcS5v29Fq3rkXf8=
X-Google-Smtp-Source: 
 ABdhPJw3+Vhco//quZ+vzUFUgi5kUBw1WdCgp6cEEbBfcVFxyakLhK6Q+Fk6eRx6sgZVp725maLD9g==
X-Received: by 2002:a2e:a482:0:b0:245:1b8:65f3 with SMTP id
 h2-20020a2ea482000000b0024501b865f3mr13092012lji.507.1646817231916;
        Wed, 09 Mar 2022 01:13:51 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id
 e11-20020ac2546b000000b004482059541asm285898lfn.167.2022.03.09.01.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 01:13:51 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com
Subject: [PATCH] binutils-cross-canadian: enable gold for mingw
Date: Wed,  9 Mar 2022 09:13:23 +0000
Message-Id: <20220309091323.2647842-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 09:13:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162953

This reverts commit b5a595a4be09756b88e91f3353e3b221b165ab44,
gold linker can now be built correctly for mingw SDKs.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index f44f46602d..b3d591e658 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -13,8 +13,6 @@ EXTRA_OECONF += "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VEND
 # e.g. we switch between different machines with different tunes.
 EXTRA_OECONF[vardepsexclude] = "TUNE_PKGARCH"
 
-LDGOLD:sdkmingw32 = ""
-
 do_install () {
 	autotools_do_install
 
-- 
2.25.1


