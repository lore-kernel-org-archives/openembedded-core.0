Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.351.1587835722198380104
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 10:28:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E0XCRP99;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id k13so15427740wrw.7
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 10:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oXM3/G48C+Cpeyd8ajwEDPvonRA1WUvB7gcPynh5slA=;
        b=E0XCRP99iFmiZp+FqYYJojqRcIqMH/Ep1noa2DBF8TkoJQf8JJ1KKVlm4nYmlWKpQV
         kZ7xuEOs7eZXPsz/nAZ29Oe5Z9uzqb1oRGCbnhzF8nvFLt2sW4Plfed5xcAqQPk2ywYc
         zFoRSUk8aE8H1E5KfZHrCoHuEtCvngSmpq6iStrA3I2j/icwiaVgSMfOoCDJOBaW4lsc
         7wsepOS9q+oGsuoYrlkNaAS7NKmKIWyQDOo2xFvUQm8Nsa45ombcAGMB266bhcPWqczr
         nglteeNtWj5zL9SdI7xSz7HpfrmqXB2MFxIChk8DkFl2TGVQ8USbrHzY78em+6/vFvIi
         f//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oXM3/G48C+Cpeyd8ajwEDPvonRA1WUvB7gcPynh5slA=;
        b=gxpg5mktMH4FfdEcfAPHKxWe1igH81ZC9thsLW2a7EOzmCWTZ2T2/mROOdEqnOVT6N
         WYCWl1i8kP0PXg6AjrEW5GOo7deTK+M4VVauR8Wqn2qdiFZfbI0fafGnw+JrcQwg2PKF
         Fvo9pPE9VZS97ozOY5WcsbPunhGEwGzzLcb9BBFHgV1yDIkgiz2xUkIh23NSSdvByUOs
         hwhVyoWDV4+7pJu5rwhhxpT70E7Lr/S1j0hJr8qgXzKjhahwhPBaruhxLZmIMblTzA5m
         9TEN32QE8inL0iFxxhzlcLmQMUWcjVK2cEaef1u66amgk3KnhWUi0MhHH7GWYgJtrN2y
         lzaA==
X-Gm-Message-State: AGi0PubwwLGwbHviihwk6iE71ATqu+6JgruKQr3TWOluSA6lGlZ7LxTj
	Dz9e6pc3CSO/YbKS3O4F9SBq6xZ7
X-Google-Smtp-Source: APiQypKEYmV25KPunat/aq9dywlSo+sAcGB8hQl8sAJRQwuQTx3VXukXiZuKFMGxE2ZRvm1tBzHJ+g==
X-Received: by 2002:adf:edcc:: with SMTP id v12mr18339207wro.317.1587835720266;
        Sat, 25 Apr 2020 10:28:40 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g25sm7751253wmh.24.2020.04.25.10.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:28:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/15] python3-numpy: update to 1.18.3
Date: Sat, 25 Apr 2020 19:28:14 +0200
Message-Id: <20200425172814.27370-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200425172814.27370-1-alex.kanavin@gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...nvert-shebang-from-python-to-python3.patch | 176 ++++++++----------
 ...up.py-remove-the-detection-of-x86-ta.patch |  32 ----
 .../python-numpy/python-numpy.inc             |   7 +-
 ...umpy_1.17.4.bb => python3-numpy_1.18.3.bb} |   0
 4 files changed, 80 insertions(+), 135 deletions(-)
 delete mode 100644 meta/recipes-devtools/python-numpy/files/0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.17.4.bb => python3-numpy_1.18.3.bb} (100%)

diff --git a/meta/recipes-devtools/python-numpy/files/0001-convert-shebang-from-python-to-python3.patch b/meta/recipes-devtools/python-numpy/files/0001-convert-shebang-from-python-to-python3.patch
index b86e131122..a416244420 100644
--- a/meta/recipes-devtools/python-numpy/files/0001-convert-shebang-from-python-to-python3.patch
+++ b/meta/recipes-devtools/python-numpy/files/0001-convert-shebang-from-python-to-python3.patch
@@ -1,4 +1,4 @@
-From c53237f90e4a3a435a20517552186d394d6d09c8 Mon Sep 17 00:00:00 2001
+From 00848d760fa3999e2bed759b585452b35d65d6ec Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 5 Mar 2020 12:02:35 +0800
 Subject: [PATCH] convert shebang from python to python3
