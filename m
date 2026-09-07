Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E05C79FB4
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:04 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35214.1788788153856218063
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XnAFjnOD;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482e257a23aso2491246f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788152; x=1789392952; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WA2w4IIXqEz3QXfiAw6TX2Sn4Bvw660heYrQsptOkl8=;
        b=XnAFjnODgrtxGOYOn2Yrr0yG6jlJIerLs//dIM5OeP7gUlf4OuJeoACrz46B0OfZIz
         fP5r35WCSI8AldmHdeqp8vuArGRqzby8c141GU1qJ56HwgukvjjoyIsSfsUDujK1BPGw
         5xPAiPWQlf6uRUX7WIwYFisNaPvwDcthuwkD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788152; x=1789392952;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WA2w4IIXqEz3QXfiAw6TX2Sn4Bvw660heYrQsptOkl8=;
        b=Fy8pHZ3R7AP1stYEdm0lXTkeqz/dUIWV/J6/mfss1kb/eMbkYJFxmdNs1YUzZEwTc/
         Ons1pQxu0klOmEiUh3QSsb7D4RtUFN4bQMMzG2KV6gScRi/ueVpYuhB6fFqvsVNTGWix
         lx41JI+qOojYGh9k7OOcHVq1j3MTzI+7WGmyFGGXRYu3WAqBH5+uohk4+ceTxyN7Tebj
         IhRSffCdaNNCZoXiWJi5IAVxRxv89mBHoZVA/C7h2YNQbQxli20UOyvWv6R35VqpGpvF
         B2die3C6Q9USGlyDHB9SrWQgePid7AkiiAs3bfcuClH4hK+EmL9GUtKkG9XrAaLLSMyd
         lw0A==
X-Gm-Message-State: AFuF++ks7uBvKAANKWhtma9uAA7eviiuDpapnC+mSxJAMEyt8Iv5/3Dp
	mVMXd8OZyYa2unTiFKCxDEAvRSXjO4v0/EGgCh7nKT5R2A7/VGree9L2raE1v8xLgY21NCldm7B
	gEVEvnFw=
X-Gm-Gg: AYBFou2L656J1C7DtbBbIapZT/Ft6a6wu257YBBoFRd20/9YS9XowaRag4BuF/9hk1h
	GIM6K+3LtwN/xeprchhcsmjRKk7vdoxWurLIVXPCtpFZhpl/5lrqgF5HVa+frwipEpqRhzqtGWP
	HVOiOzgeT7AYr/aMcew5dIHUJDtBAzPuSEvTvansyIutx6iYoKVL/6d/mG2KEnZv9fOBm5ni8VZ
	ajW40ZgS0UhgqvYRBly7lj+KtJGPz3n7g7pjwt8rYeFQrPUDhTMDd4VMOa6KpMrhXRjON9c5gGT
	QqPX18ZPciqLK3V+S4E0gxqMkA03kTlVOTyzr5aC9b6NOkpUy9zfbDCu5oYj/zlQ5dMLt3j2Q0L
	bd9C8dLn4mNf/Xqm+oVVKjfmTAlExrb6CthKGFXkBR7NLVpTv0SQbP9FEmZT9lwiCceExChsSfo
	93lA3lYoNBn1qnxZ6QMk3pJOyzDEH0egLAKFcFmMuCfeM7BW8OmNr19N8g8j2UepiysIRvgeY0A
	qLiZrsiftSf7bxRWeYSeBzEI19xgcV8v2KSk/hhKenNipx7H6Rz3mc4Vux9gIM+
X-Received: by 2002:a05:6000:4010:b0:485:9393:76d5 with SMTP id ffacd0b85a97d-48593937803mr11916473f8f.18.1788788151846;
        Mon, 07 Sep 2026 06:35:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.35.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:35:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/35] python3-idna: Fix CVE-2026-45409
