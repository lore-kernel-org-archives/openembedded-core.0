Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.29534.1620640257559603398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 02:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zaw4khY+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id n205so8823809wmf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 02:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bSQ7HFlQ/H7tFvIXou8vEJHyni7sLGAMnzY6tybMMjE=;
        b=Zaw4khY+57d8VTXOZuzzsn0BjoZ/cr5yoo61Jn+dq9wpwQns1XW448te86toFkCbkz
         lNbpwLrDxHttWh0svlGrlufE6vsfHA5+FYlP8LBYZapaPhvcwcQLyCDj/UTc23wtruxL
         NLR9YLN25v9kcfF9fWro3J6pU9L2fe8j3cU58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bSQ7HFlQ/H7tFvIXou8vEJHyni7sLGAMnzY6tybMMjE=;
        b=Qgi7O3IpV18rroJcErrPFDb9ZqBM9WVgARgIdCwLJKjHCbLYupHm9FFgA/ZeCGi2cf
         NLn6ll/hFb/VOPgNwfW8nBIuvRyoi8+aTLqc0PwtRZz9bBFzxriJE/jmt5Iv/h98vmpB
         haon3oBPBVki6S6w7QXgSlFMXke2twgtcuwR3Vweziem5ii0wdz4mp4y0RGI/cVnX9Pb
         IA4tveF3pY6iAlnd7YZ6RBn530WsmD/gKSS1gXZ7aDiOY4bfxskaxbid9asqZA0AeTqA
         JJxqKj+KcwoUlNI+RagrVcp0Du8xL5+663cMZZxdzHw2nrbUwpqk4+EUtvndBGcpGTJw
         HcrA==
X-Gm-Message-State: AOAM532L1+3OXakYhHeVzlkzo/8X1p2iKTqVgcW4IqvkrC4OeGICwdwf
	VM3m6VuGQmd/BzmNZWXKClXdQDTSEVN/mg==
X-Google-Smtp-Source: ABdhPJzLcDNsQ3oV3kC2KMsFuWCN9tp2H35mR75BMp1SmQs+Zyj4+1MDRHtS0rT9B9R+kzO1bX/nfA==
X-Received: by 2002:a05:600c:4a22:: with SMTP id c34mr25124009wmp.160.1620640255557;
        Mon, 10 May 2021 02:50:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id v13sm22768139wrt.65.2021.05.10.02.50.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 02:50:55 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] ovmf: Improve reproducibility by enabling prefix mapping
Date: Mon, 10 May 2021 10:50:54 +0100
Message-Id: <20210510095054.2154380-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
--debug-prefix-map to nasm (we carry a patch to nasm for this). The
tools definitions are built by ovmf-native so we need to pass this in
at target build time when we know the right values.

By using determininistc file paths in the ovmf build, it removes the
opportunitity for gcc/ld to change the output binaries due to path
lengths overflowing section sizes and causing small changes in the
binary output.

This also means that if builds have reproducibility issues in future, it
becomes much easier to compare intermediate build artefacts.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ovmf/ovmf/debug_prefix_map.patch          | 93 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  8 ++
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/debug_prefix_map.patch

