Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.2600.1615661517741637703
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=IWXvXgCx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id m21-20020a9d7ad50000b02901b83efc84a0so3136111otn.10
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Cm/M2uQx8ZTmjCu0goToQexvb35c5mtQxIjJEbwhBo4=;
        b=IWXvXgCxnyCiOZKzVcdGfgq1LE7KIgO0kmvIdyYhM1fJLd5IZwXT+pmS3gixQlSlb6
         8/aq/HuFDtzga9gFLTZM9VzzJlh6FnFjWzI9dLZ/o/420+kDGYAjdStocpJK/oKm+2vU
         ws1XCFQ01eVCYbmiRQH2KAg4y+QCdeHhoGgN8RlYsXhDGJaDjZus4BUYDpH+v8ZdoAhv
         2au6OSZ1zAkcBMMbCVtJFnhuzomfjBBQuCo/zaglK6Vof/otbqYZb8/SuceYTCAEgydt
         xYySBVuFhILxixGejLdgc5CfJxfj7/3o2PxFfau1BOUwJQQG4XlCyVRAitOo/roAzl4U
         ryQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cm/M2uQx8ZTmjCu0goToQexvb35c5mtQxIjJEbwhBo4=;
        b=DFvODMFv/vvLNg0zSAsrGGSE6CASt2QSr86Vh4y6i2kfT4y4sxhFmHTfDSDgYiluK8
         aMC4BaNPPV0O5Fi98nSRzSnH+8WO2iMjk9XU5RbVAzOUZlIsR3X3/WeoNOPvpoiSpyMG
         idJLx2yJZ9bznlATr5ICIDK/fEQJcBucA22SAf2X3bcn+QZ+AWX1LsUpLk1u1GjfT0xW
         0sIOwCGwqmfwR1HEeWvKFzX5qV8R1ZvSvHQU+AhiZ8yEPAo8THiDoeZKZ7e0a4zPQjDh
         QXp4mOt2vJcg6OOdUeAk1qUq8uvKr+wpDkQugW7lN+vWtgOEeO+hUQarNZQuedVNMDJF
         xTKg==
X-Gm-Message-State: AOAM533JmhU8oMwHSc6ST3lj+5cn/EV6Pr6S1g01Pv3OSQ0oZRoLcj7Y
	YdGGw+c2nf61nG8nN1amFl2ojU0rxKNFYtdF
X-Google-Smtp-Source: ABdhPJz+f4tHkwaIY4rPPqqHrclM5TxPNRncGUd0VZII6dv1lxVS9z/f9vAjE8kdIe4qtVOnhnMjnw==
X-Received: by 2002:a9d:2226:: with SMTP id o35mr7889864ota.242.1615661516566;
        Sat, 13 Mar 2021 10:51:56 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.51.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:51:56 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/38] efivar: Fix reproducibility issue
Date: Sat, 13 Mar 2021 08:49:14 -1000
Message-Id: <4ce08e6fa4e72d70badb1892f48d593a37f063ad.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add sorting to the globbing within the Makefile to make the output
reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c43ae151f572786818fe048233b4bbfd6b0ba2cf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../efivar/efivar/determinism.patch            | 18 ++++++++++++++++++
 meta/recipes-bsp/efivar/efivar_37.bb           |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-bsp/efivar/efivar/determinism.patch

diff --git a/meta/recipes-bsp/efivar/efivar/determinism.patch b/meta/recipes-bsp/efivar/efivar/determinism.patch
new file mode 100644
index 0000000000..bdf6bfc4a8
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/determinism.patch
@@ -0,0 +1,18 @@
+Fix reproducibility issue caused by unsorted wildcard expansion.
+
+Upstream-Status: Pending
+RP 2021/3/1
+
+Index: git/src/Makefile
+===================================================================
+--- git.orig/src/Makefile
++++ git/src/Makefile
+@@ -15,7 +15,7 @@ TARGETS=$(LIBTARGETS) $(BINTARGETS) $(PC
+ STATICTARGETS=$(STATICLIBTARGETS) $(STATICBINTARGETS)
+ 
+ LIBEFIBOOT_SOURCES = crc32.c creator.c disk.c gpt.c loadopt.c path-helpers.c \
+-		     linux.c $(wildcard linux-*.c)
++		     linux.c $(sort $(wildcard linux-*.c))
+ LIBEFIBOOT_OBJECTS = $(patsubst %.c,%.o,$(LIBEFIBOOT_SOURCES))
+ LIBEFIVAR_SOURCES = dp.c dp-acpi.c dp-hw.c dp-media.c dp-message.c \
+ 	efivarfs.c error.c export.c guid.c guids.S guid-symbols.c \
diff --git a/meta/recipes-bsp/efivar/efivar_37.bb b/meta/recipes-bsp/efivar/efivar_37.bb
index 9b95721a4e..5bf121ff6e 100644
--- a/meta/recipes-bsp/efivar/efivar_37.bb
+++ b/meta/recipes-bsp/efivar/efivar_37.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 SRC_URI = "git://github.com/rhinstaller/efivar.git \
+           file://determinism.patch \
            file://no-werror.patch"
 SRCREV = "c1d6b10e1ed4ba2be07f385eae5bceb694478a10"
 
-- 
2.25.1

