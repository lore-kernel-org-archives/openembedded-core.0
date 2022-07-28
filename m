Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8FBC19F2C
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 11:41:27 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.31543.1659008477311914180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 04:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WuGlt6rd;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id a89so1818201edf.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 04:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UwgN/QXujZrd/yDA+tkcvteOVjP21nhyPHRNVt0ErpI=;
        b=WuGlt6rdCgFTMB/w4td/GklAqYjbVWcvACvmecWZ+3blO9VDX+swo+diGTLRdGXtBJ
         CEbaoBDFowurHZxCfRVEYuR8pl6buk81ShEJQV4RVKI47SJixpRkPK3njWJ4cEh13Oac
         rRPgIxHarIhtV/8jAcuNzT20UQbeTrzWOEriUrs/ED11f8NwCvMxZWGHYIxqsFmPIWuR
         zrGR+93GnAfOTQPOcNsVcB4CdP/IP9Hrij/9vMo6mpHIm5sBR+CoyRPQjpyWw+HFuhvN
         Nlb9Rdl9jPDZo8cBXASzQOtwdNFk3b9Ay6suxkvAs5O4T2u6QguWAKuhKecDcBbEqbXH
         ADyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UwgN/QXujZrd/yDA+tkcvteOVjP21nhyPHRNVt0ErpI=;
        b=FanODumpsNWrO/5K8FTW3VEdXV7+ebQEQ5j+qFuH1ttq7V+FwFhsA5R0wjlqPq4RoW
         NppkF1rv6NJRCzPNH1Wkp/pzx3qlzTSHjjqSsKKR+sK7Gf07KTp9ihHjaMMsoXtch0lj
         xytxhdbPchSRCEvgRr7Os8AohBypOY4DYDoqg7crQvHc8suDCVm39JWg6paOglzWGumZ
         BB8HDAdk9xBL0FbcbQucTUo3UHVRhrnD3sMzjoQIaHkqGK6d3Fiz2b/esYPFjMKMXKiK
         B+Y/qSpDtFy0FZI/sIPq/FCF2ti/6oyRBmy0L0LyHtKz9pg3V8BxUq04ZxfONwy3N2cw
         vckg==
X-Gm-Message-State: AJIora9/a4G1U7IMOTLrU5izZLuzJC78j9FvaM8i2LSApHE/zxyBBHb2
	v4AMsvEwqXv26Zq7QFSWkwvXCF0iQMs=
X-Google-Smtp-Source: 
 AGRyM1uocoLHe/QIoa8owJ7sAmXCXIX/WG+sUtttxH59+aioY8ebUMX/L+camZo72o71lJ3sNTrXSA==
X-Received: by 2002:a05:6402:1389:b0:43a:ceea:93fd with SMTP id
 b9-20020a056402138900b0043aceea93fdmr27668274edv.64.1659008475635;
        Thu, 28 Jul 2022 04:41:15 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 k20-20020a170906055400b0072b11cb485asm313406eja.208.2022.07.28.04.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 04:41:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: petr.vorel@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] ltp: fix build with ld-is-gold in DISTRO_FEATURES
Date: Thu, 28 Jul 2022 13:40:44 +0200
Message-Id: <20220728114046.3529197-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 11:41:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168600

* backport one more commit for LD call which conflicts with the
  0001-kvm-use-LD-instead-of-hardcoding-ld.patch we already had
  and replace this 2nd patch with the rebased version which is
  now merged upstream

