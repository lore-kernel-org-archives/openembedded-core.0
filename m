Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2ABC79FA8
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:37 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2598.1788641131209828790
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=n5/95yRT;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4858c1c4b4eso1169224f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641129; x=1789245929; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GwECAu0RkEXnL/dgGAGcF9OflepRBoBMHwCmrY2sa4E=;
        b=n5/95yRTJAnU5ugaiWTg3i+CAftV3lKHsqmErDuZOjYMjeuP4gXr9k8hkYFet/f3h6
         M7MP+Np6r/7bZQHDjxAboBuAVIrUxW45KOGSlZZbR8OtxAGyYgf6S9g5iVF+oaFRrgOO
         z3TTPYn/pbKI3TxrZMTA7C9kZO4E0gYpdFdF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641129; x=1789245929;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwECAu0RkEXnL/dgGAGcF9OflepRBoBMHwCmrY2sa4E=;
        b=G3p1iYrKkUlwt7m4nFnKncaaEV2NpDiX/LUFxogTSoN3ZUnKpqcrmfbVVyYP8kdREc
         5SCpN1zUWSwZsvaJ17hK5OUrawjK3Mp+R+Kgxx7YjimWYWL9OOU9qyWjESTfABwuKYxx
         IwAiwcOCHRn/a51V9E7g/AUKynVdjHxzEXEWdFdDM1CbO9dr/96EPPtV80cL4ZlqCdFC
         GMkpyKQP15/iM7ItEqGgtDm8Fj7V1uWLD3KG8tB7TM5Zy0O4/6PUPqmURmczWaA2NyqT
         3SZo9L8GivSX/6+oM6UmJpmKBKgBoFZFDaH5EDEW3U/pRbkJplbwvcfW8yCHjVFVAML9
         Bogw==
X-Gm-Message-State: AFuF++mVqejQ8vpV4+8DGnXSV9qMe3i2YB3O/KNlYmX+m5sxyK4MWRDO
	QyU47OgPoDFISOpsW/CROqj9iOX4bMLaC6gb46NlS0lMwED0eHWxoYVUtkKvnPNw8T7mf7+Nwns
	yuLD/3BA=
X-Gm-Gg: AYBFou0accwlpkHGX87zNRaHt8OnZ4dnC9VqYmMtN0ToS57y00AIStnbyTNP9qDdOoi
	bBgUjGaTTPp/a+5f6KPG6xvIBK6OBC6oWcgMgGe3Z2Rm77+xnKOk4t7k6Rbj33O5jOx93rRjCnT
	PI1rm4ksLLwL0hiAelMP/Z1QzmMdE6Xwg7BwPYYMTaAO4ZwI4N02rbSh2DMkw0xSL0fC4FT2V3Z
	Tw7okFBfm5xi/Dze64RyGurIr2dc9cc5r8ZCGGPzjXHYn1FHAYhrsHZyNxlCL4WKtAo558zn0YQ
	vPa0k8Yp4E6btSZACl7aSw2hgYjna2Xi8mmChBfnXuCkVYVSxYuVkcMELFR28us70kIlecYoY/u
	LCB+R3DdYJCcNdNe84gGeCH8Uxi72338OdEp10n8V/dUNaf55XYN9z86MHrN6GRQDW4OjTRj6bD
	C+D7KwY/xGjo60Tj8Vifyw5TVUe5U9huUQASJQ8n9B226yu1PEW5LX/hebWLVefB51fbqmlAGtA
	Bhm+aP8szVO/OqkTApyNJL5lJzyKn8pQYvpVMscolXWRFIUgeck8iwAZZb8ZmNKyKM=
X-Received: by 2002:adf:e198:0:b0:485:8a46:b3b8 with SMTP id ffacd0b85a97d-4858a46b5e5mr14218687f8f.32.1788641129319;
        Sat, 05 Sep 2026 13:45:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 33/40] python3-idna: Fix CVE-2026-45409
Date: Sat,  5 Sep 2026 22:44:34 +0200
Message-ID: <2438f1d257581e9841475cd108c7a6957cd201e8.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245185

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream 3.15 backport for
CVE-2026-45409. The upstream fix commit series is referenced
in [1], and the public CVE advisory is referenced in [2]. The
individual backported commit links are recorded in the embedded
patch headers.

Backport Changes:
- Omitted the first commit's HISTORY.rst release entry because it
  conflicts with the 3.11 history and is not required for the fix.

