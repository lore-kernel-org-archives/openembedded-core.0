Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD64C4708E
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.70916.1670929886323152213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CYQmpeZL;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id u12so15203760wrr.11
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HntMF6RSjWODEwCu6Hh1KN6JPuxhFt/4r70Bl354AU=;
        b=CYQmpeZL/d+8F19Kf8m0MDn4SMc2o76qGgEbovYdmb4/bLOTKYDpx3IEnMhzwLvb+9
         mJ0yaGm99hkQTSJY/I8EDnGFNiuDR+zzyQ49Qe+xw0w19VLXGBW0St8IpM6al4uvvUye
         7V0sYImOWTJQKl2uLf2V0mpW9VW2bkUGOs/jit/O9sXgaqhQ39v8UXte7CaiSGJ4sKji
         h8b3xp+XstsE4F9wBgH84M7sUbmhq26y5ngmDgFPg7UHF9VXd1Pf82zA21HLhkQdgit+
         4wd+R7r6k1GBp2/rrlYL8bmicsSCMh8k/ER0GBOpWwIzvap5rdO1NOa2EJwLXWc5wCIj
         fOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HntMF6RSjWODEwCu6Hh1KN6JPuxhFt/4r70Bl354AU=;
        b=pEfBF0i+Px6Aqt31aDPTkKr2Zb6w8iZ38uHdjCoKd2YykS9/nOXNGiw3P6OdbP+GEr
         EATY9wwsjVW2r2bUGFxF5wjZjRVE2P2Bem5PFzy1r2PF1yyXdd/1zbryLt5CHpWkcBjg
         WhZZsNQRVfWpOL1MoE4wzg+tF/g9JyWBDgMsXmpX0uFCYVJnnCVvD+AXASpSmZJTJyiN
         lZJAvaAnjhVtnygmqb52YiGauTU7n2hNgHcb9TkTENxDczmhCgd6MPtLcTIkKXnsWC9x
         cuW/012R39PvFlMf+OZ8XbM144eJinE2stJ2d65BVJk4vs9c3w7xbTwJvRndh4GRFaYw
         C1Sg==
X-Gm-Message-State: ANoB5pmIMXnHr31wVOUhERiazZk+aw98EocCHDZ+fQJLo1T8E37Dk6bC
	c+djoHHNMR6nBp18BFFw5cwRqnIZBs8=
X-Google-Smtp-Source: AA0mqf6g3Q8XMnDCGJ+epYtKcZibsTq8U6lX9JcvLw6OBlLYn9lZstzhiECOK6YSsIPk+zuNzkNygw==
X-Received: by 2002:adf:d092:0:b0:242:4d1a:aa36 with SMTP id y18-20020adfd092000000b002424d1aaa36mr11490711wrh.56.1670929884807;
        Tue, 13 Dec 2022 03:11:24 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/24] tcmode-default.inc: set LLVMVERSION to a major version wildcard
Date: Tue, 13 Dec 2022 12:10:58 +0100
Message-Id: <20221213111118.149697-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174514

There is no longer need to be specific: none of the recipes
using this variable in core need to know the particular version
of llvm exactly when using the default one set via PREFERRED_VERSION
from LLVMVERSION.

This as well enables automated version updates of llvm
for minor releases.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/meson.bbclass           | 2 +-
 meta/conf/distro/include/tcmode-default.inc | 4 +---
 meta/recipes-graphics/mesa/mesa.inc         | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index 765e81bc4f..76555641b8 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -72,7 +72,7 @@ strip = ${@meson_array('STRIP', d)}
 readelf = ${@meson_array('READELF', d)}
 objcopy = ${@meson_array('OBJCOPY', d)}
 pkgconfig = 'pkg-config'
-llvm-config = 'llvm-config${LLVMVERSION}'
+llvm-config = 'llvm-config'
 cups-config = 'cups-config'
 g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
 g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index d8c4d11ac7..bb34d0deff 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -24,9 +24,7 @@ GLIBCVERSION ?= "2.36"
 LINUXLIBCVERSION ?= "5.19%"
 QEMUVERSION ?= "7.1%"
 GOVERSION ?= "1.19%"
-# This can not use wildcards like 8.0.% since it is also used in mesa to denote
-# llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "15.0.6"
+LLVMVERSION ?= "15.%"
 RUSTVERSION ?= "1.65%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 115621228a..93b3b59a91 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -58,7 +58,7 @@ ANY_OF_DISTRO_FEATURES:class-target = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
-MESA_LLVM_RELEASE ?= "${LLVMVERSION}"
+MESA_LLVM_RELEASE ?= ""
 
 # set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
 # by default the upstream mesa sources build a debug release
-- 
2.30.2


