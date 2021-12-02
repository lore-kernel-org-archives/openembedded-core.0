Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0F2C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 05:12:06 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.4570.1638421925698792029
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 21:12:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hJptJWzP;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id gt5so19696169pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 21:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FZ7ciLTS7LGQhSuHr7/6sineKFCL6n18S+ykKwXDaHs=;
        b=hJptJWzPGyIWb9T/NGrnm4TN3ekpJHD+o0pEP66B7WRekn/oQ2OzpuHTf2Ia35HzXq
         eYQWdflpnSPWBQvoxMGCtyGJpwDyX4bXoNb+MhIVj4jpswjMGLCXpZ5jmDLC0n8baWmV
         BXVGDq74EyDDVBzbFTEe+hKPYUXvNZ/cxhiKlOHHjq7CQQ7EmgY0wX0HJ7HViFv+08nC
         hHm5NDoZXC0gMEtrbonuAJlPs0wzLCb+i9rQR4U4iey+4AcTLovbGhGtKsS9KPkVvskV
         7/zpFpmGpkAX5kNr9aO6vA9FSPXOUSLEBckmmcn6UmjYISbiT6ClXhjoS2kMrhEyS3yP
         nNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FZ7ciLTS7LGQhSuHr7/6sineKFCL6n18S+ykKwXDaHs=;
        b=ewY+3D78RojSbdR0KDPNutY8w+MPfS12G1mfIuLAZRufA1iZxri6iD/6xwLiuVuazu
         o6ZWyFWNo12BCmtP9QzeZYJe4btAlxMTUHsL6dz9P0sa2gLl04xfmS67ilHOK0JCU7li
         S/+2/T21/ZM7eY0Fo5d41RlqvgCWscleVRmMrSCcvTgKatVp/Y9sS9dblPHyHWueYBzA
         MDBFk1bn7R2JIS7jxArQiOGEO+8ebQah/XmaKuE9xq+pyGeHFOFBb4nlylAYvHoUEQtR
         iPss0wCca5lP2WGcI5A3ete0lPt3Gu0jNRWgXOv3V8AyxitfJz3BAfW+rvp8sTmhV48i
         2r2Q==
X-Gm-Message-State: AOAM531iDTy7YFQ479YRZhjxOmzTtRfBhzPtTjqTgYCsXhLe7djD0kvg
	saFsdu+DFuDHD+kY3xcyVcQprv1bEKWVEA==
X-Google-Smtp-Source: 
 ABdhPJzl6w3VjYXcAf0YhhabHezvK9neIYBp8MEb7PED1SJOJ87BA1jvNDgrQtIqlVZqRh7TTVZ7Lw==
X-Received: by 2002:a17:902:da8e:b0:141:fa9d:806d with SMTP id
 j14-20020a170902da8e00b00141fa9d806dmr13161450plx.26.1638421924671;
        Wed, 01 Dec 2021 21:12:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 m12sm1661884pfk.27.2021.12.01.21.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 21:12:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] boost: Fix build on arches with no atomics
Date: Wed,  1 Dec 2021 21:12:01 -0800
Message-Id: <20211202051201.1774549-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 05:12:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159071

1.77 is broken on architectures which dont have lockfree atomics e.g.
armv5 [1], backport relevant fixes from upstream to unbreak the build

[1] https://github.com/boostorg/math/issues/673

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...th_no_atomic_int-on-the-command-line.patch |  53 ++++++
 ...oft-failure-in-bernoulli_details_hpp.patch | 151 ++++++++++++++++++
 meta/recipes-support/boost/boost_1.77.0.bb    |   2 +
 3 files changed, 206 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
 create mode 100644 meta/recipes-support/boost/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch

