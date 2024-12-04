Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62065E77174
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:41 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.8149.1733294977715899471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cNe/tYkr;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a2f3bae4so59295095e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294976; x=1733899776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnUftcz0WwUNelk2NsTIeGAqhddXLCnt7RlsuTl0+Tk=;
        b=cNe/tYkr8AwjnYBV7Qr79jKpZqHqnwgvVKxECX89Qz7qslDs73VGGeSQBOiLUc2Xks
         GU/ALzhwy9AY6qhRLqKJyK1Mh/dhrKkGjx5LLDaPYTvJPt28iDy2IN1E7ctbBkVXjQ8R
         yTSoICbdJfDwYvwWzoQgYu3ApKI/KIqpmnAPWhVAYJxZ5K6brZQFzEE8Z5zoU15LQLEt
         GWoIK3QCPfuxTagbNMuKlD071dbBtDbqqotxSaHCv41woCiUr2GWrLn0ftZJlr2ty6hW
         8SNoSnllJudYRfFfrR/Rj+Ov2mqZ2X4/UWOZldYo1FjVCh7mW63DMLrxuaF9AjLJJXY5
         Fe8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294976; x=1733899776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnUftcz0WwUNelk2NsTIeGAqhddXLCnt7RlsuTl0+Tk=;
        b=piTyqwVfPdRw24XzCio+n3chj6rm++AP/iOZGFjGTZNrlj5J7zCCPzPqWPgvuIAiJW
         IUwvnvasWLXV6aRrkvWrKgeqjMOpExFC5w+pziVASl0MRbbYlqXdQI45I+T/1rZatQhh
         60V2TVLLO4U8cu0+01C4UzxEkQLfp9EBi4F2SAX+/TcZASarVFt02fIOitisKXMDQITf
         v6/hlN5Ok67M17nwu+R3mt/gs6vCF+jG6szadFX4APXSsIgAoT4IuVg3YBo4xgpfdbXi
         8jkTePnV64koARl6CTZOUd5/YGqzfe1MKaiUDwh57erSwuBi27KIfc/onFg1dfcNieok
         0lRQ==
X-Gm-Message-State: AOJu0YzkAxuY+4CZsLRiENEo6du0D1a4hFI1iimfj/3qoqpeUXQ4X1sE
	jtyEY0pFe1tlWL0FOyM/2iGwLYf7O7WR/0lYXrwsKU4hblW866uiCUaYvw==
X-Gm-Gg: ASbGnctjAYAygaJe5nW/QXtK4QQNhSPKbYpV1xtyZJNkChdBwcTFG5mp2VUDML7CPrW
	L0RiP2q9s58qAnbnxfh9Vaw8NdeuV9I2Ku4YaJ8yQAgCBkSY+MHsEc4Z8HiNGbhoehzcbtocVMT
	5cpa9YqxuYaA5ip9pODrZJxX2NwCBLaFSwNKbCl7TmyicrjAe6t3L+KcJSPIPItMYZ9q0svNqBM
	VuBLycDU0yD8tyWfdacQEYL3hE+zOQFcZI5ZUYGmWwvzQjbWxrDpfne3ZdZnGqPjk2SHvppY5yY
	/7PJCcvIZqg=
X-Google-Smtp-Source: AGHT+IGTFzbToVrBpwifNtOmYWy8s9CpcdIKsEWaufllndrOrnQpezLuNOzcyM1VWQ8M+uqgfWKyGg==
X-Received: by 2002:a05:600c:3b8a:b0:430:54a4:5ad7 with SMTP id 5b1f17b1804b1-434d09acf06mr38493985e9.1.1733294976038;
        Tue, 03 Dec 2024 22:49:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/37] pkg-config-native: pick additional search paths from $EXTRA_NATIVE_PKGCONFIG_PATH
Date: Wed,  4 Dec 2024 07:48:51 +0100
Message-Id: <20241204064920.817016-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208237

From: Alexander Kanavin <alex@linutronix.de>

This was prompted by working on librsvg update: the new meson-driven
version wants to query values from .pc files residing in its own
build directory, and modifies PKG_CONFIG_PATH accordingly.

When using the pkg-config-native wrapper such modifications
have no effect, and we have to pass them in manually
from the recipe via EXTRA_NATIVE_PKGCONFIG_PATH variable.

This variable is already defined (with an empty value) and
appended to PKG_CONFIG_PATH export in the native class, so this
simply extends its use to the wrapper.

(Appending to PKG_CONFIG_PATH in the wrapper, instead of resetting it,
is not an option as that can lead to contamination with the cross values).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in     | 2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
index 9ed30a0d800..fd5ab6b1fab 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
@@ -1,6 +1,6 @@
 #! /bin/sh
 
-PKG_CONFIG_PATH="@PATH_NATIVE@"
+PKG_CONFIG_PATH="$EXTRA_NATIVE_PKGCONFIG_PATH@PATH_NATIVE@"
 unset PKG_CONFIG_SYSROOT_DIR
 
 pkg-config "$@"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
index a9324de4cf3..d4bb4f8c06f 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
@@ -1,6 +1,6 @@
 #! /bin/sh
 
-export PKG_CONFIG_PATH="@PATH_NATIVE@"
+export PKG_CONFIG_PATH="$EXTRA_NATIVE_PKGCONFIG_PATH@PATH_NATIVE@"
 export PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
 unset PKG_CONFIG_SYSROOT_DIR
 
-- 
2.39.5


