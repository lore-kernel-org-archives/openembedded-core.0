Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26340C433EF
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 21:56:45 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.3496.1635976603733744946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 14:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SSfyLNRY;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id t21so3838264plr.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 14:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LW4wwjmuGU0LqXcV3DhuA8j6CBvSYhCWlyl/0iFbLMQ=;
        b=SSfyLNRY2TYZnZojkCgNN822RrxqtbVKKcL4V6r+/+1H729djkq79lg/lDAg7ZeESU
         av+qtC8azg27831BieSfPKCDSGx2TtIgNp8+yomZrat/GpzLvfxplKogq6V5Ug9cN+zN
         xEBp5N9ALS0CfpNRQrkxtkVwin5+89xwPo710JcGc4hoLOzCAPfaC6+4BQm65j7rX5kK
         FepfmrXvNxyx94ABGbalc8/VcOl4O2E64qJBvrg416pmuD+yonQ2NEfDI6sTVTIvOVhl
         5X0XjmYjK/dFLVK8GEuw7QLvmUq245H+SLSrtTLoMSEucfpObirucOkNhIlhIuacI/Sd
         FCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LW4wwjmuGU0LqXcV3DhuA8j6CBvSYhCWlyl/0iFbLMQ=;
        b=eJiSTGNu7B7n1ljbI3FTh/Ro39plQAGb6+j/9GIOUYu0cjcDb3BzJHxrKi8Csr9Tzh
         pHofxMiAZ0jnqTGkK6jmitTKB6sL4KCLkVypWAgFmeaGqt2CGGfanCixfCoCpHm7sFyk
         O8yEUp6HAYAyRh7pB1wSfrxxwoNeLgioMAG88nTcWMPNz2LwWT7oW2l7BNCnkMXjkktC
         5Is9hXGHDRLQULUME55raNa0boSRdeuo7B+Ni8r3MVltjU/0jRZzgkA9/g5XzPECHrU8
         xLFE/ivV3J5r8MkK7YncB1ZFa/BjPWJecTiuwqz/Pr9DfmCNt6/J1wrq/7/NHLU0/DC0
         EAzQ==
X-Gm-Message-State: AOAM5300fCix07RMfBuoS1kDV9KkW9S5m9/0E+brdafhzbxTl9HfMWjA
	Fz9RZOk6UOl5XnKEq3UT06vX3iqZDmk=
X-Google-Smtp-Source: 
 ABdhPJz5Et8USKCpyxZYnllra51FjeTYQuilyofrR8Olpib8hOpTuBBHGGo166/n2e9s3GTtT9sIuw==
X-Received: by 2002:a17:903:32c2:b0:141:eed4:ec0a with SMTP id
 i2-20020a17090332c200b00141eed4ec0amr20592170plr.74.1635976602791;
        Wed, 03 Nov 2021 14:56:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 t24sm3344937pfg.118.2021.11.03.14.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 14:56:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] kernel-devsrc: Add vdso.lds and other build files for riscv64
 as well
Date: Wed,  3 Nov 2021 14:56:39 -0700
Message-Id: <20211103215639.3517924-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Nov 2021 21:56:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157832

These additional bits are needed on riscv64 as well
Fixes
make[1]: *** No rule to make target 'arch/riscv/kernel/vdso/vdso.lds', needed by 'arch/riscv/kernel/vdso/vdso.so.dbg'.  Stop.
make: *** [arch/riscv/Makefile:114: vdso_prepare] Error 2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index d39573965f..f22fac5bd6 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -109,8 +109,8 @@ do_install() {
 	    fi
 	fi
 
-	if [ "${ARCH}" = "arm64" ]; then
-	    cp -a --parents arch/arm64/kernel/vdso/vdso.lds $kerneldir/build/
+	if [ "${ARCH}" = "arm64" -o "${ARCH}" = "riscv" ]; then
+	    cp -a --parents arch/${ARCH}/kernel/vdso/vdso.lds $kerneldir/build/
 	fi
 	if [ "${ARCH}" = "powerpc" ]; then
 	    cp -a --parents arch/powerpc/kernel/vdso32/vdso32.lds $kerneldir/build 2>/dev/null || :
@@ -185,6 +185,12 @@ do_install() {
 	    cp -a --parents arch/${ARCH}/kernel/vdso32/* $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/${ARCH}/kernel/vdso64/* $kerneldir/build/ 2>/dev/null || :
 	fi
+	if [ "${ARCH}" = "riscv" ]; then
+            cp -a --parents arch/riscv/kernel/vdso/*gettimeofday.* $kerneldir/build/
+            cp -a --parents arch/riscv/kernel/vdso/note.S $kerneldir/build/
+            cp -a --parents arch/riscv/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
+	    cp -a --parents arch/riscv/kernel/vdso/* $kerneldir/build/ 2>/dev/null || :
+	fi
 
 	# include the machine specific headers for ARM variants, if available.
 	if [ "${ARCH}" = "arm" ]; then
-- 
2.33.1


