Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30091CD13D2
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:58:49 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19313.1762873127154617045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RHXlP15P;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-343806688c5so2603589a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873126; x=1763477926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rO6YuutnoiS/TIEKraEwqdBzEss/Tmz9SLQUuLVhytM=;
        b=RHXlP15P2iEipvbfJZ77fQwh26rfmeRL7A7BxJdJKsTRUvRFKlccZ8j+6h5G/CvRkM
         i/M1uaqf1zASTHlKdEzBikN/WRgHjq12wsGPPlTww1eBG3L1GaGgjkuDYv+Id+MQsMgA
         jx6fx+gIuDyA7fZ4eIxNFRntyAqDIHSKqK+6uYw+Sys9adT97hv4jiYt9YP+y52pcb6C
         n7d7nEQJ54nSPoiDqbEZLpSgl7H4JNmMCvzfI78xwtViY50pCBI78Gw/hPb0wBctFkAM
         T8XJqxvYsIg6+E/SLIE7kaolYWUHuGpfDFnxDL9KD2m+VsPl2pxv/DbPIJw+DL2xDYSy
         AACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873126; x=1763477926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rO6YuutnoiS/TIEKraEwqdBzEss/Tmz9SLQUuLVhytM=;
        b=TRobmY+IC0dSgBLixBAjgL8dSA5etmsqLjdl4MuGDbwJbGINOjUjUSJ/oc2u+T+Y2i
         Dc0/qEm9qZ9wWnnjtBhCsEOekIH6zl3xpcUnsC49sKFscTtw7A+FQVzchSgZCBh6uffM
         fdRh1aLCjqrkGEn5xNTTcxsqbwm36HgFukIzC45Yr851Bo7xH7V7H2sgr4d4FXz9pMUT
         NiM37GNXbbB7LSHRVwOE/qzv8Q1BWBPaL/UdDKNiLgm7gwTCB6BTkPn+jZ0tmsaTNXou
         RLcociCrJQ1oAK4a2oSHh82nmF+ao26VkdlSUBjhoASmRZYVEwgG2fuc9xR0cm9UCpV7
         Aivw==
X-Gm-Message-State: AOJu0YxTEGfMXimMfv9XnbMGlbb5MfuX/oKIgoe8mYfLnvJYzR7RhWql
	NPtFxflnR/i6KhKB79kSiVsNv8nluw5lztb/WAZCN+CvSbYu05IpxHe5lOUSWKwT2SloMD4ELhx
	rUTzHrMY=
X-Gm-Gg: ASbGnctT3rmgSNi9odxxXMtwEGD72AxyedK2WSondCaAf37UAz883GG6WCTE27vSzgx
	CiLuoCDA/4CjH9OJsSJIOFwliaczoimjVH1qcy1/UE0nq13JfDghwlgNmHwjTeaHtSRWm3wZ/c5
	Nz6tC2G7YqycdPIkKQWclHdGzYunWvos6L5rOq3OkABFU+epggQfRGby78sbU+k/bkPZlQmQrkh
	p7oIcVKF6q1pNAvyrG/O8QXmJJww9LfjWNyaeIy5Wlay6lVfmrT18nDMl7ETZWcfwoMlAnpA4zh
	IElvWNRcixqqBwTqXLcRUkFNg5XMpUZuwJ3fgq2PRMQeVByCEV5hBXYW223C6LC2zLWGPOXEj+d
	0bMUE9U2RQb44opNft1nwqZIjyHY8M5tJwcEHV99Z/UqqW3yl1LFbF8qAJTM74BescdiMsvcnIC
	GYYA==
X-Google-Smtp-Source: AGHT+IEX8GAenUKrCWHWnI95G6QS9gxvlDK682V79fJfpXzLvBJAXU5jwR5H25QtbuTvpITalpWZrA==
X-Received: by 2002:a17:90a:e18b:b0:340:bb5c:7dd7 with SMTP id 98e67ed59e1d1-3436cb7ad33mr13593775a91.5.1762873126243;
        Tue, 11 Nov 2025 06:58:46 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.58.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:58:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/19] go: fix CVE-2025-58187
