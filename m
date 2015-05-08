Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id DE53460138
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 14:28:46 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t48ESlnL029556 for <openembedded-core@lists.openembedded.org>;
	Fri, 8 May 2015 09:28:47 -0500
Received: from harisdt.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015050809284751-1099842 ;
	Fri, 8 May 2015 09:28:47 -0500 
From: Haris Okanovic <haris.okanovic@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 8 May 2015 09:28:27 -0500
Message-Id: <1431095308-17934-1-git-send-email-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.2.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/08/2015 09:28:47 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/08/2015 09:28:47 AM,
	Serialize complete at 05/08/2015 09:28:47 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-05-08_05:, , signatures=0
Cc: Ken Sharp <ken.sharp@ni.com>
Subject: [PATCH 1/2] glibc: CVE-2015-1472: wscanf allocates too little memory
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
X-List-Received-Date: Fri, 08 May 2015 14:28:48 -0000

Backport Paul Pluzhnikov's glibc patch for CVE-2015-1472:

Under certain conditions wscanf can allocate too little memory for the
to-be-scanned arguments and overflow the allocated buffer.  The
implementation now correctly computes the required buffer size when
using malloc.

https://sourceware.org/bugzilla/show_bug.cgi?id=16618

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
Signed-off-by: Ken Sharp <ken.sharp@ni.com>
Reviewed-by: Rich Tollerton <rich.tollerton@ni.com>
---
Natinst-CAR-ID: 518552
Natinst-ReviewBoard-ID: 96712
---
 ...5-1472-wscanf-allocates-too-little-memory.patch | 127 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.20.bb              |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-allocates-too-little-memory.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-allocates-too-little-memory.patch b/meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-allocates-too-little-memory.patch
new file mode 100644
index 0000000..4ffd609
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-allocates-too-little-memory.patch
@@ -0,0 +1,127 @@
+From 5bd80bfe9ca0d955bfbbc002781bc7b01b6bcb06 Mon Sep 17 00:00:00 2001
+From: Paul Pluzhnikov <ppluzhnikov@google.com>
+Date: Fri, 6 Feb 2015 00:30:42 -0500
+Subject: [PATCH] CVE-2015-1472: wscanf allocates too little memory
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
+https://sourceware.org/bugzilla/show_bug.cgi?id=16618
+---
+ stdio-common/tst-sscanf.c | 33 +++++++++++++++++++++++++++++++++
+ stdio-common/vfscanf.c    | 12 ++++++------
+ 2 files changed, 39 insertions(+), 6 deletions(-)
+
+diff --git a/stdio-common/tst-sscanf.c b/stdio-common/tst-sscanf.c
+index aece3f2f290088b2c08441cf85f2b915a61b9789..8a2eb9e39c4752a30941753d7f0325c2aa352fd1 100644
+--- a/stdio-common/tst-sscanf.c
++++ b/stdio-common/tst-sscanf.c
+@@ -226,12 +226,45 @@ main (void)
+ 	  result = 1;
+ 	}
+       else if (ret == 2 && c != double_tests2[i].residual)
+ 	{
+ 	  printf ("double_tests2[%d] stopped at '%c' != '%c'\n",
+ 		  i, c, double_tests2[i].residual);
+ 	  result = 1;
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
+diff --git a/stdio-common/vfscanf.c b/stdio-common/vfscanf.c
+index cd129a81dee57e5e06ccb0e676e0de3fd52469ca..0e204e7b326d848716222f40b5b82b8256ed1b77 100644
+--- a/stdio-common/vfscanf.c
++++ b/stdio-common/vfscanf.c
+@@ -265,42 +265,42 @@ _IO_vfscanf_internal (_IO_FILE *s, const char *format, _IO_va_list argptr,
+   CHAR_T *wp = NULL;		/* Workspace.  */
+   size_t wpmax = 0;		/* Maximal size of workspace.  */
+   size_t wpsize;		/* Currently used bytes in workspace.  */
+   bool use_malloc = false;
+ #define ADDW(Ch)							    \
+   do									    \
+     {									    \
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
+ 		{							    \
+ 		  if (use_malloc)					    \
+ 		    free (old);						    \
+ 		  done = EOF;						    \
+ 		  goto errout;						    \
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
+ 	    }								    \
+ 	}								    \
+       wp[wpsize++] = (Ch);						    \
+     }									    \
+   while (0)
+ 
+ #ifdef __va_copy
+-- 
+2.2.2
+
diff --git a/meta/recipes-core/glibc/glibc_2.20.bb b/meta/recipes-core/glibc/glibc_2.20.bb
index 3277f7a..e3427dd 100644
--- a/meta/recipes-core/glibc/glibc_2.20.bb
+++ b/meta/recipes-core/glibc/glibc_2.20.bb
@@ -46,6 +46,7 @@ CVEPATCHES = "\
         file://CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch \
         file://CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch \
         file://CVE-2014-9402_endless-loop-in-getaddr_r.patch \
+        file://CVE-2015-1472-wscanf-allocates-too-little-memory.patch \
     "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-- 
2.2.2


