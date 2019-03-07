Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8E2A77CE53
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 05:00:21 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id e1so12367102iok.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 21:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GZQeneYSpsz03p5zh4BjpCSxLjVLi/pT43yRjvKXN6M=;
	b=RgvdqQGd8MUll6qEI6pBuWkmQtfHw1h6LcYATMFdXM112xIBhjEkZslZs1DlOFaVAu
	25WmXlrr/xt0few1Vedig3bSGP9l1jZ2k/gml8Rq1azw8BRj1ry3qjVm+PujPekkYoJ9
	EfAWvSY2TalHzQ3PIKfuzOsSnkodwnWKpuf7p3iQHm4nDh0b+EDW2Vk4ivRZ5oony4Ej
	ODFIXKZF2VQULEl4nJEdAZTaAq3ZMignfyO9rrGX60zSmZxoTsdXNOYsOlT5EFxSUm8e
	7CgZa40TDGnZ2EoI3vfO5gmYN2UTrz4N4uAAHp2l0NOYmD8P1g6V0T5Ojgq1kKBk2APr
	R0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GZQeneYSpsz03p5zh4BjpCSxLjVLi/pT43yRjvKXN6M=;
	b=U9w+AhcRqydNKy80K5GmDKDIrnyzxIcMvE2TeZKuLR2jdPf4RwJP4LMRpjIsz/Uz0J
	ig9Z5kTeOBY71MM1CSHmvS7ngIwc5m0LWElcu5Fs1BPvBWIcds7nQV8Z4PCWBbCglZtM
	qI2stAbe+PY5gDjJibBe8PI+wmC7Xb4zJqW+Hlq1oWUrqJctafDiTBM22Gy4i0PQ6wQs
	v3N/B1h78k2N4M+1L3EhHEFG/qOM9ukxbKPs2kTOau6UznZMGioRvyYjhwKSvwjWKSt+
	d1pxgiZJ/hTSqeviu/KyzZP99HdUzr/PRelAys/IEonpmEWRAiWhPh1SUBeZ0mFZ2uEt
	C6zA==
X-Gm-Message-State: APjAAAU2unXSXjAtnPR7oMFbmos2gWheGXVfxRc0BqQ79iRGCN8mXxLT
	LagNwmwcjJuhLO2nBLln/xZXy2znV+Q=
X-Google-Smtp-Source: APXvYqwVZzZnZMt+y+xg/NZrnB7Gw9h12HamgJBZAHDEjgYVB16h1n1bFDFod1cTh0ihhhVHmT8PnA==
X-Received: by 2002:a6b:580f:: with SMTP id m15mr5108776iob.263.1551934822176; 
	Wed, 06 Mar 2019 21:00:22 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195]) by smtp.gmail.com with ESMTPSA id
	o141sm1811451ito.14.2019.03.06.21.00.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 21:00:21 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu,  7 Mar 2019 00:00:17 -0500
Message-Id: <20190307050019.23389-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] systemtap: update to enable 5.0 kernel capabilities
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Mar 2019 05:00:21 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the systemtap 4.0 SRCREV to pick up changes that have been
made to support newer kernels (and in particular 5.0).

   root@qemux86-64:~# stap --disable-cache -DSTP_NO_VERREL_CHECK ./hello.stp
   [  246.303263] stap_4843: loading out-of-tree module taints kernel.
   hello world
   root@qemux86-64:~#

