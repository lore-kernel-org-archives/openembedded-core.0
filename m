Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F3AE94102
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 23:08:16 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53862.1767049689851047975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 15:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=N4lh5LlN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7ba55660769so7378149b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 15:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767049689; x=1767654489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMScY1eopowI61GVfNwZKwTLzXYiMSRKP9J8MFZQj7o=;
        b=N4lh5LlN+EINgQ6JAkW4oHjqPxiP9C6UJ7gvYFovZd8JfvgLTTt9+mZ2NiVGyxkH9x
         RRPBdYlQG52PR1P+FxhMGnR0850E+imwdj0NCStVvLVb2x4Oz+1I/vJCjvLm8fRqxCQ3
         0o8BZRec0CzjdoGDOdmDbwWY9hiSadAqD5IcYPVqcYjJt8bUJxc/ClR+fDutvyrNcGcM
         c9R2FC2U9BcwIbG21M5V3Pn+os8QbyCa146YrZshn6y6VSob5OMjYJL5ohT7NzAn0iCV
         rVPisNNjVgLqPeKjZeBtwLXIZ7NcsJS+iRJ2RbdV9q7NCafiCzKWn400F1bxDoqrtysg
         oJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767049689; x=1767654489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QMScY1eopowI61GVfNwZKwTLzXYiMSRKP9J8MFZQj7o=;
        b=ZTVQ6wO1oF/Uen22h/iA7gyUYW5DE5vhlfjl0byLLRc/g3i1InCOb3R0FqPYPUZint
         xcW0u2LVUnXyhYUXhmeW3PwocorizRGv+TU5N+GwlJKz7XChWECzSvBzpySCWa/YTID2
         HjnvaQclrKh1BkJYmI06KJaydzKgKkDJkh+nuLFSZNtBA6SgtMIxw7sWR7Vsucgsv4LH
         5DL/OZ8dVMO6ZdB2g/AS7B0BWfJxwh+9BwfKCPn5I5X9IIDb0fFvc+FxgIyi8+tXXLxD
         BcXEBAmyAN9l4K4zLcFHyJYX5RehRbVaza/89J1E3jx/BXN7H3I6vNb7JPO9jhQBkf2+
         WtTQ==
X-Gm-Message-State: AOJu0YwI3TjAhsyTHUo8A5wgqmvY/KcCTiVpRPpCPBAZWpYakLKQRr7b
	y18whPoBu/hys/tut62x5B0ou0SuURRLt2fNwVTqeFZ9P54XyxM9lfjIElovuAWpoPlk0j7JrtO
	K0skp
X-Gm-Gg: AY/fxX6me4i0ORbcIEOrLK0Wc7UFCuuEISb9PeRS/sze+7+3exNzDVmE1jv5BFg9BCW
	gok7C46gIXKrwd+rKp2nRnu4b4xTPJgDW5dl2BDSMFhht4k1zqhYo1xcjPBU9NqAOgxpWvzlee2
	jIHkrXNJL2CSOtyGOymvkFdeF+yNkoiw9wT6jed0Ew1ni4Xv/HDjh70ePb5rJHieK0i2GmAM/n2
	oYKfifpgGys26nIK5T4Fya0dj60MZoFTXipJLZVZfEqX+jXFHRZlGBEkBK7gHydO8eF+/bKe+ct
	ERM8fwgYSoEby7wy5dZUn4TN+mNUB3YwzK2TzT56AyTTIVa/M/kefV2UNMEluK+wu4VZ4LS2bFU
	TKsXH/cHzM7d0Nq8FTOgtt6kXa0Zoy/4tuJmISd1q40xFNtVHRrtFZ+DiUZSwDiou+wSbZE0nqB
	W0Tg==
X-Google-Smtp-Source: AGHT+IGFGURwggZAQhUYdrvP+kelulJiUAE2WA9k1ZPrisKTQvvr1HLX2kbG26oY/qgLzWuKieaOBg==
X-Received: by 2002:a05:6a00:aa04:b0:7e8:4471:8c0 with SMTP id d2e1a72fcca58-7ff6627a1damr30384008b3a.33.1767049689001;
        Mon, 29 Dec 2025 15:08:09 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c013:8f5c:baf3:22c3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm30340938b3a.50.2025.12.29.15.08.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 15:08:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/5] go: Fix CVE-2025-61727
