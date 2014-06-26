Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9B5607FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 19:09:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5QJ9amt010870
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 12:09:37 -0700 (PDT)
Received: from yow-pgortmak-d4.wrs.com (128.224.56.60) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 26 Jun 2014 12:09:36 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jun 2014 15:08:47 -0400
Message-ID: <1403809727-11325-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <53A97C13.2090006@windriver.com>
References: <53A97C13.2090006@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2] recipes-devtools: fix segfault in lib32-gcc with "." multilib_dir
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
X-List-Received-Date: Thu, 26 Jun 2014 19:09:37 -0000
Content-Type: text/plain

When enabling a lib32-gcc in a 64 bit build, without doing any
other configuration, the mutilib dir is unspecified, which is
represented internally in gcc as "." and as such uncovers an
invalid free on a non-malloc'd pointer.

As suggested by the gcc folks, simply make sure the "." case
is also stored in a malloc'd pointer, so that the intended
runtime behaviour of the code remains unchanged.

Patch has been accepted by upstream maintainers of gcc.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[v2: worked with gcc folks to get a variation on the 1st
 patch which is now accepted into mainline gcc trunk. ]

 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 ...fault-from-calling-free-on-non-malloc-d-a.patch | 66 ++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch

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
index 000000000000..23b445c9ebfa
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch
@@ -0,0 +1,66 @@
+From a22a222c8f9299f6c07a0274388ade7d4ab8c28d Mon Sep 17 00:00:00 2001
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
+The problem arises because we conditionally assign the pointer we
+eventually free, and the conditional may assign the pointer to the
+non-malloc'd internal string "." which fails when we free it here:
+
+   if (multilib_dir == NULL && multilib_os_dir != NULL
+       && strcmp (multilib_os_dir, ".") == 0)
+     {
+       free (CONST_CAST (char *, multilib_os_dir));
+       ...
+
+As suggested by Jakub, ensure the "." case is also malloc'd via
+xstrdup() and hence the pointer for the "." case can be freed.
+
+Cc: Jakub Jelinek <jakub@redhat.com>
+Cc: Jeff Law <law@redhat.com>
+Cc: Matthias Klose <doko@ubuntu.com>
+CC: Tobias Burnus <burnus@net-b.de>
+Upstream-Status: Accepted [ https://gcc.gnu.org/ml/gcc-patches/2014-06/msg02069.html ]
+Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 9ac18e60d801..168acf7eb0c9 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -7790,10 +7790,15 @@ set_multilib_dir (void)
+ 		q2++;
+ 	      if (*q2 == ':')
+ 		ml_end = q2;
+-	      new_multilib_os_dir = XNEWVEC (char, ml_end - q);
+-	      memcpy (new_multilib_os_dir, q + 1, ml_end - q - 1);
+-	      new_multilib_os_dir[ml_end - q - 1] = '\0';
+-	      multilib_os_dir = *new_multilib_os_dir ? new_multilib_os_dir : ".";
++	      if (ml_end - q == 1)
++		multilib_os_dir = xstrdup (".");
++	      else
++		{
++		  new_multilib_os_dir = XNEWVEC (char, ml_end - q);
++		  memcpy (new_multilib_os_dir, q + 1, ml_end - q - 1);
++		  new_multilib_os_dir[ml_end - q - 1] = '\0';
++		  multilib_os_dir = new_multilib_os_dir;
++		}
+ 
+ 	      if (q2 < end && *q2 == ':')
+ 		{
+-- 
+1.9.2
+
-- 
1.9.1


