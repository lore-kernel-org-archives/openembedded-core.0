Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E147CA9EBD
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 18:46:59 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2788.1791571609913471659
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 11:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=VBSTIvIL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20261009184647bd0f3ab4d0000207f7-uapzmk@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261009184647bd0f3ab4d0000207f7
        for <openembedded-core@lists.openembedded.org>;
        Fri, 09 Oct 2026 20:46:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=XatiTZiI8ml7BWzjsxziycsdZpxQ5XleG8EaNG48osQ=;
 b=VBSTIvILRR2cYNCP258xBC2DeHlDDqCTblmxPYwYj8kg/gEv5CrR8mysH+2DIQGC20azBP
 wwLxUGbIP4qkTDroGbTgYXAVk88CDbMvL9w96+KjoyGI0FR7t0c/ArWmBYCmdgGadEDum/DX
 FED3EFNjFjkJsvaY4T1PMokrCMHB77Vcpl+49GbHhn6YIXeeqL7G7XqVX4zUBnV60g4uZ5RM
 Tds+AydUULq2x9YdVlBeuBrtPs8qfjzfPEaqRaUE+WeoXdG28ss8kBOXZDvk5jgqHfMcyC2T
 sYfQAfy0n/62foPoBxN8JFoVYWF+L5TKEjYp9f19z8KcUvLmFcfBjdOg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 2/8] libpcre2: patch CVE-2026-89161
Date: Fri,  9 Oct 2026 20:45:42 +0200
Message-ID: <20261009184548.2962197-2-peter.marko@siemens.com>
In-Reply-To: <20261009184548.2962197-1-peter.marko@siemens.com>
References: <20261009184548.2962197-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 18:46:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247477

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-89161

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpcre/libpcre2/CVE-2026-89161.patch     | 221 ++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb |   1 +
 2 files changed, 222 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2026-89161.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2026-89161.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2026-89161.patch
