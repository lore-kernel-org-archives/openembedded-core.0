Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21912D3B7E5
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 12:48:12 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42626.1767012487620248643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 04:48:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GBEexkMd;
 spf=pass (domain: mvista.com, ip: 209.85.216.54, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34be2be4b7cso5881504a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 04:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1767012486; x=1767617286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dAWNJDAczfS8wQX7XNOTdL8yYB2lpdmZtQVnV9S+gL4=;
        b=GBEexkMdNzJa2cc/nE1YnBoqdeofFLYEfr8ZA+JVr/zghomwlr3ACvzhUrqGawGOFl
         G0URakJw2K+s7Mp8NM6x8NhrC7Psj4xhRPDJNl7mOm7uzV85tWq6Jvt9BweSmUSqZB3F
         IcPQgGwMKoKPWnCvxE5NcCV6bEeRxiiVORH5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767012486; x=1767617286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAWNJDAczfS8wQX7XNOTdL8yYB2lpdmZtQVnV9S+gL4=;
        b=e8p8E75CBz+S34gqf1ojzzS9fbXAxUUmMJv+9cNWCMObimHPMsr/1b3teM9Hx03OqO
         Z7vnsxX14v4KuUw2ceEehLmApOt6yzlNtaQPWnF6Dnnr6Sw77t6ldWsRdxHl0cueAJwE
         jd4i1ohtsyMXjfMJ+ChsDGJRcmRT9qCtPpGyiYeCZ3b4AWUoVZsCrecPbvAmNVEHRJyn
         LdHbMkYBBfMbGWASGzBzVnPctJ9PX3M4sI6b886PHQIqo/yBIiooXy232ANpsnac0v2B
         CrRWSk2VcRC4TCGPr6aWMVhQZqJ0JjdcI9WuQlccnPSzeReJ59UHjfuItONpwraD7ant
         Fn/Q==
X-Gm-Message-State: AOJu0Yzjh1Dah+/mEGS2WshLv1JBOkbLj7fB7HW6DfsXEn9xPFw4MQ6t
	6PY77o9UYlZZluopHf+CtjKlhUNXj7aNnrVt3aD333ATpeHQom6LISzxoUqYRAP0Il99xPsb/Hf
	oagkonao=
X-Gm-Gg: AY/fxX6b/CR4WW/lruG6HjRBcriMR/sPv73f3phwNR8FqGA2WZG/XS/PlDUSKKLWzd9
	j+nE4bSJbw5yipde+31FLRjhl59jzKuThfsXRQLrNTjKm2pZlsvVRyn+abFd66lWAs5DZ6z7azg
	9t//VOr1ifgNyvZeggYI/gayv/yT6ovZkNf9BkaA41qunerI2jBdbtBk51ANOvkzncoJlTW+Z+o
	yn69901G8JrHnDfNgizlZLlqNRlSEcj1H6c8LY9KTJ94ayUtb7wpI6oYXPPy3i4cb5seqhspDAg
	gnnQ2NT7ZXnOpXyDKbTHkF1C1BDjMvBQCQ/DuTzfxQto3+41XYVgJ31oVy1N5AA0gCFzF1vFGgh
	Dl2OjA5eBX7mF4SKlrgU/HkrD2Mg7ENX1kbChkANy2cQBZ7K6tb5sykuxMbaCr9ZGIcBZ80dRxB
	JOW5iU4Et0siYV46rRl2lFCM0i
X-Google-Smtp-Source: AGHT+IHcLF77uWJwzuMPis1gcL2TKB5V24tcghspyfMg9XM3Cen6JnSgf1CtnHmrEMYznB8UM+i1gw==
X-Received: by 2002:a17:90b:3c4e:b0:340:c60b:f362 with SMTP id 98e67ed59e1d1-34e921131a2mr27651186a91.6.1767012486234;
        Mon, 29 Dec 2025 04:48:06 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:54:6779:8047:e5eb:447c:8ecc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e921b1666sm27431208a91.7.2025.12.29.04.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 04:48:05 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 1/3] go: Update CVE-2025-58187
Date: Mon, 29 Dec 2025 18:17:53 +0530
Message-Id: <20251229124755.462274-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 12:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228602

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/golang/go/commit/ca6a5545ba18844a97c88a90a385eb6335bb7526

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   3 +-
 ...025-58187.patch => CVE-2025-58187-1.patch} |   0
 .../go/go-1.18/CVE-2025-58187-2.patch         | 516 ++++++++++++++++++
 3 files changed, 518 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/go/go-1.18/{CVE-2025-58187.patch => CVE-2025-58187-1.patch} (100%)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2025-58187-2.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 47ef84c35a..1433d54f06 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -69,7 +69,8 @@ SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main \
            file://CVE-2025-47907.patch \
            file://CVE-2025-47906.patch \
            file://CVE-2024-24783.patch \
