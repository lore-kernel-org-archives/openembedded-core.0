Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6872FC87FDA
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:12:03 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.13180.1754295111301701352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DneSjwd1;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-33275f235ffso1002691fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 01:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754295109; x=1754899909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aG0aj6tGq4UdFmOGhYBgA8ulaNKvrPr8Y2QHz4rlmvE=;
        b=DneSjwd1ja5nvUkEk57345c38xSavCKwh114018IqRkFvfL9VTKZU1cELDyA87+DCZ
         XHO12cqmNCdeYfSo7SdacvonU4CrlCko0Vd5O+HbV7/F1ZOV/9MFH2gRxim3KI42NH8J
         lmFYhtQ9C4yn2NQsubMjI1dfWL0zz2/GrdYztY4qzLHIhMpaeW5La2/okGF+LvqW0rvr
         BtMPY2Q1gHeJEKkIyTcjweMoiME+VKQN4BKjTzYxDiVZmPKK0wgDUrDirvXHvVkhrWeE
         AAdkzk8CONCvTeYhbExlg/ju6OZcQrwX1Tni14X419gxRA7faAEiEi7CV/NrFeNPmO01
         3UQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754295109; x=1754899909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aG0aj6tGq4UdFmOGhYBgA8ulaNKvrPr8Y2QHz4rlmvE=;
        b=cwbCBqMYqW44kLtcNSHe5XrM2L20oDYxBToM5HgCBTlhsw7Ql++c7c48Wv5PocE24y
         OXtAhQokJWMiLA4nrsp3ikomWSdYhPXBa/MMcGBbB2S9zm8u881sYPvBxpuOW/OBleSM
         GhUqnXHAE5WQhR112MF0XMlP16gba38fgUUVh2hOjrOM6+AB9LlDadb+OGJDgJUlLiom
         ZukMLKqsMZ4j+ksvjVNJRWv+5aq3ygxmTqGLPiILutCeCBo3Awgn282la/4TY7oeXim/
         R2yOUcE6KERrG/LQ+lu0rTajdpiucuTOItwiul7aQW7fFteZ3VYSHyI3ex0Ccf+5zRzU
         a/gQ==
X-Gm-Message-State: AOJu0Yx9poLzmv5LYZl+5tPZtbWmTSPaaqrPCNmNXwiwOFQtCvRZT48Z
	ipPRrLsBCspyM3ojtbpiXU90iAoS0uN4qtT+8WAlQgL/G/xQSBecar+/wFnSuse+PgV923G3Hk5
	qfzi+M+w=
X-Gm-Gg: ASbGncvnkLAZfzRKMVAi/47fj7VGJc5qb6tzAYk3kkYydVxjShurIAIQrFKawxl4gFc
	gJWDUtg7mPtNgFrgN0xiw1k7qRqUaRTub8KsTIFFne0Il1XdBo0RrsP1OLPZzTuIc1gI58Q6Y3H
	YrNBV8Y6Bqp4+pG9GcvqCFJheIYc0Q0M87PatYprrZVUAdiN/2NuFDLugG0rVZ3ECvTiDUiXGjM
	9lAr+fb54w+nBgaKP+N30+O5eB/MvM2QbmfMilALJDy15Db8m1q7o6OlImXYFlZoaOZWSZDge60
	hppU17bg95jvVBGBUSanUUwPN0C6Eo+gVIma8UTo60F85G6GzNYUsCn6wYtiMaKi9K1tH4VHKPq
	1ZOBHps/yV9qBSFK4uZO4trzs0tpy2V9ErU8Y8VLlyCqyTroYqqPwOY4=
X-Google-Smtp-Source: AGHT+IF7BAauCt8rzg96JIKaozpaBawHSq87nmO+Uo2bDEb6rfoCBePFVKdflIXyDBKOEYH249CoOA==
X-Received: by 2002:a05:6512:1188:b0:550:e50a:bf49 with SMTP id 2adb3069b0e04-55b88c8ee1amr4671916e87.19.1754295108950;
        Mon, 04 Aug 2025 01:11:48 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bddasm1551659e87.39.2025.08.04.01.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 01:11:48 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] u-boot: update build racecondition patches
Date: Mon,  4 Aug 2025 11:11:32 +0300
Message-ID: <20250804081132.357059-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 08:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221417

