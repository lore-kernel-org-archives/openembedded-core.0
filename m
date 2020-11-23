Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.36817.1606144470248785890
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:14:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eOLmInvS;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: wonmin82@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id 34so14514689pgp.10
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2020 07:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JaLTRZz6U5r+HFmk9Bhg8yA5z5X4UAGRm2HYG9/rhYc=;
        b=eOLmInvS4YQTFsPbWLCBcgjcxCL0PMBPVsbqWPmo6nRIszf+ePWoUD0L8Kv0Uqtgq1
         g/nFjFH0AVcz+JZ1M0RbsCEL02x7WX5d6SDB9vdL+mBk74bgeGWHNrN7zChfkn3X0r42
         XcNDNrtaHUNOsR5BW9Z9+POBNau1WyVQ9dxq3R9gJ0jFUAiz7HMGrSgfyobPoY0rig4H
         yGwE/c/tiqmwibkakKPTIzRUtTkPqBkQfNu9/ewuxKzIxeDHqj0EimJqIJlIU1aJheCu
         z1zNeUnx40e+S9zXEXEDOPk+eXUEBjLr2fFAk0NM8QsB7AYZ6DCY71JlYFVbB0aO2v0D
         MYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JaLTRZz6U5r+HFmk9Bhg8yA5z5X4UAGRm2HYG9/rhYc=;
        b=PtD82d7s0N49wRvKikGfKnPLvfBXI5Gxw3hnvvpFmQr2u/wlqWUCztZJa5wBAHVTJ2
         kVJzbryZ/hNRXeWgkx7DQLXxNqh6gUJ7zKEDy7RJGolakrwrx7/diA75SY/PfCK5XsTM
         XXwtWTgoy52tdn0/0wEvv8fCQg6wRDpmyLJt0J3+V47Cy8hYAJwRA+cfM5kUsYIK0HAE
         SYcal945jXtgQqH7qvd3LGqlZQ8pD0Bnvtf457dvtABoPM+Wryp1NAXcZVAV/ECx+7OM
         /KII4ENTioBqHRYkxcHl0b3oWmLP6y4uvHsH2ElOp6mQaFuXBwXVcngMeh+3w2oUOuZs
         SzCw==
X-Gm-Message-State: AOAM5310JMrSFCYJSC/HqdM3ekpGXeJUsd/n+s2MgdV7pTgVXwuUGCVw
	FE7aGHzGkJkZWT/u9360oMguOwpsc+FuxQB+
X-Google-Smtp-Source: ABdhPJwsqcVkIc2Ox6y+jgswJGtVrsdVb/SE0vbOoYf8G6Bsu1yTnidKVyKvWeqy5Vse84JI7u3l1A==
X-Received: by 2002:a63:cb4a:: with SMTP id m10mr8964022pgi.278.1606144469473;
        Mon, 23 Nov 2020 07:14:29 -0800 (PST)
Return-Path: <wonmin82@gmail.com>
Received: from localhost.localdomain ([121.168.243.85])
        by smtp.gmail.com with ESMTPSA id y23sm10079111pfb.207.2020.11.23.07.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 07:14:29 -0800 (PST)
From: "Wonmin Jung" <wonmin82@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] kernel: Set proper LD in KERNEL_KCONFIG_COMMAND
Date: Tue, 24 Nov 2020 00:12:59 +0900
Message-Id: <20201123151259.1893-1-wonmin82@gmail.com>
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 9e3c34ad48..89bcac4426 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -565,7 +565,7 @@ addtask savedefconfig after do_configure
 
 inherit cml1
 
-KCONFIG_CONFIG_COMMAND_append = " HOSTLDFLAGS='${BUILD_LDFLAGS}'"
+KCONFIG_CONFIG_COMMAND_append = " LD='${KERNEL_LD}' HOSTLDFLAGS='${BUILD_LDFLAGS}'"
 
 EXPORT_FUNCTIONS do_compile do_install do_configure
 
-- 
2.29.2

