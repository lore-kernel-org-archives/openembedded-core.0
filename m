Return-Path: <ismo.puustinen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 722D472DC4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 10:35:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2016 03:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,576,1455004800"; d="scan'208";a="968416424"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.160])
	by orsmga002.jf.intel.com with ESMTP; 04 May 2016 03:35:29 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 13:35:18 +0300
Message-Id: <1462358118-14378-1-git-send-email-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH] libpcre: Fix CVE-2016-3191
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
X-List-Received-Date: Wed, 04 May 2016 10:35:32 -0000

Fix workspace overflow for (*ACCEPT) with deeply nested parentheses.

The patch is from libpcre version control at
http://vcs.pcre.org/pcre?view=revision&revision=1631 with the ChangeLog
part removed. Original author is Philip Hazel.

Upstream-Status: Accepted [8.39]
CVE: CVE-2016-3191

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 .../libpcre/libpcre/CVE-2016-3191.patch            | 147 +++++++++++++++++++++
 meta/recipes-support/libpcre/libpcre_8.38.bb       |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre/CVE-2016-3191.patch

diff --git a/meta/recipes-support/libpcre/libpcre/CVE-2016-3191.patch b/meta/recipes-support/libpcre/libpcre/CVE-2016-3191.patch
new file mode 100644
index 0000000..ebd950c
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre/CVE-2016-3191.patch
@@ -0,0 +1,147 @@
+Index: pcre/pcre_internal.h
+===================================================================
+--- pcre/pcre_internal.h	(revision 1630)
++++ pcre/pcre_internal.h	(revision 1631)
+@@ -7,7 +7,7 @@
+ and semantics are as close as possible to those of the Perl 5 language.
+ 
+                        Written by Philip Hazel
+-           Copyright (c) 1997-2014 University of Cambridge
++           Copyright (c) 1997-2016 University of Cambridge
+ 
+ -----------------------------------------------------------------------------
+ Redistribution and use in source and binary forms, with or without
+@@ -2289,7 +2289,7 @@
+        ERR50, ERR51, ERR52, ERR53, ERR54, ERR55, ERR56, ERR57, ERR58, ERR59,
+        ERR60, ERR61, ERR62, ERR63, ERR64, ERR65, ERR66, ERR67, ERR68, ERR69,
+        ERR70, ERR71, ERR72, ERR73, ERR74, ERR75, ERR76, ERR77, ERR78, ERR79,
+-       ERR80, ERR81, ERR82, ERR83, ERR84, ERR85, ERR86, ERRCOUNT };
++       ERR80, ERR81, ERR82, ERR83, ERR84, ERR85, ERR86, ERR87, ERRCOUNT };
+ 
+ /* JIT compiling modes. The function list is indexed by them. */
+ 
+Index: pcre/pcre_compile.c
+===================================================================
+--- pcre/pcre_compile.c	(revision 1630)
++++ pcre/pcre_compile.c	(revision 1631)
+@@ -6,7 +6,7 @@
+ and semantics are as close as possible to those of the Perl 5 language.
+ 
+                        Written by Philip Hazel
+-           Copyright (c) 1997-2014 University of Cambridge
++           Copyright (c) 1997-2016 University of Cambridge
+ 
+ -----------------------------------------------------------------------------
+ Redistribution and use in source and binary forms, with or without
+@@ -560,6 +560,7 @@
+   /* 85 */
+   "parentheses are too deeply nested (stack check)\0"
+   "digits missing in \\x{} or \\o{}\0"
++  "regular expression is too complicated\0"
+   ;
+ 
+ /* Table to identify digits and hex digits. This is used when compiling
+@@ -4591,7 +4592,8 @@
+     if (code > cd->start_workspace + cd->workspace_size -
+         WORK_SIZE_SAFETY_MARGIN)                       /* Check for overrun */
+       {
+-      *errorcodeptr = ERR52;
++      *errorcodeptr = (code >= cd->start_workspace + cd->workspace_size)?
++        ERR52 : ERR87;
+       goto FAILED;
+       }
+ 
+@@ -6604,8 +6606,21 @@
+             cd->had_accept = TRUE;
+             for (oc = cd->open_caps; oc != NULL; oc = oc->next)
+               {
+-              *code++ = OP_CLOSE;
+-              PUT2INC(code, 0, oc->number);
++              if (lengthptr != NULL)
++                {
++#ifdef COMPILE_PCRE8
++                *lengthptr += 1 + IMM2_SIZE;
++#elif defined COMPILE_PCRE16
++                *lengthptr += 2 + IMM2_SIZE;
++#elif defined COMPILE_PCRE32
++                *lengthptr += 4 + IMM2_SIZE;
++#endif
++                }
++              else
++                {
++                *code++ = OP_CLOSE;
++                PUT2INC(code, 0, oc->number);
++                }
+               }
+             setverb = *code++ =
+               (cd->assert_depth > 0)? OP_ASSERT_ACCEPT : OP_ACCEPT;
+Index: pcre/pcreposix.c
+===================================================================
+--- pcre/pcreposix.c	(revision 1630)
++++ pcre/pcreposix.c	(revision 1631)
+@@ -6,7 +6,7 @@
+ and semantics are as close as possible to those of the Perl 5 language.
+ 
+                        Written by Philip Hazel
+-           Copyright (c) 1997-2014 University of Cambridge
++           Copyright (c) 1997-2016 University of Cambridge
+ 
+ -----------------------------------------------------------------------------
+ Redistribution and use in source and binary forms, with or without
+@@ -173,7 +173,8 @@
+   REG_BADPAT,  /* group name must start with a non-digit */
+   /* 85 */
+   REG_BADPAT,  /* parentheses too deeply nested (stack check) */
+-  REG_BADPAT   /* missing digits in \x{} or \o{} */
++  REG_BADPAT,  /* missing digits in \x{} or \o{} */
++  REG_BADPAT   /* pattern too complicated */
+ };
+ 
+ /* Table of texts corresponding to POSIX error codes */
+Index: pcre/testdata/testoutput11-32
+===================================================================
+--- pcre/testdata/testoutput11-32	(revision 1630)
++++ pcre/testdata/testoutput11-32	(revision 1631)
+@@ -765,4 +765,7 @@
+  25     End
+ ------------------------------------------------------------------
+ 
++/([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00](*ACCEPT)/
++Failed: missing ) at offset 509
++
+ /-- End of testinput11 --/
+Index: pcre/testdata/testoutput11-16
+===================================================================
+--- pcre/testdata/testoutput11-16	(revision 1630)
++++ pcre/testdata/testoutput11-16	(revision 1631)
+@@ -765,4 +765,7 @@
+  25     End
+ ------------------------------------------------------------------
+ 
++/([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00](*ACCEPT)/
++Failed: regular expression is too complicated at offset 490
++
+ /-- End of testinput11 --/
+Index: pcre/testdata/testinput11
+===================================================================
+--- pcre/testdata/testinput11	(revision 1630)
++++ pcre/testdata/testinput11	(revision 1631)
+@@ -138,4 +138,6 @@
+ 
+ /.((?2)(?R)\1)()/B
+ 
++/([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00](*ACCEPT)/
++
+ /-- End of testinput11 --/
+Index: pcre/testdata/testoutput11-8
+===================================================================
+--- pcre/testdata/testoutput11-8	(revision 1630)
++++ pcre/testdata/testoutput11-8	(revision 1631)
+@@ -765,4 +765,7 @@
+  38     End
+ ------------------------------------------------------------------
+ 
++/([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00](*ACCEPT)/
++Failed: missing ) at offset 509
++
+ /-- End of testinput11 --/
diff --git a/meta/recipes-support/libpcre/libpcre_8.38.bb b/meta/recipes-support/libpcre/libpcre_8.38.bb
index 384c2fe..e4cd375 100644
--- a/meta/recipes-support/libpcre/libpcre_8.38.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.38.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=7e4937814aee14758c1c95b59c80c44d"
 SRC_URI = "ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch \
+           file://CVE-2016-3191.patch \
            file://run-ptest \
            file://Makefile \
 "
-- 
2.5.5


