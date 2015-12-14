Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 0E3B373173
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:24:17 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 14 Dec 2015 13:24:02 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Dec 2015 13:24:08 +0100
Message-ID: <1450095853-48305-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH][dizzy 1/6] glibc/wscanf: CVE-2015-1472
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
X-List-Received-Date: Mon, 14 Dec 2015 12:24:21 -0000
Content-Type: text/plain

Fixes a heap buffer overflow in glibc wscanf.

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-1472
https://sourceware.org/ml/libc-alpha/2015-02/msg00119.html
http://openwall.com/lists/oss-security/2015/02/04/1

Reference to upstream fix:
https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commit;
h=5bd80bfe9ca0d955bfbbc002781bc7b01b6bcb06

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 ...5-1472-wscanf-allocates-too-little-memory.patch | 108 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.20.bb              |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-allocates-too-little-memory.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-allocates-too-little-memory.patch b/meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-allocates-too-little-memory.patch
new file mode 100644
index 0000000..ab513aa
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-allocates-too-little-memory.patch
@@ -0,0 +1,108 @@
+CVE-2015-1472: wscanf allocates too little memory
+
+BZ #16618
+
+Under certain conditions wscanf can allocate too little memory for the
+to-be-scanned arguments and overflow the allocated buffer.  The
+implementation now correctly computes the required buffer size when
+using malloc.
+
+A regression test was added to tst-sscanf.
+
+Upstream-Status: Backport
+
+The patch is from (Paul Pluzhnikov <ppluzhnikov@google.com>):
+[https://sourceware.org/git/?p=glibc.git;a=patch;h=5bd80bfe9ca0d955bfbbc002781bc7b01b6bcb06]
+
+diff -ruN a/ChangeLog b/ChangeLog
+--- a/ChangeLog	2015-09-22 10:20:14.399408389 +0200
++++ b/ChangeLog	2015-09-22 10:33:07.374388595 +0200
+@@ -1,3 +1,12 @@
++2015-02-05  Paul Pluzhnikov  <ppluzhnikov@google.com>
++
++       [BZ #16618] CVE-2015-1472
++       * stdio-common/tst-sscanf.c (main): Test for buffer overflow.
++       * stdio-common/vfscanf.c (_IO_vfscanf_internal): Compute needed
++       size in bytes. Store needed elements in wpmax. Use needed size
++       in bytes for extend_alloca.
++
++
+ 2014-12-16  Florian Weimer  <fweimer@redhat.com>
+ 
+        [BZ #17630]
+diff -ruN a/stdio-common/tst-sscanf.c b/stdio-common/tst-sscanf.c
+--- a/stdio-common/tst-sscanf.c	2015-09-22 10:20:09.995596201 +0200
++++ b/stdio-common/tst-sscanf.c	2015-09-22 10:21:39.211791399 +0200
+@@ -233,5 +233,38 @@
+ 	}
+     }
+ 
++  /* BZ #16618
++     The test will segfault during SSCANF if the buffer overflow
++     is not fixed.  The size of `s` is such that it forces the use
++     of malloc internally and this triggers the incorrect computation.
++     Thus the value for SIZE is arbitrariy high enough that malloc
++     is used.  */
++  {
++#define SIZE 131072
++    CHAR *s = malloc ((SIZE + 1) * sizeof (*s));
++    if (s == NULL)
++      abort ();
++    for (size_t i = 0; i < SIZE; i++)
++      s[i] = L('0');
++    s[SIZE] = L('\0');
++    int i = 42;
++    /* Scan multi-digit zero into `i`.  */
++    if (SSCANF (s, L("%d"), &i) != 1)
++      {
++	printf ("FAIL: bug16618: SSCANF did not read one input item.\n");
++	result = 1;
++      }
++    if (i != 0)
++      {
++	printf ("FAIL: bug16618: Value of `i` was not zero as expected.\n");
++	result = 1;
++      }
++    free (s);
++    if (result != 1)
++      printf ("PASS: bug16618: Did not crash.\n");
++#undef SIZE
++  }
++
++
+   return result;
+ }
+diff -ruN a/stdio-common/vfscanf.c b/stdio-common/vfscanf.c
+--- a/stdio-common/vfscanf.c	2015-09-22 10:20:14.051423230 +0200
++++ b/stdio-common/vfscanf.c	2015-09-22 10:21:39.215791228 +0200
+@@ -279,9 +279,10 @@
+       if (__glibc_unlikely (wpsize == wpmax))				      \
+ 	{								    \
+ 	  CHAR_T *old = wp;						    \
+-	  size_t newsize = (UCHAR_MAX + 1 > 2 * wpmax			    \
+-			    ? UCHAR_MAX + 1 : 2 * wpmax);		    \
+-	  if (use_malloc || !__libc_use_alloca (newsize))		    \
++	  bool fits = __glibc_likely (wpmax <= SIZE_MAX / sizeof (CHAR_T) / 2); \
++	  size_t wpneed = MAX (UCHAR_MAX + 1, 2 * wpmax);		    \
++	  size_t newsize = fits ? wpneed * sizeof (CHAR_T) : SIZE_MAX;	    \
++	  if (!__libc_use_alloca (newsize))				    \
+ 	    {								    \
+ 	      wp = realloc (use_malloc ? wp : NULL, newsize);		    \
+ 	      if (wp == NULL)						    \
+@@ -293,14 +294,13 @@
+ 		}							    \
+ 	      if (! use_malloc)						    \
+ 		MEMCPY (wp, old, wpsize);				    \
+-	      wpmax = newsize;						    \
++	      wpmax = wpneed;						    \
+ 	      use_malloc = true;					    \
+ 	    }								    \
+ 	  else								    \
+ 	    {								    \
+ 	      size_t s = wpmax * sizeof (CHAR_T);			    \
+-	      wp = (CHAR_T *) extend_alloca (wp, s,			    \
+-					     newsize * sizeof (CHAR_T));    \
++	      wp = (CHAR_T *) extend_alloca (wp, s, newsize);		    \
+ 	      wpmax = s / sizeof (CHAR_T);				    \
+ 	      if (old != NULL)						    \
+ 		MEMCPY (wp, old, wpsize);				    \
diff --git a/meta/recipes-core/glibc/glibc_2.20.bb b/meta/recipes-core/glibc/glibc_2.20.bb
index a0736cd..cfbc1c2 100644
--- a/meta/recipes-core/glibc/glibc_2.20.bb
+++ b/meta/recipes-core/glibc/glibc_2.20.bb
@@ -48,6 +48,7 @@ CVEPATCHES = "\
         file://CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch \
         file://CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch \
         file://CVE-2014-9402_endless-loop-in-getaddr_r.patch \
+        file://CVE-2015-1472-wscanf-allocates-too-little-memory.patch \
     "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-- 
1.9.1


