Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8719C44506
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:46 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139208.1783291365871644743
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=r+JAh+Xe;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-476d8e647e9so2022186f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291364; x=1783896164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwNVMccb5PtiyNTAN36hooDIjeJbaEA1nHTh2hANVv4=;
        b=r+JAh+Xe1uYxRlxmHWCB185zhY2JGZshyV47FtvHt4JuwSfWhv9C3qru5TDfgtz1bL
         H4jk6Hixh2Fdon9/2fAHK5TinpYxkww7529A5bAqyYPt5LCnE09RMhKp5gqR9ucktQOL
         sW3T9Pe76b+RShW/7+gMEKaQ2w/CEFAyT+o4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291364; x=1783896164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SwNVMccb5PtiyNTAN36hooDIjeJbaEA1nHTh2hANVv4=;
        b=YcfkL7wl7udyJggkM0l0XPYy+vRsHfbvsMU4MsS81QXCk6c719Kt8GlEsIN0v6sBUF
         rJP+wJfQQ6dJafSvVIfk+l0aH5oXRrUobVGWeDQDm6PxqH7l2vQ2UxKc2IBI0xcYquRK
         EP4aFsw3lOF5Wyq9XOqYAF78qGfK/LD8fmG4PRuSacwTGspQbzU3IiCTVLzbunmOdEN+
         D+ieVJiddRoNNjym2j5uPWfznl3sf9ZjiBEcnCcV7d3jJLkE10NQced3iYTRjxHsLl81
         9qyEThcuY7MMshH0H8+OmF0HUzn5EHsjegI6DWhVlWejT3Dy6GjUse2AH9vclCk6/jSm
         ET3w==
X-Gm-Message-State: AOJu0YzAzeLzFkqUQDPk3VIEkSH5z9VMxpxXRg+8Ip76TmY0EWSusawt
	2iaTcLBiluxw6IiTP66y/NcdNYYO6CwYzwPYV5gxeLQ1rHFxhqdQE0c1v94L2pBvL3xRLQe2YcW
	yK8sfrNQ=
X-Gm-Gg: AfdE7cn63vbJZ3fpnKfViWPLqrtazSk4w8fK0dlzDoW21CL/ciSsY7HwSuZ8YGwXbrN
	5PO0V4cM7XSgUYy4p2Gm9nnAErgN75J2kmxKEcUU9UXmxhD/BNv6WwO0ZdF2Yrv9JCmKpP94W72
	4lgQ8Hm0F9K4tZSynaoTHE2cY2qc3knKh1MPSJir1E4WAVHjlqjmf7FN5FOWaxjXRNLqJoiCbMm
	6XUY3ArlTh6C5hBtEhbRZNNaFU+PdtHaEETMHxE0oGnTABYafbyl52VyPIA/KHa9blsSd8u4net
	9wXJX5xN6wolgvViFOeP4L3sS27cdyPWGwo5sVbBOtaO6nGyvcaRFc3r+sqSpYJZmOqhlsKcAid
	vglxNgQQuCkFOEFtXFTxUYg3J/KGy87JSwCecCuQ5mgEBIo0rMqQo2Gg99TUemSsfdog4ywI1+W
	Xsd+WKM+m2pTTEWZHudXmSvsqYyg==
X-Received: by 2002:a5d:6e48:0:b0:475:5e4b:588f with SMTP id ffacd0b85a97d-47aac01f951mr6476845f8f.16.1783291364070;
        Sun, 05 Jul 2026 15:42:44 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/55] linux-yocto/6.18: update to v6.18.26
Date: Mon,  6 Jul 2026 00:40:56 +0200
Message-ID: <5595e022e4ba29d5939322a450ae82941c41d1a8.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240160

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    1fe06068166d4 Linux 6.18.26
    d5f59216650c5 Buffer overflow in drivers/xen/sys-hypervisor.c
    446ee446d9ae6 xen/privcmd: fix double free via VMA splitting

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d3ad7a943d47c63f40230a40fa4667d157c85bc)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index bc601df34d0..0be25ae2a2d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b47fc8aaa6f14b240bd96eb35e73d3d8ba638d21"
-SRCREV_meta ?= "177495c151446a679945c20611499537d72ebcd9"
+SRCREV_machine ?= "e1a1c058b8b1fd85e631c877cacb0e5c38da1c57"
+SRCREV_meta ?= "127f83ad4e21b6663d72fceba80bfb945c21e4f0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.25"
+LINUX_VERSION ?= "6.18.26"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 638fdd18bf8..1ff5f5d1d1c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.25"
+LINUX_VERSION ?= "6.18.26"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
-SRCREV_meta ?= "177495c151446a679945c20611499537d72ebcd9"
+SRCREV_machine ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
+SRCREV_meta ?= "127f83ad4e21b6663d72fceba80bfb945c21e4f0"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 05eccdc05ae..3612ba56c11 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "6788c0f14b51b8c84f0153d58b00d5115f2ee8e5"
-SRCREV_machine:qemuarm64 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
-SRCREV_machine:qemuloongarch64 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
+SRCREV_machine:qemuarm ?= "11ba8770344f8b1cf3d6960b2d04ca19ed6d1f81"
+SRCREV_machine:qemuarm64 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
+SRCREV_machine:qemuloongarch64 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
-SRCREV_machine:qemuriscv64 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
-SRCREV_machine:qemuriscv32 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
-SRCREV_machine:qemux86 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
-SRCREV_machine:qemux86-64 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
+SRCREV_machine:qemuppc ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
+SRCREV_machine:qemuriscv64 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
+SRCREV_machine:qemuriscv32 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
+SRCREV_machine:qemux86 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
+SRCREV_machine:qemux86-64 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
-SRCREV_meta ?= "177495c151446a679945c20611499537d72ebcd9"
+SRCREV_machine ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
+SRCREV_meta ?= "127f83ad4e21b6663d72fceba80bfb945c21e4f0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a256b1e6892e7fe840f0f9746316fa938e9a421f"
+SRCREV_machine:class-devupstream ?= "1fe06068166d4fc16722201f267b1fe19efad639"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.25"
+LINUX_VERSION ?= "6.18.26"
 
 PV = "${LINUX_VERSION}+git"
 