diff --git a/meta/recipes-core/ovmf/ovmf/debug_prefix_map.patch b/meta/recipes-core/ovmf/ovmf/debug_prefix_map.patch
new file mode 100644
index 00000000000..3fe1782c5fe
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/debug_prefix_map.patch
@@ -0,0 +1,93 @@
+We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
+ --debug-prefix-map to nasm (we carry a patch to nasm for this). The
+tools definitions file is built by ovmf-native so we need to pass this in
+at target build time when we know the right values so we use the environment.
+
+By using determininistc file paths during the ovmf build, it removes the 
+opportunitity for gcc/ld to change the output binaries due to path lengths 
+overflowing section sizes and causing small changes in the binary output. 
+Previously we relied on the stripped output being the same which isn't always
+the case if the size of the debug symbols varies.
+
+Upstream-Status: Pending [gcc parts may be upstreamable, nasm patch isn't upstream yet]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+
+Index: git/BaseTools/Conf/tools_def.template
+===================================================================
+--- git.orig/BaseTools/Conf/tools_def.template
++++ git/BaseTools/Conf/tools_def.template
+@@ -1918,7 +1918,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     = --a
+ *_*_*_DTCPP_PATH                   = DEF(DTCPP_BIN)
+ *_*_*_DTC_PATH                     = DEF(DTC_BIN)
+ 
+-DEFINE GCC_ALL_CC_FLAGS            = -g -Os -fshort-wchar -fno-builtin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fno-common
++DEFINE GCC_ALL_CC_FLAGS            = -g -Os -fshort-wchar -fno-builtin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fno-common ENV(GCC_PREFIX_MAP)
+ DEFINE GCC_IA32_CC_FLAGS           = DEF(GCC_ALL_CC_FLAGS) -m32 -malign-double -freorder-blocks -freorder-blocks-and-partition -O2 -mno-stack-arg-probe
+ DEFINE GCC_X64_CC_FLAGS            = DEF(GCC_ALL_CC_FLAGS) -mno-red-zone -Wno-address -mno-stack-arg-probe
+ DEFINE GCC_ARM_CC_FLAGS            = DEF(GCC_ALL_CC_FLAGS) -mlittle-endian -mabi=aapcs -fno-short-enums -funsigned-char -ffunction-sections -fdata-sections -fomit-frame-pointer -Wno-address -mthumb -mfloat-abi=soft -fno-pic -fno-pie
+@@ -1936,8 +1936,8 @@ DEFINE GCC_IA32_X64_ASLDLINK_FLAGS = -fu
+ DEFINE GCC_ARM_ASLDLINK_FLAGS      = DEF(GCC_ARM_DLINK_FLAGS) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDLINK_FLAGS)
+ DEFINE GCC_AARCH64_ASLDLINK_FLAGS  = DEF(GCC_AARCH64_DLINK_FLAGS) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDLINK_FLAGS)
+ DEFINE GCC_IA32_X64_DLINK_FLAGS    = DEF(GCC_IA32_X64_DLINK_COMMON) --entry _$(IMAGE_ENTRY_POINT) --file-alignment 0x20 --section-alignment 0x20 -Map $(DEST_DIR_DEBUG)/$(BASE_NAME).map
+-DEFINE GCC_ASM_FLAGS               = -c -x assembler -imacros AutoGen.h
+-DEFINE GCC_PP_FLAGS                = -E -x assembler-with-cpp -include AutoGen.h
++DEFINE GCC_ASM_FLAGS               = -c -x assembler -imacros AutoGen.h ENV(GCC_PREFIX_MAP)
++DEFINE GCC_PP_FLAGS                = -E -x assembler-with-cpp -include AutoGen.h ENV(GCC_PREFIX_MAP)
+ DEFINE GCC_VFRPP_FLAGS             = -x c -E -P -DVFRCOMPILE --include $(MODULE_NAME)StrDefs.h
+ DEFINE GCC_ASLPP_FLAGS             = -x c -E -include AutoGen.h
+ DEFINE GCC_ASLCC_FLAGS             = -x c
+@@ -2082,7 +2082,7 @@ DEFINE GCC_PP_FLAGS
+ *_GCC48_IA32_DLINK2_FLAGS         = DEF(GCC48_IA32_DLINK2_FLAGS)
+ *_GCC48_IA32_RC_FLAGS             = DEF(GCC_IA32_RC_FLAGS)
+ *_GCC48_IA32_OBJCOPY_FLAGS        =
+-*_GCC48_IA32_NASM_FLAGS           = -f elf32
++*_GCC48_IA32_NASM_FLAGS           = -f elf32 ENV(NASM_PREFIX_MAP)
+ 
+   DEBUG_GCC48_IA32_CC_FLAGS       = DEF(GCC48_IA32_CC_FLAGS) -Os
+ RELEASE_GCC48_IA32_CC_FLAGS       = DEF(GCC48_IA32_CC_FLAGS) -Os -Wno-unused-but-set-variable
+@@ -2110,7 +2110,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       = DEF(
+ *_GCC48_X64_DLINK2_FLAGS         = DEF(GCC48_X64_DLINK2_FLAGS)
+ *_GCC48_X64_RC_FLAGS             = DEF(GCC_X64_RC_FLAGS)
+ *_GCC48_X64_OBJCOPY_FLAGS        =
+-*_GCC48_X64_NASM_FLAGS           = -f elf64
++*_GCC48_X64_NASM_FLAGS           = -f elf64 ENV(NASM_PREFIX_MAP)
+ 
+   DEBUG_GCC48_X64_CC_FLAGS       = DEF(GCC48_X64_CC_FLAGS) -Os
+ RELEASE_GCC48_X64_CC_FLAGS       = DEF(GCC48_X64_CC_FLAGS) -Os -Wno-unused-but-set-variable
+@@ -2222,7 +2222,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   = DEF(G
+ *_GCC49_IA32_DLINK2_FLAGS         = DEF(GCC49_IA32_DLINK2_FLAGS)
+ *_GCC49_IA32_RC_FLAGS             = DEF(GCC_IA32_RC_FLAGS)
+ *_GCC49_IA32_OBJCOPY_FLAGS        =
+-*_GCC49_IA32_NASM_FLAGS           = -f elf32
++*_GCC49_IA32_NASM_FLAGS           = -f elf32 ENV(NASM_PREFIX_MAP)
+ 
+   DEBUG_GCC49_IA32_CC_FLAGS       = DEF(GCC49_IA32_CC_FLAGS) -Os
+ RELEASE_GCC49_IA32_CC_FLAGS       = DEF(GCC49_IA32_CC_FLAGS) -Os -Wno-unused-but-set-variable -Wno-unused-const-variable
+@@ -2250,7 +2250,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       = DEF(
+ *_GCC49_X64_DLINK2_FLAGS         = DEF(GCC49_X64_DLINK2_FLAGS)
+ *_GCC49_X64_RC_FLAGS             = DEF(GCC_X64_RC_FLAGS)
+ *_GCC49_X64_OBJCOPY_FLAGS        =
+-*_GCC49_X64_NASM_FLAGS           = -f elf64
++*_GCC49_X64_NASM_FLAGS           = -f elf64 ENV(NASM_PREFIX_MAP)
+ 
+   DEBUG_GCC49_X64_CC_FLAGS       = DEF(GCC49_X64_CC_FLAGS) -Os
+ RELEASE_GCC49_X64_CC_FLAGS       = DEF(GCC49_X64_CC_FLAGS) -Os -Wno-unused-but-set-variable -Wno-unused-const-variable
+@@ -2368,7 +2368,7 @@ RELEASE_GCC49_AARCH64_DLINK_XIPFLAGS = -
+ *_GCC5_IA32_DLINK2_FLAGS         = DEF(GCC5_IA32_DLINK2_FLAGS) -no-pie
+ *_GCC5_IA32_RC_FLAGS             = DEF(GCC_IA32_RC_FLAGS)
+ *_GCC5_IA32_OBJCOPY_FLAGS        =
+-*_GCC5_IA32_NASM_FLAGS           = -f elf32
++*_GCC5_IA32_NASM_FLAGS           = -f elf32 ENV(NASM_PREFIX_MAP)
+ 
+   DEBUG_GCC5_IA32_CC_FLAGS       = DEF(GCC5_IA32_CC_FLAGS) -flto -Os
+   DEBUG_GCC5_IA32_DLINK_FLAGS    = DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto -Os -Wl,-m,elf_i386,--oformat=elf32-i386
+@@ -2400,7 +2400,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    = DEF(G
+ *_GCC5_X64_DLINK2_FLAGS          = DEF(GCC5_X64_DLINK2_FLAGS)
+ *_GCC5_X64_RC_FLAGS              = DEF(GCC_X64_RC_FLAGS)
+ *_GCC5_X64_OBJCOPY_FLAGS         =
+-*_GCC5_X64_NASM_FLAGS            = -f elf64
++*_GCC5_X64_NASM_FLAGS            = -f elf64 ENV(NASM_PREFIX_MAP)
+ 
+   DEBUG_GCC5_X64_CC_FLAGS        = DEF(GCC5_X64_CC_FLAGS) -flto -DUSING_LTO -Os
+   DEBUG_GCC5_X64_DLINK_FLAGS     = DEF(GCC5_X64_DLINK_FLAGS) -flto -Os
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 896b3b63202..1fe01146d6b 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -17,6 +17,7 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
            file://0004-ovmf-Update-to-latest.patch \
            file://zero.patch \
+           file://debug_prefix_map.patch \
            "
 
 PV = "edk2-stable202102"
@@ -104,6 +105,13 @@ fix_toolchain_append_class-native() {
         ${S}/BaseTools/Conf/tools_def.template
 }
 
+# We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
+# --debug-prefix-map to nasm (we carry a patch to nasm for this). The
+# tools definitions are built by ovmf-native so we need to pass this in
+# at target build time when we know the right values.
+export NASM_PREFIX_MAP = "--debug-prefix-map=${WORKDIR}=/usr/src/debug/ovmf/${EXTENDPE}${PV}-${PR}"
+export GCC_PREFIX_MAP = "${DEBUG_PREFIX_MAP}"
+
 GCC_VER="$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"
 
 fixup_target_tools() {
-- 
2.30.2

