Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.16219.1606022960162535275
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2020 21:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sID+9RaF;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id b6so1379256pfp.7
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2020 21:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ajxILRPUKaGyijdzLtoeQfTnIXzKmm9ZNY5m+60IQs=;
        b=sID+9RaFPZhC+2iPN5AyCc3uQ8TF3UPMBfoiLvJQ6EhWzZ6VbTu/LvwQ+nQOacNpOM
         hSMGk9QstIVSfYNG4ErMnJFxkEOLmdUea98NwpJtbAVGJ+XWGxvvCfpMaEvP4E5xoCWZ
         4Udw2zq0oWFcIX0eK2LMuBRkrHTfruJDCJIEq6rk6QKY0kqgdF6Bpex8dwKNrG6fdr+o
         CYaOBCPu9tBe64BJBl7LOzVLiFb436kmHOeUwf8YATt/nvVujVGLp2bbJ3Ych7p0ZY1s
         rE/MifMZnJ1HIap4yQeJIrxWruaQ4UEFpsrty2YqmkFNhQXk2FBM4t1XjFrzsigeyQN/
         N3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ajxILRPUKaGyijdzLtoeQfTnIXzKmm9ZNY5m+60IQs=;
        b=R+EU08drwm2xGQ8AeTDMTfR4t+A7rYYYob8eynXubynyqagXrLuvvJa8P5nJFymhOP
         jCLJG0NAgVIdGSfvs1+gI7Jo9hB6AD7Wa4ytmTDD8C7aPpQsSWCcDRXBPITkTRlaAhcw
         W/YuIt2s8OlLqLQPgPdJkY2M8l3K98qoXxLwnmmet1kkM5bb5GZET4EbVN+je80wE+RB
         t5cojQ2cWrEEM1Cwn2sZ4TJvyVvTLWqJjPxwRPULLBibrqgbGDgcmgqQAK8RTFiBPZFQ
         atu7Y9XYBS6HhVAqbiC1CsicJdJ+r4JIwd2sm7WFSpOMr7AoVowo0+gfOR8leUFKTjAi
         lAcw==
X-Gm-Message-State: AOAM532PGz9sYzL1BV7lEtZZk+vDJPR1gY7NwdVJCdo8cWYxtswUGTeP
	saNCAKzMS7sAosKHNZrL6RLwciXFgFlquA==
X-Google-Smtp-Source: ABdhPJzZuWOkqLRZ2wOvtq2Gizb5vwcyw88y1Lgr6hxKqFqBCacBR6vyrjHqOmzQt5UXwWqgEMdDgw==
X-Received: by 2002:a63:2253:: with SMTP id t19mr1883538pgm.400.1606022959201;
        Sat, 21 Nov 2020 21:29:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id h10sm9608412pjm.47.2020.11.21.21.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 21:29:18 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Fix linker errors on chromium/ffmpeg on aarch64
Date: Sat, 21 Nov 2020 21:29:15 -0800
Message-Id: <20201122052915.3828020-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ffmpeg in qtwebengine/chromium fails to build on aarch64

ffmpeg/ffmpeg_internal/videodsp.o: in function `ff_prefetch_aarch64':
(.text+0x10): relocation truncated to fit: R_AARCH64_CONDBR19 against symbol `ff_prefetch_aarch64' defined in .text section in obj/third_party/ffmpeg/ffmpeg_internal/videodsp.o

Backport an upstream fix to handle this error which is a regrression in
binutils 2.35

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../binutils/binutils-2.35.inc                |   1 +
 ...n-error-on-conditional-branch-to-an-.patch | 135 ++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-aarch64-Return-an-error-on-conditional-branch-to-an-.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.35.inc b/meta/recipes-devtools/binutils/binutils-2.35.inc
index bc9107b084..aa02063b19 100644
--- a/meta/recipes-devtools/binutils/binutils-2.35.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.35.inc
@@ -42,5 +42,6 @@ SRC_URI = "\
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
      file://0017-gas-improve-reproducibility-for-stabs-debugging-data.patch \
