Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8093FC83F17
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 09:01:51 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.16358.1752829308637501984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 02:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kzPLpouf;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5550dca1241so1673488e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 02:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752829306; x=1753434106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XP4gcPz4VMA993p+xZ3ZzrBbYmyGYU7Jb2lklOhhX24=;
        b=kzPLpoufrakZAkALGYNGqpjCpfYl+7ebxkb5PHPTKLeCIf+ID1VoRq2Qnpj7Jihjb8
         7txX3nxCcUEPq5zOWiQxLc+ziq9QM+yPP6lw6KCebvzC6KspUG6L6pgqwVzjVnJzK1VW
         KuSBwbz3YNiM3pJydD16H12JI0i2L9Yi4FnvSxOQ9GDooz4jaZe0C4UoFJedUpl0VktK
         +PmcCH5eWl6i2ig1uuaqOj9VOUD/3015aBURexRHNpuX7qB9ZeizrDybcltHcv4W8fZm
         pCPxYafqf/fhuPBOXs/y8CTwDLguIMlBHoPBxRHym2FQwxhoaLNFkA9CETmZQmmVDs2V
         03jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752829306; x=1753434106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XP4gcPz4VMA993p+xZ3ZzrBbYmyGYU7Jb2lklOhhX24=;
        b=JI6aw7CLVi+mSEMNfym12bDEoZvMOXgEdU0A8GsBNRNiBBGywbE9A4eGVFyNUcfFC0
         ui+nuv+PiSPFsTEYSRxkZRSUkOCkKfiqAAA7L4ZMY9wWRdBVHilj5A3ZZind40qF3VES
         vwR3wit06kMRiygYJYqatsGGAUDcQWeyLyGSd1oYzdOqbr2FObtAQ9CBynUgUatDL6DW
         6bCmN+w3f7MIKUfybcrzA/H+E66weEXqbIXTQ4XQpa2LrHqL2Ls0To0n5ZwYKEDItHjO
         TT7dEgk5Rvnj3hkvwEEgOPv2HAmRI5B4/JoGCzLem/NKbOJQcF5jd6IE4aUsSZZsyRUn
         Mdxw==
X-Gm-Message-State: AOJu0YxrbUTus7f4xUBWCRP8czAhBxOup4JjLRkHYvkUZ3B+R6YluhKo
	KI03FmPcYvu2cCbygcDarnqlmx2EZzAibR4Q9bBaT3MFB/yvaPJvGRlpwVnaDPTkDjGR1soQe45
	Jl7zI
X-Gm-Gg: ASbGncstqLlNOYXOO+yHi29FsEh+6DPrkGLVFFBaeccElFHn1pst64w2qd1bvYNjb4N
	1qfo3lCZ/R5Z2n+6v9MYQpFmibgf1vE242VA7DENnAecYpPnqvi7NJZZ9novunG97HE7CTltRHg
	XxshJuzRFyKd6IY0UBodlI2Uwt48ZLtQxMKCP01mF2BhVG29Tk1jd+F9U8QU88qBbEhqOB+sytY
	ZIMGqZWVOEzE1RucPh8mSrunh5TfRrtzKbgiT0IyghBoqVxmIN/JZQr6LpDF7zq4XvwaZ0qzzEE
	wu16SaaFXGGmPSVIaTvb5QQrFouZxqSgLyeFOvjXGZoPol4iY+pimSXD5FSVoZJ6mEXaWr78ymM
	d9nRElMHcbXDKGl+YNf+QN66B7NJtHGM6NXdSXn1URo3YGLK0lw==
X-Google-Smtp-Source: AGHT+IHjuCKjvZYCFmYVFx47VqEwRfdYLxK8fSsm6xnM43X68iZ998reZf5Cv6QIvmaPnVuM0yORuA==
X-Received: by 2002:a05:6512:3b8a:b0:552:2257:93dd with SMTP id 2adb3069b0e04-55a23f0902bmr2717221e87.25.1752829306201;
        Fri, 18 Jul 2025 02:01:46 -0700 (PDT)