* then backport additional patch which introduces KVM_LD variable
  which we can set to use .bfd suffix in LD when ld-is-gold is
  in DISTRO_FEATURES to work around gold incompatibility reported:
  https://github.com/linux-test-project/ltp/pull/948#issuecomment-1193138866
  https://lists.openembedded.org/g/openembedded-core/message/168193

  http://errors.yoctoproject.org/Errors/Details/663094/

  x86_64-oe-linux-ld --sysroot=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/ltp/20220527-r0/recipe-sysroot   -z noexecstack -r -T /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/ltp/20220527-r0/git/testcases/kernel/kvm/linker/payload.lds --oformat=elf64-x86-64 -o kvm_pagefault01-payload.o kvm_pagefault01-payload.bin
  x86_64-oe-linux-ld: error: kvm_pagefault01-payload.bin:1:1: invalid character
  make: *** [Makefile:53: kvm_pagefault01-payload.o] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 depends on "ltp: Add post release runtime fixes" change currently in master-next:
 https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=024ce059a64eb2f96dce2880e5708afd25dd45f2

 ...-access-mode-in-KVM-test-ELF-headers.patch | 40 ++++++++++++
 ...kvm-use-LD-instead-of-hardcoding-ld.patch} | 26 ++++----
 ...ile-variable-for-building-KVM-payloa.patch | 63 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20220527.bb     | 13 +++-
 4 files changed, 128 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-kvm-Fix-stack-access-mode-in-KVM-test-ELF-headers.patch
 rename meta/recipes-extended/ltp/ltp/{0001-kvm-use-LD-instead-of-hardcoding-ld.patch => 0002-kvm-use-LD-instead-of-hardcoding-ld.patch} (60%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0003-Add-KVM_LD-Makefile-variable-for-building-KVM-payloa.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-kvm-Fix-stack-access-mode-in-KVM-test-ELF-headers.patch b/meta/recipes-extended/ltp/ltp/0001-kvm-Fix-stack-access-mode-in-KVM-test-ELF-headers.patch
new file mode 100644
index 0000000000..764e9c0d9f
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-kvm-Fix-stack-access-mode-in-KVM-test-ELF-headers.patch
@@ -0,0 +1,40 @@
+From 608fc7bcda43e60536ae1f19842f7affba8f0aea Mon Sep 17 00:00:00 2001
+From: Martin Doucha <mdoucha@suse.cz>
+Date: Wed, 1 Jun 2022 16:16:34 +0200
+Subject: [PATCH] kvm: Fix stack access mode in KVM test ELF headers
+
+When the linker converts guest payload binary into a linkable resource
+object file, it somehow defaults to requesting executable stack section
+for the final test binary. This trips some build-time security checks
+on newer systems. Add explicit linker option to make the stack
+non-executable.
+
+Suggested-by: Fabian Vogt <fvogt@suse.com>
+Signed-off-by: Martin Doucha <mdoucha@suse.cz>
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/f9715d7c2e78713e26533c6e0846aaabf5c4095b]
+---
+ testcases/kernel/kvm/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
+index 69a9946fe..adab56952 100644
+--- a/testcases/kernel/kvm/Makefile
++++ b/testcases/kernel/kvm/Makefile
+@@ -50,11 +50,11 @@ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+ ifdef VERBOSE
+ 	$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)
+ 	objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
+-	ld -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
++	ld -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
+ else
+ 	@$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)
+ 	@objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
+-	@ld -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
++	@ld -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
+ 	@echo KVM_CC $(target_rel_dir)$@
+ endif
+ 	@rm $*-payload.elf $*-payload.bin
diff --git a/meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-of-hardcoding-ld.patch b/meta/recipes-extended/ltp/ltp/0002-kvm-use-LD-instead-of-hardcoding-ld.patch
similarity index 60%
rename from meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-of-hardcoding-ld.patch
rename to meta/recipes-extended/ltp/ltp/0002-kvm-use-LD-instead-of-hardcoding-ld.patch
index 23634d0c86..060ba05835 100644
--- a/meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-of-hardcoding-ld.patch
+++ b/meta/recipes-extended/ltp/ltp/0002-kvm-use-LD-instead-of-hardcoding-ld.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/948]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 7670233e43df2aed6d44b96c51b034f8e2d28a19 Mon Sep 17 00:00:00 2001
+From 1cea308a647c2a2f9790b0bac7c523de7aa83270 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 12 Jul 2022 15:03:54 +0100
 Subject: [PATCH] kvm: use $(LD) instead of hardcoding ld
@@ -9,29 +6,34 @@ Subject: [PATCH] kvm: use $(LD) instead of hardcoding ld
 In cross-compiled builds the host ld may not know the required ELF format,
 so ensure we use $(LD) which will be the cross-capable ld binary.
 
+Closes: https://github.com/linux-test-project/ltp/pull/948
+
+Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f886384703ef9019aaf2f2dfebb]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Reviewed-by: Martin Doucha <mdoucha@suse.cz>
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  testcases/kernel/kvm/Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
-index 69a9946fe..4ddef9f95 100644
+index adab56952..d67230735 100644
 --- a/testcases/kernel/kvm/Makefile
 +++ b/testcases/kernel/kvm/Makefile
 @@ -50,11 +50,11 @@ include $(top_srcdir)/include/mk/generic_leaf_target.mk
  ifdef VERBOSE
  	$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)
  	objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
--	ld -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
-+	$(LD) -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
+-	ld -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
++	$(LD) -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
  else
  	@$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)
  	@objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
