Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9630C4167B
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 19:01:26 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.761.1668452480177308669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 11:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D7b9skXF;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so8623360wmg.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 11:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ljj5AjqegB/d1NwAyyyCZ71qlQlINFBvSlRplemsoq8=;
        b=D7b9skXFbxQnOdLhGfhFJt8KoR9n9t/xNpv9I4HOUiLLaf9f2sbh895yfvEXhvzIQZ
         ABoQGDPY0dPBUEAYr14LOLFLg4CqXoOxVP48tAYLdMAeo9w22dkU58HUDeuMRmHX2VCx
         PsDD6S8Fpu6MJI2t2ntmD0MdO648p9a5kCTw2FtFfDSrSU6rKAv9JoKHdiCwCxvS1uXC
         xsYFlbciYIzuGAoGgLjLjyrSDUhoq1DIc1GoFRYQmdHXdGVzFY5VcVDmMWX1Na0jXybk
         afZd4WUEabsqbcsOzPv/kezNcAIfAjxaYu/54A7Wzd22dd8r0zX4NeX02DFeKr/SRkKK
         oGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ljj5AjqegB/d1NwAyyyCZ71qlQlINFBvSlRplemsoq8=;
        b=GA9d42QGCZa0sy3z4gHfyjs+luhcFRYHmbDLisH5yWA2OPxyQtkO8wREYz7Hdtwe3o
         894H/UcG23kfY89LlSwxi4RN9MspmBd+D38MTpzMsv6r5SOw/QINHIQAlQ0e/9lpSkbP
         VLqvQKXVYrHRN6WWh+x3cDfUbaev7X/MgazbuK6ECOTm6CxQFD5cBSG8Zgx8QtB1Kih9
         TQYmn4M14H7gP60hc77qsIGll1E9udq4w5hkb+dz2hUN26Jp1+c77GOzNQFcxRCXgL3o
         NvWWRJUicxdKAYhrWfU21TEGmOpdv1gnFKEBMw02UDtPdc61ePj6T3SXGKn8aYS2kcOC
         wtvw==
X-Gm-Message-State: ANoB5pnawQlbyNmk1wT2Wohj9gwTn2v1OrdAvWf3xrtWLiZabFtGsOEg
	/RMN9ge+q9DSIEz/hY3leRdzLw8EehM=
X-Google-Smtp-Source: AA0mqf5neAa1XmGQbYr/Dn5j7Jjb9j+HfZOju2+4C/PJF0FvdIFA+XnhJsBkKnDCS0Zdxzey2qH02w==
X-Received: by 2002:a05:600c:358e:b0:3cf:8b53:747f with SMTP id p14-20020a05600c358e00b003cf8b53747fmr9302076wmq.192.1668452478677;
        Mon, 14 Nov 2022 11:01:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id c7-20020a1c3507000000b003c6f1732f65sm18091811wma.38.2022.11.14.11.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 11:01:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 8/8] mesa: do not rely on native llvm-config in target sysroot
Date: Mon, 14 Nov 2022 20:00:56 +0100
Message-Id: <20221114190056.2612669-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221114190056.2612669-1-alex@linutronix.de>
References: <20221114190056.2612669-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 19:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173261

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

Upstream tickets:
https://github.com/llvm/llvm-project/issues/58984
https://github.com/mesonbuild/meson/issues/11043

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
index 6246b723cf..1949fc15a9 100644
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


