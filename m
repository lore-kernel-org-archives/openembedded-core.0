Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517A0C77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 17:26:45 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.1277.1684776401295308002
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 10:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rJ7Nl4yx;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-510e419d701so9929953a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 10:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684776400; x=1687368400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7JWqJUrNhIp7yerwI3sNPdkVtiKAeRp+IprDf/6BT0=;
        b=rJ7Nl4yxr5EFIjO0qYT4OaeD9Kvky6uxRg7uM9m2UBDWL/NU3gI5zI8WpIc9PFl2MK
         jjNpHPv9fRRTqxEHGNeEADR9A9wd+RjtCFbM8Q0gsUHIJdRwLl1/CbR2JFD25BVP6mnb
         OXxClg73Gbonh3JJ9gGCvfwjFZBCRLL5H4AfRF8kRK3rTtq/IT8Rs2240M5Z8n2et/Mi
         Coz0FI4VV3npjX1ICp3tyhXDkqduL1i8Y0UD0XE9BZzki5OMdgallD2CfhxthmH0cJud
         OwhyRrPPWMbkR9qSUqI9jAKo8yEjJ//TRm1pETr7q3l+SG+3u4ZiQToDh8xU+j9Z+eeo
         LY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684776400; x=1687368400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7JWqJUrNhIp7yerwI3sNPdkVtiKAeRp+IprDf/6BT0=;
        b=IwOo/PP3yAhoKK4DN8yvNnd/ZXLTZQnWNBb9c4e6AeXv2qjJLObdme3R/dqBeLj81y
         kP6XLAZ7LUTIyR5Le80PF8ftvryFvZW7t1ipIABFl4X/ZcXsdguAUEui0YUcuAzhQ3q5
         LmzLFgyya10NlXWLyeRCVD0f2A7geMy/H+WHMG76Flz066Wi/uT9GDsLCR15Pp9+lXf7
         10XyOKSk1i4Wts0TNCMRfnu21y0yxxRDLEfh0f2/fAuCE5z6d1ZOILwZVfdxTtkjCXi8
         UlDfEdh2IytukJfdD49WxUGezaX692DGDks0jFHvWfvDTuyEbzs09RgYmLjxhUyPRHjp
         yU6A==
X-Gm-Message-State: AC+VfDyBIsL2PCmMdrRnZ949DbjxSBXzVwABEK0ix+7DzwaLuNPG0r/D
	uXPZioJujeorJRlrEHgKCZ6SaHisIpI=
X-Google-Smtp-Source: ACHHUZ7FUf0mEW6nkU9k9HI3dgCpWUulW8WZ5A+txgbl1lj8seObrsTJyhoXi7XDHPXp6QWAZYSdfQ==
X-Received: by 2002:aa7:da0a:0:b0:510:d1e6:56ab with SMTP id r10-20020aa7da0a000000b00510d1e656abmr10020730eds.4.1684776399688;
        Mon, 22 May 2023 10:26:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id c9-20020aa7c989000000b0050b2f588db6sm3124350edt.16.2023.05.22.10.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 10:26:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/8] gdb: enable python PACKAGECONFIG
Date: Mon, 22 May 2023 19:25:02 +0200
Message-Id: <20230522172503.1651374-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230522172503.1651374-1-alex@linutronix.de>
References: <20230522172503.1651374-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 17:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181607

This is required by latest valgrind ptests.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 434ff222ba3..12292f03c49 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -30,7 +30,7 @@ EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
                 --with-libgmp-prefix=${STAGING_EXECPREFIXDIR} \
 "
 
-PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
+PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)} python"
 # Use --without-system-readline to compile with readline 5.
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3,python3-codecs"
-- 
2.30.2