Received: from nuoska (85-76-141-8-nat.elisa-mobile.fi. [85.76.141.8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d7c755sm177136e87.108.2025.07.18.02.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 02:01:45 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3] u-boot: upgrade 2025.04 -> 2025.07
Date: Fri, 18 Jul 2025 12:01:23 +0300
Message-ID: <20250718090123.420399-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 09:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220588

From: Fabio Estevam <festevam@gmail.com>

Upgrade to U-Boot 2025.07. Added patches for build race conditions.
Removed qemu KVM USB workaround since issue is fixed upstream.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../u-boot/files/disable_CONFIG_USB.cfg       |   1 -
 ...pts-Makefile.lib-fix-_efi.so-depende.patch | 136 ++++++++++++++++++
 ...kefile-change-apps-from-always-to-ta.patch |  57 ++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   8 +-
 ...ols_2025.04.bb =3D> u-boot-tools_2025.07.bb} |   0
 .../{u-boot_2025.04.bb =3D> u-boot_2025.07.bb}  |   4 +-
 6 files changed, 201 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/v3-0001-Makefile-scripts-=
Makefile.lib-fix-_efi.so-depende.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/v3-0002-efi_loader-Makefi=
le-change-apps-from-always-to-ta.patch
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.04.bb =3D> u-boot-tools_=
2025.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2025.04.bb =3D> u-boot_2025.07.bb} =
(64%)

v3: Did not manage to reproduce AB build failures but added delays to more
    linker calls which exposed similar issues. Fixed failures with patches
    which are also submitted upstream.

v2: added upstreamed patch to fix build race conditon, removed qemu kvm wor=
karound
    fixed upstream. Would be nice to check if builds now pass.
    https://lists.openembedded.org/g/openembedded-core/message/220436

v1: https://lists.openembedded.org/g/openembedded-core/message/220004

diff --git a/meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg b/meta/re=
cipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
deleted file mode 100644
index 1d2509982be1..000000000000
--- a/meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
+++ /dev/null
@@ -1 +0,0 @@
-# CONFIG_USB is not set
diff --git a/meta/recipes-bsp/u-boot/files/v3-0001-Makefile-scripts-Makefil=
e.lib-fix-_efi.so-depende.patch b/meta/recipes-bsp/u-boot/files/v3-0001-Mak=
efile-scripts-Makefile.lib-fix-_efi.so-depende.patch
new file mode 100644
index 000000000000..e8253a67b211
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/v3-0001-Makefile-scripts-Makefile.lib-f=
ix-_efi.so-depende.patch
@@ -0,0 +1,136 @@
+From 2e7c1321bb44cc6af4ee4b1026a52e1a0aa7e336 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Thu, 10 Jul 2025 14:24:07 +0000
+Subject: [PATCH v3 1/2] Makefile scripts/Makefile.lib: fix *_efi.so depend=
ency
+ to PLATFORM_LIBGCC
+
+When PLATFORM_LIBGCC was added to linker command it was not
+added to the dependency of the .so and other rules. Thus a build can
+try to link *_efi.so files before lib.a from PLATFORM_LIBGCC is available.
+This was seen in yocto autobuilder builds with u-boot 2025.07
+update, see https://lists.openembedded.org/g/openembedded-core/message/220=
004
+
+https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2914600/raw_inli=
ne
+
+|    rm -f lib/efi_loader/built-in.o; arm-poky-linux-gnueabi-ar cDPrsT lib=
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
+|   arm-poky-linux-gnueabi-ld.bfd -nostdlib -zexecstack -znocombreloc -zno=
relro --no-warn-rwx-segments -L /srv/pokybuild/yocto-worker/oe-selftest-arm=
host/build/build-st-3119200/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-=
boot/2025.07/sources/u-boot-2025.07 -T arch/arm/lib/elf_arm_efi.lds -shared=
 -Bsymbolic -s lib/efi_loader/helloworld.o lib/efi_loader/efi_crt0.o lib/ef=
