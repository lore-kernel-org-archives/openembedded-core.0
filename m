Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F57E94100
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 23:08:16 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53860.1767049688336249084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 15:08:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=E1soyyko;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so9441973b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 15:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767049687; x=1767654487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYh5JgZcehazHMP6ZQBRtmGin0rYtEKRUUNg54baMSA=;
        b=E1soyykoBecYjQ6IctVO158zd4lIiAAnnLqpnw34PC2JFn3j2WPcIva9WZOBig+U1y
         tM8lLYJUwdPWtktvfmi2zLQJz4U1zYtJN/yiPQcXAff/wr0z4vb3hZVCZldANlGJ4ZeB
         DHGTmlVxbX++dlp3iA3/MB9PCvnyWSi6AWKO7Sl5EGEkNRnnolIQ09mNwTEscXFg64CY
         YKGWeyVeR24xxKYfxx3k5OEnSo/uHais65LJdARjf6fMNWdAp8atEfRwyTiuP5X8RuS9
         2QlKbGmp9TYSU1al9S4hGLbEnR6vPW3B5AoCbT1Zunigsj+XmvkqjuHUenzwdr3aoKwv
         29Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767049687; x=1767654487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PYh5JgZcehazHMP6ZQBRtmGin0rYtEKRUUNg54baMSA=;
        b=LBpydACO7jEhQA8bYdLEZhbShI1hwbPGYgifjEcqBVf/6nv5uIuhF+cLhlOu9VH7t6
         B3Ucyf63fFZVlsYjNcTIrIQQbBpUnL8hjLVuUF8UhwmbHGNq1pLw3qpeDnB0ngrNrhz9
         ytrB2ounbP2mwp7JZ0nN1HNtb4vsW8lsdv6rFzH+IyKUJcQKuPd5i0MROMGcA3/KNRtt
         1iBr7L6Efed/9yi2ye5F9zbzESJ3Y4iuIh1Q7oBk6cNV5kpzAw4KtN0c4mQtSQYyjLnK
         /JvoimACEsh8PyR9f2qP7UyMc1lw1uXxuywFQKp7CF1yvlaHzDR9NsE6HryJl0vj0rtp
         afvw==
X-Gm-Message-State: AOJu0Yxr6Dcy8ahRaK5ulobUTjJzoe67FSglgmdU/imqEhoiLmftLUdf
	Xq5QyrYp4tPsOJ73JjVPi0A40BzVfI0gIXSewejWM+4X1roTjm5kIDafeW+JUdy9NvkJc0xD6DI
	899b6
X-Gm-Gg: AY/fxX7sSHHvoI7h0DMpjywXwr1VSO7mhD/YaIl3iWtwL29Bl1zk0hUsPv2x2xPFkxh
	/qEJUy3r6m2Ehktw7cG4LFKjvk1wtlCJDLr1F6lCsxZoR6ZJ2M+bNnY2UNjriyurOkVrvy+zdHR
	5xLAN99AIKTa0Z30kOm9y2VgqSe9oaLT+syIpUvIrJxQRytsJfjJSnRZOjmU6qG/GucIsDwrJIU
	mcssOKN/q14tLHF7keij4FwFKFdpOvyzIbIFf+5/TYcJE9rKFAFInYN6iojEiybCsMcOxt5RQt2
	dnrTFWI0IBAKmQ5xUvbDPXVnaJBafg0Ouk2WM8HVHVvZC8R2/1/BSmLxv7V1ZEqJZzN4/Z+/E2l
	Z2hwOjnkEfJfWnYSE3U4sWAi4QOF8K+N5rMkGfM97NDZ7RvrqZy9IQwaJahdW92dhRFkGbFXp+2
	RgcW21LVfSVZJP
