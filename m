Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396BECA9EBD
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 18:47:09 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2863.1791571619354572589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 11:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=IDhIpmq9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20261009184657d6386262c100020756-lg1jrh@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261009184657d6386262c100020756
        for <openembedded-core@lists.openembedded.org>;
        Fri, 09 Oct 2026 20:46:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ep5IZZ85TRJU7LFG18vU8PpRn6CijYgulW/vGAZoS1g=;
 b=IDhIpmq9MTPJTFDnsuNUvOYJwfAPVcCvNCzCW1OkMhIQzoCydOPY5S5i711kd0f55agoqF
 g3z2ayYfgLdXh8pqtD0x3dFin9U4g9i6ztdPXPKhdLOFgOn/DmKqU/FoIgP34Oi6cqNFYmZt
 29Pyc7GAL4Z9aispmsOPygB88KW6rL0prJi2bv0XMpfzVTI3JScNZYGOd6qL8/nOdNMMtOwA
 bRheqNFoIoEWHQSBWW5LeucjRhc/nNak/B7wYgSjeioHXotg6e02MLDB0OM1VVqd8O2sydXL
 O+KU8/U5pNF3FZI/3GMO9u9N3UZusCGr5I9lUNIeXpCP/jCyJMWa6f8A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 3/8] libpcre2: patch CVE-2026-89156
Date: Fri,  9 Oct 2026 20:45:43 +0200
Message-ID: <20261009184548.2962197-3-peter.marko@siemens.com>
In-Reply-To: <20261009184548.2962197-1-peter.marko@siemens.com>
References: <20261009184548.2962197-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 18:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247478

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] and [2].

[1] https://security-tracker.debian.org/tracker/CVE-2026-89156
[2] https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-2p8c-ff85-vh9x

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpcre/libpcre2/CVE-2026-89156.patch     | 275 ++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb |   1 +
 2 files changed, 276 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2026-89156.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2026-89156.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2026-89156.patch
