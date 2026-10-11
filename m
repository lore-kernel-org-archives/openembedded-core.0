Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841ABCA9ED8
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:40 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23453.1791708091328304466
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0XRJhWpc;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso780226f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708089; x=1792312889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IMtUr6QdYy46NyOdO6cO4WIrGcVkzBf4z6Wqq90h8VQ=;
        b=0XRJhWpcb1H/jdvD5QKi1nZOEVtcJh6p4Edd6ATDF5g3bWbNtcI7KJSd4f8FJhfYrB
         Q9Gkr9MxkPb9UVeFwxcZ1Ht09FRPWsdxE30XavYuJm10PWMIaBHyrABCi9FxQaASN2Ko
         ubi/eiOaN0/Zaa3uymLnC1TT+FIG2cm2L6TL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708089; x=1792312889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IMtUr6QdYy46NyOdO6cO4WIrGcVkzBf4z6Wqq90h8VQ=;
        b=lan5GXPxO/9G5FXkT36rLHrmLwGt+k5r3UlCz8CS/BhH/xWxIip31N9TDBETJ+NkwY
         1FPGbpxcIw+Vol5Wt8D7j/yH5vWnviaLUcry0P1UtvvfF2AwM4lxGYfqUZEcrQ5tdZjT
         wrfI/SM2gt0Mh9o+b/RBoOwArIW2npEVyBCPxx3/6Jfuk+IY14FdMOmTumYLVDVt1L2c
         bFu9SO68unGWPGusP3EUYgFIaNmJouXhgSS7PaPWERL8BUg8JYFmbLXsSJeZT9uHbdul
         T80h0wrA7baf1kNSc0NTnYDgS01GoRns/7ty4xv7aT3XYEVnPTT+AVp9hEbXsPUzSYqb
         BWww==
X-Gm-Message-State: AFq9FYKpLVyvznHNVLhX/csN8qFG5XJT3WOvDLWdvtWPMRqGCCN5xvC1
	UgiEhLUyCDm7JuxK0dSkeF10H9BGgH5BHc4urxjRPITxSqZhyRvqy5dqbcyAAUGT6+i7rh3u+kp
	ZIWvAc5o=
X-Gm-Gg: AYBFou29nJpIufzO/J8kzgFqpOSvdPzARPVWrET6YiKl9DiDqgwUpuZLEz0mJb0JJq2
	WX0i6WFs4bcxf1TpJRIiISmMW81Y+RCN+XmAPqEQ2h74EnuVJ3/1wE7OEW4GkeMTgEO0dQQKnuQ
	Bhxo11idzIAs9U7GF+h6eKwIPgQwXZH+1cgll7vQD9vCQqvkCFJwTMYBdauDmMMnJC6o9TvvOs3
	4GQ1G0bvf+Oyf8QLHTWU+TpwHKIRIuWXvQmotN7Rz9h/zeb6eFwUtfUyoYPPACmzMVEnLiiJi6L
	uwbppxHHaryZDwTSVnX8AAJ0Pu5Fq67zdteeEATVNy/DC68n/wDEe49xdRd/t8qHE+bxvEUCOEC
	LVolEtQcIBubxo4cjdZG4kfdYiaqNO0U7OpuK/0JKufRNbBl4VmprP/ThTgGHQrnDSAoN1UZaCp
	6Tz5Yr2Ay6IQ+JxizZELqP2X+Vvxwb+jmbLtnD5Ax9Drxr5dbHfkaoQ4HD4ue+GDMA4w+sosnFX
	clN0LEM5IXEV9HdynO2IWsK9kt5FKpD5XisoPLoZivt2EFX62N3M+46A49q5i3FFeTl5MYjbQ==
X-Received: by 2002:a05:6000:1787:b0:488:6561:b324 with SMTP id ffacd0b85a97d-48dba9bdb31mr10896965f8f.9.1791708089230;
        Sun, 11 Oct 2026 01:41:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 43/60] expat: patch CVE-2026-93990
