Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76605C25B6B
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 22:37:22 +0000 (UTC)
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
 by mx.groups.io with SMTP id smtpd.web10.187327.1698273434078738076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 15:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20230601 header.b=FQvDU8z3;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.201, mailfrom: 3mzg5zqmkaoaycmiqqing.eqo@flex--wak.bounces.google.com)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d9cfec5e73dso204429276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 15:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698273433; x=1698878233; darn=lists.openembedded.org;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vjiZrWVV19fBqEIaXsVn3AO0BOrCE8Les9Oooq9jrVM=;
        b=FQvDU8z37gmQt1Bgi3QzPPOCu5Ojn7WtqzIuCUc3m9F19ARhFgHkqCbk++v0MZRqwE
         56tatZkuMg5EKX1TUo5dFCyUVvR+dFoSdSIg/cZDryG2zW633gdE8XIu8fOWJ0J3SY+f
         vtUG+gMjvq3DQBck30oWcI6C3HEJDahoIrWQ4Vx/8skwU49rwyP9A6U0DzSJl3WHWZus
         OFfL2xyZhmausF8DLNP6LzxsBTz7Xmz+/NxUTylTeaTZXj6Gh6AdfZQhKJqT7oVWGm2E
         NgqpA1f6m/B+anqq+zijIoMuJbrs7XsmpEUTjDaNlhF9rBJfv7fBwZXACDOs9f/QHa4W
         LfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698273433; x=1698878233;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vjiZrWVV19fBqEIaXsVn3AO0BOrCE8Les9Oooq9jrVM=;
        b=lvkeXuhDoBRfU215PfM0DYJc6KWK4Y4Xu7E7vAZLrg73wTY8vMBml6rpK9bQTsh2cC
         I5fbB2BERfVIqmU3M7N43qEQoAJBXQ2H6pRunG0ORdvLD7gZirLQKU9TsoA4Byl29Dwq
         EcYWXaMwRG2pR7z5Lru2Sz4qYkYZlC2iM7vkAq/Vf1Q+VLrICWOplMXJMGSFLOjcL+Yl
         8ttW4WmvLuNWoD+yTGlkOyGU6VK6vVGA1AuEp/wSCIVnCVbYtQKBMAux7Oc8ttGbQVWz
         G7Za/kQSxVV7KXangFtyR6P6dLSASkra40dsmqI9/9I1/jJEvoXACxMWkc3w6IDV8CKk
         UByg==
X-Gm-Message-State: AOJu0YwlT8ygBe3NWQrAwx7IUJgqC859JV74PokUY9oktmrCAi9cLY7A
	HhkBt6Bgas9tLoW/n39J/YNSmKtx65B6aiS8V4FP1c6+mMKr+KCDXbOR7hNLnmGBmwt9DGwAr1C
	0RHu7THjCeazPksUEI7b31wO1B1O8fWeum8nQ1urXe7BXPtKHkAcQTuNVlKjdLpTdjQTcGoM/Vl
	GcqA==
X-Google-Smtp-Source: AGHT+IGLJpv/7wCbjGLF1intJRGhyn6+LP/46sOWD8Vjoy5uybGalV4hsJ5l/sSGNex+GeoeBXahByM=
X-Received: from wak-linux.svl.corp.google.com ([2620:15c:2a3:200:dbce:15f9:6010:6e6d])
 (user=wak job=sendgmr) by 2002:a25:ef45:0:b0:d9a:58e1:bb52 with SMTP id
 w5-20020a25ef45000000b00d9a58e1bb52mr331968ybm.6.1698273433191; Wed, 25 Oct
 2023 15:37:13 -0700 (PDT)
Date: Wed, 25 Oct 2023 15:37:10 -0700
Message-Id: <20231025223710.93502-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Subject: [PATCH] kernel: Commit without running hooks
From: "William A. Kennington III" <wak@google.com>
To: openembedded-core@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 22:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189694

The hooks are pulled from the impure environment and are often broken in
our environments. There is no reason to add extra metadata or verify the
commit message as its arbitrary to turn the tarball into a git repo.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 4ac977b122..cb9cd26b09 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -408,7 +408,7 @@ do_kernel_checkout() {
 		git init
 		check_git_config
 		git add .
-		git commit -q -m "baseline commit: creating repo for ${PN}-${PV}"
+		git commit -q -n -m "baseline commit: creating repo for ${PN}-${PV}"
 		git clean -d -f
 	fi
 
-- 
2.42.0.820.g83a721a137-goog


