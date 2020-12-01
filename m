Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web09.469.1606848748905727897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:52:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=l3GQL71t;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.193, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f193.google.com with SMTP id e23so1704708pgk.12
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ppnuOrEc1O8niE47NvWEWWlI3wVJY0kt6xnTEEiHN9o=;
        b=l3GQL71tni4JOMPKnpo6PPe3jqQEIDOtks+hVSOuvzuTL+bQSK9AX8Wg5hSNH8zarT
         JXhvSpQmDMmfRyFmZDF5+eQR9JsIv+7xb28rv+UszuPFSKecrOBVb3FljEyMi7Sg4GME
         exluJrpEyn7Q3YBm0ihe/NL2NdH8bbhX1sFU7bgM+sSUd5HSLjoiA3SqWEPJolEQ8mr6
         /cW8leFe0DDMrScqyunWpyVoeqmKb4FaF1Lr7b9Qo8MIlbEFdH37w9JuSPh6k+i6vUH3
         SiawxeO37qXMGt+YUyEHXnreaJaZfZ2cRmwKY+Qcu3LWGYD2CpjYPY0eTrzj35d+qE/A
         9L/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ppnuOrEc1O8niE47NvWEWWlI3wVJY0kt6xnTEEiHN9o=;
        b=fPkPvQWflIYk2xW/1jOFu5X+h8yq+XZ+UVO44op1cFTGbnGGmpoMy+Pr97aL3d/CMs
         bx8krIpB+Y80mO0lkCb0oxZlyYzJDYCuL5h8R50ForsOmQCt0pUUFTbZj1AAFvuvHsVb
         ecIzUNhdGk7StcxSZwY8qajKwkheNOXXV7u9ftJ+twtyJD3CfCdQIDVVOi+i7i7mHWBK
         zDOakCgNIms62587jTHzHzju804GDOJNYTyBBTGZphennyjM4DTV472/PwZ1FcNW5Kde
         eCVQT1kD1mF79S8J+6+ebXI9MQaz4ek5fVedg4FPWp4sT7jq05oqM0ClifVBtlfk2uZh
         uSiA==
X-Gm-Message-State: AOAM532FsOXMI2hWyolE/xK1FwaJBOwL37cE2q5nNzmc2a211bJ95SJw
	+8fHberzbUEtUnkZOGqyI7rzGbsrRosVhAvm
X-Google-Smtp-Source: ABdhPJwkb/BHLgDnFYksLl56BPR3pTusU27crAaY6fX+r05eJVlIgjO64fBUsj+OvKYcs+HAlfPVDQ==
X-Received: by 2002:a63:161a:: with SMTP id w26mr3414557pgl.17.1606848748037;
        Tue, 01 Dec 2020 10:52:28 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:27 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/16] kernel: Set proper LD in KERNEL_KCONFIG_COMMAND
Date: Tue,  1 Dec 2020 08:51:46 -1000
Message-Id: <5f85104363cf496d76c3d29a05ba4406701d2878.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606848593.git.steve@sakoman.com>
References: <cover.1606848593.git.steve@sakoman.com>

From: Wonmin Jung <wonmin82@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1faf66ce0b1f8f5165277161e07e25e672370c3f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 700ba0ad8d..29afd791e9 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -569,7 +569,7 @@ addtask savedefconfig after do_configure
 
 inherit cml1
 
-KCONFIG_CONFIG_COMMAND_append = " HOSTLDFLAGS='${BUILD_LDFLAGS}'"
+KCONFIG_CONFIG_COMMAND_append = " LD='${KERNEL_LD}' HOSTLDFLAGS='${BUILD_LDFLAGS}'"
 
 EXPORT_FUNCTIONS do_compile do_install do_configure
 
-- 
2.17.1

