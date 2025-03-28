Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F88C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:18:36 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.10923.1743167909438153004
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 06:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ABoY37hF;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8fca43972so21467726d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743167908; x=1743772708; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WH8HkUyMlE+iHGvInibsB2ZDJRC25noYlMtCsRTA4UI=;
        b=ABoY37hF2PuCpGxqXTWAXgx6Yq92OsLUy83CMfQnsvHD/+VEX/ocCOet+p6izIVWFu
         kzl9HgJaU5fV7Ac1WeO1dBWWCzmJI1f3iDu9femIJLbwJZgyD2l8OZkhD2vKa7tcREj6
         JgqXQWhhJmCg/H96ghvtTDFESJvQ7ssDRrdCwG81w3G7LN5FVCgwCZ87NSgwhw7qfGzr
         hcD5WBW2ip+H8PNIfGdiI27OYse9vsY23hO1Y6M9j6HDlYKHqBnq/UnUfIUUrtV4btR7
         UG75SoD60U6uFmepUm/olk84dUPAqpeySdJ1xfYEfT1z1bH0eJ3S49iVT72Vs0oQOm9D
         nrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743167908; x=1743772708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WH8HkUyMlE+iHGvInibsB2ZDJRC25noYlMtCsRTA4UI=;
        b=S+xtXrubqhzUzF6mWO73rBgWi8KoxcVJzgN+Ya2aVI28dPShitX8nxpcZMgQZt2W10
         5uB0wWynwaHC9Lq4WW5IUMCf11BVVZz1D7Te9tZCm+S6mXWALmnIX4XUVPRAo4ltE6dz
         MUQdIaTOqPC28DfrkyrzYlRy+s5Xa5v+J2b4frckMYhhLklEqiXZmxaeguw2N+pbIqTj
         ttakdK2z+SjzNRHgKb1v8BEaQi8Af3sOkEFOrt9DFfq8cvfv8C9YxL4EPwpgc5b7hqk3
         X0QGODQY1EEwYW76npONQSsAYqWBSAepyaGPHrAaFWMOU2RLksm+TUBk7mAwwyvCUlry
         boCw==
X-Gm-Message-State: AOJu0YytBfMdA1tLyn3iGkXDTC7gn2X9lGiMRAROIua6LUfkJFBfNxAN
	WpI21BZv4YNGUCJTchMrhZ0qMBohBgUAbPkQqydNBxssSLKaqxaPVi1zsLpM6422uNQcfGQzQ/Y
	U6J/I3E1atQIijGtZEuuG8AsmGV4=
X-Gm-Gg: ASbGncskK/DiMDUZYl4RNf1Ea63b7YTY/sJk9aKWLSfZc9mK10roXkFJNEZjUesYzcr
	pLGQ34D6cLiswoyM2MBzNph6iZvXuoKUcFYSCcr4gUv305L5dBWBWym2Rm/aA+y5272feH5z+07
	NfIv70vTElOdzlrY9qq+aijL95qrJFvvKtj6Ig6cUIplCbDG5hrFwD6cJCfdxv
X-Google-Smtp-Source: AGHT+IFE/f5OEuqKMPk2kiZ+lOsfzl5ULub99wy8h5d6Gl+/ZX7FIHw9n3K9js7Aa+Mtdho2Qg9jCpDxm2O7oPKNxqU=
X-Received: by 2002:a05:6214:f2d:b0:6e8:97c0:76f8 with SMTP id
 6a1803df08f44-6ed238bcff4mr113471026d6.27.1743167908214; Fri, 28 Mar 2025
 06:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250328124026.817680-1-semc.2042@gmail.com>
In-Reply-To: <20250328124026.817680-1-semc.2042@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Mar 2025 14:18:16 +0100
X-Gm-Features: AQ5f1JqjUJhiGx3q6AAMbIxDY2E8qMHqRaV3WrVmEm1g-45Zz-ai0fooVwMZu8s
Message-ID: <CANNYZj-iggtcaaeJfD5opNQEr8A0TFaqaLuEuYwUCXrk=ZVoKw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc-y2038-tests:add tests-special
 in run-built-tests yes
