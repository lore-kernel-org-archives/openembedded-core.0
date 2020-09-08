Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web11.25711.1599586280546647004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 10:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PgScZXqS;
 spf=pass (domain: linaro.org, ip: 209.85.210.65, mailfrom: anibal.limon@linaro.org)
Received: by mail-ot1-f65.google.com with SMTP id c10so15527794otm.13
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2020 10:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pPDYZqdrvuUc8GVSPx2g315F1xa91KNysN41D8+vo+o=;
        b=PgScZXqSN0jTQLLgcW/6xmj7YMWgXcFxDrNAcpc2nhPnd1C/CC5kkvj+3JDKqToR9v
         gD0NgZUO4J7pbhgRgaQKlkX/TA5SqZr0uzepJmY/5J3sh0OAnL/FNnmKHdzjFUvS38Mm
         W4/KwbwAiTkHmtBJ77DJLubhtUdE6NhuqwrBcrgoAZSNFRjkZ+Ui4UdsRLU724qI/0+C
         V5Y3pIlPMHfKmv8nrZUSnbvgCv8xTE8ktXQXL4elFBDb3bgqXEqbjkln4ZxvRx2gPfj8
         2/k95tOberNr0xpBxu1XE0o5J6CcezIxyyqhjPznDLeTO2ehlID22Y+6VhNy6AZAnKa4
         98nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pPDYZqdrvuUc8GVSPx2g315F1xa91KNysN41D8+vo+o=;
        b=LEZugEldDyihsBldt0CQcjePzKQOYH5oMmoXWtAXBLKjEGqxjgwVpct40gKOJVyeCT
         t7+Wd54pemF7Vs7O9sSdy07pNJaLw4s2tA31C8qAYGwygubIEI9r2s2Uuo65DjUSv41k
         QcjjWYHXKrI1nWeRvdgBHqDRq0V2o4ai8sju732JicTXl0HloIJa02qcFy0ODzC6Cfd5
         enSXtXpXvPMbtHpckmsdvVFuMaV2TOa18iSY7QD6ztDJnqGszLY+NkS05jnMdnbN8fsx
         3nB/rGR6GEWA+zbQkeVOgQSIQ6Rv6F8DzaO19gJyYJ5LW9DOdQJ0+b+oITBYr9lvFlp5
         S+LA==
X-Gm-Message-State: AOAM533ju5XhpuDYzv/AZqGEupc5mIej2LCIaFIdQo4sfOYsL4UH/q2D
	qinODuEeW5oCpYLT0zYqy5W3IGbvF3bkwA==
X-Google-Smtp-Source: ABdhPJxujFhhvv/cxjdQpIWgbPbHI19HbvxexrJM6cXObCjT9Pw1mjr4pPK3Hgc0AimT7P4MlWeSQw==
X-Received: by 2002:a9d:7489:: with SMTP id t9mr71604otk.277.1599586279407;
        Tue, 08 Sep 2020 10:31:19 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([2806:109f:4:8e64:908a:c7ff:fe6a:e9f5])
        by smtp.gmail.com with ESMTPSA id z10sm3386115ooz.14.2020.09.08.10.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 10:31:18 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: nicolas.dechesne@linaro.org,
	richard.purdie@linuxfoundation.org,
	ross@burtonini.com,
	dmitry.baryshkov@linaro.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCHv2] recipes-graphics/xorg-xserver: Add patch to fix segfault when probe
Date: Tue,  8 Sep 2020 12:31:12 -0500
Message-Id: <20200908173112.15484-1-anibal.limon@linaro.org>
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

Backported from upstream rev e50c85f4e.

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 ...probing-a-non-PCI-platform-device-on.patch | 34 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.9.bb       |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
new file mode 100644
index 0000000000..7b9e3b4cad
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
@@ -0,0 +1,34 @@
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
+
+Upstream-status: Backport [https://github.com/freedesktop/xorg-xserver/commit/e50c85f4e]
+Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
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

