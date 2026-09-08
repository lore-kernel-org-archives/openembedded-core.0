Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D511FC79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 01:17:41 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9885.1788830258925822542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 18:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Bq0LQPdz;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-90e7d9c747eso53459646d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 18:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788830258; x=1789435058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o3jej7DLzVbiKENuKc57QOlJEbBf1km09uu/g9S6GQ8=;
        b=Bq0LQPdzrWo1jfx49sYrwwuTS66iRn75543gK+GJ/CZkhN/PdV0eMP5V4kBrhFMFXg
         v3VJ9NGkW1DacbVoa8e2+KLlCQWVhjJ8nPH32N6Dq58NglUOJtNw5E7hBlgrbKwvbr9l
         DH+Gvfpu9Fg9I4mGWYRV/FdCMnCn2IXk65QSmFS0wYJcUFsMzS/1h4PtjppLS/LxcZol
         JiTrr7a9dstM8gWUZQvyeEjsnXQ3Akm+rO1BH0+lbuIJn8arSQruAk2x9rlpDvsvKYz4
         dnkhU+RrXx5rn89NJ9jZ2DCNjCBhOX1iTtGBbXZTElkWLjuV0JUmYeZidi98fbXHUmF7
         9usA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830258; x=1789435058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o3jej7DLzVbiKENuKc57QOlJEbBf1km09uu/g9S6GQ8=;
        b=K5Xhe52p8b2PrIf3+s1hWkUmuc0GemAezyaWU3IhUxkQSLfiSr9Csl7+XyX4pdCvx6
         Ra+NOw9pfuxHTYAnJJQBN4XktBuedw+ALAEvsK+HgeojR/Q416+m1MXoxncK6oidn024
         VziHYMKPd1+Rb7CE2KEfV5yMV3mo+JC38IkVXsovyqQwzsNVB+2bsrOW/rufSPov6z5W
         OaHgKJlnapP2eYtfOKbCmD8XxJTXVrxdmjmvR/XzDXrdAgqhswCo5z7N7+2fw3+aTCLO
         RnGVVmVn0PHrbUQVGJXOCw0VlObgGDWAg5vQvkrhykPqP+0zGaPWpf29m63plDn5wEVO
         4DaQ==
X-Gm-Message-State: AFuF++l7IZiGrREFZ2F5apzp/j5omvujTm3JZOHhXl/XMAsdprHPjOFQ
	ge35swpbgFun7eUcaHFpfKgacC11mxgDsbQUY0OwCp+xUlWwBby+I1c8h/k8q7X8
X-Gm-Gg: AYBFou2MAMIUrvD2hxFXKu92FHvD7kxUw0mNZg/Vhg4KFXoxwFmjky3e/sqi91hx4NS
	Jm9MTkqmASXJknC6+dHeAnReWTDlKZlxM3OLzjF+Le+FhLWbANc0oGJBZNofeufI3zurQMH2bIC
	jOx4+OP9FsP7IFEVnqZDh33tMe53mK1ds45D9v24ACA28Z99yQjTRDHr30WOdUMLgDQ3bf8Vflr
	X3FhT0rcAm5g0qyvUaTwIiNTLu7/ulHjN2Mt2eUBCP3qwh/m40aJ7igkmo+RCEzSIUD9uY4EnKf
	yeW21bIHVnAB7SGVyCWql0V4ouCxVSAcJ370I3cQk6uiHx3DDYkfrF2Cve6xkhRS782dIrGUFHX
	esE7wJJzx//vJp/jzMIL51eljdl1Tu3QWIVnoCFxcMxnvV9csnxSpFZtyoDOuBbL05NEv+lDink
	Dd6rkaDMrxEPTqUlh9ZUl3pA/Z635KzMdANQAMdiwnDUzhjNTcwnm3VSLjv1FE3trkjHLgVpein
	CHLyBpmgBhJuQPR20fmPMs/iSBZ946oO+cSoxwQiZAc4mbr1LTgEyXVqsVp8B5hDLyWy/r8FpMo
	29vO5BmM36YsQ3pXFzfwswwSnZRYcKRcXnNvyoeJMDwFCzbiZgsBxFY4qy5TkwjtBr70tZKyhvr
	jAbHU
