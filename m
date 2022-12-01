Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA80C47088
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:23:32 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.44627.1669904609142991441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zMpmZtGN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id v3-20020a17090ac90300b00218441ac0f6so4300668pjt.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hc3MwfUCQKYtQISGdOSja8zLTXmBs0lYoPZ3THAUNWQ=;
        b=zMpmZtGNn19F6e37qW8JSJaagHxobGTLRq+EcICr/dnAnEH7dZSAB9S1hT4+n08UwR
         qHs9/971ldMWnlXAAu0BFeOkeHJn5nI+fQ5kDNOUTNUXMT9huEYjdzFbXJP93YcZaYtB
         VR53uqnFxL8IW9IYZ9wTHW0gwTJJw+4+Bfx8kwrdGTURhPIC5obnkrTCMyRm+p2utPyO
         M/sJ47ShwV5FTRp4rz4W/i1VZaMRAwRL1w6tnxawMFKd3JoAf+Wavh7J/VGVIJQlArZj
         W8Co6Cf0gohJx0EU4jH8feuh2VBaKahdw0A7BN3JYiephbe2NrRZDDfVgM3ut8MOYqiH
         sZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hc3MwfUCQKYtQISGdOSja8zLTXmBs0lYoPZ3THAUNWQ=;
        b=AdqqxMUjBrdETrTFjFb5RXI63cmcUGWtqG5gjyKKVU/bffi24CptnPJ1dcsIjWhuHd
         w22WiQF7MNhNfsYEs5AoYu6nqmHtdBKqbURaMZb12amHaxTPUVkrFmd4yhk1ss2xWW14
         InHJBUJ/3lFM1fC2WEqZnPsJQJxeozs0CKLbfcmf3aR54AlHRWiH4Nz+NgrXVqnas4ZX
         jfNCv4STFQguPdkAu5edQVq0Ly9AB8v/kNoMVrtoJDPT+m3hYp7L1LE+Nf07ibq6Pd8I
         TK9UAkEkDiIIy6oNtLgjWhjDfbKFTq9tc1EjdgdkclhIBHoIMoFlSVGRJatmUAY1Gfmi
         63yA==
X-Gm-Message-State: ANoB5pnWIhaFdKUV8wtTz3Zl/tJrg4B3++vNKmNuVYQPKrFJA5dm3AtE
	nohs7tGlJXS9mbchtQ+wMYoXQmhzV6sz0+KYDAo=
X-Google-Smtp-Source: AA0mqf4sKtPnFANXDkCJG1dXEtfaKrSq1lXXpNCLP9KQ65MOd0LSEHvGtkNVf27V4W9Wf26U4g7Oqw==
X-Received: by 2002:a17:90b:3d0a:b0:213:3521:f83a with SMTP id pt10-20020a17090b3d0a00b002133521f83amr69395016pjb.84.1669904608148;
        Thu, 01 Dec 2022 06:23:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/22] linux-yocto/5.19: security.cfg: remove configs which have been dropped
Date: Thu,  1 Dec 2022 04:22:42 -1000
Message-Id: <8f99d5d110d2f014f5d713cf4684b33c6e68a451.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904433.git.steve@sakoman.com>
References: <cover.1669904433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174075

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    5e122351f62 security.cfg: remove configs which have been dropped

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 415a73daee7152bd67cd99625093bc72d9be73c4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.19.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.19.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index f78ade3e10..2b12b8b8df 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "59a2ffca6673305b3b9e3186294feb5437698d18"
-SRCREV_meta ?= "399055aee2fe59fbde5f7f9aadcc953bf49222f4"
+SRCREV_machine ?= "2bd6711a4dcc49e51ae68152ed0b40384e291554"
+SRCREV_meta ?= "7381acde368f24529d8c9face1826fb54bf7feee"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index f34ec707ae..0dd3816dc5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_meta ?= "399055aee2fe59fbde5f7f9aadcc953bf49222f4"
+SRCREV_machine ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_meta ?= "7381acde368f24529d8c9face1826fb54bf7feee"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 0447d500d2..b242dfa27a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d789efca1869e21f1c275fd2e46f2eada1698f8d"
-SRCREV_machine:qemuarm64 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_machine:qemumips ?= "7216e7029faf5685256b3ce57d3be1c371c56267"
-SRCREV_machine:qemuppc ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_machine:qemuriscv64 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_machine:qemuriscv32 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_machine:qemux86 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_machine:qemux86-64 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_machine:qemumips64 ?= "4e9603752156d3a0b9fe53309f4bc78d3f4f7df5"
-SRCREV_machine ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_meta ?= "399055aee2fe59fbde5f7f9aadcc953bf49222f4"
+SRCREV_machine:qemuarm ?= "dfb2a8b83c0e37732dd930330132b692409f7321"
+SRCREV_machine:qemuarm64 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_machine:qemumips ?= "b0e7e098c3fc9f2309e74137de4b8a5fcbaa2779"
+SRCREV_machine:qemuppc ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_machine:qemuriscv64 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_machine:qemuriscv32 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_machine:qemux86 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_machine:qemux86-64 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_machine:qemumips64 ?= "20d5adcd760ffdc90b4e5babb85a07b9d6ff3113"
+SRCREV_machine ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_meta ?= "7381acde368f24529d8c9face1826fb54bf7feee"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.25.1


