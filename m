Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712D3C25B7E
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:33:56 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.61054.1716212029871578044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UhGCPEeb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1ed835f3c3cso7006715ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212029; x=1716816829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+oC+wtUszmmgInZT/HqXBaycWBFhEcXuC+DnP2cPRY=;
        b=UhGCPEeb4vcDmpmEGV+SvK4ARGD+Ft46Gvx/S7TaD6Uul/83tBnQjstnDXWeBMPk2t
         o23nNfyNIfISvL0DKLbBtql8fbIc8qFDjuoHkGhD3pjCDlE8+WmkzSM3bSga/4z2QtTH
         07fE9yp8Fbf56xcWBg/NsC/MX/ngYUew27atiWHfo91bAeTC9N8tFZR40vhXMK1cQaX2
         g2QL+Wk3yqRutq1gd/MzST9plHOc6BGvHiGLCchxAHPrgxt//uOGuymssYb9G82hxOEm
         HxRZfvcSEpfYF1BKYzzGIuBZbpHgx+oyvB7UWi6sd2q7m3o2VkgaieDblwrrkD9eJgjI
         zSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212029; x=1716816829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+oC+wtUszmmgInZT/HqXBaycWBFhEcXuC+DnP2cPRY=;
        b=UzBaOVRg2gO8tM8JdsE60xNePDZF5FEzqD4NQUgUskvedZU+H1ECfyL7/lPArq/ZJQ
         9SgYiFb1zfb5m9gVoccC5MqJlI3BDoAkq3YvA2ete5J/7WVp8i5VZUEJSvNaAicAv2zR
         uU4QnQ8EvNgl9wLPdOSNNaNdrX9mKRXNLHK3p4tGUez5pTOwzvzPG7qeADwSDFXlnEMX
         qB9tv+uwmLnXaDzs9pGOXjrsb4qjJn7zJmowBZADVSC7mR4mR+61djfbzkDnKLYbwyFP
         JDLlscHZYVCSLT3Etg/dZIJMOAsWuixe6WTv3udh588WOBzfBr/JyL1yksWVmha8IMMy
         /wtQ==
X-Gm-Message-State: AOJu0YxA7C5TS+btvjnzG7PXQP3QnrlsH8WX/r1bcYa6pyt98jJFlqJI
	hN8otsmDjXKm7LcOn+qcgxE03ONh8Zmk+dAJASoiRUSKD6SBZ6xevkMYw9c1HlzL8rgz6aLe5ll
	f
X-Google-Smtp-Source: AGHT+IGBZmqAXGpPE8XemxcRnMxBYYODyolxG0NxaVknNf4zW5DqORCepTak/jQ3vnlvfufvAdgesg==
X-Received: by 2002:a05:6a00:23d3:b0:6f3:ef3d:60f3 with SMTP id d2e1a72fcca58-6f4e0328d10mr35299149b3a.29.1716212029170;
        Mon, 20 May 2024 06:33:49 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.33.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:33:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/21] llvm: upgrade 18.1.2 -> 18.1.3
Date: Mon, 20 May 2024 06:33:19 -0700
Message-Id: <c2666c09e9ef1f523cbbcc7c9b91fc36c4872823.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199579

From: Wang Mingyu <wangmy@fujitsu.com>

0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
refreshed for 18.1.3

Changelog:
============
-DFixes tsan failures for glibc's LoongArch and certain RISC-V ports when
 fstat is used.
-transform.structured.convert_to_loops now properly deletes its target op.
-Fix a llvm.usub.with.overflow.i128 wrong code generation regression that
 was introduced with LLVM 18.1.0.
-MemorySanitizer on Linux can now run even when maximum-entropy address-space
 layout randomization is configured globally
-Fixed a Clang 18.x regression which increased binary size and stack usage with
 -ftrivial-auto-var-init.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d2159f92ddbb6b999c1d14ac62647b4a35360377)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...mMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index 48af6fc283..a5c53b6657 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 86940d87026432683fb6741cd8a34d3b9b18e40d Mon Sep 17 00:00:00 2001
+From 3b30a9bda88374e8f03bf96e972aee5bd214b98b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-index ccf0959389b..1f801e83b7d 100644
+index 73724e662f9e..1ca9c73415db 100644
 --- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 +++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-@@ -359,7 +359,10 @@ public:
+@@ -361,7 +361,10 @@ public:
      // name of a class shouldn't be significant. However, some of the backends
      // accidentally rely on this behaviour, so it will have to stay like this
      // until they are fixed.
-- 
2.34.1


