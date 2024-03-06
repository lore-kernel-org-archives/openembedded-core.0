Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694ECC54E68
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:21 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.15036.1709739740376979712
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VeoivzyX;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a458b6d9cfeso378720066b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739739; x=1710344539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08ukwjcRy0gmn7Qhos/3Mz4TuoFnX1x90MCD9uRzrLQ=;
        b=VeoivzyX/5nG4qIiU+FLztEZPSapir0Cz8ZurMgHnZp/UWUIYonEevGHgY/2bP38hk
         hsAU7OSYYQi9MS9iXfX5zY7rcs/5rvgRaEPOn4Qu9TrcoN7Lep4qVvC5e3NutD7F4aZE
         Zh3JRWiDxGX2cV+7vvm45VY7sDqBotuX330rWA9YJwkLVmbUimp93QtZPkRHTQWIorTT
         rzUCtxJawzGC+b41dEt0NicGHjVD7Cg8fySAtcY0JZvkAHgBCct83JvfjujrPe3/CTJ9
         gTEB4c7shdAa4SS8iz/gqSSrsjsmIUVW5MWXLzA2EuhxWGXjJ3hN9g0pK/RDzAJmHDPz
         3SaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739739; x=1710344539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08ukwjcRy0gmn7Qhos/3Mz4TuoFnX1x90MCD9uRzrLQ=;
        b=ih8nARh6WzSF7uIDa82UtpPAnhDP0BpXvSTfb6gy0t9NTS6tjxuTFXVc7IAoItbufE
         m0DM8cG+QkdWdWusoOsdqg8/FtB8ewoRv8lcj1Qa+C9cEUR56xsuYF+2Fb08DqhJdqdt
         duMUvXQWwo23D/RNPYAH5iw8nufCGNSXHW4Zl/55a0qBAxYxe7p7PR2YrLWm7k4aMVGB
         CNw11xgXJzyc13pFWgFvTCSkSAS7lYcK8/90XP/HBsyO2sDXSirtG/Q0CYaXHYCVz3/m
         S5zpxJdoKb0BdjPl7YO2EFNurKtdCFRI3OqMSgMK9FIwx+cVai1HNMAxvSytWFNTyxKb
         3SxA==
X-Gm-Message-State: AOJu0Yxz9CBaenbfHR1dt/e5Oalf+vAO99yuN8v9P++/iAld5pxPu0G0
	FaqUL+/uLe37Si2V2OYcWN0cukk3D8jBqXx8Awn2UD+rYE35up/9DWpLtHVA
X-Google-Smtp-Source: AGHT+IERO6lF4G/uP7DHKK5z9b40Noq9R9UZ+XZ0ffshHX5v21dsSH7EHP/s5+qZAK6I1chhlCx4qg==
X-Received: by 2002:a17:906:d7a7:b0:a45:5451:1f2b with SMTP id pk7-20020a170906d7a700b00a4554511f2bmr5822015ejb.24.1709739738715;
        Wed, 06 Mar 2024 07:42:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 33/47] python3-build: upgrade 1.0.3 -> 1.1.1
Date: Wed,  6 Mar 2024 16:41:37 +0100
Message-Id: <20240306154151.3741709-33-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196716

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-build_1.0.3.bb => python3-build_1.1.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.0.3.bb => python3-build_1.1.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-build_1.0.3.bb b/meta/recipes-devtools/python/python3-build_1.1.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-build_1.0.3.bb
rename to meta/recipes-devtools/python/python3-build_1.1.1.bb
index 2d8faeff259..7fc3eef91b9 100644
--- a/meta/recipes-devtools/python/python3-build_1.0.3.bb
+++ b/meta/recipes-devtools/python/python3-build_1.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "538aab1b64f9828977f84bc63ae570b060a8ed1be419e7870b8b4fc5e6ea553b"
+SRC_URI[sha256sum] = "8eea65bb45b1aac2e734ba2cc8dad3a6d97d97901a395bd0ed3e7b46953d2a31"
 
 inherit pypi python_flit_core
 
-- 
2.39.2


