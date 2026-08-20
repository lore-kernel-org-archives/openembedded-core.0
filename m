Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA96AC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 05:51:55 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.894.1787205110431540222
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 22:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MQVtNidJ;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10649; q=dns/txt;
  s=iport01; t=1787205110; x=1788414710;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6bBhrkItmm/pcmyQKJIEnKitSWEsxlysO4HaRkZ4WbQ=;
  b=MQVtNidJBhHc422tgrG6XAFrIFDNmrFAlk62QwawHzFOkE44dcVMkxVZ
   ADzKZZVw7JVvfYu3CIlTn+SShET0Ao7m0XTlv9V7ZSV4qDrfOKyriU4YT
   JolA7pie/gwgr2aXXhunwQUhYHL3o/kxJ4EXcpgfOfTOvsG2+u1ehr9u4
   gmWQogFTwJN64IoCYr6LDiyA1wDkjoNU2ZrIbMGCdVOFZhrFw/ZQDZdsm
   8PPVSgjfnwvFR6Vmzb4FGQnAWXceoKcLG9b87xOF3Ei1ii5qWpIkdv5NF
   tcKPFQGC1LwsVZVXxuDi6OxbzRzbILEs6IXhuj+/m6N0BiG6357LaPnah
   w==;
X-CSE-ConnectionGUID: wHQdp7tUTRukCqwcS+bSfw==
X-CSE-MsgGUID: xNQjrYU8SaqwcEIXM2t/Vg==
X-IPAS-Result: =?us-ascii?q?A0DLAgBXlYZq/40QJK1aglmCV3ReQ0mEV5EHbItnkjeBe?=
 =?us-ascii?q?gQPAQEBD0QNBAEBhQWNbQImNQgOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBJgQLAUYsAwECAwImAiILIyGDAgGCOgM3AxEGwip6f?=
 =?us-ascii?q?zOBAYR92EsNglgBCxQBBYEFLoU/gn8gAYUCXRgBgwGBeycbG4FygRMCg2mBB?=
 =?us-ascii?q?YEaQgKBOIQDgmoEgiKBDIFaboITjm9IgQIcA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+FzVYGwYFgR2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKAoJwggYCAUlFD?=
 =?us-ascii?q?gkXCxgNSBEsNxQZBD0BbgeOUSCCSwFXNgEKIRcvWmQoIpJvLpI3oB5xCiiDd?=
 =?us-ascii?q?owhjz6FfBozhVulEQuYfYpeSYJjhAmSR4RpgWoCOIFZcBWDIglKGQ9WjVQEC?=
 =?us-ascii?q?guDYIVkxlUnMgsyAQEHAgcOAwuBaJABASYHgU8BAQ?=
IronPort-Data: A9a23:3fI176KIPF7LUjQ7FE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENSgTRVn
 2caWm3Ta62MNzD8L9wiPIm1p0MD7cSHm9NgGlEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2clajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1xLHg6JdIEx9pNHGJl7
 OMTE3MHVR6c0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzNXwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FwojOaybYaII7RmQ+1FuH+av
 FP7r1/wGw4RGf2v7GCZtUyj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KIpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:aluiqq2YwrklAYmf+wI5OAqjBJAkLtp133Aq2lEZdPWaSKOlfq
 eV7ZAmPH7P+VMssR4b+OxoVJPsfZq+z+8W3WBuB9eftWDd0QPCRr2KhrGN/9SPIUHDH8dmpM
 BdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AMNZXIGh4V2ByZaFXAjdHbCEB0jJubV3kwG+PP3K?=
 =?us-ascii?q?EM3tqY6SKQmTT8phqjJ87?=
X-Talos-MUID: 9a23:21+YVwTP0hzl5IT+RXT8oghgLvZVs5+nEV8GvLQ2npOYchJ/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="814675451"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 05:51:49 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 3A6C618000193;
	Thu, 20 Aug 2026 05:51:49 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id CEB7DCCA79B; Wed, 19 Aug 2026 22:51:48 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH] python3-idna: Fix CVE-2026-45409
Date: Wed, 19 Aug 2026 22:51:41 -0700
Message-Id: <20260820055141.1372175-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 05:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243804

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
index 0000000000..8c103635cf
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
index 0000000000..07b5b148f5
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
index 0000000000..f7302a9417
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
index de4595c1d4..143be2039e 100644
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
-- 
2.35.6


