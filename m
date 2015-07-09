Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 449E2739BE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 17:52:47 +0000 (UTC)
Received: by igoe12 with SMTP id e12so19273495igo.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 10:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=yTRh0YWYYswG0ZDZfgVmHHRO472m0Y1n5DmYDx+4Ztw=;
	b=tp91EXs34unNJByvAgUAu0sAgquYy62gQ30mUwwb4/69H5hPSgm7ug+CXJ0wdU56Ms
	Xly64M1A4WpwW4LIo3ZwJTUcw1tEsIcht+1+dbB1DBKKD5hsn2LkR5LRFmVmJcfxHykH
	o2/T4a0vKgz05RBeZIK2mbCU6wqkrvgGqqiQoaYILMO/vUai6xb0sHQedHL09WPcRekK
	hm2vrLXB11Y4ifd6dtwIxC3wfg8zbWiAsAiIDplllOCTLw7yvYQwzKt4TTh+ljkjbXm4
	AydUWvYbQAXvZNWVS13dHIbQEHwo5L1H4DgW8iXhPrPq703ATeJ9skJ1+EyVtthuPQDh
	+9iQ==
X-Received: by 10.107.164.196 with SMTP id d65mr29658452ioj.3.1436464367398;
	Thu, 09 Jul 2015 10:52:47 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	c12sm4637051ioj.39.2015.07.09.10.52.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Jul 2015 10:52:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 10:52:39 -0700
Message-Id: <54ae64982ecec1f286e292da2c60a1cf7c32ed15.1436464186.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ba4775eeebab2aec8f81970e61903a35a46eb4ce.1436464186.git.raj.khem@gmail.com>
References: <ba4775eeebab2aec8f81970e61903a35a46eb4ce.1436464186.git.raj.khem@gmail.com>
In-Reply-To: <cover.1436464186.git.raj.khem@gmail.com>
References: <cover.1436464186.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] gcc-5: Backport patches for -Wno-narrowing behaviour fixes
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
X-List-Received-Date: Thu, 09 Jul 2015 17:52:49 -0000

Chromium/CEF reveals these warnings which are then treated as errors
which has been fixed on gcc_5 branch upsteam. We backport the relevant
commits

Change-Id: I088a1480d49cdb439c72f0e159bee6de8ba94258
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-5.1.inc              |  8 +-
 .../gcc/gcc-5.1/backport/0001-PR65801.patch        | 89 ++++++++++++++++++++++
 .../gcc/gcc-5.1/backport/0002-PR65858.patch        | 63 +++++++++++++++
 .../gcc/gcc-5.1/backport/0003-PR66007.patch        | 73 ++++++++++++++++++
 4 files changed, 232 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/backport/0001-PR65801.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/backport/0002-PR65858.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/backport/0003-PR66007.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.1.inc b/meta/recipes-devtools/gcc/gcc-5.1.inc
index 1d64f9e..255e957 100644
--- a/meta/recipes-devtools/gcc/gcc-5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.1.inc
@@ -10,7 +10,7 @@ PV = "5.1.0"
 
 BINV = "5.1.0"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-5.1:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-5.1:${FILE_DIRNAME}/gcc-5.1/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
@@ -32,6 +32,7 @@ SRC_URI[sha256sum] = "b7dafdf89cbb0e20333dbf5b5349319ae06e3d1a30bf3515b5488f7e89
 
 SRC_URI = "\
            ${BASEURI} \
+           ${BACKPORTS} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
            file://0002-uclibc-conf.patch \
            file://0003-gcc-uclibc-locale-ctype_touplow_t.patch \
@@ -72,6 +73,11 @@ SRC_URI = "\
            file://0038-fix-g++-sysroot.patch \
           "
 
