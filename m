Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E50CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 13:18:26 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70332.1781270305802310502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 06:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=R3v+J9S9;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4743; q=dns/txt;
  s=iport01; t=1781270305; x=1782479905;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=OSm0jqv4FIQvOjLaGNmfExPt4YwbmSzupx6cyaccqBg=;
  b=R3v+J9S9ocheozgyn43APYevt2W5j6DK6GoB4rQRkM+KiZkiYWygYbzu
   Y+qB5afc/8oPi1TQ+QVvQhIvlmkfx2UpCm7P2duGOfuox6kZC8Hk9QVXe
   oz+vmPQeKWQL5SXJw5g31NAOsIjPwQDsRJMVgathbLXIXlrD0p0bYxDQc
   pCGw8za4hHdNvoP5ggaw05tVlAd4xgd2k7+tj4+EUUiIUksjtQ7R9fKdw
   RvBq4DfJGsfK2kwl/SiA3MWafj5ovIDQttVM7wZR4Z46cejRdWIS+XCjE
   ++msJ4yJtW05wPfSwAPul4BPyjdYIe92DlYhfjL4+K79w1+Fr6dAJtKQ0
   Q==;
X-CSE-ConnectionGUID: QbNxLEkVSIGia5MozjwfAw==
X-CSE-MsgGUID: PrXseKiKSKOaI9X4PQVayg==
X-IPAS-Result: =?us-ascii?q?A0BkAwAcBixq/47/Ja1aHgEBCxIMggULg0tfQkkDlCeCI?=
 =?us-ascii?q?QOeG4EkA1cPAQEBD0QNBAEBhQYCjUACJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECAQMnCwE0IhwDAQIvKyMIGYMCAYJzAgERs?=
 =?us-ascii?q?zaBeTOBAYNiAQUCQ1DbLQsUAYE4hT+IH1sYAYR8JxsbgXKEfoEFTYEPAQGBJ?=
 =?us-ascii?q?4Z+BIIigQyBXY8JSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFg?=
 =?us-ascii?q?UqBK2qBA4UNIx8DOX+BdIEoZ2kVMDWBAhESAwsYDUgRLDcUGwQ+bgeMQhcPg?=
 =?us-ascii?q?UxxAXsTASoBF4F8ARgcozmCIZ9RgT4KKIN1jCGVOhozhVulEQuYfYsnEIJTl?=
 =?us-ascii?q?XNdhGiBaDw5gQ4LB3AVgyIJShkPjjiDa4F/gxTDFSQ1CwMvAQEHAgcOAwuBa?=
 =?us-ascii?q?JAAAiYHgU4BAQ?=
IronPort-Data: A9a23:iYN7VqmJN/sY8ibkVKwKa0vo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWWj2FPfmLZzemLttwPY2xpBgAuMPdyddnSwJpqSA9FFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZG31GONgWYubDpKsvjb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbQS3PZTLGJwz
 t03KTlQSxeRhf246a3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMieBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYD/7C7pm9AusrmLifyBdolKcjaE2+GPUigd21dABNfKJK4faHJkMwx/wS
 mTux37JGRw5Nf+k6h2M0yOc2tf2oyrqV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cE3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:UFiLy6PFSZv53sBcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:QhyaQmBJUQPfurL6ExBt0l4wN8MbSVzyzX6NBkiqC3lnYaLAHA==
X-Talos-MUID: 9a23:cGoiUQnr452HNDHKCdsydnpaLvdz7oevK3sutpwn6vnYDRVOMiaS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,200,1774310400"; 
   d="scan'208";a="493814151"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jun 2026 13:18:24 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id B354818000341
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 13:18:24 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 4A9D1CB6A93; Fri, 12 Jun 2026 06:18:24 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 2/3] go: fix CVE-2026-25679
Date: Fri, 12 Jun 2026 06:16:18 -0700
Message-Id: <20260612131618.664716-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260612131618.664716-1-sudumbha@cisco.com>
References: <20260612131618.664716-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 13:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238619

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1], as referenced in [2],
to address insufficient validation in `url.Parse`.

Debian marks older Go branches as not affected because the vulnerable
parseHost surface was introduced by the earlier CVE-2025-47912 fix.
This Scarthgap recipe already carries CVE-2025-47912.patch, so the
fix is applicable to the patched Go 1.22.12 source used here.

