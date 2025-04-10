Return-Path: <semc.2042@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2477C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 10:07:09 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.30551.1744279627810594397
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 03:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Otci5+4v;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: semc.2042@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22403cbb47fso5860405ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 03:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744279627; x=1744884427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ur4ZknSaYkYwRCWmYXmfGOqzimNM94TEfLgWbLKtWgc=;
        b=Otci5+4vTmnnnAsexXBkPbxTg1lwZO1XTKu5p5obRse4gWmnwez+kIzu8A/N64KWbd
         HF69UF4gxZeojz+9SbkI7DbqRo+NPYjql5Ce4F5ECVDkVyDU36+3VGxHL5Tuzoavp3vh
         +ChwQTIzwqyGut9lJmNmd7yzkQXl+KbHzD39SzMPLmvSjIE3zqXIkSi2rtU+L0Mt09AB
         q5e5i7/sqGL4XDX95lolQexx27+6gnR/7K3pzRsW/z2PsLF6UIT4UlRNImiLfjSeZZ6K
         9tdkDYGhrPnLuhRoT2NjlbNQIiVsS0IyRVMfG2pKnke84pmBlTpwWWzuqv56c+vkeRDi
         Ojtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279627; x=1744884427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ur4ZknSaYkYwRCWmYXmfGOqzimNM94TEfLgWbLKtWgc=;
        b=FJZmWJJWL2XWXDaUxeDqcZiRpGghADO19Ld3HuYWaJybb4sDXkEsc/9G2fXYht4Rbp
         ZNmSINUsYbUfL88tRiROAerxPuLQm9UQDyhiWb5ozcsFqSAmMfoKER+uzkmxOMBF76k6
         bpU7jxUgRuzRKvMinyIWF4bhX+MkW5PMhnj0+mbXbbeNmr33Yw8fFxC8sR+ZbJzXsgD6
         1GbJ/ob8fu8DsR8n7NY6qytvIlBVJTeZINUR32OjE18epRZuuWqgKMxj0sZebD2fVufW
         YJPOHj1MpQj2cPuPwM2CEV+5wUxTWSe7SLujzAdZz+WhuC094wmsZ5mI7JR5XzOiKa6v
         p8xg==
X-Gm-Message-State: AOJu0Yx4Dee/399SupkfbkSDdebj0FgRr5d7fNm26QevFNXPHcbW4DrT
	PEUOEvpdSz5A1ekevxEMBLBteFSuzee9+T2uBvNSzz0mojR1CtVJR27pTA==
X-Gm-Gg: ASbGncsoj1bvYVkBaQDsyxb9yavCULxVTQaVi/JhfvFx5VqpfJqxJtPrWHKWH9SL1av
	4GvNG0AiLzqqIFl1iOlnH5NX/wN2UWUIS1uX4Wu2w8gDnvJ2fZ7CKeP/0TeUD5gd4d2fbwoRPNg
	FmqpLqBzPmKLuLh0aurwbXm8Q/oQanBxr8e45dvriNE/MrD7E8xEX2NgZJ4UY0J3m32zfJA9lcj
	S/fsn3ijj8L5mXZlio+becD4/47suUDRy1hITEGS9k26tXkpWMCbBGpuepnnVlgBZZ0zBgsxabe
	4ESIaZddYHE2jsfX6fluUSv3M48iUCuHMmY2+Jp2mPM1sQ==
X-Google-Smtp-Source: AGHT+IEBsok9ztJanyIf0kXcc/VuJtQJ9NleQH8vY9bumwuwP8YKlkGzyWW9Qo95pVukscPnIYxH6w==
X-Received: by 2002:a17:903:1a10:b0:224:1294:1d26 with SMTP id d9443c01a7336-22be02f2f61mr22188015ad.13.1744279626694;
        Thu, 10 Apr 2025 03:07:06 -0700 (PDT)