The following commits are included in this update:

   90ff34ac0 If available, use kernel's save_stack_trace_regs() for fallback stack unwind
   a9b0aa4db testsuite/systemtap.bpf :: tests should return, not exit 0
   83f229abb cachestat.stp: workaround the current limitations of trace_printk
   f912d520f Newer kernels tapsets may use the kprobe.function("*") adjust alias_tapset.exp.
   fe569f964 Handle name change of do_brk to do_brk_flags in the newer kernels
   71dbdc9f9 Newer kernels tapsets may use the kprobe.function("*") adjust pp.exp check.
   20d23f97a Correct at_register.stp test arch name for arm64.
   e0bcc2f92 cachestat.stp: new example based on a bpftrace script by David Valin
   18d1baceb session.cxx diagnostics: don't dump kernel_functions below verbose=6
   25b181ae4 Add __NR_chmod for missing defines on aarch64
   2276b109e Add more __NR_* for missing defines on aarch64 (and ppc64)
   e34d66dee PR24239: avoid symbol/type resolution of unused globals/functions
   49d74d4fa Correct the at_register.exp test
   c77884dcd Turn on guru mode for at_deref1.stp use of @kderef
   a9a15a3f8 RHBZ1689180: correct group name typos in staprun.8
   e7146dbfe Regenerate syscall_num.stp grouped by syscall name.
   6bcf09813 Group initialization using the same string literal together in syscall_num.stp
   3752574dc Regenerate the syscall mapping information to add aarch32 to aarch64 syscalls
   af74da7b7 Update dump-syscalls.sh to generate 32-bit syscalls for aarch64
   60144c0fa Match arm64 non-dwarf syscall probe points
   d36f6fee8 PR24199: don't use exceptions to signal type-resolution failures
   5e50524ff PR24199: at pass-2 verbosity > 3, trace $var error-chaining events
   40f855fd5 PR24199: loc2stap: propagate dwarf DIE() source locations better
   af9ef3369 Adjust noptrace.stp to avoid modifying ptrace syscall arguments
   ca3946e62 Update pfiles.stp to work with Linux 4.17 and newer
   9d3a1cd66 PR24217: stap -p2 speedup, condition-expression processing
   ba7b83ec1 Conditionally define __NR_bdflush in systemtap runtime.
   cdf77a210 testsuite/systemtap.bpf :: couple of bpf_tests clarifications
   d6b529c43 fix embedded-c tag memoization thinko
   d81a001ad pass-2 optimization: embedded-c code pragma searching
   1832b8f51 Set up a BPF related testcase blacklist for regression testsing purposes.
   4e7686951 linux api update: compat_time* structs
   1ac5a4499 linux api update: FAN_ALL_CLASS_BITS
   17c2d352a unwinder: increase MAX_CFI to 8192 after a census of CFI sizes on Fedora 29
   2e373d294 runtime: adapt to uapi/linux/mount.h changes
   6b0430b6b dummy commit to force buildbot rebuilds
   d3964067f buildrun.cxx: older g++ compatibility: no std::string.back()
   6b2838df5 Handle installation without stapusr group
   f90ca3096 Simplify creation of groups during installation
   38184abcd Fix get_user_pages() autoconf test for 4.4.y kernel
   e2e13220f lkm-runtime time.c: prefer 4.15+ ktime_get_real_fast_ns
   eb8c8de94 linux 5.0-rc3 adaptations
   de5061899 parser: allow larger arrays
   0fc1a5019 stap man page: document histogram per-bucket access/iteration
   905865da1 PR16406 fixup :: correct comparison in _stp_module_check
   c8084763b PR10280 initial fix: force vermagic for guru-mode scripts
   3a29a2eef Make testcase at_var.exp work with stap-4.1+ and kernel-4.17+
   53ff2b5df stap-prep: switch typo ($NEEDED => $package)
   68bd23fd0 PR16596: add support for DW_OP_GNU_entry_value in location expressions
   aacee6563 Make sysc_bdflush.stp compatible with 4.17+ kernels.
   891810c24 configury: tolerate dyninst10's need for -lboost_system
   ec3b46eb9 RHBZ1655631: systemtap.spec: use Recommends: for kernel-*-devel
   eef17e743 runtime/unwind: Allow to increase MAX_CFI
   47ce37a14 systemtap.spec: merge unbotch - missing %changelog
   f082df49d systemtap.spec: importing fedora rawhide changes
   c9a393275 staprun/mainloop.c :: fix for loop initial decls
   266c72bd0 PR23866 part: expose raw syscall tracepoint to bpf
   ab368ac2a PR23891: Make sure stap and staprun respond to SIGTERM when stderr/stdout are blocked
   0a0595509 Fix segfaults in dwarf array pointer subscripting when -vvv is specified
   4a8652800 Make opeartor @var() no longer assume @entry() in return probes.
   f5c19712c Add the ucalls.stp to the systemtap examples.
   7d82f1bdc Adjust tcp_trace.stp example to work with newer Linux kernel's timers
   f6d683666 Adjust the vfs_open to provide cred variable with 4.18 kernels
   008a0cbfd Userspace_probing.xml: change '-ldd' to '--ldd' command line option.
   e6227e5df bpf-translate.cxx: don't clobber any earlier value of c
   cbf3b6e6a bpf-translate.cxx: quiet a compiler warning
   824e9ab80 PR23890 bonus: show nicer messages upon a buildid mismatch
   fba365b4d PR23890: tolerate f29+ style ELF files
   6c94b6d42 PR23747: tolerate symbols with odd section#s
   d60dac71a systemtap.bpf/asm_tests :: fix documentation / expected result
   0eaf4f196 PR23875 bpf_unparser::visit_foreach_loop(): temporarily disable string key iteration
   8c1452d10 PR23875: another testcase that loops indefinitely
   584d61dc0 PR23875 bpf.exp: fail testcase on 'stack smashing'
   0128e1daf PR23860 bpf_interpret() :: NEG should not fall through to DIV
   75640f70d Adjust the periodic.stp example to work with newer Linux kernels
   ca225a1cc stap -vv: also print kernel build-tree path name
   28cf23f8e testcase for PR23875
   3733caeba PR23860: reduce stack pressure from format strings
   7a5716bb8 PR23860: additional ugly stack/clobber protection for strings
   021f906e5 PR23860: additional stack protection for strings
   02861e63c PR23860 bugfix: incorrect comparison direction in string_copy()
   e428db474 PR23507: add new command-line option to disable automatic unread global variable display
   b2ba3af9a pr23860 verifier workaround :: be sure to delete all mov rN,rN
   08861a20f PR23507: add underscores to global @this variables
   4ee1ae49a PR23761: generalized @entry
   cc6e13e62 standardize ktime_get_ns() across lkm, bpf runtimes
   fbee58bda bpf behind-the-scenes :: useful DEBUG_CODEGEN diagnostic
   7209427d4 Always use nssInit for http and nss server.
   72ef87bba PR23860 partial fix: fix BPF_NEG opcode generation.
   8fb0cb4a7 PR23829 :: fallback defines __BPF_FUNC_MAPPER and BPF_J{LT,LE,SLT,SLE} for older kernels
   686ba2980 tapset/bpf/task.stp :: rudiment of task tapset
   0e6a26ff4 PR23849 -- temporarily disable stapbpf script caching
   c0002c5ad prometheus-exporter samples: change reported metric name
   1b50200ff stap-exporter: drop initial demo scripts under .examples; not used
   3582845f5 powerpc64: add missing system call defines
   57550d39d aarch64: add missing system call defines
   856ddcedb tapset/bpf/context.stp :: add execname(), triage other functions
   61b00f37d tapset/bpf/conversions.stp bugfix :: helper name in kernel_string(addr, err_msg)
   a47bc40eb bpf-asm.exp bugfix :: bad_output does occur
   14e5ff4e6 bpf-translate.cxx :: fix segfault with malformed register
   b530b0193 Fix miscellaneous errors/typos in syscall tapset
   ae51c4d99 On aarch64 Linux system calls related SystemTap scripts compilation fail with "__NR_compat_[exit|read|write] redefined" errors after following two commits:
   3d9e0d2a5 Adjust the BPF translate error report formatting to work on 32-bit architectures
   0a4d384a8 session.cxx :: enable caching for bpf backend
   5ada58a9f bpf-translate.cxx :: plug an exception gap in is_numeric()
   c009fe88d Merge branch 'serhei/bpf_asm' -- kernel_string() tapset and experimental bpf assembler
   0b3a813f5 testsuite/systemtap.bpf :: diagnose a bug in print_format("%s%s", ...)
   110f739b3 stapbpf assembler WIP #8 :: bpf-asm.exp driver and more testcases
   4d68a526b stapbpf assembler WIP #7 :: fixed kernel_string() tapset and testcase
   da6c4aef4 stapbpf assembler WIP #6 :: other call functions ({s}printf and tapset)
   e534cf2a7 PR21080: support added for new pkey_* syscalls
   0e0f0e386 stap-exporter examples: use symlinks rather than copies
   fddf715d1 Use NSS_InitContext instead of NSS_Init.
   6a3a804e4 prometheus tapset: add dump_array_*_unquoted variants
   4e81610ae nfsd tapset: adapt nfsd.proc4.commit probe to different kernel versions
   4cd50f30a PR23799 - sprint_ustack() always returns empty string values
   8bc640345 nfsd tapset: adapt nfsd.proc4.read probe to different kernel versions
   7b76b6b60 step-prep: on debian/ubuntu machines, attempt "apt-get -y install"
   10b3f049e Use cast to make c->cycles_sum aways match the %lld format.
   d95f81630 Add more quantitative data to error message when probes exceed threshold
   f4d49b79b Avoid using target variable in target_set.stp for syscall.* probes.
   5aafdc55e Avoid using target variables for syscall.write in print_user_buffer.stp.
   bb93c70a1 Avoid using target variables in signal.stp for syscall.* based probe points.
   784d4fc04 Add buildok/syscall_any.stp to list of tests dyninst will not run.
   910395ba0 kprocess.exec_complete should avoid using $return from syscall.execve.return
   d4550e6c0 stapbpf assembler WIP #5 :: basic kernel_string() implementation
   9ae578690 stapbpf assembler WIP #4 :: alloc and (helper) call operations
   f12e7d8eb stapbpf assembler WIP #3 :: additional assembly test cases
   f3fdcc936 Fix searching of kernel_source_tree for kernel built with O option
   dd57c7387 postrelease version bump for future version 4.1
   2881d9d95 stapbpf assembler WIP #2 :: testcases (no driver so far)
   db79925e5 stapbpf assembler WIP #1 :: basic parser and control flow

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...-don-t-support-installing-a-non-root.patch | 47 +++++--------------
 .../systemtap/systemtap_git.inc               |  2 +-
 2 files changed, 12 insertions(+), 37 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
