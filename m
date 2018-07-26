Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id EC39478C31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 15:04:34 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id v71-v6so3106106itb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 08:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fruSdWIH6/JAJMvzsO1oA+FDe52LcMSVOeVUs35ZI+Y=;
	b=sc6BMMNdi9Zz3KOx/HDZ2XOmM2lgLadvRVAiZxqR0Fqi/WWHe/ysK1T1GunnjpAxA+
	2EH4npwyTbwmK475ETfNDN45Dc1fnvbR59menRgw/K1VR2TlIrwDN4r9OMt53j+PNQZQ
	+YftE++OD2hHm1kkdglZpNGfAFbkDGkiPiH/dr6Sh6K1GFIQMgcwZc0g1OY/7l1URXEv
	PBuy9Hn25L/ph/tS/1g68gv4kKpg2MWOKCzScAJdm9/LLce/wwF3vnQvJNabJAgqkO+5
	IW6pqt8Bk00szltHmH9GMrYiPXRers/5HKMDXx/zjnTEmYBSuepzapgXD+/1k8D0fyN2
	fWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fruSdWIH6/JAJMvzsO1oA+FDe52LcMSVOeVUs35ZI+Y=;
	b=XDC+YZ6/rDSdA6ln7AOI0jwYrvMEMiMAe/CgSW8GKvG/xtRC/2NBtluVJcuwgP/mxD
	MSBdmLMf1obM6moUx3oZD0i1XxiZM03I7/8vTgcQizpi6a3gTneksfn1UIMSEg5oZg8l
	bBtrTcfNA8K3oko4rUkvUzdzsbZ7tVt7ySAWr706U+c4rIGsdmgvpDmWMmNne0PWBrdB
	prJrc4ZKydlSeaiYLZR/hTwu+SrkhD2exzfTx4H93IU+BpXoRSPJaBtI8YfXMX5+LH5H
	fkXIDYxiG8ACgfvO2fKuqHe3+SP85dveUXkGh90aVN3Hyno+bf/6BPa04NrhfuFW5HzE
	4Gxw==
X-Gm-Message-State: AOUpUlHqFm2mAnokkGsn5+9QUmtMJJ04BXEF+fbvxuyuLoE8J33zVsE7
	8Zf0SYk13cjYiI2sgXXG90xDD6E7
X-Google-Smtp-Source: AAOMgpd0+VyVNBiWwVVKKVaU0wzM8i0HSOzQdAraDlEP8bjPHpvk7m1bsIPU0+vIppfCZifrUGPODg==
X-Received: by 2002:a02:cd2:: with SMTP id 79-v6mr2294822jan.100.1532617475757;
	Thu, 26 Jul 2018 08:04:35 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	e140-v6sm507212iof.50.2018.07.26.08.04.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Jul 2018 08:04:35 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2018 10:04:09 -0500
Message-Id: <20180726150409.26104-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180725181158.13285-1-JPEWhacker@gmail.com>
References: <20180725181158.13285-1-JPEWhacker@gmail.com>
Subject: [sumo][PATCH v3] u-boot: Fix build race condition
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2018 15:04:35 -0000

Backports 2f61b13d6acba787b00598d519c85222e993e4ca (included in the
2018.07 release) which fixes a race condition when building.

[YOCTO #12705]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...efi_loader-avoid-make-race-condition.patch | 51 +++++++++++++++++++
 .../u-boot/u-boot-common_2018.01.inc          |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-efi_loader-avoid-make-race-condition.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-efi_loader-avoid-make-race-condition.patch b/meta/recipes-bsp/u-boot/files/0001-efi_loader-avoid-make-race-condition.patch
new file mode 100644
index 0000000000..da7e27c64c
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-efi_loader-avoid-make-race-condition.patch
@@ -0,0 +1,51 @@
+From 5c2e24a9ed54dfee77d1844a080e998b4affe916 Mon Sep 17 00:00:00 2001
+From: Heinrich Schuchardt <xypron.glpk@gmx.de>
+Date: Sat, 2 Jun 2018 19:00:41 +0200
+Subject: [PATCH] efi_loader: avoid make race condition
+
+When U-Boot is built with 'make -j' there is not guarantee that targets in
+directory arch/ are built before targets in directory lib/. The current
+build instruction for EFI binaries in lib/ rely on dependencies in arch/.
+If $(EFI_CRT0) or $(EFI_RELOC) is not yet built before trying to build
+%.efi an error
+    *** No rule to make target '%.efi'
+occurs.
+
+With the patch separate copies of $(EFI_CRT0) and $(EFI_RELOC) named
+efi_crt0.o and efi_reloc.o are built in lib/efi_loader and
+lib/efi_selftest.
+
+Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
+Signed-off-by: Alexander Graf <agraf@suse.de>
+
+Upstream-Status: Backport from 2018.07
+
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ scripts/Makefile.lib | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
+index 8f19b2db56..f2f398c935 100644
+--- a/scripts/Makefile.lib
++++ b/scripts/Makefile.lib
+@@ -404,8 +404,14 @@ cmd_efi_ld = $(LD) -nostdlib -znocombreloc -T $(EFI_LDS_PATH) -shared \
+ 
+ EFI_LDS_PATH = $(srctree)/arch/$(ARCH)/lib/$(EFI_LDS)
+ 
+-$(obj)/%_efi.so: $(obj)/%.o arch/$(ARCH)/lib/$(EFI_CRT0) \
+-		arch/$(ARCH)/lib/$(EFI_RELOC)
++$(obj)/efi_crt0.o: $(srctree)/arch/$(ARCH)/lib/$(EFI_CRT0:.o=.S)
++	$(call if_changed_dep,as_o_S)
++
++$(obj)/efi_reloc.o: $(srctree)/arch/$(ARCH)/lib/$(EFI_RELOC:.o=.c) $(recordmcount_source) FORCE
++	$(call cmd,force_checksrc)
++	$(call if_changed_rule,cc_o_c)
++
++$(obj)/%_efi.so: $(obj)/%.o $(obj)/efi_crt0.o $(obj)/efi_reloc.o
+ 	$(call cmd,efi_ld)
+ 
+ # ACPI
+-- 
+2.17.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
index d2073ea0c7..11b82b7e26 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
@@ -11,6 +11,7 @@ SRCREV = "f3dd87e0b98999a78e500e8c6d2b063ebadf535a"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
     file://MPC8315ERDB-enable-DHCP.patch \
+    file://0001-efi_loader-avoid-make-race-condition.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


