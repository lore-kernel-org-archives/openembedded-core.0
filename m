Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2BDE9273E
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 15:44:43 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45417.1767023082611962018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 07:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GBPuusCd;
 spf=pass (domain: mvista.com, ip: 209.85.216.47, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c24f4dfb7so6970105a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 07:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1767023081; x=1767627881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IfyNYnMtw3yuPy8egVzW8S8HHA5R0R7eXLxAi081QE=;
        b=GBPuusCdqe0xMgFDILMfJ4nnRwuWI0KVKTj7TzrAEDzYmFOjx+7BQvIGkiFM9AFAKk
         Ie4ioX3maLDL0Qr4MDNc2vLghKfOqo6HLReIepE54qpfUUXGMqgFzTYwSbvXj3XMmPSK
         /oUY3/mbA7zev9F8xw/Dy9eQ06hfytkLMz9nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767023081; x=1767627881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1IfyNYnMtw3yuPy8egVzW8S8HHA5R0R7eXLxAi081QE=;
        b=bQQc4vHqYZFwobphcL0ogRRE252I5JJrfYixSKdiI7idICvP7f8ED/6cw5c6n7oGSm
         qVDVHbs2gXNuHiWaWiW1mzzg/4eJQjLOByiatW5f5zQDkaezXat4e/09XRPbyKUepspJ
         jXrWT8ze+miIRQz1b7elT89Q64d8jXd7kzID4eT6B/TZXFWsto2qYU69RecBDoiWu4ji
         7FlAETyXEXx0GWWGx89pK17ykeMDNyNWCkw9+GqPwnBGWNX9sM86XKEAsgFvNwOcb/5v
         qoY+C/kgXySDrRiIlrmp3oQP62XrJNI/cO0rxYAUYqtSfyvByFmX0kgCqxc5UAM5Qghc
         kvig==
X-Gm-Message-State: AOJu0YyIikbjgwkWGTWQL74XOxjmqHYCfjRd3X0CymEP7sjAelrQ9pMN
	DtH4iF8taHtVZAd0cYZrO8njvoTk1/6+fUUC6QAJlgBGppZ1WYW/P/qH87hfdzlI5APjemDE4/6
	y6gDgFa0=
X-Gm-Gg: AY/fxX6SGSVFSmYPEgO7cfA6KXiQeYcCA1Dg9PSBJaZ9lPNSrExtC1Vuag9pvGFn+HC
	s7tG7frfYYwcCejtRdQp8dFuezskDaLzDz73CmDJFKamW2t0stndyBRMW/UvIz2sMR6Ham7hrIx
	vcDAOKG5XbjBmpCPgd4Ob2oNSNY6nt4h1cYfzsU1nE/i3h7GwCgWirJTVM2mtGwojfmQyT7CIrw
	qk0OX6n5eiDEflpour4BJsMgCoqeL5qi3P88y2ln4QZTGwHDflO3hRXXeJQyjcARQti/efYJC/w
	EBohS6DCLYEGZJhV7QZvYXLrjyhasBA6I/03G0auOyWPspzBif83nJxn6QdBCjRg7loCfLBGS09
	cTlF3Wu1TMB9tW1cO6oguBby6OzDUbmPGY3wUlA/mHNpNeL3yUZ6u3/e5i7qzRDLJV/GGSkz8Ba
	7D52+w9aaTjqk=
X-Google-Smtp-Source: AGHT+IFezeb98nYbxsL2TYsYnmrVs8rSknqJ62KnLh5AnroMsxB6g4ov9f7XdZT7HEbz0otFTXvigg==
X-Received: by 2002:a17:90b:1dd2:b0:34e:5516:6653 with SMTP id 98e67ed59e1d1-34e9213010fmr25716853a91.8.1767023081416;
        Mon, 29 Dec 2025 07:44:41 -0800 (PST)
Received: from MVIN00352.. ([2406:7400:54:6779:811d:15f4:d12c:e224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e76dec33bsm17227814a91.1.2025.12.29.07.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 07:44:40 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 3/3] go: Fix CVE-2025-61729
Date: Mon, 29 Dec 2025 21:14:01 +0530
Message-ID: <20251229154415.422681-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229154415.422681-1-vanusuri@mvista.com>
References: <20251229154415.422681-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 15:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228609

Upstream-Status: Backport from https://github.com/golang/go/commit/3a842bd5c6aa8eefa13c0174de3ab361e50bd672

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-61729.patch                | 174 ++++++++++++++++++
 2 files changed, 175 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61729.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 664ccf3edc..ca5016c2f5 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -30,6 +30,7 @@ SRC_URI += "\
     file://CVE-2025-61723.patch \
     file://CVE-2025-61724.patch \
     file://CVE-2025-61727.patch \
+    file://CVE-2025-61729.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-61729.patch b/meta/recipes-devtools/go/go/CVE-2025-61729.patch
new file mode 100644
index 0000000000..08859e5729
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-61729.patch
@@ -0,0 +1,174 @@
+From 3a842bd5c6aa8eefa13c0174de3ab361e50bd672 Mon Sep 17 00:00:00 2001
+From: "Nicholas S. Husin" <nsh@golang.org>
+Date: Mon, 24 Nov 2025 14:56:23 -0500
+Subject: [PATCH] [release-branch.go1.24] crypto/x509: prevent
+ HostnameError.Error() from consuming excessive resource
+
+Constructing HostnameError.Error() takes O(N^2) runtime due to using a
+string concatenation in a loop. Additionally, there is no limit on how
+many names are included in the error message. As a result, a malicious
+attacker could craft a certificate with an infinite amount of names to
+unfairly consume resource.
+
+To remediate this, we will now use strings.Builder to construct the
+error message, preventing O(N^2) runtime. When a certificate has 100 or
+more names, we will also not print each name individually.
+
+Thanks to Philippe Antoine (Catena cyber) for reporting this issue.
+
+Updates #76445
+Fixes #76460
+Fixes CVE-2025-61729
+
+Change-Id: I6343776ec3289577abc76dad71766c491c1a7c81
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3000
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3220
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/725820
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+TryBot-Bypass: Dmitri Shuralyov <dmitshur@golang.org>
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Mark Freeman <markfreeman@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/3a842bd5c6aa8eefa13c0174de3ab361e50bd672]
+CVE: CVE-2025-61729
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/crypto/x509/verify.go      | 21 ++++++++++-----
+ src/crypto/x509/verify_test.go | 47 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 61 insertions(+), 7 deletions(-)
+
+diff --git a/src/crypto/x509/verify.go b/src/crypto/x509/verify.go
+index 3fdf65f..0ae8aef 100644
+--- a/src/crypto/x509/verify.go
++++ b/src/crypto/x509/verify.go
+@@ -100,31 +100,38 @@ type HostnameError struct {
+ 
+ func (h HostnameError) Error() string {
+ 	c := h.Certificate
++	maxNamesIncluded := 100
+ 
+ 	if !c.hasSANExtension() && matchHostnames(c.Subject.CommonName, h.Host) {
+ 		return "x509: certificate relies on legacy Common Name field, use SANs instead"
+ 	}
+ 
+-	var valid string
++	var valid strings.Builder
+ 	if ip := net.ParseIP(h.Host); ip != nil {
+ 		// Trying to validate an IP
+ 		if len(c.IPAddresses) == 0 {
+ 			return "x509: cannot validate certificate for " + h.Host + " because it doesn't contain any IP SANs"
+ 		}
++		if len(c.IPAddresses) >= maxNamesIncluded {
++			return fmt.Sprintf("x509: certificate is valid for %d IP SANs, but none matched %s", len(c.IPAddresses), h.Host)
++		}
+ 		for _, san := range c.IPAddresses {
+-			if len(valid) > 0 {
+-				valid += ", "
++			if valid.Len() > 0 {
++				valid.WriteString(", ")
+ 			}
+-			valid += san.String()
++			valid.WriteString(san.String())
+ 		}
+ 	} else {
+-		valid = strings.Join(c.DNSNames, ", ")
++		if len(c.DNSNames) >= maxNamesIncluded {
++			return fmt.Sprintf("x509: certificate is valid for %d names, but none matched %s", len(c.DNSNames), h.Host)
++		}
++		valid.WriteString(strings.Join(c.DNSNames, ", "))
+ 	}
+ 
+-	if len(valid) == 0 {
++	if valid.Len() == 0 {
+ 		return "x509: certificate is not valid for any names, but wanted to match " + h.Host
+ 	}
+-	return "x509: certificate is valid for " + valid + ", not " + h.Host
++	return "x509: certificate is valid for " + valid.String() + ", not " + h.Host
+ }
+ 
+ // UnknownAuthorityError results when the certificate issuer is unknown
+diff --git a/src/crypto/x509/verify_test.go b/src/crypto/x509/verify_test.go
+index df9b0a2..223c250 100644
+--- a/src/crypto/x509/verify_test.go
++++ b/src/crypto/x509/verify_test.go
+@@ -10,13 +10,16 @@ import (
+ 	"crypto/ecdsa"
+ 	"crypto/elliptic"
+ 	"crypto/rand"
++	"crypto/rsa"
+ 	"crypto/x509/pkix"
+ 	"encoding/asn1"
+ 	"encoding/pem"
+ 	"errors"
+ 	"fmt"
+ 	"internal/testenv"
++	"log"
+ 	"math/big"
++	"net"
+ 	"os/exec"
+ 	"reflect"
+ 	"runtime"
+@@ -89,6 +92,26 @@ var verifyTests = []verifyTest{
+ 
+ 		errorCallback: expectHostnameError("certificate is valid for"),
+ 	},
++	{
++		name:        "TooManyDNS",
++		leaf:        generatePEMCertWithRepeatSAN(1677615892, 200, "fake.dns"),
++		roots:       []string{generatePEMCertWithRepeatSAN(1677615892, 200, "fake.dns")},
++		currentTime: 1677615892,
++		dnsName:     "www.example.com",
++		systemSkip:  true, // does not chain to a system root
++
++		errorCallback: expectHostnameError("certificate is valid for 200 names, but none matched"),
++	},
++	{
++		name:        "TooManyIPs",
++		leaf:        generatePEMCertWithRepeatSAN(1677615892, 150, "4.3.2.1"),
++		roots:       []string{generatePEMCertWithRepeatSAN(1677615892, 150, "4.3.2.1")},
++		currentTime: 1677615892,
++		dnsName:     "1.2.3.4",
++		systemSkip:  true, // does not chain to a system root
++
++		errorCallback: expectHostnameError("certificate is valid for 150 IP SANs, but none matched"),
++	},
+ 	{
+ 		name:          "IPMissing",
+ 		leaf:          googleLeaf,
+@@ -595,6 +618,30 @@ func nameToKey(name *pkix.Name) string {
+ 	return strings.Join(name.Country, ",") + "/" + strings.Join(name.Organization, ",") + "/" + strings.Join(name.OrganizationalUnit, ",") + "/" + name.CommonName
+ }
+ 
++func generatePEMCertWithRepeatSAN(currentTime int64, count int, san string) string {
++	cert := Certificate{
++		NotBefore: time.Unix(currentTime, 0),
++		NotAfter:  time.Unix(currentTime, 0),
++	}
++	if ip := net.ParseIP(san); ip != nil {
++		cert.IPAddresses = slices.Repeat([]net.IP{ip}, count)
++	} else {
++		cert.DNSNames = slices.Repeat([]string{san}, count)
++	}
++	privKey, err := rsa.GenerateKey(rand.Reader, 4096)
++	if err != nil {
++		log.Fatal(err)
++	}
++	certBytes, err := CreateCertificate(rand.Reader, &cert, &cert, &privKey.PublicKey, privKey)
++	if err != nil {
++		log.Fatal(err)
++	}
++	return string(pem.EncodeToMemory(&pem.Block{
++		Type:  "CERTIFICATE",
++		Bytes: certBytes,
++	}))
++}
++
+ const gtsIntermediate = `-----BEGIN CERTIFICATE-----
+ MIIFljCCA36gAwIBAgINAgO8U1lrNMcY9QFQZjANBgkqhkiG9w0BAQsFADBHMQsw
+ CQYDVQQGEwJVUzEiMCAGA1UEChMZR29vZ2xlIFRydXN0IFNlcnZpY2VzIExMQzEU
+-- 
+2.43.0
+
-- 
2.43.0


