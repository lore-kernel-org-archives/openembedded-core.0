Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4B4636E650
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 18:03:26 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id e14-v6so1683615itf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 11:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1GLlisiE9BQaD6eUdhnwVRWvc3R9ZBOd5wlDYwaqdH4=;
	b=M1XApvAGWuEzOaDyYYeOtsMtqiSKNI/DuICSgnmwDfrLppUwMU1tAhkzAQ7PKZMNrP
	6dyLbjhiHeh6YLjtras/UXIoL8OPcqszXxSgs8omCb/9wOs9kQFk2UJeQgyNs8LRzDT+
	TCF9wXtwenKJqTkbLdNozpvVz+nvLiznvGqD25k42A0BHaODTYJbaq+bzk1tUx+dt4aw
	LR8lQtRAVmf2PSDyucmyduulFYXMvfL9GqbuM36DRi5UmVI2g8Q4UF8CEMn/E1uPUzM6
	D7IuzR/ssNi7OLn81gBlQkpTLeUkIQCPy6wCd3DFabvxOApNPwmmMTMTzO2hJm3M16W/
	DHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1GLlisiE9BQaD6eUdhnwVRWvc3R9ZBOd5wlDYwaqdH4=;
	b=TWjE+ZaQ36hUkxWTf7rrpA16wsvKvtP9tUM7sRWVA2OtjGsTolzlneO8vfnznAXR09
	/AKvzrqVZv0VzQB8f/aDBVD7SxGieTy+H+e/is4/JqFvhHEu54kN2JIOcTJdG/egLGyJ
	tRPLMAueQQHi3nP4cc0FGwAED7json3jrvhOuEGChyWqV2PZsW7hq6oIupDWJFkFo359
	2I0Os2fdDoW5Qbn/5ZfJXV2lkWflvj7DFtw5gKPLBCrtCh5Gh/n2ueDJvJ8SeS8RQU6q
	uDLsVM2OZ8ZTOnYA7nYuNLx/m5yMhhcXjYHb5xifiJ5wiNEY26Cmzdsngrkj2XyZ8LJ+
	TGiQ==
X-Gm-Message-State: AOUpUlFNWvAU7YOD3yJjAkEvbOgP07vRxBLDc1F4tEIucsrBCtHsUQcc
	HJDt9BIkyO5ivy7kwH/hYTP2XGKJ
X-Google-Smtp-Source: AAOMgpeyF/6Ox/vgCXmAXcLIh8qrkVaBnm52oWTz+1tZ2vvHwDXYK16AC5wYVSxmqOiIl5uiBLyWsg==
X-Received: by 2002:a24:e008:: with SMTP id c8-v6mr6735649ith.99.1532541807082;
	Wed, 25 Jul 2018 11:03:27 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	f204-v6sm2993205itc.13.2018.07.25.11.03.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jul 2018 11:03:26 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2018 13:03:16 -0500
Message-Id: <20180725180316.6352-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Joshua Watt <JPEWhacker@gmain.com>
Subject: [sumo][PATCH] u-boot: Fix build race condition
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
X-List-Received-Date: Wed, 25 Jul 2018 18:03:26 -0000

From: Joshua Watt <JPEWhacker@gmain.com>

Backports 2f61b13d6acba787b00598d519c85222e993e4ca (included in the
2018.07 release) which fixes a race condition when building.

Change-Id: If7af74cafd9d22fcb23cfe2ffd12084ca5ca083b
Signed-off-by: Joshua Watt <JPEWhacker@gmain.com>
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


