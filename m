Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id CE88861883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 22:08:18 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so2592573pbb.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 15:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=LClxd3QDG4wRVIGLnG0aYiCyh5e01iz6bNfF8jSHmD8=;
	b=DtE2GsmcwIdeBNB8vyg/ySwFaVevABSwslYAFiYwuef+7RK9LYDP2IasqfAYGSLp4D
	IeKxpfg5WAdrCWzpC/bi4xh46DV72MQ6VM+wQ8oE4yHx4dLkXLBBrWuyNoVIYqcIbPgD
	FWNRX9rl7303Zr3tGY2pkVwQQeRGDKGOfzpAaozwWrUoVfOm4L9waiXNLuCd0oMAtn/Q
	Mm1TUKXxjGlO9ws89+JBshl+yaqm3bdZp0L92quPis4DpCU4O1DuXS8HOyCysgq8TZdB
	qH/7mJ6zzM5IvlEEyZdoI2xXGkOzR+Qm//1W7q2PybJHTXWBDeFXeRFzpHbOSjJCUekq
	SjFA==
X-Received: by 10.66.51.102 with SMTP id j6mr6831801pao.80.1375394899467;
	Thu, 01 Aug 2013 15:08:19 -0700 (PDT)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id qc5sm6137590pbc.31.2013.08.01.15.08.18
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 15:08:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 15:07:55 -0700
Message-Id: <1375394875-23238-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] gcc-4.8: Fix meta-fsl-arm iperf build issue
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
X-List-Received-Date: Thu, 01 Aug 2013 22:08:19 -0000

This should fix the problem seen where gcc ICE
was happening when compiling iperf with older 2.6.x
kernel

Test this patch by reverting below commit in meta-fsl-arm

commit daf582c93a7283fb0af3b25fe2ada48f4c9985c4
Author: Otavio Salvador <otavio@ossystems.com.br>
Date:   Tue Jul 2 11:52:51 2013 -0300

    perf: Disable FPU tune for i.MX5 SoCs to workaround GCC ICE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
CC: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |    1 +
 .../gcc/gcc-4.8/0042-pr57748.patch                 |   78 ++++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0042-pr57748.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 42355f2..9d92eda 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -71,6 +71,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0039-gcc-4.8-PR57717.patch \
 	   file://0040-fix-g++-sysroot.patch \
 	   file://0041-libtool-avoid-libdir.patch \
+	   file://0042-pr57748.patch \
 	  "
 SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
 SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0042-pr57748.patch b/meta/recipes-devtools/gcc/gcc-4.8/0042-pr57748.patch
new file mode 100644
index 0000000..5356f72
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0042-pr57748.patch
@@ -0,0 +1,78 @@
+Upstream-Status: Backport
+Signed-off-by: Khem Raj
+
+2013-08-01  Martin Jambor  <mjambor@suse.cz>
+
+	PR middle-end/57748
+	* stor-layout.c (compute_record_mode): Treat zero-sized array fields
+	like incomplete types.
+
+testsuite/
+	* gcc.dg/torture/pr57748.c: New test.
+
+
+Index: gcc-4.8.1/gcc/stor-layout.c
+===================================================================
+--- gcc-4.8.1.orig/gcc/stor-layout.c	2013-04-28 10:29:18.000000000 -0700
++++ gcc-4.8.1/gcc/stor-layout.c	2013-08-01 15:02:08.018006125 -0700
+@@ -1618,7 +1618,9 @@
+ 		   && integer_zerop (TYPE_SIZE (TREE_TYPE (field)))))
+ 	  || ! host_integerp (bit_position (field), 1)
+ 	  || DECL_SIZE (field) == 0
+-	  || ! host_integerp (DECL_SIZE (field), 1))
++	  || ! host_integerp (DECL_SIZE (field), 1)
++	  || (TREE_CODE (TREE_TYPE (field)) == ARRAY_TYPE
++	      && tree_low_cst (DECL_SIZE (field), 1) == 0))
+ 	return;
+ 
+       /* If this field is the whole struct, remember its mode so
+Index: gcc-4.8.1/gcc/testsuite/gcc.dg/torture/pr57748.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4.8.1/gcc/testsuite/gcc.dg/torture/pr57748.c	2013-08-01 15:02:08.062006126 -0700
+@@ -0,0 +1,45 @@
++/* PR middle-end/57748 */
++/* { dg-do run } */
++
++#include <stdlib.h>
++
++extern void abort (void);
++
++typedef long long V
++  __attribute__ ((vector_size (2 * sizeof (long long)), may_alias));
++
++typedef struct S { V a; V b[0]; } P __attribute__((aligned (1)));
++
++struct __attribute__((packed)) T { char c; P s; };
++
++void __attribute__((noinline, noclone))
++check (struct T *t)
++{
++  if (t->s.b[0][0] != 3 || t->s.b[0][1] != 4)
++    abort ();
++}
++
++int __attribute__((noinline, noclone))
++get_i (void)
++{
++  return 0;
++}
++
++void __attribute__((noinline, noclone))
++foo (P *p)
++{
++  V a = { 3, 4 };
++  int i = get_i();
++  p->b[i] = a;
++}
++
++int
++main ()
++{
++  struct T *t = (struct T *) malloc (128);
++
++  foo (&t->s);
++  check (t);
++
++  return 0;
++}
-- 
1.7.9.5


