Return-Path: <alexandru.t.moise@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D903DC0015E
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 22:30:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.55458.1691793024569558175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 15:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=g0Aiq3SX;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alexandru.t.moise@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fbea147034so21294735e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 15:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691793023; x=1692397823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7WVbqyZFUNFLtDK8ProYUimE/+kSstUUvbgu6xub1k=;
        b=g0Aiq3SXHnUz452VdvCAwld7N5NMazRt+phZimEAyUYaUn6YBBCK6TpNGbALXmqVgz
         doIZN4nidT2nqYh7ussSNb3Fz/9IcgSLYX9tvvEd9k+h/VFgsTpKn5J+0PHekTj9qgIV
         e6zClv1fNV0ZzWw/xELkH49xDVA1Gn7hiwDXf+tNdyakig2ZXamdFdrk20h08YNJp0UY
         UTENjnC++l3lDEWk8iCIvxWAOYv8HNSbT/5hTnrWH9FW5CYgrk/U8vCl5Fq2sP4Q1/9n
         LHIGc8zZfOSnyG5W+QxdNxDts3L1BET/IiSWiu1rhRahHnWYZpIwPl3p6aW0HAolfWb3
         8WhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691793023; x=1692397823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7WVbqyZFUNFLtDK8ProYUimE/+kSstUUvbgu6xub1k=;
        b=MBY1H0E+w0l3gVk0aTT8gzcNLw0Ggs54VfipONHRbND+Eu/SlDiQlvqCy5VmNOguNu
         yH/dNn8Gq1qqo+zuDHRkow53yxQ0m1bZptXUE4ngsnhABf/WKeg24PU/a8ko+qEL0Czx
         nRfJMWJpYfroHcE4yS1k/4jt/WbH6WwMFeDpQBtebdjiHNHcqtkjrDAqDHD+cJv6QY9q
         bSTITMOrmTcVO7hyY3FfJCkYbrWLSE+CyqRrx0hg+xJ13LXgUH4bOuliJ0T8elqoWycG
         e0OBrkGAT86UnkCn7xBRzzM66XqFPHr2laijO0ndBklPKwPUkHJjkGM+kcDlWzmxaU+j
         //Qg==
X-Gm-Message-State: AOJu0Yyptn4rydBDHmqi10rZtT3+RfARaV71q7WA9ZUqSTz9zv7pR6pi
	KEOvOr25fmkvDhlKa/3QSmMt2SaAY6E=
X-Google-Smtp-Source: AGHT+IG6XT+/OkB7JhvljzIRp0Jin2t75K4gOKwBOQaf9KXGv/yQ0fhSwyimRLsDAgLTib2B/j2M8Q==
X-Received: by 2002:a7b:cd95:0:b0:3fc:7eb:1119 with SMTP id y21-20020a7bcd95000000b003fc07eb1119mr2586909wmj.15.1691793022832;
        Fri, 11 Aug 2023 15:30:22 -0700 (PDT)
Received: from localhost.localdomain (p200300eda743c2010c6d3f7a540d8303.dip0.t-ipconnect.de. [2003:ed:a743:c201:c6d:3f7a:540d:8303])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c22ce00b003fba2734f1esm9403438wmg.1.2023.08.11.15.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 15:30:22 -0700 (PDT)
From: alexandru.t.moise@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Alexandru Moise <alexandru.t.moise@gmail.com>
Subject: [PATCH] riscv: Add asm-offsets.s to target for on-target module compilation
Date: Sat, 12 Aug 2023 00:32:40 +0200
Message-ID: <20230811223240.195105-1-alexandru.t.moise@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 22:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185852

From: Alexandru Moise <alexandru.t.moise@gmail.com>

I wanted to build kernel modules on my riscv target,

cd /usr/src/kernel/

make scripts prepare
<...>
  CC      scripts/mod/devicetable-offsets.s
  UPD     scripts/mod/devicetable-offsets.h
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
/bin/sh: line 1: arch/riscv/kernel/asm-offsets.s: No such file or directory
make[1]: *** [Kbuild:37: include/generated/asm-offsets.h] Error 1
make: *** [Makefile:1219: prepare0] Error 2

The patch just adds the asm-offsets.s file for riscv targets.

With this the prepare target succeeds:

make scripts prepare
<...>
  CC      kernel/bounds.s
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  LDS     arch/riscv/kernel/vdso/vdso.lds
  AS      arch/riscv/kernel/vdso/rt_sigreturn.o
  CC      arch/riscv/kernel/vdso/vgettimeofday.o
  AS      arch/riscv/kernel/vdso/getcpu.o
  AS      arch/riscv/kernel/vdso/flush_icache.o
  AS      arch/riscv/kernel/vdso/note.o
  VDSOLD  arch/riscv/kernel/vdso/vdso.so.dbg
  VDSOSYM include/generated/vdso-offsets.h
root@visionfive2:/usr/src/kernel

Signed-off-by: Alexandru Moise <alexandru.t.moise@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 6764598d48..ec14ccf6f2 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -115,6 +115,9 @@ do_install() {
             if [ -e arch/${ARCH}/kernel/vdso/vdso.lds ]; then
 	        cp -a --parents arch/${ARCH}/kernel/vdso/vdso.lds $kerneldir/build/
             fi
+            if [ -e arch/${ARCH}/kernel/asm-offsets.s ]; then
+	        cp -a --parents arch/${ARCH}/kernel/asm-offsets.s $kerneldir/build/
+            fi
 	fi
 	if [ "${ARCH}" = "powerpc" ]; then
 	    cp -a --parents arch/powerpc/kernel/vdso32/vdso32.lds $kerneldir/build 2>/dev/null || :
-- 
2.41.0


