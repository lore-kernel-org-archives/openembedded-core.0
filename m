Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375B7C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 20:48:36 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.32752.1736974115014620665
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 12:48:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BL7lOvgu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso778775e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 12:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736974113; x=1737578913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ywlv42zYUvQAquvU/cy946Biiqnp6LW6bvCXwoerWVI=;
        b=BL7lOvguUrnbo6zGI5o9PlfTW0oGpwCjD/QbMfK7hI4rEP4lHsQ4lXKigoJcz4g+24
         iFKghKwX8w79ncry0UJBATOoLZlAG9HlB2fey8IaGaBspNtY5NWf5MVKbSt4MX45BDH3
         F8NRAZX0JWI99E++6iev4X7DqZWLiOkePARbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736974113; x=1737578913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ywlv42zYUvQAquvU/cy946Biiqnp6LW6bvCXwoerWVI=;
        b=TOFSCBosK76A6JOVHJemswlCKwVslFXoIQFpM2nr93anNmBBMDBNUPgKqe1NzlzJpC
         1BVBdtjB6lFo29beEZ1kVWq/3tZpxgyMl0sr9MwxgdVUUWycO6Vv1N1x0iYQ9TWvmIUd
         XbPoT9rl8viiaThVQraa/xkkiS15A/T69/VwcOGSl04jEf/eImEcMDcJI0ME29nr4S7B
         NJ8jg1g2d0n6DNcnLGl7DT4bVZmypa+nN3l0hDpKDL+l1sdO3ExLXqUhU1yD/0BzuEXO
         y1Hi/7GhDOji5mu/oqjfz85mIW4XmuN6529CewjxChn29R3OQnVDW67Dc0KFlpZV1210
         hBfA==
X-Gm-Message-State: AOJu0YyvdgppbAExzrlrYbpt38K27dn2Yz7MdLg7cTrkx639x1q4rKWc
	QrtAkUqzYFh6HRAuAjhTbIGSjjotkiTeS8xQY7SJ4Ck1jazGD4lWmeEQtGL+3Y72EyIfdMirpjn
	/PD0=
X-Gm-Gg: ASbGncu/gyv5L3V3sZGuwauP43m7BBU7F+/gZT2X21WvNlebjPK5y2RBfRq+Vvj9KDS
	X8Qdi/cSGXx/lZ7I5RuUlfBW5jK+K8poJyLHKX9JF6JiVv28q8FBrF0gOSVXS/7uelz0pRPTFU/
	lU+aFMd9OBb1Oq/q64cIDQBLnFEngV/DLnmfLxQSgNEOBwtpWjDXAdth/HNnGaVB34CyR2lNyKt
	tR96T4FcUPWRGK2KpM+u/90lcaZD3FBZxTfOqVDACtrE5H6p/GfasGVjZCpt2QdqK/HQ+LbLrHC
	yw1ciFOZeg==
X-Google-Smtp-Source: AGHT+IFlSsMGOQ9vb0xDYgF4Sr+GGVv9ctL58zETLGyBT4Uhu/wpRKBJBQf721/u4gOLUhMA5hvKUA==
X-Received: by 2002:a05:600c:3143:b0:434:fbda:1f44 with SMTP id 5b1f17b1804b1-436e26a8c09mr246028515e9.19.1736974112360;
        Wed, 15 Jan 2025 12:48:32 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:36ca:bea8:400e:f60e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80d4sm18137766f8f.85.2025.01.15.12.48.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 12:48:31 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] classes/recipes: Switch virtual/XXX-gcc to virtual/cross-cc (and c++/binutils)
Date: Wed, 15 Jan 2025 20:48:29 +0000
Message-ID: <20250115204830.4030611-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 20:48:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209926

The idea of the base class dependency is to say "yes, I need a C cross compiler"
and this was never meant to be gcc specific. Looking at the codebase, whilst we
code triplets into this, it does overcomplicate things as there are only ever
limited, "target", "sdk" and the class extended versions like mutlilib.