[1] https://github.com/kjd/idna/compare/v3.13...v3.15
[2] https://github.com/advisories/GHSA-65pc-fj4g-8rjx

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-idna/CVE-2026-45409_p1.patch      | 75 +++++++++++++++++++
 .../python3-idna/CVE-2026-45409_p2.patch      | 48 ++++++++++++
 .../python3-idna/CVE-2026-45409_p3.patch      | 72 ++++++++++++++++++
 .../python/python3-idna_3.11.bb               |  4 +
 4 files changed, 199 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p3.patch

diff --git a/meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p1.patch b/meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p1.patch
new file mode 100644
index 00000000000..8c103635cf1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p1.patch
@@ -0,0 +1,75 @@
+From 6c647e3d5d9daca452ae74fc10d50f20e998e444 Mon Sep 17 00:00:00 2001
+From: Kim Davies <kim@cynosure.com.au>
+Date: Sun, 10 May 2026 08:47:22 -0700
+Subject: [PATCH] Merge commit from fork
+
+CVE: CVE-2026-45409
+Upstream-Status: Backport [https://github.com/kjd/idna/commit/c0dda4501df5d91c3181ce6f962dc5de74e82cc1]
+
+Backport Changes:
+- Omitted HISTORY.rst because its 3.14 release entry conflicts with the 3.11
+  history and is not required for the security fix.
+
+(cherry picked from commit c0dda4501df5d91c3181ce6f962dc5de74e82cc1)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ idna/core.py       | 14 ++++++++++++++
+ tests/test_idna.py | 13 +++++++++++++
+ 2 files changed, 27 insertions(+)
+
+diff --git a/idna/core.py b/idna/core.py
+index 8177bf7..ce995c9 100644
+--- a/idna/core.py
++++ b/idna/core.py
+@@ -377,6 +377,15 @@ def encode(
+             raise IDNAError("should pass a unicode string to the function rather than a byte string.")
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
+@@ -415,6 +424,11 @@ def decode(
+         raise IDNAError("Invalid ASCII in A-label")
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
+index b59f5e5..ff24ebf 100755
+--- a/tests/test_idna.py
++++ b/tests/test_idna.py
+@@ -80,6 +80,19 @@ class IDNATests(unittest.TestCase):
+         self.assertFalse(idna.valid_label_length("a" * 64))
+         self.assertRaises(idna.IDNAError, idna.encode, "a" * 64)
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
+         la = "\u0061"
+         r = "\u05d0"
diff --git a/meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p2.patch b/meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p2.patch
new file mode 100644
index 00000000000..07b5b148f58
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p2.patch
@@ -0,0 +1,48 @@
+From 44713e1252442331fd49dfca00cd42bc27859198 Mon Sep 17 00:00:00 2001
+From: Kim Davies <kim@cynosure.com.au>
+Date: Sun, 10 May 2026 12:44:47 -0700
+Subject: [PATCH] Use valid_string_length() for early oversized-input check
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
+index ce995c9..db19bda 100644
+--- a/idna/core.py
++++ b/idna/core.py
+@@ -378,12 +378,9 @@ def encode(
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
+@@ -424,10 +421,9 @@ def decode(
+         raise IDNAError("Invalid ASCII in A-label")
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
index 00000000000..f7302a94170
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p3.patch
@@ -0,0 +1,72 @@
+From bd119cd4055324ece8a9bb1ef5413e3ad581b0ed Mon Sep 17 00:00:00 2001
+From: metsw24-max <metsw24@gmail.com>
+Date: Mon, 11 May 2026 20:59:30 +0530
+Subject: [PATCH] Enforce early length limits in check_label
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
+index db19bda..254f090 100644
+--- a/idna/core.py
++++ b/idna/core.py
+@@ -247,6 +247,17 @@ def check_label(label: Union[str, bytes, bytearray]) -> None:
+         label = label.decode("utf-8")
+     if len(label) == 0:
+         raise IDNAError("Empty Label")
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
+index ff24ebf..9832c39 100755
+--- a/tests/test_idna.py
++++ b/tests/test_idna.py
+@@ -93,6 +93,30 @@ class IDNATests(unittest.TestCase):
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
+         la = "\u0061"
+         r = "\u05d0"
diff --git a/meta/recipes-devtools/python/python3-idna_3.11.bb b/meta/recipes-devtools/python/python3-idna_3.11.bb
index eb875729345..1a852561a46 100644
--- a/meta/recipes-devtools/python/python3-idna_3.11.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.11.bb
@@ -3,6 +3,10 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=18a4795c19833413a7e2f1cb3cd3b143"
 
+SRC_URI += "file://CVE-2026-45409_p1.patch \
+           file://CVE-2026-45409_p2.patch \
+           file://CVE-2026-45409_p3.patch \
+           "
 SRC_URI[sha256sum] = "795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902"
 
 inherit pypi python_flit_core ptest-python-pytest

