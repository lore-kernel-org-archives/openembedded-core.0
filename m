Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85861C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 19:34:15 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.7397.1744313651577578448
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 12:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VpYdP4Ln;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6ecf99dd567so13857466d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744313650; x=1744918450; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zrTRFbvBsJX/bTOtHSxj1zt2GO0e5TxGYSsVI1i8vGg=;
        b=VpYdP4Ln0gT1NBSW1llBPy9uUiQK0YkWNOt3ok25vvAdUq78tRZCotkuUScswpNDGQ
         30W2JfLXRYFH67voN/9BS/WVbHlmtP3eOJtDzMabtmeDEKUMFx25Icgd69L7iP4nkzGq
         klxHThgt2CwTK+BM6W/cmF8y1ls/QqD0BgURu/3FGUjuqtpEsUl+DGtvCFJPYYTD2fzr
         fJj8hDRJVi8Z8B9iqOMxtAgPWTyF7McRR3kYlQMwWZfMpsOiXeTSf1tsCdejtFtLUkpL
         GAnqoksK0hovQrIZHByk5qOGxDRrppxgWYnbyAyvx6SwiEoJxpp7bCkZaothAQo7jO+t
         Dz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744313650; x=1744918450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrTRFbvBsJX/bTOtHSxj1zt2GO0e5TxGYSsVI1i8vGg=;
        b=lwZoRJtPCID+4hXnQWw2T6Hu11UZy5InIY5m4gV34oN21+Oo6JZoLtYg6epNz3MfMb
         oGY+giCAH80YEQbQkrDlWidmUsPu2PKSNG2/ErIPOxr8+sAWxlYEFPexgc0srZBmiaEw
         TXJ3QFdmDQFHHzddeBWXYpIJ/GeHrK8A1NMzXYyfd8guCfYVt6eTeX0lSKl8dYvkNxL2
         rK/TVhOH56+oqQjx3g5b1NDiCjf7ZL3KAF0HcBxQnEN/Vtq4t6ckiMn3VHYcYUOv/OMJ
         UOZEBSZR7dTqf6BIWzKrgP8wLBudPgi4AwpckT4MGMWwRjEx4NJqQepHhJhsD6odOZz8
         E9LA==
X-Gm-Message-State: AOJu0YyrIhZavj+N3VQYT+dpidH+Wq5a64rYQcpmmO6xgKbVFWIdLt2V
	kI7aKtb9Q+kQyf5KrbN1/LnpbpyolBf9ajhKH35mSuXxgYUpwWmR2FY4pDqz0memx3eqTyGOGNW
	hBL5HVLq9FT0DlQ+6SLYynTZYJzU=
X-Gm-Gg: ASbGncuaK2QVF9FsSR/CcT83hOWDImppttPBVFdr9zpCtLsKrMc/wd/uRDNY2ML3K8t
	3TZpWtwLjp3zP1JMi8MNGIlBJZI0OE1KP4ZH8YALLMRJMzDtYuAqUi/9Em3QC9EpO27mXiq5iFL
	ZaIAV6gNWn4zH54xfnKmZZO79zov9vItBZMzphqYfv7CkBNf2CemgsvUa2
X-Google-Smtp-Source: AGHT+IGaTHYnzgamnswWs0I14W2Sajua/kZJ/DW1faREI4C1vxZ0KYP+IEaAMCubeNpA4M2PRQdvOPMxoFH7GHaa2tE=
X-Received: by 2002:ad4:5f4b:0:b0:6e6:668a:a27f with SMTP id
 6a1803df08f44-6f230d3e9e8mr1574376d6.17.1744313650406; Thu, 10 Apr 2025
 12:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250410100703.1006340-1-semc.2042@gmail.com>
In-Reply-To: <20250410100703.1006340-1-semc.2042@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 21:33:59 +0200
X-Gm-Features: ATxdqUEOExYb9tSLCn0ELJAR19nV1GounsnW-G9MS3xKsCU0AHCQ2XlhkX8YqIo
Message-ID: <CANNYZj-vNYxOSBoUw=EhYbzN-s3vEKJZ+oROpo3P+tRm1VNXsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc-y2038-tests:add tests-special in
 run-built-tests yes
