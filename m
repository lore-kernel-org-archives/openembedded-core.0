Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F8EEE14C5
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:56:52 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.4185.1694019409783907352
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iu+UgoHE;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-522dd6b6438so5276502a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694019408; x=1694624208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnYXivJ9Op8tSJIJKcPemLVEOjabX5VZc+OLfF3EWHQ=;
        b=iu+UgoHE3CZO+8eG+1/HfQeQAXlDBc0zYJI80XAK6e531m6YHZ9tq+XhNz14PWWvff
         KQeyXTlfCY4WRTyJHfB78nHWNmNegxOHvrrVxRkf/7u2Hh+mhIokF56cqMqg1CAnX7EG
         3h5euGRZVxgmhsBr1fRmefoD5LRM5AHVICJyI7nSiVuzn0AHOVD170I+fpQzp6zfygQS
         FxTw+aoUx6WSPRkNKzH6m3ljR6EG5LRapOCrhYqYRizU/72pbx9dDLNjuFDoUKal5BOl
         cYElgWf3NkK25S4xLQiZkCJSmB/ukcTIGzIPFHEHrWE7AdfuP228QHz1ssuEB0y5PDVQ
         UwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694019408; x=1694624208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GnYXivJ9Op8tSJIJKcPemLVEOjabX5VZc+OLfF3EWHQ=;
        b=BbpQiUfY6oBG0jeOUqO6nsfbPX+O6aH4YmVr+HeMPAxA8mj8JvWQtD0xy5V/dR1yF3
         fYM3T5+STb+1meO44IT3FoCJkQxzESY5PTyt5o+rpSwcLvuQ9xHanE6KzfjiwvG6MH2e
         oojybpCKci6KQvqe/7h4xK/srO3Q0+T52n5IFBL9QQq1v0tpgRxaNTsdueRLt1+j205K
         D4WZs5zYdNx/hdV70NDeC7Dzv3hZna1nFlxbID03pAuoc+1CAxZgnstqXZDemiRk7SWL
         FeODFO5X6eZDnBmGJF22kEKQQaiVNYO1XEOBevkONrIRrRw8JnQykAVFo1k2OtFOlTee
         uN9g==
X-Gm-Message-State: AOJu0YwV01iY8lRanke4pnbldMh1bvcf8Zu+2gnEVF9wSiBgXroHwPyB
	iVq1SRHKSO1Mh+j9nG16Y+NH8BGRJ7k=
X-Google-Smtp-Source: AGHT+IEd0RJ4GeBmiRtkLZr7NJ7jwZtvPeuksI/4e23UzIlGcyRSv93a50ekbnwoAfCKjLwSjwgIJQ==
X-Received: by 2002:a17:906:1096:b0:9a1:da9a:f1c2 with SMTP id u22-20020a170906109600b009a1da9af1c2mr2827789eju.11.1694019408260;
        Wed, 06 Sep 2023 09:56:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lh7-20020a170906f8c700b0098e34446464sm9284848ejb.25.2023.09.06.09.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 09:56:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/17] gnutls: update 3.8.0 -> 3.8.1
Date: Wed,  6 Sep 2023 18:56:29 +0200
Message-Id: <20230906165633.2382629-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230906165633.2382629-1-alex@linutronix.de>
References: <20230906165633.2382629-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187335

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/gnutls/gnutls/arm_eabi.patch    | 12 +++++++-----
 .../gnutls/{gnutls_3.8.0.bb => gnutls_3.8.1.bb}      |  2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.0.bb => gnutls_3.8.1.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
index 2b61a703cb1..fe3f031fdcc 100644
--- a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
+++ b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
@@ -1,4 +1,4 @@
-From 911213d9f72ddce468322d22d223127b93964409 Mon Sep 17 00:00:00 2001
+From 5810d97281bb30edb786de9946e5c13186eff6a2 Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Wed, 25 Jan 2017 13:52:59 -0800
 Subject: [PATCH] gnutls: account for ARM_EABI
@@ -9,16 +9,15 @@ reference to them.
 Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <jslater@windriver.com>
-
 ---
  tests/seccomp.c | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/tests/seccomp.c b/tests/seccomp.c
-index a3148fe..443bc5f 100644
+index 86442a5..03a5aa8 100644
 --- a/tests/seccomp.c
 +++ b/tests/seccomp.c
-@@ -52,7 +52,9 @@ int disable_system_calls(void)
+@@ -55,7 +55,9 @@ int disable_system_calls(void)
  
  	ADD_SYSCALL(nanosleep, 0);
  	ADD_SYSCALL(clock_nanosleep, 0);
@@ -27,4 +26,7 @@ index a3148fe..443bc5f 100644
 +#endif
  	ADD_SYSCALL(getpid, 0);
  	ADD_SYSCALL(gettimeofday, 0);
- # if defined(HAVE_CLOCK_GETTIME)
+ #if defined(HAVE_CLOCK_GETTIME)
+-- 
+2.30.2
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.0.bb b/meta/recipes-support/gnutls/gnutls_3.8.1.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.0.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.1.bb
index 1e3f34b6c53..455031dd474 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.0.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "0ea0d11a1660a1e63f960f157b197abe6d0c8cb3255be24e1fb3815930b9bdc5"
+SRC_URI[sha256sum] = "ba8b9e15ae20aba88f44661978f5b5863494316fe7e722ede9d069fe6294829c"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
-- 
2.30.2


