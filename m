Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CB61099B4F
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 23:07:33 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1972.1774048049034398646
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 16:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dh9jBuHC;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b7c2788dso679793f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774048047; x=1774652847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2Xjr2+Xtb+Fk4T6zEuw/Lmf5MMbgTZr7JDM+BU/noo=;
        b=dh9jBuHCjNNCxX3sB91grZGcXUBfDpL+RTEx1FAsmM64QfegAiF7QoUzVt2VYoolsK
         ZR1LXrS2yYjHWiHJdiFlsavD+34M9AE2qZfeCFvZyjd6wJLq0/2McCgADFdiubk9leSq
         bS+yGG+W5oJ3itXu9A0eD5wHr0s0fNMG6nrUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774048047; x=1774652847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A2Xjr2+Xtb+Fk4T6zEuw/Lmf5MMbgTZr7JDM+BU/noo=;
        b=aFT3JZ+WT//vzDuZtncYNbTJhpQLnmxkSUE0cICllCmxiaeOwhmlJfsLuQvI9sVdHn
         wSl0JEeH5P4J4SuaFT04r7rxFqlqZlP0wVs2GQGdAHqUBHHfjB5Qx77kzFTYjZBeXZfD
         4NrVmnYGVaUcEeO92ykH5pg/sJ/Z2yE9f71YyevH6A3W++dtumdlt0c/a4YRYcU83FMc
         9jKbaRdEavQM4yyHMh4cJ8/ulhMWDDyyvo508AVsfTYUbPxDtTx6ptcLtC0rmBZPlTer
         2lcM3dOnf3DZsui5DWNsMxo8/Dd/3bz/fDGto391wnSKjWx8r0RTpZACaUexaIoV7cQB
         ddpA==
X-Gm-Message-State: AOJu0YwFKWjMj6I1vsmdgz3w4yTGgVd6/KJafieC+viR4FT+RYPmh2ue
	IDBRy3GecEgmZvonyOfUnHYKsfY1uGmU4kU1XsUyrfH42MBBWYIicDXJpKNtmNEivYNUGTE+koR
	NUDGD
X-Gm-Gg: ATEYQzxDnznaAAqM8igHLIN6GKKDdTpVWlvdN36Cv1ec+3QW/36wfV3z2JkR6Qu4uGs
	zzNs0WEEAUhSQRtn/KS5vzg1FRdHeZ/FPpzw4nTPW37PtsymS5Hk0anPaG9/ZPXK2OUi88kJ/4A
	wzWbIYLtpQji7uUGyUrHCdsU8lud177QmTcsIp8JXRpPMHc7zu82EY/LVlKn7BYpHcfDS+gplZs
	BAVNDzdH3jONiA3kXJr7wd8Y5OQQlRBrX6KrCkAbPilyI4tIluGPkd2h99/e3+4LncAruzke2UK
	H2+vhyCV5Rg6bjwoGHrBoEg9mbMyFpZ++S7vTj4UdrwmVVTSYtIUykaHvjSwvUsk+xdjGvMSjro
	Z0OD7phN6oHhx4fYwHBTmO/qaGqcn8PztDQklWbnIuXVKgS2tTnJknQipNPmRBnuG4HMZryI78N
	UwjPcaF22jZAtRMxDG/+sLDu7zTG7J4vXTehf4/EjAbrC+cReFeJ+x+cFqbzKX60qwJMrZDrNB6
	sguFljPC7mT0eR32zHVcJS4GFE=
X-Received: by 2002:a5d:5d13:0:b0:439:caf7:a5e5 with SMTP id ffacd0b85a97d-43b6427d3b7mr7628740f8f.31.1774048047031;
        Fri, 20 Mar 2026 16:07:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6425eeb4sm9238332f8f.0.2026.03.20.16.07.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 16:07:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 2/7] python3-setuptools: drop Windows launcher executables on non-mingw builds
Date: Sat, 21 Mar 2026 00:07:17 +0100
Message-ID: <2462eee5fa3cdc13eacafbb281e8871ee7c3a101.1774047909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774047909.git.yoann.congal@smile.fr>
References: <cover.1774047909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 23:07:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233638

From: Krupal Ka Patel <krkapate@cisco.com>

setuptools installs Windows launcher executables (cli*.exe, gui*.exe)
into site-packages. These binaries are only used on Windows platforms
but are packaged for target, native, and nativesdk builds.

Remove the Windows launcher executables when not building for a mingw
(mingw32/mingw64) host to avoid shipping unused Windows binaries.

Signed-off-by: Krupal Ka Patel <krkapate@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cf7c79f3962f2be99cfda47e8cc730091e6a18cb)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-devtools/python/python3-setuptools_80.9.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb b/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
index 533d8ce3d44..833d610be5b 100644
--- a/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
@@ -13,6 +13,15 @@ SRC_URI += " \
 
 SRC_URI[sha256sum] = "f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c"
 
+do_install:append() {
+	# setuptools ships Windows launcher executables (cli*.exe, gui*.exe).
+	# Keep them only when building for a Windows (mingw) host.
+	case "${HOST_OS}" in
+		mingw32|mingw64) ;;
+		*) rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools/*.exe ;;
+	esac
+}
+
 DEPENDS += "python3"
 
 RDEPENDS:${PN} = "\

