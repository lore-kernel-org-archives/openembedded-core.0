Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1A2CA601E
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 18:47:39 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2876.1791571648945491152
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 11:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=A1bVi2zH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20261009184727c0e2e691ed00020752-kdo0zs@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261009184727c0e2e691ed00020752
        for <openembedded-core@lists.openembedded.org>;
        Fri, 09 Oct 2026 20:47:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=45fUbLFwz7D9EKVIIvyHWA4oUDFKZpxEcaZWpi+0OcU=;
 b=A1bVi2zHNuvYqdsPko33M4FgoJ2VG9hqZI52WM9hFBQ0cX3qw+JkiqNTvzlGn9xnIKOIbP
 VDZ3o4mglkE3F5nm4JYcBfB4D+/io+KEmDjRkQGmWTySCquh5rYarHO1PHtO7sJqpn1YpGZF
 zsieyRlwbiSdqrnJfrLUSgdhE29fJ1wxlBF4GJMWQHgKxyALtcl0FuqdcjmrG8elKC68s/nW
 cICTB8iN9SzxJ8tErlVUsKBd/u+54CHnEG67GCLy2WmUE/w6znYFuxCol7ZuaetqVJB2p9Q0
 bYZTpcB2wn8Y07UbArTLxC+cO+jNKjGodaJ7nPnb2e1x5SH5iY7KYazg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 6/8] libpcre2: patch CVE-2026-89158
Date: Fri,  9 Oct 2026 20:45:46 +0200
Message-ID: <20261009184548.2962197-6-peter.marko@siemens.com>
In-Reply-To: <20261009184548.2962197-1-peter.marko@siemens.com>
References: <20261009184548.2962197-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 18:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247481

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] since [2] does not provide it.

[1] https://security-tracker.debian.org/tracker/CVE-2026-89158
[2] https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-fmgr-6ggq-9859

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpcre/libpcre2/CVE-2026-89158.patch     | 208 ++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb |   1 +
 2 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2026-89158.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2026-89158.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2026-89158.patch
