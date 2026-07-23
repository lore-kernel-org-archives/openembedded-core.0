Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7434DC531CA
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 13:43:21 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23806.1784814193454619563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 06:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=T9tMu+Rp;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6023; q=dns/txt;
  s=iport01; t=1784814193; x=1786023793;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dyMkoEW/rX0ykrJbulpmAqi+OG8rTgBCzBDFiAPVqKE=;
  b=T9tMu+RpJKYbf4eGLDDCboa6FxHN9xgOvZmG4Z/a7prWa9xhGGO16cb+
   mrEjZG/BXy0KAUmFei6nmPCh4jghLBazqftrUWZYKb0AMY2sP9ZJtguS6
   FZ99wN2GiSscs8cvIsoih66t1/2dnBke/NTIJsfOGCBu6WAB4yvMrESzv
   yfeScfu2iUwAPZdtYmmi9gU+6Xu5ntyGgUGtZQ3LStNFSj5FCPXBn9N4Y
   X1tOK89bjbzhqznkKc0J7nWCVg8j7Gdusd06QKxab0nlLwWFQpQ8z7KEM
   rCQ8h2fBzzqinGcoYu6d9R0YyZZc02egWfXtnd+RSK4Qn77yah27uohCg
   w==;
X-CSE-ConnectionGUID: VFA5TiffS7OCCYntJqJQKw==
X-CSE-MsgGUID: OhmTyskXR2+U1RtKwkbV9w==
X-IPAS-Result: =?us-ascii?q?A0AnAAA1GWJq/5L/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0X0JJjHKHN4IhgRaKUZI3FIFqDwEBAQ9EDQQBAYQ/jiICJjQJDgECBAMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgEtCwEYAVkDAQJPCyMZC?=
 =?us-ascii?q?AkRgmgBgjoDNwMRwkyBeTOBAYMoAT8CQ1DYSQ2CWAELFAGBOAGDH4Ifgn2BG?=
 =?us-ascii?q?IMsX1wYAYR8JxsbgXKBFYJzdoEFgRpCAQGBR4ZeBIIigQyBWh6BbH2NO0iBH?=
 =?us-ascii?q?gNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgSx5hFsjHwM5f4Ewd?=
 =?us-ascii?q?Up3LWoSF4Emg0kCgR0DCxgNSBEsNxQZBD5uB41kI4JAAYENASgBAQEgX4EtE?=
 =?us-ascii?q?Q2TFwMRkiqgIXEKKIN1jCGPPgSFeBozhVulEQuYfY4KhAmSR4RpgWg8gUcLB?=
 =?us-ascii?q?3AVO4JnCUoZD1aNYoNrgX+DFFHEcTw1AgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:dyr9Ta6p7HfkiwUMHBrsWgxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 jdOXTqBaa6LYTTxfNEiPYWz9xsFsJ7Sn9YySwM9/i8wZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1OsPrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eA6Mxp9p2D291q
 tszAwELcjKapduV3+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcGFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkERUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIeNIoTQG5ULwy50o
 Erh/2HFEwoZBObFigfcyG6PmezFo3LkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBVCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:rQU0OKqucjRmiAsiLJuOprwaV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90de7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: 9a23:WpJ5oWE9p7XmmdOQqmJZ2mdJJsErfEaC61z7EkmkK39LcZ6KHAo=
X-Talos-MUID: 9a23:ztkenAroaVtDpC2cx0IezxZiMft5+KeeMhpOrMw8p+qbNiZOaijI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="500026865"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 13:43:12 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 0870318000227
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:43:12 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 2CC3ECC037D; Thu, 23 Jul 2026 19:13:10 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] python3: fix CVE-2026-15308
Date: Thu, 23 Jul 2026 19:13:04 +0530
Message-Id: <20260723134304.2505230-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241842

From: Deepak Rathore <deeratho@cisco.com>

Backport the upstream CPython fix for CVE-2026-15308 to Python
3.12.13. The issue is a CPU denial of service in incremental
html.parser.HTMLParser parsing, where repeated feed() calls with
unterminated markup could repeatedly rescan and concatenate a growing
buffer.

The embedded patch is based on the Python 3.13 backport in [1]. The
public CVE advisory is referenced in [2]. Scarthgap-specific source
differences are recorded under Backport Changes in the embedded patch
header.

[1] https://github.com/python/cpython/commit/7933f4bf7131aa4140750f9404f5de0aa2969ced
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-15308

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../python/python3/CVE-2026-15308.patch       | 116 ++++++++++++++++++
 .../python/python3_3.12.13.bb                 |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-15308.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-15308.patch b/meta/recipes-devtools/python/python3/CVE-2026-15308.patch
