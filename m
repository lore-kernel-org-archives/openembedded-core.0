Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11F7C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:43 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.4794.1642588903232909652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QQXeHo3e;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id c2so4513648wml.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dFoROwil4lsR5085OBxaan8DqFE8YEgef1UBEUKQTLk=;
        b=QQXeHo3efi01BncbZ5tL5s7aCTyKvX1kWyhURCQvJDPT6SzDxLh6huA+9ol01KmPs+
         u+Qn8EzpAtCPFyNk472L5eVNJiZT5OdqgEiKAXvP4c+0iYtdT1tz05Xm+1tDnuTbRd1w
         6ZnhCRqks/LWy7xQ2HbnL7G2y213I23YWT/u34OtgMDjGdN7FKFmInJyOs2dSxD+yvOO
         1snNy/zgiYVq+D/L0kQwMDb/gDfUvLyztWeA7sR7hQFCn6bC03i+SWJTBxHkalggowk4
         cVVyd9fSIZE0/UP5j04nNkzJk4wQPX15g8Mghhx7xk2v4Ik5/L/XVs9qYj+OT/WsSzDR
         IzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dFoROwil4lsR5085OBxaan8DqFE8YEgef1UBEUKQTLk=;
        b=TNhysqDAIDbkn0MVGiitlxT4exaEwbi5ww9edWSlMtS76VvDgPV3RsjRJ6CMviNVFv
         NmXHEkHPkvUwFg9Rq6LmYrylFXyjBRIc+9Sl9tzuXvnyXGKNnJhhoxkzAQuCGwfWYEIR
         r9fVkjKWAKgD8FMIkWHqBmRXX+ljqO+5LJOBGiLkOaxzfe6BMT7ru3iEm625jDObeo3N
         0qe5efeeBUqUBwkbY8SffjPQXp9pcrBBfIVJwF4m3EqWQu/T5Zsprzefd01LGLMlTv8V
         d9SqjElC7M+vOEFXWEVBX9+cnax/p3+ohnySJZ3OonvzJnGK/k0Dhv902cAJ/w60X9q4
         oHNA==
X-Gm-Message-State: AOAM532/rRTrsYJsYo980GGUuRyZWtoQj/JDcVj1eNXMbbtA9zsFUIJV
	1zaKSnIfvV6eE26tx9vyMkPTFrILt+Q=
X-Google-Smtp-Source: 
 ABdhPJygpj6U+t8LDgen4xPO62TaQjSPuVxZPpaUCLUfwEor4/z878f3RD57T2he3G71fiwBNXAoBQ==
X-Received: by 2002:a05:600c:3acc:: with SMTP id
 d12mr2870825wms.85.1642588901888;
        Wed, 19 Jan 2022 02:41:41 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/39] mtools: upgrade 4.0.36 -> 4.0.37
Date: Wed, 19 Jan 2022 11:41:00 +0100
Message-Id: <20220119104117.2120127-22-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160713

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mtools/mtools/disable-hardcoded-configs.patch               | 2 +-
 .../mtools/{mtools_4.0.36.bb => mtools_4.0.37.bb}               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.36.bb => mtools_4.0.37.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 8041b13ae0..6185f4d19f 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From dc11f3e7bdfa524a3e395a0f9d5e035dbc40c047 Mon Sep 17 00:00:00 2001
+From a5076415ed2c226ca7115d27e0ce51a8a0302090 Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.36.bb b/meta/recipes-devtools/mtools/mtools_4.0.37.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.36.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.37.bb
index c214b9b859..20748a0051 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.36.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.37.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "e5c0e5adf2dfbb9f72649d3a8299ff6fb73f269f8330a2975d91bcc5055240f4"
+SRC_URI[sha256sum] = "799b197e23e47b61259628810b27790efb7a1fe36037ef1da8a27b0ae4fa8342"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.20.1