i_loader/efi_reloc.o lib/efi_loader/efi_freestanding.o arch/arm/lib/lib.a -=
o lib/efi_loader/helloworld_efi.so
+| arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No such f=
ile or directory
+| make[3]: *** [scripts/Makefile.lib:512: lib/efi_loader/helloworld_efi.so=
] Error 1
+
+The issue is hard to reproduce but this change can artificially trigger it:
+
+  a/scripts/Makefile.build
+  b/scripts/Makefile.build
+@@ -353,7 +353,7 @@ $(modorder-target): $(subdir-ym) FORCE
+ #
+ ifdef lib-target
+ quiet_cmd_link_l_target =3D AR      $@
+-cmd_link_l_target =3D rm -f $@; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
++cmd_link_l_target =3D rm -f $@ && echo "HACK, delaying build!" && sleep 6=
0 && $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
+
+ $(lib-target): $(lib-y) FORCE
+        $(call if_changed,link_l_target)
+
+Then run a rebuild with:
+
+$  rm -f $( find build/ -name lib.a -or -name helloworld_efi.so ) && \
+   make
+...
+  arm-poky-linux-gnueabi-ld.bfd -nostdlib -zexecstack -znocombreloc -znore=
lro --no-warn-rwx-segments -L /home/mcfrisk/src/base/repo/poky/build_bea
+glebone/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/2025.07/source=
s/u-boot-2025.07 -T arch/arm/lib/elf_arm_efi.lds -shared -Bsymbolic -s lib/=
efi_loader/helloworld.o lib/efi_loader/efi_crt0.o lib/efi_loader/efi_reloc.=
o lib/efi_loader/efi_freestanding.o arch/arm/lib/lib.a -o lib/efi_loader/he=
lloworld_efi.so
+arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No such fil=
e or directory
+make[3]: *** [scripts/Makefile.lib:512: lib/efi_loader/helloworld_efi.so] =
Error 1
+
+Fix by introducing PLATFORM_LIBGCC_LIBA variable with only lib.a
+filename which is then used to add the dependency in rules which use
+PLATFORM_LIBGCC. This should not impact builds which don't set
+PLATFORM_LIBGCC_LIBA and PLATFORM_LIBGCC usage stays as is.
+
+Fixes: 43d43241d1c9 ("scripts/Makefile.lib: add PLATFORM_LIBGCC to efi lin=
king")
+
+Cc: Adriano Cordova <adrianox@gmail.com>
+Cc: Fabio Estevam <festevam@gmail.com>
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ Makefile                     | 4 +++-
+ examples/standalone/Makefile | 2 +-
+ scripts/Makefile.lib         | 2 +-
+ scripts/Makefile.xpl         | 3 ++-
+ 4 files changed, 7 insertions(+), 4 deletions(-)
+
+Upstream-Status: Submitted [https://lists.denx.de/pipermail/u-boot/2025-Ju=
ly/594581.html]
+
+v3: added "export PLATFORM_LIBGCC_LIBA" like PLATFORM_LIBGCC, not sure
+    how testing worked without this before
+
+v2: introduced PLATFORM_LIBGCC_LIBA variable with just lib.a filename,
+    PLATFORM_LIBGCC can have other flags too
+    https://lists.denx.de/pipermail/u-boot/2025-July/594034.html
+
+v1: https://lists.denx.de/pipermail/u-boot/2025-July/593982.html
+
+diff --git a/Makefile b/Makefile
+index 1a5c77d7caf0..a0797f36f7f6 100644
+--- a/Makefile
++++ b/Makefile
+@@ -911,7 +911,8 @@ u-boot-main :=3D $(libs-y)
+=20
+ # Add GCC lib
+ ifeq ($(CONFIG_USE_PRIVATE_LIBGCC),y)
+-PLATFORM_LIBGCC =3D arch/$(ARCH)/lib/lib.a
++PLATFORM_LIBGCC_LIBA =3D arch/$(ARCH)/lib/lib.a
++PLATFORM_LIBGCC =3D $(PLATFORM_LIBGCC_LIBA)
+ else
+ ifndef CONFIG_CC_IS_CLANG
+ PLATFORM_LIBGCC :=3D -L $(shell dirname `$(CC) $(c_flags) -print-libgcc-f=
ile-name`) -lgcc
+@@ -926,6 +927,7 @@ endif
+=20
+ export PLATFORM_LIBS
+ export PLATFORM_LIBGCC
++export PLATFORM_LIBGCC_LIBA
+=20
+ # Special flags for CPP when processing the linker script.
+ # Pass the version down so we can handle backwards compatibility
+diff --git a/examples/standalone/Makefile b/examples/standalone/Makefile
+index 9b57f1c0c66c..aa9e3121cf9a 100644
+--- a/examples/standalone/Makefile
++++ b/examples/standalone/Makefile
+@@ -64,7 +64,7 @@ quiet_cmd_link_elf =3D LD      $@
+       cmd_link_elf =3D $(LD) $(KBUILD_LDFLAGS) $(LDFLAGS_STANDALONE) -g  \
+ 		     -o $@ -e $(SYM_PREFIX)$(@F) $< $(LIB) $(PLATFORM_LIBGCC)
+=20
+-$(ELF): $(obj)/%: $(obj)/%.o $(LIB) FORCE
++$(ELF): $(obj)/%: $(obj)/%.o $(LIB) $(PLATFORM_LIBGCC_LIBA) FORCE
+ 	$(call if_changed,link_elf)
+=20
+ $(obj)/%.srec: OBJCOPYFLAGS +=3D -O srec
+diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
+index e89a4a51b74d..cef3863dfdc4 100644
+--- a/scripts/Makefile.lib
++++ b/scripts/Makefile.lib
+@@ -508,7 +508,7 @@ $(obj)/efi_reloc.o: $(srctree)/arch/$(ARCH)/lib/$(EFI_=
RELOC:.o=3D.c) $(recordmcoun
+ 	$(call cmd,force_checksrc)
+ 	$(call if_changed_rule,cc_o_c)
+=20
+-$(obj)/%_efi.so: $(obj)/%.o $(obj)/efi_crt0.o $(obj)/efi_reloc.o $(obj)/e=
fi_freestanding.o
++$(obj)/%_efi.so: $(PLATFORM_LIBGCC_LIBA) $(obj)/%.o $(obj)/efi_crt0.o $(o=
bj)/efi_reloc.o $(obj)/efi_freestanding.o
+ 	$(call cmd,efi_ld)
+=20
+ targets +=3D $(obj)/efi_crt0.o $(obj)/efi_reloc.o $(obj)/efi_freestanding=
.o
+diff --git a/scripts/Makefile.xpl b/scripts/Makefile.xpl
+index 43f27874f9fe..68c88293f0d9 100644
+--- a/scripts/Makefile.xpl
++++ b/scripts/Makefile.xpl
+@@ -139,7 +139,8 @@ libs-y :=3D $(patsubst %/, %/built-in.o, $(libs-y))
+=20
+ # Add GCC lib
+ ifeq ($(CONFIG_USE_PRIVATE_LIBGCC),y)
+-PLATFORM_LIBGCC =3D arch/$(ARCH)/lib/lib.a
++PLATFORM_LIBGCC_LIBA =3D arch/$(ARCH)/lib/lib.a
++PLATFORM_LIBGCC =3D $(PLATFORM_LIBGCC_LIBA)
+ PLATFORM_LIBS :=3D $(filter-out %/lib.a, $(filter-out -lgcc, $(PLATFORM_L=
IBS))) $(PLATFORM_LIBGCC)
+ endif
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-bsp/u-boot/files/v3-0002-efi_loader-Makefile-chan=
ge-apps-from-always-to-ta.patch b/meta/recipes-bsp/u-boot/files/v3-0002-efi=
_loader-Makefile-change-apps-from-always-to-ta.patch
new file mode 100644
index 000000000000..6b68f7472410
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/v3-0002-efi_loader-Makefile-change-apps=
-from-always-to-ta.patch
@@ -0,0 +1,57 @@
+From d207ec22429adc94f9e173971e30c675d2ab3de4 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Fri, 18 Jul 2025 08:15:25 +0000
+Subject: [PATCH v3 2/2] efi_loader Makefile: change apps from "always" to
+ "targets"
+
+Adding delay to link commands in scripts/Makefile.build
+
+@@ -353,7 +353,7 @@ $(modorder-target): $(subdir-ym) FORCE
+ #
+ ifdef lib-target
+ quiet_cmd_link_l_target =3D AR      $@
+-cmd_link_l_target =3D rm -f $@; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
++cmd_link_l_target =3D rm -f $@; echo "HACK delaying lib-target"; sleep 10=
; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
+
+ $(lib-target): $(lib-y) FORCE
+        $(call if_changed,link_l_target)
+(1/2) Stage this hunk [y,n,q,a,d,j,J,g,/,e,?]? n
+@@ -362,7 +362,7 @@ targets +=3D $(lib-target)
+ endif
+
+ quiet_cmd_link_multi-y =3D AR      $@
+-cmd_link_multi-y =3D rm -f $@; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(filter =
%.o,$^)
++cmd_link_multi-y =3D rm -f $@; echo "HACK delaying cmd_link_multi-y"; sle=
ep 10; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(filter %.o,$^)
+
+ quiet_cmd_link_multi-m =3D AR [M]  $@
+ cmd_link_multi-m =3D $(cmd_link_multi-y)
+
+exposes a build failure:
+
+make[3]: *** No rule to make target 'lib/efi_loader/helloworld.efi', neede=
d by '__build'.  Stop.
+make[3]: *** Waiting for unfinished jobs....
+
+This if fixed by using normal targets for .efi apps. The rules
+in scripts/Makefile.lib handle the dependencies correctly.
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ lib/efi_loader/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Submitted [https://lists.denx.de/pipermail/u-boot/2025-Ju=
ly/594583.html]
+
+diff --git a/lib/efi_loader/Makefile b/lib/efi_loader/Makefile
+index cf050e5385dd..e929c23b1cb1 100644
+--- a/lib/efi_loader/Makefile
++++ b/lib/efi_loader/Makefile
+@@ -96,5 +96,5 @@ $(foreach f,$(apps-y),\
+ 	$(eval CFLAGS_$(f).o :=3D $(CFLAGS_EFI) -Os -ffreestanding)\
+ 	$(eval CFLAGS_REMOVE_$(f).o :=3D $(CFLAGS_NON_EFI)))
+=20
+-always +=3D $(foreach f,$(apps-y),$(f).efi)
++targets +=3D $(foreach f,$(apps-y),$(f).efi)
+ targets +=3D $(foreach f,$(apps-y),$(f).o)
+--=20
+2.43.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u=
-boot/u-boot-common.inc
index 8600d4bab6ed..c1395e473c53 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,9 +12,13 @@ PE =3D "1"
=20
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV =3D "34820924edbc4ec7803eb89d9852f4b870fa760a"
+SRCREV =3D "e37de002fac3895e8d0b60ae2015e17bb33e2b5b"
=20
-SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;branc=
h=3Dmaster;tag=3Dv${PV}"
+SRC_URI =3D "\
+    git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;branch=3Dmaste=
r;tag=3Dv${PV} \
+    file://v3-0001-Makefile-scripts-Makefile.lib-fix-_efi.so-depende.patch=
 \
+    file://v3-0002-efi_loader-Makefile-change-apps-from-always-to-ta.patch=
 \
+"
=20
 SRC_URI_RISCV =3D "\
     file://u-boot-riscv-isa_clear.cfg \
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb b/meta/recipes=
-bsp/u-boot/u-boot-tools_2025.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2025.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2025.04.bb b/meta/recipes-bsp/u=
-boot/u-boot_2025.07.bb
similarity index 64%
rename from meta/recipes-bsp/u-boot/u-boot_2025.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2025.07.bb
index 89e964f627e5..25f264c961eb 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2025.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2025.07.bb
@@ -4,5 +4,5 @@ require u-boot.inc
 DEPENDS +=3D "bc-native dtc-native gnutls-native python3-pyelftools-native"
=20
 # workarounds for aarch64 kvm qemu boot regressions
-SRC_URI:append:qemuarm64 =3D " file://disable-CONFIG_BLOBLIST.cfg file://d=
isable_CONFIG_USB.cfg"
-SRC_URI:append:genericarm64 =3D " file://disable-CONFIG_BLOBLIST.cfg file:=
//disable_CONFIG_USB.cfg"
+SRC_URI:append:qemuarm64 =3D " file://disable-CONFIG_BLOBLIST.cfg"
+SRC_URI:append:genericarm64 =3D " file://disable-CONFIG_BLOBLIST.cfg"
--=20
2.43.0


