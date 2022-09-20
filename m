Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 783C6C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 22:15:47 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.3432.1663712139014858236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 15:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XLcdGDlF;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id m9so3136082qvv.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 15:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=maGK1WqAt4Zm2MOdt9Ehuw2fLpaAqbZ6ssQNi7MIMJs=;
        b=XLcdGDlFXq69im+RSroLNcQLtADmR8rhyNEb5R9Ur7V3P1sgnAyWlTNaeLABCwlF8s
         etxE4Jd1S17AvzlNgOUKp4uGl+OMUdIa9/uxgkyTh2URFgQb49GCJ4lwwBdxXU+89icI
         I0DvovtYucTb8L0kdb5RkRITzVe43EVPPzZwUWzqeaW6bXjvJJpvfDNCUWK5oJaK14fe
         wIoGQUr3D7XQ92k/a5GecDZ0P5/GvcJIXt+AK9YzyJld0OxBDLo0m9ivpqyT2BoDfNmI
         1svaQhTjDfvPsZpdmBEAQm/DLqulLixxp6ccPKOzTr1dGqXJ+p3wYdykzR35907l8IDT
         lWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=maGK1WqAt4Zm2MOdt9Ehuw2fLpaAqbZ6ssQNi7MIMJs=;
        b=VXjkszDXDCX0LtjcQ5fHEWXgC1wHHQ3ct5FyVpRmHjD8f9sdfbVot2fyvRkSAadLIn
         bJW8iXWu4SEtCURvWW9cYSwsyy1Tir9GAgAFWdroXFs5wtd6sbids9+FV6HVRLxoiVeZ
         SttyjGHbgn2alNRc8+tlbLvnUhp/GZis32ZHUsg3iS79dL2+BwwGr1sTeTVBSn9LoV+p
         TlITrLL8LmKLQM0wkga6ejWRbHNDdXtdWiHEgQei+ltF10c52NhEQ7XTJlk0m4rqjVLd
         cHvT1rVu/sPL/BRXQT8D13kWGvKdBqXnHSZFu/yH4sK5nx0uVQqr3hEAstcU12N922cw
         r9BA==
X-Gm-Message-State: ACrzQf1iJm6TxGNHJlY/Sj0xQlOXUBuqrBjaCDEVyxvpjvNNDEHCGwCr
	0lfIFaOp6q34i6bHgCsrjFs=
X-Google-Smtp-Source: 
 AMsMyM4gWerYU64P0cdWuwETnsQqKUK33d7fk8REoCzPM9D2G/QlXaERAgiC+Fis5PM4zFQeDNUQlw==
X-Received: by 2002:a05:6214:62c:b0:4aa:b05d:c5b8 with SMTP id
 a12-20020a056214062c00b004aab05dc5b8mr21176004qvx.49.1663712137907;
        Tue, 20 Sep 2022 15:15:37 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 v10-20020ac8748a000000b0034355a352d1sm437614qtq.92.2022.09.20.15.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 15:15:37 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.19: cfg: fix ACPI warnings for -tiny
Date: Tue, 20 Sep 2022 18:15:35 -0400
Message-Id: <20220920221535.48284-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 22:15:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170913

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    acpi: fix defaults for x86 and qemuarm64

    commit d334505d98a85ffe7549026d10e43cccd897e19c [efi.cfg: Drop ACPI dependency]
    is generating configuration warnings on both qemuarm64 and x86 for the
    poky-tiny configuration.

    x864:
      - because we configure tiny with allnoconfig, and then apply our
        fragments, the default of ACPI=y for x86 doesn't hold. We need
        to exlicitly enable it. We put it in the x86 fragment, to avoid
        bringing warnings back for arm32

    ARM:
      - We can't assign to ARCH_SUPPORTS_ACPI, as that is a select only
        value. The only selector for that config in arch/arm is CONFIG_EFI.
        The default of CONFIG_ACPI was added to support EFI if required,
        but since CONFIG_EFI takes care of the selection, we don't need it
        in our BSP configuration.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

This fixes the configuratino warnings on x86 and arm64 in my local
testing. I haven't run all archs yet, but wanted to get the patch
out after the first two came back clean.

This applies right on top of my previous series.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.19.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index 29b7760298..17ae94066c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3596666292dcf3fc078090666dc327d233695310"
-SRCREV_meta ?= "829511f25a4a868d33019ace607dc7f0a14d3105"
+SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index 65b7070e6e..c18278ad79 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
-SRCREV_meta ?= "829511f25a4a868d33019ace607dc7f0a14d3105"
+SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index bafe57df0e..4fc1ae9245 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
 SRCREV_machine:qemux86-64 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
 SRCREV_machine:qemumips64 ?= "99613988297ac45653cc81319e63b2821645a3ba"
 SRCREV_machine ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
-SRCREV_meta ?= "829511f25a4a868d33019ace607dc7f0a14d3105"
+SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