new file mode 100644
index 0000000000..8099667433
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2026-89158.patch
@@ -0,0 +1,208 @@
+From ec9c286d5c10cf1c388b58a442ccefded42254fd Mon Sep 17 00:00:00 2001
+From: Nicholas Wilson <nicholas@nicholaswilson.me.uk>
+Date: Thu, 27 Aug 2026 16:52:16 +0100
+Subject: [PATCH] Fix compiler integer overflows; see GHSA-fmgr-6ggq-9859 for
+ details
+
+CVE: CVE-2026-89158
+Upstream-Status: Backport [https://github.com/PCRE2Project/pcre2/commit/ec9c286d5c10cf1c388b58a442ccefded42254fd]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/pcre2_compile.c       | 55 ++++++++++++++++++++++++++++++++++++---
+ src/pcre2_compile_class.c | 35 ++++++++++++++++---------
+ 2 files changed, 74 insertions(+), 16 deletions(-)
+
+diff --git a/src/pcre2_compile.c b/src/pcre2_compile.c
+index 1081cf64..32cb32f6 100644
+--- a/src/pcre2_compile.c
++++ b/src/pcre2_compile.c
+@@ -6195,7 +6195,8 @@ for (;; pptr++)
+ 
+     if (meta < META_ASTERISK || meta > META_MINMAX_QUERY)
+       {
+-      if (OFLOW_MAX - *lengthptr < (PCRE2_SIZE)(code - orig_code))
++      if (*lengthptr > OFLOW_MAX ||
++          OFLOW_MAX - *lengthptr < (PCRE2_SIZE)(code - orig_code))
+         {
+         *errorcodeptr = ERR20;   /* Integer overflow */
+         cb->erroroffset = 0;
+@@ -8795,7 +8796,8 @@ for (;;)
+     *reqcuflagsptr = reqcuflags;
+     if (lengthptr != NULL)
+       {
+-      if (OFLOW_MAX - *lengthptr < length)
++      if (*lengthptr > MAX_PATTERN_SIZE ||
++          MAX_PATTERN_SIZE - *lengthptr < length)
+         {
+         *errorcodeptr = ERR20;
+         return 0;
+@@ -8818,6 +8820,19 @@ for (;;)
+     {
+     code = *codeptr + 1 + LINK_SIZE + skipunits;
+     length += 1 + LINK_SIZE;
++
++    /* Move the accumulated length into *lengthptr, providing the next call to
++    compile_branch with as much space in &length and &code as the first did. */
++
++    if (*lengthptr > MAX_PATTERN_SIZE ||
++        MAX_PATTERN_SIZE - *lengthptr < length)
++      {
++      *errorcodeptr = ERR20;
++      cb->erroroffset = 0;
++      return 0;
++      }
++    *lengthptr += length;
++    length = 0;
+     }
+   else
+     {
+@@ -10831,7 +10846,8 @@ if (errorcode != 0) goto HAD_CB_ERROR;  /* Offset is in cb.erroroffset */
+ #if defined SUPPORT_WIDE_CHARS
+ PCRE2_ASSERT((cb.char_lists_size & 0x3) == 0);
+ if (length > MAX_PATTERN_SIZE ||
+-    MAX_PATTERN_SIZE - length < (cb.char_lists_size / sizeof(PCRE2_UCHAR)))
++    BYTES2CU(cb.char_lists_size) > MAX_PATTERN_SIZE ||
++    MAX_PATTERN_SIZE - length < BYTES2CU(cb.char_lists_size))
+ #else
+ if (length > MAX_PATTERN_SIZE)
+ #endif
+@@ -10856,11 +10872,36 @@ if (cb.char_lists_size != 0)
+   /* Align to 32 bit first. This ensures the
+   allocated area will also be 32 bit aligned. */
+   re_blocksize = (PCRE2_SIZE)CLIST_ALIGN_TO(re_blocksize, sizeof(uint32_t));
++#else
++  /* Already 32 bit aligned. */
+ #endif
++
++  /* We have bounded the length and BYTES2CU(char_lists_size) to
++  MAX_PATTERN_SIZE units, however (with 32-bit code units) char_lists_size
++  in bytes could still be extremely close to (or greater than) SIZE_MAX, so
++  we require another overflow check. */
++
++  if (cb.char_lists_size > PCRE2_SIZE_MAX - re_blocksize)
++    {
++    errorcode = ERR20;
++    cb.erroroffset = 0;
++    goto HAD_CB_ERROR;
++    }
++
+   re_blocksize += cb.char_lists_size;
+   }
+ #endif
+ 
++if (length > BYTES2CU(PCRE2_SIZE_MAX - re_blocksize))
++  {
++  /* Given the current value of 2^30 for MAX_PATTERN_SIZE, this block is only
++  reachable when both PCRE2_CODE_UNIT_WIDTH >= 16 and sizeof(size_t) is
++  32 bits. */
++  errorcode = ERR20;
++  cb.erroroffset = 0;
++  goto HAD_CB_ERROR;
++  }
++
+ re_blocksize += CU2BYTES(length);
+ 
+ if (re_blocksize > ccontext->max_pattern_compiled_length)
+@@ -10870,7 +10911,15 @@ if (re_blocksize > ccontext->max_pattern_compiled_length)
+   goto HAD_CB_ERROR;
+   }
+ 
++if (sizeof(pcre2_real_code) > PCRE2_SIZE_MAX - re_blocksize)
++  {
++  errorcode = ERR20;
++  cb.erroroffset = 0;
++  goto HAD_CB_ERROR;
++  }
++
+ re_blocksize += sizeof(pcre2_real_code);
++
+ re = (pcre2_real_code *)
+   ccontext->memctl.malloc(re_blocksize, ccontext->memctl.memory_data);
+ if (re == NULL)
+diff --git a/src/pcre2_compile_class.c b/src/pcre2_compile_class.c
+index c6f30d6f..c0606643 100644
+--- a/src/pcre2_compile_class.c
++++ b/src/pcre2_compile_class.c
+@@ -498,7 +498,7 @@ static const uint32_t char_list_starts[] = {
+ 
+ static class_ranges *
+ compile_optimize_class(uint32_t *start_ptr, uint32_t options,
+-  uint32_t xoptions, compile_block *cb)
++  uint32_t xoptions, int *errorcodeptr, compile_block *cb)
+ {
+ class_ranges* cranges;
+ uint32_t *ptr;
+@@ -538,12 +538,23 @@ PCRE2_ASSERT((range_list_size & 0x1) == 0);
+ 
+ total_size = range_list_size +
+    ((range_list_size >= 2) ? CHAR_LIST_EXTRA_SIZE : 0);
++if (total_size > (PCRE2_SIZE_MAX - sizeof(class_ranges)) / sizeof(uint32_t))
++  {
++  *errorcodeptr = ERR20;
++  cb->erroroffset = 0;
++  return NULL;
++  }
+ 
+ cranges = cb->cx->memctl.malloc(
+   sizeof(class_ranges) + total_size * sizeof(uint32_t),
+   cb->cx->memctl.memory_data);
+ 
+-if (cranges == NULL) return NULL;
++if (cranges == NULL)
++  {
++  *errorcodeptr = ERR21;
++  cb->erroroffset = 0;
++  return NULL;
++  }
+ 
+ cranges->header.next = NULL;
+ #ifdef PCRE2_DEBUG
+@@ -1116,13 +1127,10 @@ if (utf)
+   {
+   if (lengthptr != NULL)
+     {
+-    cranges = compile_optimize_class(pptr, options, xoptions, cb);
++    cranges = compile_optimize_class(pptr, options, xoptions, errorcodeptr, cb);
+ 
+     if (cranges == NULL)
+-      {
+-      *errorcodeptr = ERR21;
+       return NULL;
+-      }
+ 
+     /* Caching the pre-processed character ranges. */
+     if (cb->last_data != NULL)
+@@ -1755,18 +1763,17 @@ if ((xclass_props & XCLASS_REQUIRED) != 0)
+       *lengthptr += 1 + LINK_SIZE;
+ #endif
+ 
+-      cb->char_lists_size += char_lists_size;
++      PCRE2_ASSERT(BYTES2CU(cb->char_lists_size) <= MAX_PATTERN_SIZE);
+ 
+-      char_lists_size /= sizeof(PCRE2_UCHAR);
+-
+-      /* Storage space for character lists is included
+-      in the maximum pattern size. */
+-      if (*lengthptr > MAX_PATTERN_SIZE ||
+-          MAX_PATTERN_SIZE - *lengthptr < char_lists_size)
++      if (char_lists_size > PCRE2_SIZE_MAX - cb->char_lists_size ||
++          BYTES2CU(char_lists_size) > MAX_PATTERN_SIZE ||
++          BYTES2CU(cb->char_lists_size) > MAX_PATTERN_SIZE - BYTES2CU(char_lists_size))
+         {
+         *errorcodeptr = ERR20;   /* Pattern is too large */
+         return NULL;
+         }
++
++      cb->char_lists_size += char_lists_size;
+       }
+     else
+       {
+@@ -1789,6 +1796,8 @@ if ((xclass_props & XCLASS_REQUIRED) != 0)
+       Each list is aligned to 32 bit with an optional unused
+       16 bit value at the beginning of the character list. */
+ 
++      PCRE2_ASSERT(char_lists_size <= PCRE2_SIZE_MAX - cb->char_lists_size);
++
+       cb->char_lists_size += char_lists_size;
+       data = (uint8_t*)cb->start_code - cb->char_lists_size;
+ 
diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index ef8274c9b1..2f40ef463e 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://CVE-2026-89156.patch \
            file://CVE-2026-89157.patch \
            file://CVE-2026-89160.patch \
+           file://CVE-2026-89158.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"