Date: Mon, 29 Dec 2025 15:07:38 -0800
Message-ID: <647e151485bd10a8bbbdbae4825791723c9a5d8e.1767049440.git.steve@sakoman.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228625

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/golang/go/commit/04db77a423cac75bb82cc9a6859991ae9c016344

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-61727.patch                | 226 ++++++++++++++++++
 2 files changed, 227 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61727.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 0729b5eec0..664ccf3edc 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -29,6 +29,7 @@ SRC_URI += "\
     file://CVE-2025-47912.patch \
     file://CVE-2025-61723.patch \
     file://CVE-2025-61724.patch \
+    file://CVE-2025-61727.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-61727.patch b/meta/recipes-devtools/go/go/CVE-2025-61727.patch
new file mode 100644
index 0000000000..e87621ef99
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-61727.patch
@@ -0,0 +1,226 @@
+From 04db77a423cac75bb82cc9a6859991ae9c016344 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Mon, 24 Nov 2025 08:46:08 -0800
+Subject: [PATCH] [release-branch.go1.24] crypto/x509: excluded subdomain
+ constraints preclude wildcard SANs
+
+When evaluating name constraints in a certificate chain, the presence of
+an excluded subdomain constraint (e.g., excluding "test.example.com")
+should preclude the use of a wildcard SAN (e.g., "*.example.com").
+
+Fixes #76442
+Fixes #76463
+Fixes CVE-2025-61727
+
+Change-Id: I42a0da010cb36d2ec9d1239ae3f61cf25eb78bba
+Reviewed-on: https://go-review.googlesource.com/c/go/+/724401
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Daniel McCarney <daniel@binaryparadox.net>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/04db77a423cac75bb82cc9a6859991ae9c016344]
+CVE: CVE-2025-61727
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/crypto/x509/name_constraints_test.go | 34 ++++++++++++++++++++
+ src/crypto/x509/verify.go                | 40 +++++++++++++++---------
+ src/crypto/x509/verify_test.go           |  2 +-
+ 3 files changed, 60 insertions(+), 16 deletions(-)
+
+diff --git a/src/crypto/x509/name_constraints_test.go b/src/crypto/x509/name_constraints_test.go
+index a5851845164d10..bc91b28401fce5 100644
+--- a/src/crypto/x509/name_constraints_test.go
++++ b/src/crypto/x509/name_constraints_test.go
+@@ -1624,6 +1624,40 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 		},
+ 		expectedError: "URI with IP",
+ 	},
++	// #87: subdomain excluded constraints preclude wildcard names
++	{
++		roots: []constraintsSpec{
++			{
++				bad: []string{"dns:foo.example.com"},
++			},
++		},
++		intermediates: [][]constraintsSpec{
++			{
++				{},
++			},
++		},
++		leaf: leafSpec{
++			sans: []string{"dns:*.example.com"},
++		},
++		expectedError: "\"*.example.com\" is excluded by constraint \"foo.example.com\"",
++	},
++	// #88: wildcard names are not matched by subdomain permitted constraints
++	{
++		roots: []constraintsSpec{
++			{
++				ok: []string{"dns:foo.example.com"},
++			},
++		},
++		intermediates: [][]constraintsSpec{
++			{
++				{},
++			},
++		},
++		leaf: leafSpec{
++			sans: []string{"dns:*.example.com"},
++		},
++		expectedError: "\"*.example.com\" is not permitted",
++	},
+ }
+ 
+ func makeConstraintsCACert(constraints constraintsSpec, name string, key *ecdsa.PrivateKey, parent *Certificate, parentKey *ecdsa.PrivateKey) (*Certificate, error) {
+diff --git a/src/crypto/x509/verify.go b/src/crypto/x509/verify.go
+index bf7e7ec058db2b..9175fa4dc147a2 100644
+--- a/src/crypto/x509/verify.go
++++ b/src/crypto/x509/verify.go
+@@ -429,7 +429,7 @@ func domainToReverseLabels(domain string) (reverseLabels []string, ok bool) {
+ 	return reverseLabels, true
+ }
+ 
+-func matchEmailConstraint(mailbox rfc2821Mailbox, constraint string, reversedDomainsCache map[string][]string, reversedConstraintsCache map[string][]string) (bool, error) {
++func matchEmailConstraint(mailbox rfc2821Mailbox, constraint string, excluded bool, reversedDomainsCache map[string][]string, reversedConstraintsCache map[string][]string) (bool, error) {
+ 	// If the constraint contains an @, then it specifies an exact mailbox
+ 	// name.
+ 	if strings.Contains(constraint, "@") {
+@@ -442,10 +442,10 @@ func matchEmailConstraint(mailbox rfc2821Mailbox, constraint string, reversedDom
+ 
+ 	// Otherwise the constraint is like a DNS constraint of the domain part
+ 	// of the mailbox.
+-	return matchDomainConstraint(mailbox.domain, constraint, reversedDomainsCache, reversedConstraintsCache)
++	return matchDomainConstraint(mailbox.domain, constraint, excluded, reversedDomainsCache, reversedConstraintsCache)
+ }
+ 
+-func matchURIConstraint(uri *url.URL, constraint string, reversedDomainsCache map[string][]string, reversedConstraintsCache map[string][]string) (bool, error) {
++func matchURIConstraint(uri *url.URL, constraint string, excluded bool, reversedDomainsCache map[string][]string, reversedConstraintsCache map[string][]string) (bool, error) {
+ 	// From RFC 5280, Section 4.2.1.10:
+ 	// “a uniformResourceIdentifier that does not include an authority
+ 	// component with a host name specified as a fully qualified domain
+@@ -474,7 +474,7 @@ func matchURIConstraint(uri *url.URL, constraint string, reversedDomainsCache ma
+ 		return false, fmt.Errorf("URI with IP (%q) cannot be matched against constraints", uri.String())
+ 	}
+ 
+-	return matchDomainConstraint(host, constraint, reversedDomainsCache, reversedConstraintsCache)
++	return matchDomainConstraint(host, constraint, excluded, reversedDomainsCache, reversedConstraintsCache)
+ }
+ 
+ func matchIPConstraint(ip net.IP, constraint *net.IPNet) (bool, error) {
+@@ -491,7 +491,7 @@ func matchIPConstraint(ip net.IP, constraint *net.IPNet) (bool, error) {
+ 	return true, nil
+ }
+ 
+-func matchDomainConstraint(domain, constraint string, reversedDomainsCache map[string][]string, reversedConstraintsCache map[string][]string) (bool, error) {
++func matchDomainConstraint(domain, constraint string, excluded bool, reversedDomainsCache map[string][]string, reversedConstraintsCache map[string][]string) (bool, error) {
+ 	// The meaning of zero length constraints is not specified, but this
+ 	// code follows NSS and accepts them as matching everything.
+ 	if len(constraint) == 0 {
+@@ -508,6 +508,11 @@ func matchDomainConstraint(domain, constraint string, reversedDomainsCache map[s
+ 		reversedDomainsCache[domain] = domainLabels
+ 	}
+ 
++	wildcardDomain := false
++	if len(domain) > 0 && domain[0] == '*' {
++		wildcardDomain = true
++	}
++
+ 	// RFC 5280 says that a leading period in a domain name means that at
+ 	// least one label must be prepended, but only for URI and email
+ 	// constraints, not DNS constraints. The code also supports that
+@@ -534,6 +539,11 @@ func matchDomainConstraint(domain, constraint string, reversedDomainsCache map[s
+ 		return false, nil
+ 	}
+ 
++	if excluded && wildcardDomain && len(domainLabels) > 1 && len(constraintLabels) > 0 {
++		domainLabels = domainLabels[:len(domainLabels)-1]
++		constraintLabels = constraintLabels[:len(constraintLabels)-1]
++	}
++
+ 	for i, constraintLabel := range constraintLabels {
+ 		if !strings.EqualFold(constraintLabel, domainLabels[i]) {
+ 			return false, nil
+@@ -553,7 +563,7 @@ func (c *Certificate) checkNameConstraints(count *int,
+ 	nameType string,
+ 	name string,
+ 	parsedName any,
+-	match func(parsedName, constraint any) (match bool, err error),
++	match func(parsedName, constraint any, excluded bool) (match bool, err error),
+ 	permitted, excluded any) error {
+ 
+ 	excludedValue := reflect.ValueOf(excluded)
+@@ -565,7 +575,7 @@ func (c *Certificate) checkNameConstraints(count *int,
+ 
+ 	for i := 0; i < excludedValue.Len(); i++ {
+ 		constraint := excludedValue.Index(i).Interface()
+-		match, err := match(parsedName, constraint)
++		match, err := match(parsedName, constraint, true)
+ 		if err != nil {
+ 			return CertificateInvalidError{c, CANotAuthorizedForThisName, err.Error()}
+ 		}
+@@ -587,7 +597,7 @@ func (c *Certificate) checkNameConstraints(count *int,
+ 		constraint := permittedValue.Index(i).Interface()
+ 
+ 		var err error
+-		if ok, err = match(parsedName, constraint); err != nil {
++		if ok, err = match(parsedName, constraint, false); err != nil {
+ 			return CertificateInvalidError{c, CANotAuthorizedForThisName, err.Error()}
+ 		}
+ 
+@@ -679,8 +689,8 @@ func (c *Certificate) isValid(certType int, currentChain []*Certificate, opts *V
+ 					}
+ 
+ 					if err := c.checkNameConstraints(&comparisonCount, maxConstraintComparisons, "email address", name, mailbox,
+-						func(parsedName, constraint any) (bool, error) {
+-							return matchEmailConstraint(parsedName.(rfc2821Mailbox), constraint.(string), reversedDomainsCache, reversedConstraintsCache)
++						func(parsedName, constraint any, excluded bool) (bool, error) {
++							return matchEmailConstraint(parsedName.(rfc2821Mailbox), constraint.(string), excluded, reversedDomainsCache, reversedConstraintsCache)
+ 						}, c.PermittedEmailAddresses, c.ExcludedEmailAddresses); err != nil {
+ 						return err
+ 					}
+@@ -692,8 +702,8 @@ func (c *Certificate) isValid(certType int, currentChain []*Certificate, opts *V
+ 					}
+ 
+ 					if err := c.checkNameConstraints(&comparisonCount, maxConstraintComparisons, "DNS name", name, name,
+-						func(parsedName, constraint any) (bool, error) {
+-							return matchDomainConstraint(parsedName.(string), constraint.(string), reversedDomainsCache, reversedConstraintsCache)
++						func(parsedName, constraint any, excluded bool) (bool, error) {
++							return matchDomainConstraint(parsedName.(string), constraint.(string), excluded, reversedDomainsCache, reversedConstraintsCache)
+ 						}, c.PermittedDNSDomains, c.ExcludedDNSDomains); err != nil {
+ 						return err
+ 					}
+@@ -706,8 +716,8 @@ func (c *Certificate) isValid(certType int, currentChain []*Certificate, opts *V
+ 					}
+ 
+ 					if err := c.checkNameConstraints(&comparisonCount, maxConstraintComparisons, "URI", name, uri,
+-						func(parsedName, constraint any) (bool, error) {
+-							return matchURIConstraint(parsedName.(*url.URL), constraint.(string), reversedDomainsCache, reversedConstraintsCache)
++						func(parsedName, constraint any, excluded bool) (bool, error) {
++							return matchURIConstraint(parsedName.(*url.URL), constraint.(string), excluded, reversedDomainsCache, reversedConstraintsCache)
+ 						}, c.PermittedURIDomains, c.ExcludedURIDomains); err != nil {
+ 						return err
+ 					}
+@@ -719,7 +729,7 @@ func (c *Certificate) isValid(certType int, currentChain []*Certificate, opts *V
+ 					}
+ 
+ 					if err := c.checkNameConstraints(&comparisonCount, maxConstraintComparisons, "IP address", ip.String(), ip,
+-						func(parsedName, constraint any) (bool, error) {
++						func(parsedName, constraint any, _ bool) (bool, error) {
+ 							return matchIPConstraint(parsedName.(net.IP), constraint.(*net.IPNet))
+ 						}, c.PermittedIPRanges, c.ExcludedIPRanges); err != nil {
+ 						return err
+diff --git a/src/crypto/x509/verify_test.go b/src/crypto/x509/verify_test.go
+index 60a4cea9146adf..6a394e46e94f5a 100644
+--- a/src/crypto/x509/verify_test.go
++++ b/src/crypto/x509/verify_test.go
+@@ -1352,7 +1352,7 @@ var nameConstraintTests = []struct {
+ 
+ func TestNameConstraints(t *testing.T) {
+ 	for i, test := range nameConstraintTests {
+-		result, err := matchDomainConstraint(test.domain, test.constraint, map[string][]string{}, map[string][]string{})
++		result, err := matchDomainConstraint(test.domain, test.constraint, false, map[string][]string{}, map[string][]string{})
+ 
+ 		if err != nil && !test.expectError {
+ 			t.Errorf("unexpected error for test #%d: domain=%s, constraint=%s, err=%s", i, test.domain, test.constraint, err)
-- 
2.43.0


