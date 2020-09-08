Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com [209.85.161.68])
 by mx.groups.io with SMTP id smtpd.web10.23958.1599581759491115597
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 09:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lSdF2oh2;
 spf=pass (domain: linaro.org, ip: 209.85.161.68, mailfrom: anibal.limon@linaro.org)
Received: by mail-oo1-f68.google.com with SMTP id k13so4083521oor.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2020 09:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tBecD3iX1u/o0r9QbCrrRqUBd9eqnLtWtnXCWpwbrLo=;
        b=lSdF2oh2r3m79xvgR+kT6ymd1/P+EqsoGeyJpa0ymqqeBZqdygMD80xDHSmLZXC8bf
         W/QYD9MnRu2kuibmAp4dBNjdYeL/gHzCB7Y2epb4j4AWMmr++2/wJF+p3eDfTgWvmQlO
         h3Tg1NNxRc+/DlcYqO50znF0TtT4xklCJH4Grs/1abUXVP515tqEuMFPHXxUuvkE3xkQ
         BYmoatinm4UXMxK+v50lTKS4338OVb7uqWT+R4qUE7KS1sMQh80CqRvC09D8LIz/XPT1
         tRV4kobJayN4rm+gs7AHSeKC83NRsNiJr/EJKobNSwxa8NeZ+uSRUIVz+MXBZ25x/3Uq
         ZR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tBecD3iX1u/o0r9QbCrrRqUBd9eqnLtWtnXCWpwbrLo=;
        b=tahb4zoGnX0ZjjddYwiycnv5UVdM3faGmhtLj9VXSHRWY4Zz3mOoOldKlwcBLqOy6x
         OsRlUxnFFrzpf93tU0H4cxtsqR2PP3a6TX+JcLZaab5EprPqs0ewnJai77qxDu1jcvGq
         HCK+Zf8/wRleePkv9i2sGa+QzMhidPShrqrI6dFyg/Ha2UqP8YQsSNsER3/7l/XnsMbI
         GCxngNhGVkkqTxs40n812JPvbIdHvVPQYXkfqx1iwi0kXvWaM51jqYiLI548Tvvg958g
         FwEB+LSQx1Pt+SKFkhEFuhJQWcZfD9pnmjPDXgRPsurX3dkQzFpBUSFes8NTjVqy86x2
         nVYA==
X-Gm-Message-State: AOAM53047/it59bIOkbkkkShh7h9cWHppDOUATAkbKJ4+MhIHJ/ztMja
	bYY8Xym7QSxIwYjynQgJdWfhVi7xdmwsCw==
X-Google-Smtp-Source: ABdhPJxoBZcSSVMMzSBGnHF4YSAF1DiVRn/0R0mse6hK0G1BkMkcBvIQGhDGNRernjM6cD2zkYkijg==
X-Received: by 2002:a4a:3516:: with SMTP id l22mr18954565ooa.6.1599581758482;
        Tue, 08 Sep 2020 09:15:58 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([2806:109f:4:8e64:908a:c7ff:fe6a:e9f5])
        by smtp.gmail.com with ESMTPSA id m1sm3299618oih.3.2020.09.08.09.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 09:15:57 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: nicolas.dechesne@linaro.org,
	richard.purdie@linuxfoundation.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH] recipes-graphics/xorg-xserver: Add patch to fix segfault when probe
Date: Tue,  8 Sep 2020 11:15:55 -0500
Message-Id: <20200908161555.10039-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix segfault on probing a non-PCI platform device on a system with PCI.

...
    at ../../xorg-server-1.20.9/os/log.c:1017
    at ../../xorg-server-1.20.9/os/osinit.c:156
    at ../../xorg-server-1.20.9/os/osinit.c:110
    at ../../../../xorg-server-1.20.9/hw/xfree86/common/xf86platformBus.c:292
    argv=argv@entry=0xffffca43c7c8) at ../../../../xorg-server-1.20.9/hw/xfree86/common/xf86Init.c:388
    at ../../xorg-server-1.20.9/dix/main.c:193
    init=<optimized out>, fini=<optimized out>, rtld_fini=<optimized out>, stack_end=<optimized out>)
    at ../csu/libc-start.c:314
...

From upstream rev e50c85f4e.

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 ...probing-a-non-PCI-platform-device-on.patch | 31 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.9.bb       |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
new file mode 100644
index 0000000000..d66059d116
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
@@ -0,0 +1,31 @@
+From e50c85f4ebf559a3bac4817b41074c43d4691779 Mon Sep 17 00:00:00 2001
+From: Eric Anholt <eric@anholt.net>
+Date: Fri, 26 Oct 2018 17:47:30 -0700
+Subject: [PATCH] Fix segfault on probing a non-PCI platform device on a system
+ with PCI.
+
+Some Broadcom set-top-box boards have PCI busses, but the GPU is still
+probed through DT.  We would dereference a null busid here in that
+case.
+
+Signed-off-by: Eric Anholt <eric@anholt.net>
+---
+ hw/xfree86/common/xf86platformBus.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/xfree86/common/xf86platformBus.c b/hw/xfree86/common/xf86platformBus.c
+index cef47da03..dadbac6c8 100644
+--- a/hw/xfree86/common/xf86platformBus.c
++++ b/hw/xfree86/common/xf86platformBus.c
+@@ -289,7 +289,7 @@ xf86platformProbe(void)
+     for (i = 0; i < xf86_num_platform_devices; i++) {
+         char *busid = xf86_platform_odev_attributes(i)->busid;
+ 
+-        if (pci && (strncmp(busid, "pci:", 4) == 0)) {
++        if (pci && busid && (strncmp(busid, "pci:", 4) == 0)) {
+             platform_find_pci_info(&xf86_platform_devices[i], busid);
+         }
+ 
+-- 
+2.28.0
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
index 86d432a7c4..c83e43ed99 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
+           file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
            "
 SRC_URI[sha256sum] = "e219f2e0dfe455467939149d7cd2ee53b79b512cc1d2094ae4f5c9ed9ccd3571"
 
-- 
2.28.0

