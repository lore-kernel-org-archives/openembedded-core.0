Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.32268.1605519978776578148
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 01:46:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LV7h6Ue5;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: wonmin82@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id p68so2266073pga.6
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 01:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SFULXTkLWDhh1loSNW7Z82G688DtzzpKLgePIjEoR5Q=;
        b=LV7h6Ue5L4KQpK7jUnvB61BF4l5LtCWDEpMuzXGQHLjSRv7bJukdI8PPTcYErE31Eo
         4d3gAK/HdKC3Ve7J6Z9H62bXIfdStiT4PuZ+kGm8k0jE8XPw+czWFesXdKEdR6OMpeqZ
         /gcyW2vlz6uklcHRl/YJti228O8O24thQZxCsYBxZdnKcrgMdVBC4h3rWic4kkJeaml8
         jIfFtgWZ2v5lQpMcg4qUxrilxmcjEFQg4nk6VKhGhxN82F27DMcL8tA2ITUU9/LdYHVA
         JWb2NOxDrVThS0ffylnYVPjVL4olUd8pe+NO5zIoiJF76WA6hXg/AuhBZfqPPqaHSDie
         FMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SFULXTkLWDhh1loSNW7Z82G688DtzzpKLgePIjEoR5Q=;
        b=sxfhLg1j+oxroEW0ZAx1RjChlmRb2W6RB26NQ79cxGRVtKquRAD/pjJrLlNARtgNF5
         lThV/ZXx/akwNdr/0sTLZ8q62vB5pWg5RQ8AcN7OgEDou0BZsG5uhiEMftAonY7aLS36
         RdRvj5aXwHXMs6K9vOfRGWevlTK6glmED7iTaBpnHIQxqmfVI2XYP0gM8LIuhGEyDeG9
         vO/Qy3P0WgytnCFsJkpOLuWGBiOZQxVy96G0g+9kTvjuNVc253BSD1I4+w21BURcMoVM
         vcBsO0L8UK+h9DFvFvveBAVz3FrnLw3wHQ4C3zbk5d4y7LB8bUdWSUn6jqECsBFr6ya0
         CMSw==
X-Gm-Message-State: AOAM532f950z0Io8JBXillR35EnU0YlphCsqq7O9//AqHhxCGbfppsET
	rxxO9RRZ9Ho+QK+W3JcomxkNcPHqv/bJPU7P
X-Google-Smtp-Source: ABdhPJz6X3WEbaBlsQ19Myowg+C0ceOT9s01l3SVERib/f0IWwLTCGXGud9BLVlDYhcUA/Oe+PPWRg==
X-Received: by 2002:a62:18d1:0:b029:18b:7897:579d with SMTP id 200-20020a6218d10000b029018b7897579dmr13335585pfy.10.1605519977962;
        Mon, 16 Nov 2020 01:46:17 -0800 (PST)
Return-Path: <wonmin82@gmail.com>
Received: from localhost.localdomain ([121.168.243.85])
        by smtp.gmail.com with ESMTPSA id a3sm17418104pfo.46.2020.11.16.01.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 01:46:17 -0800 (PST)
From: wonmin82@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wonmin Jung <wonmin82@gmail.com>
Subject: [PATCH] cml1: Set proper LD while during kernel menuconfig
Date: Mon, 16 Nov 2020 18:45:42 +0900
Message-Id: <20201116094542.4688-1-wonmin82@gmail.com>
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
menuconfig command.

Signed-off-by: Wonmin Jung <wonmin82@gmail.com>
---
 meta/classes/cml1.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index d319d66ab2..02cd058fc5 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -48,7 +48,7 @@ python do_menuconfig() {
     # ensure that environment variables are overwritten with this tasks 'd' values
     d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")
 
-    oe_terminal("sh -c \"make %s; if [ \\$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
+    oe_terminal("sh -c \"make LD=${KERNEL_LD} %s; if [ \\$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
                 d.getVar('PN') + ' Configuration', d)
 
     # FIXME this check can be removed when the minimum bitbake version has been bumped
-- 
2.29.2

