Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web08.33216.1605525426620504680
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 03:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XSoag6et;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: wonmin82@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id 10so13802504pfp.5
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 03:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a5lk2++fbv/h2itMeAvOj160Y2Vof4U1vt0Mwp61ouM=;
        b=XSoag6etCLAoXAhmgeCkJVZ8xtzkvkDYdULLhteaBztSgqgh3/qX2M82VtlLy3+suw
         ijDbp/+5d7XfEChHLMBZqY3ogUtFL/Vn9/yCS1kP/mckIL5PBlvSxypCUCrrosHBTSS3
         32C7FcrvFl2nqbliKyz8VVJSilu4THGLk+VwuN3fyzzfQgtSbwq6JjGJpRxsVBqVLlRH
         OHA7+5HF9wNPtidVq57Rzo2cKaBZMpcswNGFnRs/5Xonipc/55UghmSa0f62+Z9b8N3Z
         4OMMlJP/IxEpO74rs1Uv3Ofe559OmGzF5E0YYKOL4AJHU2OF6mxc1G+Z4US6oMFWYp/X
         W5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a5lk2++fbv/h2itMeAvOj160Y2Vof4U1vt0Mwp61ouM=;
        b=mpQQZgXc9yyHqjxWmNwRpkhiMqwjzteyfdFk72GKpEzqOvuTvcMIC41DOd2yfu9u1+
         46XBfC+eJfdMZu22BxFa7++YrGVZXdP51yqM5uF0kxDFqdaFONHakP+GgCF2swXqVD0h
         Yf28HqCKf0v6+RpfdwerCj6Pf8kARl3+YK/vy9hg3TU/LplCAOQ0fYyHU/DZedwC+7oF
         m6EzUqfGwiZvyuHV81DQOvJMXTaRPxNgmV6+x9wHtKEqpfSg17LUhvmaXZ4KIhZ6qYCh
         jb/HO144d96V03SiZmdR0nqfE/Yhjvx0bbdPWCmXt0TXJbrrN9vnx0y1ZS6MRoLRb11d
         2qxA==
X-Gm-Message-State: AOAM531m5528Koj67rlFIj7kI7PNkJ4JS7ppydIaUHXch1v5FHeMAGV0
	GUsCW5gxS24NrTy5pVxQlEqFEOadkZzv9l7iCAI=
X-Google-Smtp-Source: ABdhPJzCl+rkH2ZMGT78I0x6UT2uKyAtvgd6srQLa+G8Ac3PqUf8Gsy3MZoyHPagF2stDYU2lBO1Kw==
X-Received: by 2002:a17:90b:f85:: with SMTP id ft5mr15831790pjb.86.1605525425631;
        Mon, 16 Nov 2020 03:17:05 -0800 (PST)
Return-Path: <wonmin82@gmail.com>
Received: from localhost.localdomain ([121.168.243.85])
        by smtp.gmail.com with ESMTPSA id bk7sm14548809pjb.31.2020.11.16.03.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 03:17:05 -0800 (PST)
From: "Wonmin Jung" <wonmin82@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Wonmin Jung <wonmin82@gmail.com>
Subject: [PATCH v2] kernel: Set proper LD in KERNEL_KCONFIG_COMMAND
Date: Mon, 16 Nov 2020 20:16:27 +0900
Message-Id: <20201116111627.2795-1-wonmin82@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With 'ld-is-gold' and linux kernel 5.4 or later, menuconfig
task for kernel recipes will fail with:

$ bitbake -c menuconfig virtual/kernel
...
scripts/kconfig/mconf  Kconfig
scripts/Kconfig.include:43:  gold linker 'x86_64-poky-linux-ld' not supported
/OE/build/tmp/work-shared/qemux86-64/kernel-source/scripts/kconfig/Makefile:29:
 recipe for target 'menuconfig' failed
make[2]: *** [menuconfig] Error 1
/OE/build/tmp/work-shared/qemux86-64/kernel-source/Makefile:606:
 recipe for target 'menuconfig' failed
make[1]: *** [menuconfig] Error 2
/OE/build/tmp/work-shared/qemux86-64/kernel-source/Makefile:185:
 recipe for target '__sub-make' failed
make: *** [__sub-make] Error 2
Command failed.

This is because that the KERNEL_LD variable already set in
kernel-arch.bbclass isn't used by do_menuconfig function of
cml1.bbclass.

To fix this issue specify LD variable while calling the kernel
menuconfig command through KERNEL_KCONFIG_COMMAND.

Signed-off-by: Wonmin Jung <wonmin82@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 78def5bbc1..705c663c37 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -586,7 +586,7 @@ addtask savedefconfig after do_configure
 
 inherit cml1
 
-KCONFIG_CONFIG_COMMAND_append = " HOSTLDFLAGS='${BUILD_LDFLAGS}'"
+KCONFIG_CONFIG_COMMAND_append = " LD='${KERNEL_LD}' HOSTLDFLAGS='${BUILD_LDFLAGS}'"
 
 EXPORT_FUNCTIONS do_compile do_install do_configure
 
-- 
2.29.2

