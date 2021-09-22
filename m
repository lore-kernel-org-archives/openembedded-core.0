Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web12.234.1632333239233275349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 10:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bswrTTqo;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id gs10so2460222qvb.13
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 10:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C0dMXXnnew56g56dIhPI4NRuzq2iWuyooFnpcxEllxk=;
        b=bswrTTqoZ5WLPxwObtusRoQK16FJkTy6kqq9dBH+cfQXDqSmeL61nwRNH1WXcKRX/Y
         m5SuMdlJz1M5mWX56c838DSWUozdFfpl1sdEb/2KxO/7dfUL+BML92X53yLQF7sVd4OH
         Xz7nnmMNoeuF5Q2oeSfep7kiuma6gByoOmUYip8BG3wce8/cc574usm4tMolLiAWeOBP
         iz+xVnsAud0F76SnJvhgwSWV243uCdDZoiRk74NJUTvcOT29S3JVbwFJUqxDAXBFIr+4
         pN/7eVB07/F8s++y5gGKpLRRQ2vaDMyjn7jXcUGEySV2y1pf2fh2OSSftIHQG77a1RNy
         sg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C0dMXXnnew56g56dIhPI4NRuzq2iWuyooFnpcxEllxk=;
        b=jrU33vAONCyoDNO+ozHDIzj163BROhz1tRkuFrMKd+5UTtI7HIaG6jkrrbLo0QBqbt
         ECN/faU8UcnIw5Brx+OBRXa/ecC++rQmzV9CzWymTB+0ZoWN+zvqrc4jKpfCOUdMe6wI
         sU1jzw9v3a7kpMfeKaD9NQIfQlgyvtxFg7BikwVe/ulDmf/qleksjBpBflM7KdLKq8gl
         nTTDv9a0DQ4eDLCGrHgmw7jdmwobeKz2rLDjMAB8nP2qDonwi8AIGrzGTnWkDI0MsNQU
         1ELDpun5wm2neI3bUNxN7HNlb1dhAk/s8JoePuWiQNCkSvJ9vqStErCr2hCktnzmtJCh
         2fwA==
X-Gm-Message-State: AOAM532AAPqpVtjVW+OebE3zy4vRnf2JVdkzFyX8yeDD5524uBnLUGtU
	IR6oEzqg2Wr4LPvHruD8R42MJ/E5UictcA==
X-Google-Smtp-Source: ABdhPJz3TytdJ3fuQbiGqEMT0oSZX3Dg7rVAqb7TGEEbg249ZOQ698YbNiuG1eRsw8cwjHbLeZbr2g==
X-Received: by 2002:a0c:816b:: with SMTP id 98mr374562qvc.37.1632333238280;
        Wed, 22 Sep 2021 10:53:58 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id n16sm1809484qta.51.2021.09.22.10.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 10:53:57 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] systemtap: update to 4.5-latest
