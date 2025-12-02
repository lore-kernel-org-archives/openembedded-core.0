Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96343CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 15:10:01 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9664.1764688193729204243
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 07:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Kwlas2/D;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7ba49f92362so3219296b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764688193; x=1765292993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lluKorE/qs7jwUPCvAJZXYqPOdglcchOSu8HCTJ5hjQ=;
        b=Kwlas2/DPpEAM89fAG8jxjczdYkhI17hTdAFpYPl6uvh1rJB8i6zfKfdLou+lP5Xq2
         X95pAtWY/U3yJkwyZOkTBm5ooBhqObMF3KRX+msS+5+vfIl2QyZ0f7Z27J0c3As+nBd8
         7YW7hmzyAZK91IKLxDcdHUygu55zMot/2YgnwInGTzN4IkJCni166w6je7aOcJCQmbyK
         paTI6YXW0ZWJba+Oe35ijQylsjEGhayEpavWQPVdsj8LwnPv3nsnpT2WUiZrAEX6/veX
         31DPV/JQsQ3lYa3SrO7PS5buqYxtKrG3JXuVgqpaecDjrhBjgBAZ1IAZt9WQGGBOpHLr
         GgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764688193; x=1765292993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lluKorE/qs7jwUPCvAJZXYqPOdglcchOSu8HCTJ5hjQ=;
        b=RpfeZHZdBYV2NTkI+evoaOThrHr+N2fI51iVzY0IL4pdtLWJ6Tw6jz6abPezl01F2L
         wk6CWqzf3/FsE0I0WTRHqyq7/GtNEW6N12gNYdfAl+weCGLjcuJnWxvqdQVTI/Y6Sw0s
         fwccfafmFNILnlNuMm777+2vuCMuRs5HprtXXXCusAch+vO3nsD0VH30ZPj7L7BPgbcq
         4SS2L2Mi1lzzB5G2b87b6gIH+CD48lLDuD46teWP2S+RhL4QuAnqKffo2nHdTmvVSDg8
         T/4eZ8y5cTATo9b4Hdm5cikHvehx3big1DTtl0xAKwBbfX+n+kVF0WwZj8lJ2+OvXhZX
         32jg==
X-Gm-Message-State: AOJu0YxsvrWX53dv4MsvrkkLcRK/CgPXKKsmBN4qY8f2GbYDV1gqN+KI
	y5KgEIG2m4R6FBh6CsLdBah2laaxOfks60/eH86Ogxynf780xKml15djleP77cbY5fxfFvzIDon
	ZV0Jf
X-Gm-Gg: ASbGnctFgyNO2H4CxvrAp0lwoCaixS1+9bzBj5koS+QULIeFZwA63Fu1wtHk1PpoVlm
	YYZeJvZl37vb3xF5dItp/7dHf00dEqKNjripxoLPf/ST1wW7Xyd60aZjDX/CmMgHnmisDDEQWye
	BbJR4O3N3dUhnQ6+XtxtAGoWVfQ6GmVEy3aphhXhXZ46TEl7kamwhJ4I+vIs/FZmvHM5FO9872F
	zcJAJDV3X2maO0oPM8wjnrLjtBQatRCO8qhSnlWrqmFStorcAsPjFky2NpOa2CCFP9vKk/UAzYI
	OovU3U1lgZy/OHC0Sau/5Q4ITKgLqOQ1Ra3OVc02DlLkA9beE0vDKZShTMObc23+gRoguHBlogR
	LN1jFaZ+DKPEzD1Hz6AE3uV4wkiiELQsEtC+Bq43aE/I4nK3bIuuJgepAW3luwQHDiMxPuL/IUa
	IBgQ==
X-Google-Smtp-Source: AGHT+IENauZraWM/oTp4v//LQJMu12ejY7Jb3y0s8gLWdW/3yZyVi1MNCSkxUIDS5SiYEV0wRISCLQ==
X-Received: by 2002:a05:6a20:94c8:b0:35f:84c7:4012 with SMTP id adf61e73a8af0-363e8d5b595mr3381317637.29.1764688192515;
        Tue, 02 Dec 2025 07:09:52 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1516f6621sm17175182b3a.16.2025.12.02.07.09.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 07:09:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/10] go: fix CVE-2025-58187
