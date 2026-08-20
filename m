Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BCEC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 05:56:25 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.945.1787205380058675897
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 22:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=W+pnlaI4;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10976; q=dns/txt;
  s=iport01; t=1787205380; x=1788414980;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jRVbYRgLHzmynIyuA8oRzJoCI79/PwnhmSK2fUsKZnM=;
  b=W+pnlaI4b8M3rZ1hW5CNN9jxuAMbqVHnyB+XZ5xy86Z3phm67pxqOf6R
   uD/j7tIhwbM9ZfmZlZy8+aXSiNZQ3aYmLhIjbQI5+vYQWtWvUUhtXnC51
   yRvX3mUYuPJ6Bulcv5rM7awbHccrG0XbU1wIZkYXiYIgIgK3fruI/7MvF
   YIjRzxcZgEz9lttTPJoMIgM9HGpFLDy7+RcodX9lMqvuzU85wGmqhtvYC
   SejkEAtYZDO8W5Wiy7nAb0UnKAz+IOHzfw+RdHk0xcm7eAsxfB/95q0OT
   toahmUj8cyNACqkXEZOvSXKax4sq4CTKAGXXVgUkmW58bV++YfVbNBLCX
   A==;
X-CSE-ConnectionGUID: xEwtMyrdRsOi5hOFA4q2Eg==
X-CSE-MsgGUID: nnNZjUT7SGaoS+5qPsNlLA==
X-IPAS-Result: =?us-ascii?q?A0DLAgBHloZq/40QJK1aglmCV3ReQ0kDhFSRB2yLZ5I3g?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhQWNbQImNQgOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBJgQLAUYsAwECAwImAiILIyGDAgGCOgM3AxHCMnp/M?=
 =?us-ascii?q?4EBg2gCQ1DYSw2CWAELFAEFgQUuhT+CfyABhQJdGAGEfCcbG4FygRWDaYEFg?=
 =?us-ascii?q?RpCAoE4hAOCagSCIoEMgVpughOOb0iBAhwDWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XNVgbBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgnCCBgIBSUUOC?=
 =?us-ascii?q?RcLGA1IESw3FBkEPQFuB45RIIJLARVCDCoBCiEXL1o3LSgREZJvLpI3oB5xC?=
 =?us-ascii?q?iiDdowhjz6FfBozhVulEQuYfYpeSYJjhAmSR4RpgWoBOYFZcBWDIglKGQ+OK?=
 =?us-ascii?q?gQKC4NghRNRxlUnMgsDLwEBBwIHDgMLgWiQAQEmB4FPAQE?=
IronPort-Data: A9a23:7oe7yKnxW9LLUjlrstM6HJ7o5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLD2CEafmIM2ene49xPIu0oEgB65OBnYJmTgtkr3gxHltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsvPb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZ015fpSEHtCz
 +c/KW0NST6q2/vs7b3uH4GAhux7RCXqFIobvnclyXTSCuwrBMifBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkEWUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FYIOPK4DXG58F9qqej
 mTA2Vb7Py1FD/OWzgHGr2uUncnLuQquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjRCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:Aa4qhqC32K6BFO3lHemO55DYdb4zR+YMi2TDGXofdfUzSL39qy
 nOpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVyYygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: 9a23:KQ4ysGwPkrDUrTWvA/VQBgUEN985V2zHwE3LBE7lCUFHYeGME3KfrfY=
X-Talos-MUID: 9a23:Gi110Apg0zFXnGGNqd4ezzdkEvVq3pjxM28Elq5F5tC8Lgp0Hx7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="812945628"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 05:56:17 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 0F4CC18000193;
	Thu, 20 Aug 2026 05:56:17 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 9BC1BCC12A6; Wed, 19 Aug 2026 22:56:16 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH] python3-idna: Fix CVE-2026-45409
Date: Wed, 19 Aug 2026 22:56:04 -0700
Message-Id: <20260820055604.37426-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 05:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243805

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
index 0000000000..02a8090b84
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
index 0000000000..a79e1e9c20
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
index 0000000000..2ebbd5c13d
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
index 729aff1c46..5322984a24 100644
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
 
 inherit pypi python_flit_core
-- 
2.35.6


