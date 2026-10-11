Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C020DCA9EDD
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:40 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23587.1791708100159847413
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qrw1kNmf;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso1947423f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708098; x=1792312898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eT/T38/ITBxXm+fBFVBkDOApdUQ3mfKdRd5ZwkzkilY=;
        b=qrw1kNmfp5Ht2iXZp2EcAyE8mMyA7rLeax6osIS+GIn0eOXMCPJ7FpTR1PklFBXp0C
         2jHWb83VwNQ6Js9sJAMLUaxx5QI1scbvoI+SM5JF152AsqaOxvnw0CgXXC2Y/hKbA3hr
         58A/KE6F6xTgxQK/gBMHxUz+b8GuHHZaMD48E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708098; x=1792312898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eT/T38/ITBxXm+fBFVBkDOApdUQ3mfKdRd5ZwkzkilY=;
        b=Gakaxg+sMs2ueIMKfQFRTA4PnD0Z0DtXMWZ0Jjfj0G69MU+h66qbeSJRbe4WkWItkG
         LLKK9X5qbkljBPezlX/6xL9RsPfHM14EhiJ1w/z3GGc3K3hfQG7u/E4A+pEQzYlcJ/hZ
         gopXFv5kC/MJQDVb82qAJaN7PlzHLZ/XIiIlCLzpc6E4dvwI4mmzUJVWqNn3Q7h2VB+y
         eYyD3a80pNYRDk3XePiaDB6KjKSfGG7dFwSR7ZzQym1TK521m057VWD1biKotzxwa8aG
         E64T1ZUVlWxCfo+Krb/TLoybtZqMdbEaxbvtVbsTjE6CrNPe6KrdPbgdPwqA7Vtw7bLK
         OOqg==
X-Gm-Message-State: AFq9FYKRZSD8iSIuH1uHh4iBcI50c7ttDVUyzJ5rN2WYmL13Bdxu7W0Y
	KM18jU12HQx43+hlq/G6g813AxIcVX0yX0a+cgZYsCRrW97Tsrez8M/DvJjfuSnEOAAlRLxpCsz
	yxZz+Jco=
X-Gm-Gg: AYBFou1DF80Li+nfvk67iPmaH9xyWDvvo+0k8zd2BeTKXaQYnQd1rKmOlRmg5PdjfJu
	RR39L/cTo2UXb7Z3qQgZmy88OhpBl5Z11lAv3LYkB7tDlJh5liii8O99/T8u+PJIX5GI1nUcpNQ
	J8t72WWjgwcdlMZBVQaZg4PeMsvm7p7MOOuuRLHsL2OFTWkXukfT857KHudZlX1iXwJJPqFABmk
	wN1U/1bEx20LIIHxCYu64VrEx6XUgM2ZzrwL3uH1r1CPtHI+w5riQH1lnkbGqbE6Ku+Yt+0Rqr1
	uVE0+x3ZA5a7XVUyh0p6+xE4q+COCfRtcx1gxjRtSYYFFKXp06lDRYgcToB3W7JRr/lLHUhYudP
	8DNiMklifTImj7Kfw2/CU8GGVDtigcl2an2v5VdNODtgJ3EYNaNyQpYkOqU8mSn5AT/nBDpq7At
	kZTGF1q1+wPbEOAOj7cywZtFjVJJkojGIvbkiD79XykLhV3NouWA3wleKQHqdi1U0erpjLRFuCO
	yTbIck8IbJzS63tKQW37PJeD+uYmqsIAdvCHPfo8sgX8wRbPS5Yyur3IoUzKrQM7/I6ANSRMg==
X-Received: by 2002:a05:6000:298d:20b0:48b:469:b562 with SMTP id ffacd0b85a97d-48dba7b3284mr8836136f8f.2.1791708098251;
        Sun, 11 Oct 2026 01:41:38 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 58/60] libpcre2: patch CVE-2026-89158
Date: Sun, 11 Oct 2026 10:40:31 +0200
Message-ID: <d4427ccd6c01d733440e3afb05f0ca0d7e808c76.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247567

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] since [2] does not provide it.

[1] https://security-tracker.debian.org/tracker/CVE-2026-89158
[2] https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-fmgr-6ggq-9859

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcre/libpcre2/CVE-2026-89158.patch     | 208 ++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb |   1 +
 2 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2026-89158.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2026-89158.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2026-89158.patch
new file mode 100644
index 00000000000..80996674332
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
index ef8274c9b16..2f40ef463eb 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://CVE-2026-89156.patch \
            file://CVE-2026-89157.patch \
            file://CVE-2026-89160.patch \
+           file://CVE-2026-89158.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"

