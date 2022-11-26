Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4A2C4708A
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:56 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.70843.1669472149731767447
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=iLx+UYfP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id 130so6456677pfu.8
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jh+Y/FJLjEmXyEANI/j1pYL2/t8aNArgiyBhTCJ7zhA=;
        b=iLx+UYfPR8T4AtbfGEliHEUstjZkW7mP3xTeZIkB3vFjC4Zo0O8dMWGQlr7MlUNmly
         4r8smEo6lpemN08ehLB+ZEWDnpJVwEFX8UNoH5T/UN/DoZniVd/tRRQs1RJzl+3LnQ1x
         yECxW/Z8htmEzPhp7MNT122DA1Hjb56uHXjk3fGhdJ4FdxXLSQIjcmXTY8eJDhUlJWf7
         06Lt8eTPWiCv7O2WVq9UMJsEvc2JivuvOPR65lgk3t+Ojp5m6ukGokbTXO4ATouQu45s
         VWrHBqGQom/1PNdYFGn/aRJ5jsEUBiY15PFjNWoFMnj6sQIY2oDpP37v9rrM7E8Y7dLm
         AhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jh+Y/FJLjEmXyEANI/j1pYL2/t8aNArgiyBhTCJ7zhA=;
        b=MMdAHv7BNM3b3CHesgErUxWSOsqEeYUQx0yEn7XaNQJFNNVPdorhWFGG/Gyb3BFFEp
         Svt3SfHiemehpj7bxW6LFlCb++8A26qcHZSD4D+362mPo0RGkroAqYYTLR/kHYu2l+43
         Vdh3chCSS/7ysutLQ+kqON7fZPtUh5VtaDQWOorQN5USnmnorefHjMNcV2zV3U4TXsMo
         weyA/J8j3uT2+xQjXprth0+T2mR+uOG+5jdZQEbLgNzM/J+ivSrLliF1ft/4dkb5MFsa
         NVvySVvTARnvruATyO2bC/kD5L+2/oAO5s126p846EgGOMLkdEHNwqNGqrF26sCqiQ5r
         TO0g==
X-Gm-Message-State: ANoB5pltsdvUjrjvzaD8qtIpuC+rZ9NiRw4iL9yTLtwvwO78/xc5oNN2
	rQIJklJNM1gdW4c6O3lMMct4IA0zFRZqDwomijw=
X-Google-Smtp-Source: AA0mqf4PSw2YroJ8j23I4bjdwzl5sTfEAFpylW7HQzq0NsP5TUJHPfUqEkMdO5Pv+ntCVokq8OdxTQ==
X-Received: by 2002:a63:f95a:0:b0:46f:5be0:feb9 with SMTP id q26-20020a63f95a000000b0046f5be0feb9mr37710329pgk.485.1669472148628;
        Sat, 26 Nov 2022 06:15:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 20/37] mesa: do not rely on native llvm-config in target sysroot
Date: Sat, 26 Nov 2022 04:14:24 -1000
Message-Id: <d2860e67a37623b17fc9c6e1192f06a63b7d52ff.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173813

From: Alexander Kanavin <alex.kanavin@gmail.com>

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 056431883e94296b767a479d029b914392e4fd7c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 3754bb14de..f9007f3187 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -54,17 +54,7 @@ ANY_OF_DISTRO_FEATURES:class-target = "opengl vulkan"
 
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
2.25.1


