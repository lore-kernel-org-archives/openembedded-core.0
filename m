Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1111E6E7E7
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:34 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13359.1770113971164283507
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aX8MkHoS;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48068127f00so46401385e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113969; x=1770718769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=016UgcrQEnkfxPTSBwfKcMxCE2gb98knx2wPC15YzEg=;
        b=aX8MkHoStbi9ZuIofZE+josq+JX7bk1h5V3wUYPIRwXHDG8urO3ilPWCTeKEBO8Xrc
         4NQq1T0OIF6164JBByIynPCaGYuyxNzNtfo98kcXz8pCH9tJESiURmaRJL9hvl7F24Fu
         Ck6CELrbBrvoEjGoKw5D2yefSglHdFMtk6tbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113969; x=1770718769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=016UgcrQEnkfxPTSBwfKcMxCE2gb98knx2wPC15YzEg=;
        b=rvv9vbjXB5Lme0oHV5nI2yKwetWClxm25Fe0gBWFmF+79lvgdUFhLHK3LPdOuRH0iq
         7kEtzbwJwjQO5CB0nLi76qv+1mjhBvREiW3ywd4Gg7ktVa2QK1IqVZx7OKmD9su1+7hg
         E+7Fq/dU9NZDdlCCrtsmvXFydpaVniiqlEOA4j5eS3O1C43Wo/21N6mYZU+rPZkC+xLm
         VanNundBWJekSVc4jyPgjNJoBD/dQJL45COK4Y7gO1up0NylWBfMY/DmbNA0dJiVjZzf
         LI1A2P6xpkBwxpXCxV79AzAmyvRonU7O8h8KLtp1V9amo7MMt+J09CMzSyOLznlrx09D
         OBhw==
X-Gm-Message-State: AOJu0Ywwn0Pvnvtt/QT0W+xA9KS3V11RY6Q882yD7Tku+bB+8YXiYL80
	LAUQsnT8SLNq0mBqsdmWE/kSDKoSknd5/fkjzSnM5pOfGP+v4YBdqo+PZg+Tgm0c8jzMiPRmqu6
	OoCU04+w=
X-Gm-Gg: AZuq6aLlfXq7GlN2Mad/c8Y42DiceaUJrma3ghOzhXC+yaGrCPalXDrefJTqhRp2pIb
	AHDd1BgD66UTnNyIFOUtTCoRRIiqUr0mkDDwKiZrde2WzAPk1EH9kSp9Nmv8MzKXe5ZhX3HQbO9
	i0ZvXJ3WYOA0Wn3BPamHMt+z6slfpfVOKNfrFDXsL0+70YoMA8Nm9m1Cx1/CDeZymbxpr810pFe
	pRx83KFYh9T4c8NS3KJtBWNdXlRfBaobNLoWMHT8o6FgoaOir1Wg5o2wWr4WkH+HW5SxJRTv04E
	GbFIY9afBrg8Ks45eez8Nt2NuIlDHwe2JCQ94Vxw0jQ8e0RQoaZ6TuE1fmznYPOQtIB7Bf4Hrlc
	3fcUAoTLzPjiyIWBMSKUm4d5oWhW639ZMPGtswkmI+aBCEmer1uN1uCc1e+/bMhuX+1iapIKuSt
	MMcY/qZf8CW0Li6Fk/LP89NUqtVOkfCGiy561gfzaDL+fAys504oL1YBz7szIVkw9/VOshRoaKA
	lShDGlYlIfSZzQ=
X-Received: by 2002:a05:600c:628d:b0:480:6b76:dfb4 with SMTP id 5b1f17b1804b1-482db45698amr166746505e9.8.1770113969234;
        Tue, 03 Feb 2026 02:19:29 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:28 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 10/22] pseudo: Update to 1.9.3 release
Date: Tue,  3 Feb 2026 11:16:39 +0100
Message-ID: <52fd83a9899d8f6222ab2447d214051d0e98482a.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230438

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in the following changes:

  Makefile.in: Bump version to 1.9.3
  configure: Minor code quality changes
  pseudo: code quality scan - resolved various potential issues
  makewrappers: improve error handling and robustness
  Update COPYRIGHT files
  ports/linux/pseudo_wrappers.c: Call the wrappers where possible
  ports/linux/pseudo_wrappers.c: Workaround compile error on Debian 11
  ports/linux/pseudo_wrappers.c: Reorder the syscall operations
  ports/unix/guts/realpath.c: Fix indents
  pseudo_util.c: Skip realpath like expansion for /proc on Linux
  test/test-proc-pipe.sh: Add test case for proc pipes
  ports/unix/guts/realpath.c: realpath fails if the resolved path doesn't exist

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 524f4bbb11f9c7e0126e8bd46af217b452d48f5e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 19b0d29b718..ed1e8fb3e01 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "125b020dd2bc46baa37a80784704e382732357b4"
-PV = "1.9.2+git"
+SRCREV = "750362cc7b9fa58dffccd95d919b435c6d8ac614"
+PV = "1.9.3+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

