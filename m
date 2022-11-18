Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16899C4167D
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 22:29:12 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.7447.1668810547777339489
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 14:29:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LFj/BRQr;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id x21so4492637qkj.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 14:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eowY4yPdq/c00hj1IPTCES/wRE1kma8M8AYdLzY9xtE=;
        b=LFj/BRQr6topzvf8BzlPh4HFvR53blMABoS81piTJXWFOogUlVADO1Y2LAOjasfhFR
         SDlcUVVgYqlMHLA6q+Y4NSWc0u05JXzsf2aKwMBW5Rydlq9OGTEfPHOV1KI/V1egmme2
         BvnN2eIGoFYrfArophEjKxOXDuZAH/VvaElbIYjIMCQAcWtRZjjdu9OQhPHmStWDUPFs
         v3NvpNY9+xBwxfzE8RyB7eRWrBgB9/kqtEja3VBJR8shOCKaMXSWMbw0RWfQhfY4P28s
         jly2D75UgYij5mHaAB7iMlj24CsiLkVA3sdPB+X1xcF9LiCG6dD5lvqW0wSbKYQtudyC
         AE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eowY4yPdq/c00hj1IPTCES/wRE1kma8M8AYdLzY9xtE=;
        b=IVKRNPtC+FFXgg5toyCzFYNrHYD+ppxdoquafLVRsBUstPEaXo3xx3PJcHsU+5Aes8
         IU0AZFm7d5SYaOA0qrsdlnJt3r2ym+PSuqD6/c4/Mt4iijiw0yUFFuZFDkOO9uxBwJ2D
         2w5Hvk/gzAYZUojkh3a80EpDkbU6O7gH0DBHys7RATXqgfoDCMPiA2rUu3qXW4LPAqHy
         NtsaUk3TMlQ2ak6AzbsoMyhp+yPFuGB1HrIZGZq2tSlKIlavF4RUjpVr+Dd4rDso7Est
         ax+fXd2/ninctBk933hK75YL8s+Iprz1CzKonDSMEcwKu0SmBHiIoRKIW1sRXRSJdw8Z
         3Gxg==
X-Gm-Message-State: ANoB5pm5xXnBHU+DTCYNY4DcC+kZ1RnYa4ZBPVn9tKbmIe3GHmDD+iaz
	7aLLRryTg8spQ2mHo6UgjbRP6ulzenXphQ==
X-Google-Smtp-Source: AA0mqf5AlpVe0XOUJW+iQAjNtJX9/hORw9Y+/iq+THawBhHPRGQ603bp2bqecqufRBRPtPh0nlkfXw==
X-Received: by 2002:a37:e314:0:b0:6fa:55e4:c574 with SMTP id y20-20020a37e314000000b006fa55e4c574mr7780264qki.421.1668810550348;
        Fri, 18 Nov 2022 14:29:10 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id h9-20020a05620a284900b006f9ddaaf01esm3304068qkp.102.2022.11.18.14.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:29:09 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/15] kernel-devsrc: fix for v6.1+
Date: Fri, 18 Nov 2022 17:28:53 -0500
Message-Id: <71cfe4b75e2078194882ea32325683dd88050536.1668810409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668810409.git.bruce.ashfield@gmail.com>
References: <cover.1668810409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 22:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173503

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 6.1 kernel has a number of Kbuild and architecture changes
that required us to update our devsrc recipe. With these changes
we are once again able to build on target modules for all
supported archectures.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 25 ++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 46d706b955..253b8d307d 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -145,6 +145,9 @@ do_install() {
 
 	cp -a scripts $kerneldir/build
 
+	# for v6.1+ (otherwise we are missing multiple default targets)
+	cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
+
 	# if our build dir had objtool, it will also be rebuilt on target, so
 	# we copy what is required for that build
 	if [ -f ${B}/tools/objtool/objtool ]; then
@@ -171,6 +174,9 @@ do_install() {
 	    # arch/arm64/include/asm/opcodes.h references arch/arm
 	    cp -a --parents arch/arm/include/asm/opcodes.h $kerneldir/build/
 
+	    # v6.1+
+	    cp -a --parents arch/arm64/kernel/asm-offsets.c $kerneldir/build/
+
             cp -a --parents arch/arm64/kernel/vdso/*gettimeofday.* $kerneldir/build/
             cp -a --parents arch/arm64/kernel/vdso/sigreturn.S $kerneldir/build/
             cp -a --parents arch/arm64/kernel/vdso/note.S $kerneldir/build/
@@ -206,6 +212,9 @@ do_install() {
 	    cp -a --parents arch/powerpc/kernel/vdso/*.S $kerneldir/build 2>/dev/null || :
 	    cp -a --parents arch/powerpc/kernel/vdso/*gettimeofday.* $kerneldir/build 2>/dev/null || :
 	    cp -a --parents arch/powerpc/kernel/vdso/gen_vdso*_offsets.sh $kerneldir/build/ 2>/dev/null || :
+
+	    # v6,1+
+	    cp -a --parents arch/powerpc/kernel/asm-offsets.c $kerneldir/build/ 2>/dev/null || :
 	fi
 	if [ "${ARCH}" = "riscv" ]; then
             cp -a --parents arch/riscv/kernel/vdso/*gettimeofday.* $kerneldir/build/
@@ -234,6 +243,9 @@ do_install() {
             fi
 
             cp -a --parents arch/arm/kernel/module.lds $kerneldir/build/ 2>/dev/null || :
+            # v6.1+
+            cp -a --parents arch/arm/kernel/asm-offsets.c $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/arm/kernel/signal.h $kerneldir/build/ 2>/dev/null || :
 	fi
 
 	if [ -d arch/${ARCH}/include ]; then
@@ -282,15 +294,24 @@ do_install() {
 	    # objtool requires these files
 	    cp -a --parents arch/x86/lib/inat.c $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/x86/lib/insn.c $kerneldir/build/ 2>/dev/null || :
+
+	    # v6.1+
+	    cp -a --parents arch/x86/kernel/asm-offsets* $kerneldir/build || :
+	    # for capabilities.h, vmx.h
+	    cp -a --parents arch/x86/kvm/vmx/*.h $kerneldir/build || :
+	    # for lapic.h, hyperv.h ....
+	    cp -a --parents arch/x86/kvm/*.h $kerneldir/build || :
 	fi
 
+	# moved from arch/mips to all arches for v6.1+
+	cp -a --parents kernel/time/timeconst.bc $kerneldir/build 2>/dev/null || :
+	cp -a --parents kernel/bounds.c $kerneldir/build 2>/dev/null || :
+
 	if [ "${ARCH}" = "mips" ]; then
 	    cp -a --parents arch/mips/Kbuild.platforms $kerneldir/build/
 	    cp --parents $(find	 -type f -name "Platform") $kerneldir/build
 	    cp --parents arch/mips/boot/tools/relocs* $kerneldir/build
 	    cp -a --parents arch/mips/kernel/asm-offsets.c $kerneldir/build
-	    cp -a --parents kernel/time/timeconst.bc $kerneldir/build
-	    cp -a --parents kernel/bounds.c $kerneldir/build
 	    cp -a --parents Kbuild $kerneldir/build
 	    cp -a --parents arch/mips/kernel/syscalls/*.sh $kerneldir/build 2>/dev/null || :
 	    cp -a --parents arch/mips/kernel/syscalls/*.tbl $kerneldir/build 2>/dev/null || :
-- 
2.19.1


