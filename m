Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D845AC43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 04:49:04 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.3989.1654231741755225536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 21:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LwHEFpA7;
 spf=pass (domain: mvista.com, ip: 209.85.215.169,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f169.google.com with SMTP id x12so6376517pgj.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 21:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ZW8eJFLhx1BUxYcAHa2msty8kaHjuYT1nekGWKAH/0=;
        b=LwHEFpA7sFmfYyMZh25uPuOCCHDehlpkGsVb7eztWe/UO4tZezQMR6YcD8MsW2Rr+c
         J8O4WSZqwHXmfcLBf7Trd5Skp33UtkMRM9LMI9NN+47+Dw9S+zYHmBBVz+qSSO9zBO7e
         FSPzeei3MO6LeHogtGDGhqGVArQYmlCP0wSC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ZW8eJFLhx1BUxYcAHa2msty8kaHjuYT1nekGWKAH/0=;
        b=sXwXqUvkybx5FszVMEFLtLoVqJGntVcWeKdJtfNzW05NP3OuAQjtpk6WpwJA+5uPO/
         E/xE6NOt0CgcsLIWnHCfzPV6uX0ED0wgBkh1unruA3rJDMvtW4tRoENpc4R1Lq19Jj65
         RM2rPFTo7YdOyNX78KtGhU0OPz9Wv6o/+T1e5Xpa/ou+5E3atFsar6AN8Lew7h78d7LE
         ZipYKuSiwROVxdNdQgdhNy0iRCHXmQGccMt9B5x2sk7Jzyt8rjSJSvk7dbiQzZKKPN4B
         g9K4U/3KOZMF7E7nksBqbAyghfAO9Pl/vIYnkipNcuwah5892qtN0BRrpYzjZimUMbA9
         71Mg==
X-Gm-Message-State: AOAM532G2xIgBG3WZ2WiJNQzXGjAaYsTiehv6bBetRsDx/3BXtm8gDYt
	7r20qcQSl4D+bsCKiXp6FuL/SCqGs400sdW2
X-Google-Smtp-Source: 
 ABdhPJyBLz9IEbmWbtwMrlMM2O/b2m7EJKmggDeWPVaOuhpQiyz+PcWJQIdgyWhUoU4pHML5qSKk4A==
X-Received: by 2002:a63:df0f:0:b0:3db:2d4:ded9 with SMTP id
 u15-20020a63df0f000000b003db02d4ded9mr7242187pgg.267.1654231740613;
        Thu, 02 Jun 2022 21:49:00 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.228])
        by smtp.gmail.com with ESMTPSA id
 o7-20020a170902bcc700b00163f6428657sm4351516pls.6.2022.06.02.21.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 21:49:00 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Fri, 03 Jun 2022 10:18:54 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: jpuhlman@mvista.com,
	Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH v2] pcre2: CVE-2022-1587 Out-of-bounds read
Date: Fri,  3 Jun 2022 10:18:53 +0530
Message-Id: <20220603044853.5681-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 04:49:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166508

Source:  https://github.com/PCRE2Project/pcre2
MR: 118031
Type: Security Fix
Disposition: Backport from https://github.com/PCRE2Project/pcre2/commit/03654e751e7f0700693526b67dfcadda6b42c9d0
ChangeID: 8fbc562b3e6b6a3674f435f6527a62afc67ef933
Description:
	CVE-2022-1587  pcre2: Out-of-bounds read in get_recurse_data_length in pcre2_jit_compile.c.
Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libpcre/libpcre2/CVE-2022-1587.patch      | 660 ++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.34.bb |   1 +
 2 files changed, 661 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1587.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2022-1587.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2022-1587.patch