new file mode 100644
index 0000000000..42e69acbcc
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2026-89161.patch
@@ -0,0 +1,221 @@
+From 1dcd0cf42a6a7cb62cc9a7c024196733abcfda95 Mon Sep 17 00:00:00 2001
+From: Nicholas Wilson <nicholas@nicholaswilson.me.uk>
+Date: Sat, 8 Aug 2026 19:17:36 +0100
+Subject: [PATCH] Fix leak & stale PCRE2_MD_COPIED_SUBJECT if pcre2_jit_match
+ used with existing match context (#937)
+
+The problem is not that pcre2_jit_match() needs to add support for PCRE2_COPY_MATCHED_SUBJECT. Instead, if the passed-in context somehow contains a previously-copied subject (by non-JIT matcher using a global or cached subject) then it will be leaked, and worse, incorrectly free'd later.
+
+CVE: CVE-2026-89161
+Upstream-Status: Backport [https://github.com/PCRE2Project/pcre2/commit/1dcd0cf42a6a7cb62cc9a7c024196733abcfda95]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ doc/html/pcre2jit.html    |  9 +++---
+ doc/pcre2.txt             | 10 +++----
+ doc/pcre2jit.3            |  9 +++---
+ src/pcre2_jit_match_inc.h | 10 +++++++
+ src/pcre2test_inc.h       | 60 ++++++++++++++++++++++++++++++++-------
+ testdata/testinput17      |  1 +
+ testdata/testoutput17     |  2 ++
+ 7 files changed, 77 insertions(+), 24 deletions(-)
+
+diff --git a/doc/html/pcre2jit.html b/doc/html/pcre2jit.html
+index cc26cc06..4e6d31e5 100644
+--- a/doc/html/pcre2jit.html
++++ b/doc/html/pcre2jit.html
+@@ -460,10 +460,11 @@ processed by <b>pcre2_jit_compile()</b>).
+ The fast path function is called <b>pcre2_jit_match()</b>, and it takes exactly
+ the same arguments as <b>pcre2_match()</b>. However, the subject string must be
+ specified with a length; PCRE2_ZERO_TERMINATED is not supported. Unsupported
+-option bits (for example, PCRE2_ANCHORED and PCRE2_ENDANCHORED) are ignored, as
+-is the PCRE2_NO_JIT option. The return values are also the same as for
+-<b>pcre2_match()</b>, plus PCRE2_ERROR_JIT_BADOPTION if a matching mode (partial
+-or complete) is requested that was not compiled.
++option bits (for example, PCRE2_ANCHORED, PCRE2_ENDANCHORED, and
++PCRE2_COPY_MATCHED_SUBJECT) are ignored, as is the PCRE2_NO_JIT option. The
++return values are also the same as for <b>pcre2_match()</b>, plus
++PCRE2_ERROR_JIT_BADOPTION if a matching mode (partial or complete) is requested
++that was not compiled.
+ </p>
+ <p>
+ When you call <b>pcre2_match()</b>, as well as testing for invalid options, a
+diff --git a/doc/pcre2.txt b/doc/pcre2.txt
+index 693908ee..cc316178 100644
+--- a/doc/pcre2.txt
++++ b/doc/pcre2.txt
+@@ -6176,11 +6176,11 @@ JIT FAST PATH API
+        The  fast  path  function is called pcre2_jit_match(), and it takes ex-
+        actly the same arguments as pcre2_match(). However, the subject  string
+        must  be  specified  with  a  length; PCRE2_ZERO_TERMINATED is not sup-
+-       ported.  Unsupported  option  bits  (for  example,  PCRE2_ANCHORED  and
+-       PCRE2_ENDANCHORED)  are ignored, as is the PCRE2_NO_JIT option. The re-
+-       turn values are also the same  as  for  pcre2_match(),  plus  PCRE2_ER-
+-       ROR_JIT_BADOPTION if a matching mode (partial or complete) is requested
+-       that was not compiled.
++       ported. Unsupported option bits (for example, PCRE2_ANCHORED, PCRE2_EN-
++       DANCHORED, and  PCRE2_COPY_MATCHED_SUBJECT)  are  ignored,  as  is  the
++       PCRE2_NO_JIT  option.  The  return  values  are  also  the  same as for
++       pcre2_match(), plus PCRE2_ERROR_JIT_BADOPTION if a matching mode  (par-
++       tial or complete) is requested that was not compiled.
+ 
+        When  you call pcre2_match(), as well as testing for invalid options, a
+        number of other sanity checks are performed on the arguments. For exam-
+diff --git a/doc/pcre2jit.3 b/doc/pcre2jit.3
+index 95451b56..729d898f 100644
+--- a/doc/pcre2jit.3
++++ b/doc/pcre2jit.3
+@@ -444,10 +444,11 @@ processed by \fBpcre2_jit_compile()\fP).
+ The fast path function is called \fBpcre2_jit_match()\fP, and it takes exactly
+ the same arguments as \fBpcre2_match()\fP. However, the subject string must be
+ specified with a length; PCRE2_ZERO_TERMINATED is not supported. Unsupported
+-option bits (for example, PCRE2_ANCHORED and PCRE2_ENDANCHORED) are ignored, as
+-is the PCRE2_NO_JIT option. The return values are also the same as for
+-\fBpcre2_match()\fP, plus PCRE2_ERROR_JIT_BADOPTION if a matching mode (partial
+-or complete) is requested that was not compiled.
++option bits (for example, PCRE2_ANCHORED, PCRE2_ENDANCHORED, and
++PCRE2_COPY_MATCHED_SUBJECT) are ignored, as is the PCRE2_NO_JIT option. The
++return values are also the same as for \fBpcre2_match()\fP, plus
++PCRE2_ERROR_JIT_BADOPTION if a matching mode (partial or complete) is requested
++that was not compiled.
+ .P
+ When you call \fBpcre2_match()\fP, as well as testing for invalid options, a
+ number of other sanity checks are performed on the arguments. For example, if
+diff --git a/src/pcre2_jit_match_inc.h b/src/pcre2_jit_match_inc.h
+index 32d4c8a5..4163cf61 100644
+--- a/src/pcre2_jit_match_inc.h
++++ b/src/pcre2_jit_match_inc.h
+@@ -125,6 +125,16 @@ else if ((options & PCRE2_PARTIAL_SOFT) != 0)
+ if (functions == NULL || functions->executable_funcs[index] == NULL)
+   return match_data->rc = PCRE2_ERROR_JIT_BADOPTION;
+ 
++/* If the match data block was previously used with PCRE2_COPY_MATCHED_SUBJECT,
++free the memory that was obtained. */
++
++if ((match_data->flags & PCRE2_MD_COPIED_SUBJECT) != 0)
++  {
++  match_data->memctl.free((void *)match_data->subject,
++    match_data->memctl.memory_data);
++  match_data->flags &= ~PCRE2_MD_COPIED_SUBJECT;
++  }
++
+ /* Sanity checks should be handled by pcre2_match. */
+ arguments.str = subject + start_offset;
+ arguments.begin = subject;
+diff --git a/src/pcre2test_inc.h b/src/pcre2test_inc.h
+index 5d282435..a74e3368 100644
+--- a/src/pcre2test_inc.h
++++ b/src/pcre2test_inc.h
+@@ -5171,20 +5171,28 @@ for (gmatched = 0;; gmatched++)
+     /* If PCRE2_COPY_MATCHED_SUBJECT was set, check that things are as they
+     should be, but not for fast JIT, where it isn't supported. */
+ 
+-    if ((dat_datctl.options & PCRE2_COPY_MATCHED_SUBJECT) != 0 &&
+-        (pat_patctl.control & CTL_JITFAST) == 0)
++    if ((dat_datctl.options & PCRE2_COPY_MATCHED_SUBJECT) != 0)
+       {
+-      if ((match_data->flags & PCRE2_MD_COPIED_SUBJECT) == 0)
+-        cfprintf(clr_test_error, outfile,
+-          "** PCRE2 error: flag not set after copy_matched_subject\n");
++      if ((pat_patctl.control & CTL_JITFAST) != 0)
++        {
++        if ((match_data->flags & PCRE2_MD_COPIED_SUBJECT) != 0)
++          cfprintf(clr_test_error, outfile,
++            "** PCRE2 error: flag set after unsupported copy_matched_subject\n");
++        }
++      else
++        {
++        if ((match_data->flags & PCRE2_MD_COPIED_SUBJECT) == 0)
++          cfprintf(clr_test_error, outfile,
++            "** PCRE2 error: flag not set after copy_matched_subject\n");
+ 
+-      if (match_data->subject == pp)
+-        cfprintf(clr_test_error, outfile,
+-          "** PCRE2 error: copy_matched_subject has not copied\n");
++        if (match_data->subject == pp)
++          cfprintf(clr_test_error, outfile,
++            "** PCRE2 error: copy_matched_subject has not copied\n");
+ 
+-      if (memcmp(match_data->subject, pp, ulen) != 0)
+-        cfprintf(clr_test_error, outfile,
+-          "** PCRE2 error: copy_matched_subject mismatch\n");
++        if (memcmp(match_data->subject, pp, ulen) != 0)
++          cfprintf(clr_test_error, outfile,
++            "** PCRE2 error: copy_matched_subject mismatch\n");
++        }
+       }
+ 
+     /* If this is not the first time round a global loop, check that the
+@@ -5661,6 +5669,9 @@ pcre2_match_context *test_dat_context = NULL, *test_dat_context_copy = NULL;
+ pcre2_convert_context *test_con_context = NULL, *test_con_context_copy = NULL;
+ pcre2_match_data *test_match_data = NULL;
+ pcre2_code *test_compiled_code = NULL;
++#ifdef SUPPORT_JIT
++BOOL test_compiled_with_jit = FALSE;
++#endif
+ PCRE2_UCHAR pattern[] = { CHAR_A, CHAR_B, CHAR_C, 0 };
+ PCRE2_UCHAR callout_int_pattern[] = {
+   CHAR_LEFT_PARENTHESIS, CHAR_QUESTION_MARK, CHAR_C, CHAR_RIGHT_PARENTHESIS, 0 };
+@@ -5965,11 +5976,38 @@ ASSERT(rc == 0 && sizeval == 0, "pcre2_pattern_info(JIT)");
+ 
+ if (pcre2_jit_compile(test_compiled_code, PCRE2_JIT_COMPLETE) == 0)
+   {
++  test_compiled_with_jit = TRUE;
++
+   rc = pcre2_pattern_info(test_compiled_code, PCRE2_INFO_JITSIZE, &sizeval);
+   ASSERT(rc == 0 && sizeval > 0, "pcre2_pattern_info(JIT after compile)");
+   }
+ #endif
+ 
++/* ----------------------- Matching functions ------------------------------ */
++
++#ifdef SUPPORT_JIT
++
++/* Check that fast JIT releases a copied subject when reusing match data. */
++if (test_compiled_with_jit)
++  {
++  test_match_data = pcre2_match_data_create_from_pattern(test_compiled_code,
++    test_gen_context);
++  ASSERT(test_match_data != NULL, "pcre2_match_data_create_from_pattern(JIT)");
++
++  rc = pcre2_match(test_compiled_code, pattern, 3, 0,
++    PCRE2_COPY_MATCHED_SUBJECT, test_match_data, NULL);
++  ASSERT(rc == 1, "pcre2_match(COPY_MATCHED_SUBJECT)");
++
++  rc = pcre2_jit_match(test_compiled_code, subject_abcz, 4, 0, 0,
++    test_match_data, NULL);
++  ASSERT(rc == 1, "pcre2_jit_match(reused match data)");
++
++  pcre2_match_data_free(test_match_data);
++  test_match_data = NULL;
++  }
++
++#endif
++
+ /* ----------------------- POSIX functions --------------------------------- */
+ 
+ #if PCRE2_CODE_UNIT_WIDTH == 8
+diff --git a/testdata/testinput17 b/testdata/testinput17
+index 08fd72e0..9d728965 100644
+--- a/testdata/testinput17
++++ b/testdata/testinput17
+@@ -298,6 +298,7 @@
+     
+ /abc/jitfast
+     abc
++    abc\=copy_matched_subject
+     abc\=no_jit 
+     
+ # ---- 
+diff --git a/testdata/testoutput17 b/testdata/testoutput17
+index 6d550084..773ec18a 100644
+--- a/testdata/testoutput17
++++ b/testdata/testoutput17
+@@ -542,6 +542,8 @@ Failed: error -47: match limit exceeded
+     
+ /abc/jitfast
+     abc
++ 0: abc (JIT)
++    abc\=copy_matched_subject
+  0: abc (JIT)
+     abc\=no_jit 
+  0: abc (JIT)
diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index b81480c8ff..fa59747fdc 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6720bf3bcff57543b915c2b22e526df0 \
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://run-ptest \
            file://CVE-2026-89162.patch \
+           file://CVE-2026-89161.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"

