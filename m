Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62516C47089
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:23:42 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.44616.1669904600366642784
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cxnh5F3m;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id s7so1780655plk.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHV8/QzK5Z2PYPBwL5gmHUYBLA44LGBDBFsI0o5Rk+w=;
        b=cxnh5F3mkXUww/CUtbXWodvJdL/sspTGgHgswiMIHZLKiT5P3Joe1UoDLdf73Ppi3E
         50OKgcjzHy5gn3V90NHgHpu4ZXSup6+LO4UKq5PHfhHERus5qmSldt88ObjurkYaa4HH
         CWRFbvUThNVH9grsz6oxG+rizfMIUiNBwuw1DrucAQBxGuk3dc4U/Y+zOYVU/dvJpdoH
         EETMQNlt5K22VFXVghlKS48PYEXLqzgDwWrAuUBmN2oFhdlnO4GJ6+MzPLRwSLYXrzn0
         sKfSUu+BmREXAG9i4Yd99ooLV6zEjU9kpB9b6llXUTISPk0ZLVHRkqRY9lvmETZeHUGp
         FxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHV8/QzK5Z2PYPBwL5gmHUYBLA44LGBDBFsI0o5Rk+w=;
        b=INcVGupspAzPqjjmbazrR+KCYqzR2yHVAOKTqSViOP20ZxhyENvctPhElK3WPROX9q
         cf5OAGh8YeJxm+SRKYuBPSPRG2X13q4H4q9wZEgi/pM3Ew1wMRm2k1R7YheKDEeT/DRT
         GfINVEePX/Hx+9uy5fY4xB0bda/8DINOEqfkWbN+VuJll3+VQEEgcNacshwvZFtsNCuV
         yYVHMZ/h6rMxCnryrDp7TJdwN/QCpuKMtDER2XR1hKDNzB1OxldwcSS2phMO8JBSTKiN
         m2Bd/snNV3tAJCAoNJo4MwMKyyPYaVWhCNb6mFuK2abhcLFypE4h+JP4uo8W6YhKZMO6
         sMOg==
X-Gm-Message-State: ANoB5pn5NVS4YatFMGAe54VzLzNX4onlvPKdK93xvLxPFEfDqB6zdfnA
	Xi4JcsUvmyQ459o0k/5NPnQA3rlDxOWeI4y+UZE=
X-Google-Smtp-Source: AA0mqf4uCN82xDMjFoblc+/qQMgrUePOQUBWLuzLi77R5VoULSiG+PF7MyXrNswa55TJzXJtuYnQbQ==
X-Received: by 2002:a17:90a:6308:b0:218:ce1c:4c76 with SMTP id e8-20020a17090a630800b00218ce1c4c76mr48393320pjj.97.1669904616312;
        Thu, 01 Dec 2022 06:23:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 14/22] linux-yocto/5.19: fix elfutils run-backtrace-native-core ptest failure
Date: Thu,  1 Dec 2022 04:22:44 -1000
Message-Id: <52e2d574626075e2890021f1ede127c5eabd92b7.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904433.git.steve@sakoman.com>
References: <cover.1669904433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174077

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The following commit was integrated into the 5.19.15 -stable series and
breaks the elfutils backtrace ptests.

 don't use __kernel_write() on kmap_local_page()

It could be that other commits are also required in -stable, but a
revert is the easiest way to deal with the regression. We can revisit
newer kernel's (where the commit is also present) if they also start
to fail the test.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit e137ca045d21476394b12725447affe4c99b8e03)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.19.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.19.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 20 +++++++++----------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index 5c316dbaf3..de087eabd4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2bd6711a4dcc49e51ae68152ed0b40384e291554"
+SRCREV_machine ?= "7883e2f6464fb14e4652769c0294b2eef8075f5f"
 SRCREV_meta ?= "0cba9aa40445bf59bfa651e1bd43a31c2ca7d524"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index 27fa6d9867..20ee864401 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_machine ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
 SRCREV_meta ?= "0cba9aa40445bf59bfa651e1bd43a31c2ca7d524"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 44bb02b9c1..8d891fe01c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "dfb2a8b83c0e37732dd930330132b692409f7321"
-SRCREV_machine:qemuarm64 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
-SRCREV_machine:qemumips ?= "b0e7e098c3fc9f2309e74137de4b8a5fcbaa2779"
-SRCREV_machine:qemuppc ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
-SRCREV_machine:qemuriscv64 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
-SRCREV_machine:qemuriscv32 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
-SRCREV_machine:qemux86 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
-SRCREV_machine:qemux86-64 ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
-SRCREV_machine:qemumips64 ?= "20d5adcd760ffdc90b4e5babb85a07b9d6ff3113"
-SRCREV_machine ?= "ccb5f0a475b228c995800cb1b0f714426c2f1ec8"
+SRCREV_machine:qemuarm ?= "dee954e39057710f00e5b3ea23514d01f3a4d940"
+SRCREV_machine:qemuarm64 ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
+SRCREV_machine:qemumips ?= "fe2b95c83e022371019027da3dd068ab33576d3f"
+SRCREV_machine:qemuppc ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
+SRCREV_machine:qemuriscv64 ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
+SRCREV_machine:qemuriscv32 ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
+SRCREV_machine:qemux86 ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
+SRCREV_machine:qemux86-64 ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
+SRCREV_machine:qemumips64 ?= "a5f29b9c64f2b3b47f74fee38f298d8a6b17a8b3"
+SRCREV_machine ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
 SRCREV_meta ?= "0cba9aa40445bf59bfa651e1bd43a31c2ca7d524"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.25.1


