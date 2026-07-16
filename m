Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47DFC44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 12:22:33 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11588.1784204550254622173
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 05:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H2iPglvW;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: festevam@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81ee2c048acso5939217b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 05:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784204549; x=1784809349; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tjZIjh0v2rZKyMtP5KdB2eQoyo15VefJznTu8yPBBd4=;
        b=H2iPglvWUKNUqZErWbjE/l4ehjGKBJxstbgos6t4Hliu2jW4d0CZVeKOIWwQvGQt7w
         n6PL2bPdP1xjvJee0jL9IYp3DZt7MzsD0pNkp+dcL6el5rejoT80cVt643rugWkJi8mJ
         TU7Q0W4MOYotWhSZg2YtyjtN7AWlUptb6pRM7MzA9cL4gTiV5cEpXryKw2zRR/Hpn/qv
         +jElHYCOjkw614AROb7aaJrnxqxWO55V0zIUztN9pa6J1Im3sJc8a6lZfJkxyu8nVfn9
         0OPo9HHBy6W1nHUGJ7xBUnduuTXFMsLTJXI/YAJiVGW7/ZtWfKTvQ/X+MyLRvKHorkPG
         efqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784204549; x=1784809349;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjZIjh0v2rZKyMtP5KdB2eQoyo15VefJznTu8yPBBd4=;
        b=BtUl92f5mgovTOxYDb5z8FEeyfaIKbFWo4rcFGMTo6degYoD9jJvzoERWdcslmeadC
         w3F7oXDfo2Tut/EsxgZOk0I3XqfpGF3VMxjV+tNw3WpMX+9veKS7LQ5OQN582/2hjf1x
         88Wk6RsvFGZ+ZQ4qdxZSQ6i1gaYdgCQFUzrsH06CMSKgOfgsFd+X4ymJMLeT4yi7i/K3
         YXPQswm8R8fdSch0VszvPILJfHo42zzrOtZBXhQHaJwvzcrp/VfPk/uBsfARt5Lj30Bu
         /E2CBvBHVOOfbZTWFN2VlSOElcJTqQvIyRUaf9k1Mv5w9ESAmAo5rLAYx7ANCDC5YA6X
         67gg==
X-Gm-Message-State: AOJu0YxyXALUT3Lq/7qIYLgWv/pLb2g2Pz4xull9KxcZiwa79rqmv6BJ
	iBzL3ZwL/AUzfR/PLENjK67GN10//w/bawT/3rZsIny/ixCczyjtWXV8IosV7g==
X-Gm-Gg: AfdE7clc4kgjujpz43lvigEf0fa9XDmTqnTq8RN3jANnCtan/931lbdC3ctVbLqii6M
	IzwpgETztxFlvCvqJ1VD0y9UzN2EkSbgGCj2Li83awKjP/AYl1eXD+2U0ixcM7ZjvKO2xMj9Bo1
	xTGy16F9zwXsBl9h64I8h3jMqSx+drw0Pnlvp2VHrkRszG4UwE8KgfRuDV0KrpK2L+2JPMrjsoB
	QRT/B6Tpue2kxTLQZdbN9W2JjMHBQZ+/JS2HP8BTIjRiFR9x50wPtJVlUeOf3OGsMh+0gwZ+bo/
	n/hoQpxUepdP1+g0l4CuZooHPiYa1X813uWxv2UJCXALL+ylRxTV7JTnKikdT4Lcbmn8jvDEtxb
	CfUdefP51K9cYAazlOu/A+/oLBLW42b5sU5+05PVSx0N1d9NtBgyIBiMKvxq6hhDg20M5w3FjrG
	5Zsw7ZF1jBy1kysT5up9PHaTVmye2+WstEGpYPHPJGs0dvF6v0s+aXtThRGQ==
X-Received: by 2002:a05:690c:9991:b0:80c:6dd5:21c3 with SMTP id 00721157ae682-81ebb1432c8mr97438777b3.24.1784204549143;
        Thu, 16 Jul 2026 05:22:29 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a801:a24:61fc:d0de:7874:f476])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e950567eesm132957247b3.13.2026.07.16.05.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:22:28 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@nabladev.com,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 2/2] u-boot: upgrade 2026.04 -> 2026.07
Date: Thu, 16 Jul 2026 09:22:18 -0300
Message-ID: <20260716122219.569673-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716122219.569673-1-festevam@gmail.com>
References: <20260716122219.569673-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 12:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241090

From: Fabio Estevam <festevam@nabladev.com>

Remove the local patch as it has been upstreamed.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 ...ripts-dtc-drop-yaml-in-DT-validation.patch | 85 -------------------
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  2 +-
 .../u-boot/u-boot-tools_2026.04.bb            |  4 -
 .../u-boot/u-boot-tools_2026.07.bb            |  2 +
 .../{u-boot_2026.04.bb => u-boot_2026.07.bb}  |  2 -
 5 files changed, 3 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-validation.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
 rename meta/recipes-bsp/u-boot/{u-boot_2026.04.bb => u-boot_2026.07.bb} (93%)

