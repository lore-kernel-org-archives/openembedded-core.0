Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1BEC46CA2
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:26 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.57788.1702626737558593933
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JkzTqojP;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-552dc0d0e28so35084a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626736; x=1703231536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b08LZk3KZ+sh3WTPnWKv2q1t71OL9GMuTI2J7QNCtZc=;
        b=JkzTqojPst33xfEfmvOiDc3QTbyjNrerej5qWrZiDohI/dzHdqnBM0ProRUVB0oqwS
         pEk81a9A0jWWMS3MghVhKI+YVAEFApPDexYgjj49GUtOaA9qqbA2cBSeDU6VgGpwr2Hm
         ak/g1YuZPqJbaNztyV85XoHkbtbIERYzRgQdT5iCERds27PnY5woOeEVhpSfuQaAb5rX
         TeaVzyMByNuf6zAlY8l2aDgbO68CzJrokNgOhSgc3JimKFeKp/pTWQjlz+KY6WVsXwNq
         NArgILnElYRMrCBOAB+mzALtFlLEaUAQx6AUORMx/giOLmI43Ls0zqZ2XWLTe+Kf4D6d
         I4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626736; x=1703231536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b08LZk3KZ+sh3WTPnWKv2q1t71OL9GMuTI2J7QNCtZc=;
        b=ZqWLjNQ1ht0sF/hdViqIJhctBCcwy2qERuhjxeb/R1NmolmhKb71RBYftYxZSJ5JGZ
         QDGuFzDZ7pKJhEOLIdnyLuvEodzYMRm5EEosISMoxLFwl803DdN5ceWjrgxYr+EhCzD6
         HR2rReewbBa2i7O5szp3wRwLiU/tx/P9ra5lIxIWorjrJeQsdhmE9C2+URq8jFJlxsrR
         PepVOXhXTUkBUZbkzIN08Al5LTFl16ivjveZoPhnfF20SYrUhHhjlVMLX4+JNssUHm5u
         AmzVdCVOH5PGJJsdF4C98qYtKnzzhuYTkf9oBavRiXnsjNMlAHUyYNLlSGNkOoDr3eip
         +3sQ==
X-Gm-Message-State: AOJu0YwNlvOPAcGuhi7nzD6VTfnKq0IQpcesKQJm4We1Sm8Bmew6uQA+
	EicYDeZfnGMdWx7f5AOtwcUM1a4EI0I=
X-Google-Smtp-Source: AGHT+IE/STVxa7OgEIorvtp4b8rR2mM2vxZogXPf9SVXFZP3eSpIFYT/yzs4EabeAeRRO5HYH69i3g==
X-Received: by 2002:a50:9992:0:b0:552:d60d:d7e2 with SMTP id m18-20020a509992000000b00552d60dd7e2mr113977edb.8.1702626735830;
        Thu, 14 Dec 2023 23:52:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bt13-20020a0564020a4d00b00551d6d51401sm2961885edb.53.2023.12.14.23.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/10] dnf: remove obsolete python3-gpg dependency (provided by gpgme)
Date: Fri, 15 Dec 2023 08:52:03 +0100
Message-Id: <20231215075210.3049785-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075210.3049785-1-alex@linutronix.de>
References: <20231215075210.3049785-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192415

As of https://github.com/rpm-software-management/dnf/commit/8806b2ee99a322c7201239a1cf14d191c87e152a
dnf is using librepo's crypto.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/dnf/dnf_4.18.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.18.1.bb b/meta/recipes-devtools/dnf/dnf_4.18.1.bb
index f60b4794a60..bc79db05c9a 100644
--- a/meta/recipes-devtools/dnf/dnf_4.18.1.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.18.1.bb
@@ -52,7 +52,6 @@ RDEPENDS:${PN} += " \
   python3-json \
   python3-curses \
   python3-misc \
-  python3-gpg \
   "
 
 RDEPENDS:${PN}:class-native = ""
-- 
2.39.2