new file mode 100644
index 0000000000..7ed63b17ce
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-15308.patch
@@ -0,0 +1,116 @@
+From b30795b2ecf621df2c09b059b9fa7d881f537378 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Sat, 4 Jul 2026 20:01:22 +0200
+Subject: [PATCH] [3.13] gh-153030: Fix quadratic complexity in incremental
+ parsing in HTMLParser (GH-153031) (GH-153040)
+
+When an unterminated construct (e.g. a tag or comment) spanned many
+feed() calls, rescanning the growing buffer and concatenating new data
+onto it were both quadratic.  New data is now accumulated in a list and
+only joined and parsed once enough has piled up.
+
+CVE: CVE-2026-15308
+Upstream-Status: Backport [https://github.com/python/cpython/commit/7933f4bf7131aa4140750f9404f5de0aa2969ced]
+
+Backport Changes:
+- Omitted Misc/NEWS.d/next/Security/2026-07-04-17-00-00.gh-issue-153030.RovkP6.rst
+  because the target source does not carry pending NEWS fragments.
+
+(cherry picked from commit bcf98ddbc40ec9b3ee87da0124a5660b19b7e606)
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+Co-authored-by: Claude Opus 4.8 <noreply@anthropic.com>
+(cherry picked from commit 7933f4bf7131aa4140750f9404f5de0aa2969ced)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+
+---
+ Lib/html/parser.py          | 32 ++++++++++++++++++++++++++++++--
+ Lib/test/test_htmlparser.py | 20 ++++++++++++++++++++
+ 2 files changed, 50 insertions(+), 2 deletions(-)
+
+diff --git a/Lib/html/parser.py b/Lib/html/parser.py
+index bfab3e64cd5..c5d2340b712 100644
+--- a/Lib/html/parser.py
++++ b/Lib/html/parser.py
+@@ -138,6 +138,9 @@ class HTMLParser(_markupbase.ParserBase):
+         self.cdata_elem = None
+         self._support_cdata = True
+         self._escapable = True
++        self._pending = []
++        self._pending_len = 0
++        self._parse_threshold = 1
+         super().reset()
+
+     def feed(self, data):
+@@ -146,11 +149,36 @@ class HTMLParser(_markupbase.ParserBase):
+         Call this as often as you want, with as little or as much text
+         as you want (may include '\n').
+         """
+-        self.rawdata = self.rawdata + data
+-        self.goahead(0)
++        # Accumulate new data in a list and only join and parse it once
++        # enough has piled up.  Rescanning an unparsed buffer (e.g. an
++        # unterminated tag) and concatenating onto it on every call would
++        # both be quadratic in the input size.
++        self._pending_len += len(data)
++        if self._pending_len < self._parse_threshold:
++            self._pending.append(data)
++        else:
++            if not self._pending:
++                self.rawdata += data
++            else:
++                self._pending.append(data)
++                self.rawdata += ''.join(self._pending)
++                self._pending.clear()
++            self._pending_len = 0
++            n = len(self.rawdata)
++            self.goahead(0)
++            if len(self.rawdata) < n:
++                # Some data was parsed; resume on the next call.
++                self._parse_threshold = 1
++            else:
++                # Nothing was parsed; wait until the buffer doubles.
++                self._parse_threshold = len(self.rawdata)
+
+     def close(self):
+         """Handle any buffered data."""
++        if self._pending:
++            self.rawdata += ''.join(self._pending)
++            self._pending.clear()
++            self._pending_len = 0
+         self.goahead(1)
+
+     __starttag_text = None
+diff --git a/Lib/test/test_htmlparser.py b/Lib/test/test_htmlparser.py
+index 303c0baa87b..e6d92a7ec51 100644
+--- a/Lib/test/test_htmlparser.py
++++ b/Lib/test/test_htmlparser.py
+@@ -930,6 +930,26 @@ text
+         check("<![CDATA[" * 9 * n)
+         check("<!doctype" * 35 * n)
+
++    @support.requires_resource('cpu')
++    def test_incremental_no_quadratic_complexity(self):
++        # An unterminated construct fed in many small chunks used to take
++        # quadratic time, both to rescan and to concatenate the buffer.
++        # Now it takes a fraction of a second.
++        def check(prefix, chunk, suffix):
++            parser = html.parser.HTMLParser()
++            parser.feed(prefix)
++            for _ in range(200_000):
++                parser.feed(chunk)
++            parser.feed(suffix)
++            parser.close()
++        chunk = "a" * 64
++        check("<!--", chunk, "-->")       # comment
++        check("<?", chunk, ">")           # processing instruction
++        check("<!doctype ", chunk, ">")   # doctype
++        check("<![CDATA[", chunk, "]]>")  # CDATA section
++        check("<a href='", chunk, "'>")   # start tag
++        check("<script>", chunk, "</script>")  # RAWTEXT element
++
+
+ class AttributesTestCase(TestCaseBase):
+
+--
+2.51.0
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index de174f7bfd..a3d07d14a4 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2026-11940.patch \
            file://CVE-2026-11972.patch \
            file://CVE-2026-9669.patch \
+           file://CVE-2026-15308.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.35.6

