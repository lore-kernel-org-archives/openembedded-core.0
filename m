Return-Path: <semc.2042@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7401DC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 12:40:36 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.10200.1743165631601748803
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 05:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XIllReOl;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: semc.2042@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-227b828de00so38287955ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 05:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743165631; x=1743770431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pC10YdGnyIQn7Wxc38hDh2QS7vJnRb1otxPnEEGKUxo=;
        b=XIllReOlok2pYvzADe9natCJeYPPL3aTWDOtK04AtOnmamI/aSc7r0rQJDm5eWrA73
         ve7NBX2LVjlKO7ZR5vqyt7oDYbVfuF/Y1uR2CqdGgSVh8l4A8sl6ojWZq6jd/ZWyMxeN
         ir6GYCdFIFzjeghMWyEf3W9TkfgiaE/dvrRyLVlIJTeuQo9GBKa0GvH1dy7Gn/f1r+GX
         tblKdAyXOIw9OAZ7Owh3szKCBvPDPrRFLNHjnR7/jYFPZ4G8iyasN1xibx0f5vYfAuAT
         kuNYiSkgmxy4YzX18NFabUHleToyIEZeRl/O7VOS5RXQMUjIKuX5QU/aTo7W8ODsuUN3
         oUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743165631; x=1743770431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pC10YdGnyIQn7Wxc38hDh2QS7vJnRb1otxPnEEGKUxo=;
        b=f2v++I9W8VCn1sRVYGYMb1gvrQJsPnBDHYHGK+SOKBZWWJPXF/OCFr5erHWMSSW8Sv
         IrkfaH896o5PEv84Al9DDpR8toW2rlkgFyIzUtf/as44dC5hVI5rYXZIHBsJxoSYilho
         1+PHjBcdLOEi1J4K9jbgjTOdlDr6OCwyY3B9ex5FiWziyoH4WF2oqKA2qrPPd2vS8GmG
         UiKcqmJamSZX6QRdwXxmRjjFTlBKCzY+uqvl2aWHri2Fzd5Xhytuur+vrP1z14N0TuYA
         5cD2f1wUCF9X3MmhWgzH1BJeSp/78S4SRpvth0vajmeyoFjooyvt9ZSdW1/ApW6eozym
         u4xA==
X-Gm-Message-State: AOJu0YxLj/LAPm0+drsuEt5GgCCTXXEmorwel5GJGH3v+4Lw1oeF2Czs
	/h3URxkp9ukBqcLalP+Bnd5B7VKAjHXwubhzECjh0RdSPZm0bNpDBOZQ+A==
X-Gm-Gg: ASbGncvhRokG2y8BrZV7EPphc3uP85110+xWwp3s2U/gjpUkNrTs8JJk5bg/T56GFtb
	JDPJEslOvRuYsuJmzGYCqE8+y91VrXlsm1r0clestfWSFqpqBeKVEc6ficDmvvRaHubRCH38CNN
	v43Yuob6TT+hmaof2NRwZVjhB5MPDTazfMM9pbqpu5Q1r4Fc5VnXLXcoX8z6SVua2Ib+0S1ZLG9
	Mgn38DDzirnJuey1S5zm5oIXkORT/GSzKNDhHPgsV10d59bmz5DABmCFnKqB6JJXfS68okSrqSE
	HNUZuLWdJgJ7fqaQ/F4xSk7BohYQDBnIAIsPKpLwlaOfzHWMdJQ=
X-Google-Smtp-Source: AGHT+IEUfx8gnjJYLFzC2rjomYbzI9s+97HoYqmaLkrEFHc/dqgS7IoNd7wwLHvOEqeVuckCOMZ3sA==
X-Received: by 2002:a05:6a00:2401:b0:736:4e67:d631 with SMTP id d2e1a72fcca58-739610d24fcmr11417674b3a.23.1743165630369;
        Fri, 28 Mar 2025 05:40:30 -0700 (PDT)