Date: Mon,  7 Sep 2026 15:34:58 +0200
Message-ID: <09773d9d1b44dfe868913b6bb142a728529f62cb.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245260

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the complete upstream fix chain for
CVE-2026-45409. Commit [1] introduces early domain-length rejection
required by [2]. Commit [2] is the v3.14 fix identified by [5], and
commit [3] extends the protection to per-label conversions and codec
support to complete the v3.15 fix described in [4].

[1] https://github.com/kjd/idna/commit/c0dda4501df5
[2] https://github.com/kjd/idna/commit/628fef84d3ed
[3] https://github.com/kjd/idna/commit/e1cb465b6376
[4] https://github.com/kjd/idna/security/advisories/GHSA-65pc-fj4g-8rjx
[5] https://security-tracker.debian.org/tracker/CVE-2026-45409

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-idna/CVE-2026-45409_p1.patch      | 75 +++++++++++++++++++
 .../python3-idna/CVE-2026-45409_p2.patch      | 48 ++++++++++++
 .../python3-idna/CVE-2026-45409_p3.patch      | 72 ++++++++++++++++++
 .../python/python3-idna_3.7.bb                |  5 ++
 4 files changed, 200 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p3.patch

diff --git a/meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p1.patch b/meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p1.patch
new file mode 100644
index 00000000000..02a8090b841
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p1.patch
@@ -0,0 +1,75 @@
+From b34cd8399981324b361ae4f2b8e0eb77444ae0e3 Mon Sep 17 00:00:00 2001
+From: Kim Davies <kim@cynosure.com.au>
+Date: Sun, 10 May 2026 08:47:22 -0700
+Subject: [PATCH 1/3] Merge commit from fork
+
+CVE: CVE-2026-45409
+Upstream-Status: Backport [https://github.com/kjd/idna/commit/c0dda4501df5d91c3181ce6f962dc5de74e82cc1]
+
+Backport Changes:
+- Omit the HISTORY.rst hunk because it documents the upstream 3.14
+  release and is not applicable to the Scarthgap 3.7 source.
+
+(cherry picked from commit c0dda4501df5d91c3181ce6f962dc5de74e82cc1)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ idna/core.py       | 14 ++++++++++++++
+ tests/test_idna.py | 13 +++++++++++++
+ 2 files changed, 27 insertions(+)
+
+diff --git a/idna/core.py b/idna/core.py
+index 0dae61a..a549326 100644
+--- a/idna/core.py
++++ b/idna/core.py
+@@ -340,6 +340,15 @@ def encode(s: Union[str, bytes, bytearray], strict: bool = False, uts46: bool =
+             raise IDNAError('should pass a unicode string to the function rather than a byte string.')
+     if uts46:
+         s = uts46_remap(s, std3_rules, transitional)
++
++    # Reject inputs that exceed the maximum DNS domain length up-front.
++    # Each codepoint in a U-label contributes at least one octet to its
++    # A-label form, so any input longer than the domain limit cannot
++    # produce a valid A-domain. Short-circuiting here prevents per-label
++    # validation from being driven into quadratic time
++    if len(s) > 254:
++        raise IDNAError("Domain too long")
++
+     trailing_dot = False
+     result = []
+     if strict:
+@@ -373,6 +382,11 @@ def decode(s: Union[str, bytes, bytearray], strict: bool = False, uts46: bool =
+         raise IDNAError('Invalid ASCII in A-label')
+     if uts46:
+         s = uts46_remap(s, std3_rules, False)
++    # See encode() for rationale; the same bound applies because every
++    # legal A-domain is at most 254 octets and every codepoint of a
++    # legal U-domain contributes at least one octet to its A-form.
++    if len(s) > 254:
++        raise IDNAError("Domain too long")
+     trailing_dot = False
+     result = []
+     if not strict:
+diff --git a/tests/test_idna.py b/tests/test_idna.py
+index 81afb32..5001b48 100755
+--- a/tests/test_idna.py
++++ b/tests/test_idna.py
+@@ -78,6 +78,19 @@ class IDNATests(unittest.TestCase):
+         self.assertFalse(idna.valid_label_length('a' * 64))
+         self.assertRaises(idna.IDNAError, idna.encode, 'a' * 64)
+ 
++    def test_oversized_input_rejected_promptly(self):
++        # GHSA-65pc-fj4g-8rjx: encode/decode must reject inputs that
++        # exceed the maximum DNS domain length before per-codepoint
++        # validation runs, so labels dominated by CONTEXTO codepoints
++        # cannot drive validation into quadratic time.
++        import time
++
++        for payload in ("٠" * 8000, "・" * 8000 + "漢"):
++            start = time.perf_counter()
++            self.assertRaises(idna.IDNAError, idna.encode, payload)
++            self.assertRaises(idna.IDNAError, idna.decode, payload)
++            self.assertLess(time.perf_counter() - start, 1.0)
++
+     def test_check_bidi(self):
+ 
+         l = '\u0061'
diff --git a/meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p2.patch b/meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p2.patch
new file mode 100644
index 00000000000..a79e1e9c203
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p2.patch
@@ -0,0 +1,48 @@
+From fabb538f1885a135e48a60de2e3c656d965e861d Mon Sep 17 00:00:00 2001
+From: Kim Davies <kim@cynosure.com.au>
+Date: Sun, 10 May 2026 12:44:47 -0700
+Subject: [PATCH 2/3] Use valid_string_length() for early oversized-input check
+
+CVE: CVE-2026-45409
+Upstream-Status: Backport [https://github.com/kjd/idna/commit/628fef84d3eda59321c21127e73dcd873db23ead]
+
+(cherry picked from commit 628fef84d3eda59321c21127e73dcd873db23ead)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ idna/core.py | 16 ++++++----------
+ 1 file changed, 6 insertions(+), 10 deletions(-)
+
+diff --git a/idna/core.py b/idna/core.py
+index a549326..4a9fc75 100644
+--- a/idna/core.py
++++ b/idna/core.py
+@@ -341,12 +341,9 @@ def encode(s: Union[str, bytes, bytearray], strict: bool = False, uts46: bool =
+     if uts46:
+         s = uts46_remap(s, std3_rules, transitional)
+ 
+-    # Reject inputs that exceed the maximum DNS domain length up-front.
+-    # Each codepoint in a U-label contributes at least one octet to its
+-    # A-label form, so any input longer than the domain limit cannot
+-    # produce a valid A-domain. Short-circuiting here prevents per-label
+-    # validation from being driven into quadratic time
+-    if len(s) > 254:
++    # Reject inputs that exceed the maximum DNS domain length up-front
++    # to avoid expensive computation on long inputs.
++    if not valid_string_length(s, trailing_dot=True):
+         raise IDNAError("Domain too long")
+ 
+     trailing_dot = False
+@@ -382,10 +379,9 @@ def decode(s: Union[str, bytes, bytearray], strict: bool = False, uts46: bool =
+         raise IDNAError('Invalid ASCII in A-label')
+     if uts46:
+         s = uts46_remap(s, std3_rules, False)
+-    # See encode() for rationale; the same bound applies because every
+-    # legal A-domain is at most 254 octets and every codepoint of a
+-    # legal U-domain contributes at least one octet to its A-form.
+-    if len(s) > 254:
++    # Reject inputs that exceed the maximum DNS domain length up-front
++    # to avoid expensive computation on long inputs.
++    if not valid_string_length(s, trailing_dot=True):
+         raise IDNAError("Domain too long")
+     trailing_dot = False
+     result = []
diff --git a/meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p3.patch b/meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p3.patch
new file mode 100644
index 00000000000..2ebbd5c13de
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p3.patch
@@ -0,0 +1,72 @@
+From 22acbaae97c3698005e69555eb4ebccc168b2fff Mon Sep 17 00:00:00 2001
+From: metsw24-max <metsw24@gmail.com>
+Date: Mon, 11 May 2026 20:59:30 +0530
+Subject: [PATCH 3/3] Enforce early length limits in check_label
+
+CVE: CVE-2026-45409
+Upstream-Status: Backport [https://github.com/kjd/idna/commit/e1cb465b6376f33306a26f467d197edbcd01c4b9]
+
+(cherry picked from commit e1cb465b6376f33306a26f467d197edbcd01c4b9)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ idna/core.py       | 11 +++++++++++
+ tests/test_idna.py | 24 ++++++++++++++++++++++++
+ 2 files changed, 35 insertions(+)
+
+diff --git a/idna/core.py b/idna/core.py
+index 4a9fc75..26bb9fa 100644
+--- a/idna/core.py
++++ b/idna/core.py
+@@ -230,6 +230,17 @@ def check_label(label: Union[str, bytes, bytearray]) -> None:
+         label = label.decode('utf-8')
+     if len(label) == 0:
+         raise IDNAError('Empty Label')
++    # Reject oversized labels before per-codepoint validation runs.
++    # CONTEXTJ/CONTEXTO checks scan the whole label per codepoint, so an
++    # uncapped label drives validation into quadratic time
++    # (GHSA-65pc-fj4g-8rjx / CVE-2024-3651). encode()/decode() cap the
++    # whole-domain length; this cap protects direct callers of
++    # alabel/ulabel/check_label and the idna2008 incremental codec.
++    # Use the whole-domain bound rather than the per-label DNS bound so
++    # that UTS #46 lenient decoding of labels longer than 63 chars is
++    # preserved.
++    if not valid_string_length(label, trailing_dot=True):
++        raise IDNAError("Label too long")
+ 
+     check_nfc(label)
+     check_hyphen_ok(label)
+diff --git a/tests/test_idna.py b/tests/test_idna.py
+index 5001b48..2dc0892 100755
+--- a/tests/test_idna.py
++++ b/tests/test_idna.py
+@@ -91,6 +91,30 @@ class IDNATests(unittest.TestCase):
+             self.assertRaises(idna.IDNAError, idna.decode, payload)
+             self.assertLess(time.perf_counter() - start, 1.0)
+ 
++    def test_oversized_label_rejected_promptly(self):
++        # The whole-domain cap in encode()/decode() does not cover direct
++        # callers of alabel/ulabel/check_label, nor the idna2008
++        # incremental codec which calls alabel/ulabel per label. Without a
++        # per-label cap, a single oversized CONTEXTO-heavy label still
++        # drives validation into quadratic time.
++        import codecs
++        import time
++
++        import idna.codec  # noqa: F401  (register the idna2008 codec)
++
++        payload = "・" * 8000 + "漢"
++        start = time.perf_counter()
++        self.assertRaises(idna.IDNAError, idna.check_label, payload)
++        self.assertRaises(idna.IDNAError, idna.alabel, payload)
++        self.assertRaises(idna.IDNAError, idna.ulabel, payload)
++        self.assertRaises(
++            idna.IDNAError,
++            codecs.getincrementalencoder("idna2008")().encode,
++            payload,
++            True,
++        )
++        self.assertLess(time.perf_counter() - start, 1.0)
++
+     def test_check_bidi(self):
+ 
+         l = '\u0061'
diff --git a/meta/recipes-devtools/python/python3-idna_3.7.bb b/meta/recipes-devtools/python/python3-idna_3.7.bb
index e4213be5dfc..f8ca3df4f5f 100644
--- a/meta/recipes-devtools/python/python3-idna_3.7.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.7.bb
@@ -3,6 +3,11 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=204c0612e40a4dd46012a78d02c80fb1"
 
+SRC_URI += " \
+    file://CVE-2026-45409_p1.patch \
+    file://CVE-2026-45409_p2.patch \
+    file://CVE-2026-45409_p3.patch \
+"
 SRC_URI[sha256sum] = "028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc"
 
 CVE_PRODUCT = "kjd:idna kjd:internationalized_domain_names_in_applications"

