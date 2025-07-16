Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921B4C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 08:05:14 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.16912.1752653109837105787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 01:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rKXY1nnv;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-558f7fda97eso4097250e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 01:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752653108; x=1753257908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4HriaSN1BQWnaLtJAVdsERJpe/G0ylgHmsQaDEYnQLE=;
        b=rKXY1nnv1I+F7LruP6dgNf+FWnGEFgJ209p8FB2vfUsTI3ghIixoF58y9y3J5tnAhg
         9uczS9XqtczMAo0x4t6M514bLaZQBRQuiEOpCHgpcAvrjW7TJp1qjNeZFaFSwTN8kdvp
         0IVvloMpC6RAe4w2BDjm+HzdygV7Kr2r85hPM9pqs/BPr+/5NuV57kCA01EuXuuvkj0J
         dWWr9GoOu+fDgw9VIlFEWTHQWIODRCqvyGhL+bTTFF4GrsuP8sOPe30AFpH9wv1xvdPB
         SUS7C/xX/IO4mOOADqDSbVsdLZPUr/lR9N92a9z4+qfYCg0SbndLopY3GCUJdiCZVpc0
         hbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752653108; x=1753257908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HriaSN1BQWnaLtJAVdsERJpe/G0ylgHmsQaDEYnQLE=;
        b=aiyk0WQkYjQchYQP6Cum8+fYe243OjAmL32shyn7hKth/UXcbkO2WxeZUzKl2+09jf
         Wd3Vlq4FX+k9bOobPwWEAK6boHDAeU1RKZ0gicMAcTU8DaDCKrWLA8XdMkNuecdryE7f
         FwlVn7N3cMal48gPI+o8TOPTBjM9PyMDWYyPuyQXpyTMWUBFTQlOugLO/TEd9FPLGU+d
         KYdFzqInrfw0OdLeMjDzZKSKqPMSKzXGZiZc4NoWd9ISmiwfd0ZlXuk+JGahUtRiX0Ek
         YEXSL7HIVZFSUHIK/6NFpGtAckrRnRSb8Qmg6vBdG2DQQi5N72H1YBRIYXQZxVvC/58h
         5gSQ==
X-Gm-Message-State: AOJu0YzHzc9B30bVwf/1IQiXuE9Tt2dZpEhC/Rt7lRpBLN290jl5kxGC
	50KFR5+wMzluEuFUwq7pZFYCJ0mnkHsNLNZ30LTFcL+s0sc/lWYaicwLcjrijy9Ro7IC1nGkSs5
	5r8a8
X-Gm-Gg: ASbGnctCe2kl0lyV08FUddUi3cFXzaqYRRird/BejH5W5y/X+kQo6zNWWl/lDdSQKM8
	zXAk9QziWuHNSd8VOZHjVwiVh2eUoZ0f/yYtj+S5LI/nE5++PNvZ51xhYjZFHGMkMmEYD4mSJ41
	kwWZMQZH/TuHWthdbSTrT/5Ob5kwygNO2F2WUq+z4fKUY6hmZp8OXmCVedOvmGbGdMqJ7Tg9ieu
	+/r2glmYj0Z9+CK4ZsUOI0wNkJ1ZcWRECX12FnosLRpjsoQk2+Gs1KcHuJo94y+fgtNOGpV1usu
	E1KwWMnIwuv3KVLCIwWxsPe+o1g977CVtVNwizLFvMKagHyBN0bNwTJ44v+hK8/zx/ttdIVS/pP
	xKMNodyJ7Dtk0Q7Ph8UBSLVg9+jcOr/GlufM7RDewpRF0nLodjhiuqA8=
X-Google-Smtp-Source: AGHT+IE3LvUT3U+EKmPKiMgg8iNV/VrqAF3Qe3UuNkRmDiKAy39yDPZ3ckF8VRbqu9qbDQz8Lc3PxQ==
X-Received: by 2002:a05:6512:3b13:b0:553:2a16:24fd with SMTP id 2adb3069b0e04-55a23fb0a59mr535789e87.47.1752653107469;
        Wed, 16 Jul 2025 01:05:07 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab8bf2ecsm19179881fa.61.2025.07.16.01.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 01:05:07 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2] u-boot: upgrade 2025.04 -> 2025.07
Date: Wed, 16 Jul 2025 11:04:37 +0300
Message-ID: <20250716080437.189201-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 08:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220436

From: Fabio Estevam <festevam@gmail.com>

Upgrade to U-Boot 2025.07. Added patch for build race condition.
Removed qemu KVM USB workaround since issue is fixed upstream.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...-Makefile.lib-fix-_efi.so-dependency.patch | 116 ++++++++++++++++++
 .../u-boot/files/disable_CONFIG_USB.cfg       |   1 -
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   7 +-
 ...ols_2025.04.bb =3D> u-boot-tools_2025.07.bb} |   0
 .../{u-boot_2025.04.bb =3D> u-boot_2025.07.bb}  |   4 +-
 5 files changed, 123 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-Makefile-scripts-Mak=
efile.lib-fix-_efi.so-dependency.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.04.bb =3D> u-boot-tools_=
2025.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2025.04.bb =3D> u-boot_2025.07.bb} =
(64%)

v2: added upstreamed patch to fix build race conditon, removed qemu kvm wor=
karound
    fixed upstream. Would be nice to check if builds now pass.

v1: https://lists.openembedded.org/g/openembedded-core/message/220004

diff --git a/meta/recipes-bsp/u-boot/files/0001-Makefile-scripts-Makefile.l=
ib-fix-_efi.so-dependency.patch b/meta/recipes-bsp/u-boot/files/0001-Makefi=
le-scripts-Makefile.lib-fix-_efi.so-dependency.patch
new file mode 100644
index 000000000000..6e73d4b8a918
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-Makefile-scripts-Makefile.lib-fix-=
_efi.so-dependency.patch
@@ -0,0 +1,116 @@
+From 4279594f47b90b039b1f9f2485c90db5f0068c14 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Thu, 10 Jul 2025 14:24:07 +0000
+Subject: [PATCH] Makefile scripts/Makefile.lib: fix *_efi.so dependency to
+ PLATFORM_LIBGCC
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
+ Makefile                     | 3 ++-
+ examples/standalone/Makefile | 2 +-
+ scripts/Makefile.lib         | 2 +-
+ scripts/Makefile.xpl         | 3 ++-
+ 4 files changed, 6 insertions(+), 4 deletions(-)
+
+Upstream-Status: Submitted [https://lists.denx.de/pipermail/u-boot/2025-Ju=
ly/594034.html]
+
+diff --git a/Makefile b/Makefile
+index 1a5c77d7caf0..574cbc56bfe8 100644
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
diff --git a/meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg b/meta/re=
cipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
deleted file mode 100644
index 1d2509982be1..000000000000
--- a/meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
+++ /dev/null
@@ -1 +0,0 @@
-# CONFIG_USB is not set
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u=
-boot/u-boot-common.inc
index 8600d4bab6ed..3c72d1ea65a5 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,9 +12,12 @@ PE =3D "1"
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
+    file://0001-Makefile-scripts-Makefile.lib-fix-_efi.so-dependency.patch=
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


