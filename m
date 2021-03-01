Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.10907.1614596108865508956
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 02:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CteURFQV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id 7so15625759wrz.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 02:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qLBRBYQeHHkwvR3hswYZYDFNUTSf+KH3R/UP99exhsc=;
        b=CteURFQVoXVjUmBi3jhi7f4sm4SEQmcLDr7f+y8P1xK2O+WGtX6j+QqnGaxsT5j++X
         AWWXnfRtZ2o8HwAlNY1rVeBOPaG8WnV0m0S9DEoQe2+ZD2gPvARfBWHyKzJWQcs+GtRV
         TC1EVjX0z/9WNnZnnfjK7UnGeHbnh7G30aqu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qLBRBYQeHHkwvR3hswYZYDFNUTSf+KH3R/UP99exhsc=;
        b=Vfdi6+aFD+KjD8oImKNquRSPqzDWXeS0ABpTdh+8aPvuOsJJ/0l0gdbBEzbpw9amC2
         Z65rPFdm9R7d6EdJ0l56HZvvMbXBPVra28F599pdA8ndhvNiW4oq1YYvJB1U+9j3FYl8
         Sr+92Vlz5t5BdRnfOy1tRWc3PTeb9E8uyrKxBerm9k1o2Htfjwivw6LB35HGeLDWHhdk
         109bl+QV/RxpK5AyDrqXeZP0Zbf6vfLjaI7n+afHuNmu1lXXZeFzHqajwwexwfnIwzVR
         dkXAy82/1CrNMu7zjr58fnMOz53uucdLBcr44KTYPubxrSZq2XJHS7tlFP/KldpxwwCD
         72Nw==
X-Gm-Message-State: AOAM533l7jw4xX67yF3y/myRLYt9cb1WtxioPUSFaUTuOCPMP8lF9nXJ
	99BNNqzjCgj1y6snHjC4qeHdzuePF0riVQ==
X-Google-Smtp-Source: ABdhPJxL4tuixWgbLLZdUntlaBLkqLUJEtCY2uqRMSgBj9uyTPRk5f+y2nrtVL9wo0hhMXRyw3Tgug==
X-Received: by 2002:a5d:644d:: with SMTP id d13mr15985029wrw.191.1614596107334;
        Mon, 01 Mar 2021 02:55:07 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d6b6:68f5:94dd:1b3a])
        by smtp.gmail.com with ESMTPSA id a131sm22455807wmc.48.2021.03.01.02.55.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 02:55:07 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] efivar: Fix reproducibility issue
Date: Mon,  1 Mar 2021 10:55:04 +0000
Message-Id: <20210301105505.2176093-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210301105505.2176093-1-richard.purdie@linuxfoundation.org>
References: <20210301105505.2176093-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sorting to the globbing within the Makefile to make the output
reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py   |  1 -
 .../efivar/efivar/determinism.patch            | 18 ++++++++++++++++++
 meta/recipes-bsp/efivar/efivar_37.bb           |  1 +
 3 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/efivar/efivar/determinism.patch

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index dd2230c149c..d6c38cc7dea 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -28,7 +28,6 @@ import datetime
 # ruby-ri-docs, meson:
 #https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210215-0_td9la2/packages/diff-html/
 exclude_packages = [
-	'efivar',
 	'glide',
 	'go-dep',
 	'go-helloworld',
diff --git a/meta/recipes-bsp/efivar/efivar/determinism.patch b/meta/recipes-bsp/efivar/efivar/determinism.patch
new file mode 100644
index 00000000000..bdf6bfc4a8f
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
index 9b95721a4ec..5bf121ff6e1 100644
--- a/meta/recipes-bsp/efivar/efivar_37.bb
+++ b/meta/recipes-bsp/efivar/efivar_37.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 SRC_URI = "git://github.com/rhinstaller/efivar.git \
+           file://determinism.patch \
            file://no-werror.patch"
 SRCREV = "c1d6b10e1ed4ba2be07f385eae5bceb694478a10"
 
-- 
2.27.0