diff --git a/meta/recipes-support/boost/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch b/meta/recipes-support/boost/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
new file mode 100644
index 00000000000..b05b7950844
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
@@ -0,0 +1,53 @@
+From 32bd6197353f6ea8e5bef01f09e25c944141acfc Mon Sep 17 00:00:00 2001
+From: jzmaddock <john@johnmaddock.co.uk>
+Date: Wed, 1 Sep 2021 18:54:54 +0100
+Subject: [PATCH] Allow definition of BOOST_MATH_NO_ATOMIC_INT on the command
+ line. Allows us to test/emulate platforms with no atomic integers.
+
+[buildroot@heine.tech:
+  - backport from boostorg/math 32bd6197353f6ea8e5bef01f09e25c944141acfc
+  - alter path to match boost release
+]
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+---
+Upstream-Status: Backport [https://github.com/boostorg/math/pull/684/commits/32bd6197353f6ea8e5bef01f09e25c944141acfc]
+ boost/math/tools/atomic.hpp | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/boost/math/tools/atomic.hpp b/boost/math/tools/atomic.hpp
+index cc76ed269f..e3cbf5db89 100644
+--- a/boost/math/tools/atomic.hpp
++++ b/boost/math/tools/atomic.hpp
+@@ -16,27 +16,27 @@
+ namespace boost {
+    namespace math {
+       namespace detail {
+-#if ATOMIC_INT_LOCK_FREE == 2
++#if (ATOMIC_INT_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
+          typedef std::atomic<int> atomic_counter_type;
+          typedef std::atomic<unsigned> atomic_unsigned_type;
+          typedef int atomic_integer_type;
+          typedef unsigned atomic_unsigned_integer_type;
+-#elif ATOMIC_SHORT_LOCK_FREE == 2
++#elif (ATOMIC_SHORT_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
+          typedef std::atomic<short> atomic_counter_type;
+          typedef std::atomic<unsigned short> atomic_unsigned_type;
+          typedef short atomic_integer_type;
+          typedef unsigned short atomic_unsigned_type;
+-#elif ATOMIC_LONG_LOCK_FREE == 2
++#elif (ATOMIC_LONG_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
+          typedef std::atomic<long> atomic_unsigned_integer_type;
+          typedef std::atomic<unsigned long> atomic_unsigned_type;
+          typedef unsigned long atomic_unsigned_type;
+          typedef long atomic_integer_type;
+-#elif ATOMIC_LLONG_LOCK_FREE == 2
++#elif (ATOMIC_LLONG_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
+          typedef std::atomic<long long> atomic_unsigned_integer_type;
+          typedef std::atomic<unsigned long long> atomic_unsigned_type;
+          typedef long long atomic_integer_type;
+          typedef unsigned long long atomic_unsigned_integer_type;
+-#else
++#elif !defined(BOOST_MATH_NO_ATOMIC_INT)
+ #  define BOOST_MATH_NO_ATOMIC_INT
+ #endif
+       } // Namespace detail
diff --git a/meta/recipes-support/boost/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch b/meta/recipes-support/boost/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
new file mode 100644
index 00000000000..f69e4f21f3e
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
@@ -0,0 +1,151 @@
+From 7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b Mon Sep 17 00:00:00 2001
+From: jzmaddock <john@johnmaddock.co.uk>
+Date: Wed, 1 Sep 2021 20:31:53 +0100
+Subject: [PATCH] Make no atomics a soft failure in bernoulli_details.hpp.
+ Include an "escape macro" so thread safety can be disabled if certain
+ bernoulli features are to be used in a no-atomics environment. Fixes
+ https://github.com/boostorg/math/issues/673.
+
+[buildroot@heine.tech:
+  - backport from boostorg/math 7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b
+  - alter path to match boost release
+]
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+---
+Upstream-Status: Backport [https://github.com/boostorg/math/pull/684/commits/7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b]
+ .../detail/bernoulli_details.hpp                 | 10 +++++++---
+ libs/math/test/Jamfile.v2                        |  3 +++
+ test/compile_test/bernoulli_no_atomic_d.cpp      | 14 ++++++++++++++
+ test/compile_test/bernoulli_no_atomic_fail.cpp   | 15 +++++++++++++++
+ test/compile_test/bernoulli_no_atomic_mp.cpp     | 16 ++++++++++++++++
+ 5 files changed, 55 insertions(+), 3 deletions(-)
+ create mode 100644 test/compile_test/bernoulli_no_atomic_d.cpp
+ create mode 100644 test/compile_test/bernoulli_no_atomic_fail.cpp
+ create mode 100644 test/compile_test/bernoulli_no_atomic_mp.cpp
+
+diff --git a/boost/math/special_functions/detail/bernoulli_details.hpp b/boost/math/special_functions/detail/bernoulli_details.hpp
+index cf35545264..8519b7c89c 100644
+--- a/boost/math/special_functions/detail/bernoulli_details.hpp
++++ b/boost/math/special_functions/detail/bernoulli_details.hpp
+@@ -360,7 +360,7 @@ class bernoulli_numbers_cache
+          return out;
+       }
+ 
+-      #ifndef BOOST_HAS_THREADS
++      #if !defined(BOOST_HAS_THREADS) || defined(BOOST_MATH_BERNOULLI_UNTHREADED)
+       //
+       // Single threaded code, very simple:
+       //
+@@ -382,6 +382,8 @@ class bernoulli_numbers_cache
+          *out = (i >= m_overflow_limit) ? policies::raise_overflow_error<T>("boost::math::bernoulli_b2n<%1%>(std::size_t)", 0, T(i), pol) : bn[i];
+          ++out;
+       }
++      #elif defined(BOOST_MATH_NO_ATOMIC_INT)
++      static_assert(sizeof(T) == 1, "Unsupported configuration: your platform appears to have no atomic integers.  If you are happy with thread-unsafe code, then you may define BOOST_MATH_BERNOULLI_UNTHREADED to suppress this error.");
+       #else
+       //
+       // Double-checked locking pattern, lets us access cached already cached values
+@@ -464,7 +466,7 @@ class bernoulli_numbers_cache
+          return out;
+       }
+ 
+-      #ifndef BOOST_HAS_THREADS
++      #if !defined(BOOST_HAS_THREADS) || defined(BOOST_MATH_BERNOULLI_UNTHREADED)
+       //
+       // Single threaded code, very simple:
+       //
+@@ -494,6 +496,8 @@ class bernoulli_numbers_cache
+          }
+          ++out;
+       }
++      #elif defined(BOOST_MATH_NO_ATOMIC_INT)
++      static_assert(sizeof(T) == 1, "Unsupported configuration: your platform appears to have no atomic integers.  If you are happy with thread-unsafe code, then you may define BOOST_MATH_BERNOULLI_UNTHREADED to suppress this error.");
+       #else
+       //
+       // Double-checked locking pattern, lets us access cached already cached values
+@@ -555,7 +559,7 @@ class bernoulli_numbers_cache
+    // The value at which we know overflow has already occurred for the Bn:
+    std::size_t m_overflow_limit;
+ 
+-   #ifdef BOOST_HAS_THREADS
++   #if defined(BOOST_HAS_THREADS) && !defined(BOOST_MATH_NO_ATOMIC_INT)
+    std::mutex m_mutex;
+    atomic_counter_type m_counter, m_current_precision;
+    #else
+diff --git a/libs/math/test/Jamfile.v2 b/libs/math/test/Jamfile.v2
+index 52fb87f5e5..3ac63f9279 100644
+--- a/libs/math/test/Jamfile.v2
++++ b/libs/math/test/Jamfile.v2
+@@ -1137,6 +1137,9 @@ test-suite misc :
+ 
+ #   [ run __temporary_test.cpp test_instances//test_instances : : : <test-info>always_show_run_output <pch>off ]
+    [ compile test_no_long_double_policy.cpp ]
++   [ compile compile_test/bernoulli_no_atomic_d.cpp ]
++   [ compile compile_test/bernoulli_no_atomic_mp.cpp ]
++   [ compile-fail compile_test/bernoulli_no_atomic_fail.cpp ]
+ ;
+ 
+ test-suite interpolators :
+diff --git a/test/compile_test/bernoulli_no_atomic_d.cpp b/test/compile_test/bernoulli_no_atomic_d.cpp
+new file mode 100644
+index 0000000000..61926f7e1f
+--- /dev/null
++++ b/test/compile_test/bernoulli_no_atomic_d.cpp
+@@ -0,0 +1,14 @@
++//  (C) Copyright John Maddock 2021.
++//  Use, modification and distribution are subject to the
++//  Boost Software License, Version 1.0. (See accompanying file
++//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
++
++#define BOOST_MATH_NO_ATOMIC_INT
++
++#include <boost/math/special_functions/bernoulli.hpp>
++#include "test_compile_result.hpp"
++
++void compile_and_link_test()
++{
++   check_result<double>(boost::math::bernoulli_b2n<double>(4));
++}
+diff --git a/test/compile_test/bernoulli_no_atomic_fail.cpp b/test/compile_test/bernoulli_no_atomic_fail.cpp
+new file mode 100644
+index 0000000000..bbd7152412
+--- /dev/null
++++ b/test/compile_test/bernoulli_no_atomic_fail.cpp
+@@ -0,0 +1,15 @@
++//  (C) Copyright John Maddock 2021.
++//  Use, modification and distribution are subject to the
++//  Boost Software License, Version 1.0. (See accompanying file
++//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
++
++#define BOOST_MATH_NO_ATOMIC_INT
++
++#include <boost/math/special_functions/bernoulli.hpp>
++#include <boost/multiprecision/cpp_bin_float.hpp>
++#include "test_compile_result.hpp"
++
++void compile_and_link_test()
++{
++   check_result<boost::multiprecision::cpp_bin_float_50>(boost::math::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
++}
+diff --git a/test/compile_test/bernoulli_no_atomic_mp.cpp b/test/compile_test/bernoulli_no_atomic_mp.cpp
+new file mode 100644
+index 0000000000..8d5a6e78e6
+--- /dev/null
++++ b/test/compile_test/bernoulli_no_atomic_mp.cpp
+@@ -0,0 +1,16 @@
++//  (C) Copyright John Maddock 2021.
++//  Use, modification and distribution are subject to the
++//  Boost Software License, Version 1.0. (See accompanying file
++//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
++
++#define BOOST_MATH_NO_ATOMIC_INT
++#define BOOST_MATH_BERNOULLI_UNTHREADED
++
++#include <boost/math/special_functions/bernoulli.hpp>
++#include <boost/multiprecision/cpp_bin_float.hpp>
++#include "test_compile_result.hpp"
++
++void compile_and_link_test()
++{
++   check_result<boost::multiprecision::cpp_bin_float_50>(boost::math::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
++}
diff --git a/meta/recipes-support/boost/boost_1.77.0.bb b/meta/recipes-support/boost/boost_1.77.0.bb
index ba602819503..bde6b14a79a 100644
--- a/meta/recipes-support/boost/boost_1.77.0.bb
+++ b/meta/recipes-support/boost/boost_1.77.0.bb
@@ -7,4 +7,6 @@ SRC_URI += "file://boost-CVE-2012-2677.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
            file://0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch \
            file://0001-BoostConfig.cmake-allow-searching-for-python310.patch \
+           file://0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch \
+           file://0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch \
            "
-- 
2.34.1