[1] https://github.com/golang/go/commit/d8174a9500d53784594b198f6195d1fae8dfe803
[2] https://security-tracker.debian.org/tracker/CVE-2026-25679

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-25679

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-25679.patch                | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-25679.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 5bd3e98938..7dd1c021cb 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -42,6 +42,7 @@ SRC_URI += "\
     file://CVE-2025-68121_p2.patch \
     file://CVE-2025-68121_p3.patch \
     file://CVE-2025-58183.patch \
+    file://CVE-2026-25679.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-25679.patch b/meta/recipes-devtools/go/go/CVE-2026-25679.patch
new file mode 100644
index 0000000000..6bd22a49ad
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-25679.patch
@@ -0,0 +1,74 @@
+From c8f96fce4d34123a920558a1a3f5c0ddf2bf678e Mon Sep 17 00:00:00 2001
+From: Ian Alexander <jitsu@google.com>
+Date: Wed, 28 Jan 2026 15:29:52 -0500
+Subject: [PATCH] [release-branch.go1.25] net/url: reject IPv6 literal not
+ at start of host
+
+This change rejects IPv6 literals that do not appear at the start of the
+host subcomponent of a URL.
+
+For example:
+  http://example.com[::1] -> rejects
+  http://[::1]            -> accepts
+
+Thanks to Masaki Hara (https://github.com/qnighy) of Wantedly.
+
+Updates #77578
+Fixes #77969
+Fixes CVE-2026-25679
+
+CVE: CVE-2026-25679
+Upstream-Status: Backport [https://github.com/golang/go/commit/d8174a9500d53784594b198f6195d1fae8dfe803]
+
+Change-Id: I7109031880758f7c1eb4eca513323328feace33c
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3400
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3642
+Reviewed-on: https://go-review.googlesource.com/c/go/+/752100
+Reviewed-by: Cherry Mui <cherryyz@google.com>
+Auto-Submit: Gopher Robot <gobot@golang.org>
+TryBot-Bypass: Gopher Robot <gobot@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+(cherry picked from commit d8174a9500d53784594b198f6195d1fae8dfe803)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ src/net/url/url.go      | 4 +++-
+ src/net/url/url_test.go | 6 ++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/src/net/url/url.go b/src/net/url/url.go
+index 5219e3c130b..ab59c63adfa 100644
+--- a/src/net/url/url.go
++++ b/src/net/url/url.go
+@@ -623,7 +623,9 @@ func parseAuthority(authority string) (user *Userinfo, host string, err error) {
+ // parseHost parses host as an authority without user
+ // information. That is, as host[:port].
+ func parseHost(host string) (string, error) {
+-	if openBracketIdx := strings.LastIndex(host, "["); openBracketIdx != -1 {
++	if openBracketIdx := strings.LastIndex(host, "["); openBracketIdx > 0 {
++		return "", errors.New("invalid IP-literal")
++	} else if openBracketIdx == 0 {
+ 		// Parse an IP-Literal in RFC 3986 and RFC 6874.
+ 		// E.g., "[fe80::1]", "[fe80::1%25en0]", "[fe80::1]:80".
+ 		closeBracketIdx := strings.LastIndex(host, "]")
+diff --git a/src/net/url/url_test.go b/src/net/url/url_test.go
+index b2f8bd95fcf..8ffbf075cb8 100644
+--- a/src/net/url/url_test.go
++++ b/src/net/url/url_test.go
+@@ -1722,6 +1722,12 @@ func TestParseErrors(t *testing.T) {
+ 		{"http://[fe80::1", true},                   // missing closing bracket
+ 		{"http://fe80::1]/", true},                  // missing opening bracket
+ 		{"http://[test.com]/", true},                // domain name in brackets
++		{"http://example.com[::1]", true},            // IPv6 literal doesn't start with '['
++		{"http://example.com[::1", true},
++		{"http://[::1", true},
++		{"http://.[::1]", true},
++		{"http:// [::1]", true},
++		{"hxxp://mathepqo[.]serveftp(.)com:9059", true},
+ 	}
+ 	for _, tt := range tests {
+ 		u, err := Parse(tt.in)
+-- 
+2.35.6
+
-- 
2.35.6

