Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E188C433F5
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 01:25:22 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web10.1642.1646443522038740308
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mTLkqjfN;
 spf=pass (domain: gmail.com, ip: 209.85.221.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id i133so3063703vki.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N2RlFi+BESctEtPpz1HYnidwh4oNWAm+ZoNdATJb10A=;
        b=mTLkqjfNsqSFZ+gZoOdnZEG/fkh0YGhUrkdS52McuMg7/PPw+t1tUvRX3mLJnh+JNQ
         3hrgJ3eAbbC/VTUhACeB594b7GwgSsAkwuUrry8A4sjtTGYu3HtDQTr1kUuk08wjiCGx
         uZO7i65d2oDV5f7jp8Ft1L7Zo5tmAFrwdVhsbZnBFgDs1tiKcmoX70UIprbQxqoGk5p/
         lSH/UOUgjOI1nBs4KhOoVKUXcRJZ+aBiHeJq2yIxhvIddpf7v8Ouw7Yf/GCJQn8ccaks
         rvYCf1f3GUKCMX8xzp3HmJ17n/NmQuJeTUMJYfS7PR3LFQK09yq5JEC1EvbUq986fHZW
         0inQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N2RlFi+BESctEtPpz1HYnidwh4oNWAm+ZoNdATJb10A=;
        b=hTsd8iCV37qvBGcvTm7UYxpOLvqQM17RQlULYH0pRszK4ur6i+8EKPGUW3/DpXZsF4
         uIw1FDUifDOl0j5OjUgw3RZ2JRfqrLB8nHsUxOXB0wMD5z2tm5beIB1W9jKW+DpNUIC9
         Mjs3Zorg+ZBo5+8aj5RsSGZnH6NanKfwr0p3kHo9LSxVE2hXnLwZjdOcsOeHGInLww/C
         mMw7Lf1TmHogqhjO64F+/eq88iPinPittZohuEMdnPdxCnsqiXULr44K1l6CZxlrmT4F
         ujSt3H+i+mmMeU59wBXCa1SsgNlPsKxWCVO4w+jcbE3xiE632L7Uk5VC4BzhKEdF9fMh
         nMJg==
X-Gm-Message-State: AOAM533gvKlKVuC5eBSknlBHZ+CPiwd6pSrhkS0GAixLjk50jyESDAiz
	2ucBO5r8FcbrW8Z+5NTEVMIK3oFJeM+wCA==
X-Google-Smtp-Source: 
 ABdhPJx+6RP4w3n3J7zakYsS+sOaxaGBrLZpKc4r5pLIoZMfRwN300/EVQ4p+ZkRMFhXWjRcbQQwKg==
X-Received: by 2002:a05:6122:1348:b0:32c:bcba:ecda with SMTP id
 f8-20020a056122134800b0032cbcbaecdamr582212vkp.39.1646443521084;
        Fri, 04 Mar 2022 17:25:21 -0800 (PST)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q9-20020ab02649000000b0034a4433fe82sm1053934uao.36.2022.03.04.17.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 17:25:20 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] linux-yocto/5.15: riscv64: drop MAXPHYSMEM_128GB
Date: Fri,  4 Mar 2022 20:25:09 -0500
Message-Id: 
 <4a4203b2fa0c711eedbd2d5a96e3679f1563dfca.1646443420.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1646443420.git.bruce.ashfield@gmail.com>
References: <cover.1646443420.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Mar 2022 01:25:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162766

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto:

    commit e1b976ee4fb5af517cf01a9f2dd4a32f560ca894
    Author: Bruce Ashfield <bruce.ashfield@gmail.com>
    Date:   Tue Feb 15 23:27:31 2022 -0500

        riscv64: drop MAXPHYSMEM_128GB

        The MAXPHYSMEM config options have been removed upstream via the
        following commit, so we drop our setting.

           commit 6250ecf5ba42292b652cd01c9fcb2239010c5c44
           Author: Alexandre Ghiti <alexandre.ghiti@canonical.com>
           Date:   Mon Jan 17 10:57:16 2022 +0100

               riscv: Get rid of MAXPHYSMEM configs

               commit db1503d355a79d1d4255a9996f20e72848b74a56 upstream.

               CONFIG_MAXPHYSMEM_* are actually never used, even the nommu defconfigs
               selecting the MAXPHYSMEM_2GB had no effects on PAGE_OFFSET since it was
               preempted by !MMU case right before.

               In addition, the move of the kernel mapping at the end of the address
               space broke the use of MAXPHYSMEM_2G with MMU since it defines PAGE_OFFSET
               at the same address as the kernel mapping.

               Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
               Fixes: 2bfc6cd81bd1 ("riscv: Move kernel mapping outside of linear mapping")
               Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
               Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
               Tested-by: Conor Dooley <Conor.Dooley@microchip.com>
               Cc: stable@vger.kernel.org
               Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
               Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 9b652a797b..22385ad38c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "c5b3006ccedbb8397aa58b667b981e0c2435b943"
-SRCREV_meta ?= "2d38a472b21ae343707c8bd64ac68a9eaca066a0"
+SRCREV_meta ?= "e1b976ee4fb5af517cf01a9f2dd4a32f560ca894"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 754dbc7d60..ae72f34c26 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "66d56b3bcc1391639a84e35be3ef00c5197089a8"
 SRCREV_machine ?= "7f685244afb3acd13e94968312580b63d7296705"
-SRCREV_meta ?= "2d38a472b21ae343707c8bd64ac68a9eaca066a0"
+SRCREV_meta ?= "e1b976ee4fb5af517cf01a9f2dd4a32f560ca894"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 4b5e332c37..43409fb45e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "7f685244afb3acd13e94968312580b63d7296705"
 SRCREV_machine:qemux86-64 ?= "7f685244afb3acd13e94968312580b63d7296705"
 SRCREV_machine:qemumips64 ?= "1d269d782d6b6effed2437ad6b11ae4f4e789259"
 SRCREV_machine ?= "7f685244afb3acd13e94968312580b63d7296705"
-SRCREV_meta ?= "2d38a472b21ae343707c8bd64ac68a9eaca066a0"
+SRCREV_meta ?= "e1b976ee4fb5af517cf01a9f2dd4a32f560ca894"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


