Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 42ADE6A680
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 15:02:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5NF2O4A006326
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 08:02:24 -0700 (PDT)
Received: from yow-pgortmak-d4.wrs.com (128.224.56.60) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 23 Jun 2014 08:02:23 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jun 2014 11:01:39 -0400
Message-ID: <1403535699-41618-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] recipes-devtools: fix segfault in lib32-gcc with "." multilib_dir
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
X-List-Received-Date: Mon, 23 Jun 2014 15:02:26 -0000
Content-Type: text/plain

When enabling a lib32-gcc in a 64 bit build, without doing any
other configuration, the mutilib dir is unspecified, which is
represented internally in gcc as "." and as such uncovers an
invalid free on a non-malloc'd pointer, triggered by that code
path which erroneously checks for equality with "." rather than
inequality.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 185dbba82200..cbf1355fcbf7 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -66,6 +66,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0050-Revert-Use-dbx_reg_number-for-spanning-registers.patch \
            file://0051-eabispe.patch \
            file://0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch \
+           file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch \
 	  "
 SRC_URI[md5sum] = "9709b49ae0e904cbb0a6a1b62853b556"
 SRC_URI[sha256sum] = "b9b047a97bade9c1c89970bc8e211ff57b7b8998a1730a80a653d329f8ed1257"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch b/meta/recipes-devtools/gcc/gcc-4.9/0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch
new file mode 100644
index 000000000000..6cec9d6e1b27
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch
@@ -0,0 +1,46 @@
+From 5a0d2321f7d4afebb017d0672a04f570ba942f87 Mon Sep 17 00:00:00 2001
+From: Paul Gortmaker <paul.gortmaker@windriver.com>
+Date: Fri, 20 Jun 2014 16:41:08 -0400
+Subject: [PATCH] gcc: fix segfault from calling free on non-malloc'd area
+
+We see the following on a 32bit gcc installed on 64 bit host:
+
+  Reading symbols from ./i586-pokymllib32-linux-gcc...done.
+  (gdb) run
+  Starting program: x86-pokymllib32-linux/lib32-gcc/4.9.0-r0/image/usr/bin/i586-pokymllib32-linux-gcc
+
+  Program received signal SIGSEGV, Segmentation fault.
+  0xf7e957e0 in free () from /lib/i386-linux-gnu/libc.so.6
+  (gdb) bt
+  #0  0xf7e957e0 in free () from /lib/i386-linux-gnu/libc.so.6
+  #1  0x0804b73c in set_multilib_dir () at gcc-4.9.0/gcc/gcc.c:7827
+  #2  main (argc=1, argv=0xffffd504) at gcc-4.9.0/gcc/gcc.c:6688
+  (gdb)
+
+The problem arises because the check on whether we are using
+the internal string "." or an allocated one is reversed.
+We should be calling free() when the string is not equal to
+the internal "." string.
+
+Upstream-Status: Submitted [ https://gcc.gnu.org/ml/gcc-patches/2014-06/msg01778.html ]
+Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+---
+ gcc/gcc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 6870a840e1b7..a580975a7057 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -7822,7 +7822,7 @@ set_multilib_dir (void)
+     }
+ 
+   if (multilib_dir == NULL && multilib_os_dir != NULL
+-      && strcmp (multilib_os_dir, ".") == 0)
++      && strcmp (multilib_os_dir, ".") != 0)
+     {
+       free (CONST_CAST (char *, multilib_os_dir));
+       multilib_os_dir = NULL;
+-- 
+1.9.1
+
-- 
1.9.1


