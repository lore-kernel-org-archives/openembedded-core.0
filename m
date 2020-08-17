Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.49225.1597686935086194535
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 10:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kSjjLjxy;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id 128so8460544pgd.5
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 10:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NGnCy/Ml70Ls9/TBhCpHjBu0msiaBjXCmPXjDTqOCDk=;
        b=kSjjLjxyQtk5G5opYgGVMLhfwKXqwqAcRgGVpruxZVd58trvIOlTpuDNGpQHBsKITo
         oGnpZZOLDiYzxRl9hTZY7oe+pkuMPcxHRRd01LWAy3yWCitnEtkpSFwfADC2rrLxHCEK
         PBUfArDbPHI2A+GAb0S5HWbFDs4M3MXzVaaQQNlHpk8tzPjC8Cora9AeuO3tdZyKE2CE
         mPx6qimn4/Ck88/ZOsg+PrEiO9PHVDT85lW67FggXf2rB4wbLIyWba4FYNwuBMpVBewN
         ux30vHMc41FWVWAyP8G3eYstBbfudYztMs6CNzMRY3xbkuWetvBMDAe7Iz381dkJjBuk
         oqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NGnCy/Ml70Ls9/TBhCpHjBu0msiaBjXCmPXjDTqOCDk=;
        b=FYbtyx7pWQXVBXOf5lIW5DL1ueUl1YC3P/p2tvpOQsW7377KkypZDdI2NG+6Ou3h2b
         QxPjFEpjlx9JEIFjdgZ7+ttEFGAvMyfAf5Z30L5qOmTo013O0IjcFof9P5XTUZUcbRrn
         DW43xNHHu7rksl/Y0PMnC2B6P4RjE32zUpHdmHP7jKCtAE7vXWo17U6Faomw4IDzHMsz
         ZAl6rdTYb+TI7Pot4C2F1cm6hS+jPw0m5zx6X45TcdIEm7Y3EUf17t0bRSrtT4xs9mEY
         cwfhoR8DvwRmRjWOLM/R3KeZgIx5VYoc6eTGOZHUdaHLk3BvX1fiWUoWZQW3zftWpzZi
         LgEA==
X-Gm-Message-State: AOAM530wJefiw3gEhS1KY++BS+WNkQGfIL6ziwjSICQ6mqM/QBdeplA0
	KACslPfUQRhCYI95rPnSAcmaiOCjQ7o/Xg==
X-Google-Smtp-Source: ABdhPJwButY3f3AfhIoWN18PZ5TqMvOUzRb+/pDDgHuFQtFXpObZm8SOe7t3DQdv4u2RvqiWzGb+mw==
X-Received: by 2002:a63:f24a:: with SMTP id d10mr10594587pgk.4.1597686934129;
        Mon, 17 Aug 2020 10:55:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id k29sm20153990pfp.142.2020.08.17.10.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 10:55:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] xserver-xorg: Fix build with -fno-common/mips
Date: Mon, 17 Aug 2020 10:55:31 -0700
Message-Id: <20200817175531.2702696-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Build fails on architectures which use IOPortBase

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-duplicate-definitions-of-IOPortBase.patch | 45 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.8.bb       |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
new file mode 100644
index 0000000000..4737040675
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
@@ -0,0 +1,45 @@
+From fc04acfd948ac99d04a5dc08c78f3b13bc0c5c41 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Aug 2020 10:50:51 -0700
+Subject: [PATCH] Avoid duplicate definitions of IOPortBase
+
+This fixed build with gcc10/-fno-common
+
+Fixes
+compiler.h:528: multiple definition of `IOPortBase';
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ hw/xfree86/common/compiler.h            | 2 +-
+ hw/xfree86/os-support/linux/lnx_video.c | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
+index 2b2008b..c7d617e 100644
+--- a/hw/xfree86/common/compiler.h
++++ b/hw/xfree86/common/compiler.h
+@@ -525,7 +525,7 @@ xf86WriteMmio32Le(__volatile__ void *base, const unsigned long offset,
+ #define PORT_SIZE short
+ #endif
+ 
+-_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
++extern _X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
+ 
+ static __inline__ void
+ outb(unsigned PORT_SIZE port, unsigned char val)
+diff --git a/hw/xfree86/os-support/linux/lnx_video.c b/hw/xfree86/os-support/linux/lnx_video.c
+index 04e4509..9dc7316 100644
+--- a/hw/xfree86/os-support/linux/lnx_video.c
++++ b/hw/xfree86/os-support/linux/lnx_video.c
+@@ -78,6 +78,7 @@ xf86OSInitVidMem(VidMemInfoPtr pVidMem)
+ /***************************************************************************/
+ /* I/O Permissions section                                                 */
+ /***************************************************************************/
++_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
+ 
+ #if defined(__powerpc__)
+ volatile unsigned char *ioBase = NULL;
+-- 
+2.28.0
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
index 72d0d582eb..bea6ecc464 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            file://0001-dix-atom.c-make-xserver-crash-out-if-memory-cannot-b.patch \
+           file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
 SRC_URI[md5sum] = "a770aec600116444a953ff632f51f839"
 SRC_URI[sha256sum] = "d17b646bee4ba0fb7850c1cc55b18e3e8513ed5c02bdf38da7e107f84e2d0146"
-- 
2.28.0