X-Google-Smtp-Source: AGHT+IEr1lmEgLe5YjWcEfmO67W6mzE49SOFtyqqLf9/mPsdseNJ8DvvIcZ5azCnTJet4cbwWYkbjw==
X-Received: by 2002:a05:6a00:3284:b0:7b8:d12f:90ae with SMTP id d2e1a72fcca58-7ff649e44fdmr28645710b3a.21.1767049687317;
        Mon, 29 Dec 2025 15:08:07 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c013:8f5c:baf3:22c3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm30340938b3a.50.2025.12.29.15.08.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 15:08:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/5] go: Update CVE-2025-58187
Date: Mon, 29 Dec 2025 15:07:37 -0800
Message-ID: <2d6b089de3ef5e062d852eb93e3ff16997e796ef.1767049440.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767049440.git.steve@sakoman.com>
References: <cover.1767049440.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 23:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228624

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/golang/go/commit/ca6a5545ba18844a97c88a90a385eb6335bb7526

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   3 +-
 ...025-58187.patch => CVE-2025-58187-1.patch} |   0
 .../go/go/CVE-2025-58187-2.patch              | 516 ++++++++++++++++++
 3 files changed, 518 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/go/go/{CVE-2025-58187.patch => CVE-2025-58187-1.patch} (100%)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-58187-2.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 825b8f4d68..0729b5eec0 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -22,7 +22,8 @@ SRC_URI += "\
     file://CVE-2025-47907.patch \
     file://CVE-2025-47906.patch \
     file://CVE-2025-58185.patch \
-    file://CVE-2025-58187.patch \
+    file://CVE-2025-58187-1.patch \
+    file://CVE-2025-58187-2.patch \
     file://CVE-2025-58188.patch \
     file://CVE-2025-58189.patch \
     file://CVE-2025-47912.patch \
diff --git a/meta/recipes-devtools/go/go/CVE-2025-58187.patch b/meta/recipes-devtools/go/go/CVE-2025-58187-1.patch
similarity index 100%
rename from meta/recipes-devtools/go/go/CVE-2025-58187.patch
rename to meta/recipes-devtools/go/go/CVE-2025-58187-1.patch
diff --git a/meta/recipes-devtools/go/go/CVE-2025-58187-2.patch b/meta/recipes-devtools/go/go/CVE-2025-58187-2.patch
new file mode 100644
index 0000000000..b55dac2dc2
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-58187-2.patch
@@ -0,0 +1,516 @@
+From ca6a5545ba18844a97c88a90a385eb6335bb7526 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <roland@golang.org>
+Date: Thu, 9 Oct 2025 13:35:24 -0700
+Subject: [PATCH] [release-branch.go1.24] crypto/x509: rework fix for
+ CVE-2025-58187
+
+In CL 709854 we enabled strict validation for a number of properties of
+domain names (and their constraints). This caused significant breakage,
+since we didn't previously disallow the creation of certificates which
+contained these malformed domains.
+
+Rollback a number of the properties we enforced, making domainNameValid
+only enforce the same properties that domainToReverseLabels does. Since
+this also undoes some of the DoS protections our initial fix enabled,
+this change also adds caching of constraints in isValid (which perhaps
+is the fix we should've initially chosen).
+
+Updates #75835
+Updates #75828
+Fixes #75860
+
+Change-Id: Ie6ca6b4f30e9b8a143692b64757f7bbf4671ed0e
+Reviewed-on: https://go-review.googlesource.com/c/go/+/710735
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+(cherry picked from commit 1cd71689f2ed8f07031a0cc58fc3586ca501839f)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/710879
+Reviewed-by: Michael Pratt <mpratt@google.com>
+Auto-Submit: Michael Pratt <mpratt@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/ca6a5545ba18844a97c88a90a385eb6335bb7526]
+CVE: CVE-2025-58187
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/crypto/x509/name_constraints_test.go | 66 +++++++++++++++++--
+ src/crypto/x509/parser.go                | 57 +++++++++++-----
+ src/crypto/x509/parser_test.go           | 84 +++++++++++++++++++++---
+ src/crypto/x509/verify.go                | 53 ++++++++++-----
+ src/crypto/x509/verify_test.go           |  2 +-
+ 5 files changed, 213 insertions(+), 49 deletions(-)
+
+diff --git a/src/crypto/x509/name_constraints_test.go b/src/crypto/x509/name_constraints_test.go
+index 9aaa6d7..78263fc 100644
+--- a/src/crypto/x509/name_constraints_test.go
++++ b/src/crypto/x509/name_constraints_test.go
+@@ -1456,7 +1456,63 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 		expectedError: "incompatible key usage",
+ 	},
+ 
+-	// #77: if several EKUs are requested, satisfying any of them is sufficient.
++	// An invalid DNS SAN should be detected only at validation time so
++	// that we can process CA certificates in the wild that have invalid SANs.
++	// See https://github.com/golang/go/issues/23995
++
++	// #77: an invalid DNS or mail SAN will not be detected if name constraint
++	// checking is not triggered.
++	{
++		roots: make([]constraintsSpec, 1),
++		intermediates: [][]constraintsSpec{
++			{
++				{},
++			},
++		},
++		leaf: leafSpec{
++			sans: []string{"dns:this is invalid", "email:this @ is invalid"},
++		},
++	},
++
++	// #78: an invalid DNS SAN will be detected if any name constraint checking
++	// is triggered.
++	{
++		roots: []constraintsSpec{
++			{
++				bad: []string{"uri:"},
++			},
++		},
++		intermediates: [][]constraintsSpec{
++			{
++				{},
++			},
++		},
++		leaf: leafSpec{
++			sans: []string{"dns:this is invalid"},
++		},
++		expectedError: "cannot parse dnsName",
++	},
++
++	// #79: an invalid email SAN will be detected if any name constraint
++	// checking is triggered.
++	{
++		roots: []constraintsSpec{
++			{
++				bad: []string{"uri:"},
++			},
++		},
++		intermediates: [][]constraintsSpec{
++			{
++				{},
++			},
++		},
++		leaf: leafSpec{
++			sans: []string{"email:this @ is invalid"},
++		},
++		expectedError: "cannot parse rfc822Name",
++	},
++
++	// #80: if several EKUs are requested, satisfying any of them is sufficient.
+ 	{
+ 		roots: make([]constraintsSpec, 1),
+ 		intermediates: [][]constraintsSpec{
+@@ -1471,7 +1527,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 		requestedEKUs: []ExtKeyUsage{ExtKeyUsageClientAuth, ExtKeyUsageEmailProtection},
+ 	},
+ 
+-	// #78: EKUs that are not asserted in VerifyOpts are not required to be
++	// #81: EKUs that are not asserted in VerifyOpts are not required to be
+ 	// nested.
+ 	{
+ 		roots: make([]constraintsSpec, 1),
+@@ -1490,7 +1546,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 		},
+ 	},
+ 
+-	// #79: a certificate without SANs and CN is accepted in a constrained chain.
++	// #82: a certificate without SANs and CN is accepted in a constrained chain.
+ 	{
+ 		roots: []constraintsSpec{
+ 			{
+@@ -1507,7 +1563,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 		},
+ 	},
+ 
+-	// #80: a certificate without SANs and with a CN that does not parse as a
++	// #83: a certificate without SANs and with a CN that does not parse as a
+ 	// hostname is accepted in a constrained chain.
+ 	{
+ 		roots: []constraintsSpec{
+@@ -1526,7 +1582,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 		},
+ 	},
+ 
+-	// #81: a certificate with SANs and CN is accepted in a constrained chain.
++	// #84: a certificate with SANs and CN is accepted in a constrained chain.
+ 	{
+ 		roots: []constraintsSpec{
+ 			{
+diff --git a/src/crypto/x509/parser.go b/src/crypto/x509/parser.go
+index 9a3bcd6..f8beff7 100644
+--- a/src/crypto/x509/parser.go
++++ b/src/crypto/x509/parser.go
+@@ -378,14 +378,10 @@ func parseSANExtension(der cryptobyte.String) (dnsNames, emailAddresses []string
+ 			if err := isIA5String(email); err != nil {
+ 				return errors.New("x509: SAN rfc822Name is malformed")
+ 			}
+-			parsed, ok := parseRFC2821Mailbox(email)
+-			if !ok || (ok && !domainNameValid(parsed.domain, false)) {
+-				return errors.New("x509: SAN rfc822Name is malformed")
+-			}
+ 			emailAddresses = append(emailAddresses, email)
+ 		case nameTypeDNS:
+ 			name := string(data)
+-			if err := isIA5String(name); err != nil || (err == nil && !domainNameValid(name, false)) {
++			if err := isIA5String(name); err != nil {
+ 				return errors.New("x509: SAN dNSName is malformed")
+ 			}
+ 			dnsNames = append(dnsNames, string(name))
+@@ -395,9 +391,12 @@ func parseSANExtension(der cryptobyte.String) (dnsNames, emailAddresses []string
+ 				return errors.New("x509: SAN uniformResourceIdentifier is malformed")
+ 			}
+ 			uri, err := url.Parse(uriStr)
+-			if err != nil || (err == nil && uri.Host != "" && !domainNameValid(uri.Host, false)) {
++			if err != nil {
+ 				return fmt.Errorf("x509: cannot parse URI %q: %s", uriStr, err)
+ 			}
++			if len(uri.Host) > 0 && !domainNameValid(uri.Host, false) {
++				return fmt.Errorf("x509: cannot parse URI %q: invalid domain", uriStr)
++			}
+ 			uris = append(uris, uri)
+ 		case nameTypeIP:
+ 			switch len(data) {
+@@ -1176,36 +1175,58 @@ func ParseRevocationList(der []byte) (*RevocationList, error) {
+ 	return rl, nil
+ }
+ 
+-// domainNameValid does minimal domain name validity checking. In particular it
+-// enforces the following properties:
+-//   - names cannot have the trailing period
+-//   - names can only have a leading period if constraint is true
+-//   - names must be <= 253 characters
+-//   - names cannot have empty labels
+-//   - names cannot labels that are longer than 63 characters
+-//
+-// Note that this does not enforce the LDH requirements for domain names.
++// domainNameValid is an alloc-less version of the checks that
++// domainToReverseLabels does.
+ func domainNameValid(s string, constraint bool) bool {
+-	if len(s) == 0 && constraint {
++	// TODO(#75835): This function omits a number of checks which we
++	// really should be doing to enforce that domain names are valid names per
++	// RFC 1034. We previously enabled these checks, but this broke a
++	// significant number of certificates we previously considered valid, and we
++	// happily create via CreateCertificate (et al). We should enable these
++	// checks, but will need to gate them behind a GODEBUG.
++	//
++	// I have left the checks we previously enabled, noted with "TODO(#75835)" so
++	// that we can easily re-enable them once we unbreak everyone.
++
++	// TODO(#75835): this should only be true for constraints.
++	if len(s) == 0 {
+ 		return true
+ 	}
+-	if len(s) == 0 || (!constraint && s[0] == '.') || s[len(s)-1] == '.' || len(s) > 253 {
++
++	// Do not allow trailing period (FQDN format is not allowed in SANs or
++	// constraints).
++	if s[len(s)-1] == '.' {
+ 		return false
+ 	}
++
++	// TODO(#75835): domains must have at least one label, cannot have
++	// a leading empty label, and cannot be longer than 253 characters.
++	// if len(s) == 0 || (!constraint && s[0] == '.') || len(s) > 253 {
++	// 	return false
++	// }
++
+ 	lastDot := -1
+ 	if constraint && s[0] == '.' {
+ 		s = s[1:]
+ 	}
+ 
+ 	for i := 0; i <= len(s); i++ {
++		if i < len(s) && (s[i] < 33 || s[i] > 126) {
++			// Invalid character.
++			return false
++		}
+ 		if i == len(s) || s[i] == '.' {
+ 			labelLen := i
+ 			if lastDot >= 0 {
+ 				labelLen -= lastDot + 1
+ 			}
+-			if labelLen == 0 || labelLen > 63 {
++			if labelLen == 0 {
+ 				return false
+ 			}
++			// TODO(#75835): labels cannot be longer than 63 characters.
++			// if labelLen > 63 {
++			// 	return false
++			// }
+ 			lastDot = i
+ 		}
+ 	}
+diff --git a/src/crypto/x509/parser_test.go b/src/crypto/x509/parser_test.go
+index a6cdfb8..35f872a 100644
+--- a/src/crypto/x509/parser_test.go
++++ b/src/crypto/x509/parser_test.go
+@@ -5,6 +5,9 @@
+ package x509
+ 
+ import (
++	"crypto/ecdsa"
++	"crypto/elliptic"
++	"crypto/rand"
+ 	"encoding/asn1"
+ 	"strings"
+ 	"testing"
+@@ -110,7 +113,31 @@ func TestDomainNameValid(t *testing.T) {
+ 		constraint bool
+ 		valid      bool
+ 	}{
+-		{"empty name, name", "", false, false},
++		// TODO(#75835): these tests are for stricter name validation, which we
++		// had to disable. Once we reenable these strict checks, behind a
++		// GODEBUG, we should add them back in.
++		// {"empty name, name", "", false, false},
++		// {"254 char label, name", strings.Repeat("a.a", 84) + "aaa", false, false},
++		// {"254 char label, constraint", strings.Repeat("a.a", 84) + "aaa", true, false},
++		// {"253 char label, name", strings.Repeat("a.a", 84) + "aa", false, false},
++		// {"253 char label, constraint", strings.Repeat("a.a", 84) + "aa", true, false},
++		// {"64 char single label, name", strings.Repeat("a", 64), false, false},
++		// {"64 char single label, constraint", strings.Repeat("a", 64), true, false},
++		// {"64 char label, name", "a." + strings.Repeat("a", 64), false, false},
++		// {"64 char label, constraint", "a." + strings.Repeat("a", 64), true, false},
++
++		// TODO(#75835): these are the inverse of the tests above, they should be removed
++		// once the strict checking is enabled.
++		{"254 char label, name", strings.Repeat("a.a", 84) + "aaa", false, true},
++		{"254 char label, constraint", strings.Repeat("a.a", 84) + "aaa", true, true},
++		{"253 char label, name", strings.Repeat("a.a", 84) + "aa", false, true},
++		{"253 char label, constraint", strings.Repeat("a.a", 84) + "aa", true, true},
++		{"64 char single label, name", strings.Repeat("a", 64), false, true},
++		{"64 char single label, constraint", strings.Repeat("a", 64), true, true},
++		{"64 char label, name", "a." + strings.Repeat("a", 64), false, true},
++		{"64 char label, constraint", "a." + strings.Repeat("a", 64), true, true},
++
++		// Check we properly enforce properties of domain names.
+ 		{"empty name, constraint", "", true, true},
+ 		{"empty label, name", "a..a", false, false},
+ 		{"empty label, constraint", "a..a", true, false},
+@@ -124,23 +151,60 @@ func TestDomainNameValid(t *testing.T) {
+ 		{"trailing period, constraint", "a.", true, false},
+ 		{"bare label, name", "a", false, true},
+ 		{"bare label, constraint", "a", true, true},
+-		{"254 char label, name", strings.Repeat("a.a", 84) + "aaa", false, false},
+-		{"254 char label, constraint", strings.Repeat("a.a", 84) + "aaa", true, false},
+-		{"253 char label, name", strings.Repeat("a.a", 84) + "aa", false, false},
+-		{"253 char label, constraint", strings.Repeat("a.a", 84) + "aa", true, false},
+-		{"64 char single label, name", strings.Repeat("a", 64), false, false},
+-		{"64 char single label, constraint", strings.Repeat("a", 64), true, false},
+ 		{"63 char single label, name", strings.Repeat("a", 63), false, true},
+ 		{"63 char single label, constraint", strings.Repeat("a", 63), true, true},
+-		{"64 char label, name", "a." + strings.Repeat("a", 64), false, false},
+-		{"64 char label, constraint", "a." + strings.Repeat("a", 64), true, false},
+ 		{"63 char label, name", "a." + strings.Repeat("a", 63), false, true},
+ 		{"63 char label, constraint", "a." + strings.Repeat("a", 63), true, true},
+ 	} {
+ 		t.Run(tc.name, func(t *testing.T) {
+-			if tc.valid != domainNameValid(tc.dnsName, tc.constraint) {
++			valid := domainNameValid(tc.dnsName, tc.constraint)
++			if tc.valid != valid {
+ 				t.Errorf("domainNameValid(%q, %t) = %v; want %v", tc.dnsName, tc.constraint, !tc.valid, tc.valid)
+ 			}
++			// Also check that we enforce the same properties as domainToReverseLabels
++			trimmedName := tc.dnsName
++			if tc.constraint && len(trimmedName) > 1 && trimmedName[0] == '.' {
++				trimmedName = trimmedName[1:]
++			}
++			_, revValid := domainToReverseLabels(trimmedName)
++			if valid != revValid {
++				t.Errorf("domainNameValid(%q, %t) = %t != domainToReverseLabels(%q) = %t", tc.dnsName, tc.constraint, valid, trimmedName, revValid)
++			}
+ 		})
+ 	}
+ }
++
++func TestRoundtripWeirdSANs(t *testing.T) {
++	// TODO(#75835): check that certificates we create with CreateCertificate that have malformed SAN values
++	// can be parsed by ParseCertificate. We should eventually restrict this, but for now we have to maintain
++	// this property as people have been relying on it.
++	k, err := ecdsa.GenerateKey(elliptic.P256(), rand.Reader)
++	if err != nil {
++		t.Fatal(err)
++	}
++	badNames := []string{
++		"baredomain",
++		"baredomain.",
++		strings.Repeat("a", 255),
++		strings.Repeat("a", 65) + ".com",
++	}
++	tmpl := &Certificate{
++		EmailAddresses: badNames,
++		DNSNames:       badNames,
++	}
++	b, err := CreateCertificate(rand.Reader, tmpl, tmpl, &k.PublicKey, k)
++	if err != nil {
++		t.Fatal(err)
++	}
++	_, err = ParseCertificate(b)
++	if err != nil {
++		t.Fatalf("Couldn't roundtrip certificate: %v", err)
++	}
++}
++
++func FuzzDomainNameValid(f *testing.F) {
++	f.Fuzz(func(t *testing.T, data string) {
++		domainNameValid(data, false)
++		domainNameValid(data, true)
++	})
++}
+diff --git a/src/crypto/x509/verify.go b/src/crypto/x509/verify.go
+index 14cd23f..e670786 100644
+--- a/src/crypto/x509/verify.go
++++ b/src/crypto/x509/verify.go
+@@ -393,7 +393,7 @@ func domainToReverseLabels(domain string) (reverseLabels []string, ok bool) {
+ 	return reverseLabels, true
+ }
+ 
+-func matchEmailConstraint(mailbox rfc2821Mailbox, constraint string) (bool, error) {
++func matchEmailConstraint(mailbox rfc2821Mailbox, constraint string, reversedDomainsCache map[string][]string, reversedConstraintsCache map[string][]string) (bool, error) {
+ 	// If the constraint contains an @, then it specifies an exact mailbox
+ 	// name.
+ 	if strings.Contains(constraint, "@") {
+@@ -406,10 +406,10 @@ func matchEmailConstraint(mailbox rfc2821Mailbox, constraint string) (bool, erro
+ 
+ 	// Otherwise the constraint is like a DNS constraint of the domain part
+ 	// of the mailbox.
+-	return matchDomainConstraint(mailbox.domain, constraint)
++	return matchDomainConstraint(mailbox.domain, constraint, reversedDomainsCache, reversedConstraintsCache)
+ }
+ 
+-func matchURIConstraint(uri *url.URL, constraint string) (bool, error) {
++func matchURIConstraint(uri *url.URL, constraint string, reversedDomainsCache map[string][]string, reversedConstraintsCache map[string][]string) (bool, error) {
+ 	// From RFC 5280, Section 4.2.1.10:
+ 	// “a uniformResourceIdentifier that does not include an authority
+ 	// component with a host name specified as a fully qualified domain
+@@ -438,7 +438,7 @@ func matchURIConstraint(uri *url.URL, constraint string) (bool, error) {
+ 		return false, fmt.Errorf("URI with IP (%q) cannot be matched against constraints", uri.String())
+ 	}
+ 
+-	return matchDomainConstraint(host, constraint)
++	return matchDomainConstraint(host, constraint, reversedDomainsCache, reversedConstraintsCache)
+ }
+ 
+ func matchIPConstraint(ip net.IP, constraint *net.IPNet) (bool, error) {
+@@ -455,16 +455,21 @@ func matchIPConstraint(ip net.IP, constraint *net.IPNet) (bool, error) {
+ 	return true, nil
+ }
+ 
+-func matchDomainConstraint(domain, constraint string) (bool, error) {
++func matchDomainConstraint(domain, constraint string, reversedDomainsCache map[string][]string, reversedConstraintsCache map[string][]string) (bool, error) {
+ 	// The meaning of zero length constraints is not specified, but this
+ 	// code follows NSS and accepts them as matching everything.
+ 	if len(constraint) == 0 {
+ 		return true, nil
+ 	}
+ 
+-	domainLabels, ok := domainToReverseLabels(domain)
+-	if !ok {
+-		return false, fmt.Errorf("x509: internal error: cannot parse domain %q", domain)
++	domainLabels, found := reversedDomainsCache[domain]
++	if !found {
++		var ok bool
++		domainLabels, ok = domainToReverseLabels(domain)
++		if !ok {
++			return false, fmt.Errorf("x509: internal error: cannot parse domain %q", domain)
++		}
++		reversedDomainsCache[domain] = domainLabels
+ 	}
+ 
+ 	// RFC 5280 says that a leading period in a domain name means that at
+@@ -478,9 +483,14 @@ func matchDomainConstraint(domain, constraint string) (bool, error) {
+ 		constraint = constraint[1:]
+ 	}
+ 
+-	constraintLabels, ok := domainToReverseLabels(constraint)
+-	if !ok {
+-		return false, fmt.Errorf("x509: internal error: cannot parse domain %q", constraint)
++	constraintLabels, found := reversedConstraintsCache[constraint]
++	if !found {
++		var ok bool
++		constraintLabels, ok = domainToReverseLabels(constraint)
++		if !ok {
++			return false, fmt.Errorf("x509: internal error: cannot parse domain %q", constraint)
++		}
++		reversedConstraintsCache[constraint] = constraintLabels
+ 	}
+ 
+ 	if len(domainLabels) < len(constraintLabels) ||
+@@ -601,6 +611,19 @@ func (c *Certificate) isValid(certType int, currentChain []*Certificate, opts *V
+ 		}
+ 	}
+ 
++	// Each time we do constraint checking, we need to check the constraints in
++	// the current certificate against all of the names that preceded it. We
++	// reverse these names using domainToReverseLabels, which is a relatively
++	// expensive operation. Since we check each name against each constraint,
++	// this requires us to do N*C calls to domainToReverseLabels (where N is the
++	// total number of names that preceed the certificate, and C is the total
++	// number of constraints in the certificate). By caching the results of
++	// calling domainToReverseLabels, we can reduce that to N+C calls at the
++	// cost of keeping all of the parsed names and constraints in memory until
++	// we return from isValid.
++	reversedDomainsCache := map[string][]string{}
++	reversedConstraintsCache := map[string][]string{}
++
+ 	if (certType == intermediateCertificate || certType == rootCertificate) &&
+ 		c.hasNameConstraints() {
+ 		toCheck := []*Certificate{}
+@@ -621,20 +644,20 @@ func (c *Certificate) isValid(certType int, currentChain []*Certificate, opts *V
+ 
+ 					if err := c.checkNameConstraints(&comparisonCount, maxConstraintComparisons, "email address", name, mailbox,
+ 						func(parsedName, constraint any) (bool, error) {
+-							return matchEmailConstraint(parsedName.(rfc2821Mailbox), constraint.(string))
++							return matchEmailConstraint(parsedName.(rfc2821Mailbox), constraint.(string), reversedDomainsCache, reversedConstraintsCache)
+ 						}, c.PermittedEmailAddresses, c.ExcludedEmailAddresses); err != nil {
+ 						return err
+ 					}
+ 
+ 				case nameTypeDNS:
+ 					name := string(data)
+-					if _, ok := domainToReverseLabels(name); !ok {
++					if !domainNameValid(name, false) {
+ 						return fmt.Errorf("x509: cannot parse dnsName %q", name)
+ 					}
+ 
+ 					if err := c.checkNameConstraints(&comparisonCount, maxConstraintComparisons, "DNS name", name, name,
+ 						func(parsedName, constraint any) (bool, error) {
+-							return matchDomainConstraint(parsedName.(string), constraint.(string))
++							return matchDomainConstraint(parsedName.(string), constraint.(string), reversedDomainsCache, reversedConstraintsCache)
+ 						}, c.PermittedDNSDomains, c.ExcludedDNSDomains); err != nil {
+ 						return err
+ 					}
+@@ -648,7 +671,7 @@ func (c *Certificate) isValid(certType int, currentChain []*Certificate, opts *V
+ 
+ 					if err := c.checkNameConstraints(&comparisonCount, maxConstraintComparisons, "URI", name, uri,
+ 						func(parsedName, constraint any) (bool, error) {
+-							return matchURIConstraint(parsedName.(*url.URL), constraint.(string))
++							return matchURIConstraint(parsedName.(*url.URL), constraint.(string), reversedDomainsCache, reversedConstraintsCache)
+ 						}, c.PermittedURIDomains, c.ExcludedURIDomains); err != nil {
+ 						return err
+ 					}
+diff --git a/src/crypto/x509/verify_test.go b/src/crypto/x509/verify_test.go
+index 4a7d8da..ba5c392 100644
+--- a/src/crypto/x509/verify_test.go
++++ b/src/crypto/x509/verify_test.go
+@@ -1549,7 +1549,7 @@ var nameConstraintTests = []struct {
+ 
+ func TestNameConstraints(t *testing.T) {
+ 	for i, test := range nameConstraintTests {
+-		result, err := matchDomainConstraint(test.domain, test.constraint)
++		result, err := matchDomainConstraint(test.domain, test.constraint, map[string][]string{}, map[string][]string{})
+ 
+ 		if err != nil && !test.expectError {
+ 			t.Errorf("unexpected error for test #%d: domain=%s, constraint=%s, err=%s", i, test.domain, test.constraint, err)
+-- 
+2.43.0
+
-- 
2.43.0


