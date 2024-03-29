Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6A3CD1283
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 05:50:45 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.11054.1711691439869464044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 22:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QkDfTlnD;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e223025ccbso6438505ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 22:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711691439; x=1712296239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=frE0TYfmrMKBqhudYb50gaXYZ7aRQUteKUZkJVwTd8w=;
        b=QkDfTlnDOwbVO9WdHGRiqyEa1MuAjn2a+PL4hX1G2WfsKU/sxkpyV2g/d46fdWxusd
         23d7fKppoSZLrF4+SCpYXDmBH3ATQW69P5U9qliV6WSa1hShve9qyqPf1L4SjN7VGTMx
         1iLCnBrz1ZpXn5AXr4zhhxVSCFqYlCxJMy60L5DHZKNCo3PC/hBjwl4y20FPxfbrVrdG
         q//t0haEsUS3QU9/3FSjy0Dop70MF1XgdyD8KD8I+oq8IpMkpsjUx1sdgrfOFsSbGdSA
         lWrvXSoyQh/3qSDJ4pjOLJtmzqUT74u3SN0QP8/xaMpjIfUzuBkmAPDgj16PHDrPtGI+
         Lgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711691439; x=1712296239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frE0TYfmrMKBqhudYb50gaXYZ7aRQUteKUZkJVwTd8w=;
        b=sRZfbZYKkg3xBAoeWVlnlizcGm00IgetK2Mp1vUkDVEgPNLx3CTiP2a5o2W+sDsCro
         54BE8APLKybWoDXu8OMBEm+IgpQq0lZDr7W9FQS+eOmJCutBDhY3/aQ8eao/j0uNpvMU
         m9uDOEME2idJpHcudeU+RCQ6talRXxjsapLQpnLC6Cd/AKyDzfh1PM8aynbxUwF63R3g
         FI6XBTPduzctL/PAmam9sy1CrlJJ39CYsOh3qsSDlbwBAYtBuuyNhU4CRw1JNa0I82T5
         KKUAQdZMpy1MobM5mwqhUtrAakc5iX0w0pSMA8xOOv8l+dn3C1jcJ1NTlM0+TRKnDdAA
         jhCw==
X-Gm-Message-State: AOJu0Yym393T/gRaXnRzDOSNvrl5mkDDRjCNhBwuB0NjGBmfMrRbpgRQ
	oG26x5QYkB9szftHrvLnrKKOYzFZJdoog4QVomiMdxT6M5Q0QA9zi9fhHepL
X-Google-Smtp-Source: AGHT+IGLkea2ha89fjRPd0m0oRNnmQ7MBCEQB2X6rWJ2yIBdAir6MhBFIIuSKOKIWKfVWrgZ8Y2QFw==
X-Received: by 2002:a17:903:228b:b0:1e0:c567:bb42 with SMTP id b11-20020a170903228b00b001e0c567bb42mr1843733plh.59.1711691438589;
        Thu, 28 Mar 2024 22:50:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::dfbb])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001e088a9e2bcsm2611573plt.292.2024.03.28.22.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 22:50:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] valgrind: Backport fixes from 3.22 branch
Date: Thu, 28 Mar 2024 22:50:32 -0700
Message-ID: <20240329055034.3942360-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 05:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197623

These fixes are helping some ptests on musl and 6.6 kernel

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ....py-regular-expressions-should-use-r.patch |  64 +++++
 ...ind-3.22.0-fails-on-assertion-when-l.patch | 147 ++++++++++++
 .../0003-Add-fchmodat2-syscall-on-linux.patch | 221 ++++++++++++++++++
 ...ind-incompatibility-with-binutils-2..patch | 137 +++++++++++
 .../valgrind/valgrind_3.22.0.bb               |   4 +
 5 files changed, 573 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-valgrind-monitor.py-regular-expressions-should-use-r.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-Bug-476548-valgrind-3.22.0-fails-on-assertion-when-l.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0003-Add-fchmodat2-syscall-on-linux.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0004-Bug-478624-Valgrind-incompatibility-with-binutils-2..patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-monitor.py-regular-expressions-should-use-r.patch b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-monitor.py-regular-expressions-should-use-r.patch
