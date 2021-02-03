Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.3055.1612316203734727134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 17:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y7VoCFtI;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id y10so9288757plk.7
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 17:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sEP7MpyKB2BMNz7SCvIWnEZr9Z0iQjllLNavTqzTsqY=;
        b=Y7VoCFtIVP4vqtLRgtfA3O+J1BuCoasD9QbdrXLC3TU8/U8Ga2w4YHhRsQXB1O2++Q
         3UYWy7K9hrAHMbp07bHg0KwVMOBPK5j4n8burYNHsT4Yhxzq/3iAnDeOp6c5mrDjMuOR
         lBxhXUJ5EmHwnJQfpXiMWGnOraZblvRdEyRLCCArMw2rWbmk994Rs5YWnKpZKKT23Dzq
         SodbF7aILRE1HEHvJrNMCkfagOGLL4jgVFwsrh4/njkxFLdm9uH3DzocDIdYmWRCYBhe
         2PKvHmYosjdniXxCTNw52EQldgxZfMLc+BUc0IsPLBvXyL6GoKOQA3/TDMZSzgJX3xQy
         ybzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sEP7MpyKB2BMNz7SCvIWnEZr9Z0iQjllLNavTqzTsqY=;
        b=QiTz/u3hmbWIiPiMxtOG4nSJBGBY3vqLjGdF8pbY7ByhdR6UuKwMyiJ7OVtXf1m18W
         +RdYohDUtwdcn0a9rrgfzpqPDzbb6Ue58uQUzYZI2dzMal4ZSHTlks6w6ksP7/gm4olg
         /EtLm4leWMsAphP6RT7tzfAYAP56i/A9H1kJl1T/aeg70QWcK+AwW7lSjSxKqM9Ee6il
         TZ5/0v7Gx+FzgZs7gtRTmBE1alwIt9XNoMaoFxPanv1bhS3g/t/3q/Dxa6T+J8AcNNE0
         3JwSiXXJvPmvglbIoJ1P1CdGCdrn8Tvl3C3ktVhexFSFPg799P0olMj4ILeOanbnsIj1
         or+Q==
X-Gm-Message-State: AOAM530lI/3hs1XCt0/UU6UDYlrNea1Xd9gJH3F3737QAekoRtsT2Bif
	YHuAN+CdBHyX4W57sj/JVgE3TlHsGgFKOQ==
X-Google-Smtp-Source: ABdhPJy28kcPnD7jGHVKencMEWeaSddiCUc2pvCxnzoLVotxyLfY/pLhIGd/eK/4HU5LEPHj3iHd4w==
X-Received: by 2002:a17:90a:8b15:: with SMTP id y21mr674982pjn.82.1612316202804;
        Tue, 02 Feb 2021 17:36:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9296])
        by smtp.gmail.com with ESMTPSA id d14sm214013pfo.156.2021.02.02.17.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 17:36:42 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [v2 5/5] linux-yocto-5.10: Backport couple of patches for binutils 2.36 upgrade
Date: Tue,  2 Feb 2021 17:36:35 -0800
Message-Id: <20210203013635.2512741-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210203013635.2512741-1-raj.khem@gmail.com>
References: <20210203013635.2512741-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is for master-next testing only !!

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...fault-with-Clang-non-section-symbols.patch | 150 ++++++++++++++++++
 ...-symbol-for-register-restoring-thunk.patch | 125 +++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |   5 +
 3 files changed, 280 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/0001-objtool-Fix-seg-fault-with-Clang-non-section-symbols.patch
 create mode 100644 meta/recipes-kernel/linux/files/0001-x86-entry-Emit-a-symbol-for-register-restoring-thunk.patch

