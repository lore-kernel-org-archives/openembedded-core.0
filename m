Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05066C4167B
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:37 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.4731.1642588889217182787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FaJFT4aI;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so13424501wmo.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=caw7EIk06Uc3MYl2vwP89eBGLTGDPhV2wRR7V+WR1Bc=;
        b=FaJFT4aIG3NsdgpWWDZe/KMFNVNX40rZSRbZSoEVVoZ1Ogu6rJPyboGe6v/bCtT1NV
         X2AEWzdBo3tfLO6Au3EwQNbgaFuqHw2vNioXq2TV6Qvb0Tm+e5fCrrakOfI5oslX1z6T
         zdZK9N8yRhlYGd2aSJ2E5aVXOMTTJ/MQtuYxTHLIW4IU3sd1IMN3IzqaxUpybC+OoB+A
         0fVmodAXCc5HY1+Jwmhv8y6auL4DSsAChgA4VtNeH8juw6cK5H0aURUH8MwDh+GfM9sw
         53Y1Qk3Qv2lsBiLvap3bgfYDfh+yJv5chONKgCrSzkTiVM9rnYdVz+6mx5rJnPlruqEb
         rnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=caw7EIk06Uc3MYl2vwP89eBGLTGDPhV2wRR7V+WR1Bc=;
        b=eDgD8BcHTChxIKW97hQxnKCBLbGme9y7Vq0A1MFV6kjs+BSp8OM8KXBc69nOAGGbmz
         9ckMN2JUVQabNYYAQTKT6xh1GqhwXv9TtPTW/TJT18spEgAiqfzd6o2/9H6A5vR+qQ67
         GcLyXxCUd5G+35o+cB3YLUDbbVnT/WlA2AKLLz/2XjlY0kPy3EefOtRGWLmVgAAhhkVG
         u2+bS3LmrYgIG1oEyAy/ykmv0YSMHzN0eeNNyzuHMt4GfV98aq97rtk2bF395djkKkTq
         wmS/X21aBkg8j3Cv0vTdEmPzglTkN5FrXD+c0gyo2bkXg9wDht11DbTSkJ+qzKZJkTm0
         iYNw==
X-Gm-Message-State: AOAM533Cbu/rCDY8pCDhHIFnEgmT9HLEwiM1kkTrdFeqREUVOVP89zrI
	AdFdwuGW3U50ezWx9Vxs1+ZPub9TM3s=
X-Google-Smtp-Source: 
 ABdhPJxekihx+rvjGJDu85ugWNo4EvZmt0YJw1IKZCJvtc3LcBKmjGndbicdTRamIQ1kZ3YIzv/v9Q==
X-Received: by 2002:a05:6000:1246:: with SMTP id
 j6mr28508163wrx.58.1642588887687;
        Wed, 19 Jan 2022 02:41:27 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Ross Burton <ross.burton@intel.com>
Subject: [PATCH 04/39] efivar: update 37 -> 38
Date: Wed, 19 Jan 2022 11:40:42 +0100
Message-Id: <20220119104117.2120127-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160695

Drop determinism.patch, resolved by
https://github.com/rhboot/efivar/commit/641a1626543ca3bf0cdd5ea0bd6cc3a82462521a

Drop no-werror.patch, can now be replaced by ERRORS= in make invocation.

