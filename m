Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60F9C2BA16
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:03 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.9971.1718288455858851424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ujm7trVU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f70fdc9644so17144345ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288455; x=1718893255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qh/2SlOHkRfFtUaPW3hg0HhFtNFxuG28Z2IK+NngK1M=;
        b=ujm7trVUwgqDs9NdyOtMIY74Ba46PHT3jzJk3cQeVbORWsGb4YDuroXpcGz9JDDcBt
         sWY6weLvk7DvbESMoZh9ii3Hzae+AF59vGi8M8uVRJ3Z77KFo6CgJpcuyxp4IsnKcAyN
         rQgBxG6wlV1AYFcJkZWXJFvFcNFm9BWs8i2NypJSz8Odn4Zngg1b3qAN8BEbWxlDQmqj
         h/EkHPTgoDT/9gQKVGdvGmZbFuVgECd31OUknI8FQ9iGrYvE9bCHeCmVeEcDQ5WGlDL7
         OSv/03BhIkAyQ/ELT/gK6cTBQlxRH2HfIGu49O6NDYZ83l10xAEw7Y+Ab+FLAOty5EWg
         SUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288455; x=1718893255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qh/2SlOHkRfFtUaPW3hg0HhFtNFxuG28Z2IK+NngK1M=;
        b=giEktYBFZ+7mDsN04sKqZimoHVgwEV1JvU5XmXnlRXF2soxIb4/UoMEXheiyLmsJiK
         FP0r0tkTnBdSVERcPGhxihr0l6fXzcTdWM4XfEkiAKjWX/n94emfxQgBOZoLZk/HzgBf
         3/qVR478lJx7Qyb9Jv7x0/1A4rgPTaIKD+YOsqCCzNyagmDCuU7grR8mwJ5lKU+NrPzL
         mDHC48QbXX9JDNnRCFHQzmDNqFX8VQJ17adS4lGSsxSwyu45rJjP3JrGVvU5iTXdHe4v
         NVr4YdIGEeAOhS51WCoVY9Y5anAiK5PLTna21x41TvyLvJxfOD4+bxezxk1uMxNGJCWV
         w4sw==
X-Gm-Message-State: AOJu0YzPKiRYWOuUIpUYtTiWV2htGQNl2an16URE2QC4f2nJP5A4fLz6
	UJLqZYL4o48kWCb/U1bEK0OAe0llQhaG5nCD6EAOKLr5nRMjXJY/cED+oVyuOkoROWCItgb1wXu
	R
X-Google-Smtp-Source: AGHT+IF544yyQsFEOpW13a80jxR2LJ6cTUtznmumi26LoGZNUfSkd3c7RugZPuBawPSu7InHMY9ufw==
X-Received: by 2002:a17:902:ce82:b0:1f6:e338:2a6 with SMTP id d9443c01a7336-1f84e31188amr44530305ad.23.1718288455107;
        Thu, 13 Jun 2024 07:20:55 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.20.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:20:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/29] libtraceevent: submit meson.patch upstream
Date: Thu, 13 Jun 2024 07:20:16 -0700
Message-Id: <fdb1a67fa3891f40f038c393e907b4e30161b4b5.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200614

From: Alexander Kanavin <alex.kanavin@gmail.com>

[RP: Add url to submission]
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d00306620aa890a361f42516a064d64dd7c68aa7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch b/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch
index 38b6107136..6e96ba2167 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch
@@ -4,7 +4,7 @@ Fixes for the Meson build of libtraceevent:
 - Install the plugins as modules not static and versioned shared libraries
 - Add an option to disable building the documentation (needs asciidoc and xmlto)
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://lore.kernel.org/linux-trace-devel/20240311111140.1789879-1-alex@linutronix.de/T/#u]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
 diff --git a/meson.build b/meson.build
-- 
2.34.1


