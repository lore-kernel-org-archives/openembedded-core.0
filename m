Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 355C974888
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:20:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:20:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599853"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:20:16 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:18 +0300
Message-Id: <20180404111321.10824-19-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/22] libidn: update to 1.34
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
X-List-Received-Date: Wed, 04 Apr 2018 11:20:16 -0000

Drop backported 0001-idn-fix-printf-format-security-warnings.patch and
gcc7-compatibility.patch.

Refresh a couple other patches.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...1-idn-fix-printf-format-security-warnings.patch | 694 ---------------------
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |  25 +-
 .../libidn/libidn/gcc7-compatibility.patch         | 334 ----------
 .../libidn/libidn_fix_for_automake-1.12.patch      |  19 +-
 .../libidn/{libidn_1.33.bb => libidn_1.34.bb}      |   8 +-
 5 files changed, 34 insertions(+), 1046 deletions(-)
 delete mode 100644 meta/recipes-extended/libidn/libidn/0001-idn-fix-printf-format-security-warnings.patch
 delete mode 100644 meta/recipes-extended/libidn/libidn/gcc7-compatibility.patch
 rename meta/recipes-extended/libidn/{libidn_1.33.bb => libidn_1.34.bb} (86%)

diff --git a/meta/recipes-extended/libidn/libidn/0001-idn-fix-printf-format-security-warnings.patch b/meta/recipes-extended/libidn/libidn/0001-idn-fix-printf-format-security-warnings.patch
deleted file mode 100644
index 2d5faabb240..00000000000
--- a/meta/recipes-extended/libidn/libidn/0001-idn-fix-printf-format-security-warnings.patch
+++ /dev/null
@@ -1,694 +0,0 @@
-From 7148adf34dae30345c2e4d9d437838a45ba6f6e8 Mon Sep 17 00:00:00 2001
-From: =?utf8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
-Date: Wed, 1 Feb 2017 11:06:39 +0100
-Subject: [PATCH] Fix -Wformat warnings
-
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- examples/example.c     |  6 +++---
- examples/example3.c    |  4 ++--
- examples/example4.c    |  4 ++--
- examples/example5.c    |  2 +-
- src/idn.c              |  2 +-
- tests/tst_idna.c       | 25 +++++++++++++------------
- tests/tst_idna2.c      |  8 ++++----
- tests/tst_idna3.c      |  8 ++++----
- tests/tst_nfkc.c       |  8 ++++----
- tests/tst_pr29.c       | 12 ++++++------
- tests/tst_punycode.c   | 13 +++++++------
- tests/tst_strerror.c   | 20 ++++++++++----------
- tests/tst_stringprep.c | 12 ++++++------
- tests/tst_tld.c        | 20 ++++++++++----------
- tests/utils.c          |  6 +++---
- 15 files changed, 76 insertions(+), 74 deletions(-)
-
-diff --git a/examples/example.c b/examples/example.c
-index 6e91783..24f64e0 100644
---- a/examples/example.c
-+++ b/examples/example.c
-@@ -55,7 +55,7 @@ main (void)
- 
-   printf ("Before locale2utf8 (length %ld): ", (long int) strlen (buf));
-   for (i = 0; i < strlen (buf); i++)
--    printf ("%02x ", buf[i] & 0xFF);
-+    printf ("%02x ", (unsigned) buf[i] & 0xFF);
-   printf ("\n");
- 
-   p = stringprep_locale_to_utf8 (buf);
-@@ -69,7 +69,7 @@ main (void)
- 
-   printf ("Before stringprep (length %ld): ", (long int) strlen (buf));
-   for (i = 0; i < strlen (buf); i++)
--    printf ("%02x ", buf[i] & 0xFF);
-+    printf ("%02x ", (unsigned) buf[i] & 0xFF);
-   printf ("\n");
- 
-   rc = stringprep (buf, BUFSIZ, 0, stringprep_nameprep);
-@@ -79,7 +79,7 @@ main (void)
-     {
-       printf ("After stringprep (length %ld): ", (long int) strlen (buf));
-       for (i = 0; i < strlen (buf); i++)
--	printf ("%02x ", buf[i] & 0xFF);
-+	printf ("%02x ", (unsigned) buf[i] & 0xFF);
-       printf ("\n");
-     }
- 
-diff --git a/examples/example3.c b/examples/example3.c
-index fc11c1c..ffb9042 100644
---- a/examples/example3.c
-+++ b/examples/example3.c
-@@ -56,7 +56,7 @@ main (void)
- 
-   printf ("Read string (length %ld): ", (long int) strlen (buf));
-   for (i = 0; i < strlen (buf); i++)
--    printf ("%02x ", buf[i] & 0xFF);
-+    printf ("%02x ", (unsigned) buf[i] & 0xFF);
-   printf ("\n");
- 
-   rc = idna_to_ascii_lz (buf, &p, 0);
-@@ -68,7 +68,7 @@ main (void)
- 
-   printf ("ACE label (length %ld): '%s'\n", (long int) strlen (p), p);
-   for (i = 0; i < strlen (p); i++)
--    printf ("%02x ", p[i] & 0xFF);
-+    printf ("%02x ", (unsigned) p[i] & 0xFF);
-   printf ("\n");
- 
-   free (p);
-diff --git a/examples/example4.c b/examples/example4.c
-index 1b319c9..a3315a1 100644
---- a/examples/example4.c
-+++ b/examples/example4.c
-@@ -56,7 +56,7 @@ main (void)
- 
-   printf ("Read string (length %ld): ", (long int) strlen (buf));
-   for (i = 0; i < strlen (buf); i++)
--    printf ("%02x ", buf[i] & 0xFF);
-+    printf ("%02x ", (unsigned) buf[i] & 0xFF);
-   printf ("\n");
- 
-   rc = idna_to_unicode_lzlz (buf, &p, 0);
-@@ -68,7 +68,7 @@ main (void)
- 
-   printf ("ACE label (length %ld): '%s'\n", (long int) strlen (p), p);
-   for (i = 0; i < strlen (p); i++)
--    printf ("%02x ", p[i] & 0xFF);
-+    printf ("%02x ", (unsigned) p[i] & 0xFF);
-   printf ("\n");
- 
-   free (p);
-diff --git a/examples/example5.c b/examples/example5.c
-index df55798..29d40b9 100644
---- a/examples/example5.c
-+++ b/examples/example5.c
-@@ -68,7 +68,7 @@ main (void)
- 
-   printf ("Read string (length %ld): ", (long int) strlen (buf));
-   for (i = 0; i < strlen (buf); i++)
--    printf ("%02x ", buf[i] & 0xFF);
-+    printf ("%02x ", (unsigned) buf[i] & 0xFF);
-   printf ("\n");
- 
-   p = stringprep_locale_to_utf8 (buf);
-diff --git a/src/idn.c b/src/idn.c
-index be1c7d1..13eb3c9 100644
---- a/src/idn.c
-+++ b/src/idn.c
-@@ -419,7 +419,7 @@ main (int argc, char *argv[])
- 	      size_t i;
- 	      for (i = 0; p[i]; i++)
- 		fprintf (stderr, "output[%lu] = U+%04x\n",
--			 (unsigned long) i, p[i]);
-+			 (unsigned long) i, (unsigned) p[i]);
- 	    }
- 
- 	  fprintf (stdout, "%s\n", p);
-diff --git a/tests/tst_idna.c b/tests/tst_idna.c
-index 415764e..4ac046f 100644
---- a/tests/tst_idna.c
-+++ b/tests/tst_idna.c
-@@ -220,13 +220,14 @@ doit (void)
-   char label[100];
-   uint32_t *ucs4label = NULL;
-   uint32_t tmp[100];
--  size_t len, len2, i;
-+  size_t len, len2;
-   int rc;
-+  unsigned i;
- 
-   for (i = 0; i < sizeof (idna) / sizeof (idna[0]); i++)
-     {
-       if (debug)
--	printf ("IDNA entry %ld: %s\n", i, idna[i].name);
-+	printf ("IDNA entry %u: %s\n", i, idna[i].name);
- 
-       if (debug)
- 	{
-@@ -237,7 +238,7 @@ doit (void)
-       rc = idna_to_ascii_4i (idna[i].in, idna[i].inlen, label, idna[i].flags);
-       if (rc != idna[i].toasciirc)
- 	{
--	  fail ("IDNA entry %ld failed: %d\n", i, rc);
-+	  fail ("IDNA entry %u failed: %d\n", i, rc);
- 	  if (debug)
- 	    printf ("FATAL\n");
- 	  continue;
-@@ -256,7 +257,7 @@ doit (void)
- 	  if (strlen (idna[i].out) != strlen (label) ||
- 	      strcasecmp (idna[i].out, label) != 0)
- 	    {
--	      fail ("IDNA entry %ld failed\n", i);
-+	      fail ("IDNA entry %u failed\n", i);
- 	      if (debug)
- 		printf ("ERROR\n");
- 	    }
-@@ -273,8 +274,8 @@ doit (void)
- 
-       if (debug)
- 	{
--	  printf ("in: %s (%ld==%ld)\n", idna[i].out, strlen (idna[i].out),
--		  len);
-+	  printf ("in: %s (%d==%d)\n", idna[i].out, (int) strlen (idna[i].out),
-+		  (int) len);
- 	  ucs4print (ucs4label, len);
- 	}
- 
-@@ -282,20 +283,20 @@ doit (void)
-       rc = idna_to_unicode_44i (ucs4label, len, tmp, &len2, idna[i].flags);
-       if (debug)
- 	{
--	  printf ("expected out (%ld):\n",
-+	  printf ("expected out (%lu):\n",
- 		  rc == IDNA_SUCCESS ? idna[i].inlen : len);
- 	  if (rc == IDNA_SUCCESS)
- 	    ucs4print (idna[i].in, idna[i].inlen);
- 	  else
- 	    ucs4print (ucs4label, len);
- 
--	  printf ("computed out (%ld):\n", len2);
-+	  printf ("computed out (%d):\n", (int) len2);
- 	  ucs4print (tmp, len2);
- 	}
- 
-       if (rc != idna[i].tounicoderc)
- 	{
--	  fail ("IDNA entry %ld failed: %d\n", i, rc);
-+	  fail ("IDNA entry %u failed: %d\n", i, rc);
- 	  if (debug)
- 	    printf ("FATAL\n");
- 	  continue;
-@@ -309,11 +310,11 @@ doit (void)
- 	  if (debug)
- 	    {
- 	      if (rc == IDNA_SUCCESS)
--		printf ("len=%ld len2=%ld\n", len2, idna[i].inlen);
-+		printf ("len=%d len2=%d\n", (int) len2, (int) idna[i].inlen);
- 	      else
--		printf ("len=%ld len2=%ld\n", len, len2);
-+		printf ("len=%d len2=%d\n", (int) len, (int) len2);
- 	    }
--	  fail ("IDNA entry %ld failed\n", i);
-+	  fail ("IDNA entry %u failed\n", i);
- 	  if (debug)
- 	    printf ("ERROR\n");
- 	}
-diff --git a/tests/tst_idna2.c b/tests/tst_idna2.c
-index 65b3a4d..38932ca 100644
---- a/tests/tst_idna2.c
-+++ b/tests/tst_idna2.c
-@@ -461,14 +461,14 @@ static const struct idna idna[] = {
- void
- doit (void)
- {
--  size_t i;
-+  unsigned i;
-   char *out;
-   int rc;
- 
-   for (i = 0; i < sizeof (idna) / sizeof (idna[0]); i++)
-     {
-       if (debug)
--	printf ("IDNA2 entry %ld\n", i);
-+	printf ("IDNA2 entry %u\n", i);
- 
-       if (debug)
- 	{
-@@ -487,7 +487,7 @@ doit (void)
- 			     IDNA_USE_STD3_ASCII_RULES);
-       if (rc != IDNA_SUCCESS && strlen (idna[i].out) > 0)
- 	{
--	  fail ("IDNA2 entry %ld failed: %d\n", i, rc);
-+	  fail ("IDNA2 entry %u failed: %d\n", i, rc);
- 	  continue;
- 	}
- 
-@@ -504,7 +504,7 @@ doit (void)
- 	  if (strlen (idna[i].out) != strlen (out) ||
- 	      strcasecmp (idna[i].out, out) != 0)
- 	    {
--	      fail ("IDNA2 entry %ld failed\n", i);
-+	      fail ("IDNA2 entry %u failed\n", i);
- 	      if (debug)
- 		printf ("ERROR\n");
- 	    }
-diff --git a/tests/tst_idna3.c b/tests/tst_idna3.c
-index a189378..f65628c 100644
---- a/tests/tst_idna3.c
-+++ b/tests/tst_idna3.c
-@@ -59,13 +59,13 @@ doit (void)
- {
-   int rc;
-   char *out = NULL;
--  size_t i;
-+  unsigned i;
- 
-   for (i = 0; i < sizeof (idna) / sizeof (idna[0]); i++)
-     {
-       rc = idna_to_unicode_8z8z (idna[i].in, &out, 0);
-       if (rc != IDNA_SUCCESS)
--	fail ("IDNA3[%ld] failed %d\n", i, rc);
-+	fail ("IDNA3[%u] failed %d\n", i, rc);
- 
-       if (debug && rc == IDNA_SUCCESS)
- 	{
-@@ -75,9 +75,9 @@ doit (void)
- 	}
- 
-       if (strcmp (out, idna[i].out) != 0)
--	fail ("IDNA3[%ld] failed\n", i);
-+	fail ("IDNA3[%u] failed\n", i);
-       else if (debug)
--	printf ("IDNA3[%ld] success\n", i);
-+	printf ("IDNA3[%u] success\n", i);
- 
-       if (out)
- 	idn_free (out);
-diff --git a/tests/tst_nfkc.c b/tests/tst_nfkc.c
-index d150fec..f5af9c6 100644
---- a/tests/tst_nfkc.c
-+++ b/tests/tst_nfkc.c
-@@ -68,18 +68,18 @@ void
- doit (void)
- {
-   char *out;
--  size_t i;
-+  unsigned i;
- 
-   for (i = 0; i < sizeof (nfkc) / sizeof (nfkc[0]); i++)
-     {
-       if (debug)
--	printf ("NFKC entry %ld\n", i);
-+	printf ("NFKC entry %u\n", i);
- 
-       out = stringprep_utf8_nfkc_normalize (nfkc[i].in,
- 					    (ssize_t) strlen (nfkc[i].in));
-       if (out == NULL)
- 	{
--	  fail ("NFKC entry %ld failed fatally\n", i);
-+	  fail ("NFKC entry %u failed fatally\n", i);
- 	  continue;
- 	}
- 
-@@ -114,7 +114,7 @@ doit (void)
-       if (strlen (nfkc[i].out) != strlen (out) ||
- 	  memcmp (nfkc[i].out, out, strlen (out)) != 0)
- 	{
--	  fail ("NFKC entry %ld failed\n", i);
-+	  fail ("NFKC entry %u failed\n", i);
- 	  if (debug)
- 	    printf ("ERROR\n");
- 	}
-diff --git a/tests/tst_pr29.c b/tests/tst_pr29.c
-index 3dc5466..11d0ede 100644
---- a/tests/tst_pr29.c
-+++ b/tests/tst_pr29.c
-@@ -91,7 +91,7 @@ static const struct tv tv[] = {
- void
- doit (void)
- {
--  size_t i;
-+  unsigned i;
-   int rc;
- 
-   for (i = 0; i < sizeof (tv) / sizeof (tv[0]); i++)
-@@ -100,7 +100,7 @@ doit (void)
- 	{
- 	  uint32_t *p, *q;
- 
--	  printf ("PR29 entry %ld: %s\n", i, tv[i].name);
-+	  printf ("PR29 entry %u: %s\n", i, tv[i].name);
- 
- 	  printf ("in:\n");
- 	  ucs4print (tv[i].in, tv[i].inlen);
-@@ -120,7 +120,7 @@ doit (void)
-       rc = pr29_4 (tv[i].in, tv[i].inlen);
-       if (rc != tv[i].rc)
- 	{
--	  fail ("PR29 entry %ld failed (expected %d): %d\n", i, tv[i].rc, rc);
-+	  fail ("PR29 entry %u failed (expected %d): %d\n", i, tv[i].rc, rc);
- 	  if (debug)
- 	    printf ("FATAL\n");
- 	  continue;
-@@ -129,7 +129,7 @@ doit (void)
-       rc = pr29_4z (tv[i].in);
-       if (rc != tv[i].rc)
- 	{
--	  fail ("PR29 entry %ld failed (expected %d): %d\n", i, tv[i].rc, rc);
-+	  fail ("PR29 entry %u failed (expected %d): %d\n", i, tv[i].rc, rc);
- 	  if (debug)
- 	    printf ("FATAL\n");
- 	  continue;
-@@ -142,7 +142,7 @@ doit (void)
- 	p = stringprep_ucs4_to_utf8 (tv[i].in, (ssize_t) tv[i].inlen,
- 				     &items_read, &items_written);
- 	if (p == NULL)
--	  fail ("FAIL: stringprep_ucs4_to_utf8(tv[%ld]) == NULL\n", i);
-+	  fail ("FAIL: stringprep_ucs4_to_utf8(tv[%u]) == NULL\n", i);
- 	if (debug)
- 	  hexprint (p, strlen (p));
- 
-@@ -150,7 +150,7 @@ doit (void)
- 	free (p);
- 	if (rc != tv[i].rc)
- 	  {
--	    fail ("PR29 entry %ld failed (expected %d): %d\n",
-+	    fail ("PR29 entry %u failed (expected %d): %d\n",
- 		  i, tv[i].rc, rc);
- 	    if (debug)
- 	      printf ("FATAL\n");
-diff --git a/tests/tst_punycode.c b/tests/tst_punycode.c
-index 493b8a2..997744a 100644
---- a/tests/tst_punycode.c
-+++ b/tests/tst_punycode.c
-@@ -173,7 +173,8 @@ doit (void)
-   char *p;
-   uint32_t *q;
-   int rc;
--  size_t i, outlen;
-+  size_t outlen;
-+  unsigned i;
- 
-   p = malloc (sizeof (*p) * BUFSIZ);
-   if (p == NULL)
-@@ -186,7 +187,7 @@ doit (void)
-   for (i = 0; i < sizeof (punycode) / sizeof (punycode[0]); i++)
-     {
-       if (debug)
--	printf ("PUNYCODE entry %ld: %s\n", i, punycode[i].name);
-+	printf ("PUNYCODE entry %u: %s\n", i, punycode[i].name);
- 
-       if (debug)
- 	{
-@@ -199,7 +200,7 @@ doit (void)
- 			    NULL, &outlen, p);
-       if (rc != punycode[i].rc)
- 	{
--	  fail ("punycode_encode() entry %ld failed: %d\n", i, rc);
-+	  fail ("punycode_encode() entry %u failed: %d\n", i, rc);
- 	  if (debug)
- 	    printf ("FATAL\n");
- 	  continue;
-@@ -221,7 +222,7 @@ doit (void)
- 	  if (strlen (punycode[i].out) != strlen (p) ||
- 	      memcmp (punycode[i].out, p, strlen (p)) != 0)
- 	    {
--	      fail ("punycode() entry %ld failed\n", i);
-+	      fail ("punycode() entry %u failed\n", i);
- 	      if (debug)
- 		printf ("ERROR\n");
- 	    }
-@@ -241,7 +242,7 @@ doit (void)
- 			    &outlen, q, NULL);
-       if (rc != punycode[i].rc)
- 	{
--	  fail ("punycode() entry %ld failed: %d\n", i, rc);
-+	  fail ("punycode() entry %u failed: %d\n", i, rc);
- 	  if (debug)
- 	    printf ("FATAL\n");
- 	  continue;
-@@ -262,7 +263,7 @@ doit (void)
- 	  if (punycode[i].inlen != outlen ||
- 	      memcmp (punycode[i].in, q, outlen) != 0)
- 	    {
--	      fail ("punycode_decode() entry %ld failed\n", i);
-+	      fail ("punycode_decode() entry %u failed\n", i);
- 	      if (debug)
- 		printf ("ERROR\n");
- 	    }
-diff --git a/tests/tst_strerror.c b/tests/tst_strerror.c
-index 71fff59..730f5e4 100644
---- a/tests/tst_strerror.c
-+++ b/tests/tst_strerror.c
-@@ -110,7 +110,7 @@ doit (void)
-   /* Iterate through all error codes. */
- 
-   {
--    size_t i;
-+    unsigned i;
-     const char *last_p = NULL;
- 
-     for (i = 0;; i++)
-@@ -126,13 +126,13 @@ doit (void)
- 	    break;
- 	  }
- 	if (debug)
--	  printf ("idna %ld: %s\n", i, p);
-+	  printf ("idna %u: %s\n", i, p);
- 	last_p = p;
-       }
-   }
- 
-   {
--    size_t i;
-+    unsigned i;
-     const char *last_p = NULL;
- 
-     for (i = 0;; i++)
-@@ -141,13 +141,13 @@ doit (void)
- 	if (p == last_p)
- 	  break;
- 	if (debug)
--	  printf ("pr29 %ld: %s\n", i, p);
-+	  printf ("pr29 %u: %s\n", i, p);
- 	last_p = p;
-       }
-   }
- 
-   {
--    size_t i;
-+    unsigned i;
-     const char *last_p = NULL;
- 
-     for (i = 0;; i++)
-@@ -156,13 +156,13 @@ doit (void)
- 	if (p == last_p)
- 	  break;
- 	if (debug)
--	  printf ("punycode %ld: %s\n", i, p);
-+	  printf ("punycode %u: %s\n", i, p);
- 	last_p = p;
-       }
-   }
- 
-   {
--    size_t i;
-+    unsigned i;
-     const char *last_p = NULL;
- 
-     for (i = 0;; i++)
-@@ -183,13 +183,13 @@ doit (void)
- 	    break;
- 	  }
- 	if (debug)
--	  printf ("stringprep %ld: %s\n", i, p);
-+	  printf ("stringprep %u: %s\n", i, p);
- 	last_p = p;
-       }
-   }
- 
-   {
--    size_t i;
-+    unsigned i;
-     const char *last_p = NULL;
- 
-     for (i = 0;; i++)
-@@ -198,7 +198,7 @@ doit (void)
- 	if (p == last_p)
- 	  break;
- 	if (debug)
--	  printf ("tld %ld: %s\n", i, p);
-+	  printf ("tld %u: %s\n", i, p);
- 	last_p = p;
-       }
-   }
-diff --git a/tests/tst_stringprep.c b/tests/tst_stringprep.c
-index 149ce6f..7c9ab06 100644
---- a/tests/tst_stringprep.c
-+++ b/tests/tst_stringprep.c
-@@ -205,7 +205,7 @@ doit (void)
- {
-   char *p;
-   int rc;
--  size_t i;
-+  unsigned i;
- 
-   if (!stringprep_check_version (STRINGPREP_VERSION))
-     fail ("stringprep_check_version failed (header %s runtime %s)\n",
-@@ -224,7 +224,7 @@ doit (void)
-   for (i = 0; i < sizeof (strprep) / sizeof (strprep[0]); i++)
-     {
-       if (debug)
--	printf ("STRINGPREP entry %ld\n", i);
-+	printf ("STRINGPREP entry %u\n", i);
- 
-       if (debug)
- 	{
-@@ -247,12 +247,12 @@ doit (void)
- 	  continue;
- 	else if (l == NULL)
- 	  {
--	    fail ("bad UTF-8 in entry %ld\n", i);
-+	    fail ("bad UTF-8 in entry %u\n", i);
- 	    continue;
- 	  }
- 	else if (strcmp (strprep[i].in, x) != 0)
- 	  {
--	    fail ("bad UTF-8 in entry %ld\n", i);
-+	    fail ("bad UTF-8 in entry %u\n", i);
- 	    if (debug)
- 	      {
- 		puts ("expected:");
-@@ -274,7 +274,7 @@ doit (void)
- 			       "Nameprep", strprep[i].flags);
-       if (rc != strprep[i].rc)
- 	{
--	  fail ("stringprep() entry %ld failed: %d\n", i, rc);
-+	  fail ("stringprep() entry %u failed: %d\n", i, rc);
- 	  if (debug)
- 	    printf ("FATAL\n");
- 	  if (rc == STRINGPREP_OK)
-@@ -302,7 +302,7 @@ doit (void)
- 	  if (strlen (strprep[i].out) != strlen (p) ||
- 	      memcmp (strprep[i].out, p, strlen (p)) != 0)
- 	    {
--	      fail ("stringprep() entry %ld failed\n", i);
-+	      fail ("stringprep() entry %ld failed\n", (long) i);
- 	      if (debug)
- 		printf ("ERROR\n");
- 	    }
-diff --git a/tests/tst_tld.c b/tests/tst_tld.c
-index 2f8e12e..d038c79 100644
---- a/tests/tst_tld.c
-+++ b/tests/tst_tld.c
-@@ -80,7 +80,7 @@ const Tld_table * my_tld_tables[] =
- void
- doit (void)
- {
--  size_t i;
-+  unsigned i;
-   const Tld_table *tldtable;
-   char *out;
-   size_t errpos;
-@@ -206,7 +206,7 @@ doit (void)
-   for (i = 0; i < sizeof (tld) / sizeof (tld[0]); i++)
-     {
-       if (debug)
--	printf ("TLD entry %ld: %s\n", i, tld[i].name);
-+	printf ("TLD entry %u: %s\n", i, tld[i].name);
- 
-       if (debug)
- 	{
-@@ -217,7 +217,7 @@ doit (void)
-       tldtable = tld_default_table (tld[i].tld, NULL);
-       if (tldtable == NULL)
- 	{
--	  fail ("TLD entry %ld tld_get_table (%s)\n", i, tld[i].tld);
-+	  fail ("TLD entry %u tld_get_table (%s)\n", i, tld[i].tld);
- 	  if (debug)
- 	    printf ("FATAL\n");
- 	  continue;
-@@ -226,7 +226,7 @@ doit (void)
-       rc = tld_check_4t (tld[i].in, tld[i].inlen, &errpos, tldtable);
-       if (rc != tld[i].rc)
- 	{
--	  fail ("TLD entry %ld failed: %d\n", i, rc);
-+	  fail ("TLD entry %u failed: %d\n", i, rc);
- 	  if (debug)
- 	    printf ("FATAL\n");
- 	  continue;
-@@ -237,7 +237,7 @@ doit (void)
- 
-       if (rc != tld[i].rc)
- 	{
--	  fail ("TLD entry %ld failed\n", i);
-+	  fail ("TLD entry %u failed\n", i);
- 	  if (debug)
- 	    printf ("ERROR\n");
- 	}
-@@ -245,12 +245,12 @@ doit (void)
- 	{
- 	  if (debug)
- 	    printf ("returned errpos %ld expected errpos %ld\n",
--		    errpos, tld[i].errpos);
-+		    (long) errpos, (long) tld[i].errpos);
- 
- 	  if (tld[i].errpos != errpos)
- 	    {
--	      fail ("TLD entry %ld failed because errpos %ld != %ld\n", i,
--		    tld[i].errpos, errpos);
-+	      fail ("TLD entry %u failed because errpos %ld != %ld\n", i,
-+		    (long) tld[i].errpos, (long) errpos);
- 	      if (debug)
- 		printf ("ERROR\n");
- 	    }
-@@ -262,12 +262,12 @@ doit (void)
- 	rc = tld_check_8z (tld[i].example, &errpos, NULL);
- 	if (rc != tld[i].rc)
- 	  {
--	    fail ("TLD entry %ld failed\n", i);
-+	    fail ("TLD entry %u failed\n", i);
- 	    if (debug)
- 	      printf ("ERROR\n");
- 	  }
- 	if (debug)
--	  printf ("TLD entry %ld tld_check_8z (%s)\n", i, tld[i].example);
-+	  printf ("TLD entry %u tld_check_8z (%s)\n", i, tld[i].example);
-       }
-     }
- }
-diff --git a/tests/utils.c b/tests/utils.c
-index 717ee01..5577dc3 100644
---- a/tests/utils.c
-+++ b/tests/utils.c
-@@ -49,7 +49,7 @@ escapeprint (const char *str, size_t len)
- {
-   size_t i;
- 
--  printf (" (length %ld bytes):\n\t", len);
-+  printf (" (length %ld bytes):\n\t", (long) len);
-   for (i = 0; i < len; i++)
-     {
-       if (((str[i] & 0xFF) >= 'A' && (str[i] & 0xFF) <= 'Z') ||
-@@ -58,7 +58,7 @@ escapeprint (const char *str, size_t len)
- 	  || (str[i] & 0xFF) == ' ' || (str[i] & 0xFF) == '.')
- 	printf ("%c", (str[i] & 0xFF));
-       else
--	printf ("\\x%02X", (str[i] & 0xFF));
-+	printf ("\\x%02X", (unsigned) (str[i] & 0xFF));
-       if ((i + 1) % 16 == 0 && (i + 1) < len)
- 	printf ("'\n\t'");
-     }
-@@ -73,7 +73,7 @@ hexprint (const char *str, size_t len)
-   printf ("\t;; ");
-   for (i = 0; i < len; i++)
-     {
--      printf ("%02x ", (str[i] & 0xFF));
-+      printf ("%02x ", (unsigned) (str[i] & 0xFF));
-       if ((i + 1) % 8 == 0)
- 	printf (" ");
-       if ((i + 1) % 16 == 0 && i + 1 < len)
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch b/meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
index 98ba4d6ff63..43bd2329448 100644
--- a/meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
+++ b/meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
@@ -1,25 +1,34 @@
-Upstream-Status: Inappropriate 
+From cdd9e2e960eeb4eda7b08f0113d0cd03524c1d45 Mon Sep 17 00:00:00 2001
+From: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: Tue, 10 Jul 2012 02:44:30 -0700
+Subject: [PATCH] libidn: fix build with automake 1.12
+
+Upstream-Status: Inappropriate
 
 automake 1.12.x has deprecated AM_PROG_MKDIR_P , and throws a warning for that,
 and the warnings are treated as errors because of the -Werror parameter.
 
-These AM_PROG_MKDIR_P are coming from gettext, and the latest gettext code has not 
+These AM_PROG_MKDIR_P are coming from gettext, and the latest gettext code has not
 eliminated these deprecated macros yet. So disable the treatment of warnings
 as errors until gettext is updated to remove the deprecated macros.
 
 Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/07/10
 
-Index: libidn-1.24/configure.ac
-===================================================================
---- libidn-1.24.orig/configure.ac
-+++ libidn-1.24/configure.ac
-@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 2002-2011 Si
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 261dad2..c4f935e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -22,7 +22,7 @@ AC_INIT([GNU Libidn], [1.34], [bug-libidn@gnu.org])
  AC_CONFIG_AUX_DIR([build-aux])
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_HEADERS(config.h)
 -AM_INIT_AUTOMAKE([1.10 -Wall -Werror -Wno-override])
 +AM_INIT_AUTOMAKE([1.10 -Wall -Wno-override])
- AM_SILENT_RULES([yes])
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
  
  # Library code modified:                              REVISION++
diff --git a/meta/recipes-extended/libidn/libidn/gcc7-compatibility.patch b/meta/recipes-extended/libidn/libidn/gcc7-compatibility.patch
deleted file mode 100644
index 546a6eaafcf..00000000000
--- a/meta/recipes-extended/libidn/libidn/gcc7-compatibility.patch
+++ /dev/null
@@ -1,334 +0,0 @@
-From 230930b3bc3e431b819eb45420cb42475d83ca93 Mon Sep 17 00:00:00 2001
-From: =?utf8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
-Date: Wed, 1 Feb 2017 10:44:36 +0100
-Subject: [PATCH] Update intprops.h for gcc-7 compatibility
-
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- gl/intprops.h          | 65 ++++++++++++++++++++++++++++++--------------------
- lib/gltests/intprops.h | 65 ++++++++++++++++++++++++++++++--------------------
- 2 files changed, 78 insertions(+), 52 deletions(-)
-
-diff --git a/gl/intprops.h b/gl/intprops.h
-index e1fce5c..eb06b69 100644
---- a/gl/intprops.h
-+++ b/gl/intprops.h
-@@ -1,18 +1,18 @@
- /* intprops.h -- properties of integer types
- 
--   Copyright (C) 2001-2016 Free Software Foundation, Inc.
-+   Copyright (C) 2001-2017 Free Software Foundation, Inc.
- 
-    This program is free software: you can redistribute it and/or modify it
--   under the terms of the GNU General Public License as published
--   by the Free Software Foundation; either version 3 of the License, or
-+   under the terms of the GNU Lesser General Public License as published
-+   by the Free Software Foundation; either version 2.1 of the License, or
-    (at your option) any later version.
- 
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--   GNU General Public License for more details.
-+   GNU Lesser General Public License for more details.
- 
--   You should have received a copy of the GNU General Public License
-+   You should have received a copy of the GNU Lesser General Public License
-    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- 
- /* Written by Paul Eggert.  */
-@@ -47,12 +47,16 @@
- 
- /* Minimum and maximum values for integer types and expressions.  */
- 
-+/* The width in bits of the integer type or expression T.
-+   Padding bits are not supported; this is checked at compile-time below.  */
-+#define TYPE_WIDTH(t) (sizeof (t) * CHAR_BIT)
-+
- /* The maximum and minimum values for the integer type T.  */
- #define TYPE_MINIMUM(t) ((t) ~ TYPE_MAXIMUM (t))
- #define TYPE_MAXIMUM(t)                                                 \
-   ((t) (! TYPE_SIGNED (t)                                               \
-         ? (t) -1                                                        \
--        : ((((t) 1 << (sizeof (t) * CHAR_BIT - 2)) - 1) * 2 + 1)))
-+        : ((((t) 1 << (TYPE_WIDTH (t) - 2)) - 1) * 2 + 1)))
- 
- /* The maximum and minimum values for the type of the expression E,
-    after integer promotion.  E should not have side effects.  */
-@@ -65,7 +69,13 @@
-    ? _GL_SIGNED_INT_MAXIMUM (e)                                         \
-    : _GL_INT_NEGATE_CONVERT (e, 1))
- #define _GL_SIGNED_INT_MAXIMUM(e)                                       \
--  (((_GL_INT_CONVERT (e, 1) << (sizeof ((e) + 0) * CHAR_BIT - 2)) - 1) * 2 + 1)
-+  (((_GL_INT_CONVERT (e, 1) << (TYPE_WIDTH ((e) + 0) - 2)) - 1) * 2 + 1)
-+
-+/* Work around OpenVMS incompatibility with C99.  */
-+#if !defined LLONG_MAX && defined __INT64_MAX
-+# define LLONG_MAX __INT64_MAX
-+# define LLONG_MIN __INT64_MIN
-+#endif
- 
- /* This include file assumes that signed types are two's complement without
-    padding bits; the above macros have undefined behavior otherwise.
-@@ -84,10 +94,15 @@ verify (TYPE_MAXIMUM (long int) == LONG_MAX);
- verify (TYPE_MINIMUM (long long int) == LLONG_MIN);
- verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
- #endif
-+/* Similarly, sanity-check one ISO/IEC TS 18661-1:2014 macro if defined.  */
-+#ifdef UINT_WIDTH
-+verify (TYPE_WIDTH (unsigned int) == UINT_WIDTH);
-+#endif
- 
- /* Does the __typeof__ keyword work?  This could be done by
-    'configure', but for now it's easier to do it by hand.  */
--#if (2 <= __GNUC__ || defined __IBM__TYPEOF__ \
-+#if (2 <= __GNUC__ \
-+     || (1210 <= __IBMC__ && defined __IBM__TYPEOF__) \
-      || (0x5110 <= __SUNPRO_C && !__STDC__))
- # define _GL_HAVE___TYPEOF__ 1
- #else
-@@ -116,8 +131,7 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
-    signed, this macro may overestimate the true bound by one byte when
-    applied to unsigned types of size 2, 4, 16, ... bytes.  */
- #define INT_STRLEN_BOUND(t)                                     \
--  (INT_BITS_STRLEN_BOUND (sizeof (t) * CHAR_BIT                 \
--                          - _GL_SIGNED_TYPE_OR_EXPR (t))        \
-+  (INT_BITS_STRLEN_BOUND (TYPE_WIDTH (t) - _GL_SIGNED_TYPE_OR_EXPR (t)) \
-    + _GL_SIGNED_TYPE_OR_EXPR (t))
- 
- /* Bound on buffer size needed to represent an integer type or expression T,
-@@ -222,20 +236,23 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
-    ? (a) < (min) >> (b)                                 \
-    : (max) >> (b) < (a))
- 
--/* True if __builtin_add_overflow (A, B, P) works when P is null.  */
--#define _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL (7 <= __GNUC__)
-+/* True if __builtin_add_overflow (A, B, P) works when P is non-null.  */
-+#define _GL_HAS_BUILTIN_OVERFLOW (5 <= __GNUC__)
-+
-+/* True if __builtin_add_overflow_p (A, B, C) works.  */
-+#define _GL_HAS_BUILTIN_OVERFLOW_P (7 <= __GNUC__)
- 
- /* The _GL*_OVERFLOW macros have the same restrictions as the
-    *_RANGE_OVERFLOW macros, except that they do not assume that operands
-    (e.g., A and B) have the same type as MIN and MAX.  Instead, they assume
-    that the result (e.g., A + B) has that type.  */
--#if _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL
--# define _GL_ADD_OVERFLOW(a, b, min, max)
--   __builtin_add_overflow (a, b, (__typeof__ ((a) + (b)) *) 0)
--# define _GL_SUBTRACT_OVERFLOW(a, b, min, max)
--   __builtin_sub_overflow (a, b, (__typeof__ ((a) - (b)) *) 0)
--# define _GL_MULTIPLY_OVERFLOW(a, b, min, max)
--   __builtin_mul_overflow (a, b, (__typeof__ ((a) * (b)) *) 0)
-+#if _GL_HAS_BUILTIN_OVERFLOW_P
-+# define _GL_ADD_OVERFLOW(a, b, min, max)                               \
-+   __builtin_add_overflow_p (a, b, (__typeof__ ((a) + (b))) 0)
-+# define _GL_SUBTRACT_OVERFLOW(a, b, min, max)                          \
-+   __builtin_sub_overflow_p (a, b, (__typeof__ ((a) - (b))) 0)
-+# define _GL_MULTIPLY_OVERFLOW(a, b, min, max)                          \
-+   __builtin_mul_overflow_p (a, b, (__typeof__ ((a) * (b))) 0)
- #else
- # define _GL_ADD_OVERFLOW(a, b, min, max)                                \
-    ((min) < 0 ? INT_ADD_RANGE_OVERFLOW (a, b, min, max)                  \
-@@ -315,7 +332,7 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
-   _GL_BINARY_OP_OVERFLOW (a, b, _GL_ADD_OVERFLOW)
- #define INT_SUBTRACT_OVERFLOW(a, b) \
-   _GL_BINARY_OP_OVERFLOW (a, b, _GL_SUBTRACT_OVERFLOW)
--#if _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL
-+#if _GL_HAS_BUILTIN_OVERFLOW_P
- # define INT_NEGATE_OVERFLOW(a) INT_SUBTRACT_OVERFLOW (0, a)
- #else
- # define INT_NEGATE_OVERFLOW(a) \
-@@ -349,10 +366,6 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
- #define INT_MULTIPLY_WRAPV(a, b, r) \
-   _GL_INT_OP_WRAPV (a, b, r, *, __builtin_mul_overflow, INT_MULTIPLY_OVERFLOW)
- 
--#ifndef __has_builtin
--# define __has_builtin(x) 0
--#endif
--
- /* Nonzero if this compiler has GCC bug 68193 or Clang bug 25390.  See:
-    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68193
-    https://llvm.org/bugs/show_bug.cgi?id=25390
-@@ -369,7 +382,7 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
-    the operation.  BUILTIN is the builtin operation, and OVERFLOW the
-    overflow predicate.  Return 1 if the result overflows.  See above
-    for restrictions.  */
--#if 5 <= __GNUC__ || __has_builtin (__builtin_add_overflow)
-+#if _GL_HAS_BUILTIN_OVERFLOW
- # define _GL_INT_OP_WRAPV(a, b, r, op, builtin, overflow) builtin (a, b, r)
- #elif 201112 <= __STDC_VERSION__ && !_GL__GENERIC_BOGUS
- # define _GL_INT_OP_WRAPV(a, b, r, op, builtin, overflow) \
-@@ -412,7 +425,7 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
- # else
- #  define _GL_INT_OP_WRAPV_LONGISH(a, b, r, op, overflow) \
-     _GL_INT_OP_CALC (a, b, r, op, overflow, unsigned long int, \
--                     long int, LONG_MIN, LONG_MAX))
-+                     long int, LONG_MIN, LONG_MAX)
- # endif
- #endif
- 
-diff --git a/lib/gltests/intprops.h b/lib/gltests/intprops.h
-index e1fce5c..eb06b69 100644
---- a/lib/gltests/intprops.h
-+++ b/lib/gltests/intprops.h
-@@ -1,18 +1,18 @@
- /* intprops.h -- properties of integer types
- 
--   Copyright (C) 2001-2016 Free Software Foundation, Inc.
-+   Copyright (C) 2001-2017 Free Software Foundation, Inc.
- 
-    This program is free software: you can redistribute it and/or modify it
--   under the terms of the GNU General Public License as published
--   by the Free Software Foundation; either version 3 of the License, or
-+   under the terms of the GNU Lesser General Public License as published
-+   by the Free Software Foundation; either version 2.1 of the License, or
-    (at your option) any later version.
- 
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--   GNU General Public License for more details.
-+   GNU Lesser General Public License for more details.
- 
--   You should have received a copy of the GNU General Public License
-+   You should have received a copy of the GNU Lesser General Public License
-    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- 
- /* Written by Paul Eggert.  */
-@@ -47,12 +47,16 @@
- 
- /* Minimum and maximum values for integer types and expressions.  */
- 
-+/* The width in bits of the integer type or expression T.
-+   Padding bits are not supported; this is checked at compile-time below.  */
-+#define TYPE_WIDTH(t) (sizeof (t) * CHAR_BIT)
-+
- /* The maximum and minimum values for the integer type T.  */
- #define TYPE_MINIMUM(t) ((t) ~ TYPE_MAXIMUM (t))
- #define TYPE_MAXIMUM(t)                                                 \
-   ((t) (! TYPE_SIGNED (t)                                               \
-         ? (t) -1                                                        \
--        : ((((t) 1 << (sizeof (t) * CHAR_BIT - 2)) - 1) * 2 + 1)))
-+        : ((((t) 1 << (TYPE_WIDTH (t) - 2)) - 1) * 2 + 1)))
- 
- /* The maximum and minimum values for the type of the expression E,
-    after integer promotion.  E should not have side effects.  */
-@@ -65,7 +69,13 @@
-    ? _GL_SIGNED_INT_MAXIMUM (e)                                         \
-    : _GL_INT_NEGATE_CONVERT (e, 1))
- #define _GL_SIGNED_INT_MAXIMUM(e)                                       \
--  (((_GL_INT_CONVERT (e, 1) << (sizeof ((e) + 0) * CHAR_BIT - 2)) - 1) * 2 + 1)
-+  (((_GL_INT_CONVERT (e, 1) << (TYPE_WIDTH ((e) + 0) - 2)) - 1) * 2 + 1)
-+
-+/* Work around OpenVMS incompatibility with C99.  */
-+#if !defined LLONG_MAX && defined __INT64_MAX
-+# define LLONG_MAX __INT64_MAX
-+# define LLONG_MIN __INT64_MIN
-+#endif
- 
- /* This include file assumes that signed types are two's complement without
-    padding bits; the above macros have undefined behavior otherwise.
-@@ -84,10 +94,15 @@ verify (TYPE_MAXIMUM (long int) == LONG_MAX);
- verify (TYPE_MINIMUM (long long int) == LLONG_MIN);
- verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
- #endif
-+/* Similarly, sanity-check one ISO/IEC TS 18661-1:2014 macro if defined.  */
-+#ifdef UINT_WIDTH
-+verify (TYPE_WIDTH (unsigned int) == UINT_WIDTH);
-+#endif
- 
- /* Does the __typeof__ keyword work?  This could be done by
-    'configure', but for now it's easier to do it by hand.  */
--#if (2 <= __GNUC__ || defined __IBM__TYPEOF__ \
-+#if (2 <= __GNUC__ \
-+     || (1210 <= __IBMC__ && defined __IBM__TYPEOF__) \
-      || (0x5110 <= __SUNPRO_C && !__STDC__))
- # define _GL_HAVE___TYPEOF__ 1
- #else
-@@ -116,8 +131,7 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
-    signed, this macro may overestimate the true bound by one byte when
-    applied to unsigned types of size 2, 4, 16, ... bytes.  */
- #define INT_STRLEN_BOUND(t)                                     \
--  (INT_BITS_STRLEN_BOUND (sizeof (t) * CHAR_BIT                 \
--                          - _GL_SIGNED_TYPE_OR_EXPR (t))        \
-+  (INT_BITS_STRLEN_BOUND (TYPE_WIDTH (t) - _GL_SIGNED_TYPE_OR_EXPR (t)) \
-    + _GL_SIGNED_TYPE_OR_EXPR (t))
- 
- /* Bound on buffer size needed to represent an integer type or expression T,
-@@ -222,20 +236,23 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
-    ? (a) < (min) >> (b)                                 \
-    : (max) >> (b) < (a))
- 
--/* True if __builtin_add_overflow (A, B, P) works when P is null.  */
--#define _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL (7 <= __GNUC__)
-+/* True if __builtin_add_overflow (A, B, P) works when P is non-null.  */
-+#define _GL_HAS_BUILTIN_OVERFLOW (5 <= __GNUC__)
-+
-+/* True if __builtin_add_overflow_p (A, B, C) works.  */
-+#define _GL_HAS_BUILTIN_OVERFLOW_P (7 <= __GNUC__)
- 
- /* The _GL*_OVERFLOW macros have the same restrictions as the
-    *_RANGE_OVERFLOW macros, except that they do not assume that operands
-    (e.g., A and B) have the same type as MIN and MAX.  Instead, they assume
-    that the result (e.g., A + B) has that type.  */
--#if _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL
--# define _GL_ADD_OVERFLOW(a, b, min, max)
--   __builtin_add_overflow (a, b, (__typeof__ ((a) + (b)) *) 0)
--# define _GL_SUBTRACT_OVERFLOW(a, b, min, max)
--   __builtin_sub_overflow (a, b, (__typeof__ ((a) - (b)) *) 0)
--# define _GL_MULTIPLY_OVERFLOW(a, b, min, max)
--   __builtin_mul_overflow (a, b, (__typeof__ ((a) * (b)) *) 0)
-+#if _GL_HAS_BUILTIN_OVERFLOW_P
-+# define _GL_ADD_OVERFLOW(a, b, min, max)                               \
-+   __builtin_add_overflow_p (a, b, (__typeof__ ((a) + (b))) 0)
-+# define _GL_SUBTRACT_OVERFLOW(a, b, min, max)                          \
-+   __builtin_sub_overflow_p (a, b, (__typeof__ ((a) - (b))) 0)
-+# define _GL_MULTIPLY_OVERFLOW(a, b, min, max)                          \
-+   __builtin_mul_overflow_p (a, b, (__typeof__ ((a) * (b))) 0)
- #else
- # define _GL_ADD_OVERFLOW(a, b, min, max)                                \
-    ((min) < 0 ? INT_ADD_RANGE_OVERFLOW (a, b, min, max)                  \
-@@ -315,7 +332,7 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
-   _GL_BINARY_OP_OVERFLOW (a, b, _GL_ADD_OVERFLOW)
- #define INT_SUBTRACT_OVERFLOW(a, b) \
-   _GL_BINARY_OP_OVERFLOW (a, b, _GL_SUBTRACT_OVERFLOW)
--#if _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL
-+#if _GL_HAS_BUILTIN_OVERFLOW_P
- # define INT_NEGATE_OVERFLOW(a) INT_SUBTRACT_OVERFLOW (0, a)
- #else
- # define INT_NEGATE_OVERFLOW(a) \
-@@ -349,10 +366,6 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
- #define INT_MULTIPLY_WRAPV(a, b, r) \
-   _GL_INT_OP_WRAPV (a, b, r, *, __builtin_mul_overflow, INT_MULTIPLY_OVERFLOW)
- 
--#ifndef __has_builtin
--# define __has_builtin(x) 0
--#endif
--
- /* Nonzero if this compiler has GCC bug 68193 or Clang bug 25390.  See:
-    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68193
-    https://llvm.org/bugs/show_bug.cgi?id=25390
-@@ -369,7 +382,7 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
-    the operation.  BUILTIN is the builtin operation, and OVERFLOW the
-    overflow predicate.  Return 1 if the result overflows.  See above
-    for restrictions.  */
--#if 5 <= __GNUC__ || __has_builtin (__builtin_add_overflow)
-+#if _GL_HAS_BUILTIN_OVERFLOW
- # define _GL_INT_OP_WRAPV(a, b, r, op, builtin, overflow) builtin (a, b, r)
- #elif 201112 <= __STDC_VERSION__ && !_GL__GENERIC_BOGUS
- # define _GL_INT_OP_WRAPV(a, b, r, op, builtin, overflow) \
-@@ -412,7 +425,7 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
- # else
- #  define _GL_INT_OP_WRAPV_LONGISH(a, b, r, op, overflow) \
-     _GL_INT_OP_CALC (a, b, r, op, overflow, unsigned long int, \
--                     long int, LONG_MIN, LONG_MAX))
-+                     long int, LONG_MIN, LONG_MAX)
- # endif
- #endif
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch b/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
index db91317ca5b..5d03810d006 100644
--- a/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
+++ b/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
@@ -1,3 +1,8 @@
+From c34c7aba769bff3e483f89145055b9b8733435f3 Mon Sep 17 00:00:00 2001
+From: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: Wed, 2 May 2012 18:05:19 -0700
+Subject: [PATCH] libtasn1: fix build with automake 1.12
+
 Upstream-Status: Pending
 
 This patch fixes following issue with automake 1.12
@@ -9,12 +14,16 @@ This patch fixes following issue with automake 1.12
 Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/05/03
 
-Index: libidn-1.33/configure.ac
-===================================================================
---- libidn-1.33.orig/configure.ac
-+++ libidn-1.33/configure.ac
+---
+ configure.ac | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index f8049a4..261dad2 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -33,6 +33,10 @@ AC_SUBST(LT_CURRENT, 17)
- AC_SUBST(LT_REVISION, 16)
+ AC_SUBST(LT_REVISION, 18)
  AC_SUBST(LT_AGE, 6)
  
 +# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
diff --git a/meta/recipes-extended/libidn/libidn_1.33.bb b/meta/recipes-extended/libidn/libidn_1.34.bb
similarity index 86%
rename from meta/recipes-extended/libidn/libidn_1.33.bb
rename to meta/recipes-extended/libidn/libidn_1.34.bb
index 9e8bdbae188..424c6c9f981 100644
--- a/meta/recipes-extended/libidn/libidn_1.33.bb
+++ b/meta/recipes-extended/libidn/libidn_1.34.bb
@@ -18,13 +18,11 @@ SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://libidn_fix_for_automake-1.12.patch \
            file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch \
            file://dont-depend-on-help2man.patch \
-           file://0001-idn-fix-printf-format-security-warnings.patch \
-           file://gcc7-compatibility.patch \
            file://0001-idn-format-security-warnings.patch \
-"
+           "
 
-SRC_URI[md5sum] = "a9aa7e003665de9c82bd3f9fc6ccf308"
-SRC_URI[sha256sum] = "44a7aab635bb721ceef6beecc4d49dfd19478325e1b47f3196f7d2acc4930e19"
+SRC_URI[md5sum] = "a829db6cd0b85733017c20a50bf10798"
+SRC_URI[sha256sum] = "3719e2975f2fb28605df3479c380af2cf4ab4e919e1506527e4c7670afff6e3c"
 
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+ or LGPLv3
 # so package command into a separate package
-- 
2.16.1