new file mode 100644
index 0000000000..70f9f9f079
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2022-1587.patch
@@ -0,0 +1,660 @@
+From aa5aac0d209e3debf80fc2db924d9401fc50454b Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Mon, 23 May 2022 14:11:11 +0530
+Subject: [PATCH] CVE-2022-1587
+
+Upstream-Status: Backport [https://github.com/PCRE2Project/pcre2/commit/03654e751e7f0700693526b67dfcadda6b42c9d0]
+CVE: CVE-2022-1587
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+---
+ ChangeLog               |   3 +
+ src/pcre2_jit_compile.c | 290 ++++++++++++++++++++++++++--------------
+ src/pcre2_jit_test.c    |   1 +
+ 3 files changed, 194 insertions(+), 100 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index b5d72dc..de82de9 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -4,6 +4,9 @@ Change Log for PCRE2
+ 23. Fixed a unicode properrty matching issue in JIT. The character was not
+ fully read in caseless matching.
+ 
++24. Fixed an issue affecting recursions in JIT caused by duplicated data
++transfers.
++
+ 
+ Version 10.34 21-November-2019
+ ------------------------------
+diff --git a/src/pcre2_jit_compile.c b/src/pcre2_jit_compile.c
+index 5d43865..493c96d 100644
+--- a/src/pcre2_jit_compile.c
++++ b/src/pcre2_jit_compile.c
+@@ -407,6 +407,9 @@ typedef struct compiler_common {
+   /* Locals used by fast fail optimization. */
+   sljit_s32 fast_fail_start_ptr;
+   sljit_s32 fast_fail_end_ptr;
++  /* Variables used by recursive call generator. */
++  sljit_s32 recurse_bitset_size;
++  uint8_t *recurse_bitset;
+ 
+   /* Flipped and lower case tables. */
+   const sljit_u8 *fcc;
+@@ -2109,19 +2112,39 @@ for (i = 0; i < RECURSE_TMP_REG_COUNT; i++)
+ 
+ #undef RECURSE_TMP_REG_COUNT
+ 
++static BOOL recurse_check_bit(compiler_common *common, sljit_sw bit_index)
++{
++uint8_t *byte;
++uint8_t mask;
++
++SLJIT_ASSERT((bit_index & (sizeof(sljit_sw) - 1)) == 0);
++
++bit_index >>= SLJIT_WORD_SHIFT;
++
++mask = 1 << (bit_index & 0x7);
++byte = common->recurse_bitset + (bit_index >> 3);
++
++if (*byte & mask)
++  return FALSE;
++
++*byte |= mask;
++return TRUE;
++}
++
+ static int get_recurse_data_length(compiler_common *common, PCRE2_SPTR cc, PCRE2_SPTR ccend,
+   BOOL *needs_control_head, BOOL *has_quit, BOOL *has_accept)
+ {
+ int length = 1;
+-int size;
++int size, offset;
+ PCRE2_SPTR alternative;
+ BOOL quit_found = FALSE;
+ BOOL accept_found = FALSE;
+ BOOL setsom_found = FALSE;
+ BOOL setmark_found = FALSE;
+-BOOL capture_last_found = FALSE;
+ BOOL control_head_found = FALSE;
+ 
++memset(common->recurse_bitset, 0, common->recurse_bitset_size);
++
+ #if defined DEBUG_FORCE_CONTROL_HEAD && DEBUG_FORCE_CONTROL_HEAD
+ SLJIT_ASSERT(common->control_head_ptr != 0);
+ control_head_found = TRUE;
+@@ -2144,15 +2167,17 @@ while (cc < ccend)
+       setsom_found = TRUE;
+     if (common->mark_ptr != 0)
+       setmark_found = TRUE;
+-    if (common->capture_last_ptr != 0)
+-      capture_last_found = TRUE;
++    if (common->capture_last_ptr != 0 && recurse_check_bit(common, common->capture_last_ptr))
++      length++;
+     cc += 1 + LINK_SIZE;
+     break;
+ 
+     case OP_KET:
+-    if (PRIVATE_DATA(cc) != 0)
++    offset = PRIVATE_DATA(cc);
++    if (offset != 0)
+       {
+-      length++;
++      if (recurse_check_bit(common, offset))
++        length++;
+       SLJIT_ASSERT(PRIVATE_DATA(cc + 1) != 0);
+       cc += PRIVATE_DATA(cc + 1);
+       }
+@@ -2169,39 +2194,55 @@ while (cc < ccend)
+     case OP_SBRA:
+     case OP_SBRAPOS:
+     case OP_SCOND:
+-    length++;
+     SLJIT_ASSERT(PRIVATE_DATA(cc) != 0);
++    if (recurse_check_bit(common, PRIVATE_DATA(cc)))
++      length++;
+     cc += 1 + LINK_SIZE;
+     break;
+ 
+     case OP_CBRA:
+     case OP_SCBRA:
+-    length += 2;
+-    if (common->capture_last_ptr != 0)
+-      capture_last_found = TRUE;
+-    if (common->optimized_cbracket[GET2(cc, 1 + LINK_SIZE)] == 0)
++    offset = GET2(cc, 1 + LINK_SIZE);
++    if (recurse_check_bit(common, OVECTOR(offset << 1)))
++      {
++      SLJIT_ASSERT(recurse_check_bit(common, OVECTOR((offset << 1) + 1)));
++      length += 2;
++      }
++    if (common->optimized_cbracket[offset] == 0 && recurse_check_bit(common, OVECTOR_PRIV(offset)))
++      length++;
++    if (common->capture_last_ptr != 0 && recurse_check_bit(common, common->capture_last_ptr))
+       length++;
+     cc += 1 + LINK_SIZE + IMM2_SIZE;
+     break;
+ 
+     case OP_CBRAPOS:
+     case OP_SCBRAPOS:
+-    length += 2 + 2;
+-    if (common->capture_last_ptr != 0)
+-      capture_last_found = TRUE;
++    offset = GET2(cc, 1 + LINK_SIZE);
++    if (recurse_check_bit(common, OVECTOR(offset << 1)))
++      {
++      SLJIT_ASSERT(recurse_check_bit(common, OVECTOR((offset << 1) + 1)));
++      length += 2;
++      }
++    if (recurse_check_bit(common, OVECTOR_PRIV(offset)))
++      length++;
++    if (recurse_check_bit(common, PRIVATE_DATA(cc)))
++      length++;
++    if (common->capture_last_ptr != 0 && recurse_check_bit(common, common->capture_last_ptr))
++      length++;
+     cc += 1 + LINK_SIZE + IMM2_SIZE;
+     break;
+ 
+     case OP_COND:
+     /* Might be a hidden SCOND. */
+     alternative = cc + GET(cc, 1);
+-    if (*alternative == OP_KETRMAX || *alternative == OP_KETRMIN)
++    if ((*alternative == OP_KETRMAX || *alternative == OP_KETRMIN) && recurse_check_bit(common, PRIVATE_DATA(cc)))
+       length++;
+     cc += 1 + LINK_SIZE;
+     break;
+ 
+     CASE_ITERATOR_PRIVATE_DATA_1
+-    if (PRIVATE_DATA(cc) != 0)
++    offset = PRIVATE_DATA(cc);
++    if (offset != 0 && recurse_check_bit(common, offset))
+       length++;
+     cc += 2;
+ #ifdef SUPPORT_UNICODE
+@@ -2210,8 +2251,12 @@ while (cc < ccend)
+     break;
+ 
+     CASE_ITERATOR_PRIVATE_DATA_2A
+-    if (PRIVATE_DATA(cc) != 0)
++    offset = PRIVATE_DATA(cc);
++    if (offset != 0 && recurse_check_bit(common, offset))
++      {
++      SLJIT_ASSERT(recurse_check_bit(common, offset + sizeof(sljit_sw)));
+       length += 2;
++      }
+     cc += 2;
+ #ifdef SUPPORT_UNICODE
+     if (common->utf && HAS_EXTRALEN(cc[-1])) cc += GET_EXTRALEN(cc[-1]);
+@@ -2219,8 +2264,12 @@ while (cc < ccend)
+     break;
+ 
+     CASE_ITERATOR_PRIVATE_DATA_2B
+-    if (PRIVATE_DATA(cc) != 0)
++    offset = PRIVATE_DATA(cc);
++    if (offset != 0 && recurse_check_bit(common, offset))
++      {
++      SLJIT_ASSERT(recurse_check_bit(common, offset + sizeof(sljit_sw)));
+       length += 2;
++      }
+     cc += 2 + IMM2_SIZE;
+ #ifdef SUPPORT_UNICODE
+     if (common->utf && HAS_EXTRALEN(cc[-1])) cc += GET_EXTRALEN(cc[-1]);
+@@ -2228,20 +2277,29 @@ while (cc < ccend)
+     break;
+ 
+     CASE_ITERATOR_TYPE_PRIVATE_DATA_1
+-    if (PRIVATE_DATA(cc) != 0)
++    offset = PRIVATE_DATA(cc);
++    if (offset != 0 && recurse_check_bit(common, offset))
+       length++;
+     cc += 1;
+     break;
+ 
+     CASE_ITERATOR_TYPE_PRIVATE_DATA_2A
+-    if (PRIVATE_DATA(cc) != 0)
++    offset = PRIVATE_DATA(cc);
++    if (offset != 0 && recurse_check_bit(common, offset))
++      {
++      SLJIT_ASSERT(recurse_check_bit(common, offset + sizeof(sljit_sw)));
+       length += 2;
++      }
+     cc += 1;
+     break;
+ 
+     CASE_ITERATOR_TYPE_PRIVATE_DATA_2B
+-    if (PRIVATE_DATA(cc) != 0)
++    offset = PRIVATE_DATA(cc);
++    if (offset != 0 && recurse_check_bit(common, offset))
++      {
++      SLJIT_ASSERT(recurse_check_bit(common, offset + sizeof(sljit_sw)));
+       length += 2;
++      }
+     cc += 1 + IMM2_SIZE;
+     break;
+ 
+@@ -2253,7 +2311,9 @@ while (cc < ccend)
+ #else
+     size = 1 + 32 / (int)sizeof(PCRE2_UCHAR);
+ #endif
+-    if (PRIVATE_DATA(cc) != 0)
++
++    offset = PRIVATE_DATA(cc);
++    if (offset != 0 && recurse_check_bit(common, offset))
+       length += get_class_iterator_size(cc + size);
+     cc += size;
+     break;
+@@ -2288,8 +2348,7 @@ while (cc < ccend)
+     case OP_THEN:
+     SLJIT_ASSERT(common->control_head_ptr != 0);
+     quit_found = TRUE;
+-    if (!control_head_found)
+-      control_head_found = TRUE;
++    control_head_found = TRUE;
+     cc++;
+     break;
+ 
+@@ -2309,8 +2368,6 @@ SLJIT_ASSERT(cc == ccend);
+ 
+ if (control_head_found)
+   length++;
+-if (capture_last_found)
+-  length++;
+ if (quit_found)
+   {
+   if (setsom_found)
+@@ -2343,14 +2400,12 @@ sljit_sw shared_srcw[3];
+ sljit_sw kept_shared_srcw[2];
+ int private_count, shared_count, kept_shared_count;
+ int from_sp, base_reg, offset, i;
+-BOOL setsom_found = FALSE;
+-BOOL setmark_found = FALSE;
+-BOOL capture_last_found = FALSE;
+-BOOL control_head_found = FALSE;
++
++memset(common->recurse_bitset, 0, common->recurse_bitset_size);
+ 
+ #if defined DEBUG_FORCE_CONTROL_HEAD && DEBUG_FORCE_CONTROL_HEAD
+ SLJIT_ASSERT(common->control_head_ptr != 0);
+-control_head_found = TRUE;
++recurse_check_bit(common, common->control_head_ptr);
+ #endif
+ 
+ switch (type)
+@@ -2438,11 +2493,10 @@ while (cc < ccend)
+     {
+     case OP_SET_SOM:
+     SLJIT_ASSERT(common->has_set_som);
+-    if (has_quit && !setsom_found)
++    if (has_quit && recurse_check_bit(common, OVECTOR(0)))
+       {
+       kept_shared_srcw[0] = OVECTOR(0);
+       kept_shared_count = 1;
+-      setsom_found = TRUE;
+       }
+     cc += 1;
+     break;
+@@ -2450,33 +2504,31 @@ while (cc < ccend)
+     case OP_RECURSE:
+     if (has_quit)
+       {
+-      if (common->has_set_som && !setsom_found)
++      if (common->has_set_som && recurse_check_bit(common, OVECTOR(0)))
+         {
+         kept_shared_srcw[0] = OVECTOR(0);
+         kept_shared_count = 1;
+-        setsom_found = TRUE;
+         }
+-      if (common->mark_ptr != 0 && !setmark_found)
++      if (common->mark_ptr != 0 && recurse_check_bit(common, common->mark_ptr))
+         {
+         kept_shared_srcw[kept_shared_count] = common->mark_ptr;
+         kept_shared_count++;
+-        setmark_found = TRUE;
+         }
+       }
+-    if (common->capture_last_ptr != 0 && !capture_last_found)
++    if (common->capture_last_ptr != 0 && recurse_check_bit(common, common->capture_last_ptr))
+       {
+       shared_srcw[0] = common->capture_last_ptr;
+       shared_count = 1;
+-      capture_last_found = TRUE;
+       }
+     cc += 1 + LINK_SIZE;
+     break;
+ 
+     case OP_KET:
+-    if (PRIVATE_DATA(cc) != 0)
++    private_srcw[0] = PRIVATE_DATA(cc);
++    if (private_srcw[0] != 0)
+       {
+-      private_count = 1;
+-      private_srcw[0] = PRIVATE_DATA(cc);
++      if (recurse_check_bit(common, private_srcw[0]))
++        private_count = 1;
+       SLJIT_ASSERT(PRIVATE_DATA(cc + 1) != 0);
+       cc += PRIVATE_DATA(cc + 1);
+       }
+@@ -2493,50 +2545,66 @@ while (cc < ccend)
+     case OP_SBRA:
+     case OP_SBRAPOS:
+     case OP_SCOND:
+-    private_count = 1;
+     private_srcw[0] = PRIVATE_DATA(cc);
++    if (recurse_check_bit(common, private_srcw[0]))
++      private_count = 1;
+     cc += 1 + LINK_SIZE;
+     break;
+ 
+     case OP_CBRA:
+     case OP_SCBRA:
+-    offset = (GET2(cc, 1 + LINK_SIZE)) << 1;
+-    shared_srcw[0] = OVECTOR(offset);
+-    shared_srcw[1] = OVECTOR(offset + 1);
+-    shared_count = 2;
++    offset = GET2(cc, 1 + LINK_SIZE);
++    shared_srcw[0] = OVECTOR(offset << 1);
++    if (recurse_check_bit(common, shared_srcw[0]))
++      {
++      shared_srcw[1] = shared_srcw[0] + sizeof(sljit_sw);
++      SLJIT_ASSERT(recurse_check_bit(common, shared_srcw[1]));
++      shared_count = 2;
++      }
+ 
+-    if (common->capture_last_ptr != 0 && !capture_last_found)
++    if (common->capture_last_ptr != 0 && recurse_check_bit(common, common->capture_last_ptr))
+       {
+-      shared_srcw[2] = common->capture_last_ptr;
+-      shared_count = 3;
+-      capture_last_found = TRUE;
++      shared_srcw[shared_count] = common->capture_last_ptr;
++      shared_count++;
+       }
+ 
+-    if (common->optimized_cbracket[GET2(cc, 1 + LINK_SIZE)] == 0)
++    if (common->optimized_cbracket[offset] == 0)
+       {
+-      private_count = 1;
+-      private_srcw[0] = OVECTOR_PRIV(GET2(cc, 1 + LINK_SIZE));
++      private_srcw[0] = OVECTOR_PRIV(offset);
++      if (recurse_check_bit(common, private_srcw[0]))
++        private_count = 1;
+       }
++
+     cc += 1 + LINK_SIZE + IMM2_SIZE;
+     break;
+ 
+     case OP_CBRAPOS:
+     case OP_SCBRAPOS:
+-    offset = (GET2(cc, 1 + LINK_SIZE)) << 1;
+-    shared_srcw[0] = OVECTOR(offset);
+-    shared_srcw[1] = OVECTOR(offset + 1);
+-    shared_count = 2;
++    offset = GET2(cc, 1 + LINK_SIZE);
++    shared_srcw[0] = OVECTOR(offset << 1);
++    if (recurse_check_bit(common, shared_srcw[0]))
++      {
++      shared_srcw[1] = shared_srcw[0] + sizeof(sljit_sw);
++      SLJIT_ASSERT(recurse_check_bit(common, shared_srcw[1]));
++      shared_count = 2;
++      }
+ 
+-    if (common->capture_last_ptr != 0 && !capture_last_found)
++    if (common->capture_last_ptr != 0 && recurse_check_bit(common, common->capture_last_ptr))
+       {
+-      shared_srcw[2] = common->capture_last_ptr;
+-      shared_count = 3;
+-      capture_last_found = TRUE;
++      shared_srcw[shared_count] = common->capture_last_ptr;
++      shared_count++;
+       }
+ 
+-    private_count = 2;
+     private_srcw[0] = PRIVATE_DATA(cc);
+-    private_srcw[1] = OVECTOR_PRIV(GET2(cc, 1 + LINK_SIZE));
++    if (recurse_check_bit(common, private_srcw[0]))
++      private_count = 1;
++
++    offset = OVECTOR_PRIV(offset);
++    if (recurse_check_bit(common, offset))
++      {
++      private_srcw[private_count] = offset;
++      private_count++;
++      }
+     cc += 1 + LINK_SIZE + IMM2_SIZE;
+     break;
+ 
+@@ -2545,18 +2613,17 @@ while (cc < ccend)
+     alternative = cc + GET(cc, 1);
+     if (*alternative == OP_KETRMAX || *alternative == OP_KETRMIN)
+       {
+-      private_count = 1;
+       private_srcw[0] = PRIVATE_DATA(cc);
++      if (recurse_check_bit(common, private_srcw[0]))
++        private_count = 1;
+       }
+     cc += 1 + LINK_SIZE;
+     break;
+ 
+     CASE_ITERATOR_PRIVATE_DATA_1
+-    if (PRIVATE_DATA(cc))
+-      {
++    private_srcw[0] = PRIVATE_DATA(cc);
++    if (private_srcw[0] != 0 && recurse_check_bit(common, private_srcw[0]))
+       private_count = 1;
+-      private_srcw[0] = PRIVATE_DATA(cc);
+-      }
+     cc += 2;
+ #ifdef SUPPORT_UNICODE
+     if (common->utf && HAS_EXTRALEN(cc[-1])) cc += GET_EXTRALEN(cc[-1]);
+@@ -2564,11 +2631,12 @@ while (cc < ccend)
+     break;
+ 
+     CASE_ITERATOR_PRIVATE_DATA_2A
+-    if (PRIVATE_DATA(cc))
++    private_srcw[0] = PRIVATE_DATA(cc);
++    if (private_srcw[0] != 0 && recurse_check_bit(common, private_srcw[0]))
+       {
+       private_count = 2;
+-      private_srcw[0] = PRIVATE_DATA(cc);
+-      private_srcw[1] = PRIVATE_DATA(cc) + sizeof(sljit_sw);
++      private_srcw[1] = private_srcw[0] + sizeof(sljit_sw);
++      SLJIT_ASSERT(recurse_check_bit(common, private_srcw[1]));
+       }
+     cc += 2;
+ #ifdef SUPPORT_UNICODE
+@@ -2577,11 +2645,12 @@ while (cc < ccend)
+     break;
+ 
+     CASE_ITERATOR_PRIVATE_DATA_2B
+-    if (PRIVATE_DATA(cc))
++    private_srcw[0] = PRIVATE_DATA(cc);
++    if (private_srcw[0] != 0 && recurse_check_bit(common, private_srcw[0]))
+       {
+       private_count = 2;
+-      private_srcw[0] = PRIVATE_DATA(cc);
+-      private_srcw[1] = PRIVATE_DATA(cc) + sizeof(sljit_sw);
++      private_srcw[1] = private_srcw[0] + sizeof(sljit_sw);
++      SLJIT_ASSERT(recurse_check_bit(common, private_srcw[1]));
+       }
+     cc += 2 + IMM2_SIZE;
+ #ifdef SUPPORT_UNICODE
+@@ -2590,30 +2659,30 @@ while (cc < ccend)
+     break;
+ 
+     CASE_ITERATOR_TYPE_PRIVATE_DATA_1
+-    if (PRIVATE_DATA(cc))
+-      {
++    private_srcw[0] = PRIVATE_DATA(cc);
++    if (private_srcw[0] != 0 && recurse_check_bit(common, private_srcw[0]))
+       private_count = 1;
+-      private_srcw[0] = PRIVATE_DATA(cc);
+-      }
+     cc += 1;
+     break;
+ 
+     CASE_ITERATOR_TYPE_PRIVATE_DATA_2A
+-    if (PRIVATE_DATA(cc))
++    private_srcw[0] = PRIVATE_DATA(cc);
++    if (private_srcw[0] != 0 && recurse_check_bit(common, private_srcw[0]))
+       {
+       private_count = 2;
+-      private_srcw[0] = PRIVATE_DATA(cc);
+       private_srcw[1] = private_srcw[0] + sizeof(sljit_sw);
++      SLJIT_ASSERT(recurse_check_bit(common, private_srcw[1]));
+       }
+     cc += 1;
+     break;
+ 
+     CASE_ITERATOR_TYPE_PRIVATE_DATA_2B
+-    if (PRIVATE_DATA(cc))
++    private_srcw[0] = PRIVATE_DATA(cc);
++    if (private_srcw[0] != 0 && recurse_check_bit(common, private_srcw[0]))
+       {
+       private_count = 2;
+-      private_srcw[0] = PRIVATE_DATA(cc);
+       private_srcw[1] = private_srcw[0] + sizeof(sljit_sw);
++      SLJIT_ASSERT(recurse_check_bit(common, private_srcw[1]));
+       }
+     cc += 1 + IMM2_SIZE;
+     break;
+@@ -2630,14 +2699,17 @@ while (cc < ccend)
+       switch(get_class_iterator_size(cc + i))
+         {
+         case 1:
+-        private_count = 1;
+         private_srcw[0] = PRIVATE_DATA(cc);
+         break;
+ 
+         case 2:
+-        private_count = 2;
+         private_srcw[0] = PRIVATE_DATA(cc);
+-        private_srcw[1] = private_srcw[0] + sizeof(sljit_sw);
++        if (recurse_check_bit(common, private_srcw[0]))
++          {
++          private_count = 2;
++          private_srcw[1] = private_srcw[0] + sizeof(sljit_sw);
++          SLJIT_ASSERT(recurse_check_bit(common, private_srcw[1]));
++          }
+         break;
+ 
+         default:
+@@ -2652,28 +2724,25 @@ while (cc < ccend)
+     case OP_PRUNE_ARG:
+     case OP_THEN_ARG:
+     SLJIT_ASSERT(common->mark_ptr != 0);
+-    if (has_quit && !setmark_found)
++    if (has_quit && recurse_check_bit(common, common->mark_ptr))
+       {
+       kept_shared_srcw[0] = common->mark_ptr;
+       kept_shared_count = 1;
+-      setmark_found = TRUE;
+       }
+-    if (common->control_head_ptr != 0 && !control_head_found)
++    if (common->control_head_ptr != 0 && recurse_check_bit(common, common->control_head_ptr))
+       {
+       shared_srcw[0] = common->control_head_ptr;
+       shared_count = 1;
+-      control_head_found = TRUE;
+       }
+     cc += 1 + 2 + cc[1];
+     break;
+ 
+     case OP_THEN:
+     SLJIT_ASSERT(common->control_head_ptr != 0);
+-    if (!control_head_found)
++    if (recurse_check_bit(common, common->control_head_ptr))
+       {
+       shared_srcw[0] = common->control_head_ptr;
+       shared_count = 1;
+-      control_head_found = TRUE;
+       }
+     cc++;
+     break;
+@@ -2681,7 +2750,7 @@ while (cc < ccend)
+     default:
+     cc = next_opcode(common, cc);
+     SLJIT_ASSERT(cc != NULL);
+-    break;
++    continue;
+     }
+ 
+   if (type != recurse_copy_shared_to_global && type != recurse_copy_kept_shared_to_global)
+@@ -13262,7 +13331,7 @@ SLJIT_ASSERT(!(common->req_char_ptr != 0 && common->start_used_ptr != 0));
+ common->cbra_ptr = OVECTOR_START + (re->top_bracket + 1) * 2 * sizeof(sljit_sw);
+ 
+ total_length = ccend - common->start;
+-common->private_data_ptrs = (sljit_s32 *)SLJIT_MALLOC(total_length * (sizeof(sljit_s32) + (common->has_then ? 1 : 0)), allocator_data);
++common->private_data_ptrs = (sljit_s32*)SLJIT_MALLOC(total_length * (sizeof(sljit_s32) + (common->has_then ? 1 : 0)), allocator_data);
+ if (!common->private_data_ptrs)
+   {
+   SLJIT_FREE(common->optimized_cbracket, allocator_data);
+@@ -13304,6 +13373,7 @@ if (!compiler)
+ common->compiler = compiler;
+ 
+ /* Main pcre_jit_exec entry. */
++LJIT_ASSERT((private_data_size & (sizeof(sljit_sw) - 1)) == 0);
+ sljit_emit_enter(compiler, 0, SLJIT_ARG1(SW), 5, 5, 0, 0, private_data_size);
+ 
+ /* Register init. */
+@@ -13524,20 +13594,40 @@ common->fast_fail_end_ptr = 0;
+ common->currententry = common->entries;
+ common->local_quit_available = TRUE;
+ quit_label = common->quit_label;
+-while (common->currententry != NULL)
++if (common->currententry != NULL)
+   {
+-  /* Might add new entries. */
+-  compile_recurse(common);
+-  if (SLJIT_UNLIKELY(sljit_get_compiler_error(compiler)))
++  /* A free bit for each private data. */
++  common->recurse_bitset_size = ((private_data_size / (int)sizeof(sljit_sw)) + 7) >> 3;
++  SLJIT_ASSERT(common->recurse_bitset_size > 0);
++  common->recurse_bitset = (sljit_u8*)SLJIT_MALLOC(common->recurse_bitset_size, allocator_data);;
++
++  if (common->recurse_bitset != NULL)
++    {
++    do
++      {
++      /* Might add new entries. */
++      compile_recurse(common);
++      if (SLJIT_UNLIKELY(sljit_get_compiler_error(compiler)))
++        break;
++      flush_stubs(common);
++      common->currententry = common->currententry->next;
++      }
++    while (common->currententry != NULL);
++
++    SLJIT_FREE(common->recurse_bitset, allocator_data);
++    }
++
++  if (common->currententry != NULL)
+     {
++    /* The common->recurse_bitset has been freed. */
++    SLJIT_ASSERT(sljit_get_compiler_error(compiler) || common->recurse_bitset == NULL);
++
+     sljit_free_compiler(compiler);
+     SLJIT_FREE(common->optimized_cbracket, allocator_data);
+     SLJIT_FREE(common->private_data_ptrs, allocator_data);
+     PRIV(jit_free_rodata)(common->read_only_data_head, allocator_data);
+     return PCRE2_ERROR_NOMEMORY;
+     }
+-  flush_stubs(common);
+-  common->currententry = common->currententry->next;
+   }
+ common->local_quit_available = FALSE;
+ common->quit_label = quit_label;
+diff --git a/src/pcre2_jit_test.c b/src/pcre2_jit_test.c
+index 9df87fd..2f84834 100644
+--- a/src/pcre2_jit_test.c
++++ b/src/pcre2_jit_test.c
+@@ -746,6 +746,7 @@ static struct regression_test_case regression_test_cases[] = {
+ 	{ MU, A, 0, 0, "((?(R)a|(?1)){1,3}?)M", "aaaM" },
+ 	{ MU, A, 0, 0, "((.)(?:.|\\2(?1))){0}#(?1)#", "#aabbccdde# #aabbccddee#" },
+ 	{ MU, A, 0, 0, "((.)(?:\\2|\\2{4}b)){0}#(?:(?1))+#", "#aaaab# #aaaaab#" },
++	{ MU, A, 0, 0 | F_NOMATCH, "(?1)$((.|\\2xx){1,2})", "abc" },
+ 
+ 	/* 16 bit specific tests. */
+ 	{ CM, A, 0, 0 | F_FORCECONV, "\xc3\xa1", "\xc3\x81\xc3\xa1" },
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libpcre/libpcre2_10.34.bb b/meta/recipes-support/libpcre/libpcre2_10.34.bb
index 213b946a54..254badf6f6 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.34.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.34.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b1588d3bb4cb0e1f5a597d908f8c5b37"
 SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://CVE-2022-1586.patch \
+	    file://CVE-2022-1587.patch \
 "
 
 SRC_URI[md5sum] = "d280b62ded13f9ccf2fac16ee5286366"
-- 
2.25.1


