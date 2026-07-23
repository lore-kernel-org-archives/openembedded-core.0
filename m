Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376CCC531CA
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 13:40:41 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23755.1784814036929057864
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 06:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SB13HkqP;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5877; q=dns/txt;
  s=iport01; t=1784814036; x=1786023636;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5oe3m/lzS9mQnccehy/iolHi24PepmMvb8ARFxq7pkQ=;
  b=SB13HkqPdHhVHXGrXFdqeJJEalk95CKus3C/G1NdjS9nEjxxfr/v6Yoz
   Z/x/GspUO4H6bOo5hCU99gvdRynnI4dCMbHvaE+nfvIODdUsVearfBXTl
   qSNufNUj2pPgDza/fUljXQPQWI/3LmX1ADXv3JrTzlul72Ua7EKAnhPqb
   aJfDxQeHSc4RgdlFZreGrQq6wf+qD463tDFdydEffJlzIfXJKBkAeED/w
   NxwdyWD2HPK1O52PGguO9V8s/9Qtank+rq6XQIuyy7AtK7uq0S+9qcmqH
   2Epx7MTj6xoo3qUwkCrZCY+7eD4vcIW5f1oO09p2C10tH0qjRtCSrr5qw
   A==;
X-CSE-ConnectionGUID: ymO+uDaJQNaefRaG1yZXgA==
X-CSE-MsgGUID: 8FYpNo7GR6uaPwTpvzVesw==
X-IPAS-Result: =?us-ascii?q?A0BHAgA5GGJq/5D/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?YEWilGSNxSBag8BAQEPRA0EAQGEP44iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBLQsBGAFZAwECTwsjGQgJEYJoAYI6AzcDE?=
 =?us-ascii?q?cJXgXkzgQGDKAE/AkNQ2EkNglgBCxQBgTiDIIIfgn2BGIMsX1wYAYR8Jxsbg?=
 =?us-ascii?q?XKBFYJzdoEFgRpCAQGBR4ZeBIIigQyBWh6BbI44SIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4EMGwcFgR2BLHmEWyMfAzl/gTB1SnctahIXgSaDSQKBH?=
 =?us-ascii?q?QMLGA1IESw3FBkEPm4HjWQjgkABgQ0BKAEBASAwL4EtEQ0EkxOSPqAhcQoog?=
 =?us-ascii?q?3WMIY8+BIV4GjOFW6URC5h9jgqECZJHhGmBaDyBRwsHcBU7gmcJShkPVo1ig?=
 =?us-ascii?q?2uBf4MUUcRxPDUCCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:F2uVmaNNAXf+l4vvrR30lsFynXyQoLVcMsEvi/4bfWQNrUon0zNSn
 2dMXmCEO6zZYWqneN1xaI/joU4GucLVzIJnQXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gWUsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+RrKwIrEYQ6w8B+DG90/
 NNBOQI9YTnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmGS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMHwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsieOzaIeLJYfiqcN9zmipv
 kTBoEvDXAwTDMOj0SSXzH+3mbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:vYc+yqDvQyohYQblHemc55DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssQ8b+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEKhSqa3/3jbnByryssRZ1a
 tmbuxCLeeYNykesS4/izPIdOrJB7K8gcSVuds=
X-Talos-CUID: =?us-ascii?q?9a23=3ACgsM8WupT30SJ9/EPXtjHWCm6Is0d1qe0VvZAXa?=
 =?us-ascii?q?eAGtncrS6EE6iyKxNxp8=3D?=
X-Talos-MUID: 9a23:wWx64gpvF6oqVz2wiYwez2FMBd9O5PuBMh4QmK0Zh9GaJxJ9ICjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="513605673"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 13:40:36 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id A9F0D1800020A
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:40:35 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id C74C3CC037D; Thu, 23 Jul 2026 19:10:33 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] python3: fix CVE-2026-15308
Date: Thu, 23 Jul 2026 19:10:23 +0530
Message-Id: <20260723134023.2501442-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241839

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream v3.14 backport for CVE-2026-15308.
The upstream fix commit is referenced in [1], and the public CVE
advisory is referenced in [2]. The individual backported commit link is
recorded in the embedded patch header.

[1] https://github.com/python/cpython/commit/07efb08123ba9367a7107325adb9d5626dca1ca9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-15308

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../python/python3/CVE-2026-15308.patch       | 116 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.14.6.bb |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-15308.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-15308.patch b/meta/recipes-devtools/python/python3/CVE-2026-15308.patch
new file mode 100644
index 0000000000..7d4efaf89e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-15308.patch
@@ -0,0 +1,116 @@
+From 6c0ab3784f4fc153d6a8c82564fd3138343c5b1e Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Sat, 4 Jul 2026 20:08:05 +0200
+Subject: [PATCH] [3.14] gh-153030: Fix quadratic complexity in incremental
+ parsing in HTMLParser (GH-153031) (GH-153039)
+
+When an unterminated construct (e.g. a tag or comment) spanned many
+feed() calls, rescanning the growing buffer and concatenating new data
+onto it were both quadratic.  New data is now accumulated in a list and
+only joined and parsed once enough has piled up.
+
+CVE: CVE-2026-15308
+Upstream-Status: Backport [https://github.com/python/cpython/commit/07efb08123ba9367a7107325adb9d5626dca1ca9]
+
+Backport Changes:
+- Omitted Misc/NEWS.d/next/Security/2026-07-04-17-00-00.gh-issue-153030.RovkP6.rst
+  because the target source does not carry pending NEWS fragments.
+
+(cherry picked from commit bcf98ddbc40ec9b3ee87da0124a5660b19b7e606)
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+Co-authored-by: Claude Opus 4.8 <noreply@anthropic.com>
+(cherry picked from commit 07efb08123ba9367a7107325adb9d5626dca1ca9)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+
+---
+ Lib/html/parser.py          | 32 ++++++++++++++++++++++++++++++--
+ Lib/test/test_htmlparser.py | 20 ++++++++++++++++++++
+ 2 files changed, 50 insertions(+), 2 deletions(-)
+
+diff --git a/Lib/html/parser.py b/Lib/html/parser.py
+index 80fb8c3f92..f8ff4bb1fc 100644
+--- a/Lib/html/parser.py
++++ b/Lib/html/parser.py
+@@ -157,6 +157,9 @@ class HTMLParser(_markupbase.ParserBase):
+         self.cdata_elem = None
+         self._support_cdata = True
+         self._escapable = True
++        self._pending = []
++        self._pending_len = 0
++        self._parse_threshold = 1
+         super().reset()
+
+     def feed(self, data):
+@@ -165,11 +168,36 @@ class HTMLParser(_markupbase.ParserBase):
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
+index e4eff1ea17..54bbf11f69 100644
+--- a/Lib/test/test_htmlparser.py
++++ b/Lib/test/test_htmlparser.py
+@@ -1031,6 +1031,26 @@ text
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
diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb b/meta/recipes-devtools/python/python3_3.14.6.bb
index 0a9e82d445..0c5f74eead 100644
--- a/meta/recipes-devtools/python/python3_3.14.6.bb
+++ b/meta/recipes-devtools/python/python3_3.14.6.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-prefer-valid-entrypoints.patch \
            file://CVE-2026-11940.patch \
            file://CVE-2026-11972.patch \
+           file://CVE-2026-15308.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
-- 
2.35.6