Date: Tue,  2 Dec 2025 07:09:29 -0800
Message-ID: <cea9fcf1b21b1b35b88986b676d712ab8ffa9d67.1764688054.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764688053.git.steve@sakoman.com>
References: <cover.1764688053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 15:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227165

From: Archana Polampalli <archana.polampalli@windriver.com>

Due to the design of the name constraint checking algorithm, the processing time
of some inputs scale non-linearly with respect to the size of the certificate.
This affects programs which validate arbitrary certificate chains.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2025-58187.patch           | 349 ++++++++++++++++++
 2 files changed, 350 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2025-58187.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 465f24e108..c5aa3f9786 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -69,6 +69,7 @@ SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main \
            file://CVE-2025-47907.patch \
            file://CVE-2025-47906.patch \
            file://CVE-2024-24783.patch \
+           file://CVE-2025-58187.patch \
            "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2025-58187.patch b/meta/recipes-devtools/go/go-1.18/CVE-2025-58187.patch
new file mode 100644
index 0000000000..810487674c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2025-58187.patch
@@ -0,0 +1,349 @@
+From f334417e71f8b078ad64035bddb6df7f8910da6c Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Mon, 15 Sep 2025 16:31:22 -0400
+Subject: [PATCH] crypto/x509: improve domain name verification
+
+Don't use domainToReverseLabels to check if domain names are valid,
+since it is not particularly performant, and can contribute to DoS
+vectors. Instead just iterate over the name and enforce the properties
+we care about.
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
+index c59a7dc..d4f7d41 100644
+--- a/src/crypto/x509/name_constraints_test.go
++++ b/src/crypto/x509/name_constraints_test.go
+@@ -1452,63 +1452,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 		requestedEKUs: []ExtKeyUsage{ExtKeyUsageServerAuth},
+ 	},
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
+ 	{
+ 		roots: make([]constraintsSpec, 1),
+ 		intermediates: [][]constraintsSpec{
+@@ -1523,7 +1467,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 		requestedEKUs: []ExtKeyUsage{ExtKeyUsageClientAuth, ExtKeyUsageEmailProtection},
+ 	},
+ 
+-	// #81: EKUs that are not asserted in VerifyOpts are not required to be
++	// #78: EKUs that are not asserted in VerifyOpts are not required to be
+ 	// nested.
+ 	{
+ 		roots: make([]constraintsSpec, 1),
+@@ -1542,7 +1486,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 		},
+ 	},
+ 
+-	// #82: a certificate without SANs and CN is accepted in a constrained chain.
++	// #79: a certificate without SANs and CN is accepted in a constrained chain.
+ 	{
+ 		roots: []constraintsSpec{
+ 			{
+@@ -1559,7 +1503,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 		},
+ 	},
+ 
+-	// #83: a certificate without SANs and with a CN that does not parse as a
++	// #80: a certificate without SANs and with a CN that does not parse as a
+ 	// hostname is accepted in a constrained chain.
+ 	{
+ 		roots: []constraintsSpec{
+@@ -1578,7 +1522,7 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 		},
+ 	},
+ 
+-	// #84: a certificate with SANs and CN is accepted in a constrained chain.
++	// #81: a certificate with SANs and CN is accepted in a constrained chain.
+ 	{
+ 		roots: []constraintsSpec{
+ 			{
+diff --git a/src/crypto/x509/parser.go b/src/crypto/x509/parser.go
+index 635e74b..0788210 100644
+--- a/src/crypto/x509/parser.go
++++ b/src/crypto/x509/parser.go
+@@ -391,10 +391,14 @@ func parseSANExtension(der cryptobyte.String) (dnsNames, emailAddresses []string
+ 			if err := isIA5String(email); err != nil {
+ 				return errors.New("x509: SAN rfc822Name is malformed")
+ 			}
++			parsed, ok := parseRFC2821Mailbox(email)
++			if !ok || (ok && !domainNameValid(parsed.domain, false)) {
++				return errors.New("x509: SAN rfc822Name is malformed")
++			}
+ 			emailAddresses = append(emailAddresses, email)
+ 		case nameTypeDNS:
+ 			name := string(data)
+-			if err := isIA5String(name); err != nil {
++			if err := isIA5String(name); err != nil || (err == nil && !domainNameValid(name, false)) {
+ 				return errors.New("x509: SAN dNSName is malformed")
+ 			}
+ 			dnsNames = append(dnsNames, string(name))
+@@ -404,14 +408,9 @@ func parseSANExtension(der cryptobyte.String) (dnsNames, emailAddresses []string
+ 				return errors.New("x509: SAN uniformResourceIdentifier is malformed")
+ 			}
+ 			uri, err := url.Parse(uriStr)
+-			if err != nil {
++			if err != nil || (err == nil && uri.Host != "" && !domainNameValid(uri.Host, false)) {
+ 				return fmt.Errorf("x509: cannot parse URI %q: %s", uriStr, err)
+ 			}
+-			if len(uri.Host) > 0 {
+-				if _, ok := domainToReverseLabels(uri.Host); !ok {
+-					return fmt.Errorf("x509: cannot parse URI %q: invalid domain", uriStr)
+-				}
+-			}
+ 			uris = append(uris, uri)
+ 		case nameTypeIP:
+ 			switch len(data) {
+@@ -551,15 +550,7 @@ func parseNameConstraintsExtension(out *Certificate, e pkix.Extension) (unhandle
+ 					return nil, nil, nil, nil, errors.New("x509: invalid constraint value: " + err.Error())
+ 				}
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
+ 					return nil, nil, nil, nil, fmt.Errorf("x509: failed to parse dnsName constraint %q", domain)
+ 				}
+ 				dnsNames = append(dnsNames, domain)
+@@ -600,12 +591,7 @@ func parseNameConstraintsExtension(out *Certificate, e pkix.Extension) (unhandle
+ 						return nil, nil, nil, nil, fmt.Errorf("x509: failed to parse rfc822Name constraint %q", constraint)
+ 					}
+ 				} else {
+-					// Otherwise it's a domain name.
+-					domain := constraint
+-					if len(domain) > 0 && domain[0] == '.' {
+-						domain = domain[1:]
+-					}
+-					if _, ok := domainToReverseLabels(domain); !ok {
++					if !domainNameValid(constraint, true) {
+ 						return nil, nil, nil, nil, fmt.Errorf("x509: failed to parse rfc822Name constraint %q", constraint)
+ 					}
+ 				}
+@@ -621,15 +607,7 @@ func parseNameConstraintsExtension(out *Certificate, e pkix.Extension) (unhandle
+ 					return nil, nil, nil, nil, fmt.Errorf("x509: failed to parse URI constraint %q: cannot be IP address", domain)
+ 				}
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
+ 					return nil, nil, nil, nil, fmt.Errorf("x509: failed to parse URI constraint %q", domain)
+ 				}
+ 				uriDomains = append(uriDomains, domain)
+@@ -1011,3 +989,40 @@ func ParseCertificates(der []byte) ([]*Certificate, error) {
+ 	}
+ 	return certs, nil
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
+index d7cf7ea..95ed116 100644
+--- a/src/crypto/x509/parser_test.go
++++ b/src/crypto/x509/parser_test.go
+@@ -5,6 +5,7 @@ package x509
+ 
+ import (
+ 	"encoding/asn1"
++	"strings"
+ 	"testing"
+ 
+ 	cryptobyte_asn1 "golang.org/x/crypto/cryptobyte/asn1"
+@@ -100,3 +101,45 @@ func TestParseASN1String(t *testing.T) {
+ 		})
+ 	}
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
+index 3e95808..fb2f4b2 100644
+--- a/src/crypto/x509/verify.go
++++ b/src/crypto/x509/verify.go
+@@ -357,6 +357,7 @@ func parseRFC2821Mailbox(in string) (mailbox rfc2821Mailbox, ok bool) {
+ // domainToReverseLabels converts a textual domain name like foo.example.com to
+ // the list of labels in reverse order, e.g. ["com", "example", "foo"].
+ func domainToReverseLabels(domain string) (reverseLabels []string, ok bool) {
++	reverseLabels = make([]string, 0, strings.Count(domain, ".")+1)
+ 	for len(domain) > 0 {
+ 		if i := strings.LastIndexByte(domain, '.'); i == -1 {
+ 			reverseLabels = append(reverseLabels, domain)
+-- 
+2.40.0
+
-- 
2.43.0


