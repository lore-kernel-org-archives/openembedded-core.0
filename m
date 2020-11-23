Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web11.36855.1606144585706401307
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tlB0mqUO;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: wonmin82@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id e8so3271291pfh.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2020 07:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v+E3A2fqtZGYDfjWnurB5jjExJemYOvNdmYSGwZeais=;
        b=tlB0mqUOhmmxJV7fZWF3fZ+p8aenJl7ALVcudouJ1lfkXLPJNSQDDEEEPRHR2xF9Lh
         kykuFmvnN+59B498MSewlgV2FShI5dEsJnE1t8o70C2t1UpX+TLXLBAQ4maBmIAqjMy1
         T5n18tLrOmDBjVEHplu+/1ENVRm5kJ//7vKNA9IUnG0gDbwSOAsgZxmtghja4RXnpJVQ
         jamgTo6FaWTiIHARrLqEjaQ5PH7HRG/Xsz2Z81MLgMX6nLxU/Fg5+AAPeF+qI3nhhcM3
         um3VKETjrb6eR67wTY4FmXFuaKs1GSEet4GnpokYXJyT8T0ssU6VW1ue6hrXbgK/rw3x
         ueEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v+E3A2fqtZGYDfjWnurB5jjExJemYOvNdmYSGwZeais=;
        b=HrbgzQA7ZpAQ9TBD3PZk6tTVuvxK/6T5oAZbbWt2fGGx2No3U0U0IjlBZoKbWv117G
         1SNWWXoAWA26U+5mUwGVHMYumTOOnX5zMBR2lmi6PABkr/1KAmlbMULYSwJzs2bg4Ff9
         E5fm1h3NyjSnOAd3xAdB7ZsU1GsxsE77Uc8IYMsPKf62iOwbMpM2+8zByxThtIy0Vr0t
         dV4DwfyxYWaxbf6F6VZbbk8KiiTQsiDzTcReU6PPcVYptBynoYDquh6Bv4ShUeqdlFif
         XRTQaeruLoy0bwOB7iuAu413Tw59k0cbYTQriqMfDyzA6CqSifnbfHZ6oviDGSjY4WgO
         +yNQ==
X-Gm-Message-State: AOAM530XFaEAnKhsbWErAGOWT6FBGIycANrfCp2Z5hoOSQahj8HQosjn
	9PFVnD+WlsUkzGpHQ5c4vovezU3mos20xEz49wc=
X-Google-Smtp-Source: ABdhPJyvE3/G74Dd/YSj35G9tfBcA5EFVt46kA3i6YnFvXD0b7wveWtvYhomBXua4BWL72XHAC9kpQ==
X-Received: by 2002:a17:90a:ec08:: with SMTP id l8mr196482pjy.115.1606144584921;
        Mon, 23 Nov 2020 07:16:24 -0800 (PST)
Return-Path: <wonmin82@gmail.com>
Received: from localhost.localdomain ([121.168.243.85])
        by smtp.gmail.com with ESMTPSA id e1sm12213292pfi.158.2020.11.23.07.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 07:16:24 -0800 (PST)
From: "Wonmin Jung" <wonmin82@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [gatesgarth][PATCH] kernel: Set proper LD in KERNEL_KCONFIG_COMMAND
Date: Tue, 24 Nov 2020 00:15:49 +0900
Message-Id: <20201123151549.2491-1-wonmin82@gmail.com>
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