index 9f11648fef..e2f8b3b057 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
@@ -14,49 +14,24 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
  staprun/Makefile.am | 12 ++++++------
  2 files changed, 13 insertions(+), 13 deletions(-)
 
-diff --git a/stapbpf/Makefile.am b/stapbpf/Makefile.am
-index 421b044ef..f7daeb2b2 100644
---- a/stapbpf/Makefile.am
-+++ b/stapbpf/Makefile.am
-@@ -39,11 +39,11 @@ git_version.stamp ../git_version.h:
+Index: git/stapbpf/Makefile.am
+===================================================================
+--- git.orig/stapbpf/Makefile.am
++++ git/stapbpf/Makefile.am
+@@ -41,10 +41,10 @@
  
  # Why the "id -u" condition?  This way, an unprivileged user can run
  # make install, and have "sudo stap ...." or "sudo stapbpf ...." work later.
 -install-exec-hook:
--	if [ `id -u` -eq 0 ]; then \
--		getent group stapusr >/dev/null || groupadd -g 156 -r stapusr 2>/dev/null || groupadd -r stapusr; \
--		getent group stapusr >/dev/null \
--		&& chgrp stapusr "$(DESTDIR)$(bindir)/stapbpf" \
+-	if [ `id -u` -eq 0 ] && (getent group stapusr >/dev/null \
+-	                         || groupadd -f -g 156 -r stapusr); then \
+-		chgrp stapusr "$(DESTDIR)$(bindir)/stapbpf" \
 -		&& chmod 04110 "$(DESTDIR)$(bindir)/stapbpf"; \
 -	fi
 +#install-exec-hook:
-+#	if [ `id -u` -eq 0 ]; then \
-+#		getent group stapusr >/dev/null || groupadd -g 156 -r stapusr 2>/dev/null || groupadd -r stapusr; \
-+#		getent group stapusr >/dev/null \
-+#		&& chgrp stapusr "$(DESTDIR)$(bindir)/stapbpf" \
++##	if [ `id -u` -eq 0 ] && (getent group stapusr >/dev/null \
++##	                         || groupadd -f -g 156 -r stapusr); then \
++##		chgrp stapusr "$(DESTDIR)$(bindir)/stapbpf" \
 +#		&& chmod 04110 "$(DESTDIR)$(bindir)/stapbpf"; \
 +#	fi
  endif
-diff --git a/staprun/Makefile.am b/staprun/Makefile.am
-index 4073aa01c..2925e34c3 100644
---- a/staprun/Makefile.am
-+++ b/staprun/Makefile.am
-@@ -72,9 +72,9 @@ git_version.stamp ../git_version.h:
- 
- # Why the "id -u" condition?  This way, an unprivileged user can run
- # make install, and have "sudo stap ...." or "sudo staprun ...." work later.
--install-exec-hook:
--	if [ `id -u` -eq 0 ]; then \
--		getent group stapusr >/dev/null || groupadd -g 156 -r stapusr 2>/dev/null || groupadd -r stapusr; \
--		getent group stapusr >/dev/null && chgrp stapusr "$(DESTDIR)$(bindir)/staprun"; \
--		chmod 04110 "$(DESTDIR)$(bindir)/staprun"; \
--	fi
-+#install-exec-hook:
-+#	if [ `id -u` -eq 0 ]; then \
-+#		getent group stapusr >/dev/null || groupadd -g 156 -r stapusr 2>/dev/null || groupadd -r stapusr; \
-+#		getent group stapusr >/dev/null && chgrp stapusr "$(DESTDIR)$(bindir)/staprun"; \
-+#		chmod 04110 "$(DESTDIR)$(bindir)/staprun"; \
-+#	fi
--- 
-2.11.0
-
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 274fcde5c1..54de722660 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,6 +1,6 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "428f84e9e656bce71018e8902e4edb8aacafcc0e"
+SRCREV = "90ff34ac0506f0d5440393a4c78565f6aaf9b726"
 PV = "4.0"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
-- 
2.19.1