After much thought, we can simplify this to virtual/cross-cc and virtual/cross-sdk-cc.

This lets us remove the "gcc" specific element as well as removing the over
complicated triplet usage.

At the same time, change the much less widely used "g++" variant to "c++" for
similar reasons and remove the triplet from virtual/XXX-binutils too.

Backwards compatibility mappings could be left but are just going to confuse
things in future so we'll just require users to update.

This simplification, whilst disruptive for any toolchain focused layers, will
make improved toolchain selection in the future much easier.

Since we no longer have overlapping variables, some code for that can just
be removed. The class extension code does need to start remapping some variables
but not the crosssdk target recipe names.

This patch is in two pieces, this one handles the renaming with the functional
changes separate in a second for easier review even if this breaks bisection.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass              | 12 +----------
 meta/classes-global/staging.bbclass           |  4 ++--
 meta/classes-recipe/image_types_wic.bbclass   |  2 +-
 meta/classes-recipe/kernel-yocto.bbclass      |  4 ++--
 meta/classes-recipe/kernel.bbclass            |  2 +-
 meta/classes-recipe/uki.bbclass               |  2 +-
 meta/conf/distro/include/tclibc-baremetal.inc |  4 ++--
 meta/conf/distro/include/tcmode-default.inc   | 20 +++++++++++--------
 meta/lib/oe/classextend.py                    |  4 +++-
 meta/recipes-core/glibc/glibc.inc             |  2 +-
 meta/recipes-core/meta/wic-tools.bb           |  2 +-
 meta/recipes-core/musl/libssp-nonshared.bb    |  4 ++--
 meta/recipes-core/musl/musl_git.bb            |  4 ++--
 meta/recipes-core/newlib/newlib.inc           |  2 +-
 meta/recipes-core/picolibc/picolibc_git.bb    |  2 +-
 .../binutils/binutils-cross-canadian.inc      |  2 +-
 .../binutils/binutils-cross.inc               |  2 +-
 .../binutils/binutils-crosssdk_2.43.1.bb      |  2 ++
 .../binutils/binutils-testsuite_2.43.1.bb     |  6 +++---
 meta/recipes-devtools/gcc/gcc-common.inc      |  3 ++-
 .../gcc/gcc-cross-canadian.inc                |  2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc       |  4 ++--
 meta/recipes-devtools/gcc/gcc-crosssdk.inc    |  4 ++--
 meta/recipes-devtools/gcc/gcc-runtime.inc     |  5 +++--
 meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  8 ++++----
 meta/recipes-devtools/gcc/libgcc-initial.inc  |  2 +-
 meta/recipes-devtools/gcc/libgcc.inc          |  2 +-
 meta/recipes-devtools/gcc/libgfortran.inc     |  2 +-
 .../gdb/gdb-cross-canadian.inc                |  2 +-
 .../recipes-devtools/go/go-cross-canadian.inc |  4 ++--
 meta/recipes-devtools/go/go-crosssdk.inc      |  2 +-
 .../rust/rust-cross-canadian.inc              |  2 +-
 32 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index c8268abcdf7..dbbf6cef8c8 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -48,7 +48,7 @@ def get_base_dep(d):
         return ""
     return "${BASE_DEFAULT_DEPS}"
 
-BASE_DEFAULT_DEPS = "virtual/${HOST_PREFIX}gcc virtual/${HOST_PREFIX}compilerlibs virtual/libc"
+BASE_DEFAULT_DEPS = "virtual/cross-cc virtual/compilerlibs virtual/libc"
 
 BASEDEPENDS = ""
 BASEDEPENDS:class-target = "${@get_base_dep(d)}"