A different patch was applied upstream after reviews
and testing.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...dependency-from-lib-to-arch-ARCH-lib.patch |  81 +++++++++++
 ...pts-Makefile.lib-fix-_efi.so-depende.patch | 136 ------------------
 ...kefile-change-apps-from-always-to-ta.patch |  57 --------
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   3 +-
 4 files changed, 82 insertions(+), 195 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-Makefile-add-depende=
ncy-from-lib-to-arch-ARCH-lib.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/v3-0001-Makefile-scripts-=
Makefile.lib-fix-_efi.so-depende.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/v3-0002-efi_loader-Makefi=
le-change-apps-from-always-to-ta.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-Makefile-add-dependency-fro=
m-lib-to-arch-ARCH-lib.patch b/meta/recipes-bsp/u-boot/files/0001-Makefile-=
add-dependency-from-lib-to-arch-ARCH-lib.patch
new file mode 100644
index 000000000000..06fdaf5b0a37
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-Makefile-add-dependency-from-lib-t=
o-arch-ARCH-lib.patch
@@ -0,0 +1,81 @@
+From d0075e2d730a4fa48aa763a669e5edbc02c33a22 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Thu, 31 Jul 2025 14:52:48 +0300
+Subject: [PATCH] Makefile: add dependency from lib to arch/$(ARCH)/lib
+
+Top level Makefile starts separate "make" processes for each each
+subdirectory. lib/efi_loader apps now depend on lib.a from
+arch/$(ARCH)/lib if CONFIG_USE_PRIVATE_LIBGCC is enabled which creates
+a race conditions since dependency from lib/efi_loader EFI apps to
+arch/$(ARCH)/lib/lib.a is not explicit:
+
+arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No such fil=
e or directory
+make[3]: *** [scripts/Makefile.lib:512: lib/efi_loader/testapp_efi.so] Err=
or 1
+
+This error was seen on yocto/OE-core CI builds after u-boot 2025.07 update:
+
+https://lists.openembedded.org/g/openembedded-core/message/220004
+
+https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2914600/raw_inli=
ne
+
+    |    rm -f lib/efi_loader/built-in.o; arm-poky-linux-gnueabi-ar cDPrsT=
 lib/efi_loader/built-in.o lib/efi_loader/efi_bootmgr.o lib/efi_loader/efi_=
bootbin.o lib/efi_loader
+/efi_boottime.o lib/efi_loader/efi_helper.o lib/efi_loader/efi_console.o l=
ib/efi_loader/efi_device_path.o lib/efi_loader/efi_device_path_to_text.o li=
b/efi_loader/efi_device_
+path_utilities.o lib/efi_loader/efi_dt_fixup.o lib/efi_loader/efi_fdt.o li=
b/efi_loader/efi_file.o lib/efi_loader/efi_hii.o lib/efi_loader/efi_hii_con=
fig.o lib/efi_loader/efi
+_image_loader.o lib/efi_loader/efi_load_options.o lib/efi_loader/efi_memor=
y.o lib/efi_loader/efi_root_node.o lib/efi_loader/efi_runtime.o lib/efi_loa=
der/efi_setup.o lib/efi_
+loader/efi_string.o lib/efi_loader/efi_unicode_collation.o lib/efi_loader/=
efi_var_common.o lib/efi_loader/efi_var_mem.o lib/efi_loader/efi_variable.o=
 lib/efi_loader/efi_var_