Received: from L-16522.kpit.com ([49.207.232.228])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970deee97sm1597276b3a.25.2025.03.28.05.40.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:40:30 -0700 (PDT)
From: rajmohan r <semc.2042@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] glibc-y2038-tests:add tests-special in run-built-tests yes
Date: Fri, 28 Mar 2025 18:10:26 +0530
Message-Id: <20250328124026.817680-1-semc.2042@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 12:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213834

If 'run-built-tests' is 'yes' run the test binaries, else do not run
the test binaries.

Currently its taking 13min to complete do_check() for glibc-y2038-tests.
Test binaries are run in do_check() stage though 'run-built-tests' is
set 'no'. Which is wrong hence include 'tests-special' target inside
the 'run-built-tests' condition when set to 'yes' to avoid running the
test binaries.

Also remove 'tests-special' target from the 'tests' and 'xtests' list
when run-built-tests set to 'no' to avoid running test binaries.

After this change, no binary is run and time to complete do_check()
stage is 3min.

Upstream-Status: Inappropriate [oe-specific]

Signed-off-by: rajmohan r <semc.2042@gmail.com>
---
 .../glibc/glibc-y2038-tests_2.39.bb           |   1 +
 ...tests-special-in-run-built-tests-yes.patch | 184 ++++++++++++++++++
 2 files changed, 185 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests-yes.patch

diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb b/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
index be49ca4cb7..90c112c12f 100644
--- a/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
+++ b/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
@@ -5,6 +5,7 @@ inherit ptest features_check
 REQUIRED_DISTRO_FEATURES = "ptest"
 
 SRC_URI += "\
+	file://include-tests-special-in-run-built-tests-yes.patch \
 	file://run-ptest \
 "
 
