Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33D267318C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 01:37:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u671bB36012029
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2016 18:37:11 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Jul 2016 18:37:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jul 2016 18:37:04 -0700
Message-ID: <a1f92cd86d8390f48bc5248249949c9eac44800b.1467855356.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1467855356.git.liezhi.yang@windriver.com>
References: <cover.1467855356.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] libpcre: 8.38 -> 8.39
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
X-List-Received-Date: Thu, 07 Jul 2016 01:37:11 -0000
Content-Type: text/plain

* Remove CVE-2016-3191.patch which is already in the source.
* The LIC_FILES_CHKSUM is changed since it has updated the date from
  2015 to 2016, the contents are the same.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libpcre/libpcre/CVE-2016-3191.patch            | 174 ---------------------
 .../libpcre/{libpcre_8.38.bb => libpcre_8.39.bb}   |   7 +-
 2 files changed, 3 insertions(+), 178 deletions(-)
 delete mode 100644 meta/recipes-support/libpcre/libpcre/CVE-2016-3191.patch
 rename meta/recipes-support/libpcre/{libpcre_8.38.bb => libpcre_8.39.bb} (91%)

diff --git a/meta/recipes-support/libpcre/libpcre/CVE-2016-3191.patch b/meta/recipes-support/libpcre/libpcre/CVE-2016-3191.patch
deleted file mode 100644
index ba8cbfd..0000000
--- a/meta/recipes-support/libpcre/libpcre/CVE-2016-3191.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-From 568fcc16a0a335250aee06a104fc5df98d2a8779 Mon Sep 17 00:00:00 2001
-From: Ismo Puustinen <ismo.puustinen@intel.com>
-Date: Wed, 4 May 2016 15:43:22 +0300
-Subject: [PATCH] Fix workspace overflow for (*ACCEPT) with deeply nested
- parentheses.
-
-The patch is from libpcre version control at
-http://vcs.pcre.org/pcre?view=revision&revision=1631 with the ChangeLog
-part removed. Original author is Philip Hazel.
-
-Upstream-Status: Accepted [8.39]
-CVE: CVE-2016-3191
-
-Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
----
- pcre_compile.c           | 23 +++++++++++++++++++----
- pcre_internal.h          |  4 ++--
- pcreposix.c              |  5 +++--
- testdata/testinput11     |  2 ++
- testdata/testoutput11-16 |  3 +++
- testdata/testoutput11-32 |  3 +++
- testdata/testoutput11-8  |  3 +++
- 7 files changed, 35 insertions(+), 8 deletions(-)
-
-diff --git a/pcre_compile.c b/pcre_compile.c
-index 4d3b313..1bc2b7f 100644
---- a/pcre_compile.c
-+++ b/pcre_compile.c
-@@ -6,7 +6,7 @@
- and semantics are as close as possible to those of the Perl 5 language.
- 
-                        Written by Philip Hazel
--           Copyright (c) 1997-2014 University of Cambridge
-+           Copyright (c) 1997-2016 University of Cambridge
- 
- -----------------------------------------------------------------------------
- Redistribution and use in source and binary forms, with or without
-@@ -560,6 +560,7 @@ static const char error_texts[] =
-   /* 85 */
-   "parentheses are too deeply nested (stack check)\0"
-   "digits missing in \\x{} or \\o{}\0"
-+  "regular expression is too complicated\0"
-   ;
- 
- /* Table to identify digits and hex digits. This is used when compiling
-@@ -4591,7 +4592,8 @@ for (;; ptr++)
-     if (code > cd->start_workspace + cd->workspace_size -
-         WORK_SIZE_SAFETY_MARGIN)                       /* Check for overrun */
-       {
--      *errorcodeptr = ERR52;
-+      *errorcodeptr = (code >= cd->start_workspace + cd->workspace_size)?
-+        ERR52 : ERR87;
-       goto FAILED;
-       }
- 
-@@ -6604,8 +6606,21 @@ for (;; ptr++)
-             cd->had_accept = TRUE;
-             for (oc = cd->open_caps; oc != NULL; oc = oc->next)
-               {
--              *code++ = OP_CLOSE;
--              PUT2INC(code, 0, oc->number);
-+              if (lengthptr != NULL)
-+                {
-+#ifdef COMPILE_PCRE8
-+                *lengthptr += 1 + IMM2_SIZE;
-+#elif defined COMPILE_PCRE16
-+                *lengthptr += 2 + IMM2_SIZE;
-+#elif defined COMPILE_PCRE32
-+                *lengthptr += 4 + IMM2_SIZE;
-+#endif
-+                }
-+              else
-+                {
-+                *code++ = OP_CLOSE;
-+                PUT2INC(code, 0, oc->number);
-+                }
-               }
-             setverb = *code++ =
-               (cd->assert_depth > 0)? OP_ASSERT_ACCEPT : OP_ACCEPT;
-diff --git a/pcre_internal.h b/pcre_internal.h
-index f7a5ee7..dbfe80e 100644
---- a/pcre_internal.h
-+++ b/pcre_internal.h
-@@ -7,7 +7,7 @@
- and semantics are as close as possible to those of the Perl 5 language.
- 
-                        Written by Philip Hazel
--           Copyright (c) 1997-2014 University of Cambridge
-+           Copyright (c) 1997-2016 University of Cambridge
- 
- -----------------------------------------------------------------------------
- Redistribution and use in source and binary forms, with or without
-@@ -2289,7 +2289,7 @@ enum { ERR0,  ERR1,  ERR2,  ERR3,  ERR4,  ERR5,  ERR6,  ERR7,  ERR8,  ERR9,
-        ERR50, ERR51, ERR52, ERR53, ERR54, ERR55, ERR56, ERR57, ERR58, ERR59,
-        ERR60, ERR61, ERR62, ERR63, ERR64, ERR65, ERR66, ERR67, ERR68, ERR69,
-        ERR70, ERR71, ERR72, ERR73, ERR74, ERR75, ERR76, ERR77, ERR78, ERR79,
--       ERR80, ERR81, ERR82, ERR83, ERR84, ERR85, ERR86, ERRCOUNT };
-+       ERR80, ERR81, ERR82, ERR83, ERR84, ERR85, ERR86, ERR87, ERRCOUNT };
- 
- /* JIT compiling modes. The function list is indexed by them. */
- 
-diff --git a/pcreposix.c b/pcreposix.c
-index f024423..5736c65 100644
---- a/pcreposix.c
-+++ b/pcreposix.c
-@@ -6,7 +6,7 @@
- and semantics are as close as possible to those of the Perl 5 language.
- 
-                        Written by Philip Hazel
--           Copyright (c) 1997-2014 University of Cambridge
-+           Copyright (c) 1997-2016 University of Cambridge
- 
- -----------------------------------------------------------------------------
- Redistribution and use in source and binary forms, with or without
-@@ -173,7 +173,8 @@ static const int eint[] = {
-   REG_BADPAT,  /* group name must start with a non-digit */
-   /* 85 */
-   REG_BADPAT,  /* parentheses too deeply nested (stack check) */
--  REG_BADPAT   /* missing digits in \x{} or \o{} */
-+  REG_BADPAT,  /* missing digits in \x{} or \o{} */
-+  REG_BADPAT   /* pattern too complicated */
- };
- 
- /* Table of texts corresponding to POSIX error codes */
-diff --git a/testdata/testinput11 b/testdata/testinput11
-index ac9d228..6f0989a 100644
---- a/testdata/testinput11
-+++ b/testdata/testinput11
-@@ -138,4 +138,6 @@ is required for these tests. --/
- 
- /.((?2)(?R)\1)()/B
- 
-+/([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00](*ACCEPT)/
-+
- /-- End of testinput11 --/
-diff --git a/testdata/testoutput11-16 b/testdata/testoutput11-16
-index 9a0a12d..6e8ff4c 100644
---- a/testdata/testoutput11-16
-+++ b/testdata/testoutput11-16
-@@ -765,4 +765,7 @@ Memory allocation (code space): 14
-  25     End
- ------------------------------------------------------------------
- 
-+/([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00](*ACCEPT)/
-+Failed: regular expression is too complicated at offset 490
-+
- /-- End of testinput11 --/
-diff --git a/testdata/testoutput11-32 b/testdata/testoutput11-32
-index 57e5da0..710646b 100644
---- a/testdata/testoutput11-32
-+++ b/testdata/testoutput11-32
-@@ -765,4 +765,7 @@ Memory allocation (code space): 28
-  25     End
- ------------------------------------------------------------------
- 
-+/([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00](*ACCEPT)/
-+Failed: missing ) at offset 509
-+
- /-- End of testinput11 --/
-diff --git a/testdata/testoutput11-8 b/testdata/testoutput11-8
-index 748548a..173fc33 100644
---- a/testdata/testoutput11-8
-+++ b/testdata/testoutput11-8
-@@ -765,4 +765,7 @@ Memory allocation (code space): 10
-  38     End
- ------------------------------------------------------------------
- 
-+/([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00](*ACCEPT)/
-+Failed: missing ) at offset 509
-+
- /-- End of testinput11 --/
--- 
-2.5.5
-
diff --git a/meta/recipes-support/libpcre/libpcre_8.38.bb b/meta/recipes-support/libpcre/libpcre_8.39.bb
similarity index 91%
rename from meta/recipes-support/libpcre/libpcre_8.38.bb
rename to meta/recipes-support/libpcre/libpcre_8.39.bb
index e4cd375..129076a 100644
--- a/meta/recipes-support/libpcre/libpcre_8.38.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.39.bb
@@ -6,17 +6,16 @@ SUMMARY = "Perl Compatible Regular Expressions"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=7e4937814aee14758c1c95b59c80c44d"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b8221cbf43c5587f90ccf228f1185cc2"
 SRC_URI = "ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch \
-           file://CVE-2016-3191.patch \
            file://run-ptest \
            file://Makefile \
 "
 
-SRC_URI[md5sum] = "00aabbfe56d5a48b270f999b508c5ad2"
-SRC_URI[sha256sum] = "b9e02d36e23024d6c02a2e5b25204b3a4fa6ade43e0a5f869f254f49535079df"
+SRC_URI[md5sum] = "e3fca7650a0556a2647821679d81f585"
+SRC_URI[sha256sum] = "b858099f82483031ee02092711689e7245586ada49e534a06e678b8ea9549e8b"
 
 S = "${WORKDIR}/pcre-${PV}"
 
-- 
2.9.0