Date: Sun, 11 Oct 2026 10:40:16 +0200
Message-ID: <15ef201a2b30e2513f949040fdc999299ddba77c.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247552

From: Peter Marko <peter.marko@siemens.com>

Pick patches per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-93990

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-93990-01.patch       | 191 ++++++++++
 .../expat/expat/CVE-2026-93990-02.patch       | 328 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |   2 +
 3 files changed, 521 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-93990-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-93990-02.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-93990-01.patch b/meta/recipes-core/expat/expat/CVE-2026-93990-01.patch
new file mode 100644
index 00000000000..fde01b916ad
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-93990-01.patch
@@ -0,0 +1,191 @@
+From 0cfd15bdf4b2c22d6b0df73610709dfb60921091 Mon Sep 17 00:00:00 2001
+From: Kartik Kenchi <netliomax25@gmail.com>
+Date: Tue, 23 Jun 2026 15:51:06 +0530
+Subject: [PATCH] lib: reject UTF-16 high surrogate not followed by a low
+ surrogate
+
+CVE: CVE-2026-93990
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/0cfd15bdf4b2c22d6b0df73610709dfb60921091]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmltok.c      | 53 ++++++++++++++++++++++++++++++++++++++++-------
+ lib/xmltok_impl.c |  4 ----
+ 2 files changed, 45 insertions(+), 12 deletions(-)
+
+diff --git a/lib/xmltok.c b/lib/xmltok.c
+index 8abb145e..5f4e78ec 100644
+--- a/lib/xmltok.c
++++ b/lib/xmltok.c
+@@ -232,6 +232,19 @@ struct normal_encoding {
+       /* isNmstrt2 */ NULL, /* isNmstrt3 */ NULL, /* isNmstrt4 */ NULL,        \
+       /* isInvalid2 */ NULL, /* isInvalid3 */ NULL, /* isInvalid4 */ NULL
+ 
++/* Like NULL_VTABLE but with a real isInvalid4 so the UTF-16 encodings reject a
++   high surrogate that is not followed by a low surrogate.  Only needed for the
++   XML_MIN_SIZE build, where the shared tokenizer dispatches through the vtable;
++   the regular build inlines the same check via IS_INVALID_CHAR. */
++#ifdef XML_MIN_SIZE
++#  define UTF16_NULL_VTABLE(E)                                                 \
++    /* isName2 */ NULL, /* isName3 */ NULL, /* isName4 */ NULL,                \
++        /* isNmstrt2 */ NULL, /* isNmstrt3 */ NULL, /* isNmstrt4 */ NULL,      \
++        /* isInvalid2 */ NULL, /* isInvalid3 */ NULL, E##isInvalid4
++#else
++#  define UTF16_NULL_VTABLE(E) NULL_VTABLE
++#endif
++
+ static int FASTCALL checkCharRefNumber(int result);
+ 
+ #include "xmltok_impl.h"
+@@ -749,6 +762,11 @@ DEFINE_UTF16_TO_UTF16(big2_)
+   UCS2_GET_NAMING(namePages, (unsigned char)p[1], (unsigned char)p[0])
+ #define LITTLE2_IS_NMSTRT_CHAR_MINBPC(p)                                       \
+   UCS2_GET_NAMING(nmstrtPages, (unsigned char)p[1], (unsigned char)p[0])
++/* A 4-byte UTF-16 character is a surrogate pair; byteType only reports BT_LEAD4
++   for a high surrogate, so the pair is invalid unless the second unit is a low
++   surrogate (U+DC00..U+DFFF, i.e. high byte 0xDC..0xDF). */
++#define LITTLE2_IS_INVALID_CHAR(p, n)                                          \
++  ((n) == 4 && ((unsigned char)(p)[3] & 0xFC) != 0xDC)
+ 
+ #ifdef XML_MIN_SIZE
+ 
+@@ -781,6 +799,12 @@ little2_isNmstrtMin(const ENCODING *enc, const char *p) {
+   return LITTLE2_IS_NMSTRT_CHAR_MINBPC(p);
+ }
+ 
++static int
++little2_isInvalid4(const ENCODING *enc, const char *p) {
++  UNUSED_P(enc);
++  return LITTLE2_IS_INVALID_CHAR(p, 4);
++}
++
+ #  undef VTABLE
+ #  define VTABLE VTABLE1, little2_toUtf8, little2_toUtf16
+ 
+@@ -797,6 +821,7 @@ little2_isNmstrtMin(const ENCODING *enc, const char *p) {
+ #  define IS_NAME_CHAR_MINBPC(enc, p) LITTLE2_IS_NAME_CHAR_MINBPC(p)
+ #  define IS_NMSTRT_CHAR(enc, p, n) (0)
+ #  define IS_NMSTRT_CHAR_MINBPC(enc, p) LITTLE2_IS_NMSTRT_CHAR_MINBPC(p)
++#  define IS_INVALID_CHAR(enc, p, n) LITTLE2_IS_INVALID_CHAR(p, n)
+ 
+ #  define XML_TOK_IMPL_C
+ #  include "xmltok_impl.c"
+@@ -828,7 +853,7 @@ static const struct normal_encoding little2_encoding_ns
+ #  include "asciitab.h"
+ #  include "latin1tab.h"
+        },
+-       STANDARD_VTABLE(little2_) NULL_VTABLE};
++       STANDARD_VTABLE(little2_) UTF16_NULL_VTABLE(little2_)};
+ 
+ #endif
+ 
+@@ -846,7 +871,7 @@ static const struct normal_encoding little2_encoding
+ #undef BT_COLON
+ #include "latin1tab.h"
+        },
+-       STANDARD_VTABLE(little2_) NULL_VTABLE};
++       STANDARD_VTABLE(little2_) UTF16_NULL_VTABLE(little2_)};
+ 
+ #if BYTEORDER != 4321
+ 
+@@ -858,7 +883,7 @@ static const struct normal_encoding internal_little2_encoding_ns
+ #    include "iasciitab.h"
+ #    include "latin1tab.h"
+        },
+-       STANDARD_VTABLE(little2_) NULL_VTABLE};
++       STANDARD_VTABLE(little2_) UTF16_NULL_VTABLE(little2_)};
+ 
+ #  endif
+ 
+@@ -870,7 +895,7 @@ static const struct normal_encoding internal_little2_encoding
+ #  undef BT_COLON
+ #  include "latin1tab.h"
+        },
+-       STANDARD_VTABLE(little2_) NULL_VTABLE};
++       STANDARD_VTABLE(little2_) UTF16_NULL_VTABLE(little2_)};
+ 
+ #endif
+ 
+@@ -882,6 +907,11 @@ static const struct normal_encoding internal_little2_encoding
+   UCS2_GET_NAMING(namePages, (unsigned char)p[0], (unsigned char)p[1])
+ #define BIG2_IS_NMSTRT_CHAR_MINBPC(p)                                          \
+   UCS2_GET_NAMING(nmstrtPages, (unsigned char)p[0], (unsigned char)p[1])
++/* A 4-byte UTF-16 character is a surrogate pair; byteType only reports BT_LEAD4
++   for a high surrogate, so the pair is invalid unless the second unit is a low
++   surrogate (U+DC00..U+DFFF, i.e. high byte 0xDC..0xDF). */
++#define BIG2_IS_INVALID_CHAR(p, n)                                             \
++  ((n) == 4 && ((unsigned char)(p)[2] & 0xFC) != 0xDC)
+ 
+ #ifdef XML_MIN_SIZE
+ 
+@@ -914,6 +944,12 @@ big2_isNmstrtMin(const ENCODING *enc, const char *p) {
+   return BIG2_IS_NMSTRT_CHAR_MINBPC(p);
+ }
+ 
++static int
++big2_isInvalid4(const ENCODING *enc, const char *p) {
++  UNUSED_P(enc);
++  return BIG2_IS_INVALID_CHAR(p, 4);
++}
++
+ #  undef VTABLE
+ #  define VTABLE VTABLE1, big2_toUtf8, big2_toUtf16
+ 
+@@ -930,6 +966,7 @@ big2_isNmstrtMin(const ENCODING *enc, const char *p) {
+ #  define IS_NAME_CHAR_MINBPC(enc, p) BIG2_IS_NAME_CHAR_MINBPC(p)
+ #  define IS_NMSTRT_CHAR(enc, p, n) (0)
+ #  define IS_NMSTRT_CHAR_MINBPC(enc, p) BIG2_IS_NMSTRT_CHAR_MINBPC(p)
++#  define IS_INVALID_CHAR(enc, p, n) BIG2_IS_INVALID_CHAR(p, n)
+ 
+ #  define XML_TOK_IMPL_C
+ #  include "xmltok_impl.c"
+@@ -961,7 +998,7 @@ static const struct normal_encoding big2_encoding_ns
+ #  include "asciitab.h"
+ #  include "latin1tab.h"
+        },
+-       STANDARD_VTABLE(big2_) NULL_VTABLE};
++       STANDARD_VTABLE(big2_) UTF16_NULL_VTABLE(big2_)};
+ 
+ #endif
+ 
+@@ -979,7 +1016,7 @@ static const struct normal_encoding big2_encoding
+ #undef BT_COLON
+ #include "latin1tab.h"
+        },
+-       STANDARD_VTABLE(big2_) NULL_VTABLE};
++       STANDARD_VTABLE(big2_) UTF16_NULL_VTABLE(big2_)};
+ 
+ #if BYTEORDER != 1234
+ 
+@@ -991,7 +1028,7 @@ static const struct normal_encoding internal_big2_encoding_ns
+ #    include "iasciitab.h"
+ #    include "latin1tab.h"
+        },
+-       STANDARD_VTABLE(big2_) NULL_VTABLE};
++       STANDARD_VTABLE(big2_) UTF16_NULL_VTABLE(big2_)};
+ 
+ #  endif
+ 
+@@ -1003,7 +1040,7 @@ static const struct normal_encoding internal_big2_encoding
+ #  undef BT_COLON
+ #  include "latin1tab.h"
+        },
+-       STANDARD_VTABLE(big2_) NULL_VTABLE};
++       STANDARD_VTABLE(big2_) UTF16_NULL_VTABLE(big2_)};
+ 
+ #endif
+ 
+diff --git a/lib/xmltok_impl.c b/lib/xmltok_impl.c
+index b7a9b5eb..3cc9e5ab 100644
+--- a/lib/xmltok_impl.c
++++ b/lib/xmltok_impl.c
+@@ -44,10 +44,6 @@
+ 
+ #ifdef XML_TOK_IMPL_C
+ 
+-#  ifndef IS_INVALID_CHAR // i.e. for UTF-16 and XML_MIN_SIZE not defined
+-#    define IS_INVALID_CHAR(enc, ptr, n) (0)
+-#  endif
+-
+ #  define INVALID_LEAD_CASE(n, ptr, nextTokPtr)                                \
+   case BT_LEAD##n:                                                             \
+     if (end - ptr < n)                                                         \
diff --git a/meta/recipes-core/expat/expat/CVE-2026-93990-02.patch b/meta/recipes-core/expat/expat/CVE-2026-93990-02.patch
new file mode 100644
index 00000000000..25e38e39565
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-93990-02.patch
@@ -0,0 +1,328 @@
+From 28fcfba540f6933aa8904a1514c4811713d2ab72 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 17 Sep 2026 15:12:43 +0200
+Subject: [PATCH] tests: Cover UTF-16 decoding of surrogates
+
+Co-authored-by: Kartik Kenchi <netliomax25@gmail.com>
+
+CVE: CVE-2026-93990
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/28fcfba540f6933aa8904a1514c4811713d2ab72]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/basic_tests.c | 296 ++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 296 insertions(+)
+
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index dd0494ce..92172a27 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -1845,6 +1845,301 @@ START_TEST(test_utf16_bad_surrogate_pair) {
+ }
+ END_TEST
+ 
++// Helper that creates a UTF-16LE copy of UTF-16BE literal input and vice versa
++static char *
++utf16_dup_flipped(const char *text, size_t lenBytes) {
++  assert_true(lenBytes < SIZE_MAX);
++  assert_true(lenBytes % 2 == 0);
++  char *const buffer = malloc(lenBytes + 1);
++  assert_true(buffer != NULL);
++
++  for (size_t i = 0; i < lenBytes; i++) {
++    // This maps 0 -> 1, 1 -> 0, 2 -> 3, 3 -> 2, 4 -> 5, ..
++    size_t j = i + ((i % 2 == 0) ? +1 : -1);
++    assert_true(j < lenBytes);
++    buffer[j] = text[i];
++  }
++
++  buffer[lenBytes] = '\0';
++
++  return buffer;
++}
++
++/* Tests that invalid combinations of surrogates are detected when decoding
++   UTF-16, both little-endian and big-endian.
++   Previously, a high surrogate not followed by a low surrogate slipped
++   through.  Without validation the high would consume the next
++   code unit as a fake low, hiding e.g. a following '<' from the
++   tokenizer. */
++START_TEST(test_utf16_surrogate_pairs) {
++  struct TestCase {
++    const char *idea;
++    const char *content;
++    bool expectedSuccess;
++  };
++
++  struct TestCase testCases[] = {
++      // Group {smallest high - 1}{*}
++      {"{smallest high - 1}{smallest high - 1}",
++       "\0<\0a\0>"
++       "\xD7\xFF"
++       "\xD7\xFF"
++       "\0<\0/\0a\0>",
++       true},
++      {"{smallest high - 1}{smallest high}",
++       "\0<\0a\0>"
++       "\xD7\xFF"
++       "\xD8\x00"
++       "\0<\0/\0a\0>",
++       false},
++      {"{smallest high - 1}{largest high}",
++       "\0<\0a\0>"
++       "\xD7\xFF"
++       "\xDB\xFF"
++       "\0<\0/\0a\0>",
++       false},
++      {"{smallest high - 1}{smallest low}",
++       "\0<\0a\0>"
++       "\xD7\xFF"
++       "\xDC\x00"
++       "\0<\0/\0a\0>",
++       false},
++      {"{smallest high - 1}{largest low}",
++       "\0<\0a\0>"
++       "\xD7\xFF"
++       "\xDF\xFF"
++       "\0<\0/\0a\0>",
++       false},
++      {"{smallest high - 1}{largest low + 1}",
++       "\0<\0a\0>"
++       "\xD7\xFF"
++       "\xE0\x00"
++       "\0<\0/\0a\0>",
++       true},
++      // Group {smallest high}{*}
++      {"{smallest high}{smallest high - 1}",
++       "\0<\0a\0>"
++       "\xD8\x00"
++       "\xD7\xFF"
++       "\0<\0/\0a\0>",
++       false},
++      {"{smallest high}{smallest high}",
++       "\0<\0a\0>"
++       "\xD8\x00"
++       "\xD8\x00"
++       "\0<\0/\0a\0>",
++       false},
++      {"{smallest high}{largest high}",
++       "\0<\0a\0>"
++       "\xD8\x00"
++       "\xDB\xFF"
++       "\0<\0/\0a\0>",
++       false},
++      {"{smallest high}{smallest low}",
++       "\0<\0a\0>"
++       "\xD8\x00"
++       "\xDC\x00"
++       "\0<\0/\0a\0>",
++       true},
++      {"{smallest high}{largest low}",
++       "\0<\0a\0>"
++       "\xD8\x00"
++       "\xDF\xFF"
++       "\0<\0/\0a\0>",
++       true},
++      {"{smallest high}{largest low + 1}",
++       "\0<\0a\0>"
++       "\xD8\x00"
++       "\xE0\x00"
++       "\0<\0/\0a\0>",
++       false},
++      // Group {largest high}{*}
++      {"{largest high}{smallest high - 1}",
++       "\0<\0a\0>"
++       "\xDB\xFF"
++       "\xD7\xFF"
++       "\0<\0/\0a\0>",
++       false},
++      {"{largest high}{smallest high}",
++       "\0<\0a\0>"
++       "\xDB\xFF"
++       "\xD8\x00"
++       "\0<\0/\0a\0>",
++       false},
++      {"{largest high}{largest high}",
++       "\0<\0a\0>"
++       "\xDB\xFF"
++       "\xDB\xFF"
++       "\0<\0/\0a\0>",
++       false},
++      {"{largest high}{smallest low}",
++       "\0<\0a\0>"
++       "\xDB\xFF"
++       "\xDC\x00"
++       "\0<\0/\0a\0>",
++       true},
++      {"{largest high}{largest low}",
++       "\0<\0a\0>"
++       "\xDB\xFF"
++       "\xDF\xFF"
++       "\0<\0/\0a\0>",
++       true},
++      {"{largest high}{largest low + 1}",
++       "\0<\0a\0>"
++       "\xDB\xFF"
++       "\xE0\x00"
++       "\0<\0/\0a\0>",
++       false},
++      // Group {smallest low}{*}
++      {"{smallest low}{smallest high - 1}",
++       "\0<\0a\0>"
++       "\xDC\x00"
++       "\xD7\xFF"
++       "\0<\0/\0a\0>",
++       false},
++      {"{smallest low}{smallest high}",
++       "\0<\0a\0>"
++       "\xDC\x00"
++       "\xD8\x00"
++       "\0<\0/\0a\0>",
++       false},
++      {"{smallest low}{largest high}",
++       "\0<\0a\0>"
++       "\xDC\x00"
++       "\xDB\xFF"
++       "\0<\0/\0a\0>",
++       false},
++      {"{smallest low}{smallest low}",
++       "\0<\0a\0>"
++       "\xDC\x00"
++       "\xDC\x00"
++       "\0<\0/\0a\0>",
++       false},
++      {"{smallest low}{largest low}",
++       "\0<\0a\0>"
++       "\xDC\x00"
++       "\xDF\xFF"
++       "\0<\0/\0a\0>",
++       false},
++      {"{smallest low}{largest low + 1}",
++       "\0<\0a\0>"
++       "\xDC\x00"
++       "\xE0\x00"
++       "\0<\0/\0a\0>",
++       false},
++      // Group {largest low}{*}
++      {"{largest low}{smallest high - 1}",
++       "\0<\0a\0>"
++       "\xDF\xFF"
++       "\xD7\xFF"
++       "\0<\0/\0a\0>",
++       false},
++      {"{largest low}{smallest high}",
++       "\0<\0a\0>"
++       "\xDF\xFF"
++       "\xD8\x00"
++       "\0<\0/\0a\0>",
++       false},
++      {"{largest low}{largest high}",
++       "\0<\0a\0>"
++       "\xDF\xFF"
++       "\xDB\xFF"
++       "\0<\0/\0a\0>",
++       false},
++      {"{largest low}{smallest low}",
++       "\0<\0a\0>"
++       "\xDF\xFF"
++       "\xDC\x00"
++       "\0<\0/\0a\0>",
++       false},
++      {"{largest low}{largest low}",
++       "\0<\0a\0>"
++       "\xDF\xFF"
++       "\xDF\xFF"
++       "\0<\0/\0a\0>",
++       false},
++      {"{largest low}{largest low + 1}",
++       "\0<\0a\0>"
++       "\xDF\xFF"
++       "\xE0\x00"
++       "\0<\0/\0a\0>",
++       false},
++      // Group {largest low + 1}{*}
++      {"{largest low + 1}{smallest high - 1}",
++       "\0<\0a\0>"
++       "\xE0\x00"
++       "\xD7\xFF"
++       "\0<\0/\0a\0>",
++       true},
++      {"{largest low + 1}{smallest high}",
++       "\0<\0a\0>"
++       "\xE0\x00"
++       "\xD8\x00"
++       "\0<\0/\0a\0>",
++       false},
++      {"{largest low + 1}{largest high}",
++       "\0<\0a\0>"
++       "\xE0\x00"
++       "\xDB\xFF"
++       "\0<\0/\0a\0>",
++       false},
++      {"{largest low + 1}{smallest low}",
++       "\0<\0a\0>"
++       "\xE0\x00"
++       "\xDC\x00"
++       "\0<\0/\0a\0>",
++       false},
++      {"{largest low + 1}{largest low}",
++       "\0<\0a\0>"
++       "\xE0\x00"
++       "\xDF\xFF"
++       "\0<\0/\0a\0>",
++       false},
++      {"{largest low + 1}{largest low + 1}",
++       "\0<\0a\0>"
++       "\xE0\x00"
++       "\xE0\x00"
++       "\0<\0/\0a\0>",
++       true},
++  };
++
++  for (size_t i = 0; i < sizeof(testCases) / sizeof(testCases[0]); i++) {
++    set_subtest("%s", testCases[i].idea);
++
++    const int lenBytes = /*<a>*/ 6 + /*first*/ 2 + /*second*/ 2 + /*</a>*/ 8;
++    const bool expectedSuccess = testCases[i].expectedSuccess;
++    const enum XML_Status expectedStatus
++        = (expectedSuccess ? XML_STATUS_OK : XML_STATUS_ERROR);
++
++    const char *const bigEndian = testCases[i].content;
++    char *const littleEndian = utf16_dup_flipped(bigEndian, lenBytes);
++    assert_true(littleEndian != NULL);
++    const char *endianCases[] = {bigEndian, littleEndian};
++
++    for (size_t j = 0; j < sizeof(endianCases) / sizeof(endianCases[0]); j++) {
++      const char *text = endianCases[j];
++
++      assert_true(text[lenBytes] == '\0'); // self-test
++      assert_true((text[0] == '\0')
++                  != (text[lenBytes - 1] == '\0')); // self-test
++
++      XML_Parser parser = XML_ParserCreate(NULL);
++      assert_true(parser != NULL);
++
++      assert_true(_XML_Parse_SINGLE_BYTES(parser, text, lenBytes, XML_TRUE)
++                  == expectedStatus);
++      if (! expectedSuccess) {
++        assert_true(XML_GetErrorCode(parser) == XML_ERROR_INVALID_TOKEN);
++      }
++
++      XML_ParserFree(parser);
++    }
++
++    free(littleEndian);
++  }
++}
++END_TEST
++
+ START_TEST(test_bad_cdata) {
+   struct CaseData {
+     const char *text;
+@@ -6711,6 +7006,7 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test(tc_basic, test_long_cdata_utf16);
+   tcase_add_test(tc_basic, test_multichar_cdata_utf16);
+   tcase_add_test(tc_basic, test_utf16_bad_surrogate_pair);
++  tcase_add_test(tc_basic, test_utf16_surrogate_pairs);
+   tcase_add_test(tc_basic, test_bad_cdata);
+   tcase_add_test(tc_basic, test_bad_cdata_utf16);
+   tcase_add_test(tc_basic, test_stop_parser_between_cdata_calls);
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/expat/expat_2.8.3.bb
index c9a1c9b18e3..6d08a3fd94b 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -16,6 +16,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-76956.patch \
            file://CVE-2026-76957-01.patch \
            file://CVE-2026-76957-02.patch \
+           file://CVE-2026-93990-01.patch \
+           file://CVE-2026-93990-02.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

