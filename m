Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A787E78225
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 18:53:52 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id f67so30907476wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 11:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Lp0b1xii9CRNKaL2vftv242vY4JBxNcrk2Vlz0q+Oo8=;
	b=PQ3ExCUYKy156MY/UgheN2loPrQ8Ki8iIQDq2fVOvv3T/cJUbl4C+zPsnSJaE8fV9m
	aS3EIxdFBN3WMQaW55zSdEzzFydW8+DCocdbrNn5lXM6w1Wyasjhs18BBQXU/7YQcQp4
	Dw29MdflJeTRVhkVmvrT28dVkh68ETy+9e9yrZx37kXE0q9osD9EGqrGSo+QlY0xjfcl
	l10CFTkaOB0Nd4YV8i34z6eeu6s+w9cln5ynG2/d7jFa/mxSqKyV5383mF5biLILeaIB
	rDj6aqCAS0xzj25u79UWmuCVMZS6WdKgHblK6lFa/WlfoeT+nBIu396jGbGbiAV40icQ
	NplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Lp0b1xii9CRNKaL2vftv242vY4JBxNcrk2Vlz0q+Oo8=;
	b=UImHxI5R1Is/LxBsLkjJ+xgR6DyBlzRE0+7JqBgUIVsLt8KK1vQYw9UV0nQ3Cdljgr
	Au88xLDMpSzTDjVRsT1iwIbOQEw3xV2LsqGIz1YZGYXMlkIgnQ3XYmDoAjtGa3gnTP7p
	Wkt8FTE/ISVjObRapxLAkNfISqovCsv/fqsPPcI3vRPfAPV9iuh7n4shNx3MSpYzYY/8
	V6oNuSKZT4aO41di+aak90ICLE+Hboq4Z2MoHQMVlFdu3Cv5LVshzkIV3vRbU2IViS/3
	1TN+N8VSdX9wyab5gP/gsFob2ZckHuTRs1Upu1Bxsb5I3Kv/LLw0gDiR+eQBH2Y8KUKy
	OUdA==
X-Gm-Message-State: AIVw113TywSdYxUd+NsiyQpS+q+RP8lE/uMoSx9ZpkLhLQCJtP0EGMmQ
	eJudIm9CMPbvBtazeiQ=
X-Received: by 10.28.103.198 with SMTP id b189mr3693386wmc.59.1500058432733;
	Fri, 14 Jul 2017 11:53:52 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	m123sm4032297wmb.3.2017.07.14.11.53.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 11:53:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jul 2017 19:53:47 +0100
Message-Id: <20170714185347.32104-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] valgrind: fix ptest compilation for PowerPC
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
X-List-Received-Date: Fri, 14 Jul 2017 18:53:53 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../valgrind/valgrind/ppc-headers.patch            | 87 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.13.0.bb  |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/ppc-headers.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/ppc-headers.patch b/meta/recipes-devtools/valgrind/valgrind/ppc-headers.patch
new file mode 100644
index 00000000000..51259db001a
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/ppc-headers.patch
@@ -0,0 +1,87 @@
+Backport a patch from upstream to fix test compilation for PPC where
+system headers don't get included.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+r16450 | mjw | 2017-06-16 10:33:35 +0100 (Fri, 16 Jun 2017) | 7 lines
+
+ppc64 doesn't compile test_isa_2_06_partx.c without VSX support
+
+The #ifdef HAS_VSX guard is wrongly placed. It makes the standard
+include headers not be used. Causing a build failure. Fix by moving
+the #ifdef HAS_VSX after the standard includes.
+
+Index: none/tests/ppc32/test_isa_2_06_part3.c
+===================================================================
+--- a/none/tests/ppc32/test_isa_2_06_part3.c	(revision 16449)
++++ b/none/tests/ppc32/test_isa_2_06_part3.c	(revision 16450)
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
+Index: none/tests/ppc32/test_isa_2_06_part1.c
+===================================================================
+--- a/none/tests/ppc32/test_isa_2_06_part1.c	(revision 16449)
++++ b/none/tests/ppc32/test_isa_2_06_part1.c	(revision 16450)
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
+Index: none/tests/ppc32/test_isa_2_06_part2.c
+===================================================================
+--- a/none/tests/ppc32/test_isa_2_06_part2.c	(revision 16449)
++++ b/none/tests/ppc32/test_isa_2_06_part2.c	(revision 16450)
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
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
index 2ec9b9b6fc8..feab5fc1a19 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
@@ -36,6 +36,7 @@ SRC_URI = "ftp://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0002-memcheck-x86-Define-__THROW-if-not-defined.patch \
            file://0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch \
            file://link-gz-tests.patch \
+           file://ppc-headers.patch \
            "
 SRC_URI[md5sum] = "817dd08f1e8a66336b9ff206400a5369"
 SRC_URI[sha256sum] = "d76680ef03f00cd5e970bbdcd4e57fb1f6df7d2e2c071635ef2be74790190c3b"
-- 
2.11.0


