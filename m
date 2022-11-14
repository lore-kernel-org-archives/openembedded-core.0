Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168E0C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 13:35:30 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.5472.1668432915451772887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 05:35:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fT/kZDca;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id bs21so18286381wrb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 05:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UIqJv/1Kk/eFLRokkycoCjN+dj3XJXV5T73RDGZFxQQ=;
        b=fT/kZDcaJDRnQVZGxCn/pqeAPJG53nM+z3XcZgOYASvktoH5cY3xW5OHxHr8Y8m4Sq
         nI2cXxZ5IUjKMonPP1tfVq25XFbtyqVy8Inf+EirW4bAg6lC0pAJz2YMW/QUkI410XBi
         +15KQlsQcCV3+efdr7keIT2cF4Qy8ds8O/UIWEVfTiXezjlSYuQZ8OYDY8m77QscMoYJ
         SLltMU5MX3FR/DXekF3hBGrf4ZE+0U9lXPRueWP5uvSmPuHFkhHXKDaWPgBsatlOIgEB
         WPdglwn9QGKsqqYkNc9D1X+Uo3WE7VIxSj5DA13fQ27/3oHqrd6OfFJjMiWs6lhi/y6V
         DQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIqJv/1Kk/eFLRokkycoCjN+dj3XJXV5T73RDGZFxQQ=;
        b=Fe/fVAxvEQSdEc46794+PUIWjvOQ8QR8QAg7863rVW5XlKF+qVmu1LaBwK1bc4PKR7
         ZTNqTEE/rV1LhaqE6JDRptnIl7gfGKLEmD3AbYUeP22LvrGfO9SsXsfEazZhAt4FmUAK
         lvVKRM98Be4khpfhNsoSneJLkF4cP4Se4MH8ulLMdhDVysWXywXAJDqwStrhm8x8B1qU
         AcCWq+7qPUgSouMlftmoORmZWHkAj1Ziopmt6Uf5UNVX1zJcvRINoHb5vncIMRInGoul
         7/6HzMuZa/mUVk1GFbUIWJVLTOd0g6ccStHpz06kSUjMy8PoQoZrT9nm2vyxtNCLI/x/
         IyYw==
X-Gm-Message-State: ANoB5plK/sE8tAiPrU8G4MvJkzvZug+5ZeGVMAZs4wC6liVaLYLZNgqw
	Dt+GIH/Qk232oZnVvEpuNwCHKr9afxg=
X-Google-Smtp-Source: AA0mqf78yv+VFvXqxNNtRT8Q2FyyFIy50qplFd89EX2O9+9ZYy7fRjY1AGZzK55oMCIDClG/XUpZ5w==
X-Received: by 2002:a5d:514b:0:b0:236:7921:e10e with SMTP id u11-20020a5d514b000000b002367921e10emr7397341wrt.61.1668432913437;
        Mon, 14 Nov 2022 05:35:13 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j7-20020adfb307000000b0023c8026841csm9652305wrd.23.2022.11.14.05.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 05:35:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] mesa: do not rely on native llvm-config in target sysroot
Date: Mon, 14 Nov 2022 14:35:04 +0100
Message-Id: <20221114133504.2392154-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 13:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173240

Sadly the magic is not perfect: llvm-config contains a hardcoded
value for the libdir from the native configuration, and things will
break if the target build installs libraries somewhere else (e.g. lib64).

llvm-config in target bindir also needs a rpath adjustment,
otherwise it simply won't even run when e.g. building for arm on x86.

To avoid patching llvm-source let's simply add more cases to the
llvm-config wrapper script, so that falling through to llvm-config binary
is avoided. Fortunately those cases are all static in what they return,
even though llvm-config binary does poke around the file tree to arrive
at them (which is where breakage happens if native and target don't match
exactly wrt libdir).

I verified that this works by building mesa with llvm enabled for
qemuarm64 and with baselib set to 'lib64' - so that both the target
architecture and target libdir differ from native ones.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/llvm/llvm/llvm-config |  9 +++++++++
 meta/recipes-graphics/mesa/mesa.inc         | 10 ----------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm/llvm-config b/meta/recipes-devtools/llvm/llvm/llvm-config
index a45f38c650..5e4ded2da5 100644
--- a/meta/recipes-devtools/llvm/llvm/llvm-config
+++ b/meta/recipes-devtools/llvm/llvm/llvm-config
@@ -29,6 +29,15 @@ for arg in "$@"; do
     --ldflags)
       output="${output} ${LDFLAGS}"
       ;;
+    --shared-mode)
+      output="${output} shared"
+      ;;
+    --libs)
+      output="${output} -lLLVM"
+      ;;
+    --link-shared)
+      break
+      ;;
     *)
       remain="${remain} ${arg}"
       ;;
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 7dbca5876a..5839b6d6a7 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -55,17 +55,7 @@ ANY_OF_DISTRO_FEATURES:class-target = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
-# By placing llvm-config in the target sysroot bindir, it will then map values
-# to the target libdir magically. We can safely add to path as there are no other binaries
-# there.
-PATH:prepend = "${STAGING_BINDIR_CROSS}:${STAGING_BINDIR}:"
 MESA_LLVM_RELEASE ?= "${LLVMVERSION}"
-do_configure:prepend () {
-	if [ -e ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ]; then
-		cp ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ${STAGING_BINDIR}
-		cp ${STAGING_BINDIR_NATIVE}/llvm-config ${STAGING_BINDIR}
-	fi
-}
 
 # set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
 # by default the upstream mesa sources build a debug release
-- 
2.30.2


