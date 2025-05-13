Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F7DC3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 03:55:49 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.68543.1747108543263774463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 20:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=iFHkwcbX;
 spf=pass (domain: underview.tech, ip: 209.85.222.177, mailfrom: vince@underview.tech)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c5b2472969so578625185a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 20:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1747108542; x=1747713342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sMWeWRM8ns+pqGrGU0HTwpRMmuTCLWap8ANbbwohXUA=;
        b=iFHkwcbXI+EuOyTczay53g1ky7ZKkR7y7eV2ZZn/Kntc/2e9YJGa35InnbH0iukJZd
         HKR/q3PujSjZdPUl4m5uaTiRPH3Dcmy3tWRXBZwB01a+yk/fkGc4aYSzvaoudposSNnQ
         Fe5Ze1tb+AptTjfuMj1DmQxoDgmO54GKzVEtZKhiO+HafnxSp7taFL73TugL0MtU2qM/
         0QdlXC7Slgrya9t7oCrzzLp/cqYWtCQ+gLrA9CW49o6r4iWhifPSz7GHL8yjPbOB06ue
         Own6B+AdaO1IQUFERi9v4GFxEGntyoE1bAjcCGDDFZOk58LMu1/h0+p7Ur7sp2bfhziI
         aRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747108542; x=1747713342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMWeWRM8ns+pqGrGU0HTwpRMmuTCLWap8ANbbwohXUA=;
        b=f+CC34hJxO4/RwcFyIDa7KnivNeyc5MEyJag9Ks9MAOz9KgLcErpqKAlUASTzlwuJ0
         vd9QCWVEFAti6dTP9j/Av+UDv3EDvdL2MgBHAXA5l6/PmlVIhLm37niMeDenqAzoGrpr
         DaPQpFSJmKR5ZdbIx3aQMTkxY0R9UsACvTMXeVqyMOI6Pc3EIf/xhfVYCf+YZitCtQmw
         QaP60qA18tTn/y92g4AgoGDz44oi9JtkWj0uewmSdcXIdFZW9J6P/5VHY6uPDeMVOroV
         E5YAYWv7473dCBcj70rkHhS97M9N/lw3zcxFB9fo4QiN9RrQCxkA8Wq8aoXS18S6qD9E
         D4gQ==
X-Gm-Message-State: AOJu0YyV6E2S8VcdEZiRs9bEPC/Vt82HQfxh+4WUbyk0g0XnE0Nf4itS
	K8Uv4UJy7PsWFvl08+jxUkDVbfuuFS0qIUBj3SN5EOuCYldzZca51xhlgbA7pBlvOw/UK/5hdT9
	J
X-Gm-Gg: ASbGnctCo0e5NioKAuoIHzPR0ODEdUN5zNmY5he114p/Ojwa/GNVjlRGIsE4sV9JTL1
	HL9A/ZKT/KQu86KS4Zav9wvm42bevGAxVnB1yHaWyitezuJPsTGmBzTuqigiUmZGwbN6KU31RAR
	WOOOUHdMwIiUfu9qLo7c0uQgEDU85+DMdV+y8ZVKJFciqpd1phGg3VF+ilQrR0+p+iEoORxtbHz
	WJI2fDWDqfMQxOzcz9G+LoUyru8LgswDsrEgDzP7YJP7x9/vgOal9/FCqnV27YQc/6I4U3iXWjz
	h+wGgAn/Tpe4LdHZ6wI2EXZT+qUUY4hkmA0fJUh3
X-Google-Smtp-Source: AGHT+IFm6QlD/k2uNFKZEJh7NJOdhBzdCbkf6cpXTLWvjq4isDEufhnt38DybUKqqlE65rAzQUokHQ==
X-Received: by 2002:a05:620a:8e16:b0:7cc:fd28:8c6d with SMTP id af79cd13be357-7cd01115c75mr1877491085a.30.1747108541900;
        Mon, 12 May 2025 20:55:41 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::abf4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f4e0cfsm652796685a.24.2025.05.12.20.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 20:55:41 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2] linux-yocto: build out-of-tree drivers with SDK
Date: Mon, 12 May 2025 23:55:21 -0400
Message-ID: <20250513035520.147573-2-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 03:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216393

Attached patch enables the compilation
of out-of-tree drivers whilst utilizing
the Yocto built SDK.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 ...-add-KCFLAGS-to-build-with-Yocto-SDK.patch | 65 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 ++
 .../linux/linux-yocto-rt_6.12.bb              |  4 ++
 .../linux/linux-yocto-tiny_6.12.bb            |  4 ++
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |  4 ++
 5 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch

diff --git a/meta/recipes-kernel/linux/files/0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch b/meta/recipes-kernel/linux/files/0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch
new file mode 100644
index 0000000000..edf6a8480f
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch
@@ -0,0 +1,65 @@
+From e48021f480428b5e34d299261029bfafdf0e3a2f Mon Sep 17 00:00:00 2001
+From: Vincent Davis Jr <vince@underview.tech>
+Date: Sun, 11 May 2025 19:57:46 -0400
+Subject: [PATCH] Makefile: add KCFLAGS to build with Yocto SDK
+
+Upstream-Status: Pending
+
+When running
+
+make -C \
+"${SDKTARGETSYSROOT}/lib/modules/<kernel version>/build" \
+modules_prepare
+
+Issues that are encountered include
+
+make -f ./Makefile syncconfig
+make -f ./scripts/Makefile.build obj=scripts/basic
+   92 | #include <sys/types.h>
+      |          ^~~~~~~~~~~~~
+compilation terminated.
+
+ld: cannot find Scrt1.o: No such file or directory
+ld: cannot find crti.o: No such file or directory
+ld: cannot find crtbeginS.o: No such file or directory
+ld: cannot find -lgcc: No such file or directory
+ld: cannot find -lgcc_s: No such file or directory
+ld: cannot find -lc: No such file or directory
+ld: cannot find -lgcc: No such file or directory
+ld: cannot find -lgcc_s: No such file or directory
+ld: cannot find crtendS.o: No such file or directory
+ld: cannot find crtn.o: No such file or directory
+
+Solved by setting KCFLAGS as the yocto project SDK
+KCFLAGS is set to --sysroot="${SDKTARGETSYSROOT}".
+
+Signed-off-by: Vincent Davis Jr <vince@underview.tech>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 64c514f4bc19..bbe7b0503841 100644
+--- a/Makefile
++++ b/Makefile
+@@ -459,7 +459,7 @@ HOSTRUSTC = rustc
+ HOSTPKG_CONFIG	= pkg-config
+ 
+ KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
+-			 -O2 -fomit-frame-pointer -std=gnu11
++			 -O2 -fomit-frame-pointer -std=gnu11 $(KCFLAGS)
+ KBUILD_USERCFLAGS  := $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)
+ KBUILD_USERLDFLAGS := $(USERLDFLAGS)
+ 
+@@ -491,7 +491,7 @@ KBUILD_HOSTCXXFLAGS := -Wall -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS) \
+ 		       -I $(srctree)/scripts/include
+ KBUILD_HOSTRUSTFLAGS := $(rust_common_flags) -O -Cstrip=debuginfo \
+ 			-Zallow-features= $(HOSTRUSTFLAGS)
+-KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
++KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS) $(KCFLAGS)
+ KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
+ KBUILD_PROCMACROLDFLAGS := $(or $(PROCMACROLDFLAGS),$(KBUILD_HOSTLDFLAGS))
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 4b1f93a692..43ad4c4791 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -20,6 +20,10 @@ KMETA = "kernel-meta"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=master;destsuffix=${KMETA};protocol=https"
 
+# Appears to be the only way to build out-of-tree
+# kernel drivers with the yocto project SDK.
+SRC_URI += "file://0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch"
+
 # Set default SRCREVs. Both the machine and meta SRCREVs are statically set
 # to the korg v3.7 tag, and hence prevent network access during parsing. If
 # linux-yocto-dev is the preferred provider, they will be overridden to
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 6560175461..3f34dbf87d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -20,6 +20,10 @@ SRCREV_meta ?= "a50ff542f8d79235030741f9e850d34768907d2d"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
+# Appears to be the only way to build out-of-tree
+# kernel drivers with the yocto project SDK.
+SRC_URI += "file://0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch"
+
 LINUX_VERSION ?= "6.12.27"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index cf6014efad..aab465e9dd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -25,6 +25,10 @@ PV = "${LINUX_VERSION}+git"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
+# Appears to be the only way to build out-of-tree
+# kernel drivers with the yocto project SDK.
+SRC_URI += "file://0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch"
+
 COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
 
 # Functionality flags
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index fefed8c9c5..b5efcc0192 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -43,6 +43,10 @@ KBRANCH:class-devupstream = "v6.12/base"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
+# Appears to be the only way to build out-of-tree
+# kernel drivers with the yocto project SDK.
+SRC_URI += "file://0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 LINUX_VERSION ?= "6.12.27"
 
-- 
2.43.0