+file.o lib/efi_loader/efi_watchdog.o lib/efi_loader/efi_disk.o lib/efi_loa=
der/efi_net.o lib/efi_loader/efi_smbios.o lib/efi_loader/efi_load_initrd.o =
lib/efi_loader/efi_confo
+rmance.o
+    |   arm-poky-linux-gnueabi-ld.bfd -nostdlib -zexecstack -znocombreloc =
-znorelro --no-warn-rwx-segments -L /srv/pokybuild/yocto-worker/oe-selftest=
-armhost/build/build-st-
+3119200/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/2025.07/source=
s/u-boot-2025.07 -T arch/arm/lib/elf_arm_efi.lds -shared -Bsymbolic -s lib/=
efi_loader/helloworld.o
+lib/efi_loader/efi_crt0.o lib/efi_loader/efi_reloc.o lib/efi_loader/efi_fr=
eestanding.o arch/arm/lib/lib.a -o lib/efi_loader/helloworld_efi.so
+    | arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No su=
ch file or directory
+    | make[3]: *** [scripts/Makefile.lib:512: lib/efi_loader/helloworld_ef=
i.so] Error 1
+
+The different "make" processes share common scripts/Makefile.build
+and scripts/Makefile.libs but since they are separate processes
+the Makefile rules can't add a dependency from lib/uefi_loader targets
+to arch/$(ARCH)/lib/lib.a. Or the file level dependency can be added but
+then "make" produces a too sparse error message which does not mention
+that one of the dependencies like arch/$(ARCH)/lib/lib.a was not found:
+
+make[3]: *** No rule to make target 'lib/efi_loader/helloworld.efi', neede=
d by '__build'.  Stop.
+
+Fix this dependency problem by building arch/$(ARCH)/lib before lib
+if CONFIG_USE_PRIVATE_LIBGCC was enabled.
+
+To reproduce the race condition more reliably, add a "sleep 10" delay
+before linker command cmd_link_l_target with 2025.07
+or to $(lib-target): target in scripts/Makefile.build with master branch
+after Kbuild update.
+
+Fixes: 43d43241d1c9 ("scripts/Makefile.lib: add PLATFORM_LIBGCC to efi lin=
king")
+
+Cc: Adriano Cordova <adrianox@gmail.com>
+Cc: Fabio Estevam <festevam@gmail.com>
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+Reviewed-by: Fabio Estevam <festevam@gmail.com>
+---
+ Makefile | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+Upstream-Status: Backport
+
+diff --git a/Makefile b/Makefile
+index c31bf7ecea97..b03f87a93fb9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2131,6 +2131,11 @@ $(filter-out tools, $(u-boot-dirs)): tools
+ # is "yes"), so compile examples after U-Boot is compiled.
+ examples: $(filter-out examples, $(u-boot-dirs))
+=20
++ifeq ($(CONFIG_USE_PRIVATE_LIBGCC),y)
++# lib/efi_loader apps depend on arch/$(ARCH)/lib for lib.a
++lib: $(filter arch/$(ARCH)/lib, $(u-boot-dirs))
++endif
++
+ # The setlocalversion script comes from linux and expects a
+ # KERNELVERSION variable in the environment for figuring out which
+ # annotated tags are relevant. Pass UBOOTVERSION.
+--=20
+2.43.0
+
diff --git a/meta/recipes-bsp/u-boot/files/v3-0001-Makefile-scripts-Makefil=
e.lib-fix-_efi.so-depende.patch b/meta/recipes-bsp/u-boot/files/v3-0001-Mak=
efile-scripts-Makefile.lib-fix-_efi.so-depende.patch
deleted file mode 100644
index e8253a67b211..000000000000
--- a/meta/recipes-bsp/u-boot/files/v3-0001-Makefile-scripts-Makefile.lib-f=
ix-_efi.so-depende.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-From 2e7c1321bb44cc6af4ee4b1026a52e1a0aa7e336 Mon Sep 17 00:00:00 2001
-From: Mikko Rapeli <mikko.rapeli@linaro.org>
-Date: Thu, 10 Jul 2025 14:24:07 +0000
-Subject: [PATCH v3 1/2] Makefile scripts/Makefile.lib: fix *_efi.so depend=
ency
- to PLATFORM_LIBGCC
-
-When PLATFORM_LIBGCC was added to linker command it was not
-added to the dependency of the .so and other rules. Thus a build can
-try to link *_efi.so files before lib.a from PLATFORM_LIBGCC is available.
-This was seen in yocto autobuilder builds with u-boot 2025.07
-update, see https://lists.openembedded.org/g/openembedded-core/message/220=
004
-
-https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2914600/raw_inli=
ne
-
-|    rm -f lib/efi_loader/built-in.o; arm-poky-linux-gnueabi-ar cDPrsT lib=
/efi_loader/built-in.o lib/efi_loader/efi_bootmgr.o lib/efi_loader/efi_boot=
bin.o lib/efi_loader/efi_boottime.o lib/efi_loader/efi_helper.o lib/efi_loa=
der/efi_console.o lib/efi_loader/efi_device_path.o lib/efi_loader/efi_devic=
e_path_to_text.o lib/efi_loader/efi_device_path_utilities.o lib/efi_loader/=
efi_dt_fixup.o lib/efi_loader/efi_fdt.o lib/efi_loader/efi_file.o lib/efi_l=
oader/efi_hii.o lib/efi_loader/efi_hii_config.o lib/efi_loader/efi_image_lo=
ader.o lib/efi_loader/efi_load_options.o lib/efi_loader/efi_memory.o lib/ef=
i_loader/efi_root_node.o lib/efi_loader/efi_runtime.o lib/efi_loader/efi_se=
tup.o lib/efi_loader/efi_string.o lib/efi_loader/efi_unicode_collation.o li=
b/efi_loader/efi_var_common.o lib/efi_loader/efi_var_mem.o lib/efi_loader/e=
fi_variable.o lib/efi_loader/efi_var_file.o lib/efi_loader/efi_watchdog.o l=
ib/efi_loader/efi_disk.o lib/efi_loader/efi_net.o lib/efi_loader/efi_smbios=
.o lib/efi_loader/efi_load_initrd.o lib/efi_loader/efi_conformance.o
-|   arm-poky-linux-gnueabi-ld.bfd -nostdlib -zexecstack -znocombreloc -zno=
relro --no-warn-rwx-segments -L /srv/pokybuild/yocto-worker/oe-selftest-arm=
host/build/build-st-3119200/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-=
boot/2025.07/sources/u-boot-2025.07 -T arch/arm/lib/elf_arm_efi.lds -shared=
 -Bsymbolic -s lib/efi_loader/helloworld.o lib/efi_loader/efi_crt0.o lib/ef=
i_loader/efi_reloc.o lib/efi_loader/efi_freestanding.o arch/arm/lib/lib.a -=
o lib/efi_loader/helloworld_efi.so
-| arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No such f=
ile or directory
-| make[3]: *** [scripts/Makefile.lib:512: lib/efi_loader/helloworld_efi.so=
] Error 1
-
-The issue is hard to reproduce but this change can artificially trigger it:
-
-  a/scripts/Makefile.build
-  b/scripts/Makefile.build
-@@ -353,7 +353,7 @@ $(modorder-target): $(subdir-ym) FORCE
- #
- ifdef lib-target
- quiet_cmd_link_l_target =3D AR      $@
--cmd_link_l_target =3D rm -f $@; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
-+cmd_link_l_target =3D rm -f $@ && echo "HACK, delaying build!" && sleep 6=
0 && $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
-
- $(lib-target): $(lib-y) FORCE
-        $(call if_changed,link_l_target)
-
-Then run a rebuild with:
-
-$  rm -f $( find build/ -name lib.a -or -name helloworld_efi.so ) && \
-   make
-...
-  arm-poky-linux-gnueabi-ld.bfd -nostdlib -zexecstack -znocombreloc -znore=
lro --no-warn-rwx-segments -L /home/mcfrisk/src/base/repo/poky/build_bea
-glebone/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/2025.07/source=
s/u-boot-2025.07 -T arch/arm/lib/elf_arm_efi.lds -shared -Bsymbolic -s lib/=
efi_loader/helloworld.o lib/efi_loader/efi_crt0.o lib/efi_loader/efi_reloc.=
o lib/efi_loader/efi_freestanding.o arch/arm/lib/lib.a -o lib/efi_loader/he=
lloworld_efi.so
-arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No such fil=
e or directory
-make[3]: *** [scripts/Makefile.lib:512: lib/efi_loader/helloworld_efi.so] =
Error 1
-
-Fix by introducing PLATFORM_LIBGCC_LIBA variable with only lib.a
-filename which is then used to add the dependency in rules which use
-PLATFORM_LIBGCC. This should not impact builds which don't set
-PLATFORM_LIBGCC_LIBA and PLATFORM_LIBGCC usage stays as is.
-
-Fixes: 43d43241d1c9 ("scripts/Makefile.lib: add PLATFORM_LIBGCC to efi lin=
king")
-
-Cc: Adriano Cordova <adrianox@gmail.com>
-Cc: Fabio Estevam <festevam@gmail.com>
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
----
- Makefile                     | 4 +++-
- examples/standalone/Makefile | 2 +-
- scripts/Makefile.lib         | 2 +-
- scripts/Makefile.xpl         | 3 ++-
- 4 files changed, 7 insertions(+), 4 deletions(-)
-
-Upstream-Status: Submitted [https://lists.denx.de/pipermail/u-boot/2025-Ju=
ly/594581.html]
-
-v3: added "export PLATFORM_LIBGCC_LIBA" like PLATFORM_LIBGCC, not sure
-    how testing worked without this before
-
-v2: introduced PLATFORM_LIBGCC_LIBA variable with just lib.a filename,
-    PLATFORM_LIBGCC can have other flags too
-    https://lists.denx.de/pipermail/u-boot/2025-July/594034.html
-
-v1: https://lists.denx.de/pipermail/u-boot/2025-July/593982.html
-
-diff --git a/Makefile b/Makefile
-index 1a5c77d7caf0..a0797f36f7f6 100644
---- a/Makefile
-+++ b/Makefile
-@@ -911,7 +911,8 @@ u-boot-main :=3D $(libs-y)
-=20
- # Add GCC lib
- ifeq ($(CONFIG_USE_PRIVATE_LIBGCC),y)
--PLATFORM_LIBGCC =3D arch/$(ARCH)/lib/lib.a
-+PLATFORM_LIBGCC_LIBA =3D arch/$(ARCH)/lib/lib.a
-+PLATFORM_LIBGCC =3D $(PLATFORM_LIBGCC_LIBA)
- else
- ifndef CONFIG_CC_IS_CLANG
- PLATFORM_LIBGCC :=3D -L $(shell dirname `$(CC) $(c_flags) -print-libgcc-f=
ile-name`) -lgcc
-@@ -926,6 +927,7 @@ endif
-=20
- export PLATFORM_LIBS
- export PLATFORM_LIBGCC
-+export PLATFORM_LIBGCC_LIBA
-=20
- # Special flags for CPP when processing the linker script.
- # Pass the version down so we can handle backwards compatibility
-diff --git a/examples/standalone/Makefile b/examples/standalone/Makefile
-index 9b57f1c0c66c..aa9e3121cf9a 100644
---- a/examples/standalone/Makefile
-+++ b/examples/standalone/Makefile
-@@ -64,7 +64,7 @@ quiet_cmd_link_elf =3D LD      $@
-       cmd_link_elf =3D $(LD) $(KBUILD_LDFLAGS) $(LDFLAGS_STANDALONE) -g  \
- 		     -o $@ -e $(SYM_PREFIX)$(@F) $< $(LIB) $(PLATFORM_LIBGCC)
-=20
--$(ELF): $(obj)/%: $(obj)/%.o $(LIB) FORCE
-+$(ELF): $(obj)/%: $(obj)/%.o $(LIB) $(PLATFORM_LIBGCC_LIBA) FORCE
- 	$(call if_changed,link_elf)
-=20
- $(obj)/%.srec: OBJCOPYFLAGS +=3D -O srec
-diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
-index e89a4a51b74d..cef3863dfdc4 100644
---- a/scripts/Makefile.lib
-+++ b/scripts/Makefile.lib
-@@ -508,7 +508,7 @@ $(obj)/efi_reloc.o: $(srctree)/arch/$(ARCH)/lib/$(EFI_=
RELOC:.o=3D.c) $(recordmcoun
- 	$(call cmd,force_checksrc)
- 	$(call if_changed_rule,cc_o_c)
-=20
--$(obj)/%_efi.so: $(obj)/%.o $(obj)/efi_crt0.o $(obj)/efi_reloc.o $(obj)/e=
fi_freestanding.o
-+$(obj)/%_efi.so: $(PLATFORM_LIBGCC_LIBA) $(obj)/%.o $(obj)/efi_crt0.o $(o=
bj)/efi_reloc.o $(obj)/efi_freestanding.o
- 	$(call cmd,efi_ld)
-=20
- targets +=3D $(obj)/efi_crt0.o $(obj)/efi_reloc.o $(obj)/efi_freestanding=
.o
-diff --git a/scripts/Makefile.xpl b/scripts/Makefile.xpl
-index 43f27874f9fe..68c88293f0d9 100644
---- a/scripts/Makefile.xpl
-+++ b/scripts/Makefile.xpl
-@@ -139,7 +139,8 @@ libs-y :=3D $(patsubst %/, %/built-in.o, $(libs-y))
-=20
- # Add GCC lib
- ifeq ($(CONFIG_USE_PRIVATE_LIBGCC),y)
--PLATFORM_LIBGCC =3D arch/$(ARCH)/lib/lib.a
-+PLATFORM_LIBGCC_LIBA =3D arch/$(ARCH)/lib/lib.a
-+PLATFORM_LIBGCC =3D $(PLATFORM_LIBGCC_LIBA)
- PLATFORM_LIBS :=3D $(filter-out %/lib.a, $(filter-out -lgcc, $(PLATFORM_L=
IBS))) $(PLATFORM_LIBGCC)
- endif
-=20
---=20
-2.43.0
-
diff --git a/meta/recipes-bsp/u-boot/files/v3-0002-efi_loader-Makefile-chan=
ge-apps-from-always-to-ta.patch b/meta/recipes-bsp/u-boot/files/v3-0002-efi=
_loader-Makefile-change-apps-from-always-to-ta.patch
deleted file mode 100644
index 6b68f7472410..000000000000
--- a/meta/recipes-bsp/u-boot/files/v3-0002-efi_loader-Makefile-change-apps=
-from-always-to-ta.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From d207ec22429adc94f9e173971e30c675d2ab3de4 Mon Sep 17 00:00:00 2001
-From: Mikko Rapeli <mikko.rapeli@linaro.org>
-Date: Fri, 18 Jul 2025 08:15:25 +0000
-Subject: [PATCH v3 2/2] efi_loader Makefile: change apps from "always" to
- "targets"
-
-Adding delay to link commands in scripts/Makefile.build
-
-@@ -353,7 +353,7 @@ $(modorder-target): $(subdir-ym) FORCE
- #
- ifdef lib-target
- quiet_cmd_link_l_target =3D AR      $@
--cmd_link_l_target =3D rm -f $@; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
-+cmd_link_l_target =3D rm -f $@; echo "HACK delaying lib-target"; sleep 10=
; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
-
- $(lib-target): $(lib-y) FORCE
-        $(call if_changed,link_l_target)
-(1/2) Stage this hunk [y,n,q,a,d,j,J,g,/,e,?]? n
-@@ -362,7 +362,7 @@ targets +=3D $(lib-target)
- endif
-
- quiet_cmd_link_multi-y =3D AR      $@
--cmd_link_multi-y =3D rm -f $@; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(filter =
%.o,$^)
-+cmd_link_multi-y =3D rm -f $@; echo "HACK delaying cmd_link_multi-y"; sle=
ep 10; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(filter %.o,$^)
-
- quiet_cmd_link_multi-m =3D AR [M]  $@
- cmd_link_multi-m =3D $(cmd_link_multi-y)
-
-exposes a build failure:
-
-make[3]: *** No rule to make target 'lib/efi_loader/helloworld.efi', neede=
d by '__build'.  Stop.
-make[3]: *** Waiting for unfinished jobs....
-
-This if fixed by using normal targets for .efi apps. The rules
-in scripts/Makefile.lib handle the dependencies correctly.
-
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
----
- lib/efi_loader/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Upstream-Status: Submitted [https://lists.denx.de/pipermail/u-boot/2025-Ju=
ly/594583.html]
-
-diff --git a/lib/efi_loader/Makefile b/lib/efi_loader/Makefile
-index cf050e5385dd..e929c23b1cb1 100644
---- a/lib/efi_loader/Makefile
-+++ b/lib/efi_loader/Makefile
-@@ -96,5 +96,5 @@ $(foreach f,$(apps-y),\
- 	$(eval CFLAGS_$(f).o :=3D $(CFLAGS_EFI) -Os -ffreestanding)\
- 	$(eval CFLAGS_REMOVE_$(f).o :=3D $(CFLAGS_NON_EFI)))
-=20
--always +=3D $(foreach f,$(apps-y),$(f).efi)
-+targets +=3D $(foreach f,$(apps-y),$(f).efi)
- targets +=3D $(foreach f,$(apps-y),$(f).o)
---=20
-2.43.0
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u=
-boot/u-boot-common.inc
index 053e68635453..ea55545db34f 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -16,8 +16,7 @@ SRCREV =3D "e37de002fac3895e8d0b60ae2015e17bb33e2b5b"
=20
 SRC_URI =3D "\
     git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;branch=3Dmaste=
r;tag=3Dv${PV} \
-    file://v3-0001-Makefile-scripts-Makefile.lib-fix-_efi.so-depende.patch=
 \
-    file://v3-0002-efi_loader-Makefile-change-apps-from-always-to-ta.patch=
 \
+    file://0001-Makefile-add-dependency-from-lib-to-arch-ARCH-lib.patch \
     file://0001-nxp-Prepare-macros-for-KVM-changes.patch \
     file://0002-arm-io.h-Fix-io-accessors-for-KVM.patch \
     file://0003-qemu-arm-Enable-virtualizable-IO-accessors.patch \
--=20
2.43.0


