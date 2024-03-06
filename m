Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4237FC54E5C
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:10 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.15013.1709739728719763300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ho7CPsb8;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a450615d1c4so175348466b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739727; x=1710344527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcHM1JPh5i4P3Svps7C9MuzpNFvHbgYOiWIhfNS4jYE=;
        b=Ho7CPsb8r/yhVKTqzD1AzLCIYu7eux1uyY04t0hmxYPDbUyDrB35No4hfw/zxdpACl
         Jps65t3daPNRFckLH0QfDzVXwZhZb9xB4+lSkWfIk0hxq+3GXLXF6voeSJGzB2flCQU0
         uShBWyt5nSiA1TUwfKJSA9x8Y5zS0OBbsz4UYE+qrp/fAD3UBu5EVVOLBfql9V+SFqST
         vMNr3QvFEIXHQW2et6ZvDbnwB/8+wjFzX7EIkyZgM3YEqq1ribQc4Gl+cdkLmJU1datT
         43u81m1HGVb0FaiKYGSyb1akdr/ymHiYJC6TbVuhpPXuq06MSwnRqCz+hdHBnFOBSUL9
         URtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739727; x=1710344527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcHM1JPh5i4P3Svps7C9MuzpNFvHbgYOiWIhfNS4jYE=;
        b=C0C9ROCk6tF2iEiLSK1SKBkGeMiNf0/RVDUxkflezvxGWfpRKgjYfu4PXKceLY1DJO
         r70oPOHpzx4aRXL+T2XQgvCIPdgyYv1KErdCtt+mTQ2ZBWGlxRRNsjEXft4PeK2db9sP
         w4xHyxplKmsp/QRXqDnRq9Ie/OuO4Ecey3F95LSjNnCo+bF1ZWDBZhm8nWYFmdb+RHrO
         Eaf9jIUB2qG47AWlM2/cZEJ8jCyfjihXZanUP+Sbxp8iycv7Nq03TMNTo97rPhQ93ten
         QrWy+/Eq9pM5JtuaYCis87l2RiUKNghw/jC5iL4mvEZOPio0fwq2pr/ASXFGMMButJAp
         2PdA==
X-Gm-Message-State: AOJu0YxJ/4hXxC121cE8mdzTUZEe4uyLT5YK53QhFWvjku8umIjXgxuc
	hbYjGzyOKMY0YwsqgsNwaljLjAOJb4NagPfVEQYWXju4ZHZ0znveoSS9uZ1G
X-Google-Smtp-Source: AGHT+IETJ56XJlRMOBvAMChkCx+7mL69py4PF/+W4bImkyjTBuMTa+fFT46ojv+CXPZsGWLaWzluHA==
X-Received: by 2002:a17:906:595a:b0:a45:2678:ae55 with SMTP id g26-20020a170906595a00b00a452678ae55mr5834512ejr.13.1709739727094;
        Wed, 06 Mar 2024 07:42:07 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/47] glib-networking: upgrade 2.78.0 -> 2.78.1
Date: Wed,  6 Mar 2024 16:41:17 +0100
Message-Id: <20240306154151.3741709-13-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196696

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/glib-networking/glib-networking/eagain.patch | 3 +--
 .../{glib-networking_2.78.0.bb => glib-networking_2.78.1.bb}   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.78.0.bb => glib-networking_2.78.1.bb} (95%)

diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
index 062fc0191bb..6c2e3c634b7 100644
--- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
+++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
@@ -1,4 +1,4 @@
-From 025bb39dfdb81dd2852deaefea228b197ef3cd8d Mon Sep 17 00:00:00 2001
+From 5604707bed4b4a4bc4658c7158a18c1774775775 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 6 May 2023 12:18:50 +0100
 Subject: [PATCH] In autobuilder testing we regularly see glib-networking ptest
@@ -15,7 +15,6 @@ The test should probably retry in this situation so test a patch which does this
 Upstream-Status: Pending [testing to see if patch resolves the issue]
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
 ---
  tls/tests/connection.c | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
similarity index 95%
rename from meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
index 68f9a2ed783..5060d9fd7a1 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 SECTION = "libs"
 DEPENDS = "glib-2.0-native glib-2.0"
 
-SRC_URI[archive.sha256sum] = "52fe4ce93f7dc51334b102894599858d23c8a65ac4a1110b30920565d68d3aba"
+SRC_URI[archive.sha256sum] = "e48f2ddbb049832cbb09230529c5e45daca9f0df0eda325f832f7379859bf09f"
 
 # Upstream note that for the openssl backend, half the tests where this backend don't return
 # the expected error code or don't work as expected so default to gnutls
-- 
2.39.2