+BACKPORTS = "\
+           file://0001-PR65801.patch \
+           file://0002-PR65858.patch \
+           file://0003-PR66007.patch \
+          "
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${SNAP}"
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/backport/0001-PR65801.patch b/meta/recipes-devtools/gcc/gcc-5.1/backport/0001-PR65801.patch
new file mode 100644
index 0000000..9474287
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.1/backport/0001-PR65801.patch
@@ -0,0 +1,89 @@
+From 346ee8b5c2bf3bf0f0e681b2df5755f299aa1a68 Mon Sep 17 00:00:00 2001
+From: paolo <paolo@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 30 Apr 2015 16:31:36 +0000
+Subject: [PATCH] /cp 2015-04-30  Paolo Carlini  <paolo.carlini@oracle.com>
+
+	PR c++/65801
+	* typeck2.c (check_narrowing): In C++11 mode too, -Wno-narrowing
+	suppresses the diagnostic.
+
+2015-04-30  Paolo Carlini  <paolo.carlini@oracle.com>
+
+	PR c++/65801
+	* doc/invoke.texi ([-Wnarrowing]): Update.
+
+/testsuite
+2015-04-30  Paolo Carlini  <paolo.carlini@oracle.com>
+
+	PR c++/65801
+	* g++.dg/cpp0x/Wnarrowing2.C: New.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch@222636 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ gcc/ChangeLog                            |  5 +++++
+ gcc/cp/ChangeLog                         |  6 ++++++
+ gcc/cp/typeck2.c                         | 10 +++++++---
+ gcc/doc/invoke.texi                      |  8 ++++----
+ gcc/testsuite/ChangeLog                  |  5 +++++
+ gcc/testsuite/g++.dg/cpp0x/Wnarrowing2.C |  5 +++++
+ 6 files changed, 32 insertions(+), 7 deletions(-)
+ create mode 100644 gcc/testsuite/g++.dg/cpp0x/Wnarrowing2.C
+
+diff --git a/gcc/cp/typeck2.c b/gcc/cp/typeck2.c
+index 80a6939..884957b 100644
+--- a/gcc/cp/typeck2.c
++++ b/gcc/cp/typeck2.c
+@@ -957,9 +957,13 @@ check_narrowing (tree type, tree init, tsubst_flags_t complain)
+ 	    }
+ 	}
+       else if (complain & tf_error)
+-	error_at (EXPR_LOC_OR_LOC (init, input_location),
+-		  "narrowing conversion of %qE from %qT to %qT inside { }",
+-		  init, ftype, type);
++	{
++	  global_dc->pedantic_errors = 1;
++	  pedwarn (EXPR_LOC_OR_LOC (init, input_location), OPT_Wnarrowing,
++		   "narrowing conversion of %qE from %qT to %qT inside { }",
++		   init, ftype, type);
++	  global_dc->pedantic_errors = flag_pedantic_errors;
++	}
+     }
+ 
+   return cxx_dialect == cxx98 || ok; 
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index 520c2c5..4ef8f7f 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -2703,10 +2703,10 @@ int i = @{ 2.2 @}; // error: narrowing from double to int
+ 
+ This flag is included in @option{-Wall} and @option{-Wc++11-compat}.
+ 
+-With @option{-std=c++11}, @option{-Wno-narrowing} suppresses for
+-non-constants the diagnostic required by the standard.  Note that this
+-does not affect the meaning of well-formed code; narrowing conversions
+-are still considered ill-formed in SFINAE context.
++With @option{-std=c++11}, @option{-Wno-narrowing} suppresses the diagnostic
++required by the standard.  Note that this does not affect the meaning
++of well-formed code; narrowing conversions are still considered
++ill-formed in SFINAE context.
+ 
+ @item -Wnoexcept @r{(C++ and Objective-C++ only)}
+ @opindex Wnoexcept
+diff --git a/gcc/testsuite/g++.dg/cpp0x/Wnarrowing2.C b/gcc/testsuite/g++.dg/cpp0x/Wnarrowing2.C
+new file mode 100644
+index 0000000..fc806f9
+--- /dev/null
++++ b/gcc/testsuite/g++.dg/cpp0x/Wnarrowing2.C
+@@ -0,0 +1,5 @@
++// PR c++/65801
++// { dg-do compile { target c++11 } }
++// { dg-options "-Wno-narrowing" }
++
++static struct zai { unsigned int x; } x = {-1};
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/backport/0002-PR65858.patch b/meta/recipes-devtools/gcc/gcc-5.1/backport/0002-PR65858.patch
new file mode 100644
index 0000000..e7a4fd7
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.1/backport/0002-PR65858.patch
@@ -0,0 +1,63 @@
+From 82e461dc9d53927de7dae667880b63c2d497172d Mon Sep 17 00:00:00 2001
+From: paolo <paolo@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 1 May 2015 18:47:55 +0000
+Subject: [PATCH] /cp 2015-05-01  Paolo Carlini  <paolo.carlini@oracle.com> 
+     Prathamesh Kulharni  <prathamesh.kulkarni@linaro.org>
+
+	PR c++/65858
+	* typeck2.c (check_narrowing): Set ok = true when pedwarn returns
+	false.
+
+/testsuite
+2015-05-01  Paolo Carlini  <paolo.carlini@oracle.com>
+	    Prathamesh Kulharni  <prathamesh.kulkarni@linaro.org>
+
+	PR c++/65858
+	* g++.dg/cpp0x/Wnarrowing3.C: New.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch@222700 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ gcc/cp/ChangeLog                         | 7 +++++++
+ gcc/cp/typeck2.c                         | 7 ++++---
+ gcc/testsuite/ChangeLog                  | 6 ++++++
+ gcc/testsuite/g++.dg/cpp0x/Wnarrowing3.C | 6 ++++++
+ 4 files changed, 23 insertions(+), 3 deletions(-)
+ create mode 100644 gcc/testsuite/g++.dg/cpp0x/Wnarrowing3.C
+
+diff --git a/gcc/cp/typeck2.c b/gcc/cp/typeck2.c
+index 884957b..9a491aa 100644
+--- a/gcc/cp/typeck2.c
++++ b/gcc/cp/typeck2.c
+@@ -959,9 +959,10 @@ check_narrowing (tree type, tree init, tsubst_flags_t complain)
+       else if (complain & tf_error)
+ 	{
+ 	  global_dc->pedantic_errors = 1;
+-	  pedwarn (EXPR_LOC_OR_LOC (init, input_location), OPT_Wnarrowing,
+-		   "narrowing conversion of %qE from %qT to %qT inside { }",
+-		   init, ftype, type);
++	  if (!pedwarn (EXPR_LOC_OR_LOC (init, input_location), OPT_Wnarrowing,
++			"narrowing conversion of %qE from %qT to %qT "
++			"inside { }", init, ftype, type))
++	    ok = true;
+ 	  global_dc->pedantic_errors = flag_pedantic_errors;
+ 	}
+     }
+diff --git a/gcc/testsuite/g++.dg/cpp0x/Wnarrowing3.C b/gcc/testsuite/g++.dg/cpp0x/Wnarrowing3.C
+new file mode 100644
+index 0000000..d2dd383
+--- /dev/null
++++ b/gcc/testsuite/g++.dg/cpp0x/Wnarrowing3.C
+@@ -0,0 +1,6 @@
++// PR c++/65858
++// { dg-do compile { target c++11 } }
++// { dg-require-effective-target lto }
++// { dg-options "-flto -Wno-narrowing" }
++
++int x { 0.5 };
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/backport/0003-PR66007.patch b/meta/recipes-devtools/gcc/gcc-5.1/backport/0003-PR66007.patch
new file mode 100644
index 0000000..7c1a19c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.1/backport/0003-PR66007.patch
@@ -0,0 +1,73 @@
+From 3b1253116b7cb98da33c997bffa5fa2616aee40a Mon Sep 17 00:00:00 2001
+From: paolo <paolo@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 4 May 2015 20:59:03 +0000
+Subject: [PATCH] /cp 2015-05-04  Paolo Carlini  <paolo.carlini@oracle.com> 
+     Jakub Jelinek  <jakub@redhat.com>
+
+	PR c++/66007
+	* typeck2.c (check_narrowing): Check by-hand that the pedwarn didn't
+	result in an actual error.
+
+/testsuite
+2015-05-04  Paolo Carlini  <paolo.carlini@oracle.com>
+	    Jakub Jelinek  <jakub@redhat.com>
+
+	PR c++/66007
+	* g++.dg/cpp0x/Wnarrowing4.C: New.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch@222779 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ gcc/cp/ChangeLog                         |  7 +++++++
+ gcc/cp/typeck2.c                         |  8 +++++---
+ gcc/testsuite/ChangeLog                  |  6 ++++++
+ gcc/testsuite/g++.dg/cpp0x/Wnarrowing4.C | 14 ++++++++++++++
+ 4 files changed, 32 insertions(+), 3 deletions(-)
+ create mode 100644 gcc/testsuite/g++.dg/cpp0x/Wnarrowing4.C
+
+diff --git a/gcc/cp/typeck2.c b/gcc/cp/typeck2.c
+index 9a491aa..c0df823 100644
+--- a/gcc/cp/typeck2.c
++++ b/gcc/cp/typeck2.c
+@@ -958,10 +958,12 @@ check_narrowing (tree type, tree init, tsubst_flags_t complain)
+ 	}
+       else if (complain & tf_error)
+ 	{
++	  int savederrorcount = errorcount;
+ 	  global_dc->pedantic_errors = 1;
+-	  if (!pedwarn (EXPR_LOC_OR_LOC (init, input_location), OPT_Wnarrowing,
+-			"narrowing conversion of %qE from %qT to %qT "
+-			"inside { }", init, ftype, type))
++	  pedwarn (EXPR_LOC_OR_LOC (init, input_location), OPT_Wnarrowing,
++		   "narrowing conversion of %qE from %qT to %qT "
++		   "inside { }", init, ftype, type);
++	  if (errorcount == savederrorcount)
+ 	    ok = true;
+ 	  global_dc->pedantic_errors = flag_pedantic_errors;
+ 	}
+diff --git a/gcc/testsuite/g++.dg/cpp0x/Wnarrowing4.C b/gcc/testsuite/g++.dg/cpp0x/Wnarrowing4.C
+new file mode 100644
+index 0000000..7defce3
+--- /dev/null
++++ b/gcc/testsuite/g++.dg/cpp0x/Wnarrowing4.C
+@@ -0,0 +1,14 @@
++// PR c++/66007
++// { dg-do run { target c++11 } }
++// { dg-options "-Wno-error=narrowing" }
++
++extern "C" void abort();
++
++int main()
++{
++  unsigned foo[] = { 1, -1, 3 };
++  if (foo[0] != 1 || foo[1] != __INT_MAX__ * 2U + 1 || foo[2] != 3)
++    abort();
++}
++
++// { dg-prune-output "narrowing conversion" }
+-- 
+2.1.4
+
-- 
2.1.4