To: semc.2042@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 19:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214705

Thanks. This patch is invasive and adds to glibc maintenance burden.
Which begs the question: do we need the recipe at all? Is there a
particular reason you started looking into this issue?

It is by now well established that glibc itself works as it should,
that all affected 32 bit targets are configured to use 64 bit time_t,
and that any lingering y2038 issues are in components other than the c
library, and usually come from C programming mistakes (e.g. storing
timestamps in long). Maybe we can simply remove the recipe?

Alex

On Thu, 10 Apr 2025 at 12:07, rajmohan r via lists.openembedded.org
<semc.2042=gmail.com@lists.openembedded.org> wrote:
>
> If 'run-built-tests' is 'yes' run the test binaries, else do not run
> the test binaries.
>
> Currently its taking 20min to complete do_check() for glibc-y2038-tests.
> Test binaries are run in do_check() stage though 'run-built-tests' is
> set 'no'. Which is wrong hence include 'tests-special' target inside
> the 'run-built-tests' condition when set to 'yes' to avoid running the
> test binaries.
>
> Also remove 'tests-special' target from the 'tests' and 'xtests' list
> when run-built-tests set to 'no' to avoid running test binaries.
>
> After this change, no binary is run and time to complete do_check()
> stage is 7min.
>
> Upstream-Status: Inappropriate [oe-specific]
>
> Signed-off-by: rajmohan r <semc.2042@gmail.com>
> ---
>  .../glibc/glibc-y2038-tests_2.41.bb           |   1 +
>  ...tests-special-in-run-built-tests-yes.patch | 184 ++++++++++++++++++
>  2 files changed, 185 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests-yes.patch
>
> diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb b/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
> index 9ea09a4e12..2e1f9b02c9 100644
> --- a/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
> +++ b/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
> @@ -5,6 +5,7 @@ inherit ptest features_check
>  REQUIRED_DISTRO_FEATURES = "ptest"
>
>  SRC_URI += "\
> +       file://include-tests-special-in-run-built-tests-yes.patch \
>         file://run-ptest \
>  "
>
> diff --git a/meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests-yes.patch b/meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests-yes.patch
> new file mode 100644
> index 0000000000..f8f78c5863
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests-yes.patch
> @@ -0,0 +1,184 @@
> +glibc-y2038-tests: include tests-special in run-built-tests yes
> +
> +If 'run-built-tests' is 'yes' run the test binaries, else do not run
> +the test binaries.
> +
> +Currently its taking 20min to complete do_check() for glibc-y2038-tests.
> +Test binaries are run in do_check() stage though 'run-built-tests' is
> +set 'no'. Which is wrong hence include 'tests-special' target inside
> +the 'run-built-tests' condition when set to 'yes' to avoid running the
> +test binaries.
> +
> +Also remove 'tests-special' target from the 'tests' and 'xtests' list
> +when run-built-tests set to 'no' to avoid running test binaries.
> +
> +After this change, no binary is run and time to complete do_check()
> +stage is 7min.
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: rajmohan r <semc.2042@gmail.com>
> +---
> + Makefile  | 16 ++++++++++++++++
> + Makerules |  2 ++
> + Rules     |  8 ++++++--
> + 3 files changed, 24 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 5c20ed3..ed95e99 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -545,21 +545,26 @@ tests-clean: do-tests-clean
> +       @$(MAKE) subdir_testclean no_deps=t
> +
> + ifneq (,$(CXX))
> ++ifeq ($(run-built-tests),yes)
> + vpath c++-types.data $(+sysdep_dirs)
> +
> + tests-special += $(objpfx)c++-types-check.out
> + $(objpfx)c++-types-check.out: c++-types.data scripts/check-c++-types.sh
> +       scripts/check-c++-types.sh $< $(CXX) $(filter-out -std=gnu11 $(+gccwarn-c),$(CFLAGS)) $(CPPFLAGS) > $@; \
> +       $(evaluate-test)
> ++endif # $(run-built-tests) = yes
> + endif
> +
> ++ifeq ($(run-built-tests),yes)
> + tests-special += $(objpfx)check-local-headers.out
> + $(objpfx)check-local-headers.out: scripts/check-local-headers.sh
> +       AWK='$(AWK)' scripts/check-local-headers.sh \
> +         "$(includedir)" "$(objpfx)" < /dev/null > $@; \
> +       $(evaluate-test)
> ++endif # $(run-built-tests) = yes
> +
> + ifneq "$(headers)" ""
> ++ifeq ($(run-built-tests),yes)
> + # Special test of all the installed headers in this directory.
> + tests-special += $(objpfx)check-installed-headers-c.out
> + libof-check-installed-headers-c := testsuite
> +@@ -570,8 +575,10 @@ $(objpfx)check-installed-headers-c.out: \
> +            $(filter-out -std=%,$(CFLAGS)) -D_ISOMAC $(+includes)" \
> +         $(headers) > $@; \
> +       $(evaluate-test)
> ++endif # $(run-built-tests) = yes
> +
> + ifneq "$(CXX)" ""
> ++ifeq ($(run-built-tests),yes)
> + tests-special += $(objpfx)check-installed-headers-cxx.out
> + libof-check-installed-headers-cxx := testsuite
> + $(objpfx)check-installed-headers-cxx.out: \
> +@@ -581,14 +588,18 @@ $(objpfx)check-installed-headers-cxx.out: \
> +            $(filter-out -std=%,$(CXXFLAGS)) -D_ISOMAC $(+includes)" \
> +         $(headers) > $@; \
> +       $(evaluate-test)
> ++endif # $(run-built-tests) = yes
> + endif # $(CXX)
> +
> ++ifeq ($(run-built-tests),yes)
> + tests-special += $(objpfx)check-wrapper-headers.out
> + $(objpfx)check-wrapper-headers.out: scripts/check-wrapper-headers.py $(headers)
> +       $(PYTHON) $< --root=. --subdir=. $(headers) \
> +         --generated $(common-generated) > $@; $(evaluate-test)
> ++endif # $(run-built-tests) = yes
> + endif # $(headers)
> +
> ++ifeq ($(run-built-tests),yes)
> + # Lint all Makefiles; including this one.  Pass `pwd` as the source
> + # directory since the top-level Makefile is in the root of the source
> + # tree and these tests are run from there.  We add light-weight linting
> +@@ -598,7 +609,9 @@ tests-special += $(objpfx)lint-makefiles.out
> + $(objpfx)lint-makefiles.out: scripts/lint-makefiles.sh
> +       $(SHELL) $< "$(PYTHON)" `pwd` > $@ ; \
> +       $(evaluate-test)
> ++endif # $(run-built-tests) = yes
> +
> ++ifeq ($(run-built-tests),yes)
> + # Link libc.a as a whole to verify that it does not contain multiple
> + # definitions of any symbols.
> + tests-special += $(objpfx)link-static-libc.out
> +@@ -606,6 +619,7 @@ $(objpfx)link-static-libc.out:
> +       $(LINK.o) $(whole-archive) -nostdlib -nostartfiles -r \
> +         $(objpfx)libc.a -o /dev/null > $@ 2>&1; \
> +       $(evaluate-test)
> ++endif # $(run-built-tests) = yes
> +
> + # Print test summary for tests in $1 .sum file;
> + # $2 is optional test identifier.
> +@@ -686,6 +700,7 @@ endif
> +       rm -f $(symbolic-link-list)
> +       touch $(objpfx)testroot.pristine/install.stamp
> +
> ++ifeq ($(run-built-tests),yes)
> + tests-special-notdir = $(patsubst $(objpfx)%, %, $(tests-special))
> + tests: $(tests-special)
> +       $(..)scripts/merge-test-results.sh -s $(objpfx) "" \
> +@@ -700,6 +715,7 @@ xtests:
> +         $(sort $(subdirs)) \
> +         > $(objpfx)xtests.sum
> +       $(call summarize-tests,xtests.sum, for extra tests)
> ++endif # $(run-built-tests) = yes
> +
> + # The realclean target is just like distclean for the parent, but we want
> + # the subdirs to know the difference in case they care.
> +diff --git a/Makerules b/Makerules
> +index ada6168..40b5ef2 100644
> +--- a/Makerules
> ++++ b/Makerules
> +@@ -1232,6 +1232,7 @@ include $(patsubst %,$(..)libof-iterator.mk,$(cpp-srcs-left))
> + endif
> +
> + ifeq ($(build-shared),yes)
> ++ifeq ($(run-built-tests),yes)
> + # Generate normalized lists of symbols, versions, and data sizes.
> + # This is handy for checking against existing library binaries.
> +
> +@@ -1321,6 +1322,7 @@ tests-special += $(check-abi-list)
> + endif
> + endif
> +
> ++endif # $(run-built-tests) = yes
> + endif
> +
> + FORCE:
> +diff --git a/Rules b/Rules
> +index c8adc00..5a77516 100644
> +--- a/Rules
> ++++ b/Rules
> +@@ -94,6 +94,7 @@ $(objpfx)check-installed-headers-c.out: \
> + ifneq "$(CXX)" ""
> + # If a C++ compiler is available, also test that they can be compiled
> + # in isolation as C++.
> ++ifeq ($(run-built-tests),yes)
> + tests-special += $(objpfx)check-installed-headers-cxx.out
> + libof-check-installed-headers-cxx := testsuite
> + $(objpfx)check-installed-headers-cxx.out: \
> +@@ -103,8 +104,10 @@ $(objpfx)check-installed-headers-cxx.out: \
> +            $(filter-out -std=%,$(CXXFLAGS)) -D_ISOMAC $(+includes)" \
> +         $(headers) > $@; \
> +       $(evaluate-test)
> ++endif # $(run-built-tests) = yes
> + endif # $(CXX)
> +
> ++ifeq ($(run-built-tests),yes)
> + # Test that a wrapper header exists in include/ for each non-sysdeps header.
> + # This script does not need $(py-env).
> + tests-special += $(objpfx)check-wrapper-headers.out
> +@@ -112,6 +115,7 @@ $(objpfx)check-wrapper-headers.out: \
> +   $(..)scripts/check-wrapper-headers.py $(headers)
> +       $(PYTHON) $< --root=$(..) --subdir=$(subdir) $(headers) > $@; \
> +         $(evaluate-test)
> ++endif # $(run-built-tests) = yes
> +
> + # Test that none of the headers installed by this directory use certain
> + # obsolete constructs (e.g. legacy BSD typedefs superseded by stdint.h).
> +@@ -153,9 +157,9 @@ tests: $(addprefix $(objpfx),$(filter-out $(tests-unsupported), \
> +                                         $(tests-malloc-check:%=%-malloc-check) \
> +                                         $(tests-malloc-hugetlb1:%=%-malloc-hugetlb1) \
> +                                         $(tests-malloc-hugetlb2:%=%-malloc-hugetlb2)) \
> +-                           $(test-srcs)) $(tests-special) \
> ++                           $(test-srcs)) \
> +                            $(tests-printers-programs)
> +-xtests: tests $(xtests-special)
> ++xtests: tests
> + else # $(run-built-tests) != no
> + # The $(xtests) dependency ensures that xtests are always built.
> + tests: $(tests:%=$(objpfx)%.out) $(tests-internal:%=$(objpfx)%.out) \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214636): https://lists.openembedded.org/g/openembedded-core/message/214636
> Mute This Topic: https://lists.openembedded.org/mt/112188476/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

