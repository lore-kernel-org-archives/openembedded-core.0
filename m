Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 015F97600A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 03:51:57 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t6-v6so6574293plo.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 20:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=wAACIT6hD+L9Wz56HHpBS769BVb4GEEuzPvXxJZdIQ4=;
	b=ZmdN7LF+Y/yGrpHQ1+Cr1lHsxT78YnzA5Le10DccsHEbLJGp3JCjv3tGxjjG7b6lr9
	vzYJbJFe/+5p2Ei815XQ6AUbwR2zO2vDRjYGdjIQ2UWZDBce+WiIIiI0LNCQfDMDv34C
	4J0DELtGNnTc+j08rGiCnRZ0O+tty5BYmEyfJVhONrdH1bfDFvwZuF7895h7mzT1a4AG
	6q0j0LlbR4O8uCmk3eZT74q1gSbXD8utzB6yKBlMiihUcSvM0stbyAqPSKL3SCPHpRRE
	HQVa0P0mF5XFHKu1WfhlNBUk3ut90PIOBKqkOMIgAzxuXlwa5/oKLtkQxnfMzLBQBPYU
	c/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wAACIT6hD+L9Wz56HHpBS769BVb4GEEuzPvXxJZdIQ4=;
	b=uY/SupFOcNISApIy/Ds6xt5M8dVgJlIlYiu7dGh+xXy/Ve6kmalQ/y4R3a5mdo4UwM
	NlcyAG4HWkW6qnheaR2zkXrig2jaIcvvEROEju0HUzsYcGjE89H4R0ptMrqt01oXencD
	YvdIAYl9bCX0mrF4PZOmcvOf6d5K374HTTu6sLxB40FDznwCCQN1am75t5DDTiOUPBlT
	nI1ZXo3O3PNlQKH9TDeTKZ4nizEOLT6I2vcNUT/LkiGdkjqpjunNEYtJzkCxnXgov6Jq
	fIYt+1B7aE6h5sGQt+RzIQBG8yXC0BwspGPnIhwO3/8YJc7+c10A+iid9zVZobGL4nXT
	cZqg==
X-Gm-Message-State: AGRZ1gJ1p+4suw/BNGWmorBPuImkojwRSkMPWT7cY2YIBb8vs5JwYjfU
	mJ3WMKIsb4Ow0pesdv+YnHVPQRiLMlY=
X-Google-Smtp-Source: AJdET5eRRGGFN3XCJ/jL4zBabV7Za4fxvAdiSyC6PetUp9xgtIjyooaSaltZeiwfi6e0kx8DAUWPYg==
X-Received: by 2002:a17:902:f83:: with SMTP id
	3-v6mr1590874plz.254.1540957918654; 
	Tue, 30 Oct 2018 20:51:58 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.250.48])
	by smtp.gmail.com with ESMTPSA id
	x36-v6sm25928966pgl.43.2018.10.30.20.51.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Oct 2018 20:51:57 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Oct 2018 09:21:51 +0530
Message-Id: <1540957911-8736-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [ROCKO][SUMO][PATCH resend] valgrind: fix ptest compilation for PowerPC64
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
X-List-Received-Date: Wed, 31 Oct 2018 03:51:58 -0000

The fix is similar to what was done for PowerPC32.
It solves below error, while compiling for PowerPC64,

-- snip --
| ../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c: In function 'usage':
| ../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:1778:3: warning: implicit declaration of function 'fprintf' [-Wimplicit-function-declaration]
|    fprintf(stderr,
|    ^~~~~~~
| ../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:1778:3: warning: incompatible implicit declaration of built-in function 'fprintf'
| ../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:1778:3: note: include '<stdio.h>' or provide a declaration of 'fprintf'
| ../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:1778:11: error: 'stderr' undeclared (first use in this function)
|    fprintf(stderr,
|            ^~~~~~
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../valgrind/valgrind/ppc-headers.patch            | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/ppc-headers.patch b/meta/recipes-devtools/valgrind/valgrind/ppc-headers.patch
index 51259db..4b531b4 100644
--- a/meta/recipes-devtools/valgrind/valgrind/ppc-headers.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/ppc-headers.patch
@@ -12,6 +12,11 @@ The #ifdef HAS_VSX guard is wrongly placed. It makes the standard
 include headers not be used. Causing a build failure. Fix by moving
 the #ifdef HAS_VSX after the standard includes.
 
+[v2 changes]
+- Add #ifdef HAS_VSX guard correctly for ppc64 test_isa_2_06_partx.c 
+  test cases. The changes are similar to what was done for ppc32.
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
 Index: none/tests/ppc32/test_isa_2_06_part3.c
 ===================================================================
 --- a/none/tests/ppc32/test_isa_2_06_part3.c	(revision 16449)
@@ -85,3 +90,76 @@ Index: none/tests/ppc32/test_isa_2_06_part2.c
  #ifndef __powerpc64__
  typedef uint32_t HWord_t;
  #else
+Index: none/tests/ppc64/test_isa_2_06_part3.c
+===================================================================
+--- a/none/tests/ppc64/test_isa_2_06_part3.c	(revision 16449)
++++ b/none/tests/ppc64/test_isa_2_06_part3.c	(revision 16450)
+@@ -20,17 +20,18 @@
+  The GNU General Public License is contained in the file COPYING.
+  */
+ 
+-#ifdef HAS_VSX
+-
+ #include <stdio.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <malloc.h>
+-#include <altivec.h>
+ #include <math.h>
+ #include <unistd.h>    // getopt
+ 
++#ifdef HAS_VSX
++
++#include <altivec.h>
++
+ #ifndef __powerpc64__
+ typedef uint32_t HWord_t;
+ #else
+Index: none/tests/ppc64/test_isa_2_06_part1.c
+===================================================================
+--- a/none/tests/ppc64/test_isa_2_06_part1.c	(revision 16449)
++++ b/none/tests/ppc64/test_isa_2_06_part1.c	(revision 16450)
+@@ -20,13 +20,14 @@
+  The GNU General Public License is contained in the file COPYING.
+  */
+ 
+-#ifdef HAS_VSX
+-
+ #include <stdio.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <malloc.h>
++
++#ifdef HAS_VSX
++
+ #include <altivec.h>
+ 
+ #ifndef __powerpc64__
+Index: none/tests/ppc64/test_isa_2_06_part2.c
+===================================================================
+--- a/none/tests/ppc64/test_isa_2_06_part2.c	(revision 16449)
++++ b/none/tests/ppc64/test_isa_2_06_part2.c	(revision 16450)
+@@ -20,17 +20,18 @@
+  The GNU General Public License is contained in the file COPYING.
+  */
+ 
+-#ifdef HAS_VSX
+-
+ #include <stdio.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <malloc.h>
+-#include <altivec.h>
+ #include <math.h>
+ #include <unistd.h>    // getopt
+ 
++#ifdef HAS_VSX
++
++#include <altivec.h>
++
+ #ifndef __powerpc64__
+ typedef uint32_t HWord_t;
+ #else
-- 
2.7.4


