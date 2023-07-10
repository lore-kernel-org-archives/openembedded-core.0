Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E830EB64DC
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 03:20:37 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.32111.1688959236291398330
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 20:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QE2DAsIV;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-40278c8e0d2so23397011cf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 20:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688959235; x=1691551235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MViuPDURbpTpzF5J5CtBDRX+IXTyYktb0NqT6TPO1Iw=;
        b=QE2DAsIVAaq18ifTHYSKtS8XmiM+um2y87k3aLXkrp2Gl5UK7xWHVSp3egP55YSbKo
         qzVLnn550IQcNSsdwLBcu/3NBK90bMGBVXap+kf+V9/vIr50Hh3auQ9xtjR6AUDzUZnx
         N06VO6ugkHpCiqt4z4o0jNJdyZkfIB6GASbAD2lZeeRDLt8PRPCaKZ69WEeMJn48uh1a
         EDaXWjLLhlges17gxeWywsTA0iEAnKrRkbzRXZt2POVcPz+go3KAoancAwSF22tHjwmX
         TUPcN6+FZS5ke19EJ+pV3u4MdOp0n//Wm3Pprys3n5tfueXMSVkRGAK3XF72GnkyYf0O
         JaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959235; x=1691551235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MViuPDURbpTpzF5J5CtBDRX+IXTyYktb0NqT6TPO1Iw=;
        b=D/xFGNp9x++a1HejfjoUAxdo3f/7LJPeduW5uI5GhaaBQoJCTa419cqRj9iFlHFVSn
         lndei65N+omD2IiXAQVEcOYjiQy7snaVg/jijOOMH7yIF53VdotZD1EWBwmZy3xgm9n4
         1EzcLrJoLWW3aGIjI0S+nqp1DrWy+YuCeO7kSGTOUbuoSq5pxEH0BTHix3Kx93h+CTGN
         3/JP3QDMJMQF0lUqvWB4+fvpqs/Nbouyj8MWp3A+C/QELjYAgNfkC5KlgX6fiD86ogQY
         uRNIqGDYgiC39/8ClNpOK+lEQs5e3j0nCPMvqED1RJsxmc5DhXAAFL3wEmfmaAC/vjBy
         WUmw==
X-Gm-Message-State: ABy/qLZbkjD134vnM0PFEWOU4e7AA65iFzvjOTu1c/m2pyR5t5Jb9zoX
	xk8Y+oKVkEU2WLLGAjAl5z5IzjcjejU=
X-Google-Smtp-Source: APBJJlH4HLzztTUvXFvRza8S9/3YYv6IK6inA3R8WZ1u+8ULnV98HJoOG58L0mkqF6EooPM4pxcEHQ==
X-Received: by 2002:a0c:8ecb:0:b0:636:39ed:4de0 with SMTP id y11-20020a0c8ecb000000b0063639ed4de0mr7406110qvb.10.1688959235190;
        Sun, 09 Jul 2023 20:20:35 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d15-20020a0cf0cf000000b00630228acc45sm5039863qvl.145.2023.07.09.20.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:20:34 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/15] linux-yocto/6.4: aufs6 integration
Date: Sun,  9 Jul 2023 23:20:19 -0400
Message-Id: <2fe51d10e6c4e580e76510da196d04b1975337b5.1688958789.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688958788.git.bruce.ashfield@gmail.com>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 03:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184050

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We still offer aufs support for some container / virtualization
workloads. The project is still up to date with 6.3+, so we grab
the patches and make them available on v6.4/standard/*

As usual, v6.4/base is pure k.org + -stable if you don't want
things such as aufs.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               |  4 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 524cd95ac3..21eae02ae9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
-SRCREV_meta ?= "7468cf421d9c83d16e44c281b123433d875ff0f9"
+SRCREV_machine ?= "40dfcb393658098382d48669718a1cb16674c833"
+SRCREV_meta ?= "4541301322a156977eadc19cbbb8f0a57f4dc06a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 9e2a3e68f9..e6809a4f28 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
-SRCREV_meta ?= "7468cf421d9c83d16e44c281b123433d875ff0f9"
+SRCREV_machine ?= "40dfcb393658098382d48669718a1cb16674c833"
+SRCREV_meta ?= "4541301322a156977eadc19cbbb8f0a57f4dc06a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index dd68c640d5..8117c4a04e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -17,18 +17,18 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "402087b6abe0e50ec75d0b71b4c928ee0b858b72"
-SRCREV_machine:qemuarm64 ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
-SRCREV_machine:qemuloongarch64 ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
-SRCREV_machine:qemumips ?= "b83174914441d8780f080e73d473133e2c5b797c"
-SRCREV_machine:qemuppc ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
-SRCREV_machine:qemuriscv64 ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
-SRCREV_machine:qemuriscv32 ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
-SRCREV_machine:qemux86 ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
-SRCREV_machine:qemux86-64 ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
-SRCREV_machine:qemumips64 ?= "a08de9073de96586993c5d8c1f0ebcdc35874ebf"
-SRCREV_machine ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
-SRCREV_meta ?= "7468cf421d9c83d16e44c281b123433d875ff0f9"
+SRCREV_machine:qemuarm ?= "7e1be3b6ae5d05b30112b68fb92cad00b8ffdf49"
+SRCREV_machine:qemuarm64 ?= "40dfcb393658098382d48669718a1cb16674c833"
+SRCREV_machine:qemuloongarch64 ?= "40dfcb393658098382d48669718a1cb16674c833"
+SRCREV_machine:qemumips ?= "de409c37f1d2c5eacea9c33dc42117cb107aa305"
+SRCREV_machine:qemuppc ?= "40dfcb393658098382d48669718a1cb16674c833"
+SRCREV_machine:qemuriscv64 ?= "40dfcb393658098382d48669718a1cb16674c833"
+SRCREV_machine:qemuriscv32 ?= "40dfcb393658098382d48669718a1cb16674c833"
+SRCREV_machine:qemux86 ?= "40dfcb393658098382d48669718a1cb16674c833"
+SRCREV_machine:qemux86-64 ?= "40dfcb393658098382d48669718a1cb16674c833"
+SRCREV_machine:qemumips64 ?= "b14484af5492f03c8afc25f3684c8ae86a78295f"
+SRCREV_machine ?= "40dfcb393658098382d48669718a1cb16674c833"
+SRCREV_meta ?= "4541301322a156977eadc19cbbb8f0a57f4dc06a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


