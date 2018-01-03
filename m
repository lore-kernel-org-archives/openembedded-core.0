Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 096CA7780D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 00:11:12 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 13E88280247; Tue,  2 Jan 2018 16:13:48 -0800 (PST)
Date: Tue, 2 Jan 2018 16:13:48 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180103001348.GS27580@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-core@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH] glibc: fix C++ compile failures related to 'assert'
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
X-List-Received-Date: Wed, 03 Jan 2018 00:11:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* fixes "lambda-expression in unevaluated context" compile failures such as
  https://github.com/nlohmann/json/issues/705

* fixes "no match for 'operator==" compile failures such as
  https://bugzilla.redhat.com/show_bug.cgi?id=1482990

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 ...pport-types-without-operator-int-BZ-21972.patch | 194 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.26.bb              |   1 +
 2 files changed, 195 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0029-assert-Support-types-without-operator-int-BZ-21972.patch

diff --git a/meta/recipes-core/glibc/glibc/0029-assert-Support-types-without-operator-int-BZ-21972.patch b/meta/recipes-core/glibc/glibc/0029-assert-Support-types-without-operator-int-BZ-21972.patch
new file mode 100644
index 0000000..3c7050f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0029-assert-Support-types-without-operator-int-BZ-21972.patch
@@ -0,0 +1,194 @@
+Upstream-Status: Backport
+
+* fixes "lambda-expression in unevaluated context" compile failures such as
+  https://github.com/nlohmann/json/issues/705
+
+* fixes "no match for 'operator==" compile failures such as
+  https://bugzilla.redhat.com/show_bug.cgi?id=1482990
+
+* Changelog edit was removed from upstream commit because it caused conflict
+
+Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
+
+From b5889d25e9bf944a89fdd7bcabf3b6c6f6bb6f7c Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 21 Aug 2017 13:03:29 +0200
+Subject: [PATCH] assert: Support types without operator== (int) [BZ #21972]
+
+---
+ assert/Makefile          | 11 ++++++-
+ assert/assert.h          | 16 ++++++----
+ assert/tst-assert-c++.cc | 78 ++++++++++++++++++++++++++++++++++++++++++++++++
+ assert/tst-assert-g++.cc | 19 ++++++++++++
+ 4 files changed, 128 insertions(+), 7 deletions(-)
+ create mode 100644 assert/tst-assert-c++.cc
+ create mode 100644 assert/tst-assert-g++.cc
+
+diff --git a/assert/Makefile b/assert/Makefile
+index 1c3be9b..9ec1be8 100644
+--- a/assert/Makefile
++++ b/assert/Makefile
+@@ -25,6 +25,15 @@ include ../Makeconfig
+ headers	:= assert.h
+ 
+ routines := assert assert-perr __assert
+-tests := test-assert test-assert-perr
++tests := test-assert test-assert-perr tst-assert-c++ tst-assert-g++
+ 
+ include ../Rules
++
++ifeq ($(have-cxx-thread_local),yes)
++CFLAGS-tst-assert-c++.o = -std=c++11
++LDLIBS-tst-assert-c++ = -lstdc++
++CFLAGS-tst-assert-g++.o = -std=gnu++11
++LDLIBS-tst-assert-g++ = -lstdc++
++else
++tests-unsupported += tst-assert-c++ tst-assert-g++
++endif
+diff --git a/assert/assert.h b/assert/assert.h
+index 6801cfe..640c95c 100644
+--- a/assert/assert.h
++++ b/assert/assert.h
+@@ -85,7 +85,12 @@ __END_DECLS
+ /* When possible, define assert so that it does not add extra
+    parentheses around EXPR.  Otherwise, those added parentheses would
+    suppress warnings we'd expect to be detected by gcc's -Wparentheses.  */
+-# if !defined __GNUC__ || defined __STRICT_ANSI__
++# if defined __cplusplus
++#  define assert(expr)							\
++     (static_cast <bool> (expr)						\
++      ? void (0)							\
++      : __assert_fail (#expr, __FILE__, __LINE__, __ASSERT_FUNCTION))
++# elif !defined __GNUC__ || defined __STRICT_ANSI__
+ #  define assert(expr)							\
+     ((expr)								\
+      ? __ASSERT_VOID_CAST (0)						\
+@@ -93,12 +98,11 @@ __END_DECLS
+ # else
+ /* The first occurrence of EXPR is not evaluated due to the sizeof,
+    but will trigger any pedantic warnings masked by the __extension__
+-   for the second occurrence.  The explicit comparison against zero is
+-   required to support function pointers and bit fields in this
+-   context, and to suppress the evaluation of variable length
+-   arrays.  */
++   for the second occurrence.  The ternary operator is required to
++   support function pointers and bit fields in this context, and to
++   suppress the evaluation of variable length arrays.  */
+ #  define assert(expr)							\
+-  ((void) sizeof ((expr) == 0), __extension__ ({			\
++  ((void) sizeof ((expr) ? 1 : 0), __extension__ ({			\
+       if (expr)								\
+         ; /* empty */							\
+       else								\
+diff --git a/assert/tst-assert-c++.cc b/assert/tst-assert-c++.cc
+new file mode 100644
+index 0000000..12a5e69
+--- /dev/null
++++ b/assert/tst-assert-c++.cc
+@@ -0,0 +1,78 @@
++/* Tests for interactions between C++ and assert.
++   Copyright (C) 2017 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <assert.h>
++
++/* The C++ standard requires that if the assert argument is a constant
++   subexpression, then the assert itself is one, too.  */
++constexpr int
++check_constexpr ()
++{
++  return (assert (true), 1);
++}
++
++/* Objects of this class can be contextually converted to bool, but
++   cannot be compared to int.  */
++struct no_int
++{
++  no_int () = default;
++  no_int (const no_int &) = delete;
++
++  explicit operator bool () const
++  {
++    return true;
++  }
++
++  bool operator! () const; /* No definition.  */
++  template <class T> bool operator== (T) const; /* No definition.  */
++  template <class T> bool operator!= (T) const; /* No definition.  */
++};
++
++/* This class tests that operator== is not used by assert.  */
++struct bool_and_int
++{
++  bool_and_int () = default;
++  bool_and_int (const no_int &) = delete;
++
++  explicit operator bool () const
++  {
++    return true;
++  }
++
++  bool operator! () const; /* No definition.  */
++  template <class T> bool operator== (T) const; /* No definition.  */
++  template <class T> bool operator!= (T) const; /* No definition.  */
++};
++
++static int
++do_test ()
++{
++  {
++    no_int value;
++    assert (value);
++  }
++
++  {
++    bool_and_int value;
++    assert (value);
++  }
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/assert/tst-assert-g++.cc b/assert/tst-assert-g++.cc
+new file mode 100644
+index 0000000..8c06402
+--- /dev/null
++++ b/assert/tst-assert-g++.cc
+@@ -0,0 +1,19 @@
++/* Tests for interactions between C++ and assert.  GNU C++11 version.
++   Copyright (C) 2017 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <tst-assert-c++.cc>
+-- 
+1.9.4
+
diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index 135ec4f..7dd025a 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -43,6 +43,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-assert-Suppress-pedantic-warning-caused-by-statement.patch \
            file://0027-glibc-reset-dl-load-write-lock-after-forking.patch \
            file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
+           file://0029-assert-Support-types-without-operator-int-BZ-21972.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
1.9.4