@@ -7,62 +7,61 @@ Upstream-Status: Backport
 [https://github.com/numpy/numpy/commit/583901a074dc65145d3d6136ba7dcd02634d680b]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
 ---
- doc/DISTUTILS.rst.txt                                    | 2 +-
- doc/cdoc/numpyfilter.py                                  | 2 +-
- doc/postprocess.py                                       | 2 +-
- doc/summarize.py                                         | 2 +-
- numpy/distutils/conv_template.py                         | 2 +-
- numpy/distutils/cpuinfo.py                               | 2 +-
- numpy/distutils/from_template.py                         | 2 +-
- numpy/distutils/setup.py                                 | 2 +-
- numpy/distutils/system_info.py                           | 2 +-
- numpy/f2py/__init__.py                                   | 2 +-
- numpy/f2py/auxfuncs.py                                   | 2 +-
- numpy/f2py/capi_maps.py                                  | 2 +-
- numpy/f2py/cb_rules.py                                   | 2 +-
- numpy/f2py/cfuncs.py                                     | 2 +-
- numpy/f2py/common_rules.py                               | 2 +-
- numpy/f2py/crackfortran.py                               | 2 +-
- numpy/f2py/diagnose.py                                   | 2 +-
- numpy/f2py/f2py2e.py                                     | 2 +-
- numpy/f2py/f90mod_rules.py                               | 2 +-
- numpy/f2py/func2subr.py                                  | 2 +-
- numpy/f2py/rules.py                                      | 2 +-
- numpy/f2py/setup.py                                      | 2 +-
- numpy/f2py/use_rules.py                                  | 2 +-
- numpy/linalg/lapack_lite/clapack_scrub.py                | 2 +-
- numpy/linalg/lapack_lite/make_lite.py                    | 2 +-
- numpy/ma/bench.py                                        | 2 +-
- numpy/ma/setup.py                                        | 2 +-
- numpy/matrixlib/setup.py                                 | 2 +-
- numpy/random/examples/cython/extending.pyx               | 2 +-
- numpy/random/examples/cython/extending_distributions.pyx | 2 +-
- numpy/setup.py                                           | 2 +-
- numpy/testing/print_coercion_tables.py                   | 2 +-
- numpy/testing/setup.py                                   | 2 +-
- runtests.py                                              | 2 +-
- setup.py                                                 | 2 +-
- tools/c_coverage/c_coverage_report.py                    | 2 +-
- tools/changelog.py                                       | 2 +-
- tools/ci/push_docs_to_repo.py                            | 2 +-
- tools/cythonize.py                                       | 2 +-
- tools/find_deprecated_escaped_characters.py              | 2 +-
- tools/refguide_check.py                                  | 2 +-
- tools/swig/test/setup.py                                 | 2 +-
- tools/swig/test/testArray.py                             | 2 +-
- tools/swig/test/testFarray.py                            | 2 +-
- tools/swig/test/testFlat.py                              | 2 +-
- tools/swig/test/testFortran.py                           | 2 +-
- tools/swig/test/testMatrix.py                            | 2 +-
- tools/swig/test/testSuperTensor.py                       | 2 +-
- tools/swig/test/testTensor.py                            | 2 +-
- tools/swig/test/testVector.py                            | 2 +-
- tools/test-installed-numpy.py                            | 2 +-
- 51 files changed, 51 insertions(+), 51 deletions(-)
+ doc/DISTUTILS.rst.txt                                     | 2 +-
+ doc/cdoc/numpyfilter.py                                   | 2 +-
+ doc/postprocess.py                                        | 2 +-
+ doc/summarize.py                                          | 2 +-
+ numpy/distutils/conv_template.py                          | 2 +-
+ numpy/distutils/cpuinfo.py                                | 2 +-
+ numpy/distutils/from_template.py                          | 2 +-
+ numpy/distutils/setup.py                                  | 2 +-
+ numpy/distutils/system_info.py                            | 2 +-
+ numpy/f2py/__init__.py                                    | 2 +-
+ numpy/f2py/auxfuncs.py                                    | 2 +-
+ numpy/f2py/capi_maps.py                                   | 2 +-
+ numpy/f2py/cb_rules.py                                    | 2 +-
+ numpy/f2py/cfuncs.py                                      | 2 +-
+ numpy/f2py/common_rules.py                                | 2 +-
+ numpy/f2py/crackfortran.py                                | 2 +-
+ numpy/f2py/diagnose.py                                    | 2 +-
+ numpy/f2py/f2py2e.py                                      | 2 +-
+ numpy/f2py/f90mod_rules.py                                | 2 +-
+ numpy/f2py/func2subr.py                                   | 2 +-
+ numpy/f2py/rules.py                                       | 2 +-
+ numpy/f2py/setup.py                                       | 2 +-
+ numpy/f2py/use_rules.py                                   | 2 +-
+ numpy/linalg/lapack_lite/clapack_scrub.py                 | 2 +-
+ numpy/linalg/lapack_lite/make_lite.py                     | 2 +-
+ numpy/ma/bench.py                                         | 2 +-
+ numpy/ma/setup.py                                         | 2 +-
+ numpy/matrixlib/setup.py                                  | 2 +-
+ numpy/random/_examples/cython/extending.pyx               | 2 +-
+ numpy/random/_examples/cython/extending_distributions.pyx | 2 +-
+ numpy/setup.py                                            | 2 +-
+ numpy/testing/print_coercion_tables.py                    | 2 +-
+ numpy/testing/setup.py                                    | 2 +-
+ runtests.py                                               | 2 +-
+ setup.py                                                  | 2 +-
+ tools/c_coverage/c_coverage_report.py                     | 2 +-
+ tools/changelog.py                                        | 2 +-
+ tools/ci/push_docs_to_repo.py                             | 2 +-
+ tools/find_deprecated_escaped_characters.py               | 2 +-
+ tools/refguide_check.py                                   | 2 +-
+ tools/swig/test/setup.py                                  | 2 +-
+ tools/swig/test/testArray.py                              | 2 +-
+ tools/swig/test/testFarray.py                             | 2 +-
+ tools/swig/test/testFlat.py                               | 2 +-
+ tools/swig/test/testFortran.py                            | 2 +-
+ tools/swig/test/testMatrix.py                             | 2 +-
+ tools/swig/test/testSuperTensor.py                        | 2 +-
+ tools/swig/test/testTensor.py                             | 2 +-
+ tools/swig/test/testVector.py                             | 2 +-
+ 49 files changed, 49 insertions(+), 49 deletions(-)
 
 diff --git a/doc/DISTUTILS.rst.txt b/doc/DISTUTILS.rst.txt
-index eadde63..2402110 100644
+index bcef825..bc1700f 100644
 --- a/doc/DISTUTILS.rst.txt
 +++ b/doc/DISTUTILS.rst.txt
 @@ -59,7 +59,7 @@ SciPy pure Python package example
@@ -115,7 +114,7 @@ index 3bcb7b8..88432c8 100644
  takes templated file .xxx.src and produces .xxx file  where .xxx is
  .i or .c or .h, using the following template rules
 diff --git a/numpy/distutils/cpuinfo.py b/numpy/distutils/cpuinfo.py
-index 5802993..7f6742e 100644
+index bc97283..87502a9 100644
 --- a/numpy/distutils/cpuinfo.py
 +++ b/numpy/distutils/cpuinfo.py
 @@ -1,4 +1,4 @@
@@ -145,7 +144,7 @@ index 82a53bd..646921b 100644
  
  def configuration(parent_package='',top_path=None):
 diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
-index f94dce1..df526f6 100644
+index 4f340b6..189081d 100644
 --- a/numpy/distutils/system_info.py
 +++ b/numpy/distutils/system_info.py
 @@ -1,4 +1,4 @@
@@ -155,7 +154,7 @@ index f94dce1..df526f6 100644
  This file defines a set of system_info classes for getting
  information about various resources (libraries, library directories,
 diff --git a/numpy/f2py/__init__.py b/numpy/f2py/__init__.py
-index d146739..0a83b99 100644
+index 42e3632..09a3657 100644
 --- a/numpy/f2py/__init__.py
 +++ b/numpy/f2py/__init__.py
 @@ -1,4 +1,4 @@
@@ -175,7 +174,7 @@ index 404bdbd..d23d959 100644
  
  Auxiliary functions for f2py2e.
 diff --git a/numpy/f2py/capi_maps.py b/numpy/f2py/capi_maps.py
-index c41dd77..a3e2dc2 100644
+index ce79f68..e5d3fd2 100644
 --- a/numpy/f2py/capi_maps.py
 +++ b/numpy/f2py/capi_maps.py
 @@ -1,4 +1,4 @@
@@ -195,7 +194,7 @@ index 183d7c2..93e93fe 100644
  
  Build call-back mechanism for f2py2e.
 diff --git a/numpy/f2py/cfuncs.py b/numpy/f2py/cfuncs.py
-index d59b630..3847745 100644
+index ccb7b3a..cdb783d 100644
 --- a/numpy/f2py/cfuncs.py
 +++ b/numpy/f2py/cfuncs.py
 @@ -1,4 +1,4 @@
@@ -205,7 +204,7 @@ index d59b630..3847745 100644
  
  C declarations, CPP macros, and C functions for f2py2e.
 diff --git a/numpy/f2py/common_rules.py b/numpy/f2py/common_rules.py
-index 62c1ba2..c1825d4 100644
+index f61d881..fe510bf 100644
 --- a/numpy/f2py/common_rules.py
 +++ b/numpy/f2py/common_rules.py
 @@ -1,4 +1,4 @@
@@ -235,7 +234,7 @@ index 0241fed..6c0304c 100644
  
  import os
 diff --git a/numpy/f2py/f2py2e.py b/numpy/f2py/f2py2e.py
-index 110337f..c0789f6 100755
+index d03eff9..c17bfd9 100755
 --- a/numpy/f2py/f2py2e.py
 +++ b/numpy/f2py/f2py2e.py
 @@ -1,4 +1,4 @@
@@ -265,7 +264,7 @@ index 6010d5a..fdea0c2 100644
  
  Rules for building C/API module with f2py2e.
 diff --git a/numpy/f2py/rules.py b/numpy/f2py/rules.py
-index 1b41498..790d197 100755
+index f2f713b..f87b03c 100755
 --- a/numpy/f2py/rules.py
 +++ b/numpy/f2py/rules.py
 @@ -1,4 +1,4 @@
@@ -275,7 +274,7 @@ index 1b41498..790d197 100755
  
  Rules for building C/API module with f2py2e.
 diff --git a/numpy/f2py/setup.py b/numpy/f2py/setup.py
-index c0c50ce..044c9f2 100644
+index a8c1401..2e7a517 100644
 --- a/numpy/f2py/setup.py
 +++ b/numpy/f2py/setup.py
 @@ -1,4 +1,4 @@
@@ -344,26 +343,26 @@ index d0981d6..57534d1 100644
  from __future__ import division, print_function
  
  def configuration(parent_package='', top_path=None):
-diff --git a/numpy/random/examples/cython/extending.pyx b/numpy/random/examples/cython/extending.pyx
-index a6a4ba4..33f28f9 100644
---- a/numpy/random/examples/cython/extending.pyx
-+++ b/numpy/random/examples/cython/extending.pyx
+diff --git a/numpy/random/_examples/cython/extending.pyx b/numpy/random/_examples/cython/extending.pyx
+index 7a0dfe0..3a7f81a 100644
+--- a/numpy/random/_examples/cython/extending.pyx
++++ b/numpy/random/_examples/cython/extending.pyx
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
  #cython: language_level=3
  
  from libc.stdint cimport uint32_t
-diff --git a/numpy/random/examples/cython/extending_distributions.pyx b/numpy/random/examples/cython/extending_distributions.pyx
-index 3cefec9..7a526ab 100644
---- a/numpy/random/examples/cython/extending_distributions.pyx
-+++ b/numpy/random/examples/cython/extending_distributions.pyx
+diff --git a/numpy/random/_examples/cython/extending_distributions.pyx b/numpy/random/_examples/cython/extending_distributions.pyx
+index 1bef506..4da6a4b 100644
+--- a/numpy/random/_examples/cython/extending_distributions.pyx
++++ b/numpy/random/_examples/cython/extending_distributions.pyx
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
  #cython: language_level=3
  """
- This file shows how the distributions that are accessed through
+ This file shows how the to use a BitGenerator to create a distribution.
 diff --git a/numpy/setup.py b/numpy/setup.py
 index 4ccdaee..db06c82 100644
 --- a/numpy/setup.py
@@ -375,7 +374,7 @@ index 4ccdaee..db06c82 100644
  
  
 diff --git a/numpy/testing/print_coercion_tables.py b/numpy/testing/print_coercion_tables.py
-index 3a359f4..a9c5363 100755
+index 72b22ce..1e9a301 100755
 --- a/numpy/testing/print_coercion_tables.py
 +++ b/numpy/testing/print_coercion_tables.py
 @@ -1,4 +1,4 @@
@@ -395,7 +394,7 @@ index 7c3f2fb..bd315ee 100755
  
  
 diff --git a/runtests.py b/runtests.py
-index 23245ae..cafdb92 100755
+index a38054f..383ddaa 100755
 --- a/runtests.py
 +++ b/runtests.py
 @@ -1,4 +1,4 @@
@@ -405,7 +404,7 @@ index 23245ae..cafdb92 100755
  runtests.py [OPTIONS] [-- ARGS]
  
 diff --git a/setup.py b/setup.py
-index a205913..010884f 100755
+index d7f807b..705ea5d 100755
 --- a/setup.py
 +++ b/setup.py
 @@ -1,4 +1,4 @@
@@ -444,16 +443,6 @@ index a989668..ae53054 100755
  
  import argparse
  import subprocess
-diff --git a/tools/cythonize.py b/tools/cythonize.py
-index c81b72d..c1d4384 100755
---- a/tools/cythonize.py
-+++ b/tools/cythonize.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """ cythonize
- 
- Cythonize pyx files into C files as needed.
 diff --git a/tools/find_deprecated_escaped_characters.py b/tools/find_deprecated_escaped_characters.py
 index 6f90001..10e0378 100644
 --- a/tools/find_deprecated_escaped_characters.py
@@ -465,7 +454,7 @@ index 6f90001..10e0378 100644
  Look for escape sequences deprecated in Python 3.6.
  
 diff --git a/tools/refguide_check.py b/tools/refguide_check.py
-index c208072..798e322 100644
+index 2c62809..a19a29e 100644
 --- a/tools/refguide_check.py
 +++ b/tools/refguide_check.py
 @@ -1,4 +1,4 @@
@@ -495,7 +484,7 @@ index 8d9c797..54ffe71 100755
  
  # System imports
 diff --git a/tools/swig/test/testFarray.py b/tools/swig/test/testFarray.py
-index 0037dc9..bedf384 100755
+index e8bf711..b377f7c 100755
 --- a/tools/swig/test/testFarray.py
 +++ b/tools/swig/test/testFarray.py
 @@ -1,4 +1,4 @@
@@ -564,16 +553,3 @@ index 45e763b..067b922 100755
  from __future__ import division, absolute_import, print_function
  
  # System imports
-diff --git a/tools/test-installed-numpy.py b/tools/test-installed-numpy.py
-index 5240253..fd7541c 100755
---- a/tools/test-installed-numpy.py
-+++ b/tools/test-installed-numpy.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- from __future__ import division, absolute_import, print_function
- 
- # A simple script to test the installed version of numpy by calling
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/python-numpy/files/0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch b/meta/recipes-devtools/python-numpy/files/0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch
deleted file mode 100644
index 9da6a2b3da..0000000000
--- a/meta/recipes-devtools/python-numpy/files/0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b881e0b2ba9cf1a4aa351a1c1ea90b1e1776ce21 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 12 Aug 2019 15:37:36 +0200
-Subject: [PATCH] numpy/random/setup.py: remove the detection of x86 targets
- via uname()
-
-This was badly breaking compilation for ARM targets (and possibly
-other non-x86 targets); if -msse2 is desirable for x86 builds it has
-to be passed through another channel.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- numpy/random/setup.py | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/numpy/random/setup.py b/numpy/random/setup.py
-index a1bf3b8..60fb534 100644
---- a/numpy/random/setup.py
-+++ b/numpy/random/setup.py
-@@ -49,11 +49,6 @@ def configuration(parent_package='', top_path=None):
-     elif not is_msvc:
-         # Some bit generators require c99
-         EXTRA_COMPILE_ARGS += ['-std=c99']
--        INTEL_LIKE = any(arch in platform.machine() 
--                         for arch in ('x86', 'i686', 'i386', 'amd64'))
--        if INTEL_LIKE:
--            # Assumes GCC or GCC-like compiler
--            EXTRA_COMPILE_ARGS += ['-msse2']
- 
-     # Use legacy integer variable sizes
-     LEGACY_DEFS = [('NP_RANDOM_LEGACY', '1')]
diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index 42032a04a8..727755393e 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -7,11 +7,10 @@ SRCNAME = "numpy"
 
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
-           file://0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch \
            file://0001-convert-shebang-from-python-to-python3.patch \
            "
-SRC_URI[md5sum] = "9147c3ee75e58d657b5b8b5a4f3564e0"
-SRC_URI[sha256sum] = "fb0415475e673cb9a6dd816df999e0ab9f86fa3af2b1770944e7288d2bea4ac9"
+SRC_URI[md5sum] = "cd631c761f141d382b4e1b31c8232fc0"
+SRC_URI[sha256sum] = "93ee59ec38f3bf8f9a42d5f4301f60e6825a4a6385a145f70badcd2bf2a11134"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
@@ -19,6 +18,8 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 # Needed for building with gcc 4.x from centos 7
 CFLAGS_append_class-native = " -std=c99"
 
+DEPENDS += "python3-cython-native"
+
 S = "${WORKDIR}/numpy-${PV}"
 
 CLEANBROKEN = "1"
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.17.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.18.3.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.17.4.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.18.3.bb
-- 
2.26.1