Date: Tue, 11 Nov 2025 06:58:11 -0800
Message-ID: <ce1626d1f1e232bc6da81e89088d0c0f5f3c52b4.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226168

From: Archana Polampalli <archana.polampalli@windriver.com>

Due to the design of the name constraint checking algorithm, the processing
time of some inputs scals non-linearly with respect to the size of the certificate.
This affects programs which validate arbitrary certificate chains.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-58187.patch                | 349 ++++++++++++++++++
 2 files changed, 350 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-58187.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 38992219c8..a1c14ea684 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -22,6 +22,7 @@ SRC_URI += "\
     file://CVE-2025-47907.patch \
     file://CVE-2025-47906.patch \
     file://CVE-2025-58185.patch \
+    file://CVE-2025-58187.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-58187.patch b/meta/recipes-devtools/go/go/CVE-2025-58187.patch
new file mode 100644
index 0000000000..d3b7dd5264
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-58187.patch
@@ -0,0 +1,349 @@
+From f334417e71f8b078ad64035bddb6df7f8910da6c Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Mon, 15 Sep 2025 16:31:22 -0400
+Subject: [PATCH] [release-branch.go1.24] crypto/x509: improve domain name
+ verification
+
+Don't use domainToReverseLabels to check if domain names are
+valid, since it is not particularly performant, and can contribute to DoS
+vectors. Instead just iterate over the name and enforce the properties we
+care about.
+
+This also enforces that DNS names, both in SANs and name constraints,
+are valid. We previously allowed invalid SANs, because some
+intermediates had these weird names (see #23995), but there are
+currently no trusted intermediates that have this property, and since we
+target the web PKI, supporting this particular case is not a high
+priority.
+
+Thank you to Jakub Ciolek for reporting this issue.
+
+Fixes CVE-2025-58187
+For #75681
+Fixes #75714
+
+Change-Id: I6ebce847dcbe5fc63ef2f9a74f53f11c4c56d3d1
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2820
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2982
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/709839
+Auto-Submit: Michael Pratt <mpratt@google.com>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+TryBot-Bypass: Michael Pratt <mpratt@google.com>
+
+CVE: CVE-2025-58187
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/f334417e71f8b078ad64035bddb6df7f8910da6c]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/crypto/x509/name_constraints_test.go | 66 ++------------------
+ src/crypto/x509/parser.go                | 77 ++++++++++++++----------
+ src/crypto/x509/parser_test.go           | 43 +++++++++++++
+ src/crypto/x509/verify.go                |  1 +
+ 4 files changed, 95 insertions(+), 92 deletions(-)
+
+diff --git a/src/crypto/x509/name_constraints_test.go b/src/crypto/x509/name_constraints_test.go
+index 78263fc..9aaa6d7 100644
+--- a/src/crypto/x509/name_constraints_test.go
++++ b/src/crypto/x509/name_constraints_test.go
+@@ -1456,63 +1456,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+		expectedError: "incompatible key usage",
+	},
+
+-	// An invalid DNS SAN should be detected only at validation time so
+-	// that we can process CA certificates in the wild that have invalid SANs.
+-	// See https://github.com/golang/go/issues/23995
+-
+-	// #77: an invalid DNS or mail SAN will not be detected if name constraint
+-	// checking is not triggered.
+-	{
+-		roots: make([]constraintsSpec, 1),
+-		intermediates: [][]constraintsSpec{
+-			{
+-				{},
+-			},
+-		},
+-		leaf: leafSpec{
+-			sans: []string{"dns:this is invalid", "email:this @ is invalid"},
+-		},
+-	},
+-
+-	// #78: an invalid DNS SAN will be detected if any name constraint checking
+-	// is triggered.
+-	{
+-		roots: []constraintsSpec{
+-			{
+-				bad: []string{"uri:"},
+-			},
+-		},
+-		intermediates: [][]constraintsSpec{
+-			{
+-				{},
+-			},
+-		},
+-		leaf: leafSpec{
+-			sans: []string{"dns:this is invalid"},
+-		},
+-		expectedError: "cannot parse dnsName",
+-	},
+-
+-	// #79: an invalid email SAN will be detected if any name constraint
+-	// checking is triggered.
+-	{
+-		roots: []constraintsSpec{
+-			{
+-				bad: []string{"uri:"},
+-			},
+-		},
+-		intermediates: [][]constraintsSpec{
+-			{
+-				{},
+-			},
+-		},
+-		leaf: leafSpec{
+-			sans: []string{"email:this @ is invalid"},
+-		},
+-		expectedError: "cannot parse rfc822Name",
+-	},
+-
+-	// #80: if several EKUs are requested, satisfying any of them is sufficient.
++	// #77: if several EKUs are requested, satisfying any of them is sufficient.
+	{
+		roots: make([]constraintsSpec, 1),
+		intermediates: [][]constraintsSpec{
+@@ -1527,7 +1471,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+		requestedEKUs: []ExtKeyUsage{ExtKeyUsageClientAuth, ExtKeyUsageEmailProtection},
+	},
+
+-	// #81: EKUs that are not asserted in VerifyOpts are not required to be
++	// #78: EKUs that are not asserted in VerifyOpts are not required to be
+	// nested.
+	{
+		roots: make([]constraintsSpec, 1),
+@@ -1546,7 +1490,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+		},
+	},
+
+-	// #82: a certificate without SANs and CN is accepted in a constrained chain.
++	// #79: a certificate without SANs and CN is accepted in a constrained chain.
+	{
+		roots: []constraintsSpec{
+			{
+@@ -1563,7 +1507,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+		},
+	},
+
+-	// #83: a certificate without SANs and with a CN that does not parse as a
++	// #80: a certificate without SANs and with a CN that does not parse as a
+	// hostname is accepted in a constrained chain.
+	{
+		roots: []constraintsSpec{
+@@ -1582,7 +1526,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+		},
+	},
+
+-	// #84: a certificate with SANs and CN is accepted in a constrained chain.
++	// #81: a certificate with SANs and CN is accepted in a constrained chain.
+	{
+		roots: []constraintsSpec{
+			{
+diff --git a/src/crypto/x509/parser.go b/src/crypto/x509/parser.go
+index 812b0d2..9a3bcd6 100644
+--- a/src/crypto/x509/parser.go
++++ b/src/crypto/x509/parser.go
+@@ -378,10 +378,14 @@ func parseSANExtension(der cryptobyte.String) (dnsNames, emailAddresses []string
+			if err := isIA5String(email); err != nil {
+				return errors.New("x509: SAN rfc822Name is malformed")
+			}
++			parsed, ok := parseRFC2821Mailbox(email)
++			if !ok || (ok && !domainNameValid(parsed.domain, false)) {
++				return errors.New("x509: SAN rfc822Name is malformed")
++			}
+			emailAddresses = append(emailAddresses, email)
+		case nameTypeDNS:
+			name := string(data)
+-			if err := isIA5String(name); err != nil {
++			if err := isIA5String(name); err != nil || (err == nil && !domainNameValid(name, false)) {
+				return errors.New("x509: SAN dNSName is malformed")
+			}
+			dnsNames = append(dnsNames, string(name))
+@@ -391,14 +395,9 @@ func parseSANExtension(der cryptobyte.String) (dnsNames, emailAddresses []string
+				return errors.New("x509: SAN uniformResourceIdentifier is malformed")
+			}
+			uri, err := url.Parse(uriStr)
+-			if err != nil {
++			if err != nil || (err == nil && uri.Host != "" && !domainNameValid(uri.Host, false)) {
+				return fmt.Errorf("x509: cannot parse URI %q: %s", uriStr, err)
+			}
+-			if len(uri.Host) > 0 {
+-				if _, ok := domainToReverseLabels(uri.Host); !ok {
+-					return fmt.Errorf("x509: cannot parse URI %q: invalid domain", uriStr)
+-				}
+-			}
+			uris = append(uris, uri)
+		case nameTypeIP:
+			switch len(data) {
+@@ -538,15 +537,7 @@ func parseNameConstraintsExtension(out *Certificate, e pkix.Extension) (unhandle
+					return nil, nil, nil, nil, errors.New("x509: invalid constraint value: " + err.Error())
+				}
+
+-				trimmedDomain := domain
+-				if len(trimmedDomain) > 0 && trimmedDomain[0] == '.' {
+-					// constraints can have a leading
+-					// period to exclude the domain
+-					// itself, but that's not valid in a
+-					// normal domain name.
+-					trimmedDomain = trimmedDomain[1:]
+-				}
+-				if _, ok := domainToReverseLabels(trimmedDomain); !ok {
++				if !domainNameValid(domain, true) {
+					return nil, nil, nil, nil, fmt.Errorf("x509: failed to parse dnsName constraint %q", domain)
+				}
+				dnsNames = append(dnsNames, domain)
+@@ -587,12 +578,7 @@ func parseNameConstraintsExtension(out *Certificate, e pkix.Extension) (unhandle
+						return nil, nil, nil, nil, fmt.Errorf("x509: failed to parse rfc822Name constraint %q", constraint)
+					}
+				} else {
+-					// Otherwise it's a domain name.
+-					domain := constraint
+-					if len(domain) > 0 && domain[0] == '.' {
+-						domain = domain[1:]
+-					}
+-					if _, ok := domainToReverseLabels(domain); !ok {
++					if !domainNameValid(constraint, true) {
+						return nil, nil, nil, nil, fmt.Errorf("x509: failed to parse rfc822Name constraint %q", constraint)
+					}
+				}
+@@ -608,15 +594,7 @@ func parseNameConstraintsExtension(out *Certificate, e pkix.Extension) (unhandle
+					return nil, nil, nil, nil, fmt.Errorf("x509: failed to parse URI constraint %q: cannot be IP address", domain)
+				}
+
+-				trimmedDomain := domain
+-				if len(trimmedDomain) > 0 && trimmedDomain[0] == '.' {
+-					// constraints can have a leading
+-					// period to exclude the domain itself,
+-					// but that's not valid in a normal
+-					// domain name.
+-					trimmedDomain = trimmedDomain[1:]
+-				}
+-				if _, ok := domainToReverseLabels(trimmedDomain); !ok {
++				if !domainNameValid(domain, true) {
+					return nil, nil, nil, nil, fmt.Errorf("x509: failed to parse URI constraint %q", domain)
+				}
+				uriDomains = append(uriDomains, domain)
+@@ -1197,3 +1175,40 @@ func ParseRevocationList(der []byte) (*RevocationList, error) {
+
+	return rl, nil
+ }
++
++// domainNameValid does minimal domain name validity checking. In particular it
++// enforces the following properties:
++//   - names cannot have the trailing period
++//   - names can only have a leading period if constraint is true
++//   - names must be <= 253 characters
++//   - names cannot have empty labels
++//   - names cannot labels that are longer than 63 characters
++//
++// Note that this does not enforce the LDH requirements for domain names.
++func domainNameValid(s string, constraint bool) bool {
++	if len(s) == 0 && constraint {
++		return true
++	}
++	if len(s) == 0 || (!constraint && s[0] == '.') || s[len(s)-1] == '.' || len(s) > 253 {
++		return false
++	}
++	lastDot := -1
++	if constraint && s[0] == '.' {
++		s = s[1:]
++	}
++
++	for i := 0; i <= len(s); i++ {
++		if i == len(s) || s[i] == '.' {
++			labelLen := i
++			if lastDot >= 0 {
++				labelLen -= lastDot + 1
++			}
++			if labelLen == 0 || labelLen > 63 {
++				return false
++			}
++			lastDot = i
++		}
++	}
++
++	return true
++}
+diff --git a/src/crypto/x509/parser_test.go b/src/crypto/x509/parser_test.go
+index b31f9cd..a6cdfb8 100644
+--- a/src/crypto/x509/parser_test.go
++++ b/src/crypto/x509/parser_test.go
+@@ -6,6 +6,7 @@ package x509
+
+ import (
+	"encoding/asn1"
++	"strings"
+	"testing"
+
+	cryptobyte_asn1 "golang.org/x/crypto/cryptobyte/asn1"
+@@ -101,3 +102,45 @@ func TestParseASN1String(t *testing.T) {
+		})
+	}
+ }
++
++func TestDomainNameValid(t *testing.T) {
++	for _, tc := range []struct {
++		name       string
++		dnsName    string
++		constraint bool
++		valid      bool
++	}{
++		{"empty name, name", "", false, false},
++		{"empty name, constraint", "", true, true},
++		{"empty label, name", "a..a", false, false},
++		{"empty label, constraint", "a..a", true, false},
++		{"period, name", ".", false, false},
++		{"period, constraint", ".", true, false}, // TODO(roland): not entirely clear if this is a valid constraint (require at least one label?)
++		{"valid, name", "a.b.c", false, true},
++		{"valid, constraint", "a.b.c", true, true},
++		{"leading period, name", ".a.b.c", false, false},
++		{"leading period, constraint", ".a.b.c", true, true},
++		{"trailing period, name", "a.", false, false},
++		{"trailing period, constraint", "a.", true, false},
++		{"bare label, name", "a", false, true},
++		{"bare label, constraint", "a", true, true},
++		{"254 char label, name", strings.Repeat("a.a", 84) + "aaa", false, false},
++		{"254 char label, constraint", strings.Repeat("a.a", 84) + "aaa", true, false},
++		{"253 char label, name", strings.Repeat("a.a", 84) + "aa", false, false},
++		{"253 char label, constraint", strings.Repeat("a.a", 84) + "aa", true, false},
++		{"64 char single label, name", strings.Repeat("a", 64), false, false},
++		{"64 char single label, constraint", strings.Repeat("a", 64), true, false},
++		{"63 char single label, name", strings.Repeat("a", 63), false, true},
++		{"63 char single label, constraint", strings.Repeat("a", 63), true, true},
++		{"64 char label, name", "a." + strings.Repeat("a", 64), false, false},
++		{"64 char label, constraint", "a." + strings.Repeat("a", 64), true, false},
++		{"63 char label, name", "a." + strings.Repeat("a", 63), false, true},
++		{"63 char label, constraint", "a." + strings.Repeat("a", 63), true, true},
++	} {
++		t.Run(tc.name, func(t *testing.T) {
++			if tc.valid != domainNameValid(tc.dnsName, tc.constraint) {
++				t.Errorf("domainNameValid(%q, %t) = %v; want %v", tc.dnsName, tc.constraint, !tc.valid, tc.valid)
++			}
++		})
++	}
++}
+diff --git a/src/crypto/x509/verify.go b/src/crypto/x509/verify.go
+index 2d2a271..4502d4c 100644
+--- a/src/crypto/x509/verify.go
++++ b/src/crypto/x509/verify.go
+@@ -360,6 +360,7 @@ func parseRFC2821Mailbox(in string) (mailbox rfc2821Mailbox, ok bool) {
+ // domainToReverseLabels converts a textual domain name like foo.example.com to
+ // the list of labels in reverse order, e.g. ["com", "example", "foo"].
+ func domainToReverseLabels(domain string) (reverseLabels []string, ok bool) {
++	reverseLabels = make([]string, 0, strings.Count(domain, ".")+1)
+	for len(domain) > 0 {
+		if i := strings.LastIndexByte(domain, '.'); i == -1 {
+			reverseLabels = append(reverseLabels, domain)
+--
+2.40.0
-- 
2.43.0