To: semc.2042@gmail.com, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 13:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213838

Thanks for the patch. It does need to be rebased to master, and
submitted for that branch first, then backported to scarthgap.

Also, Khem can you take a look please?

Alex

On Fri, 28 Mar 2025 at 13:40, rajmohan r via lists.openembedded.org
<semc.2042=gmail.com@lists.openembedded.org> wrote:
>
> If 'run-built-tests' is 'yes' run the test binaries, else do not run
> the test binaries.
>
> Currently its taking 13min to complete do_check() for glibc-y2038-tests.
> Test binaries are run in do_check() stage though 'run-built-tests' is
> set 'no'. Which is wrong hence include 'tests-special' target inside
> the 'run-built-tests' condition when set to 'yes' to avoid running the
> test binaries.
>
> Also remove 'tests-special' target from the 'tests' and 'xtests' list
> when run-built-tests set to 'no' to avoid running test binaries.
>
> After this change, no binary is run and time to complete do_check()
> stage is 3min.
>
> Upstream-Status: Inappropriate [oe-specific]
>
> Signed-off-by: rajmohan r <semc.2042@gmail.com>
> ---
>  .../glibc/glibc-y2038-tests_2.39.bb           |   1 +
>  ...tests-special-in-run-built-tests-yes.patch | 184 ++++++++++++++++++
>  2 files changed, 185 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests-yes.patch
>
> diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb b/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
> index be49ca4cb7..90c112c12f 100644
> --- a/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
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
> index 0000000000..25777be2eb
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests-yes.patch
> @@ -0,0 +1,184 @@
> +glibc-y2038-tests: include tests-special in run-built-tests yes
> +
> +If 'run-built-tests' is 'yes' run the test binaries, else do not run
> +the test binaries.
> +
> +Currently its taking 13min to complete do_check() for glibc-y2038-tests.
> +Test binaries are run in do_check() stage though 'run-built-tests' is
> +set 'no'. Which is wrong hence include 'tests-special' target inside
> +the 'run-built-tests' condition when set to 'yes' to avoid running the
> +test binaries.
> +
> +Also remove 'tests-special' target from the 'tests' and 'xtests' list
> +when run-built-tests set to 'no' to avoid running test binaries.
> +
> +After this change, no binary is run and time to complete do_check()
> +stage is 3min.
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
> +index c8b7e3f..2812e97 100644
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
> +@@ -569,8 +574,10 @@ $(objpfx)check-installed-headers-c.out: \
> +         "$(CC) $(filter-out -std=%,$(CFLAGS)) -D_ISOMAC $(+includes)" \
> +         $(headers) > $@; \
> +       $(evaluate-test)
> ++endif # $(run-built-tests) = yes
> +
> + ifneq "$(CXX)" ""
> ++ifeq ($(run-built-tests),yes)
> + tests-special += $(objpfx)check-installed-headers-cxx.out
> + libof-check-installed-headers-cxx := testsuite
> + $(objpfx)check-installed-headers-cxx.out: \
> +@@ -579,14 +586,18 @@ $(objpfx)check-installed-headers-cxx.out: \
> +         "$(CXX) $(filter-out -std=%,$(CXXFLAGS)) -D_ISOMAC $(+includes)" \
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
> +@@ -596,7 +607,9 @@ tests-special += $(objpfx)lint-makefiles.out
> + $(objpfx)lint-makefiles.out: scripts/lint-makefiles.sh
> +       $(SHELL) $< "$(PYTHON)" `pwd` > $@ ; \
> +       $(evaluate-test)
> ++endif # $(run-built-tests) = yes
> +
> ++ifeq ($(run-built-tests),yes)
> + # Link libc.a as a whole to verify that it does not contain multiple
> + # definitions of any symbols.
> + tests-special += $(objpfx)link-static-libc.out
> +@@ -604,6 +617,7 @@ $(objpfx)link-static-libc.out:
> +       $(LINK.o) $(whole-archive) -nostdlib -nostartfiles -r \
> +         $(objpfx)libc.a -o /dev/null > $@ 2>&1; \
> +       $(evaluate-test)
> ++endif # $(run-built-tests) = yes
> +
> + # Print test summary for tests in $1 .sum file;
> + # $2 is optional test identifier.
> +@@ -684,6 +698,7 @@ endif
> +       rm -f $(symbolic-link-list)
> +       touch $(objpfx)testroot.pristine/install.stamp
> +
> ++ifeq ($(run-built-tests),yes)
> + tests-special-notdir = $(patsubst $(objpfx)%, %, $(tests-special))
> + tests: $(tests-special)
> +       $(..)scripts/merge-test-results.sh -s $(objpfx) "" \
> +@@ -698,6 +713,7 @@ xtests:
> +         $(sort $(subdirs)) \
> +         > $(objpfx)xtests.sum
> +       $(call summarize-tests,xtests.sum, for extra tests)
> ++endif # $(run-built-tests) = yes
> +
> + # The realclean target is just like distclean for the parent, but we want
> + # the subdirs to know the difference in case they care.
> +diff --git a/Makerules b/Makerules
> +index 00365bc..843f1c0 100644
> +--- a/Makerules
> ++++ b/Makerules
> +@@ -1225,6 +1225,7 @@ include $(patsubst %,$(..)libof-iterator.mk,$(cpp-srcs-left))
> + endif
> +
> + ifeq ($(build-shared),yes)
> ++ifeq ($(run-built-tests),yes)
> + # Generate normalized lists of symbols, versions, and data sizes.
> + # This is handy for checking against existing library binaries.
> +
> +@@ -1314,6 +1315,7 @@ tests-special += $(check-abi-list)
> + endif
> + endif
> +
> ++endif # $(run-built-tests) = yes
> + endif
> +
> + FORCE:
> +diff --git a/Rules b/Rules
> +index 9010c5d..6825f63 100644
> +--- a/Rules
> ++++ b/Rules
> +@@ -93,6 +93,7 @@ $(objpfx)check-installed-headers-c.out: \
> + ifneq "$(CXX)" ""
> + # If a C++ compiler is available, also test that they can be compiled
> + # in isolation as C++.
> ++ifeq ($(run-built-tests),yes)
> + tests-special += $(objpfx)check-installed-headers-cxx.out
> + libof-check-installed-headers-cxx := testsuite
> + $(objpfx)check-installed-headers-cxx.out: \
> +@@ -101,8 +102,10 @@ $(objpfx)check-installed-headers-cxx.out: \
> +         "$(CXX) $(filter-out -std=%,$(CXXFLAGS)) -D_ISOMAC $(+includes)" \
> +         $(headers) > $@; \
> +       $(evaluate-test)
> ++endif # $(run-built-tests) = yes
> + endif # $(CXX)
> +
> ++ifeq ($(run-built-tests),yes)
> + # Test that a wrapper header exists in include/ for each non-sysdeps header.
> + # This script does not need $(py-env).
> + tests-special += $(objpfx)check-wrapper-headers.out
> +@@ -120,6 +123,7 @@ $(objpfx)check-obsolete-constructs.out: \
> +     $(..)scripts/check-obsolete-constructs.py $(headers)
> +       $(PYTHON) $^ > $@ 2>&1; \
> +       $(evaluate-test)
> ++endif # $(run-built-tests) = yes
> +
> + endif # $(headers)
> +
> +@@ -146,9 +150,9 @@ ifeq ($(run-built-tests),no)
> + tests: $(addprefix $(objpfx),$(filter-out $(tests-unsupported), \
> +                                           $(tests) $(tests-internal) \
> +                                         $(tests-container)) \
> +-                           $(test-srcs)) $(tests-special) \
> ++                           $(test-srcs)) \
> +                            $(tests-printers-programs)
> +-xtests: tests $(xtests-special)
> ++xtests: tests
> + else
> + tests: $(tests:%=$(objpfx)%.out) $(tests-internal:%=$(objpfx)%.out) \
> +        $(tests-container:%=$(objpfx)%.out) \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213834): https://lists.openembedded.org/g/openembedded-core/message/213834
> Mute This Topic: https://lists.openembedded.org/mt/111953097/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