diff --git a/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-validation.patch b/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-validation.patch
deleted file mode 100644
index 9c1adc8faf..0000000000
--- a/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-validation.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From e77402000f978561ff2afe405aa9e5c9037a8717 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
-Date: Wed, 29 Apr 2026 15:22:25 +0200
-Subject: [PATCH] scripts/dtc: drop yaml in DT validation
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The build issues found in dtc/yamltree were partially mitigated by a
-previous commit (807bcd844a: "scripts/dtc: Fix pkg-config behavior under
-sysroot"), but upstream dtc simply disabled yaml, and the same should be
-done here in order to permanently avoid those issues.
-
-Backport the change below from Linux v5.18 [1]:
-
-ef8795f3f1c ("dt-bindings: kbuild: Use DTB files for validation")
-
-I tested this patch with a couple Yocto builds: u-boot and u-boot-tools,
-using the current master branch (rev. "c53b0708f9"), having removed
-libyaml-native from u-boot-tools's dependencies.
-
-[1] https://git.kernel.org/linus/ef8795f3f1ce
-
-Signed-off-by: João Marcos Costa <joaomarcos.costa@bootlin.com>
-
-Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/8ef8dee4f3a2b2021decfefd853dbd2a1632b77f]
----
- scripts/Makefile.lib             | 6 ------
- scripts/dtc/Makefile             | 8 --------
- scripts/dtc/update-dtc-source.sh | 2 +-
- 3 files changed, 1 insertion(+), 15 deletions(-)
-
-diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
-index b8969b7de54..d66f1ed13b1 100644
---- a/scripts/Makefile.lib
-+++ b/scripts/Makefile.lib
-@@ -86,12 +86,6 @@ base-dtb-y := $(foreach m, $(multi-dtb-y), $(firstword $(call suffix-search, $m,
- extra-y				+= $(dtb-y)
- extra-$(CONFIG_OF_ALL_DTBS)	+= $(dtb-)
- 
--# U-Boot specific
--ifneq ($(CHECK_DTBS),)
--extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
--extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
--endif
--
- # Add subdir path
- 
- extra-y		:= $(addprefix $(obj)/,$(extra-y))
-diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
-index 6f309b37e08..2ba8dba03be 100644
---- a/scripts/dtc/Makefile
-+++ b/scripts/dtc/Makefile
-@@ -17,15 +17,7 @@ fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
- # Source files need to get at the userspace version of libfdt_env.h to compile
- HOST_EXTRACFLAGS := -I$(srctree)/$(src)/libfdt
- 
--ifeq ($(wildcard $(PKG_CONFIG_SYSROOT_DIR)/usr/include/yaml.h),)
- HOST_EXTRACFLAGS += -DNO_YAML
--else
--dtc-objs	+= yamltree.o
--# To include <yaml.h> installed in a non-default path
--HOSTCFLAGS_yamltree.o := $(shell pkg-config --cflags yaml-0.1)
--# To link libyaml installed in a non-default path
--HOSTLDLIBS_dtc	:= $(shell pkg-config --libs yaml-0.1)
--endif
- 
- # Generated files need one more search path to include headers in source tree
- HOSTCFLAGS_dtc-lexer.lex.o := -I$(src)
-diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
-index 32ff17ffd08..94627541533 100755
---- a/scripts/dtc/update-dtc-source.sh
-+++ b/scripts/dtc/update-dtc-source.sh
-@@ -32,7 +32,7 @@ DTC_UPSTREAM_PATH=`pwd`/../dtc
- DTC_LINUX_PATH=`pwd`/scripts/dtc
- 
- DTC_SOURCE="checks.c data.c dtc.c dtc.h flattree.c fstree.c livetree.c srcpos.c \
--		srcpos.h treesource.c util.c util.h version_gen.h yamltree.c \
-+		srcpos.h treesource.c util.c util.h version_gen.h \
- 		dtc-lexer.l dtc-parser.y"
- LIBFDT_SOURCE="fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
- 		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
--- 
-2.47.0
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 574768b9f8..229d779498 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "88dc2788777babfd6322fa655df549a019aa1e69"
+SRCREV = "ece349ade2973e220f524ce59e59711cc919263f"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
deleted file mode 100644
index 6c3ef7efd1..0000000000
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require u-boot-common.inc
-require u-boot-tools.inc
-
-SRC_URI += "file://0001-scripts-dtc-drop-yaml-in-DT-validation.patch"
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
new file mode 100644
index 0000000000..7eaf721ca8
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
@@ -0,0 +1,2 @@
+require u-boot-common.inc
+require u-boot-tools.inc
diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.04.bb b/meta/recipes-bsp/u-boot/u-boot_2026.07.bb
similarity index 93%
rename from meta/recipes-bsp/u-boot/u-boot_2026.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2026.07.bb
index b6345c8875..eed5127004 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.07.bb
@@ -3,8 +3,6 @@ require u-boot.inc
 
 DEPENDS += "bc-native dtc-native gnutls-native python3-pyelftools-native"
 
-SRC_URI += "file://0001-scripts-dtc-drop-yaml-in-DT-validation.patch"
-
 # workarounds for aarch64 kvm qemu boot regressions
 SRC_URI:append:qemuarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
 SRC_URI:append:genericarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
-- 
2.43.0


