Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71599E77177
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:41 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.8171.1733294972732745083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mS7sWBFr;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434aa472617so52666685e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294971; x=1733899771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNOcUhfbPpBbx0ZzlXLCy9BRSJWaTf5vx6mirPDelX4=;
        b=mS7sWBFrIkT1QUlAqhrU/TWCKN71KXW8t/fAUoE4wvy3KGVqjD4RdO7HOwH8r08Sxc
         3mA7r9u9vNFSOj2UMBcjYOnQq/vXJVP2UHgV+lxLJXBoS6K6993C1lqvW6omzxMhcWeu
         eiLzGbkMu2xxJQeG0txVybHCLH2pNh9a/nvz+YjjlGypFd74VZt7F/L5AIjyAJZCWVaB
         KmREPyMEygXL27X5cRV0X9dqlXQBGaQ71+ml+hyi7wUKlgAUrwb1Qb8VbUKp+e9caZHX
         nWTqmLs9WZ4WXghMMPJhFCjOensDBrCusIrOEOsx6VafAguZrdQIst+454iS1V5G3lAp
         ISLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294971; x=1733899771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNOcUhfbPpBbx0ZzlXLCy9BRSJWaTf5vx6mirPDelX4=;
        b=kZjg4+vE/0AKRy0a5Bnwzj2SH2nYEEiIyAY1xPBQP75AIzHjuvldfMQj9bW9Q2uyfk
         Z/aAtbTAA5DqLbNG4tlFBwE6M22s3XjJUsW6ZTzK6y8ULpTFdFvj/OEtLs0p3KAi6Rxv
         ma7nPz+WjsKClI5ED9xrK2cq2uC6N6uwh2e4P4wC9jvOXf2WW5BZF4GLnc+Cexypnx30
         IaTuWDYyUzPYdS/7XQDYmX2JN9YN7k7eRw/nxrtbzndiNvI12bJfo0jQ7SCHxEu11paU
         capec4rwyQ65G7KfXzDKZRwFAuA5ImfFzh/N+Hp6xr9DvuckCuaMO0r7wZejyS2sl7gI
         2ZMA==
X-Gm-Message-State: AOJu0YzhOMPokW8OTJkN33pD1KeOWDoHvMwyqRO1IRTkmXtT5VoBNivH
	5z6hCW/BnBiMvY8H5RUv1Tn+50UZxq7veN72FBnWqEIMAo+yLR+xsBf6Rg==
X-Gm-Gg: ASbGncvTYYcJPLAb82I5Gcqany93h6XfhkMS3gBpy6Vp85LriCDDM4869bKh5me1q9E
	IcuAualdD8xg/rl2H3hfYb27oKbscc73wK7CV9SGByoyBtvWydlzPJ/HwJZ1kIx7vXIuCyIHV7j
	QwvPbdmuRf3L7NqkOaZOi4BMsUeUHcaXlOkClhtVhKiC0/dxe8npbhIQ4k5Fe//GFYEe0LI8v4z
	+clYHPl/nE+srdSGaOSUHbCDs8i7TKpzZV9J4vQIAJsvDnr/X9L+3xJK9UsOQZRVHYiSr8CoHc7
	DOdvfJCocLw=
X-Google-Smtp-Source: AGHT+IGtGG590sPQVzF2q4ksg/9Rth5nPsM7e6Ebq9Tw3ff6fzLjFcrpajYf4CYxvEEzUhA7ZbUuPw==
X-Received: by 2002:a05:600c:3ba5:b0:434:a83c:6a39 with SMTP id 5b1f17b1804b1-434d09b147fmr50342265e9.3.1733294970957;
        Tue, 03 Dec 2024 22:49:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/37] mtd-utils: set PV directly in the recipe filename
Date: Wed,  4 Dec 2024 07:48:45 +0100
Message-Id: <20241204064920.817016-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208231

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mtd/{mtd-utils_git.bb => mtd-utils_2.2.1.bb}                | 2 --
 1 file changed, 2 deletions(-)
 rename meta/recipes-devtools/mtd/{mtd-utils_git.bb => mtd-utils_2.2.1.bb} (99%)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb
similarity index 99%
rename from meta/recipes-devtools/mtd/mtd-utils_git.bb
rename to meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb
index 3545f8e4262..5ab5f6c7298 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb
@@ -11,8 +11,6 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
 
-PV = "2.2.1"
-
 SRCREV = "13ec33609213c1dbd75852a09560a707a7f19a5c"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master"
 
-- 
2.39.5


