Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id A6D9A74583
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 18:12:00 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id r15-v6so7089816ioa.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 11:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=L61C4NY0MLorRYQlZ4SCGzUBpJaVMLKyLLAFkImKHWY=;
	b=vYTcXXHbTsZ12HOTFWxN4JquW4ie9ocSL3j3eIDaa8inKevOQ1XZVgdtdtwZNhzAQc
	weTjMIEdzFcHjC3rFwRR4526FVJ5y3e9D2YWoISHqSvaAdbxlAUxKkByZhgnKxi0vWWE
	4JbQVkIUAaSXeaWZVms3IaJY/IWGK+dRXKwABTti2eCFP2UVU4dVtjJEhUkWCpKi4ofW
	YJdfJjBpCQwv0P8rCW/15E+x23tcIfMNiIUM0BQjhXIjn5EeSb/UsGXlVHtpZujF9p6t
	0FkmvEmzb2FP/6Py7aG65p/CzwugZKcy9DkEbtBrCdmMSWr99p3LGvoLK6jqunHYnaFJ
	Fmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=L61C4NY0MLorRYQlZ4SCGzUBpJaVMLKyLLAFkImKHWY=;
	b=oSn1NTNY1ZeoFE5DMxigAyF33rzxwr/R0rscO/zjkMRZfGIsXi1R3j+pDjYx/7TCya
	vxPmCVtpcSKx+gCWQgM7xM1SiPr24OQkpPtlV9bOywmqXrAXLk+k8LIbL6qRnpfUoZAu
	qWgDa01JEVPi5MOdFRCb4Q1GuSv86aMU5B4UzwjOIxQZ1pOPCDe83eDYL2u3uugDABQx
	Z0lLzO7QmoiFd3X7l3oq5khmFhTK4y/r8WHZFYz9RhW/c8917ZhrKsI8ri6wAY9vOLmu
	EDpHekMt3DqhzrMnaV/f35CUdX+CV6qLJBAmK3tFQMCoMiV95/VrxRUIdJ2Sv7u39WgT
	q0lg==
X-Gm-Message-State: AOUpUlE10H+/H8X+knbNWFEjjQ/NZpB/QBUyLamLhDODzkoc+Xj0zSxV
	RPg3eKV/lplRXpXtGpzzRqbJBsiM
X-Google-Smtp-Source: AAOMgpcZmmogvNw+zOI4fbQ73oOeh67TnwndmAwlzED5Wb0NOGZH25js08TMjE7D6EX2HJv76UU5Jg==
X-Received: by 2002:a5e:9812:: with SMTP id
	s18-v6mr17637178ioj.117.1532542321442; 
	Wed, 25 Jul 2018 11:12:01 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	u127-v6sm5525333iod.54.2018.07.25.11.12.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jul 2018 11:12:01 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2018 13:11:58 -0500
Message-Id: <20180725181158.13285-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180725180316.6352-1-JPEWhacker@gmail.com>
References: <20180725180316.6352-1-JPEWhacker@gmail.com>
Subject: [sumo][PATCH v2] u-boot: Fix build race condition
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
X-List-Received-Date: Wed, 25 Jul 2018 18:12:00 -0000

Backports 2f61b13d6acba787b00598d519c85222e993e4ca (included in the
2018.07 release) which fixes a race condition when building.

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