Add a patch to efibootmgr to address build failures with new version.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-src-make-compatible-with-efivar-38.patch | 47 +++++++++++++++++++
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb  |  6 ++-
 ...1-docs-do-not-build-efisecdb-manpage.patch | 26 ++++++++++
 ...uild-util.c-separately-for-makeguids.patch | 38 +++++++++++++++
 .../efivar/efivar/determinism.patch           | 18 -------
 .../recipes-bsp/efivar/efivar/no-werror.patch | 18 -------
 .../efivar/{efivar_37.bb => efivar_38.bb}     | 19 ++++----
 7 files changed, 125 insertions(+), 47 deletions(-)
 create mode 100644 meta/recipes-bsp/efibootmgr/efibootmgr/0001-src-make-compatible-with-efivar-38.patch
 create mode 100644 meta/recipes-bsp/efivar/efivar/0001-docs-do-not-build-efisecdb-manpage.patch
 create mode 100644 meta/recipes-bsp/efivar/efivar/0001-src-Makefile-build-util.c-separately-for-makeguids.patch
 delete mode 100644 meta/recipes-bsp/efivar/efivar/determinism.patch
 delete mode 100644 meta/recipes-bsp/efivar/efivar/no-werror.patch
 rename meta/recipes-bsp/efivar/{efivar_37.bb => efivar_38.bb} (59%)

diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr/0001-src-make-compatible-with-efivar-38.patch b/meta/recipes-bsp/efibootmgr/efibootmgr/0001-src-make-compatible-with-efivar-38.patch
new file mode 100644
index 0000000000..f8d912391e
--- /dev/null
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr/0001-src-make-compatible-with-efivar-38.patch
@@ -0,0 +1,47 @@
+From 07f080184d067c1ebc3fec1b53dd4a06d1a2566a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 17 Jan 2022 23:24:34 +0100
+Subject: [PATCH] src: make compatible with efivar 38
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/efibootdump.c | 2 +-
+ src/efibootmgr.c  | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/efibootdump.c b/src/efibootdump.c
+index eceffd6..09bd76e 100644
+--- a/src/efibootdump.c
++++ b/src/efibootdump.c
+@@ -69,7 +69,7 @@ print_boot_entry(efi_load_option *loadopt, size_t data_size)
+ 	text_path = alloca(text_path_len);
+ 	if (!text_path)
+ 		error(100, "Couldn't allocate memory");
+-	rc = efidp_format_device_path(text_path, text_path_len,
++	rc = efidp_format_device_path((unsigned char *)text_path, text_path_len,
+ 				      dp, pathlen);
+ 	if (rc < 0) {
+ 		printf("<bad device path>");
+diff --git a/src/efibootmgr.c b/src/efibootmgr.c
+index 4e1a680..b77b1fb 100644
+--- a/src/efibootmgr.c
++++ b/src/efibootmgr.c
+@@ -949,7 +949,7 @@ show_vars(const char *prefix)
+ 			pathlen = efi_loadopt_pathlen(load_option,
+ 						      boot->data_size);
+ 			dp = efi_loadopt_path(load_option, boot->data_size);
+-			rc = efidp_format_device_path(text_path, text_path_len,
++			rc = efidp_format_device_path((unsigned char *)text_path, text_path_len,
+ 						      dp, pathlen);
+ 			if (rc < 0)
+ 				error(18, "Could not parse device path");
+@@ -960,7 +960,7 @@ show_vars(const char *prefix)
+ 			if (!text_path)
+ 				error(19, "Could not parse device path");
+ 
+-			rc = efidp_format_device_path(text_path, text_path_len,
++			rc = efidp_format_device_path((unsigned char *)text_path, text_path_len,
+ 						      dp, pathlen);
+ 			if (rc < 0)
+ 				error(20, "Could not parse device path");
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
index e9dfa0770e..3f883122e0 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
@@ -13,7 +13,8 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https;branch=master \
            file://0001-remove-extra-decl.patch \
            file://97668ae0bce776a36ea2001dea63d376be8274ac.patch \
-          "
+           file://0001-src-make-compatible-with-efivar-38.patch \
+           "
 SRCREV = "e067160ecef8208e1944002e5d50b275733211fb"
 
 S = "${WORKDIR}/git"
@@ -33,3 +34,6 @@ do_install () {
 }
 
 CLEANBROKEN = "1"
+# https://github.com/rhboot/efivar/issues/202
+COMPATIBLE_HOST:libc-musl = 'null'
+
diff --git a/meta/recipes-bsp/efivar/efivar/0001-docs-do-not-build-efisecdb-manpage.patch b/meta/recipes-bsp/efivar/efivar/0001-docs-do-not-build-efisecdb-manpage.patch
new file mode 100644
index 0000000000..cb30d3c430
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/0001-docs-do-not-build-efisecdb-manpage.patch
@@ -0,0 +1,26 @@
+From f39a1481a9e465387901d52b07ae56dedcc3838b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sun, 16 Jan 2022 18:25:33 +0100
+Subject: [PATCH] docs: do not build efisecdb manpage
+
+It requires mandoc, which oe-core does not have.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ docs/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/docs/Makefile b/docs/Makefile
+index c9bf585..91a6078 100644
+--- a/docs/Makefile
++++ b/docs/Makefile
+@@ -5,7 +5,7 @@ include $(TOPDIR)/src/include/version.mk
+ include $(TOPDIR)/src/include/rules.mk
+ include $(TOPDIR)/src/include/defaults.mk
+ 
+-MAN1TARGETS = efisecdb.1 \
++MAN1TARGETS = \
+ 	      efivar.1
+ 
+ MAN3TARGETS = efi_append_variable.3 \
diff --git a/meta/recipes-bsp/efivar/efivar/0001-src-Makefile-build-util.c-separately-for-makeguids.patch b/meta/recipes-bsp/efivar/efivar/0001-src-Makefile-build-util.c-separately-for-makeguids.patch
new file mode 100644
index 0000000000..02781eb67d
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/0001-src-Makefile-build-util.c-separately-for-makeguids.patch
@@ -0,0 +1,38 @@
+From 80f11fcb46f6b52e13501cb323ca1a849c3f6e88 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 18 Jan 2022 11:53:41 +0100
+Subject: [PATCH] src/Makefile: build util.c separately for makeguids
+
+util.c needs to be built twice when cross-compiling:
+for the build machine to be able to link with
+makeguids which then runs during the same build,
+and then for the actual target.
+
+Upstream-Status: Submitted [https://github.com/rhboot/efivar/pull/203]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/Makefile | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 0e423c4..b10051b 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -28,10 +28,13 @@ EFIVAR_OBJECTS = $(patsubst %.S,%.o,$(patsubst %.c,%.o,$(EFIVAR_SOURCES)))
+ EFISECDB_SOURCES = efisecdb.c guid-symbols.c secdb-dump.c util.c
+ EFISECDB_OBJECTS = $(patsubst %.S,%.o,$(patsubst %.c,%.o,$(EFISECDB_SOURCES)))
+ GENERATED_SOURCES = include/efivar/efivar-guids.h guid-symbols.c
+-MAKEGUIDS_SOURCES = makeguids.c util.c
++MAKEGUIDS_SOURCES = makeguids.c util-makeguids.c
+ MAKEGUIDS_OBJECTS = $(patsubst %.S,%.o,$(patsubst %.c,%.o,$(MAKEGUIDS_SOURCES)))
+ MAKEGUIDS_OUTPUT = $(GENERATED_SOURCES) guids.lds
+ 
++util-makeguids.c :
++	cp util.c util-makeguids.c
++
+ ALL_SOURCES=$(LIBEFISEC_SOURCES) $(LIBEFIBOOT_SOURCES) $(LIBEFIVAR_SOURCES) \
+ 	    $(MAKEGUIDS_SOURCES) $(GENERATED_SOURCES) $(EFIVAR_SOURCES) \
+ 	    $(sort $(wildcard include/efivar/*.h))
+-- 
+2.20.1
+
diff --git a/meta/recipes-bsp/efivar/efivar/determinism.patch b/meta/recipes-bsp/efivar/efivar/determinism.patch
deleted file mode 100644
index bdf6bfc4a8..0000000000
--- a/meta/recipes-bsp/efivar/efivar/determinism.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Fix reproducibility issue caused by unsorted wildcard expansion.
-
-Upstream-Status: Pending
-RP 2021/3/1
-
-Index: git/src/Makefile
-===================================================================
---- git.orig/src/Makefile
-+++ git/src/Makefile
-@@ -15,7 +15,7 @@ TARGETS=$(LIBTARGETS) $(BINTARGETS) $(PC
- STATICTARGETS=$(STATICLIBTARGETS) $(STATICBINTARGETS)
- 
- LIBEFIBOOT_SOURCES = crc32.c creator.c disk.c gpt.c loadopt.c path-helpers.c \
--		     linux.c $(wildcard linux-*.c)
-+		     linux.c $(sort $(wildcard linux-*.c))
- LIBEFIBOOT_OBJECTS = $(patsubst %.c,%.o,$(LIBEFIBOOT_SOURCES))
- LIBEFIVAR_SOURCES = dp.c dp-acpi.c dp-hw.c dp-media.c dp-message.c \
- 	efivarfs.c error.c export.c guid.c guids.S guid-symbols.c \
diff --git a/meta/recipes-bsp/efivar/efivar/no-werror.patch b/meta/recipes-bsp/efivar/efivar/no-werror.patch
deleted file mode 100644
index 50a0b1023a..0000000000
--- a/meta/recipes-bsp/efivar/efivar/no-werror.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Don't use -Werror because newer compilers introduce newer warnings.
-
-Upstream-Status: Inappropriate [https://github.com/rhboot/efivar/issues/131]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/gcc.specs b/gcc.specs
-index 45d43d1..1baf11a 100644
---- a/gcc.specs
-+++ b/gcc.specs
-@@ -2,7 +2,7 @@
- + -D_GNU_SOURCE
- 
- *efivar_cpp_options:
-- -Werror -Wall -std=gnu11 -Wextra
-+ -Wall -std=gnu11 -Wextra
- 
- *cpp_options:
- + %(efivar_cpp_options)
diff --git a/meta/recipes-bsp/efivar/efivar_37.bb b/meta/recipes-bsp/efivar/efivar_38.bb
similarity index 59%
rename from meta/recipes-bsp/efivar/efivar_37.bb
rename to meta/recipes-bsp/efivar/efivar_38.bb
index fc36913f30..5d2cd470ce 100644
--- a/meta/recipes-bsp/efivar/efivar_37.bb
+++ b/meta/recipes-bsp/efivar/efivar_38.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=master;protocol=https \
-           file://determinism.patch \
-           file://no-werror.patch"
-SRCREV = "c1d6b10e1ed4ba2be07f385eae5bceb694478a10"
+SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
+           file://0001-docs-do-not-build-efisecdb-manpage.patch \
+           file://0001-src-Makefile-build-util.c-separately-for-makeguids.patch \
+           "
+SRCREV = "1753149d4176ebfb2b135ac0aaf79340bf0e7a93"
 
 S = "${WORKDIR}/git"
 
@@ -22,12 +23,8 @@ export CCLD_FOR_BUILD = "${BUILD_CCLD}"
 # enforce BFD.
 LDFLAGS += "-fuse-ld=bfd"
 
-do_compile:prepend() {
-    # Remove when https://github.com/rhboot/efivar/issues/130 is fixed
-    oe_runmake \
-        CFLAGS="${BUILD_CFLAGS}" \
-        LDFLAGS="${BUILD_LDFLAGS}" \
-        -C src makeguids
+do_compile() {
+    oe_runmake ERRORS= HOST_CFLAGS="${BUILD_CFLAGS}" HOST_LDFLAGS="${BUILD_LDFLAGS}"
 }
 
 do_install() {
@@ -39,3 +36,5 @@ BBCLASSEXTEND = "native"
 RRECOMMENDS:${PN}:class-target = "kernel-module-efivarfs"
 
 CLEANBROKEN = "1"
+# https://github.com/rhboot/efivar/issues/202
+COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.20.1


