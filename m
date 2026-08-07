Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146CFC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 10:58:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40062.1786100302420818770
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 03:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=FgL5U1Cg;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4C541516
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Aug 2026 03:58:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A7633F9A2
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Aug 2026 03:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786100301; bh=0TcLYo0hkc2WxNvk4MMwwzJFbIc59BW4tueSZD9G7qQ=;
	h=From:To:Subject:Date:From;
	b=FgL5U1CgP8cdumsqXDjRErrIwstWoPktV+5Cj9adjIZwjVTvUBrLgdSMC35UMusIM
	 1WhE8dKTSepnl4nqZ/XKyV/N8GzjUcEqnjjbu4BBG1CrAl9kPLNgaMrAwbM4zFK/DD
	 2w8Y2vXm6xhfkJkwC0m8ijpmXID3rg/KKV5fNfB0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc: remove obsolete parallelism flag handling
Date: Fri,  7 Aug 2026 11:58:19 +0100
Message-ID: <20260807105820.3859811-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 10:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243006

Several problems here: the comment refers to PARALLELMFLAGS (which is a
variable in glibc's Makefile) but the actual assignment is to
EGLIBCPARALLELISM, which is an eglibc-ism and thus not respected by
glibc. Thus we were emptying PARALLEL_MAKE and so not actually doing the
build in parallel.

The Makefiles as of glibc 2.44[1] actually build in parallel well using
the standard way to pass flags, so drop all of this logic.

On my machine this has noticable improvements to walltime:

  do_compile:  86s -> 44s
  do_install:  55s -> 40s

Note that there is a PARALLELMFLAGS variable in the Makefiles, but using
it has marginal gains over not and upstream are looking at removing it
entirely.

Enabling parallel builds exposed some missing dependencies in the
Makefiles, backport submitted patches to resolve the issues.

[1] glibc 7cac99621e ("Makefile: Run the subdirectory recursion in parall=
el")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc.inc             |   7 -
 .../glibc/glibc/dependencies.patch            | 420 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.44.bb         |   1 +
 3 files changed, 421 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/dependencies.patch

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/=
glibc.inc
index ba509383367..16c18bd4b6c 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -29,13 +29,6 @@ CACHED_CONFIGUREVARS:append:mipsarch =3D " libc_cv_ld_=
gnu_indirect_function=3Dno"
 GLIBC_EXTRA_OECONF ?=3D ""
 GLIBC_EXTRA_OECONF:class-nativesdk =3D ""
=20
-# glibc uses PARALLELMFLAGS variable to pass parallel build info so tran=
sfer
-# PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
-EGLIBCPARALLELISM :=3D "PARALLELMFLAGS=3D"${PARALLEL_MAKE}""
-EXTRA_OEMAKE[vardepsexclude] +=3D "EGLIBCPARALLELISM"
-EXTRA_OEMAKE +=3D "${EGLIBCPARALLELISM}"
-PARALLEL_MAKE =3D ""
-
 TARGET_CC_ARCH:append:toolchain-gcc =3D " -fno-link-libatomic"
 SDK_CC_ARCH:append:toolchain-gcc =3D " -fno-link-libatomic"
=20
diff --git a/meta/recipes-core/glibc/glibc/dependencies.patch b/meta/reci=
pes-core/glibc/glibc/dependencies.patch
new file mode 100644
index 00000000000..ff77408b03f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/dependencies.patch
@@ -0,0 +1,420 @@
+From 43a9fe3338d41eac0607f82802a17928ac3d6a6d Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Thu, 6 Aug 2026 14:07:55 -0300
+Subject: [PATCH 1/6] Fix gen-as-const-headers races with the parallel su=
bdir
+ recursion (BZ 34438)
+
+The parallel subdirectory recursion (commit 7cac99621e96) only orders
+csu (and mach/hurd on Hurd) before the parallel fan-out plus the edges
+the Depend files request.  A header generated from gen-as-const-headers
+is only ordered before the compilations of the subdirectory that
+adds the .sym (through before-compile), so a header consumed by a
+different subdirectory may not exist yet when its consumer is
+compiled.
+
+That is the case for <sigaltstack-offsets.h>: it is generated when
+building misc, while its only consumer, ____longjmp_chk.S (x86_64 and
+sh), is built in debug.  The serial recursion always ran misc before
+debug in the sorted order, hiding the missing dependency.
+
+Move the generate the header to 'debug' instead.
+
+The same class of problem exists on Hurd: jmp_buf-ssp.h that is used
+by ____longjmp_chk.S in debug, and signal-defines.h that is sued
+by debug and setjmp.
+
+Deterministically reproduced with 'make debug/subdir_lib' from a clean
+build tree (which orders only csu before debug), and verified with
+builds for x86_64-linux-gnu, sh4-linux-gnu, i686-gnu, and x86_64-gnu.
+
+Upstream-Status: Submitted [https://inbox.sourceware.org/libc-alpha/2026=
0806170830.126994-1-adhemerval.zanella@linaro.org/]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Makerules                               | 12 +++++++++++-
+ sysdeps/mach/hurd/x86/Makefile          |  6 +-----
+ sysdeps/unix/sysv/linux/sh/Makefile     |  4 +++-
+ sysdeps/unix/sysv/linux/x86_64/Makefile |  4 +++-
+ sysdeps/x86/Makefile                    | 10 ++++++++--
+ 5 files changed, 26 insertions(+), 10 deletions(-)
+
+diff --git a/Makerules b/Makerules
+index 6bef57ece9..cef30974f1 100644
+--- a/Makerules
++++ b/Makerules
+@@ -259,7 +259,17 @@ endif  # gen-py-const-headers
+ ifdef gen-as-const-headers
+ # Generating headers for assembly constants.
+ # We need this defined early to get into before-compile before
+-# it's used in sysd-rules, below.
++# it's used in sysd-rules, below.  The gen-as-const-headers is evaluate=
d
++# per subdirectory, so the before-compile dependency below only orders
++# the generated header before the compiles of the subdirectory whose
++# Makefile adds the .sym directive.
++# The parallel subdirectory recursion does not order sibling subdirecto=
ries,
++# so a .sym must be added in the subdirectory that compiles its consume=
rs,
++# or in csu (which runs before the parallel) when it has consumers in
++# several subdirectories.
++# It must not add the same .sym in several subdirectories though: their
++# concurrent sub-makes would race generating the header through the fix=
ed
++# temporary files below.
+ # Define GEN_AS_CONST_HEADERS to avoid circular dependency [BZ #22792].
+ # NB: <tcb-offsets.h> is generated from tcb-offsets.sym to define
+ # offsets and sizes of types in <tls.h> and maybe <pthread.h> which
+diff --git a/sysdeps/mach/hurd/x86/Makefile b/sysdeps/mach/hurd/x86/Make=
file
+index 97e3287c87..1d94f3a1c1 100644
+--- a/sysdeps/mach/hurd/x86/Makefile
++++ b/sysdeps/mach/hurd/x86/Makefile
+@@ -3,11 +3,7 @@ sysdep_routines +=3D ioperm
+ sysdep_headers +=3D sys/io.h
+ endif
+=20
+-ifeq ($(subdir),debug)
+-gen-as-const-headers +=3D signal-defines.sym
+-endif
+-
+-ifeq ($(subdir),setjmp)
++ifeq ($(subdir),csu)
+ gen-as-const-headers +=3D signal-defines.sym
+ endif
+=20
+diff --git a/sysdeps/unix/sysv/linux/sh/Makefile b/sysdeps/unix/sysv/lin=
ux/sh/Makefile
+index dd3b382ac1..8c4cb73824 100644
+--- a/sysdeps/unix/sysv/linux/sh/Makefile
++++ b/sysdeps/unix/sysv/linux/sh/Makefile
+@@ -6,7 +6,9 @@ ifeq ($(subdir),stdlib)
+ gen-as-const-headers +=3D ucontext_i.sym
+ endif
+=20
+-ifeq ($(subdir),misc)
++# <sigaltstack-offsets.h> is only used by ____longjmp_chk.S, which is
++# built in the debug subdirectory.
++ifeq ($(subdir),debug)
+ gen-as-const-headers +=3D sigaltstack-offsets.sym
+ endif
+=20
+diff --git a/sysdeps/unix/sysv/linux/x86_64/Makefile b/sysdeps/unix/sysv=
/linux/x86_64/Makefile
+index 6938382801..528fd951b2 100644
+--- a/sysdeps/unix/sysv/linux/x86_64/Makefile
++++ b/sysdeps/unix/sysv/linux/x86_64/Makefile
+@@ -10,7 +10,9 @@ ifeq ($(subdir),csu)
+ gen-as-const-headers +=3D ucontext_i.sym
+ endif
+=20
+-ifeq ($(subdir),misc)
++# <sigaltstack-offsets.h> is only used by ____longjmp_chk.S, which is
++# built in the debug subdirectory.
++ifeq ($(subdir),debug)
+ gen-as-const-headers +=3D sigaltstack-offsets.sym
+ endif
+=20
+diff --git a/sysdeps/x86/Makefile b/sysdeps/x86/Makefile
+index 232e388d32..b4434deb0c 100644
+--- a/sysdeps/x86/Makefile
++++ b/sysdeps/x86/Makefile
+@@ -1,5 +1,12 @@
+ ifeq ($(subdir),csu)
+-gen-as-const-headers +=3D cpu-features-offsets.sym features-offsets.sym
++# <jmp_buf-ssp.h> is used by the setjmp/longjmp implementations in the
++# setjmp subdirectory and also by ____longjmp_chk.S in the debug
++# subdirectory.
++gen-as-const-headers +=3D \
++  cpu-features-offsets.sym \
++  features-offsets.sym \
++  jmp_buf-ssp.sym \
++  # gen-as-const-headers
+ endif
+=20
+ ifeq ($(subdir),elf)
+@@ -171,7 +178,6 @@ tests +=3D \
+ endif # $(subdir) =3D=3D math
+=20
+ ifeq ($(subdir),setjmp)
+-gen-as-const-headers +=3D jmp_buf-ssp.sym
+ sysdep_routines +=3D __longjmp_cancel
+ endif
+=20
+--=20
+2.43.0
+
+
+From f88dc9ea5403ed103aad1aa7ca613af058ba99f9 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Thu, 6 Aug 2026 14:07:56 -0300
+Subject: [PATCH 2/6] Makerules: Only install the ABI lib-names header fr=
om the
+ top level (BZ 34439)
+
+The $(inst_includedir)/%.h install rules exist only where $(headers) is
+non-empty, so in a subdir without headers (e.g. csu) the prerequisite
+added on install-others-nosubdir has no rule.
+
+It only worked because .NOTPARALLEL made the top level install the heade=
r
+first, which the parallel subdir recursion no longer guarantees.
+---
+ Makerules | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/Makerules b/Makerules
+index cef30974f1..dfe66b7fa6 100644
+--- a/Makerules
++++ b/Makerules
+@@ -312,7 +312,12 @@ lib-names-h-abi =3D gnu/lib-names-$(default-abi).h
+ lib-names-stmp-abi =3D gnu/lib-names-$(default-abi).stmp
+ before-compile +=3D $(common-objpfx)$(lib-names-h-abi)
+ common-generated +=3D gnu/lib-names.h
++# The $(inst_includedir)/%.h install rules are defined only where $(hea=
ders)
++# is non-empty, and with parallel subdir recursion a subdir without hea=
ders
++# (e.g. csu) may run before the top level has installed the header.
++ifndef subdir
+ install-others-nosubdir: $(inst_includedir)/$(lib-names-h-abi)
++endif
+ $(common-objpfx)gnu/lib-names.h:
+ 	$(make-target-directory)
+ 	{ \
+--=20
+2.43.0
+
+
+From abd98b39bc4a16a2c8afa43919b86d2a48de8155 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Thu, 6 Aug 2026 14:07:57 -0300
+Subject: [PATCH 3/6] Makefile: Only print the test summary in the second=
 pass
+ of 'make check'
+
+The build-only first pass of the two-pass 'make check' still runs the
+static checks (abi, conformtest, installed headers, etc.), and the
+top-level tests recipe merged and summarized their results.
+
+An unexpected FAIL there (e.g. check-abi) aborted 'check' before the
+second pass ran any built test, and even a clean run printed a misleadin=
g
+partial summary.
+
+Pass tests-summary=3Dno in the first pass to skip the merge and summary;
+the .test-result files persist, so the second pass folds those results
+into the one complete summary at the end, restoring the single-pass
+reporting behavior.
+---
+ Makefile  |  7 +++++++
+ Makerules | 11 +++++++++--
+ 2 files changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a6aabca691..b9fac6f47c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -869,7 +869,11 @@ endif
+ 	touch $(objpfx)testroot.pristine/install.stamp
+=20
+ tests-special-notdir =3D $(patsubst $(objpfx)%, %, $(tests-special))
++# The build-only first pass of the two-pass 'make check' (see Makerules=
)
++# passes tests-summary=3Dno: the merge and summary are left to the seco=
nd
++# pass, which folds in this pass's $(tests-special) results.
+ tests: $(tests-special)
++ifneq ($(tests-summary),no)
+ 	$(..)scripts/merge-test-results.sh -s $(objpfx) "" \
+ 	  $(sort $(tests-special-notdir:.out=3D)) \
+ 	  > $(objpfx)subdir-tests.sum
+@@ -877,11 +881,14 @@ tests: $(tests-special)
+ 	  $(sort $(subdirs) .) \
+ 	  > $(objpfx)tests.sum
+ 	$(call summarize-tests,tests.sum)
++endif
+ xtests:
++ifneq ($(tests-summary),no)
+ 	$(..)scripts/merge-test-results.sh -t $(objpfx) subdir-xtests.sum \
+ 	  $(sort $(subdirs)) \
+ 	  > $(objpfx)xtests.sum
+ 	$(call summarize-tests,xtests.sum, for extra tests)
++endif
+=20
+ # The realclean target is just like distclean for the parent, but we wa=
nt
+ # the subdirs to know the difference in case they care.
+diff --git a/Makerules b/Makerules
+index dfe66b7fa6..5f65f3ab9e 100644
+--- a/Makerules
++++ b/Makerules
+@@ -1211,6 +1211,13 @@ ALL_BUILD_CFLAGS =3D $(BUILD_CFLAGS) $(BUILD_CPPF=
LAGS) -D_GNU_SOURCE \
+ # therefore builds the test programs (run-built-tests=3Dno, recursion f=
ully
+ # parallel) and then runs them (run-built-tests=3Dyes).  'make tests' a=
nd a
+ # subdirectory's own 'check' stay single-pass.
++# The first pass still runs the static checks ($(tests-special): abi,
++# conformtest, installed headers, ...), so tests-summary=3Dno makes it =
skip
++# the results merge and summary: an unexpected FAIL there would otherwi=
se
++# abort 'check' before the second pass runs any built test, and even a
++# clean run would print a misleading partial summary.  The .test-result
++# files persist, so the second pass folds those results into the one
++# complete summary at the end.
+ check-twopass :=3D
+ ifndef subdir
+ ifeq (yes,$(run-built-tests))
+@@ -1219,10 +1226,10 @@ endif
+ endif
+ ifeq (yes,$(check-twopass))
+ check:
+-	$(MAKE) run-built-tests=3Dno  tests
++	$(MAKE) run-built-tests=3Dno  tests-summary=3Dno tests
+ 	$(MAKE) run-built-tests=3Dyes tests
+ xcheck:
+-	$(MAKE) run-built-tests=3Dno  xtests
++	$(MAKE) run-built-tests=3Dno  tests-summary=3Dno xtests
+ 	$(MAKE) run-built-tests=3Dyes xtests
+ else
+ check: tests
+--=20
+2.43.0
+
+
+From 8d04483c7dc5366cc1f2d7d444f1eee65ee45071 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Thu, 6 Aug 2026 14:07:58 -0300
+Subject: [PATCH 4/6] Makerules: Make the .dt to .d conversion safe again=
st
+ concurrent sub-makes
+
+The %.d: %.dt rule seds its input into a fixed temporary name, renames
+it into place and removes the input.  Two makes converting the same
+file trip over each other:
+
+  mv: cannot stat '.../test-double-libmvec-sincos-avx512f.o.T': No such =
file or directory
+  sed: can't read .../test-float-libmvec-acosf-avx512f.o.dt: No such fil=
e or directory
+
+That happens because the elf rtld-Rules recursion runs a sub-make over
+every $(rtld-subdirs) directory, which converts that directory's .dt
+files, and the parallel subdirectory recursion (commit 7cac99621e96)
+runs it concurrently with those subdirectories' own sub-makes.
+
+Add the PID of the shell to the temporary name and claim the input with
+a rename: only the run that wins converts and installs the target.
+---
+ Makerules | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/Makerules b/Makerules
+index 5f65f3ab9e..be51154bae 100644
+--- a/Makerules
++++ b/Makerules
+@@ -758,10 +758,20 @@ all-dt-files :=3D $(foreach o,$(object-suffixes-fo=
r-libc),$(+depfiles:.d=3D$o.dt))
+ 	     $(wildcard $(all-dt-files:.dt=3D.d))
+=20
+ # This is a funny rule in that it removes its input file.
++#
++# More than one make can convert the .dt files of a single object
++# directory: the elf rtld-Rules recursion runs a sub-make over every
++# $(rtld-subdirs) directory, concurrently with that directory's own
++# sub-make under the parallel subdir recursion.  Add the PID of the
++# shell to the temporary name and claim the input with a rename: only
++# the run that wins converts and installs the target.
+ %.d: %.dt
+-	@sed $(sed-remove-objpfx) $< > $(@:.d=3D.T) && \
+-	 mv -f $(@:.d=3D.T) $@ && \
+-	 rm -f $<
++	@dt=3D$(@:.d=3D.T)$$$$; \
++	 if mv -f $< $$dt 2>/dev/null; then \
++	   sed $(sed-remove-objpfx) $$dt > $$dt.new && \
++	   mv -f $$dt.new $@ && \
++	   rm -f $$dt; \
++	 fi
+=20
+ # Avoid the .h.d files for any .sym files whose .h files don't exist ye=
t.
+ # They will be generated when they're needed, and trying too early won'=
t work.
+@@ -1433,7 +1443,7 @@ endef
+ # Also remove the dependencies and generated source files.
+ common-clean: common-mostlyclean
+ 	-rm -f $(addprefix $(objpfx),$(generated))
+-	-rm -f $(objpfx)*.d $(objpfx)*.dt
++	-rm -f $(objpfx)*.d $(objpfx)*.dt $(objpfx)*.T[0-9]*
+ 	-rm -fr $(addprefix $(objpfx),$(generated-dirs))
+ 	-rm -f $(addprefix $(common-objpfx),$(common-generated))
+ 	-rm -f $(gen-as-const-headers:%.sym=3D$(common-objpfx)%.h)
+--=20
+2.43.0
+
+
+From fc18d62479fc57fdcf1d1bf14685ec4be4041bd0 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Thu, 6 Aug 2026 14:07:59 -0300
+Subject: [PATCH 5/6] Makefile: Order the top-level stamp files before th=
e
+ subdirectory fan-out
+
+The archive rules in Makerules list every stamp file as a prerequisite,
+including the top level's own, and the elf sub-make evaluates them to
+build libc_pic.a for the librtld.map link.  A sub-make can only create
+the stamp files of its own directory, so when the top-level ones do not
+exist yet it fails with:
+
+  make[2]: *** No rule to make target '.../stamp.os', needed by
+  '.../libc_pic.a'.  Stop.
+
+The serial recursion created them before the subdirectories through the
+prerequisite order of subdir_lib; the parallel recursion (commit
+7cac99621e96) does not.  Add them as prerequisites of the object-buildin=
g
+per-subdirectory targets.
+---
+ Makefile | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index b9fac6f47c..d559c42873 100644
+--- a/Makefile
++++ b/Makefile
+@@ -575,6 +575,14 @@ $(foreach t,$(+elf_last_subdir_targets),$(eval \
+   elf/$(t): $(addsuffix /$(t),$(filter-out elf,$(subdirs)))))
+ endif
+=20
++# The archive rules in Makerules list every stamp file as a
++# prerequisite of libc_pic.a, which the elf sub-make evaluates for the
++# librtld.map link, but a sub-make can only create its own directory's
++# stamps.  Create the top-level ones before the fan-out.
++$(foreach t,$(+elf_last_subdir_targets),$(eval \
++  $(addsuffix /$(t),$(subdirs)): \
++    $(foreach o,$(object-suffixes-for-libc),$(common-objpfx)stamp$(o)))=
)
++
+ # Pass barriers: a subdirectory 'others' build links programs against
+ # the libraries, so the 'lib' pass (including the top-level libc.so
+ # link) must have completed.
+--=20
+2.43.0
+
+
+From a310022b8d6d40f38100800edacce08afd6e309a Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Thu, 6 Aug 2026 14:08:00 -0300
+Subject: [PATCH 6/6] arm: Order the rtld link after libgcc-stubs.a
+
+The librtld.map and librtld.os link recipes use $(gnulib), which on arm
+contains libgcc-stubs.a through gnulib-arch.  But the archive is only a
+prerequisite of lib-noranlib so the rtld link can run before the archive
+exists:
+
+  ld.bfd: cannot find .../elf/libgcc-stubs.a: No such file or directory
+
+The race seems to predates the parallel subdirectory recursion, which
+only made it observable.
+
+Add the order-only dependency in sysdeps/arm/Makefile rather than in
+elf/Makefile.  Theprerequisite lists expand when the rule is parsed,
+and gnulib-arch is only defined once Makerules includes the sysdeps
+makefiles.
+
+Verified with a build for arm-linux-gnueabihf.
+---
+ sysdeps/arm/Makefile | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/sysdeps/arm/Makefile b/sysdeps/arm/Makefile
+index 0bb1b6e05b..9042315492 100644
+--- a/sysdeps/arm/Makefile
++++ b/sysdeps/arm/Makefile
+@@ -10,6 +10,11 @@ shared-only-routines +=3D aeabi_unwind_cpp_pr1
+ $(objpfx)libgcc-stubs.a: $(objpfx)aeabi_unwind_cpp_pr1.os
+ 	$(build-extra-lib)
+=20
++# The rtld link recipes in elf/Makefile use $(gnulib), which here
++# includes libgcc-stubs.a, but they cannot name it as a prerequisite:
++# gnulib-arch is only defined once this file is included from Makerules=
.
++$(objpfx)librtld.map $(objpfx)librtld.os: | $(objpfx)libgcc-stubs.a
++
+ lib-noranlib: $(objpfx)libgcc-stubs.a
+=20
+ ifeq ($(build-shared),yes)
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.44.bb b/meta/recipes-core/gl=
ibc/glibc_2.44.bb
index b4a5fbf8c31..5aa67b027d1 100644
--- a/meta/recipes-core/glibc/glibc_2.44.bb
+++ b/meta/recipes-core/glibc/glibc_2.44.bb
@@ -57,6 +57,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
            file://0020-fix-create-thread-failed-in-unprivileged-process-=
BZ-.patch \
            file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selft=
est.patch \
            file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS=
.patch \
+           file://dependencies.patch \
 "
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
=20
--=20
2.43.0


