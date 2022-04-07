Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB37C47081
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.1063.1649350842585460808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eM0e+l97;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id k23so12177650ejd.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BpSoYWR8xeXEGpPBu3v2J3WNbzSZnl675AtC5pViQqE=;
        b=eM0e+l97f9AnEw925Sug/VY50Mwc/2q9tw8lM/dtmcvH3gHXIJKyC6SpGmBHh8qGtE
         0YdCRJ2MlNUc4NM9OrNeDtuBrG4ZGl0WeL53U4H0QvNC5vWpOPBGL8OYPSpvKsNg7+AV
         e3cbFl/ocILiMhMGUNsfl73iT06Gxai5rri+hJjIdbSzlTa78Ik1VS/i7wN5UfPGdNyu
         RHw5Bufp/wZdbtWrrMpZPIZeuPuJxaM8YCeND/rh2RbH9B2I5n4HsSIesp3/S/dRkCEK
         GRvc1gIaiKW6faBGMgvjcNu3dPlXxBUPOaJJyYHeMTM0tUP0uN7GbO7tkr8gTIiHK01A
         djFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BpSoYWR8xeXEGpPBu3v2J3WNbzSZnl675AtC5pViQqE=;
        b=UhhV3Uv35ylyUtZrgmbXoNq8ZLTKfhvzLyj8+R20lKzLoi+x31VcPV9b/p8+9fyhdW
         YpEKkivTtdH8OhEQSs8xABuvFXRtSh/pFtuXySqexhHc42ZY8qsRFTpdn8SZIBssMs55
         WhcZrPNlCkCr7FqGbjL9ReVa9fL6x6ir2F9/jPab2ra4l7j8Ov5vQ6CFLHPRnKDm+00A
         8Z6FpQeLgR1v7j2lS+JMct1bIxTZJHQ2wvcTpBpWE69yFE5TgHvFi51ZYJQm/ySnO6ll
         X0OCtx4VrcaL5v8ccYClhuNh2+cUORDXwMUPsf99+BvYosRohCfd8JoTv55+d93OH6nj
         tj2Q==
X-Gm-Message-State: AOAM531eEYyO+UERz9LA/C0U4gUT91njXY+zZWPFWM+F0iXeAaZnzyd9
	l04t9OQPRINj/D7R1knWCM/5ZbX22aU=
X-Google-Smtp-Source: 
 ABdhPJx7pGrUjQCDHuEAOnQ6hJ2rJ7+++DFrbC/Q5n05c6VjdaYptv00mB0bht6Jm1SRxjglAzanzQ==
X-Received: by 2002:a17:907:d06:b0:6e0:e2f5:4f55 with SMTP id
 gn6-20020a1709070d0600b006e0e2f54f55mr14954163ejc.618.1649350841099;
        Thu, 07 Apr 2022 10:00:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm7796879ejc.158.2022.04.07.10.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:00:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/17] llvm: update 13.0.1 -> 14.0.0
Date: Thu,  7 Apr 2022 19:00:14 +0200
Message-Id: <20220407170029.3500874-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407170029.3500874-1-alex@linutronix.de>
References: <20220407170029.3500874-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164118

llvm-config no longer links with libLLVM, so there is no need
to install it in -native (and it isn't built in the first place).
This also significantly speeds up llvm-native build.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb      | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index d362bd76c6..4a6d4da5d5 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ QEMUVERSION ?= "6.2%"
 GOVERSION ?= "1.17%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "13.0.1"
+LLVMVERSION ?= "14.0.0"
 RUSTVERSION ?= "1.59%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 9400bf0821..13f7fb763e 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,7 +19,7 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-PV = "13.0.1"
+PV = "14.0.0"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
@@ -27,7 +27,7 @@ LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "75e33f71c2dae584b13a7d1186ae0a038ba98838"
+SRCREV = "329fda39c507e8740978d10458451dcdb21563be"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
@@ -145,7 +145,6 @@ do_install() {
 do_install:class-native() {
 	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
 	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
-	install -D -m 0755 ${B}/lib/libLLVM-${MAJOR_VERSION}.so ${D}${libdir}/libLLVM-${MAJOR_VERSION}.so
 }
 
 PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto"
-- 
2.30.2


