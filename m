Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95476C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 19:10:20 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.2728.1715109012122933834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 12:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E4wukktA;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7928c351c6cso297437685a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 12:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715109011; x=1715713811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9J+ftYDp+xL969Zlv/z70u10h2Uxy0hKKnV+gPM35tk=;
        b=E4wukktAWDAnGKzueUT+TLQPfjSa5c3oNgyI2BnvGi/fXymNtnWjg3exrv6x8AMKi0
         dJH254DYjbfkS6/k/wtJDoCCqZmpon9bf9Leb5mA0ER0OeE24vhzZKZKqUbx9jv151rA
         oNvQ2kEFkj7EnraqRfiqGJHXdYNepy5BEkd51kuy8u3dJwMA33B1JyUI2wRROn3KTHRM
         K7OVPfcszQRVV/xwrv8TyGcWzZJYZbX7XpkA5Faxm9Kue8oZtAVj30wjoVCOujutKycj
         GSg6H1kEFo7xZYLdAGLm+p6A+LSJaOjq+4kIds8ZzyOEZC2WYjl6DSMx9Shi8Rq7qDHq
         f+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715109011; x=1715713811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9J+ftYDp+xL969Zlv/z70u10h2Uxy0hKKnV+gPM35tk=;
        b=rXBm4BPsU1l0f/k5tpqh4dmm0nOT+f/DE+o7pBYcoaRwZXYvxQ+pEfsjAU/OJLiZn6
         nndEOF/h/FjS4BBYgCueXLv51nIgWYRrUt8hHY/gu0ffzYGvZCufQdgk84cykqf/nKKa
         MJdAUU/k7MYxFwXBWlP23QeFQ+6dcv/g4g0tV9nYK8kfYWyfvITjTpnp4Md0Oizqa3kj
         yRcd8M6Fz6ykCaXB+ntfzdNf36p75k1yZsvtRV+dHLVLLG4TmfPg+gDblao5sHHF7KXR
         Akib88S5kRKIECMEs8e+3hAfmVDCnRDRXxyGcPanFSvcQwmMJwuWm1k+IRFgu6UXwMEt
         3KZQ==
X-Gm-Message-State: AOJu0YzzsrJ650yJiVgABau5ZtIn5YsM6ASltZyvY7gvTKOlxwzB+2QK
	nCXfdTORayjJu5PWkE2h29Uh+2Zp1IrNn0lKdvM9hG8vY0eFx1EP
X-Google-Smtp-Source: AGHT+IGajD+dQUHejddXsngYEW7KgHAixhbC84C75u1RfK2rozCf5e+VzBWfqW20oAu70uTZMATWxw==
X-Received: by 2002:a05:620a:4150:b0:792:a77f:fe71 with SMTP id af79cd13be357-792b26a8bffmr77261785a.2.1715109010918;
        Tue, 07 May 2024 12:10:10 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id os20-20020a05620a811400b0079282ce61fdsm4213866qkn.77.2024.05.07.12.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 12:10:10 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.6: fix kselftest failures
Date: Tue,  7 May 2024 15:10:08 -0400
Message-Id: <20240507191008.1798656-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 19:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199103

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

1/1 [
    Author: Mark Brown
    Email: broonie@kernel.org
    Subject: kselftest: Add a ksft_perror() helper
    Date: Thu, 28 Sep 2023 16:38:11 +0200

    The standard library perror() function provides a convenient way to print
    an error message based on the current errno but this doesn't play nicely
    with KTAP output. Provide a helper which does an equivalent thing in a KTAP
    compatible format.

    nolibc doesn't have a strerror() and adding the table of strings required
    doesn't seem like a good fit for what it's trying to do so when we're using
    that only print the errno.

    Signed-off-by: Mark Brown <broonie@kernel.org>
    Reviewed-by: Kees Cook <keescook@chromium.org>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index ea429692d8..53f413407d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "99d3632c1cf7688066e57aea89f9adfe8d1a5ca5"
+SRCREV_machine ?= "9bdb085cb6fcfd49586b980ba27cb81e5c76689e"
 SRCREV_meta ?= "a78c74a3510067017dda1926f88bd914f0a053b3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index bdad73bbbc..44c9a7b1e0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
+SRCREV_machine ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
 SRCREV_meta ?= "a78c74a3510067017dda1926f88bd914f0a053b3"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 12197ba414..817639bce0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "45982c347ee123883a88f220d1d9a740e2c2b959"
-SRCREV_machine:qemuarm64 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
-SRCREV_machine:qemuloongarch64 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
-SRCREV_machine:qemumips ?= "738f344ef6da38ebf6fcca87b701281c930b16e4"
-SRCREV_machine:qemuppc ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
-SRCREV_machine:qemuriscv64 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
-SRCREV_machine:qemuriscv32 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
-SRCREV_machine:qemux86 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
-SRCREV_machine:qemux86-64 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
-SRCREV_machine:qemumips64 ?= "7f4b889b7acb9fe36e290bf40c2e9b6cec523f6d"
-SRCREV_machine ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
+SRCREV_machine:qemuarm ?= "0b90bbe1359b3fd590780119f19dbd0a01e58560"
+SRCREV_machine:qemuarm64 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
+SRCREV_machine:qemuloongarch64 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
+SRCREV_machine:qemumips ?= "ab44de80a320e30a49150ea74554a937affaf78d"
+SRCREV_machine:qemuppc ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
+SRCREV_machine:qemuriscv64 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
+SRCREV_machine:qemuriscv32 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
+SRCREV_machine:qemux86 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
+SRCREV_machine:qemux86-64 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
+SRCREV_machine:qemumips64 ?= "75da5d44c2e54a85a1221ea7d0c04be9aefb7fa1"
+SRCREV_machine ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
 SRCREV_meta ?= "a78c74a3510067017dda1926f88bd914f0a053b3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.39.2


