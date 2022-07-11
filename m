Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AA0CCA47F
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 03:04:47 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.24294.1657508682976678588
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 20:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AxTzObyL;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id y3so5864748qtv.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 20:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X5SAKy9Do27+kfQAEXQ74MANjbW6IBHEhVSz3EoV6tU=;
        b=AxTzObyLNDCjOWe37ppgoAsVbgbVz5IoAqoSNIp2QGYL0Zgm0RsdATw5FIaZmNpuc9
         FhU46bkqLh2Y+lbkPiu1/eSR4aezcpLKiLY483bVipUF7JUvvKe6U4CDFWSHtvGokgj7
         NokUgAFUtI/iZRts3lRf68SminRYl38JkpsAn+/X3EJK6RXyHrAdABv3QSsh5GJ6pfWC
         WwCsIanr/dm5RVkXF1m2ta6nC0N/ztIIfp/bUTSdbk5FiEz1xj1SOxoe4kbLRnsQ4CIh
         UqrW9tuk0VrKzwhK7XCTL1ciL6HoktbXShjsR2wKI5TTI7KylnYTC/NxJf4gXQZgFi2g
         TuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X5SAKy9Do27+kfQAEXQ74MANjbW6IBHEhVSz3EoV6tU=;
        b=h+oSbeiCM863wr9NtWEV4uYGiXBZjZYh59I3uhuEsoHHu1wonZmFekV7jMm6Bpzffx
         GBio+NSvYs3Kgzb8XJICItF7Eo02gS6Ts7pbT0XVJFzsIRVGIFIyqbLFMS+tZy975M3A
         PDynmhsko6hQS1c7U/R0WdsXeuJPHPWQgrdjbwByfm/x32tgOELwXPx3OPa3PEOYLXVx
         Uz2mzb6f/MmOmnMbXddLm+D96Uqy3XMgjRBHNSZD6unrWTgko2ohFfyPKUMu5suqgTs7
         /3GpuCWItr6iKd4DmLFCbWBOMhvGk13Q2RwcTZDEk5IKX/lZ1w/HrwHJkzRJVjPjlO0q
         rLwQ==
X-Gm-Message-State: AJIora/fSH9w0uMPAOJjKOMtYpFqiuB1NrGLKTMWKMjZ/+KRuRa+S+fA
	+SVyMflXjn+M+TD6J8BfaXw=
X-Google-Smtp-Source: 
 AGRyM1suJQQYrE0SQeygg6F+fKBFaaUauf5I/HqWJ9BXAyYV4duf6VFDoorS95mbSqTfeeawkYr6yQ==
X-Received: by 2002:a05:622a:1491:b0:31d:32ca:3bd0 with SMTP id
 t17-20020a05622a149100b0031d32ca3bd0mr12560421qtx.536.1657508680500;
        Sun, 10 Jul 2022 20:04:40 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 t4-20020a372d04000000b006b24d912ab7sm5024933qkh.46.2022.07.10.20.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:04:39 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.15: fix build_OID_registry buildpaths warning
Date: Sun, 10 Jul 2022 23:04:37 -0400
Message-Id: <20220711030437.14494-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 03:04:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167857

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

 Author: Bruce Ashfield <bruce.ashfield@gmail.com>
 Date:   Sun Jul 10 22:56:53 2022 -0400

    lib/build_OID_registry: fix reproducibility issues

    The script build_OID_registry captures the full path of itself
    in the generated data. This causes reproduciblity issues as the
    path is captured and packaged.

    We use the basename of the script instead, and that allows us
    to be reprodicible, with slightly less information captured in
    the output data (but the generating script can still easily
    be found).

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 9c869faa9d..61b1df04a9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9179770f29198c123b02f1d7cd20fb08c71c0159"
-SRCREV_meta ?= "e532b0393413badf4f0df4b2337015efd8eae932"
+SRCREV_machine ?= "4132e425a2dee778212b42d99a9812fe1c78a03d"
+SRCREV_meta ?= "f122fe59e74365eba84bae800898ffd7329c628d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index b87e41776a..7c81b048dc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7dc6451b61e67818fe461b950a3450bf9d06067c"
-SRCREV_meta ?= "e532b0393413badf4f0df4b2337015efd8eae932"
+SRCREV_machine ?= "b2dcc4f70362059ef107000f9be5c76c2886911c"
+SRCREV_meta ?= "f122fe59e74365eba84bae800898ffd7329c628d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index e09faaecdb..3e22f8d570 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "51fc1677b3378d04bf6bc59f632d80c8a21e54fe"
-SRCREV_machine:qemuarm64 ?= "5c9319fd04d643d55836b94f7eeb4dd7561ea197"
-SRCREV_machine:qemumips ?= "78b65359d44c9ae535388dfc8bf06eb8dc8764dc"
-SRCREV_machine:qemuppc ?= "dd1a7ce7eb8274e72507d634d9239109fdbebb85"
-SRCREV_machine:qemuriscv64 ?= "0f586f4ee8adacac79b64d1f3d47799a5eb7fbea"
-SRCREV_machine:qemuriscv32 ?= "0f586f4ee8adacac79b64d1f3d47799a5eb7fbea"
-SRCREV_machine:qemux86 ?= "0f586f4ee8adacac79b64d1f3d47799a5eb7fbea"
-SRCREV_machine:qemux86-64 ?= "0f586f4ee8adacac79b64d1f3d47799a5eb7fbea"
-SRCREV_machine:qemumips64 ?= "a6f8486df096f727ec6233a152947d9bf26202bb"
-SRCREV_machine ?= "0f586f4ee8adacac79b64d1f3d47799a5eb7fbea"
-SRCREV_meta ?= "e532b0393413badf4f0df4b2337015efd8eae932"
+SRCREV_machine:qemuarm ?= "3d2ffe77f277a0a650e7d012c5bfe3765a467e4b"
+SRCREV_machine:qemuarm64 ?= "1da6524b1508ca6e9b6602471b478d310bec1960"
+SRCREV_machine:qemumips ?= "4101fd448319edc00fec2bd822be407d19205bb9"
+SRCREV_machine:qemuppc ?= "651a0112fb207bae1be0d2609e9a910135fb4feb"
+SRCREV_machine:qemuriscv64 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
+SRCREV_machine:qemuriscv32 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
+SRCREV_machine:qemux86 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
+SRCREV_machine:qemux86-64 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
+SRCREV_machine:qemumips64 ?= "d518b9a80c938ca7ce11e56d2275c33b89dfc9c3"
+SRCREV_machine ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
+SRCREV_meta ?= "f122fe59e74365eba84bae800898ffd7329c628d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