X-Received: by 2002:a05:6214:2269:b0:910:3453:7d8e with SMTP id 6a1803df08f44-9103efc451emr346239666d6.35.1788830257509;
        Mon, 07 Sep 2026 18:17:37 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104049d30asm105271876d6.0.2026.09.07.18.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:17:36 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 03/05] linux-yocto/6.18: rt: update to v6.18.37-rt6
Date: Mon,  7 Sep 2026 21:17:28 -0400
Message-ID: <20260908011731.2895743-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908011731.2895743-1-bruce.ashfield@gmail.com>
References: <20260908011731.2895743-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 01:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245315

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.18:

1/4 [
    Author: Sebastian Andrzej Siewior
    Email: bigeasy@linutronix.de
    Subject: v6.18.13-rt4
    Date: Wed, 25 Feb 2026 11:35:17 +0100

    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
]

2/4 [
    Author: Sebastian Andrzej Siewior
    Email: bigeasy@linutronix.de
    Subject: v6.18.35-rt5
    Date: Wed, 17 Jun 2026 09:43:08 +0200

    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
]

3/4 [
    Author: Sebastian Andrzej Siewior
    Email: bigeasy@linutronix.de
    Subject: ARM: Fixup the stable merge.
    Date: Mon, 29 Jun 2026 16:47:21 +0200

    This a merge fixup, properly replaces
    	ARM: mm: fault: Move harden_branch_predictor() before interrupts are enabled
    	ARM: mm: fault: Enable interrupts before invoking __do_user_fault()

    with
    	ARM: ensure interrupts are enabled in __do_user_fault()

    It is needed because "other" patches were applied as part of the stable
    series. This contains the patches that were applied upstream.

    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
]

4/4 [
    Author: Sebastian Andrzej Siewior
    Email: bigeasy@linutronix.de
    Subject: v6.18.37-rt6
    Date: Mon, 29 Jun 2026 16:52:33 +0200

    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.18.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index a0c2abf1c5..55f3fe8907 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,8 +15,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "40cf3a2e9ae15c3d4b3a528d4de015263639cac3"
-SRCREV_meta ?= "185549fc38a492dc3e431b32ac6774620ae6b468"
+SRCREV_machine ?= "c82ff0cbda2a00b9073e06c9fe4ba550c9056d45"
+SRCREV_meta ?= "c8484925c85ec1e6510c75d9e1b36e01d6e2e904"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 0d4c98f284..3b1342d677 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
-SRCREV_meta ?= "185549fc38a492dc3e431b32ac6774620ae6b468"
+SRCREV_machine ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
+SRCREV_meta ?= "c8484925c85ec1e6510c75d9e1b36e01d6e2e904"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 1a7a8659bf..8030143479 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,18 +17,18 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "1cd95e881ac1b4f07906bd0e9482891e12f84a83"
-SRCREV_machine:qemuarm64 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
-SRCREV_machine:qemuloongarch64 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
+SRCREV_machine:qemuarm ?= "0f778c0a178fdc50063c212b5320b1f082f83f1a"
+SRCREV_machine:qemuarm64 ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
+SRCREV_machine:qemuloongarch64 ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
-SRCREV_machine:qemuriscv64 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
-SRCREV_machine:qemuriscv32 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
-SRCREV_machine:qemux86 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
-SRCREV_machine:qemux86-64 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
+SRCREV_machine:qemuppc ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
+SRCREV_machine:qemuriscv64 ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
+SRCREV_machine:qemuriscv32 ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
+SRCREV_machine:qemux86 ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
+SRCREV_machine:qemux86-64 ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
-SRCREV_meta ?= "185549fc38a492dc3e431b32ac6774620ae6b468"
+SRCREV_machine ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
+SRCREV_meta ?= "c8484925c85ec1e6510c75d9e1b36e01d6e2e904"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


