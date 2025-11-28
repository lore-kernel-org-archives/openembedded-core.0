Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C071D116F1
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 16:08:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19469.1764346086765880137
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 08:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nfHUNfEh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4427058972=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ASDlRMQ036400
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 16:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=1WrgocrMPCmfqq/VYH/G
	XQQ2x3UUWM3+iRyUDz9x9ek=; b=nfHUNfEh2AAFyAekscCMVuLqU1fvRDrRQM57
	72RnLSze0MxGn8MgLUVXH7Iu6HLJvZCYEcy17GXQ888IA1U4txOFED1VzG9lcn+y
	KYYl/AO6mRv+VfXFds5hkDYG6f/KVHntddFrIKWneggJWQ1Me4fbk6IKKePcbhxh
	cmg3g3ngPoNFq+LwW1Tqn1OdWs/30to6rl5xpc6WzrGQusE60ra5MpAUv4ophvnF
	wKRbMmdfkv33i3pFIUeACwj3AKKUobxa9BkLugU99NiwjWtU/L8zBV6gP4f9z1wV
	H/rkl1IHpYqPXH6JYeghZsYJi31QOFvGuI1rvV7uDh67axU/XA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak455q2dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 16:08:05 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 28 Nov 2025 08:08:03 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 28 Nov 2025 08:08:02 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  1/4] go: fix CVE-2025-58187
Date: Fri, 28 Nov 2025 21:37:56 +0530
Message-ID: <20251128160759.331036-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: g4BrGTRbYZSlj5l4wAFwEVaMD2fDeqbQ
X-Proofpoint-GUID: g4BrGTRbYZSlj5l4wAFwEVaMD2fDeqbQ
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=6929c8e5 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pM9yUfARAAAA:8 a=Oh2cFVv5AAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8 a=A1X0JdhQAAAA:8
 a=p8bv-Q6xvW1aGLmNwggA:9 a=YH-7kEGJnRg4CV3apUU-:22 a=7KeoIwV6GZqOttXkcoxL:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDExOCBTYWx0ZWRfX3PKnPSZZZM4Q
 FghvWQLMUS09nT4TMM8DvwPG+d5E6Z/kqAWQfny0GjadHmrnxZzhwbHKVKjt2z+TvA6rS75Jmxe
 7zrpic/TkiTFlVYAr4TeuW1vEDIKSUnau6zqkFXcInIPQvksbei+yS4HNwD5tYRKfwkicZoycpS
 x6XSqjBPHr9zNqaAsZ6JLqggOmPiptf5TgmUebqF6CdyzgrbbVw6pB29O7jo7b6tzz6QdY99yvm
 vq5jugKlvmjKaQ7svmzlU0e5FXgomAe26mhBkvnyILIJjJ9UiXEjqmAyJH7X9gUdk7TX93MpzqA
 zTOR60WJEGruzrQpIm1dhhps2Z5/PdqJkxbFYNnsOaA6Lwd3hCqHzjSePRXyvwiNL8n8Q2zZItk
 d0hThgXAkGjyl5QkJzs2DW1IaVn70g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 16:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226918

From: Archana Polampalli <archana.polampalli@windriver.com>

Due to the design of the name constraint checking algorithm, the processing time
of some inputs scale non-linearly with respect to the size of the certificate.
This affects programs which validate arbitrary certificate chains.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
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
2.40.0