@@ -312,16 +312,6 @@ python base_eventhandler() {
         if statusheader:
             bb.plain('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
 
-    # This code is to silence warnings where the SDK variables overwrite the 
-    # target ones and we'd see duplicate key names overwriting each other
-    # for various PREFERRED_PROVIDERS
-    if isinstance(e, bb.event.RecipePreFinalise):
-        if d.getVar("TARGET_PREFIX") == d.getVar("SDK_PREFIX"):
-            d.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils")
-            d.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc")
-            d.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++")
-            d.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs")
-
     if isinstance(e, bb.event.RecipeParsed):
         #
         # If we have multiple providers of virtual/X and a PREFERRED_PROVIDER_virtual/X is set
diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index d9ccf32a739..c58ac63c57d 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -128,8 +128,8 @@ do_populate_sysroot[vardeps] += "${SYSROOT_PREPROCESS_FUNCS}"
 do_populate_sysroot[vardepsexclude] += "BB_MULTI_PROVIDER_ALLOWED"
 
 POPULATESYSROOTDEPS = ""
-POPULATESYSROOTDEPS:class-target = "virtual/${HOST_PREFIX}binutils:do_populate_sysroot"
-POPULATESYSROOTDEPS:class-nativesdk = "virtual/${HOST_PREFIX}binutils:do_populate_sysroot"
+POPULATESYSROOTDEPS:class-target = "virtual/cross-binutils:do_populate_sysroot"
+POPULATESYSROOTDEPS:class-nativesdk = "virtual/sdk-binutils:do_populate_sysroot"
 do_populate_sysroot[depends] += "${POPULATESYSROOTDEPS}"
 
 SSTATETASKS += "do_populate_sysroot"
diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 9a2996658a4..1b422b62802 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -111,7 +111,7 @@ do_image_wic[deptask] += "do_image_complete"
 WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
 WKS_FILE_DEPENDS_DEFAULT += "bmaptool-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
 # Unified kernel images need objcopy
-WKS_FILE_DEPENDS_DEFAULT += "virtual/${TARGET_PREFIX}binutils"
+WKS_FILE_DEPENDS_DEFAULT += "virtual/cross-binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux systemd-boot os-release"
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 7d80e9aa527..dea9eba1c2b 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -454,8 +454,8 @@ do_qa_unpack() {
     return
 }
 
-do_kernel_configme[depends] += "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
-do_kernel_configme[depends] += "virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
+do_kernel_configme[depends] += "virtual/cross-binutils:do_populate_sysroot"
+do_kernel_configme[depends] += "virtual/cross-cc:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
 do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
 do_kernel_configme[dirs] += "${S} ${B}"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index b052b71be77..c01f816f67f 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -12,7 +12,7 @@ KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native bison-native"
+DEPENDS += "virtual/cross-binutils virtual/cross-cc kmod-native bc-native bison-native"
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.zst", "zstd-native", "", d)}"
diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index 441e4a7f8ea..92f690526dc 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -64,7 +64,7 @@ DEPENDS += "\
     os-release \
     systemd-boot \
     systemd-boot-native \
-    virtual/${TARGET_PREFIX}binutils \
+    virtual/cross-binutils \
     virtual/kernel \
 "
 
diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
index f3d27bbaaeb..abea5a71629 100644
--- a/meta/conf/distro/include/tclibc-baremetal.inc
+++ b/meta/conf/distro/include/tclibc-baremetal.inc
@@ -19,10 +19,10 @@ IMAGE_LINGUAS = ""
 LIBC_DEPENDENCIES = ""
 
 EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append = " --without-headers"
-DEPENDS:remove:pn-meta-toolchain = "virtual/libc virtual/${TARGET_PREFIX}compilerlibs"
+DEPENDS:remove:pn-meta-toolchain = "virtual/libc virtual/compilerlibs"
 
 # certain compiler libs cannot be used without libc, avoid the dependence on compilerlibs
-BASEDEPENDS:remove:class-target = "virtual/${TARGET_PREFIX}compilerlibs"
+BASEDEPENDS:remove:class-target = "virtual/compilerlibs"
 
 TARGET_OS = "elf"
 TARGET_OS:arm = "eabi"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index c0817a2bf5c..67e83302a33 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -2,16 +2,20 @@
 # Default toolchain configuration
 #
 
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross-${TARGET_ARCH}"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross-${TARGET_ARCH}"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross-${TARGET_ARCH}"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "gcc-runtime"
+PREFERRED_PROVIDER_virtual/cross-binutils = "${MLPREFIX}binutils-cross-${TARGET_ARCH}"
+PREFERRED_PROVIDER_virtual/cross-cc = "${MLPREFIX}gcc-cross-${TARGET_ARCH}"
+PREFERRED_PROVIDER_virtual/cross-c++ = "${MLPREFIX}gcc-cross-${TARGET_ARCH}"
+PREFERRED_PROVIDER_virtual/compilerlibs = "gcc-runtime"
 PREFERRED_PROVIDER_gdb = "gdb"
 
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils ?= "binutils-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs = "nativesdk-gcc-runtime"
+PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk ?= "binutils-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
+
+PREFERRED_PROVIDER_virtual/cross-sdk-binutils ?= "binutils-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/cross-sdk-cc = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/cross-sdk-c++ = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/sdk-compilerlibs = "nativesdk-gcc-runtime"
 
 # Default libc config
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 5161d33d2d2..7dd4bf94e7f 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -32,8 +32,10 @@ class ClassExtender(object):
         if name.endswith("-" + self.extname):
             name = name.replace("-" + self.extname, "")
         if name.startswith("virtual/"):
+            if "cross-sdk" in name:
+                return name
             # Assume large numbers of dashes means a triplet is present and we don't need to convert
-            if name.count("-") >= 3 and name.endswith(("-go", "-binutils", "-gcc", "-g++")):
+            if name.count("-") >= 3 and name.endswith(("-go",)):
                 return name
             subs = name.split("/", 1)[1]
             if not subs.startswith(self.extname):
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index b08a70aa46a..d8f20c87dd6 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -1,7 +1,7 @@
 require glibc-common.inc
 require glibc-ld.inc
 
-DEPENDS = "virtual/${HOST_PREFIX}gcc virtual/${HOST_PREFIX}binutils libgcc-initial linux-libc-headers"
+DEPENDS = "virtual/cross-cc virtual/cross-binutils libgcc-initial linux-libc-headers"
 
 PROVIDES = "virtual/libc"
 PROVIDES += "virtual/libintl virtual/libiconv"
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index 76494e7fca4..fa983ed5f12 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -7,7 +7,7 @@ DEPENDS = "\
            mtools-native bmaptool-native grub-native cdrtools-native \
            btrfs-tools-native squashfs-tools-native pseudo-native \
            e2fsprogs-native util-linux-native tar-native erofs-utils-native \
-           virtual/${TARGET_PREFIX}binutils \
+           virtual/cross-binutils \
            "
 DEPENDS:append:x86 = " syslinux-native syslinux grub-efi systemd-boot"
 DEPENDS:append:x86-64 = " syslinux-native syslinux grub-efi systemd-boot"
diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipes-core/musl/libssp-nonshared.bb
index e9f652fc3ea..fde3bc97b47 100644
--- a/meta/recipes-core/musl/libssp-nonshared.bb
+++ b/meta/recipes-core/musl/libssp-nonshared.bb
@@ -11,8 +11,8 @@ SRC_URI = "file://stack_chk.c"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-DEPENDS = "virtual/${TARGET_PREFIX}binutils \
-           virtual/${TARGET_PREFIX}gcc \
+DEPENDS = "virtual/cross-binutils \
+           virtual/cross-cc \
 "
 
 do_configure[noexec] = "1"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 1509c2e3108..7a695e7e19d 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -20,8 +20,8 @@ S = "${WORKDIR}/git"
 
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
 
-DEPENDS = "virtual/${TARGET_PREFIX}binutils \
-           virtual/${TARGET_PREFIX}gcc \
+DEPENDS = "virtual/cross-binutils \
+           virtual/cross-cc \
            libgcc-initial \
            linux-libc-headers \
            bsd-headers \
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index 34b0f3f747b..668eaa9e96d 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -20,7 +20,7 @@ SRC_URI = "git://sourceware.org/git/newlib-cygwin.git;protocol=https;branch=main
 SRCREV="ad11e2587f83d61357a32c61c36d72ea4f39315e"
 
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = "virtual/${TARGET_PREFIX}gcc"
+DEPENDS = "virtual/cross-cc"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-core/picolibc/picolibc_git.bb b/meta/recipes-core/picolibc/picolibc_git.bb
index fdb159328fa..e6735184cd5 100644
--- a/meta/recipes-core/picolibc/picolibc_git.bb
+++ b/meta/recipes-core/picolibc/picolibc_git.bb
@@ -1,7 +1,7 @@
 require picolibc.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = "virtual/${TARGET_PREFIX}gcc"
+DEPENDS = "virtual/cross-cc"
 
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl"
 
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index 62ebb3f5bc4..a322114b52f 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -4,7 +4,7 @@ SUMMARY = "GNU binary utilities (cross-canadian for ${TARGET_ARCH} target)"
 PN = "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "binutils"
 
-DEPENDS = "flex-native bison-native virtual/${HOST_PREFIX}gcc virtual/nativesdk-libc nativesdk-zlib nativesdk-gettext nativesdk-flex"
+DEPENDS = "flex-native bison-native virtual/cross-sdk-cc virtual/nativesdk-libc nativesdk-zlib nativesdk-gettext nativesdk-flex"
 EXTRA_OECONF += "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
                 --enable-poison-system-directories \
                 "
diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 835d4fa69b7..b908393c1f8 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -1,5 +1,5 @@
 inherit cross
-PROVIDES = "virtual/${TARGET_PREFIX}binutils"
+PROVIDES = "virtual/cross-binutils"
 
 PN = "binutils-cross-${TARGET_ARCH}"
 BPN = "binutils"
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.1.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.1.bb
index 6752659304e..afc91a9b3bd 100644
--- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.1.bb
+++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.1.bb
@@ -1,5 +1,7 @@
 require binutils-cross_${PV}.bb
 
+PROVIDES = "virtual/cross-sdk-binutils"
+
 inherit crosssdk
 
 PN = "binutils-crosssdk-${SDK_SYS}"
diff --git a/meta/recipes-devtools/binutils/binutils-testsuite_2.43.1.bb b/meta/recipes-devtools/binutils/binutils-testsuite_2.43.1.bb
index f2facd52c3a..e5e159bc718 100644
--- a/meta/recipes-devtools/binutils/binutils-testsuite_2.43.1.bb
+++ b/meta/recipes-devtools/binutils/binutils-testsuite_2.43.1.bb
@@ -21,9 +21,9 @@ do_configure() {
 }
 
 # target depends
-DEPENDS += "virtual/${TARGET_PREFIX}binutils"
-DEPENDS += "virtual/${TARGET_PREFIX}gcc"
-DEPENDS += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs"
+DEPENDS += "virtual/cross-binutils"
+DEPENDS += "virtual/cross-cc"
+DEPENDS += "virtual/${MLPREFIX}compilerlibs"
 DEPENDS += "virtual/${MLPREFIX}libc"
 
 python check_prepare() {
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 01de93cc3c4..de559eb9c3f 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -11,7 +11,8 @@ CVE_PRODUCT = "gcc"
 inherit autotools gettext texinfo
 
 BPN = "gcc"
-COMPILERDEP = "virtual/${TARGET_PREFIX}gcc:do_gcc_stash_builddir"
+COMPILERDEP = "${MLPREFIX}gcc-cross-${TARGET_ARCH}:do_gcc_stash_builddir"
+COMPILERDEP:class-nativesdk = "gcc-crosssdk-${SDK_SYS}:do_gcc_stash_builddir"
 
 python extract_stashed_builddir () {
     src = d.expand("${COMPONENTS_DIR}/${BUILD_ARCH}/gcc-stashed-builddir-${TARGET_SYS}")
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index bbe91ad0f9b..a97329e58fd 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -3,7 +3,7 @@ inherit cross-canadian
 SUMMARY = "GNU cc and gcc C compilers (cross-canadian for ${TARGET_ARCH} target)"
 PN = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}gcc virtual/${HOST_PREFIX}binutils virtual/nativesdk-libc nativesdk-gettext flex-native virtual/libc"
+DEPENDS = "virtual/cross-sdk-cc virtual/cross-cc virtual/cross-sdk-binutils virtual/nativesdk-libc nativesdk-gettext flex-native virtual/libc"
 
 GCCMULTILIB = "--enable-multilib"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index f85ccd5c23d..4549f92c2f7 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -2,8 +2,8 @@ inherit cross
 
 INHIBIT_DEFAULT_DEPS = "1"
 EXTRADEPENDS = ""
-DEPENDS = "virtual/${TARGET_PREFIX}binutils ${EXTRADEPENDS} ${NATIVEDEPS}"
-PROVIDES = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
+DEPENDS = "virtual/cross-binutils ${EXTRADEPENDS} ${NATIVEDEPS}"
+PROVIDES = "virtual/cross-cc virtual/c++"
 python () {
     if d.getVar("TARGET_OS").startswith("linux"):
         d.setVar("EXTRADEPENDS", "linux-libc-headers")
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
index 7eaad2314cd..1adce65cf89 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
@@ -8,7 +8,7 @@ SYSTEMLIBS1 = "${SDKPATHNATIVE}${libdir_nativesdk}/"
 
 GCCMULTILIB = "--disable-multilib"
 
-DEPENDS = "virtual/${TARGET_PREFIX}binutils gettext-native ${NATIVEDEPS}"
-PROVIDES = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
+DEPENDS = "virtual/cross-sdk-binutils gettext-native ${NATIVEDEPS}"
+PROVIDES = "virtual/cross-sdk-cc virtual/cross-sdk-c++"
 
 gcc_multilib_setup[vardepsexclude] = "MULTILIB_VARIANTS"
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 7afe34ebed7..7380123ab6b 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -156,8 +156,9 @@ do_install:append:class-target () {
 }
 
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++ libgcc virtual/${MLPREFIX}libc"
-PROVIDES = "virtual/${TARGET_PREFIX}compilerlibs"
+DEPENDS = "virtual/cross-cc virtual/cross-c++ ${MLPREFIX}libgcc virtual/${MLPREFIX}libc"
+DEPENDS:class-nativesdk = "virtual/cross-sdk-cc virtual/cross-sdk-c++ ${MLPREFIX}libgcc virtual/${MLPREFIX}libc"
+PROVIDES = "virtual/${MLPREFIX}compilerlibs"
 
 BBCLASSEXTEND = "nativesdk"
 
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 8c98e9cf8a3..4163e87e1fc 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -48,7 +48,7 @@ do_install () {
 
 INHIBIT_DEFAULT_DEPS = "1"
 ALLOW_EMPTY:${PN} = "1"
-DEPENDS = "virtual/crypt gcc-runtime virtual/${TARGET_PREFIX}gcc"
+DEPENDS = "virtual/crypt gcc-runtime virtual/cross-cc"
 
 # used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
 DEBUG_OPTIMIZATION:append = " -Wno-error"
@@ -75,9 +75,9 @@ RRECOMMENDS:${PN}:append:powerpc64 = " liblsan libtsan"
 RRECOMMENDS:${PN}:append:aarch64 = " liblsan libtsan"
 RRECOMMENDS:${PN}:append:riscv64 = " liblsan libtsan"
 
-do_package_write_ipk[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
-do_package_write_deb[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
-do_package_write_rpm[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
+do_package_write_ipk[depends] += "virtual/${MLPREFIX}compilerlibs:do_packagedata"
+do_package_write_deb[depends] += "virtual/${MLPREFIX}compilerlibs:do_packagedata"
+do_package_write_rpm[depends] += "virtual/${MLPREFIX}compilerlibs:do_packagedata"
 
 # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are supported
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64|riscv64).*-linux'
diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc b/meta/recipes-devtools/gcc/libgcc-initial.inc
index 8251e3c2869..ce100d7ddce 100644
--- a/meta/recipes-devtools/gcc/libgcc-initial.inc
+++ b/meta/recipes-devtools/gcc/libgcc-initial.inc
@@ -29,7 +29,7 @@
 
 require libgcc-common.inc
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc"
+DEPENDS = "virtual/cross-cc"
 
 LICENSE = "GPL-3.0-with-GCC-exception"
 
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 84a2d930df2..95544753826 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -1,6 +1,6 @@
 require libgcc-common.inc
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++ virtual/${MLPREFIX}libc"
+DEPENDS = "virtual/cross-cc virtual/cross-c++ virtual/${MLPREFIX}libc"
 
 do_install:append:class-target () {
 	if [ "${TCLIBC}" != "glibc" ]; then
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 2a08872c259..4560421ed1f 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -49,7 +49,7 @@ do_install () {
 
 # avoid virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = "virtual/${HOST_PREFIX}gcc virtual/${HOST_PREFIX}compilerlibs"
+DEPENDS = "virtual/cross-cc virtual/compilerlibs"
 
 BBCLASSEXTEND = "nativesdk"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 058ffbc9c55..b4b6742d13e 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -7,7 +7,7 @@ PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"
 
 DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext nativesdk-gmp nativesdk-mpfr \
-           virtual/${HOST_PREFIX}gcc virtual/${HOST_PREFIX}binutils virtual/nativesdk-libc"
+           virtual/cross-sdk-cc virtual/cross-sdk-binutils virtual/nativesdk-libc"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index dd485b6799b..7be6fe778f4 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -1,8 +1,8 @@
 inherit cross-canadian
 
 DEPENDS = "go-native virtual/${HOST_PREFIX}go virtual/nativesdk-${HOST_PREFIX}go-runtime \
-           virtual/${HOST_PREFIX}gcc virtual/nativesdk-libc \
-           virtual/nativesdk-${HOST_PREFIX}compilerlibs"
+           virtual/cross-sdk-cc virtual/nativesdk-libc \
+           virtual/nativesdk-compilerlibs"
 PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 # it uses gcc on build machine during go-cross-canadian bootstrap, but
diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index 12939005c06..f2a0521ccf5 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -1,6 +1,6 @@
 inherit crosssdk
 
-DEPENDS = "go-native virtual/${TARGET_PREFIX}gcc virtual/nativesdk-${TARGET_PREFIX}compilerlibs virtual/${TARGET_PREFIX}binutils"
+DEPENDS = "go-native virtual/cross-sdk-cc virtual/nativesdk-compilerlibs virtual/cross-sdk-binutils"
 PN = "go-crosssdk-${SDK_SYS}"
 PROVIDES = "virtual/${TARGET_PREFIX}go"
 
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index c34b839d159..0c2f6144b84 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 
 MODIFYTOS = "0"
 
-DEPENDS += "virtual/${SDK_PREFIX}gcc virtual/nativesdk-libc virtual/nativesdk-${SDK_PREFIX}compilerlibs"
+DEPENDS += "virtual/cross-sdk-cc virtual/nativesdk-libc virtual/nativesdk-compilerlibs"
 
 SRC_URI += "file://target-rust-ccld.c"
 LIC_FILES_CHKSUM = "file://target-rust-ccld.c;md5=af4e0e29f81a34cffe05aa07c89e93e9;endline=7"