--	@ld -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
-+	@$(LD) -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
+-	@ld -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
++	@$(LD) -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
  	@echo KVM_CC $(target_rel_dir)$@
  endif
  	@rm $*-payload.elf $*-payload.bin
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0003-Add-KVM_LD-Makefile-variable-for-building-KVM-payloa.patch b/meta/recipes-extended/ltp/ltp/0003-Add-KVM_LD-Makefile-variable-for-building-KVM-payloa.patch
new file mode 100644
index 0000000000..974ca5eebe
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0003-Add-KVM_LD-Makefile-variable-for-building-KVM-payloa.patch
@@ -0,0 +1,63 @@
+From a8d41b7937a34904611011ca357f8db880d42270 Mon Sep 17 00:00:00 2001
+From: Martin Doucha <mdoucha@suse.cz>
+Date: Mon, 25 Jul 2022 17:37:27 +0200
+Subject: [PATCH] Add KVM_LD Makefile variable for building KVM payload
+ binaries
+
+KVM linker needs to be configurable for cross-compiling but some
+linkers don't support the linker script for wrapping arbitrary files
+into linkable resource files. Allow KVM linker to be changed
+independently of $LD via $KVM_LD.
+
+Signed-off-by: Martin Doucha <mdoucha@suse.cz>
+Acked-by: Richard Palethorpe <rpalethorpe@suse.com>
+
+Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/5ef0b7892a17b64040e55e9ad62d36ebb75d33fd]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ doc/build-system-guide.txt    | 5 +++++
+ testcases/kernel/kvm/Makefile | 5 +++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/doc/build-system-guide.txt b/doc/build-system-guide.txt
+index 166f7fb92..b8d267b4b 100644
+--- a/doc/build-system-guide.txt
++++ b/doc/build-system-guide.txt
+@@ -145,6 +145,11 @@ $(CPPFLAGS)		: Preprocessor flags, e.g. -I arguments.
+ 
+ $(DEBUG_CFLAGS)		: Debug flags to pass to $(CC), -g, etc.
+ 
++$(KVM_LD)		: Special linker for wrapping KVM payload binaries
++			  into linkable object files. Defaults to $(LD).
++			  Change this variable if the KVM Makefile fails
++			  to build files named *-payload.o.
++
+ $(LD)			: The system linker (typically $(CC), but not
+ 			  necessarily).
+ 
+diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
+index d67230735..31f144c26 100644
+--- a/testcases/kernel/kvm/Makefile
++++ b/testcases/kernel/kvm/Makefile
+@@ -11,6 +11,7 @@ GUEST_CPPFLAGS = $(CPPFLAGS) -DCOMPILE_PAYLOAD
+ GUEST_CFLAGS = -ffreestanding -O2 -Wall -fno-asynchronous-unwind-tables -mno-mmx -mno-sse
+ GUEST_LDFLAGS = -nostdlib -Wl,--build-id=none
+ GUEST_LDLIBS =
++KVM_LD ?= $(LD)
+ 
+ FILTER_OUT_MAKE_TARGETS := lib_guest lib_host lib_x86
+ 
+@@ -50,11 +51,11 @@ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+ ifdef VERBOSE
+ 	$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)
+ 	objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
+-	$(LD) -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
++	$(KVM_LD) -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
+ else
+ 	@$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)
+ 	@objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
+-	@$(LD) -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
++	@$(KVM_LD) -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
+ 	@echo KVM_CC $(target_rel_dir)$@
+ endif
+ 	@rm $*-payload.elf $*-payload.bin
diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-extended/ltp/ltp_20220527.bb
index d07563c4e1..b0f4ea6021 100644
--- a/meta/recipes-extended/ltp/ltp_20220527.bb
+++ b/meta/recipes-extended/ltp/ltp_20220527.bb
@@ -28,7 +28,9 @@ SRCREV = "6f88e0f6f1d6eb12c48c902f50f47ecbd3b0f18a"
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://disable_hanging_tests.patch \
-           file://0001-kvm-use-LD-instead-of-hardcoding-ld.patch \
+           file://0001-kvm-Fix-stack-access-mode-in-KVM-test-ELF-headers.patch \
+           file://0002-kvm-use-LD-instead-of-hardcoding-ld.patch \
+           file://0003-Add-KVM_LD-Makefile-variable-for-building-KVM-payloa.patch \
            file://0001-nfs05_make_tree-Restore-5-min-timeout.patch \
            file://0001-syscalls-migrate_pages03-restore-runtime-to-5m.patch \
            file://0001-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch \
@@ -47,6 +49,13 @@ inherit autotools-brokensep pkgconfig
 # https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36
 LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
 
+# After 0002-kvm-use-LD-instead-of-hardcoding-ld.patch
+# https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f886384703ef9019aaf2f2dfebb
+# it fails with gold also a bit later when trying to use *-payload.bin
+# http://errors.yoctoproject.org/Errors/Details/663094/
+# work around this by forcing .bfd linked in LD when ld-is-gold is in DISTRO_FEATURES
+KVM_LD = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
+
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 export prefix = "/opt/${PN}"
@@ -59,7 +68,7 @@ EXTRA_OECONF = " --with-realtime-testsuite --with-open-posix-testsuite "
 EXTRA_OECONF += " --without-tirpc "
 
 do_compile() {
-    oe_runmake HOSTCC="${CC_FOR_BUILD}" HOST_CFLAGS="${CFLAGS_FOR_BUILD}" HOST_LDFLAGS="${LDFLAGS_FOR_BUILD}"
+    oe_runmake HOSTCC="${CC_FOR_BUILD}" HOST_CFLAGS="${CFLAGS_FOR_BUILD}" HOST_LDFLAGS="${LDFLAGS_FOR_BUILD}" KVM_LD="${KVM_LD}"
 }
 
 do_install(){