Received: from L-16522.kpit.com ([49.207.226.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ce07e1sm26354075ad.258.2025.04.10.03.07.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:07:06 -0700 (PDT)
From: rajmohan r <semc.2042@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc-y2038-tests:add tests-special in run-built-tests yes
Date: Thu, 10 Apr 2025 15:37:03 +0530
Message-Id: <20250410100703.1006340-1-semc.2042@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 10:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214636

If 'run-built-tests' is 'yes' run the test binaries, else do not run
the test binaries.

Currently its taking 20min to complete do_check() for glibc-y2038-tests.
Test binaries are run in do_check() stage though 'run-built-tests' is
set 'no'. Which is wrong hence include 'tests-special' target inside
the 'run-built-tests' condition when set to 'yes' to avoid running the
test binaries.

Also remove 'tests-special' target from the 'tests' and 'xtests' list
when run-built-tests set to 'no' to avoid running test binaries.

After this change, no binary is run and time to complete do_check()
stage is 7min.

Upstream-Status: Inappropriate [oe-specific]

Signed-off-by: rajmohan r <semc.2042@gmail.com>
---
 .../glibc/glibc-y2038-tests_2.41.bb           |   1 +
 ...tests-special-in-run-built-tests-yes.patch | 184 ++++++++++++++++++
 2 files changed, 185 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests-yes.patch

diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb b/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
index 9ea09a4e12..2e1f9b02c9 100644
--- a/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
+++ b/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
@@ -5,6 +5,7 @@ inherit ptest features_check
 REQUIRED_DISTRO_FEATURES = "ptest"
 
 SRC_URI += "\
+	file://include-tests-special-in-run-built-tests-yes.patch \
 	file://run-ptest \
 "
 
diff --git a/meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests-yes.patch b/meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests-yes.patch
new file mode 100644
index 0000000000..f8f78c5863
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests-yes.patch
@@ -0,0 +1,184 @@
+glibc-y2038-tests: include tests-special in run-built-tests yes
+
+If 'run-built-tests' is 'yes' run the test binaries, else do not run
+the test binaries.
+
+Currently its taking 20min to complete do_check() for glibc-y2038-tests.
+Test binaries are run in do_check() stage though 'run-built-tests' is
+set 'no'. Which is wrong hence include 'tests-special' target inside
+the 'run-built-tests' condition when set to 'yes' to avoid running the
+test binaries.
+
+Also remove 'tests-special' target from the 'tests' and 'xtests' list
+when run-built-tests set to 'no' to avoid running test binaries.
+
+After this change, no binary is run and time to complete do_check()
+stage is 7min.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: rajmohan r <semc.2042@gmail.com>
+--- 
+ Makefile  | 16 ++++++++++++++++
+ Makerules |  2 ++
+ Rules     |  8 ++++++--
+ 3 files changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 5c20ed3..ed95e99 100644
+--- a/Makefile
++++ b/Makefile
+@@ -545,21 +545,26 @@ tests-clean: do-tests-clean
+ 	@$(MAKE) subdir_testclean no_deps=t
+ 
+ ifneq (,$(CXX))
++ifeq ($(run-built-tests),yes)
+ vpath c++-types.data $(+sysdep_dirs)
+ 
+ tests-special += $(objpfx)c++-types-check.out
+ $(objpfx)c++-types-check.out: c++-types.data scripts/check-c++-types.sh
+ 	scripts/check-c++-types.sh $< $(CXX) $(filter-out -std=gnu11 $(+gccwarn-c),$(CFLAGS)) $(CPPFLAGS) > $@; \
+ 	$(evaluate-test)
++endif # $(run-built-tests) = yes
+ endif
+ 
++ifeq ($(run-built-tests),yes)
+ tests-special += $(objpfx)check-local-headers.out
+ $(objpfx)check-local-headers.out: scripts/check-local-headers.sh
+ 	AWK='$(AWK)' scripts/check-local-headers.sh \
+ 	  "$(includedir)" "$(objpfx)" < /dev/null > $@; \
+ 	$(evaluate-test)
++endif # $(run-built-tests) = yes
+ 
+ ifneq "$(headers)" ""
++ifeq ($(run-built-tests),yes)
+ # Special test of all the installed headers in this directory.
+ tests-special += $(objpfx)check-installed-headers-c.out
+ libof-check-installed-headers-c := testsuite
+@@ -570,8 +575,10 @@ $(objpfx)check-installed-headers-c.out: \
+ 	     $(filter-out -std=%,$(CFLAGS)) -D_ISOMAC $(+includes)" \
+ 	  $(headers) > $@; \
+ 	$(evaluate-test)
++endif # $(run-built-tests) = yes
+ 
+ ifneq "$(CXX)" ""
++ifeq ($(run-built-tests),yes)
+ tests-special += $(objpfx)check-installed-headers-cxx.out
+ libof-check-installed-headers-cxx := testsuite
+ $(objpfx)check-installed-headers-cxx.out: \
+@@ -581,14 +588,18 @@ $(objpfx)check-installed-headers-cxx.out: \
+ 	     $(filter-out -std=%,$(CXXFLAGS)) -D_ISOMAC $(+includes)" \
+ 	  $(headers) > $@; \
+ 	$(evaluate-test)
++endif # $(run-built-tests) = yes
+ endif # $(CXX)
+ 
++ifeq ($(run-built-tests),yes)
+ tests-special += $(objpfx)check-wrapper-headers.out
+ $(objpfx)check-wrapper-headers.out: scripts/check-wrapper-headers.py $(headers)
+ 	$(PYTHON) $< --root=. --subdir=. $(headers) \
+ 	  --generated $(common-generated) > $@; $(evaluate-test)
++endif # $(run-built-tests) = yes
+ endif # $(headers)
+ 
++ifeq ($(run-built-tests),yes)
+ # Lint all Makefiles; including this one.  Pass `pwd` as the source
+ # directory since the top-level Makefile is in the root of the source
+ # tree and these tests are run from there.  We add light-weight linting
+@@ -598,7 +609,9 @@ tests-special += $(objpfx)lint-makefiles.out
+ $(objpfx)lint-makefiles.out: scripts/lint-makefiles.sh
+ 	$(SHELL) $< "$(PYTHON)" `pwd` > $@ ; \
+ 	$(evaluate-test)
++endif # $(run-built-tests) = yes
+ 
++ifeq ($(run-built-tests),yes)
+ # Link libc.a as a whole to verify that it does not contain multiple
+ # definitions of any symbols.
+ tests-special += $(objpfx)link-static-libc.out
+@@ -606,6 +619,7 @@ $(objpfx)link-static-libc.out:
+ 	$(LINK.o) $(whole-archive) -nostdlib -nostartfiles -r \
+ 	  $(objpfx)libc.a -o /dev/null > $@ 2>&1; \
+ 	$(evaluate-test)
++endif # $(run-built-tests) = yes
+ 
+ # Print test summary for tests in $1 .sum file;
+ # $2 is optional test identifier.
+@@ -686,6 +700,7 @@ endif
+ 	rm -f $(symbolic-link-list)
+ 	touch $(objpfx)testroot.pristine/install.stamp
+ 
++ifeq ($(run-built-tests),yes)
+ tests-special-notdir = $(patsubst $(objpfx)%, %, $(tests-special))
+ tests: $(tests-special)
+ 	$(..)scripts/merge-test-results.sh -s $(objpfx) "" \
+@@ -700,6 +715,7 @@ xtests:
+ 	  $(sort $(subdirs)) \
+ 	  > $(objpfx)xtests.sum
+ 	$(call summarize-tests,xtests.sum, for extra tests)
++endif # $(run-built-tests) = yes
+ 
+ # The realclean target is just like distclean for the parent, but we want
+ # the subdirs to know the difference in case they care.
+diff --git a/Makerules b/Makerules
+index ada6168..40b5ef2 100644
+--- a/Makerules
++++ b/Makerules
+@@ -1232,6 +1232,7 @@ include $(patsubst %,$(..)libof-iterator.mk,$(cpp-srcs-left))
+ endif
+ 
+ ifeq ($(build-shared),yes)
++ifeq ($(run-built-tests),yes)
+ # Generate normalized lists of symbols, versions, and data sizes.
+ # This is handy for checking against existing library binaries.
+ 
+@@ -1321,6 +1322,7 @@ tests-special += $(check-abi-list)
+ endif
+ endif
+ 
++endif # $(run-built-tests) = yes
+ endif
+ 
+ FORCE:
+diff --git a/Rules b/Rules
+index c8adc00..5a77516 100644
+--- a/Rules
++++ b/Rules
+@@ -94,6 +94,7 @@ $(objpfx)check-installed-headers-c.out: \
+ ifneq "$(CXX)" ""
+ # If a C++ compiler is available, also test that they can be compiled
+ # in isolation as C++.
++ifeq ($(run-built-tests),yes)
+ tests-special += $(objpfx)check-installed-headers-cxx.out
+ libof-check-installed-headers-cxx := testsuite
+ $(objpfx)check-installed-headers-cxx.out: \
+@@ -103,8 +104,10 @@ $(objpfx)check-installed-headers-cxx.out: \
+ 	     $(filter-out -std=%,$(CXXFLAGS)) -D_ISOMAC $(+includes)" \
+ 	  $(headers) > $@; \
+ 	$(evaluate-test)
++endif # $(run-built-tests) = yes
+ endif # $(CXX)
+ 
++ifeq ($(run-built-tests),yes)
+ # Test that a wrapper header exists in include/ for each non-sysdeps header.
+ # This script does not need $(py-env).
+ tests-special += $(objpfx)check-wrapper-headers.out
+@@ -112,6 +115,7 @@ $(objpfx)check-wrapper-headers.out: \
+   $(..)scripts/check-wrapper-headers.py $(headers)
+ 	$(PYTHON) $< --root=$(..) --subdir=$(subdir) $(headers) > $@; \
+ 	  $(evaluate-test)
++endif # $(run-built-tests) = yes
+ 
+ # Test that none of the headers installed by this directory use certain
+ # obsolete constructs (e.g. legacy BSD typedefs superseded by stdint.h).
+@@ -153,9 +157,9 @@ tests: $(addprefix $(objpfx),$(filter-out $(tests-unsupported), \
+ 					  $(tests-malloc-check:%=%-malloc-check) \
+ 					  $(tests-malloc-hugetlb1:%=%-malloc-hugetlb1) \
+ 					  $(tests-malloc-hugetlb2:%=%-malloc-hugetlb2)) \
+-			     $(test-srcs)) $(tests-special) \
++			     $(test-srcs)) \
+ 			     $(tests-printers-programs)
+-xtests: tests $(xtests-special)
++xtests: tests
+ else # $(run-built-tests) != no
+ # The $(xtests) dependency ensures that xtests are always built.
+ tests: $(tests:%=$(objpfx)%.out) $(tests-internal:%=$(objpfx)%.out) \
-- 
2.34.1


