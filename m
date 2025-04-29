Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DD6C3ABA5
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 18:38:11 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.1669.1745951888565823234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 11:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=khT0kGeW;
 spf=pass (domain: baylibre.com, ip: 209.85.219.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecfa716ec1so74446216d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 11:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745951887; x=1746556687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXGbjFjHT2T5FPPtx4F8UtbZxE7Z9ovbx6kxjYHtR4s=;
        b=khT0kGeWlVV19Ao0fjwU2MQuM7GGpNfGL07cIHc6eD9kt5m3EFvgWq/7w3dPPp8YAA
         aUMbhOsnAqYShLb1Ouc/CeqOfPNkmO0MlqRElc5X8lV4ChM52bwFTIWjo4BeyYXWtwhX
         fPjlOvRaJXVooCkk6onzjBodGiZAl/QeUv8sdp2Rutz6+qioNPv4UAX2VnKbI200H1Fc
         rlnlv+yLJsSHkBNT9CF6NqA7JMcf1+fJdTmtRrNYx57MEPAbTEQHmM6rlZOTYbHZM1y9
         ute1Mah8o/lnpnt7JMVnVSSaxMoUAJY2NKM4nT4rbOZa0rksiV4mYedapc98bJxAe0Qq
         dVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745951887; x=1746556687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXGbjFjHT2T5FPPtx4F8UtbZxE7Z9ovbx6kxjYHtR4s=;
        b=F5tMPVMJUkDtVJlSKegyuUqQrmz+lQq21EHHxwLYmXFRbm0mzuoRpvLuf0WTQpkQP5
         05Rj9UnNqIEShBDNiFRUGHeYSFe/fwYr/TZUf/e3I1xLFrl4QP1JioutinKKo2itdgFW
         WxSbKKdpKwNs81LNdHuaHql1vUeqoLYlMxBrvTXsLdqrifs4Tjq8GzH1CHMw9PknwtXJ
         LTy3Mz8O9we9ecJF4ELWemruEw59TR5ATM3xV05ezgmfsFipeVXel/zKtOgJqQXSgqtT
         eYxLy7anZ7O1TLIuNYyeVmrahLFAqTYJUwZFsJMCR0FYoEv3SWu9+SrfHpbHSFkEDKs0
         X0Zg==
X-Gm-Message-State: AOJu0Yw3++hVnZK65cAvi2D29Ylvrs33pmMAYq7Gm8fRUU1w0NstxlwP
	lAHolwFU57Z6rCTHMgz5B+13u3257xxMBvkJYpuqEnn+yGQy7opRDWfOO4GaW6UPPGhp2zG52EK
	/VZY=
X-Gm-Gg: ASbGncuvVa2NlmNEjl/FmlB8GBVRPFsxAJgI4zhNHQ7a3TRQUwOGQdLqL43piWtQmRP
	lqHiOcKXSLoTQ1G3tSNkh5JR6iMDuViF7tr/UGPrWFtNtPIGVIrNT/t10JLBhFhkrYMSxqvkt4T
	SKvhjb8jAGkeZ6fOp6qWDntk6bkFFvkpPqWq9OL5tEgVB03ylXaGTnY3Ao31qYdPF8F2yUqMnlA
	1uZTv2Uzy7QaMd6hpIl+swRbN76PTC7cJIJfb8lSoONZ714MV7gjyLmVZAzJTswWLHlgAb4EpHA
	OLaVy72ouDAR3DRxuOFw8d1Fj5NbmzKGpcmKXQUWqoxdgBogBQrHugmvK3UQycisY8Slkv55bbd
	xcOssk6aGlGs=
X-Google-Smtp-Source: AGHT+IHlM2hOkEeDYcZ9mZKuG8q5ECm+cgk0/sYmR9UhqoPQmEVm49hCHdK79ufzlCIdgd1laX6U+g==
X-Received: by 2002:a05:6214:ac4:b0:6e8:89bd:2b50 with SMTP id 6a1803df08f44-6f4fce68a6fmr8461036d6.7.1745951886876;
        Tue, 29 Apr 2025 11:38:06 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c09341d6sm75112096d6.32.2025.04.29.11.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:38:06 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com
Subject: [OE-core][PATCH 2/2 v5] python3-numpy: fix ptests
Date: Tue, 29 Apr 2025 14:38:01 -0400
Message-Id: <20250429183801.1125000-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429183801.1125000-1-tgamblin@baylibre.com>
References: <20250429183801.1125000-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 18:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215688

Fix the numpy ptests by doing the following:

- Add meson to ptest RDEPENDS in the recipe;
- Add python3-unittest-automake-output as a ptest RDEPENDS;
- Convert run-ptest to a shell script that sets PYTEST_DEBUG_TEMPROOT to
  a directory inside the same path that contains the script, create that
  directory, and then invoke the tests with `pytest --automake` pointed
  at the numpy path in site-packages (copying the tests into the normal
  PTEST_DIRECTORY seems to cause module import breakages in some tests).
  This also includes skipping two problematic tests which require a C
  compiler and use up a lot of space, respectively;
- Set 'IMAGE_ROOTFS_EXTRA_SPACE = "3048576"' for python3-numpy in
  core-image-ptest.bb;
- Also set 'QB_MEM:virtclass-mcextend-python3-numpy = "-m 4096"' in
  core-image-ptest.bb;
- Move python3-numpy from the PTESTS_PROBLEMS list to the PTESTS_SLOW
  one.

Results on qemux86-64:

Testsuite summary
DURATION: 87
END: /usr/lib/python3-numpy/ptest
2025-04-29T17:35
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Note that many of the skipped tests are due to the absence of
python3-mypy (which is currently in meta-python) and of a Fortran
compiler.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v5 simplifies the run-ptest script, uses the '-m' pytest flag to avoid slow
tests, uses the '-k' flag to skip tests that require gcc and/or use a lot of
storage, and no longer includes a patch to carry for disabling test_big_arrays
since that's now being handled with the '-k' option.

v4 modifies the run-ptest script to use `pytest --automake` for better test
output formatting (matching what we expect from other ptests), and adds
python3-unittest-automake-output to the ptest RDEPENDS list. Also add a note
about mypy in the commit message.

v3 includes the 0001-lib-tests-test_io-skip-test_big_arrays.patch file, which
was mentioned in the recipe in v2 but not committed before sending.

v2 cleans up the RDEPENDS lists in the recipe (after we added gcc and meson),
and also tweaks run-ptest to remove the temporary directory after the tests are
done to save space.

 .../distro/include/ptest-packagelists.inc     |  3 +-
 meta/recipes-core/images/core-image-ptest.bb  |  4 +++
 .../python/python3-numpy/run-ptest            | 16 ++++++++--
 .../python/python3-numpy_2.2.5.bb             | 32 +++++++++++--------
 4 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index f3fdededf66..51b29cf17e5 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -120,6 +120,7 @@ PTESTS_SLOW = "\
     python3-cffi \
     python3-click \
     python3-cryptography \
+    python3-numpy \
     python3-xmltodict \
     strace \
     tar \
@@ -143,7 +144,6 @@ PTESTS_SLOW:append:libc-musl = " libc-test"
 #    libpam \ # Needs pam DISTRO_FEATURE
 #    mdadm \ # tests are flaky in AB.
 #    numactl \ # qemu not (yet) configured for numa; all tests are skipped
-#    python3-numpy \ # requires even more RAM and (possibly) disk space; multiple failures
 
 PTESTS_PROBLEMS = "\
     ruby \
@@ -155,5 +155,4 @@ PTESTS_PROBLEMS = "\
     mdadm \
     numactl \
     python3-license-expression \
-    python3-numpy \
 "
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index a0ff8d9528e..73270d10676 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -27,11 +27,15 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
 # tar-ptest in particular needs more space
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-tar = "1524288"
 
+# python3-numpy-ptest requires a lot of extra space
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-python3-numpy = "3048576"
+
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM = "-m 1024"
 QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
 QB_MEM:virtclass-mcextend-python3 = "-m 2048"
 QB_MEM:virtclass-mcextend-python3-cryptography = "-m 5100"
+QB_MEM:virtclass-mcextend-python3-numpy = "-m 4096"
 QB_MEM:virtclass-mcextend-tcl = "-m 5100"
 
 TEST_SUITES = "ping ssh parselogs ptest"
diff --git a/meta/recipes-devtools/python/python3-numpy/run-ptest b/meta/recipes-devtools/python/python3-numpy/run-ptest
index 9a1c72aeb10..6e76dffc59b 100644
--- a/meta/recipes-devtools/python/python3-numpy/run-ptest
+++ b/meta/recipes-devtools/python/python3-numpy/run-ptest
@@ -1,5 +1,15 @@
-#!/usr/bin/env python3
+#!/bin/sh
 
-import numpy
-numpy.test(label='full', verbose=2)
+# By default, numpy will use /tmp as the root path for temporary files used
+# during tests, but if this is a tmpfs it may fill up quickly and cause many of
+# the tests to report "no space left on device" errors. Create a custom
+# directory for these and point pytest at it so we can take advantage of the
+# storage provided in the rootfs.
+export PYTEST_DEBUG_TEMPROOT="/usr/lib/python3-numpy/ptest/tmp"
+mkdir -p "$PYTEST_DEBUG_TEMPROOT"
 
+# test_mem_policy fails if there's no C compiler present, but we don't want to
+# include gcc as a ptest dependency, so skip that. test_big_arrays uses up a
+# large amount of storage, so skip that too.
+pytest --automake -m "not slow" -k "not test_mem_policy and not test_big_arrays" /usr/lib/python3.*/site-packages/numpy
+rm -rf "$PYTEST_DEBUG_TEMPROOT"
diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.5.bb b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
index c6a37c0a85f..f963e15b830 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
@@ -41,32 +41,36 @@ FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/_core/lib/*.a \
 "
 
 # install what is needed for numpy.test()
-RDEPENDS:${PN} = "python3-unittest \
+RDEPENDS:${PN} = "\
+                  python3-compression \
+                  python3-ctypes \
+                  python3-datetime \
                   python3-difflib \
-                  python3-pprint \
-                  python3-pickle \
-                  python3-shell \
                   python3-doctest \
-                  python3-datetime \
+                  python3-email \
+                  python3-json \
                   python3-misc \
                   python3-mmap \
+                  python3-multiprocessing \
                   python3-netclient \
                   python3-numbers \
-                  python3-pydoc \
+                  python3-pickle \
                   python3-pkgutil \
-                  python3-email \
-                  python3-compression \
-                  python3-ctypes \
+                  python3-pprint \
+                  python3-pydoc \
+                  python3-shell \
                   python3-threading \
-                  python3-multiprocessing \
-                  python3-json \
+                  python3-unittest \
 "
-RDEPENDS:${PN}-ptest += "python3-pytest \
+RDEPENDS:${PN}-ptest += "\
+                         ldd \
+                         meson \
                          python3-hypothesis \
-                         python3-sortedcontainers \
+                         python3-pytest \
                          python3-resource \
+                         python3-sortedcontainers \
                          python3-typing-extensions \
-                         ldd \
+                         python3-unittest-automake-output \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