Date: Wed, 22 Sep 2021 13:53:51 -0400
Message-Id: <a22aa2e3c3df11e4c3650ccb135e1cb9ac1385dd.1632332981.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1632332981.git.bruce.ashfield@gmail.com>
References: <cover.1632332981.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To fix issues with 5.14+ kernels, we bump to the latest 4.5 systemtap.
This means that we can drop a backported patch, and we pickup the
following changes:

    7f6992539 Correct RISC-V handling of SDT markers and document their format.
    2dfd140fd Fix races in perf probe task finder callback
    f463f6053 The /* pc=0x... */ is no longer printed by "stap -v -L 'kernel.function("*")'
    0bd97a806 Use task_state tapset function to avoid task_struct changes
    4996a29c6 tapset: start adopting kernel netif_* tracepoints in netdev.* tapset
    fb0851e62 dwflpp.h: add conditional EM_RISCV define
    c5599df8e Add dwarfless register access for RISC-V
    33d861435 Add bactrace support for RISC-V
    2ae3fc866 RISC-V dwarf register number to pt_reg mappings
    3df603720 Eliminate the sa_restorer field in sigaction struct for RISC-V.
    a6aff9d33 Avoid generating problematic asynchronous unwind tables on RISC-V
    a463860c3 Add RISC-V 64-bit processor support
    8486fd78d Add the actual RISC-V syscall-number mappings to the tapsets.
    1e383aa38 Add creation of mappings between syscall names and numbers for RISC-V
    aedb2dbe7 RISC-V doesn't have crash available, disable it for rpmbuilds.
    33a9bf1a1 Update to newer config.guess to support RISC-V
    3bca17469 Use lex_cast instead of to_string when shortening function names.
    0b5bc934a Revert "runtime: unregister the control channel before cleaning up"
    166a95089 runtime: fix panics when polling on the control channel while unloading
    e6a1b008b Shorten function names that will exceed the kernel's objtool limit of 128
    4f54ba033 runtime/transport: add a comment blurb for ordering invariant at shutdown
    dbe08f1ac runtime: unregister the control channel before cleaning up
    798a67290 bpf pr23478 :: test non-unique key/val iteration
    079f5d708 bpf pr23478 :: test multi-key associative array iteration
    70b24879d rhbz1938312: un-disable bpf.exp after kernel bugfix
    2896d6f5a pr23478 WIP: fixes for existing foreach testcases
    0d1a38dbc pr23478 WIP: rework bpf foreach to handle multi-key array
    14a2c8f54 Run task_fd_lookup.exp with --compatible 4.0
    f2c147767 PR28184: Adapt to kernel rename __fcheck_files to files_lookup_fd_raw
    0581a6560 PR28184: Adapt to kernel rename __fcheck_files to files_lookup_fd_raw
    559fd51fe testsuite: time-limit auxiliary child processes
    5d89bb03e stapbpf bugfix: missing in_block() in try-catch code
    04b43f48f releng: ditch custom pie/ssp CFLAGS engine in configure.ac
    b47d03c20 PR28079: Adapt to kernel 5.14 task_struct.__state change
    e66f3a83b runtime: adapt to -Werror=implicit-fallthrough=5, dyninst runtime
    ea00c1070 PR28140: kernel 5.14-rc adaptation, jump_label_patch
    ffb0a38ea runtime: adapt to -Werror=implicit-fallthrough=5
    efba2178f Revert to using test_tsk_thread_flag for uprobes2
    23db8b29f PR27984: Adjust the address so dwfl_module_addrinfo finds correct function name
    a29f65d57 PR28079: Adapt to kernel 5.14 task_struct.__state change
    2f7e966c0 testsuite item typo fix
    5abb4d130 PR27934: give fuller diagnosis for pass-5 probe-registration errors
    371805aa0 PR27820 tapset/bpf/logging.stp: implement abort() tapset function
    ee361f183 PR27820 tapset/bpf/logging.stp: move bpf versions of functions
    968173f7f runtime: linux 5.14 compat: <linux/panic_notifier.h>
    ef5a8b9ed runtime: fix unintended compile error with autoconf-x86-uniregs.c
    84ef6bd9f Revert "systemtap.spec: don't buildrequire emacs"
    65fc44163 spin-rawhide: ok tweak the git-archive top level path too
    c7f1c12e1 spin-rawhide: switch to ~ versioning for Source: file names too
    bff2b2ff5 spin-rawhide: switch to ~ versioning for n-v-r
    7c2751e37 task_finder_vma: add autoconf check for hlist_add_tail_rcu()
    ea7c27bbe Don't fail vma tracking mmap callback if module is already known.
    2eb7fdfdb Use the path instead of the module for vma tracking mmap callback.
    a5104a612 update READMEs + man pages for freenode -> oftc move
    23c351645 Update list of reasons for latencytap.stp example
    5409ddea1 rhbz1972805: add basic syscall-in-ptregs support for s390x
    0fc73fc4e systemtap.spec: don't Require: libvirt
    515a6a2d6 rhbz1972828: tapsets: iommu tracepoints
    eaf63df6a ppc64 runtime: FULL_REGS() gone
    757d4f654 c++ buildability: util.cxx - unique_ptr
    1a6e7aea7 systemtap.spec: don't buildrequire emacs
    5ff28c970 Allow for adjacent segments belonging to different modules.
    b1e8cd5de Note that Python is a requirement.
    27115ab4c Get the enumerator's enumeration type
    1288bee31 testsuite/systemtap.base/perf.sh drop bashism
    4755bc453 Add hlist macros for use by hlist_add_tail_rcu
    bccf5123f parse.cxx: Initialize functioncall synthetic field
    9bbee6518 Add hlist_add_tail_rcu for rhel 6.
    630e406b8 Don't assume ISO C99
    4a3ad3532 Extend vma mapped entries when the address is adjacent.
    294b7a53e stap-prep: switch to using main vmlinuz file as debuginfod test download
    643351d22 PR27903: grok more glibc dwarf
    3a843482a c++11 hygiene: use cxx_override macro for pre-4.7 g++
    3e9bcd7b1 Fix more -Wformat-nonliteral and -Wmismatched-tags when compiling with clang
    8e5145ae4 dtrace: Use -o option to specify output file for CPP
    b3a392975 Fix -Wformat-nonliteral and -Wformat warnings with clang
    545535f82 Fix -Woverloaded-virtual warnings when building with clang
    0f4bd3219 set2: Return this from assignment operator
    6de815bca Add missing copy constructors to set1_ref and set1_const_ref
    930b54119 Add some override specifiers where missing
    14f04522b util.cxx: Use abs() instead of labs()
    13016e9dd systemtap.spec: python3 tweaks
    494ece199 PR27864: tolerate loc_unavailable during loc2c transform
    e8f5c058f autoconf: version bumps for the next release-4.6
    77abac91d version bumps for the next release-4.6
    0eba8a46b NEWS: release-4.5

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch | 26 -------------------
 .../systemtap/systemtap_git.inc               |  3 +--
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch b/meta/recipes-kernel/systemtap/systemtap/ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch
deleted file mode 100644
index 4d044de7ee..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470 Mon Sep 17 00:00:00 2001
-From: Du Zhe <duzhe0211+sourceware@gmail.com>
-Date: Tue, 13 Jul 2021 19:11:55 -0400
-Subject: [PATCH] runtime: fix unintended compile error with
- autoconf-x86-uniregs.c
-
-Adding a #include <linux/sched.h> restores this test on the gentoo
-linux-5.10.47-gentoo kernel.
-
-Upstream-Status: Backport
----
- runtime/linux/autoconf-x86-uniregs.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/runtime/linux/autoconf-x86-uniregs.c b/runtime/linux/autoconf-x86-uniregs.c
-index 25729c220..232c18670 100644
---- a/runtime/linux/autoconf-x86-uniregs.c
-+++ b/runtime/linux/autoconf-x86-uniregs.c
-@@ -1,3 +1,4 @@
-+#include <linux/sched.h>
- #include <asm/ptrace.h>
- 
- #if defined (__i386__) || defined (__x86_64__)
--- 
-2.27.0
-
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 97d4435f82..b6ff98f0f2 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,13 +1,12 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "0eba8a46bc99c66e5dd274a9a4d661fe08ac4b8a"
+SRCREV = "7f6992539fb22c93c21ac30c94508bf655d496a7"
 PV = "4.5"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
-           file://ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
-- 
2.19.1

