Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5524C5472D
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:51 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.9399.1724319345670752405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=feJjGnmJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-58ef19aa69dso761724a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319344; x=1724924144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNmn0XjLs2h7b5KdtXWybSN1G1InH6AtK7BauA7vnAI=;
        b=feJjGnmJXhJzmGBf8b6TKCcl+6y9CDu/mhVK2kfgWD98R+HlaS1cIN/9TmMJLfyYoL
         cdm9edbWhgyhF/lFezVEcm4ov406WuEnpMNf1pqx4Grw4MMtpb5NKAN6RWieF27g/iSk
         Jw9khOCFsuM2Xcu4kxGgJeoWqP6Nk2q028SUqJAkfPdEosDuANZG4e+Hx79dGnEEOOWh
         vFnCROW54w0yRDW5FmqJqod5LxH1wrI7SvTCr7TshGvY+yZkx86lvwOivzn7Z9vkrV9S
         9VYqw9t2W5DzBoTrMkuTmpZ6i8X+VDQtL5KeL5pbsedTz+pM+zA+c7umBSZlKMk9ZrEW
         byag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319344; x=1724924144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNmn0XjLs2h7b5KdtXWybSN1G1InH6AtK7BauA7vnAI=;
        b=enQvuWDrIrdbWPpqv7HX5H2p7fQRo7efjfMGTKF277XrLmBgqiVXzQlvXirDxI4rC6
         nMbX7vDcFoYEIXPB/cAX2+6sBCCrCHHKVx+rAPxKgf35n+8tAZjxl0jBln3/2QX7RbOk
         3hZ/vfNJE3dOWf4VwHUELUVsRoOj3sRs82A00Gy4KLayPhYgJY7TJApSmjdNs16VeMPd
         JO4gCODi1GdUQF8fuL4RRVbPTCeJDG3vUHHXmbvFVraVPuXD0nKWZGjCK62t3HTv5/l1
         plNc2rHrOUB6GRNfx5AENgDrfBw0u37ZiuE1pxbVTUvJ5BcemcwybbdXEankaib7bGMQ
         7ZlA==
X-Gm-Message-State: AOJu0YztnQaBm4Ueca7mQJtwi/77IXZbuMRQLo6XsagL0KiZGgIqklUs
	tlCbOaHPLNANMCJXp+9htBIDmgKxXfuie5SqCeIPiExtdjHnVnyF4i8EXQ==
X-Google-Smtp-Source: AGHT+IEpD7LRGdRAlYersC2O+eKkT/HujphvULrMBfw9F3MwObnwVTJfb43r3Q3qi08vBhQHLQIe+g==
X-Received: by 2002:a05:6402:50ce:b0:5be:fdc0:e704 with SMTP id 4fb4d7f45d1cf-5bf1f0d7ce4mr3195414a12.10.1724319343824;
        Thu, 22 Aug 2024 02:35:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/32] weston: upgrade 13.0.1 -> 13.0.3
Date: Thu, 22 Aug 2024 11:35:19 +0200
Message-Id: <20240822093521.36790-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203644

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-libweston-tools-Include-libgen.h-for-basename-signat.patch | 2 +-
 .../wayland/{weston_13.0.1.bb => weston_13.0.3.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_13.0.1.bb => weston_13.0.3.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
index fbec9f9d4e5..2a833ee973c 100644
--- a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
@@ -1,4 +1,4 @@
-From e050830898ea37d30ef1c5339cb1665bdb92dcdc Mon Sep 17 00:00:00 2001
+From 1a2a87013eb6af8e5267ecaf61e17b65a31dc662 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 14 Dec 2023 09:13:54 -0800
 Subject: [PATCH] libweston,tools: Include libgen.h for basename signature
diff --git a/meta/recipes-graphics/wayland/weston_13.0.1.bb b/meta/recipes-graphics/wayland/weston_13.0.3.bb
similarity index 98%
rename from meta/recipes-graphics/wayland/weston_13.0.1.bb
rename to meta/recipes-graphics/wayland/weston_13.0.3.bb
index eae13e1c215..e4843d38f71 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.3.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "ea1566ab4f5ffce7e9fd4f7a1fca5b30caae4d50023bf459213994094e02b29a"
+SRC_URI[sha256sum] = "27f68d96e3b97d98daadef13a202356524924fa381418fa6716b9136ef099093"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.39.2


