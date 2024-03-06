Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1C1C54E5E
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:21 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.15033.1709739738104871388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NNSJi2BB;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5645960cd56so2808572a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739736; x=1710344536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6/qqMcSG2wsTm75P2kyFNnoWXctr283JP9lxUq8F54=;
        b=NNSJi2BBE9C+KNu/DBvqgzWgbHVvm3XuBKXZRPRD6xHveRiesCLWDvJuZvlMLcXS33
         0aMxubYaRu0q2wreocVS51Yqo1SIRqo88nByVYHOpTHIkvAYVt0B+SiLTlNuQwPC5kXg
         Bwp556fnfc2W6JUIq3hIVvy9XQEMf1jaXEmmQoCuAkOOG+hnlsdR0Eh031YBO4hKZO1b
         to88n+wg0syeFBydBomw0GeD/Wttm0NPTsEic/8263CBYHL4n8MIvwci32vO7ElxSkBo
         crN67IO4oyRohgan25Ugj5g84upyJE1iYdZMDHbUEcVokqVUUJ0AHa9f7XgKSyHRt0Sy
         UNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739736; x=1710344536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6/qqMcSG2wsTm75P2kyFNnoWXctr283JP9lxUq8F54=;
        b=QRwEB3V1XgeBICLdNV6Nr/Q60UsDQgiKq43B06K/FRhZC1eJudUxQVBva/lIq8FW5j
         W22K0qBeaHtq7L2TTYbBh6f2FbxP9HnMZGJwQnZYm1NJ7PN068EN9d5UISHP8h/rtR1j
         5EGDEREnIzsxl5IFXe8hUKYuhYmtFqqxshlyfLRvGJceZDJXoPAzgRX8mypXZXyT6uJT
         OR96xIRY4wUci/aTCZlMcrDMHTvtY3Ln7yjs9XnsU6B8kvJQdsbLs3+vT4Vc912LSeo7
         T2MoqHnUBYA2swX4SYCu8U0adcj0bWHBtor1WGY8KBiZC5lksm6lP1R3jMC6C1nJUc+5
         GTGA==
X-Gm-Message-State: AOJu0YwUI3Sm135eVODFoGrhoU2DjgDkAC3bvxiL/fRZ61u2Whnix1cO
	571TgY5/gHPBpWXAbrI6UbcqbihMqQGHI6UNvm0lmRgxsTk+nIGbiiGDK0IA
X-Google-Smtp-Source: AGHT+IFoNiM9Icpr7c9Rp+RkulN+FhLZ+HCxpreyM+P1guISJ78QQ1qlrqSl2j8Pp5QOsFsEJ+SqqA==
X-Received: by 2002:a17:906:3c13:b0:a44:2563:c5dd with SMTP id h19-20020a1709063c1300b00a442563c5ddmr10157463ejg.45.1709739736442;
        Wed, 06 Mar 2024 07:42:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/47] nghttp2: upgrade 1.59.0 -> 1.60.0
Date: Wed,  6 Mar 2024 16:41:33 +0100
Message-Id: <20240306154151.3741709-29-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196712

Drop patch as issue addressed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0001-fetch-ocsp-response-use-python3.patch | 27 -------------------
 .../{nghttp2_1.59.0.bb => nghttp2_1.60.0.bb}  |  7 ++---
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-support/nghttp2/nghttp2/0001-fetch-ocsp-response-use-python3.patch
 rename meta/recipes-support/nghttp2/{nghttp2_1.59.0.bb => nghttp2_1.60.0.bb} (79%)

diff --git a/meta/recipes-support/nghttp2/nghttp2/0001-fetch-ocsp-response-use-python3.patch b/meta/recipes-support/nghttp2/nghttp2/0001-fetch-ocsp-response-use-python3.patch
deleted file mode 100644
index e4db09638f8..00000000000
--- a/meta/recipes-support/nghttp2/nghttp2/0001-fetch-ocsp-response-use-python3.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 73ec79432fc557a8be4f1500982b1c0f5fdf12a9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
-Date: Thu, 7 Nov 2019 09:58:52 +0000
-Subject: [PATCH] fetch-ocsp-response: use python3
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [oe specific]
-Signed-off-by: André Draszik <git@andred.net>
----
- script/fetch-ocsp-response | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/script/fetch-ocsp-response b/script/fetch-ocsp-response
-index 0ff7461..185116b 100755
---- a/script/fetch-ocsp-response
-+++ b/script/fetch-ocsp-response
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- 
- # nghttp2 - HTTP/2 C Library
--- 
-2.23.0.rc1
-
diff --git a/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb
similarity index 79%
rename from meta/recipes-support/nghttp2/nghttp2_1.59.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.60.0.bb
index fa0013ca9c2..cf62c32d8b8 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb
@@ -4,11 +4,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
-SRC_URI = "\
-    ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
-    file://0001-fetch-ocsp-response-use-python3.patch \
-"
-SRC_URI[sha256sum] = "fdc9bd71f5cf8d3fdfb63066b89364c10eb2fdeab55f3c6755cd7917b2ec4ffb"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
+SRC_URI[sha256sum] = "625d6c3da1d9ca4fd643a638256431ae68fd1901653b2a61a245eea7b261bf4e"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.39.2


