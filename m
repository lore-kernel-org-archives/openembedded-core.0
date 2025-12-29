Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9895FE92733
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 15:44:43 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45415.1767023078069653554
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 07:44:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gDmix8uj;
 spf=pass (domain: mvista.com, ip: 209.85.210.174, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b75e366866so4068291b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 07:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1767023077; x=1767627877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JptNmqncJg76i4px7yy/x3/QqjdlLpDjsdbHqtV4cMM=;
        b=gDmix8uj9wInu71jtUXe6jIaYyFUXKPqjyDY0Ms+LjPnb2OIMiXR4+/qW3iJkCjnWo
         YNZwR8pznGE9Vc2rDW+zKWZ2npmNw7J3+WQMIre9Aa+3v+n9Qto3J4QusXFaHphxCZpT
         BLbWiNNuwyBaABx6CPnKGOYotXnexx+d7FCnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767023077; x=1767627877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JptNmqncJg76i4px7yy/x3/QqjdlLpDjsdbHqtV4cMM=;
        b=nGskubHMUxnaC1mjFHMzPjw9StB/gbPQnf7p0/WgXrkHrlzEzD0lGv83jK3dOqTDha
         /sGOI/D18MBaTMtlBYCFqtpbRJrzU93emtIYyquk60T4t6RZzYmX4t7kvTxgvRv0lsGw
         5D8GAS1xjcQ7Qct3OkCn5HO2bYrrIl3rgl2yMUX5GhBUBGa3EqpG5noRkY9rLWgMwU9e
         o/cHt7uw1d7NsCL45G5Bv3wb34IqVRp62Db0ytOF4lbbuuX+x/EIUaCRg9AACB8Ns8ZZ
         /IZquekT53szu2gK43Mj3U+J1rsnK1DNSnSw2QazunR4B6mp0BukhUCuHEfOBKz/lT8+
         sp3w==
X-Gm-Message-State: AOJu0YwTcnHjz6Jnt15LzpRBujqaXhpmIeHdWF99mSQpUjK4s0yHbMgC
	rb1TltvW91QgxpqYR4KUkq5oT7BWZUkdksmONaCFBBGloxDFNynjRhcApB4u63th4qcdEs47JK6
	tfd9guEQ=
X-Gm-Gg: AY/fxX6sDmtX9Sjq5Fg26vHXe5teOdUd+hGmJhLw+8vuXY9huE+yfGqrDKhK6mhzgGf
	/Y5ljVpSGoaeX25m3lMyIE2a+uRlGd79MvFVwJsCPxeJ4laizUUH91qJMkmA8fe1U7SGxCZtsh2
	g1ECuKh8d90tJUxOd1Bu3qQlZwoKhZTFOrbz8cVRnQ3biW+P+yp4FnIDabVy33XCan1QhS6/bnt
	FckkGj3dzt5fXnVyd1gigK/jO5yaal+J5aZvTZ1E/0dLiVCbOtHX2kD+RaiArbuHgfBOk/wpPnU
	bhI6kvGqCY7EP3lnv869kUsY7mjgfRgYvuP1FFwmu2fRiSP2hdLbqMATmDrTiIm8pb4gAODtTD/
	uafK/kMFq5/9HVSj0XSDeOrraOg4u4OAevxound9NBgXWcUaADNinmyXqKVRB7q9ti9nz8nALEZ
	wFZSH6XQJq0oE=
X-Google-Smtp-Source: AGHT+IGjjhHlYg3+UBWf2SmiURO/4FyoCpCooknekX3YyTwDKVKVVDgLWzC70Ti58WFWQQzOIchkFw==
X-Received: by 2002:a05:6a20:72a3:b0:35d:6b4e:91f1 with SMTP id adf61e73a8af0-376a81daf4cmr29251212637.34.1767023076970;
        Mon, 29 Dec 2025 07:44:36 -0800 (PST)
Received: from MVIN00352.. ([2406:7400:54:6779:811d:15f4:d12c:e224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e76dec33bsm17227814a91.1.2025.12.29.07.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 07:44:36 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 2/3] go: Fix CVE-2025-61727
Date: Mon, 29 Dec 2025 21:14:00 +0530
Message-ID: <20251229154415.422681-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229154415.422681-1-vanusuri@mvista.com>
References: <20251229154415.422681-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 15:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228608

Upstream-Status: Backport from https://github.com/golang/go/commit/04db77a423cac75bb82cc9a6859991ae9c016344

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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