+     file://0001-aarch64-Return-an-error-on-conditional-branch-to-an-.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0001-aarch64-Return-an-error-on-conditional-branch-to-an-.patch b/meta/recipes-devtools/binutils/binutils/0001-aarch64-Return-an-error-on-conditional-branch-to-an-.patch
new file mode 100644
index 0000000000..f46ddab415
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-aarch64-Return-an-error-on-conditional-branch-to-an-.patch
@@ -0,0 +1,135 @@
+From c7cd291722779c9d4703ed0010388fe394c644c8 Mon Sep 17 00:00:00 2001
+From: Siddhesh Poyarekar <siddesh.poyarekar@arm.com>
+Date: Tue, 1 Sep 2020 14:25:52 +0530
+Subject: [PATCH] aarch64: Return an error on conditional branch to an undefined symbol
+
+The fix in 7e05773767820b441b23a16628b55c98cb1aef46 introduced a PLT
+for conditional jumps when the target symbol is undefined.  This is
+incorrect because conditional branch relocations are not allowed to
+clobber IP0/IP1 and hence, should not result in a dynamic relocation.
+
+Revert that change and in its place, issue an error when the target
+symbol is undefined.
+
+bfd/
+
+	2020-09-10  Siddhesh Poyarekar  <siddesh.poyarekar@arm.com>
+
+	* elfnn-aarch64.c (elfNN_aarch64_final_link_relocate): Revert
+	changes in 7e05773767820b441b23a16628b55c98cb1aef46.  Set
+	error for undefined symbol in BFD_RELOC_AARCH64_BRANCH19 and
+	BFD_RELOC_AARCH64_TSTBR14 relocations.
+
+ld/
+
+	2020-09-10  Siddhesh Poyarekar  <siddesh.poyarekar@arm.com>
+
+	* testsuite/ld-aarch64/emit-relocs-560.d: Expect error instead
+	of valid output.
+---
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c7cd291722779c9d4703ed0010388fe394c644c8]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ bfd/ChangeLog                             |  7 +++++
+ bfd/elfnn-aarch64.c                       | 37 ++++++++++++-----------
+ ld/ChangeLog                              |  5 +++
+ ld/testsuite/ld-aarch64/emit-relocs-560.d |  7 +----
+ 4 files changed, 32 insertions(+), 24 deletions(-)
+
+diff --git a/bfd/elfnn-aarch64.c b/bfd/elfnn-aarch64.c
+index 5b4c189b593..a9924e7ec56 100644
+--- a/bfd/elfnn-aarch64.c
++++ b/bfd/elfnn-aarch64.c
+@@ -5447,7 +5447,6 @@ elfNN_aarch64_final_link_relocate (reloc_howto_type *howto,
+   bfd_vma orig_value = value;
+   bfd_boolean resolved_to_zero;
+   bfd_boolean abs_symbol_p;
+-  bfd_boolean via_plt_p;
+ 
+   globals = elf_aarch64_hash_table (info);
+ 
+@@ -5469,8 +5468,6 @@ elfNN_aarch64_final_link_relocate (reloc_howto_type *howto,
+ 		  : bfd_is_und_section (sym_sec));
+   abs_symbol_p = h != NULL && bfd_is_abs_symbol (&h->root);
+ 
+-  via_plt_p = (globals->root.splt != NULL && h != NULL
+-	       && h->plt.offset != (bfd_vma) - 1);
+ 
+   /* Since STT_GNU_IFUNC symbol must go through PLT, we handle
+      it here if it is defined in a non-shared object.  */
+@@ -5806,23 +5803,12 @@ elfNN_aarch64_final_link_relocate (reloc_howto_type *howto,
+ 	value += signed_addend;
+       break;
+ 
+-    case BFD_RELOC_AARCH64_BRANCH19:
+-    case BFD_RELOC_AARCH64_TSTBR14:
+-      /* A conditional branch to an undefined weak symbol is converted to a
+-	 branch to itself.  */
+-      if (weak_undef_p && !via_plt_p)
+-	{
+-	  value = _bfd_aarch64_elf_resolve_relocation (input_bfd, bfd_r_type,
+-						       place, value,
+-						       signed_addend,
+-						       weak_undef_p);
+-	  break;
+-	}
+-      /* Fall through.  */
+     case BFD_RELOC_AARCH64_CALL26:
+     case BFD_RELOC_AARCH64_JUMP26:
+       {
+ 	asection *splt = globals->root.splt;
++	bfd_boolean via_plt_p =
++	  splt != NULL && h != NULL && h->plt.offset != (bfd_vma) - 1;
+ 
+ 	/* A call to an undefined weak symbol is converted to a jump to
+ 	   the next instruction unless a PLT entry will be created.
+@@ -5903,6 +5889,23 @@ elfNN_aarch64_final_link_relocate (reloc_howto_type *howto,
+ 	  bfd_set_error (bfd_error_bad_value);
+ 	  return bfd_reloc_notsupported;
+ 	}
++      value = _bfd_aarch64_elf_resolve_relocation (input_bfd, bfd_r_type,
++						   place, value,
++						   signed_addend,
++						   weak_undef_p);
++      break;
++
++    case BFD_RELOC_AARCH64_BRANCH19:
++    case BFD_RELOC_AARCH64_TSTBR14:
++      if (h && h->root.type == bfd_link_hash_undefined)
++	{
++	  _bfd_error_handler
++	    /* xgettext:c-format */
++	    (_("%pB: conditional branch to undefined symbol `%s' "
++	       "not allowed"), input_bfd, h->root.root.string);
++	  bfd_set_error (bfd_error_bad_value);
++	  return bfd_reloc_notsupported;
++	}
+       /* Fall through.  */
+ 
+     case BFD_RELOC_AARCH64_16:
+@@ -7968,8 +7971,6 @@ elfNN_aarch64_check_relocs (bfd *abfd, struct bfd_link_info *info,
+ 	    break;
+ 	  }
+ 
+-	case BFD_RELOC_AARCH64_BRANCH19:
+-	case BFD_RELOC_AARCH64_TSTBR14:
+ 	case BFD_RELOC_AARCH64_CALL26:
+ 	case BFD_RELOC_AARCH64_JUMP26:
+ 	  /* If this is a local symbol then we resolve it
+diff --git a/ld/testsuite/ld-aarch64/emit-relocs-560.d b/ld/testsuite/ld-aarch64/emit-relocs-560.d
+index 153532457b4..8751b743bd4 100644
+--- a/ld/testsuite/ld-aarch64/emit-relocs-560.d
++++ b/ld/testsuite/ld-aarch64/emit-relocs-560.d
+@@ -1,8 +1,3 @@
+ #source: emit-relocs-560.s
+ #ld: -shared
+-#readelf: -r
+-
+-Relocation section '.rela.plt' at offset 0x[0-9a-f]+ contains 2 entries:
+-  Offset          Info           Type           Sym. Value    Sym. Name \+ Addend
+-[0-9a-f]+  000100000402 R_AARCH64_JUMP_SL 0000000000000000 baz \+ 0
+-[0-9a-f]+  000200000402 R_AARCH64_JUMP_SL 0000000000000000 bar \+ 0
++#error: .*: conditional branch to undefined symbol `bar' not allowed
+-- 
+2.29.2
+
-- 
2.29.2