new file mode 100644
index 00000000000..80a8e3a10b1
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-monitor.py-regular-expressions-should-use-r.patch
@@ -0,0 +1,64 @@
+From 027b649fdb831868e71be01cafdacc49a5f419ab Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Fri, 17 Nov 2023 14:01:21 +0100
+Subject: [PATCH 1/4] valgrind-monitor.py regular expressions should use raw
+ strings
+
+With python 3.12 gdb will produce the following SyntaxWarning when
+loading valgrind-monitor-def.py:
+
+  /usr/share/gdb/auto-load/valgrind-monitor-def.py:214:
+  SyntaxWarning: invalid escape sequence '\['
+    if re.fullmatch("^0x[0123456789ABCDEFabcdef]+\[[^\[\]]+\]$", arg_str):
+
+In a future python version this will become an SyntaxError.
+
+Use a raw strings for the regular expression.
+
+https://bugs.kde.org/show_bug.cgi?id=476708
+(cherry picked from commit 0fbfbe05028ad18efda786a256a2738d2c231ed4)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=valgrind.git;a=commit;h=027b649fdb831868e71be01cafdacc49a5f419ab]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ NEWS                                          | 13 +++++++++++++
+ coregrind/m_gdbserver/valgrind-monitor-def.py |  2 +-
+ 2 files changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/NEWS b/NEWS
+index f11da4be8..ee5b4ff11 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,3 +1,16 @@
++Branch 3.22
++~~~~~~~~~~~
++
++* ==================== FIXED BUGS ====================
++
++The following bugs have been fixed or resolved on this branch.
++
++476708  valgrind-monitor.py regular expressions should use raw strings
++
++To see details of a given bug, visit
++  https://bugs.kde.org/show_bug.cgi?id=XXXXXX
++where XXXXXX is the bug number as listed above.
++
+ Release 3.22.0 (31 Oct 2023)
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ 
+diff --git a/coregrind/m_gdbserver/valgrind-monitor-def.py b/coregrind/m_gdbserver/valgrind-monitor-def.py
+index b4e7b992d..d74b1590c 100644
+--- a/coregrind/m_gdbserver/valgrind-monitor-def.py
++++ b/coregrind/m_gdbserver/valgrind-monitor-def.py
+@@ -211,7 +211,7 @@ class Valgrind_ADDR_LEN_opt(Valgrind_Command):
+ For compatibility reason with the Valgrind gdbserver monitor command,
+ we detect and accept usages such as 0x1234ABCD[10]."""
+     def invoke(self, arg_str : str, from_tty : bool) -> None:
+-        if re.fullmatch("^0x[0123456789ABCDEFabcdef]+\[[^\[\]]+\]$", arg_str):
++        if re.fullmatch(r"^0x[0123456789ABCDEFabcdef]+\[[^\[\]]+\]$", arg_str):
+             arg_str = arg_str.replace("[", " ")
+             arg_str = arg_str.replace("]", " ")
+         eval_execute_2(self, arg_str,
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-Bug-476548-valgrind-3.22.0-fails-on-assertion-when-l.patch b/meta/recipes-devtools/valgrind/valgrind/0002-Bug-476548-valgrind-3.22.0-fails-on-assertion-when-l.patch
new file mode 100644
index 00000000000..5759fa039a3
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0002-Bug-476548-valgrind-3.22.0-fails-on-assertion-when-l.patch
@@ -0,0 +1,147 @@
+From 1d00e5ce0fb069911c4b525ec38289fb5d9021b0 Mon Sep 17 00:00:00 2001
+From: Paul Floyd <pjfloyd@wanadoo.fr>
+Date: Sat, 18 Nov 2023 08:49:34 +0100
+Subject: [PATCH 2/4] Bug 476548 - valgrind 3.22.0 fails on assertion when
+ loading debuginfo file produced by mold
+
+(cherry picked from commit 9ea4ae66707a4dcc6f4328e11911652e4418c585)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=valgrind.git;a=commit;h=1d00e5ce0fb069911c4b525ec38289fb5d9021b0]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ NEWS                               |  2 ++
+ coregrind/m_debuginfo/image.c      | 14 +++++++++
+ coregrind/m_debuginfo/priv_image.h |  4 +++
+ coregrind/m_debuginfo/readelf.c    | 49 ++++++++++++++++++++++++++++--
+ 4 files changed, 66 insertions(+), 3 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index ee5b4ff11..6cd13429a 100644
+--- a/NEWS
++++ b/NEWS
+@@ -5,6 +5,8 @@ Branch 3.22
+ 
+ The following bugs have been fixed or resolved on this branch.
+ 
++476548  valgrind 3.22.0 fails on assertion when loading debuginfo
++        file produced by mold
+ 476708  valgrind-monitor.py regular expressions should use raw strings
+ 
+ To see details of a given bug, visit
+diff --git a/coregrind/m_debuginfo/image.c b/coregrind/m_debuginfo/image.c
+index 02e509071..445f95555 100644
+--- a/coregrind/m_debuginfo/image.c
++++ b/coregrind/m_debuginfo/image.c
+@@ -1221,6 +1221,20 @@ Int ML_(img_strcmp_c)(DiImage* img, DiOffT off1, const HChar* str2)
+    }
+ }
+ 
++Int ML_(img_strcmp_n)(DiImage* img, DiOffT off1, const HChar* str2, Word n)
++{
++   ensure_valid(img, off1, 1, "ML_(img_strcmp_c)");
++   while (n) {
++      UChar c1 = get(img, off1);
++      UChar c2 = *(const UChar*)str2;
++      if (c1 < c2) return -1;
++      if (c1 > c2) return 1;
++      if (c1 == 0) return 0;
++      off1++; str2++; --n;
++   }
++   return 0;
++}
++
+ UChar ML_(img_get_UChar)(DiImage* img, DiOffT offset)
+ {
+    ensure_valid(img, offset, 1, "ML_(img_get_UChar)");
+diff --git a/coregrind/m_debuginfo/priv_image.h b/coregrind/m_debuginfo/priv_image.h
+index a49846f14..c91e49f01 100644
+--- a/coregrind/m_debuginfo/priv_image.h
++++ b/coregrind/m_debuginfo/priv_image.h
+@@ -115,6 +115,10 @@ Int ML_(img_strcmp)(DiImage* img, DiOffT off1, DiOffT off2);
+    cast to HChar before comparison. */
+ Int ML_(img_strcmp_c)(DiImage* img, DiOffT off1, const HChar* str2);
+ 
++/* Do strncmp of a C string in the image vs a normal one.  Chars are
++   cast to HChar before comparison. */
++Int ML_(img_strcmp_n)(DiImage* img, DiOffT off1, const HChar* str2, Word n);
++
+ /* Do strlen of a C string in the image. */
+ SizeT ML_(img_strlen)(DiImage* img, DiOffT off);
+ 
+diff --git a/coregrind/m_debuginfo/readelf.c b/coregrind/m_debuginfo/readelf.c
+index fb64ed976..46f8c8343 100644
+--- a/coregrind/m_debuginfo/readelf.c
++++ b/coregrind/m_debuginfo/readelf.c
+@@ -2501,8 +2501,7 @@ Bool ML_(read_elf_object) ( struct _DebugInfo* di )
+             di->rodata_avma += inrw1->bias;
+             di->rodata_bias = inrw1->bias;
+             di->rodata_debug_bias = inrw1->bias;
+-         }
+-         else {
++         } else {
+             BAD(".rodata");  /* should not happen? */
+          }
+          di->rodata_present = True;
+@@ -2977,6 +2976,46 @@ Bool ML_(read_elf_object) ( struct _DebugInfo* di )
+    return retval;
+ }
+ 
++static void find_rodata(Word i, Word shnum, DiImage* dimg, struct _DebugInfo* di, DiOffT shdr_dioff,
++                        UWord shdr_dent_szB, DiOffT shdr_strtab_dioff, PtrdiffT rw_dbias)
++{
++   ElfXX_Shdr a_shdr;
++   ElfXX_Shdr a_extra_shdr;
++   ML_(img_get)(&a_shdr, dimg,
++                INDEX_BIS(shdr_dioff, i, shdr_dent_szB),
++                sizeof(a_shdr));
++   if (di->rodata_present &&
++       0 == ML_(img_strcmp_c)(dimg, shdr_strtab_dioff
++                                    + a_shdr.sh_name, ".rodata")) {
++      Word sh_size = a_shdr.sh_size;
++      Word j;
++      Word next_addr = a_shdr.sh_addr + a_shdr.sh_size;
++      for (j = i  + 1; j < shnum; ++j) {
++         ML_(img_get)(&a_extra_shdr, dimg,
++                      INDEX_BIS(shdr_dioff, j, shdr_dent_szB),
++                      sizeof(a_shdr));
++         if (0 == ML_(img_strcmp_n)(dimg, shdr_strtab_dioff
++                                             + a_extra_shdr.sh_name, ".rodata", 7)) {
++            if (a_extra_shdr.sh_addr ==
++                VG_ROUNDUP(next_addr, a_extra_shdr.sh_addralign)) {
++               sh_size = VG_ROUNDUP(sh_size, a_extra_shdr.sh_addralign) + a_extra_shdr.sh_size;
++            }
++            next_addr = a_extra_shdr.sh_addr + a_extra_shdr.sh_size;
++         } else {
++            break;
++         }
++      }
++      vg_assert(di->rodata_size == sh_size);
++      vg_assert(di->rodata_avma +  a_shdr.sh_addr + rw_dbias);
++      di->rodata_debug_svma = a_shdr.sh_addr;
++      di->rodata_debug_bias = di->rodata_bias +
++                             di->rodata_svma - di->rodata_debug_svma;
++      TRACE_SYMTAB("acquiring .rodata  debug svma = %#lx .. %#lx\n",
++                   di->rodata_debug_svma,
++                   di->rodata_debug_svma + di->rodata_size - 1);
++      TRACE_SYMTAB("acquiring .rodata debug bias = %#lx\n", (UWord)di->rodata_debug_bias);
++   }
++}
+ Bool ML_(read_elf_debug) ( struct _DebugInfo* di )
+ {
+    Word     i, j;
+@@ -3391,7 +3430,11 @@ Bool ML_(read_elf_debug) ( struct _DebugInfo* di )
+             FIND(text,   rx)
+             FIND(data,   rw)
+             FIND(sdata,  rw)
+-            FIND(rodata, rw)
++            // https://bugs.kde.org/show_bug.cgi?id=476548
++            // special handling for rodata as adjacent
++            // rodata sections may have been merged in ML_(read_elf_object)
++            //FIND(rodata, rw)
++            find_rodata(i, ehdr_dimg.e_shnum, dimg, di, shdr_dioff, shdr_dent_szB, shdr_strtab_dioff, rw_dbias);
+             FIND(bss,    rw)
+             FIND(sbss,   rw)
+ 
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0003-Add-fchmodat2-syscall-on-linux.patch b/meta/recipes-devtools/valgrind/valgrind/0003-Add-fchmodat2-syscall-on-linux.patch
new file mode 100644
index 00000000000..2a09ca52b77
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0003-Add-fchmodat2-syscall-on-linux.patch
@@ -0,0 +1,221 @@
+From a43e62dddcf51ec6578a90c5988a41e856b44b05 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sat, 18 Nov 2023 21:17:02 +0100
+Subject: [PATCH 3/4] Add fchmodat2 syscall on linux
+
+fchmodat2 is a new syscall on linux 6.6. It is a variant of fchmodat
+that takes an extra flags argument.
+
+https://bugs.kde.org/show_bug.cgi?id=477198
+
+(cherry picked from commit 372d09fd9a8d76847c81092ebff71c80fd6c145d)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=valgrind.git;a=commit;h=a43e62dddcf51ec6578a90c5988a41e856b44b05]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ NEWS                                         |  1 +
+ coregrind/m_syswrap/priv_syswrap-linux.h     |  3 +++
+ coregrind/m_syswrap/syswrap-amd64-linux.c    |  2 ++
+ coregrind/m_syswrap/syswrap-arm-linux.c      |  2 ++
+ coregrind/m_syswrap/syswrap-arm64-linux.c    |  2 ++
+ coregrind/m_syswrap/syswrap-linux.c          | 11 +++++++++++
+ coregrind/m_syswrap/syswrap-mips32-linux.c   |  2 ++
+ coregrind/m_syswrap/syswrap-mips64-linux.c   |  1 +
+ coregrind/m_syswrap/syswrap-nanomips-linux.c |  1 +
+ coregrind/m_syswrap/syswrap-ppc32-linux.c    |  2 ++
+ coregrind/m_syswrap/syswrap-ppc64-linux.c    |  2 ++
+ coregrind/m_syswrap/syswrap-s390x-linux.c    |  2 ++
+ coregrind/m_syswrap/syswrap-x86-linux.c      |  2 ++
+ include/vki/vki-scnums-shared-linux.h        |  2 ++
+ 14 files changed, 35 insertions(+)
+
+diff --git a/NEWS b/NEWS
+index 6cd13429a..da0f8c1aa 100644
+--- a/NEWS
++++ b/NEWS
+@@ -8,6 +8,7 @@ The following bugs have been fixed or resolved on this branch.
+ 476548  valgrind 3.22.0 fails on assertion when loading debuginfo
+         file produced by mold
+ 476708  valgrind-monitor.py regular expressions should use raw strings
++477198  Add fchmodat2 syscall on linux
+ 
+ To see details of a given bug, visit
+   https://bugs.kde.org/show_bug.cgi?id=XXXXXX
+diff --git a/coregrind/m_syswrap/priv_syswrap-linux.h b/coregrind/m_syswrap/priv_syswrap-linux.h
+index 7c9decf5a..798c456c9 100644
+--- a/coregrind/m_syswrap/priv_syswrap-linux.h
++++ b/coregrind/m_syswrap/priv_syswrap-linux.h
+@@ -331,6 +331,9 @@ DECL_TEMPLATE(linux, sys_openat2);
+ // Linux-specific (new in Linux 5.14)
+ DECL_TEMPLATE(linux, sys_memfd_secret);
+ 
++// Since Linux 6.6
++DECL_TEMPLATE(linux, sys_fchmodat2);
++
+ /* ---------------------------------------------------------------------
+    Wrappers for sockets and ipc-ery.  These are split into standalone
+    procedures because x86-linux hides them inside multiplexors
+diff --git a/coregrind/m_syswrap/syswrap-amd64-linux.c b/coregrind/m_syswrap/syswrap-amd64-linux.c
+index 008600798..fe17d118b 100644
+--- a/coregrind/m_syswrap/syswrap-amd64-linux.c
++++ b/coregrind/m_syswrap/syswrap-amd64-linux.c
+@@ -886,6 +886,8 @@ static SyscallTableEntry syscall_table[] = {
+    LINXY(__NR_epoll_pwait2,      sys_epoll_pwait2),      // 441
+ 
+    LINXY(__NR_memfd_secret,      sys_memfd_secret),      // 447
++
++   LINX_(__NR_fchmodat2,         sys_fchmodat2),         // 452
+ };
+ 
+ SyscallTableEntry* ML_(get_linux_syscall_entry) ( UInt sysno )
+diff --git a/coregrind/m_syswrap/syswrap-arm-linux.c b/coregrind/m_syswrap/syswrap-arm-linux.c
+index 9a7a1e0d2..811931d3b 100644
+--- a/coregrind/m_syswrap/syswrap-arm-linux.c
++++ b/coregrind/m_syswrap/syswrap-arm-linux.c
+@@ -1059,6 +1059,8 @@ static SyscallTableEntry syscall_main_table[] = {
+    LINX_(__NR_faccessat2,    sys_faccessat2),           // 439
+ 
+    LINXY(__NR_epoll_pwait2,      sys_epoll_pwait2),      // 441
++
++   LINX_(__NR_fchmodat2,         sys_fchmodat2),         // 452
+ };
+ 
+ 
+diff --git a/coregrind/m_syswrap/syswrap-arm64-linux.c b/coregrind/m_syswrap/syswrap-arm64-linux.c
+index 6af7bab83..3307bc2ca 100644
+--- a/coregrind/m_syswrap/syswrap-arm64-linux.c
++++ b/coregrind/m_syswrap/syswrap-arm64-linux.c
+@@ -840,6 +840,8 @@ static SyscallTableEntry syscall_main_table[] = {
+    LINXY(__NR_epoll_pwait2,      sys_epoll_pwait2),      // 441
+ 
+    LINXY(__NR_memfd_secret,      sys_memfd_secret),      // 447
++
++   LINX_(__NR_fchmodat2,         sys_fchmodat2),         // 452
+ };
+ 
+ 
+diff --git a/coregrind/m_syswrap/syswrap-linux.c b/coregrind/m_syswrap/syswrap-linux.c
+index d571fc327..efa47f2e6 100644
+--- a/coregrind/m_syswrap/syswrap-linux.c
++++ b/coregrind/m_syswrap/syswrap-linux.c
+@@ -6059,6 +6059,17 @@ PRE(sys_fchmodat)
+    PRE_MEM_RASCIIZ( "fchmodat(path)", ARG2 );
+ }
+ 
++PRE(sys_fchmodat2)
++{
++   PRINT("sys_fchmodat2 ( %ld, %#" FMT_REGWORD "x(%s), %" FMT_REGWORD "u, %"
++	  FMT_REGWORD "u )",
++         SARG1, ARG2, (HChar*)(Addr)ARG2, ARG3, ARG4);
++   PRE_REG_READ4(long, "fchmodat2",
++                 int, dfd, const char *, path, vki_mode_t, mode,
++                 unsigned int, flags);
++   PRE_MEM_RASCIIZ( "fchmodat2(pathname)", ARG2 );
++}
++
+ PRE(sys_faccessat)
+ {
+    PRINT("sys_faccessat ( %ld, %#" FMT_REGWORD "x(%s), %ld )",
+diff --git a/coregrind/m_syswrap/syswrap-mips32-linux.c b/coregrind/m_syswrap/syswrap-mips32-linux.c
+index 6268a00dd..74a1f6eac 100644
+--- a/coregrind/m_syswrap/syswrap-mips32-linux.c
++++ b/coregrind/m_syswrap/syswrap-mips32-linux.c
+@@ -1143,6 +1143,8 @@ static SyscallTableEntry syscall_main_table[] = {
+    LINX_ (__NR_faccessat2,             sys_faccessat2),              // 439
+ 
+    LINXY(__NR_epoll_pwait2,      sys_epoll_pwait2),      // 441
++
++   LINX_(__NR_fchmodat2,               sys_fchmodat2),               // 452
+ };
+ 
+ SyscallTableEntry* ML_(get_linux_syscall_entry) (UInt sysno)
+diff --git a/coregrind/m_syswrap/syswrap-mips64-linux.c b/coregrind/m_syswrap/syswrap-mips64-linux.c
+index 6cdf25893..4e8508b7a 100644
+--- a/coregrind/m_syswrap/syswrap-mips64-linux.c
++++ b/coregrind/m_syswrap/syswrap-mips64-linux.c
+@@ -820,6 +820,7 @@ static SyscallTableEntry syscall_main_table[] = {
+    LINXY (__NR_close_range, sys_close_range),
+    LINX_ (__NR_faccessat2, sys_faccessat2),
+    LINXY(__NR_epoll_pwait2, sys_epoll_pwait2),
++   LINX_ (__NR_fchmodat2, sys_fchmodat2),
+ };
+ 
+ SyscallTableEntry * ML_(get_linux_syscall_entry) ( UInt sysno )
+diff --git a/coregrind/m_syswrap/syswrap-nanomips-linux.c b/coregrind/m_syswrap/syswrap-nanomips-linux.c
+index d724cde74..7859900c1 100644
+--- a/coregrind/m_syswrap/syswrap-nanomips-linux.c
++++ b/coregrind/m_syswrap/syswrap-nanomips-linux.c
+@@ -829,6 +829,7 @@ static SyscallTableEntry syscall_main_table[] = {
+    LINXY (__NR_close_range,            sys_close_range),
+    LINX_ (__NR_faccessat2,             sys_faccessat2),
+    LINXY (__NR_epoll_pwait2,           sys_epoll_pwait2),
++   LINX_ (__NR_fchmodat2,              sys_fchmodat2),
+ };
+ 
+ SyscallTableEntry* ML_(get_linux_syscall_entry) (UInt sysno)
+diff --git a/coregrind/m_syswrap/syswrap-ppc32-linux.c b/coregrind/m_syswrap/syswrap-ppc32-linux.c
+index c0cfef235..1e19116ee 100644
+--- a/coregrind/m_syswrap/syswrap-ppc32-linux.c
++++ b/coregrind/m_syswrap/syswrap-ppc32-linux.c
+@@ -1063,6 +1063,8 @@ static SyscallTableEntry syscall_table[] = {
+    LINX_(__NR_faccessat2,        sys_faccessat2),       // 439
+ 
+    LINXY (__NR_epoll_pwait2,     sys_epoll_pwait2),      // 441
++
++   LINX_ (__NR_fchmodat2,        sys_fchmodat2),         // 452
+ };
+ 
+ SyscallTableEntry* ML_(get_linux_syscall_entry) ( UInt sysno )
+diff --git a/coregrind/m_syswrap/syswrap-ppc64-linux.c b/coregrind/m_syswrap/syswrap-ppc64-linux.c
+index f5976f30c..1097212a4 100644
+--- a/coregrind/m_syswrap/syswrap-ppc64-linux.c
++++ b/coregrind/m_syswrap/syswrap-ppc64-linux.c
+@@ -1032,6 +1032,8 @@ static SyscallTableEntry syscall_table[] = {
+    LINX_(__NR_faccessat2,        sys_faccessat2),       // 439
+ 
+    LINXY (__NR_epoll_pwait2,     sys_epoll_pwait2),      // 441
++
++   LINX_ (__NR_fchmodat2,        sys_fchmodat2),         // 452
+ };
+ 
+ SyscallTableEntry* ML_(get_linux_syscall_entry) ( UInt sysno )
+diff --git a/coregrind/m_syswrap/syswrap-s390x-linux.c b/coregrind/m_syswrap/syswrap-s390x-linux.c
+index afba154e7..3588672c7 100644
+--- a/coregrind/m_syswrap/syswrap-s390x-linux.c
++++ b/coregrind/m_syswrap/syswrap-s390x-linux.c
+@@ -873,6 +873,8 @@ static SyscallTableEntry syscall_table[] = {
+    LINX_(__NR_faccessat2,  sys_faccessat2),                           // 439
+ 
+    LINXY(__NR_epoll_pwait2, sys_epoll_pwait2),                        // 441
++
++   LINX_ (__NR_fchmodat2, sys_fchmodat2),                             // 452
+ };
+ 
+ SyscallTableEntry* ML_(get_linux_syscall_entry) ( UInt sysno )
+diff --git a/coregrind/m_syswrap/syswrap-x86-linux.c b/coregrind/m_syswrap/syswrap-x86-linux.c
+index da4fd8fa2..58badc6b0 100644
+--- a/coregrind/m_syswrap/syswrap-x86-linux.c
++++ b/coregrind/m_syswrap/syswrap-x86-linux.c
+@@ -1658,6 +1658,8 @@ static SyscallTableEntry syscall_table[] = {
+    LINXY(__NR_epoll_pwait2,      sys_epoll_pwait2),     // 441
+ 
+    LINXY(__NR_memfd_secret,      sys_memfd_secret),      // 447
++
++   LINX_(__NR_fchmodat2,         sys_fchmodat2),         // 452
+ };
+ 
+ SyscallTableEntry* ML_(get_linux_syscall_entry) ( UInt sysno )
+diff --git a/include/vki/vki-scnums-shared-linux.h b/include/vki/vki-scnums-shared-linux.h
+index 542382b53..a4cd87149 100644
+--- a/include/vki/vki-scnums-shared-linux.h
++++ b/include/vki/vki-scnums-shared-linux.h
+@@ -50,4 +50,6 @@
+ 
+ #define __NR_memfd_secret		447
+ 
++#define __NR_fchmodat2		452
++
+ #endif
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0004-Bug-478624-Valgrind-incompatibility-with-binutils-2..patch b/meta/recipes-devtools/valgrind/valgrind/0004-Bug-478624-Valgrind-incompatibility-with-binutils-2..patch
new file mode 100644
index 00000000000..4e9185508a5
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0004-Bug-478624-Valgrind-incompatibility-with-binutils-2..patch
@@ -0,0 +1,137 @@
+From 41ff9aa49f6c54c66d0e6b37f265fd9cb0176057 Mon Sep 17 00:00:00 2001
+From: Paul Floyd <pjfloyd@wanadoo.fr>
+Date: Sun, 17 Dec 2023 14:18:51 +0100
+Subject: [PATCH 4/4] Bug 478624 - Valgrind incompatibility with binutils-2.42
+ on x86 with new nop patterns (unhandled instruction bytes: 0x2E 0x8D 0xB4
+ 0x26)
+
+It was a bit of a struggle to get the testcase to build
+with both clang and gcc (oddly enough gcc was more difficult) so
+I just resorted to using .byte arrays.
+
+(cherry picked from commit d35005cef8ad8207542738812705ceabf137d7e0)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=valgrind.git;a=commit;h=41ff9aa49f6c54c66d0e6b37f265fd9cb0176057]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .gitignore                                 |  1 +
+ NEWS                                       |  2 ++
+ VEX/priv/guest_x86_toIR.c                  | 22 +++++++++++++-
+ none/tests/x86/Makefile.am                 |  2 ++
+ none/tests/x86/gnu_binutils_nop.c          | 34 ++++++++++++++++++++++
+ none/tests/x86/gnu_binutils_nop.stderr.exp |  0
+ none/tests/x86/gnu_binutils_nop.vgtest     |  2 ++
+ 7 files changed, 62 insertions(+), 1 deletion(-)
+ create mode 100644 none/tests/x86/gnu_binutils_nop.c
+ create mode 100644 none/tests/x86/gnu_binutils_nop.stderr.exp
+ create mode 100644 none/tests/x86/gnu_binutils_nop.vgtest
+
+--- a/NEWS
++++ b/NEWS
+@@ -9,6 +9,8 @@ The following bugs have been fixed or re
+         file produced by mold
+ 476708  valgrind-monitor.py regular expressions should use raw strings
+ 477198  Add fchmodat2 syscall on linux
++478624  Valgrind incompatibility with binutils-2.42 on x86 with new nop patterns
++        (unhandled instruction bytes: 0x2E 0x8D 0xB4 0x26)
+ 
+ To see details of a given bug, visit
+   https://bugs.kde.org/show_bug.cgi?id=XXXXXX
+--- a/VEX/priv/guest_x86_toIR.c
++++ b/VEX/priv/guest_x86_toIR.c
+@@ -8198,7 +8198,7 @@ DisResult disInstr_X86_WRK (
+          delta += 5;
+          goto decode_success;
+       }
+-      /* Don't barf on recent binutils padding,
++      /* Don't barf on recent (2010) binutils padding,
+          all variants of which are: nopw %cs:0x0(%eax,%eax,1)
+          66 2e 0f 1f 84 00 00 00 00 00
+          66 66 2e 0f 1f 84 00 00 00 00 00
+@@ -8222,6 +8222,26 @@ DisResult disInstr_X86_WRK (
+             goto decode_success;
+          }
+       }
++
++      /* bug478624 GNU binutils uses a leal of esi into itself with
++         a zero offset and CS prefix as an 8 byte no-op (Dec 2023).
++         Since the CS prefix is hardly ever used we don't do much
++         to decode it, just a few cases for conditional branches.
++         So add handling here with other pseudo-no-ops.
++       */
++      if (code[0] == 0x2E && code[1] == 0x8D) {
++         if (code[2] == 0x74 && code[3] == 0x26 && code[4] == 0x00) {
++            DIP("leal %%cs:0(%%esi,%%eiz,1),%%esi\n");
++            delta += 5;
++            goto decode_success;
++         }
++         if (code[2] == 0xB4 && code[3] == 0x26 && code[4] == 0x00
++             && code[5] == 0x00 && code[6] == 0x00 && code[7] == 0x00) {
++            DIP("leal %%cs:0(%%esi,%%eiz,1),%%esi\n");
++            delta += 8;
++            goto decode_success;
++         }
++      }
+ 
+       // Intel CET requires the following opcodes to be treated as NOPs
+       // with any prefix and ModRM, SIB and disp combination:
+--- a/none/tests/x86/Makefile.am
++++ b/none/tests/x86/Makefile.am
+@@ -52,6 +52,7 @@ EXTRA_DIST = \
+ 	fxtract.stdout.exp fxtract.stderr.exp fxtract.vgtest \
+ 	fxtract.stdout.exp-older-glibc \
+ 	getseg.stdout.exp getseg.stderr.exp getseg.vgtest \
++	gnu_binutils_nop.stderr.exp gnu_binutils_nop.vgtest \
+ 	incdec_alt.stdout.exp incdec_alt.stderr.exp incdec_alt.vgtest \
+ 	int.stderr.exp int.stdout.exp int.disabled \
+ 	$(addsuffix .stderr.exp,$(INSN_TESTS)) \
+@@ -100,6 +101,7 @@ check_PROGRAMS = \
+ 	fpu_lazy_eflags \
+ 	fxtract \
+ 	getseg \
++	gnu_binutils_nop \
+ 	incdec_alt \
+ 	$(INSN_TESTS) \
+ 	int \
+--- /dev/null
++++ b/none/tests/x86/gnu_binutils_nop.c
+@@ -0,0 +1,34 @@
++int main(void)
++{
++    // GNU binutils uses various opcodes as alternatives for nop
++    // the idea is that it is faster to execute one large opcode
++    // with no side-effects than multiple repetitions of the
++    // single byte 'nop'. This gives more choice when code
++    // needs to be padded.
++   
++   // the following is based on
++   // https://sourceware.org/cgit/binutils-gdb/tree/gas/config/tc-i386.c#n1256
++
++    // one byte
++    __asm__ __volatile__("nop");
++    // two bytes
++    __asm__ __volatile__("xchg %ax,%ax");
++    // three bytes
++    //__asm__ __volatile__("leal 0(%esi),%esi");
++    __asm__ __volatile__(".byte 0x8d,0x76,0x00");
++    // four bytes
++    //__asm__ __volatile__("leal 0(%esi,%eiz),%esi");
++    __asm__ __volatile__(".byte 0x8d,0x74,0x26,0x00");
++    // five bytes
++    //__asm__ __volatile__("leal %cs:0(%esi,%eiz),%esi");
++    __asm__ __volatile__(".byte 0x2e,0x8d,0x74,0x26,0x00");
++    // six bytes
++    //__asm__ __volatile__("leal 0L(%esi),%esi");
++    __asm__ __volatile__(".byte 0x8d,0xb6,0x00,0x00,0x00,0x00");
++    // seven bytes
++    //__asm__ __volatile__("leal 0L(%esi,%eiz),%esi");
++    __asm__ __volatile__(".byte 0x8d,0xb4,0x26,0x00,0x00,0x00,0x00");
++    // eight bytes
++    //__asm__ __volatile__("leal %cs:0L(%esi,%eiz),%esi");
++    __asm__ __volatile__(".byte 0x2e,0x8d,0xb4,0x26,0x00,0x00,0x00,0x00");
++}
+--- /dev/null
++++ b/none/tests/x86/gnu_binutils_nop.vgtest
+@@ -0,0 +1,2 @@
++prog: gnu_binutils_nop
++vgopts: -q
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
index 74ac7ec9d5c..563d99f0e22 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
@@ -33,6 +33,10 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-docs-Disable-manual-validation.patch \
+           file://0001-valgrind-monitor.py-regular-expressions-should-use-r.patch \
+           file://0002-Bug-476548-valgrind-3.22.0-fails-on-assertion-when-l.patch \
+           file://0003-Add-fchmodat2-syscall-on-linux.patch \
+           file://0004-Bug-478624-Valgrind-incompatibility-with-binutils-2..patch \
            "
 SRC_URI[sha256sum] = "c811db5add2c5f729944caf47c4e7a65dcaabb9461e472b578765dd7bf6d2d4c"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.44.0