-           file://CVE-2025-58187.patch \
+           file://CVE-2025-58187-1.patch \
+           file://CVE-2025-58187-2.patch \
            file://CVE-2025-58189.patch \
            file://CVE-2025-61723.patch \
            file://CVE-2025-61724.patch \
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2025-58187.patch b/meta/recipes-devtools/go/go-1.18/CVE-2025-58187-1.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.18/CVE-2025-58187.patch
rename to meta/recipes-devtools/go/go-1.18/CVE-2025-58187-1.patch
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2025-58187-2.patch b/meta/recipes-devtools/go/go-1.18/CVE-2025-58187-2.patch
new file mode 100644
index 0000000000..65f176f027
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2025-58187-2.patch
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
+index d4f7d41..c59a7dc 100644
+--- a/src/crypto/x509/name_constraints_test.go
++++ b/src/crypto/x509/name_constraints_test.go
+@@ -1452,7 +1452,63 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 		requestedEKUs: []ExtKeyUsage{ExtKeyUsageServerAuth},
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
+@@ -1467,7 +1523,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 		requestedEKUs: []ExtKeyUsage{ExtKeyUsageClientAuth, ExtKeyUsageEmailProtection},
+ 	},
+ 
+-	// #78: EKUs that are not asserted in VerifyOpts are not required to be
++	// #81: EKUs that are not asserted in VerifyOpts are not required to be
+ 	// nested.
+ 	{
+ 		roots: make([]constraintsSpec, 1),
+@@ -1486,7 +1542,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 		},
+ 	},
+ 
+-	// #79: a certificate without SANs and CN is accepted in a constrained chain.
++	// #82: a certificate without SANs and CN is accepted in a constrained chain.
+ 	{
+ 		roots: []constraintsSpec{
+ 			{
+@@ -1503,7 +1559,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 		},
+ 	},
+ 
+-	// #80: a certificate without SANs and with a CN that does not parse as a
++	// #83: a certificate without SANs and with a CN that does not parse as a
+ 	// hostname is accepted in a constrained chain.
+ 	{
+ 		roots: []constraintsSpec{
+@@ -1522,7 +1578,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 		},
+ 	},
+ 
+-	// #81: a certificate with SANs and CN is accepted in a constrained chain.
++	// #84: a certificate with SANs and CN is accepted in a constrained chain.
+ 	{
+ 		roots: []constraintsSpec{
+ 			{
+diff --git a/src/crypto/x509/parser.go b/src/crypto/x509/parser.go
+index 0788210..cfe4c86 100644
+--- a/src/crypto/x509/parser.go
++++ b/src/crypto/x509/parser.go
+@@ -391,14 +391,10 @@ func parseSANExtension(der cryptobyte.String) (dnsNames, emailAddresses []string
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
+@@ -408,9 +404,12 @@ func parseSANExtension(der cryptobyte.String) (dnsNames, emailAddresses []string
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
+@@ -990,36 +989,58 @@ func ParseCertificates(der []byte) ([]*Certificate, error) {
+ 	return certs, nil
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
+index 95ed116..662e305 100644
+--- a/src/crypto/x509/parser_test.go
++++ b/src/crypto/x509/parser_test.go
+@@ -4,6 +4,9 @@
+ package x509
+ 
+ import (
++	"crypto/ecdsa"
++	"crypto/elliptic"
++	"crypto/rand"
+ 	"encoding/asn1"
+ 	"strings"
+ 	"testing"
+@@ -109,7 +112,31 @@ func TestDomainNameValid(t *testing.T) {
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
+@@ -123,23 +150,60 @@ func TestDomainNameValid(t *testing.T) {
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
+index fb2f4b2..99f38a0 100644
+--- a/src/crypto/x509/verify.go
++++ b/src/crypto/x509/verify.go
+@@ -390,7 +390,7 @@ func domainToReverseLabels(domain string) (reverseLabels []string, ok bool) {
+ 	return reverseLabels, true
+ }
+ 
+-func matchEmailConstraint(mailbox rfc2821Mailbox, constraint string) (bool, error) {
++func matchEmailConstraint(mailbox rfc2821Mailbox, constraint string, reversedDomainsCache map[string][]string, reversedConstraintsCache map[string][]string) (bool, error) {
+ 	// If the constraint contains an @, then it specifies an exact mailbox
+ 	// name.
+ 	if strings.Contains(constraint, "@") {
+@@ -403,10 +403,10 @@ func matchEmailConstraint(mailbox rfc2821Mailbox, constraint string) (bool, erro
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
+@@ -433,7 +433,7 @@ func matchURIConstraint(uri *url.URL, constraint string) (bool, error) {
+ 		return false, fmt.Errorf("URI with IP (%q) cannot be matched against constraints", uri.String())
+ 	}
+ 
+-	return matchDomainConstraint(host, constraint)
++	return matchDomainConstraint(host, constraint, reversedDomainsCache, reversedConstraintsCache)
+ }
+ 
+ func matchIPConstraint(ip net.IP, constraint *net.IPNet) (bool, error) {
+@@ -450,16 +450,21 @@ func matchIPConstraint(ip net.IP, constraint *net.IPNet) (bool, error) {
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
+@@ -473,9 +478,14 @@ func matchDomainConstraint(domain, constraint string) (bool, error) {
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
+@@ -598,6 +608,19 @@ func (c *Certificate) isValid(certType int, currentChain []*Certificate, opts *V
+ 		leaf = currentChain[0]
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
+ 		c.hasNameConstraints() && leaf.hasSANExtension() {
+ 		err := forEachSAN(leaf.getSANExtension(), func(tag int, data []byte) error {
+@@ -611,20 +634,20 @@ func (c *Certificate) isValid(certType int, currentChain []*Certificate, opts *V
+ 
+ 				if err := c.checkNameConstraints(&comparisonCount, maxConstraintComparisons, "email address", name, mailbox,
+ 					func(parsedName, constraint interface{}) (bool, error) {
+-						return matchEmailConstraint(parsedName.(rfc2821Mailbox), constraint.(string))
++						return matchEmailConstraint(parsedName.(rfc2821Mailbox), constraint.(string), reversedDomainsCache, reversedConstraintsCache)
+ 					}, c.PermittedEmailAddresses, c.ExcludedEmailAddresses); err != nil {
+ 					return err
+ 				}
+ 
+ 			case nameTypeDNS:
+ 				name := string(data)
+-				if _, ok := domainToReverseLabels(name); !ok {
++				if !domainNameValid(name, false) {
+ 					return fmt.Errorf("x509: cannot parse dnsName %q", name)
+ 				}
+ 
+ 				if err := c.checkNameConstraints(&comparisonCount, maxConstraintComparisons, "DNS name", name, name,
+ 					func(parsedName, constraint interface{}) (bool, error) {
+-						return matchDomainConstraint(parsedName.(string), constraint.(string))
++						return matchDomainConstraint(parsedName.(string), constraint.(string), reversedDomainsCache, reversedConstraintsCache)
+ 					}, c.PermittedDNSDomains, c.ExcludedDNSDomains); err != nil {
+ 					return err
+ 				}
+@@ -638,7 +661,7 @@ func (c *Certificate) isValid(certType int, currentChain []*Certificate, opts *V
+ 
+ 				if err := c.checkNameConstraints(&comparisonCount, maxConstraintComparisons, "URI", name, uri,
+ 					func(parsedName, constraint interface{}) (bool, error) {
+-						return matchURIConstraint(parsedName.(*url.URL), constraint.(string))
++						return matchURIConstraint(parsedName.(*url.URL), constraint.(string), reversedDomainsCache, reversedConstraintsCache)
+ 					}, c.PermittedURIDomains, c.ExcludedURIDomains); err != nil {
+ 					return err
+ 				}
+diff --git a/src/crypto/x509/verify_test.go b/src/crypto/x509/verify_test.go
+index 9da39ca..31e8149 100644
+--- a/src/crypto/x509/verify_test.go
++++ b/src/crypto/x509/verify_test.go
+@@ -1648,7 +1648,7 @@ var nameConstraintTests = []struct {
+ 
+ func TestNameConstraints(t *testing.T) {
+ 	for i, test := range nameConstraintTests {
+-		result, err := matchDomainConstraint(test.domain, test.constraint)
++		result, err := matchDomainConstraint(test.domain, test.constraint, map[string][]string{}, map[string][]string{})
+ 
+ 		if err != nil && !test.expectError {
+ 			t.Errorf("unexpected error for test #%d: domain=%s, constraint=%s, err=%s", i, test.domain, test.constraint, err)
+-- 
+2.25.1
+
-- 
2.25.1