new file mode 100644
index 0000000000..7937a6a4c5
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2026-89156.patch
@@ -0,0 +1,275 @@
+From f67db227af31bba7cdf2a7a00b97af91b588c2f5 Mon Sep 17 00:00:00 2001
+From: Zoltan Herczeg <zherczeg7@gmail.com>
+Date: Sun, 9 Aug 2026 11:05:54 +0200
+Subject: [PATCH] Fix pcre2_match to check for JIT support before JIT
+ validation & execution (#926)
+
+This fixes the issue that the JIT branch's UTF validation is not pinned to be identical to the interpreter's validation.
+
+This was not robust, and lead to a bug, in the case where the JIT UTF validation is done, but because the relevant JIT mode was not compiled, it falls through to the interpreter and skips the interpreter's own UTF validation and setup.
+
+CVE: CVE-2026-89156
+Upstream-Status: Backport [https://github.com/PCRE2Project/pcre2/commit/f67db227af31bba7cdf2a7a00b97af91b588c2f5]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/pcre2_internal.h      |  2 +
+ src/pcre2_jit_match_inc.h |  1 +
+ src/pcre2_jit_misc_inc.h  | 38 +++++++++++++---
+ src/pcre2_match.c         | 95 +++++++++++++++------------------------
+ 4 files changed, 71 insertions(+), 65 deletions(-)
+
+diff --git a/src/pcre2_internal.h b/src/pcre2_internal.h
+index 2e8c7e47..930c745b 100644
+--- a/src/pcre2_internal.h
++++ b/src/pcre2_internal.h
+@@ -2296,6 +2296,7 @@ is available. */
+ #define _pcre2_is_newline            PCRE2_SUFFIX(_pcre2_is_newline_)
+ #define _pcre2_jit_free_rodata       PCRE2_SUFFIX(_pcre2_jit_free_rodata_)
+ #define _pcre2_jit_free              PCRE2_SUFFIX(_pcre2_jit_free_)
++#define _pcre2_jit_check_exec        PCRE2_SUFFIX(_pcre2_jit_check_exec_)
+ #define _pcre2_jit_get_size          PCRE2_SUFFIX(_pcre2_jit_get_size_)
+ #define _pcre2_jit_get_target        PCRE2_SUFFIX(_pcre2_jit_get_target_)
+ #define _pcre2_memctl_malloc         PCRE2_SUFFIX(_pcre2_memctl_malloc_)
+@@ -2325,6 +2326,7 @@ extern BOOL         _pcre2_is_newline(PCRE2_SPTR, uint32_t, PCRE2_SPTR,
+                       uint32_t *, BOOL);
+ extern void         _pcre2_jit_free_rodata(void *, void *);
+ extern void         _pcre2_jit_free(void *, pcre2_memctl *);
++extern BOOL         _pcre2_jit_check_exec(void *, uint32_t);
+ extern size_t       _pcre2_jit_get_size(void *);
+ const char *        _pcre2_jit_get_target(void);
+ extern void *       _pcre2_memctl_malloc(size_t, pcre2_memctl *);
+diff --git a/src/pcre2_jit_match_inc.h b/src/pcre2_jit_match_inc.h
+index 4163cf61..ba210007 100644
+--- a/src/pcre2_jit_match_inc.h
++++ b/src/pcre2_jit_match_inc.h
+@@ -117,6 +117,7 @@ jit_arguments arguments;
+ int rc;
+ int index = 0;
+ 
++/* The same check is performed by jit_check_exec(). */
+ if ((options & PCRE2_PARTIAL_HARD) != 0)
+   index = 2;
+ else if ((options & PCRE2_PARTIAL_SOFT) != 0)
+diff --git a/src/pcre2_jit_misc_inc.h b/src/pcre2_jit_misc_inc.h
+index 0225fc6b..16c230e9 100644
+--- a/src/pcre2_jit_misc_inc.h
++++ b/src/pcre2_jit_misc_inc.h
+@@ -200,17 +200,28 @@ if (jit_stack != NULL)
+ 
+ 
+ /*************************************************
+-*               Get target CPU type              *
++*          Checks function compilation           *
+ *************************************************/
+ 
+-const char*
+-PRIV(jit_get_target)(void)
++BOOL
++PRIV(jit_check_exec)(void *executable_jit, uint32_t options)
+ {
+ #ifndef SUPPORT_JIT
+-return "JIT is not supported";
++(void)executable_jit;
++(void)options;
++return FALSE;
+ #else  /* SUPPORT_JIT */
+-return sljit_get_platform_name();
+-#endif  /* SUPPORT_JIT */
++/* The same check is performed at the beginning of pcre2_jit_match(). */
++executable_functions *functions = (executable_functions *)executable_jit;
++int index = 0;
++
++if ((options & PCRE2_PARTIAL_HARD) != 0)
++  index = 2;
++else if ((options & PCRE2_PARTIAL_SOFT) != 0)
++  index = 1;
++
++return functions->executable_funcs[index] != NULL;
++#endif
+ }
+ 
+ 
+@@ -231,4 +242,19 @@ return executable_sizes[0] + executable_sizes[1] + executable_sizes[2];
+ #endif
+ }
+ 
++/*************************************************
++*               Get target CPU type              *
++*************************************************/
++
++const char*
++PRIV(jit_get_target)(void)
++{
++#ifndef SUPPORT_JIT
++return "JIT is not supported";
++#else  /* SUPPORT_JIT */
++return sljit_get_platform_name();
++#endif  /* SUPPORT_JIT */
++}
++
++
+ /* End of pcre2_jit_misc_inc.h */
+diff --git a/src/pcre2_match.c b/src/pcre2_match.c
+index 9ee8a476..a5a8421f 100644
+--- a/src/pcre2_match.c
++++ b/src/pcre2_match.c
+@@ -6995,10 +6995,6 @@ PCRE2_SPTR req_cu_ptr;
+ PCRE2_SPTR start_partial;
+ PCRE2_SPTR match_partial;
+ 
+-#ifdef SUPPORT_JIT
+-BOOL use_jit;
+-#endif
+-
+ /* This flag is needed even when Unicode is not supported for convenience
+ (it is used by the IS_NEWLINE macro). */
+ 
+@@ -7008,9 +7004,6 @@ BOOL utf = FALSE;
+ BOOL ucp = FALSE;
+ BOOL allow_invalid;
+ uint32_t fragment_options = 0;
+-#ifdef SUPPORT_JIT
+-BOOL jit_checked_utf = FALSE;
+-#endif
+ #endif  /* SUPPORT_UNICODE */
+ 
+ PCRE2_SIZE frame_size;
+@@ -7073,15 +7066,6 @@ options |= (re->flags & FF) / ((FF & (~FF+1)) / (OO & (~OO+1)));
+ #undef FF
+ #undef OO
+ 
+-/* If the pattern was successfully studied with JIT support, we will run the
+-JIT executable instead of the rest of this function. Most options must be set
+-at compile time for the JIT code to be usable. */
+-
+-#ifdef SUPPORT_JIT
+-use_jit = (re->executable_jit != NULL &&
+-          (options & ~PUBLIC_JIT_MATCH_OPTIONS) == 0);
+-#endif
+-
+ /* Initialize UTF/UCP parameters. */
+ 
+ #ifdef SUPPORT_UNICODE
+@@ -7128,20 +7112,25 @@ match_data->startchar = 0;
+ 
+ /* ============================= JIT matching ============================== */
+ 
+-/* Prepare for JIT matching. Check a UTF string for validity unless no check is
+-requested or invalid UTF can be handled. We check only the portion of the
+-subject that might be be inspected during matching - from the offset minus the
+-maximum lookbehind to the given length. This saves time when a small part of a
+-large subject is being matched by the use of a starting offset. Note that the
+-maximum lookbehind is a number of characters, not code units. */
++/* If the pattern was successfully studied with JIT support, we will run the
++JIT executable instead of the rest of this function. Most options must be set
++at compile time for the JIT code to be usable. */
+ 
+ #ifdef SUPPORT_JIT
+-if (use_jit)
++if (re->executable_jit != NULL &&
++    (options & ~PUBLIC_JIT_MATCH_OPTIONS) == 0 &&
++    PRIV(jit_check_exec)(re->executable_jit, options))
+   {
++  /* Prepare for JIT matching. Check a UTF string for validity unless no check
++  is requested or invalid UTF can be handled. We check only the portion of the
++  subject that might be be inspected during matching - from the offset minus
++  the maximum lookbehind to the given length. This saves time when a small part
++  of a large subject is being matched by the use of a starting offset. Note that
++  the maximum lookbehind is a number of characters, not code units. */
++
+ #ifdef SUPPORT_UNICODE
+   if (utf && (options & PCRE2_NO_UTF_CHECK) == 0 && !allow_invalid)
+     {
+-
+     /* For 8-bit and 16-bit UTF, check that the first code unit is a valid
+     character start. */
+ 
+@@ -7194,40 +7183,36 @@ if (use_jit)
+       match_data->startchar += start_match - subject;
+       return match_data->rc = rc;
+       }
+-    jit_checked_utf = TRUE;
+     }
+ #endif  /* SUPPORT_UNICODE */
+ 
+-  /* If JIT returns BADOPTION, which means that the selected complete or
+-  partial matching mode was not compiled, fall through to the interpreter. */
+-
+   rc = pcre2_jit_match(code, subject, length, start_offset, options,
+     match_data, mcontext);
+-  if (rc != PCRE2_ERROR_JIT_BADOPTION)
++  /* JIT must be able to perform the match. */
++  PCRE2_ASSERT(rc != PCRE2_ERROR_JIT_BADOPTION);
++
++  match_data->options = original_options;
++  if (rc >= 0 && (options & PCRE2_COPY_MATCHED_SUBJECT) != 0)
+     {
+-    match_data->options = original_options;
+-    if (rc >= 0 && (options & PCRE2_COPY_MATCHED_SUBJECT) != 0)
++    if (length != 0)
+       {
+-      if (length != 0)
+-        {
+-        match_data->subject = match_data->memctl.malloc(CU2BYTES(length),
+-          match_data->memctl.memory_data);
+-        if (match_data->subject == NULL)
+-          return match_data->rc = PCRE2_ERROR_NOMEMORY;
+-        memcpy((void *)match_data->subject, subject, CU2BYTES(length));
+-        }
+-      else
+-        match_data->subject = NULL;
+-      match_data->flags |= PCRE2_MD_COPIED_SUBJECT;
++      match_data->subject = match_data->memctl.malloc(CU2BYTES(length),
++        match_data->memctl.memory_data);
++      if (match_data->subject == NULL)
++        return match_data->rc = PCRE2_ERROR_NOMEMORY;
++      memcpy((void *)match_data->subject, subject, CU2BYTES(length));
+       }
+     else
+-      {
+-      /* When pcre2_jit_match sets the subject, it doesn't know what the
+-      original passed-in pointer was. */
+-      if (match_data->subject != NULL) match_data->subject = original_subject;
+-      }
+-    return rc;
++      match_data->subject = NULL;
++    match_data->flags |= PCRE2_MD_COPIED_SUBJECT;
+     }
++  else
++    {
++    /* When pcre2_jit_match sets the subject, it doesn't know what the
++    original passed-in pointer was. */
++    if (match_data->subject != NULL) match_data->subject = original_subject;
++    }
++  return rc;
+   }
+ #endif  /* SUPPORT_JIT */
+ 
+@@ -7240,12 +7225,8 @@ this. */
+ 
+ mb->check_subject = subject;
+ 
+-/* If a UTF subject string was not checked for validity in the JIT code above,
+-check it here, and handle support for invalid UTF strings. The check above
+-happens only when invalid UTF is not supported and PCRE2_NO_CHECK_UTF is unset.
+-If we get here in those circumstances, it means the subject string is valid,
+-but for some reason JIT matching was not successful. There is no need to check
+-the subject again.
++/* Check the validity of UTF subject strings. The check happens only when
++PCRE2_NO_CHECK_UTF is unset.
+ 
+ We check only the portion of the subject that might be be inspected during
+ matching - from the offset minus the maximum lookbehind to the given length.
+@@ -7257,11 +7238,7 @@ Note also that support for invalid UTF forces a check, overriding the setting
+ of PCRE2_NO_CHECK_UTF. */
+ 
+ #ifdef SUPPORT_UNICODE
+-if (utf &&
+-#ifdef SUPPORT_JIT
+-    !jit_checked_utf &&
+-#endif
+-    ((options & PCRE2_NO_UTF_CHECK) == 0 || allow_invalid))
++if (utf && ((options & PCRE2_NO_UTF_CHECK) == 0 || allow_invalid))
+   {
+ #if PCRE2_CODE_UNIT_WIDTH != 32
+   BOOL skipped_bad_start = FALSE;
diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index fa59747fdc..7d027e90ee 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://run-ptest \
            file://CVE-2026-89162.patch \
            file://CVE-2026-89161.patch \
+           file://CVE-2026-89156.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"

