Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CE0C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:17 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.91597.1701080289847488069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZsYI0Zqm;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a00cbb83c82so574548966b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080288; x=1701685088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pG1nHG6pdORPEJ4yq+LuZ7VZ1pErwS4R8FnMvfUzCkw=;
        b=ZsYI0ZqmuXxDLUAYuhXkJ3SgVzzvh6t479LgNOdVQA5wuYQK7bzYDxYirtqtqd1lhj
         8DHMqlRnYD/RNASiP8PgMeqqv1gNgCHy936aF62AjiLSx53dDzTKaODeGX4dxmx8/Jlb
         BYvBKlPhEFj8WXWTKcYC5KqOpGWgfqVTAR0fmmAQgFOcI8fKE8ov9kDIwPjm0gXtwlDZ
         1qX5SugiykoGpnWYPIJhVkzf+YQU4bZamUU89K6zszGXFnEBKFoTbJUd3yDQIi95aObW
         eDm4VJ3ax04MViy8KIsmz5ZmPtYGmhNuFzFeB7BXFKKRbEMZTXGj7GR9+2RWCHbmUhX/
         jD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080288; x=1701685088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pG1nHG6pdORPEJ4yq+LuZ7VZ1pErwS4R8FnMvfUzCkw=;
        b=DTGoGOJccpQCTIJJ09tvQoT6VIlSFNZIu08q+VlvCLMVWH36L4HwXvsq3lrEGHkny8
         xO3vJiWHZH3GBdRcKgi7ld1/crvxN3FdjSSw9UbDMjCjC+ODrF/m0KUzjah8lr0U3uDe
         sxtFb1haZltTp4/n85vonllEo4sPOWJKt4exu0SqK0MdvE6z7EIOPkZk14vzvKxRTv4X
         wZngmn1tU4WUF967cYPWUO3tbrbAr+0Kyo6g8lcFhrzgxobtTjYs7ik27+YgVoR7gu2c
         0i3cClbGOr5ZesdBBNVuejQvZMpatBrZrUp/xtiuanAzarL1aF9Vdk/I+QjMUUmlwfnU
         foJQ==
X-Gm-Message-State: AOJu0YzVDSGfOI3pZQCt661CYNHvykiHpS2aWneSowiWs9DAlScYiOHN
	kHMdJjim/cXc3tYRuKuhlYcT06IoVhI=
X-Google-Smtp-Source: AGHT+IF+Cs59WKVlo73XJiWn5mwkCJO1eVuPD4lFFMf2EyGex6/P56L38DchJO35wdcVqlBmy+ZnBA==
X-Received: by 2002:a17:906:856:b0:a00:2de3:73cc with SMTP id f22-20020a170906085600b00a002de373ccmr6557353ejd.69.1701080288230;
        Mon, 27 Nov 2023 02:18:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/19] glib-2.0: install gio-querymodules into bindir as well as libexecdir for native
Date: Mon, 27 Nov 2023 11:17:48 +0100
Message-Id: <20231127101751.3187950-16-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191283

Latest meson expects it there and fails if it can't find it; meanwhile
we patch glib to put it into libexecdir for reasons of avoiding incorrect
debian package renaming in multilib scenarios.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/glib-2.0/glib.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index cec06b2f88e..fbf3a39b15f 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -113,6 +113,11 @@ do_install:append () {
         mkdir -p ${D}${libdir}/gio/modules
 }
 
+do_install:append:class-native () {
+	# Link gio-querymodules into ${bindir} as otherwise tools like meson won't find it
+        ln -rs ${D}${libexecdir}/gio-querymodules ${D}${bindir}
+}
+
 do_install:append:class-target () {
 	# Tests are only installed on targets, not native builds.  Separating this out
 	# keeps glib-2.0-native from depending on DISTRO_FEATURES
-- 
2.39.2