diff --git a/meta/recipes-kernel/linux/files/0001-objtool-Fix-seg-fault-with-Clang-non-section-symbols.patch b/meta/recipes-kernel/linux/files/0001-objtool-Fix-seg-fault-with-Clang-non-section-symbols.patch
new file mode 100644
index 0000000000..f606e3ee6d
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-objtool-Fix-seg-fault-with-Clang-non-section-symbols.patch
@@ -0,0 +1,150 @@
+From 44f6a7c0755d8dd453c70557e11687bb080a6f21 Mon Sep 17 00:00:00 2001
+From: Josh Poimboeuf <jpoimboe@redhat.com>
+Date: Mon, 14 Dec 2020 16:04:20 -0600
+Subject: [PATCH] objtool: Fix seg fault with Clang non-section symbols
+
+The Clang assembler likes to strip section symbols, which means objtool
+can't reference some text code by its section.  This confuses objtool
+greatly, causing it to seg fault.
+
+The fix is similar to what was done before, for ORC reloc generation:
+
+  e81e07244325 ("objtool: Support Clang non-section symbols in ORC generation")
+
+Factor out that code into a common helper and use it for static call
+reloc generation as well.
+
+Reported-by: Arnd Bergmann <arnd@kernel.org>
+Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
+Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
+Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
+Reviewed-by: Miroslav Benes <mbenes@suse.cz>
+Link: https://github.com/ClangBuiltLinux/linux/issues/1207
+Link: https://lkml.kernel.org/r/ba6b6c0f0dd5acbba66e403955a967d9fdd1726a.1607983452.git.jpoimboe@redhat.com
+---
+ tools/objtool/check.c   | 11 +++++++++--
+ tools/objtool/elf.c     | 26 ++++++++++++++++++++++++++
+ tools/objtool/elf.h     |  2 ++
+ tools/objtool/orc_gen.c | 29 +++++------------------------
+ 4 files changed, 42 insertions(+), 26 deletions(-)
+
+diff --git a/tools/objtool/check.c b/tools/objtool/check.c
+index c6ab44543c92..5f8d3eed78a1 100644
+--- a/tools/objtool/check.c
++++ b/tools/objtool/check.c
+@@ -467,13 +467,20 @@ static int create_static_call_sections(struct objtool_file *file)
+ 
+ 		/* populate reloc for 'addr' */
+ 		reloc = malloc(sizeof(*reloc));
++
+ 		if (!reloc) {
+ 			perror("malloc");
+ 			return -1;
+ 		}
+ 		memset(reloc, 0, sizeof(*reloc));
+-		reloc->sym = insn->sec->sym;
+-		reloc->addend = insn->offset;
++
++		insn_to_reloc_sym_addend(insn->sec, insn->offset, reloc);
++		if (!reloc->sym) {
++			WARN_FUNC("static call tramp: missing containing symbol",
++				  insn->sec, insn->offset);
++			return -1;
++		}
++
+ 		reloc->type = R_X86_64_PC32;
+ 		reloc->offset = idx * sizeof(struct static_call_site);
+ 		reloc->sec = reloc_sec;
+diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
+index 4e1d7460574b..be89c741ba9a 100644
+--- a/tools/objtool/elf.c
++++ b/tools/objtool/elf.c
+@@ -262,6 +262,32 @@ struct reloc *find_reloc_by_dest(const struct elf *elf, struct section *sec, uns
+ 	return find_reloc_by_dest_range(elf, sec, offset, 1);
+ }
+ 
++void insn_to_reloc_sym_addend(struct section *sec, unsigned long offset,
++			      struct reloc *reloc)
++{
++	if (sec->sym) {
++		reloc->sym = sec->sym;
++		reloc->addend = offset;
++		return;
++	}
++
++	/*
++	 * The Clang assembler strips section symbols, so we have to reference
++	 * the function symbol instead:
++	 */
++	reloc->sym = find_symbol_containing(sec, offset);
++	if (!reloc->sym) {
++		/*
++		 * Hack alert.  This happens when we need to reference the NOP
++		 * pad insn immediately after the function.
++		 */
++		reloc->sym = find_symbol_containing(sec, offset - 1);
++	}
++
++	if (reloc->sym)
++		reloc->addend = offset - reloc->sym->offset;
++}
++
+ static int read_sections(struct elf *elf)
+ {
+ 	Elf_Scn *s = NULL;
+diff --git a/tools/objtool/elf.h b/tools/objtool/elf.h
+index 807f8c670097..e6890cc70a25 100644
+--- a/tools/objtool/elf.h
++++ b/tools/objtool/elf.h
+@@ -140,6 +140,8 @@ struct reloc *find_reloc_by_dest(const struct elf *elf, struct section *sec, uns
+ struct reloc *find_reloc_by_dest_range(const struct elf *elf, struct section *sec,
+ 				     unsigned long offset, unsigned int len);
+ struct symbol *find_func_containing(struct section *sec, unsigned long offset);
++void insn_to_reloc_sym_addend(struct section *sec, unsigned long offset,
++			      struct reloc *reloc);
+ int elf_rebuild_reloc_section(struct elf *elf, struct section *sec);
+ 
+ #define for_each_sec(file, sec)						\
+diff --git a/tools/objtool/orc_gen.c b/tools/objtool/orc_gen.c
+index 235663b96adc..9ce68b385a1b 100644
+--- a/tools/objtool/orc_gen.c
++++ b/tools/objtool/orc_gen.c
+@@ -105,30 +105,11 @@ static int create_orc_entry(struct elf *elf, struct section *u_sec, struct secti
+ 	}
+ 	memset(reloc, 0, sizeof(*reloc));
+ 
+-	if (insn_sec->sym) {
+-		reloc->sym = insn_sec->sym;
+-		reloc->addend = insn_off;
+-	} else {
+-		/*
+-		 * The Clang assembler doesn't produce section symbols, so we
+-		 * have to reference the function symbol instead:
+-		 */
+-		reloc->sym = find_symbol_containing(insn_sec, insn_off);
+-		if (!reloc->sym) {
+-			/*
+-			 * Hack alert.  This happens when we need to reference
+-			 * the NOP pad insn immediately after the function.
+-			 */
+-			reloc->sym = find_symbol_containing(insn_sec,
+-							   insn_off - 1);
+-		}
+-		if (!reloc->sym) {
+-			WARN("missing symbol for insn at offset 0x%lx\n",
+-			     insn_off);
+-			return -1;
+-		}
+-
+-		reloc->addend = insn_off - reloc->sym->offset;
++	insn_to_reloc_sym_addend(insn_sec, insn_off, reloc);
++	if (!reloc->sym) {
++		WARN("missing symbol for insn at offset 0x%lx",
++		     insn_off);
++		return -1;
+ 	}
+ 
+ 	reloc->type = R_X86_64_PC32;
+-- 
+2.30.0
+
diff --git a/meta/recipes-kernel/linux/files/0001-x86-entry-Emit-a-symbol-for-register-restoring-thunk.patch b/meta/recipes-kernel/linux/files/0001-x86-entry-Emit-a-symbol-for-register-restoring-thunk.patch
new file mode 100644
index 0000000000..320d7e929c
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-x86-entry-Emit-a-symbol-for-register-restoring-thunk.patch
@@ -0,0 +1,125 @@
+From de98d14b7f4511380a9d9b784a12507c790d8a54 Mon Sep 17 00:00:00 2001
+From: Nick Desaulniers <ndesaulniers@google.com>
+Date: Tue, 12 Jan 2021 11:46:24 -0800
+Subject: [PATCH] x86/entry: Emit a symbol for register restoring thunk
+
+Arnd found a randconfig that produces the warning:
+
+  arch/x86/entry/thunk_64.o: warning: objtool: missing symbol for insn at
+  offset 0x3e
+
+when building with LLVM_IAS=1 (Clang's integrated assembler). Josh
+notes:
+
+  With the LLVM assembler not generating section symbols, objtool has no
+  way to reference this code when it generates ORC unwinder entries,
+  because this code is outside of any ELF function.
+
+  The limitation now being imposed by objtool is that all code must be
+  contained in an ELF symbol.  And .L symbols don't create such symbols.
+
+  So basically, you can use an .L symbol *inside* a function or a code
+  segment, you just can't use the .L symbol to contain the code using a
+  SYM_*_START/END annotation pair.
+
+Fangrui notes that this optimization is helpful for reducing image size
+when compiling with -ffunction-sections and -fdata-sections. I have
+observed on the order of tens of thousands of symbols for the kernel
+images built with those flags.
+
+A patch has been authored against GNU binutils to match this behavior
+of not generating unused section symbols ([1]), so this will
+also become a problem for users of GNU binutils once they upgrade to 2.36.
+
+Omit the .L prefix on a label so that the assembler will emit an entry
+into the symbol table for the label, with STB_LOCAL binding. This
+enables objtool to generate proper unwind info here with LLVM_IAS=1 or
+GNU binutils 2.36+.
+
+ [ bp: Massage commit message. ]
+
+Reported-by: Arnd Bergmann <arnd@arndb.de>
+Suggested-by: Josh Poimboeuf <jpoimboe@redhat.com>
+Suggested-by: Borislav Petkov <bp@alien8.de>
+Suggested-by: Mark Brown <broonie@kernel.org>
+Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
+Signed-off-by: Borislav Petkov <bp@suse.de>
+Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
+Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
+Link: https://lkml.kernel.org/r/20210112194625.4181814-1-ndesaulniers@google.com
+Link: https://github.com/ClangBuiltLinux/linux/issues/1209
+Link: https://reviews.llvm.org/D93783
+Link: https://sourceware.org/binutils/docs/as/Symbol-Names.html
+Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d1bcae833b32f1408485ce69f844dcd7ded093a8 [1]
+---
+ Documentation/asm-annotations.rst | 5 +++++
+ arch/x86/entry/thunk_64.S         | 8 ++++----
+ include/linux/linkage.h           | 5 +++++
+ 3 files changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/Documentation/asm-annotations.rst b/Documentation/asm-annotations.rst
+index 32ea57483378..76424e0431f4 100644
+--- a/Documentation/asm-annotations.rst
++++ b/Documentation/asm-annotations.rst
+@@ -100,6 +100,11 @@ Instruction Macros
+ ~~~~~~~~~~~~~~~~~~
+ This section covers ``SYM_FUNC_*`` and ``SYM_CODE_*`` enumerated above.
+ 
++``objtool`` requires that all code must be contained in an ELF symbol. Symbol
++names that have a ``.L`` prefix do not emit symbol table entries. ``.L``
++prefixed symbols can be used within a code region, but should be avoided for
++denoting a range of code via ``SYM_*_START/END`` annotations.
++
+ * ``SYM_FUNC_START`` and ``SYM_FUNC_START_LOCAL`` are supposed to be **the
+   most frequent markings**. They are used for functions with standard calling
+   conventions -- global and local. Like in C, they both align the functions to
+diff --git a/arch/x86/entry/thunk_64.S b/arch/x86/entry/thunk_64.S
+index ccd32877a3c4..c9a9fbf1655f 100644
+--- a/arch/x86/entry/thunk_64.S
++++ b/arch/x86/entry/thunk_64.S
+@@ -31,7 +31,7 @@ SYM_FUNC_START_NOALIGN(\name)
+ 	.endif
+ 
+ 	call \func
+-	jmp  .L_restore
++	jmp  __thunk_restore
+ SYM_FUNC_END(\name)
+ 	_ASM_NOKPROBE(\name)
+ 	.endm
+@@ -44,7 +44,7 @@ SYM_FUNC_END(\name)
+ #endif
+ 
+ #ifdef CONFIG_PREEMPTION
+-SYM_CODE_START_LOCAL_NOALIGN(.L_restore)
++SYM_CODE_START_LOCAL_NOALIGN(__thunk_restore)
+ 	popq %r11
+ 	popq %r10
+ 	popq %r9
+@@ -56,6 +56,6 @@ SYM_CODE_START_LOCAL_NOALIGN(.L_restore)
+ 	popq %rdi
+ 	popq %rbp
+ 	ret
+-	_ASM_NOKPROBE(.L_restore)
+-SYM_CODE_END(.L_restore)
++	_ASM_NOKPROBE(__thunk_restore)
++SYM_CODE_END(__thunk_restore)
+ #endif
+diff --git a/include/linux/linkage.h b/include/linux/linkage.h
+index 5bcfbd972e97..dbf8506decca 100644
+--- a/include/linux/linkage.h
++++ b/include/linux/linkage.h
+@@ -178,6 +178,11 @@
+  * Objtool generates debug info for both FUNC & CODE, but needs special
+  * annotations for each CODE's start (to describe the actual stack frame).
+  *
++ * Objtool requires that all code must be contained in an ELF symbol. Symbol
++ * names that have a  .L prefix do not emit symbol table entries. .L
++ * prefixed symbols can be used within a code region, but should be avoided for
++ * denoting a range of code via ``SYM_*_START/END`` annotations.
++ *
+  * ALIAS -- does not generate debug info -- the aliased function will
+  */
+ 
+-- 
+2.30.0
+
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 7e570b04f5..aa328aff52 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -29,6 +29,11 @@ SRCREV_meta ?= "47c7a3148a4d7653cec536ba202b25148d1952ad"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
+SRC_URI += "\
+            file://0001-objtool-Fix-seg-fault-with-Clang-non-section-symbols.patch \
+            file://0001-x86-entry-Emit-a-symbol-for-register-restoring-thunk.patch \
+"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 LINUX_VERSION ?= "5.10.5"
 
-- 
2.30.0