diff --git a/meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests-yes.patch b/meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests-yes.patch
new file mode 100644
index 0000000000..25777be2eb
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests-yes.patch
@@ -0,0 +1,184 @@
+glibc-y2038-tests: include tests-special in run-built-tests yes
+
+If 'run-built-tests' is 'yes' run the test binaries, else do not run
+the test binaries.
+
+Currently its taking 13min to complete do_check() for glibc-y2038-tests.
+Test binaries are run in do_check() stage though 'run-built-tests' is
+set 'no'. Which is wrong hence include 'tests-special' target inside
+the 'run-built-tests' condition when set to 'yes' to avoid running the
+test binaries.
+
+Also remove 'tests-special' target from the 'tests' and 'xtests' list
+when run-built-tests set to 'no' to avoid running test binaries.
+
+After this change, no binary is run and time to complete do_check()
+stage is 3min.
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
+index c8b7e3f..2812e97 100644
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
+@@ -569,8 +574,10 @@ $(objpfx)check-installed-headers-c.out: \
+ 	  "$(CC) $(filter-out -std=%,$(CFLAGS)) -D_ISOMAC $(+includes)" \
+ 	  $(headers) > $@; \
+ 	$(evaluate-test)
++endif # $(run-built-tests) = yes
+ 
+ ifneq "$(CXX)" ""
++ifeq ($(run-built-tests),yes)
+ tests-special += $(objpfx)check-installed-headers-cxx.out
+ libof-check-installed-headers-cxx := testsuite
+ $(objpfx)check-installed-headers-cxx.out: \
+@@ -579,14 +586,18 @@ $(objpfx)check-installed-headers-cxx.out: \
+ 	  "$(CXX) $(filter-out -std=%,$(CXXFLAGS)) -D_ISOMAC $(+includes)" \
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
+@@ -596,7 +607,9 @@ tests-special += $(objpfx)lint-makefiles.out
+ $(objpfx)lint-makefiles.out: scripts/lint-makefiles.sh
+ 	$(SHELL) $< "$(PYTHON)" `pwd` > $@ ; \
+ 	$(evaluate-test)
++endif # $(run-built-tests) = yes
+ 
++ifeq ($(run-built-tests),yes)
+ # Link libc.a as a whole to verify that it does not contain multiple
+ # definitions of any symbols.
+ tests-special += $(objpfx)link-static-libc.out
+@@ -604,6 +617,7 @@ $(objpfx)link-static-libc.out:
+ 	$(LINK.o) $(whole-archive) -nostdlib -nostartfiles -r \
+ 	  $(objpfx)libc.a -o /dev/null > $@ 2>&1; \
+ 	$(evaluate-test)
++endif # $(run-built-tests) = yes
+ 
+ # Print test summary for tests in $1 .sum file;
+ # $2 is optional test identifier.
+@@ -684,6 +698,7 @@ endif
+ 	rm -f $(symbolic-link-list)
+ 	touch $(objpfx)testroot.pristine/install.stamp
+ 
++ifeq ($(run-built-tests),yes)
+ tests-special-notdir = $(patsubst $(objpfx)%, %, $(tests-special))
+ tests: $(tests-special)
+ 	$(..)scripts/merge-test-results.sh -s $(objpfx) "" \
+@@ -698,6 +713,7 @@ xtests:
+ 	  $(sort $(subdirs)) \
+ 	  > $(objpfx)xtests.sum
+ 	$(call summarize-tests,xtests.sum, for extra tests)
++endif # $(run-built-tests) = yes
+ 
+ # The realclean target is just like distclean for the parent, but we want
+ # the subdirs to know the difference in case they care.
+diff --git a/Makerules b/Makerules
+index 00365bc..843f1c0 100644
+--- a/Makerules
++++ b/Makerules
+@@ -1225,6 +1225,7 @@ include $(patsubst %,$(..)libof-iterator.mk,$(cpp-srcs-left))
+ endif
+ 
+ ifeq ($(build-shared),yes)
++ifeq ($(run-built-tests),yes)
+ # Generate normalized lists of symbols, versions, and data sizes.
+ # This is handy for checking against existing library binaries.
+ 
+@@ -1314,6 +1315,7 @@ tests-special += $(check-abi-list)
+ endif
+ endif
+ 
++endif # $(run-built-tests) = yes
+ endif
+ 
+ FORCE:
+diff --git a/Rules b/Rules
+index 9010c5d..6825f63 100644
+--- a/Rules
++++ b/Rules
+@@ -93,6 +93,7 @@ $(objpfx)check-installed-headers-c.out: \
+ ifneq "$(CXX)" ""
+ # If a C++ compiler is available, also test that they can be compiled
+ # in isolation as C++.
++ifeq ($(run-built-tests),yes)
+ tests-special += $(objpfx)check-installed-headers-cxx.out
+ libof-check-installed-headers-cxx := testsuite
+ $(objpfx)check-installed-headers-cxx.out: \
+@@ -101,8 +102,10 @@ $(objpfx)check-installed-headers-cxx.out: \
+ 	  "$(CXX) $(filter-out -std=%,$(CXXFLAGS)) -D_ISOMAC $(+includes)" \
+ 	  $(headers) > $@; \
+ 	$(evaluate-test)
++endif # $(run-built-tests) = yes
+ endif # $(CXX)
+ 
++ifeq ($(run-built-tests),yes)
+ # Test that a wrapper header exists in include/ for each non-sysdeps header.
+ # This script does not need $(py-env).
+ tests-special += $(objpfx)check-wrapper-headers.out
+@@ -120,6 +123,7 @@ $(objpfx)check-obsolete-constructs.out: \
+     $(..)scripts/check-obsolete-constructs.py $(headers)
+ 	$(PYTHON) $^ > $@ 2>&1; \
+ 	$(evaluate-test)
++endif # $(run-built-tests) = yes
+ 
+ endif # $(headers)
+ 
+@@ -146,9 +150,9 @@ ifeq ($(run-built-tests),no)
+ tests: $(addprefix $(objpfx),$(filter-out $(tests-unsupported), \
+                                           $(tests) $(tests-internal) \
+ 					  $(tests-container)) \
+-			     $(test-srcs)) $(tests-special) \
++			     $(test-srcs)) \
+ 			     $(tests-printers-programs)
+-xtests: tests $(xtests-special)
++xtests: tests
+ else
+ tests: $(tests:%=$(objpfx)%.out) $(tests-internal:%=$(objpfx)%.out) \
+        $(tests-container:%=$(objpfx)%.out) \
-- 
2.34.1


