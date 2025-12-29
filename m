Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5E8D3B7E5
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 12:48:22 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42555.1767012497748133860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 04:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gH8puYgX;
 spf=pass (domain: mvista.com, ip: 209.85.216.48, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so7550275a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 04:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1767012497; x=1767617297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fk6bWQUOSrKTGt8gB8yBJ0VOCl/aVodtd5W5UOqfACQ=;
        b=gH8puYgX8t2dHfDlNocYHuYZ89CztbcdIvbJcF7Voyck5ydIgldzhPHbEblSgAvo12
         6TqUTh/7xh19cB8bM5J7XBxjYLufJ8NtWXi5TAkrk+H73A+yvuv4AYAgWvu+5HiLHftW
         ADDX8IkrEQovhvHhanzCiL5l13shG/n9BIr5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767012497; x=1767617297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fk6bWQUOSrKTGt8gB8yBJ0VOCl/aVodtd5W5UOqfACQ=;
        b=NXu9+qCt3Y0nxZsI5Np3wyUzzAulY3jkdC0GWux3YSsgSIiqfewVILS4oDyLnJJYle
         ydWX1VNLt90Unx2x3GZsOZnLr2XGxGHX9QvcisViZZW9/ONn7rvkW4bX+6vBi1X1h7QV
         3Cw24QM+T2mSOCu4MEZF2HQi5FVFvM4o8Wwodu59kqt+4HaqUdbCi80GlpAXstWWFJ1R
         TQM91GYvaBFlfh72SwCx800tOFEmqyt/EnNdl5uF2xaTrPqPMkSHYRQps3g8tdHZOzcB
         DySPhS/SFelPCQtoYje/uKSqfJlcsO5aGlF6ZAHM2tKJHV6AvfyZfC3vK4XoWQV34SjR
         FvGQ==
X-Gm-Message-State: AOJu0YyMWwdbbfOMMkQ1pXlJisdA3cjWwouCeKjUK5/BrdoywGuxFTsw
	ScMAC6a9YzHAb52PnJgFFoWtKNaokhkfHkBCDSxiAbW3ktu6EhWC69yJuOiGk/q3qTb3mHJFscw
	3843kLFg=
X-Gm-Gg: AY/fxX63i6ACj1pA6V5Yf1lDUuA2CTQrGuZzuHSz/RMzIllCKn/3FXbKnPRyjFkP1+y
	6fRoq7CsPNosfJ4huJnibzNrwwH8EVkXZSfgwEkUBjAbEfYHvKhaa/13p6C22G8J9vG6A56UTqg
	5M9hzPDqX8T/1XX1uWO9HpiLa9rTrDKBIM+W+uds4NA/pO5DPY3gRHeUHHhUJ1mv1oKh6IlzNBa
	QVVg4xScgcw6o9aGOOrkK7MPKYRvCwwJggL3Mp/myb9L0OfKmgbgvDtQloF8Vega98B0fVMH5Bk
	vLjWcpvb+S3irlzbDhMIbS+6f5zuWM4oxTQMG9xOK+fwHo76rsxfWurmfldPF5giSgb7ZFZeieL
	rhdd0gE7BoAqy28ERfZMPEmD5lt/w1pUbA3j12KBi6F58nEXcmc6guVzGL4j2b/z7JvSqrl0XEl
	ORi4U7R4IM5doZW5kK4Je8EuNp
X-Google-Smtp-Source: AGHT+IHkgqNQ15X9NURHp4BbMm+pZR8doRS0akpJ8Uz8nnbfuz1jsQFqMw6ssUJ5FM0onzvT2+b1rg==
X-Received: by 2002:a17:90b:1d49:b0:343:7714:4ca6 with SMTP id 98e67ed59e1d1-34e921ae8e8mr22347602a91.22.1767012496662;
        Mon, 29 Dec 2025 04:48:16 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:54:6779:8047:e5eb:447c:8ecc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e921b1666sm27431208a91.7.2025.12.29.04.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 04:48:16 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 3/3] go: Fix CVE-2025-61729
Date: Mon, 29 Dec 2025 18:17:55 +0530
Message-Id: <20251229124755.462274-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251229124755.462274-1-vanusuri@mvista.com>
References: <20251229124755.462274-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 12:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228604

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/golang/go/commit/3a842bd5c6aa8eefa13c0174de3ab361e50bd672

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2025-61729.patch           | 172 ++++++++++++++++++
 2 files changed, 173 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2025-61729.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 0ea3b6704f..e95003db96 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -76,6 +76,7 @@ SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main \
            file://CVE-2025-61724.patch \
            file://CVE-2023-39323.patch \
            file://CVE-2025-61727.patch \
+           file://CVE-2025-61729.patch \
            "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2025-61729.patch b/meta/recipes-devtools/go/go-1.18/CVE-2025-61729.patch
new file mode 100644
index 0000000000..6fdc2fd426
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2025-61729.patch
@@ -0,0 +1,172 @@
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
+index 88260ee..c167191 100644
+--- a/src/crypto/x509/verify.go
++++ b/src/crypto/x509/verify.go
+@@ -97,31 +97,38 @@ type HostnameError struct {
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
+index 5f7c834..c2c2025 100644
+--- a/src/crypto/x509/verify_test.go
++++ b/src/crypto/x509/verify_test.go
+@@ -9,11 +9,14 @@ import (
+ 	"crypto/ecdsa"
+ 	"crypto/elliptic"
+ 	"crypto/rand"
++	"crypto/rsa"
+ 	"crypto/x509/pkix"
+ 	"encoding/pem"
+ 	"errors"
+ 	"fmt"
++	"log"
+ 	"math/big"
++	"net"
+ 	"runtime"
+ 	"strings"
+ 	"testing"
+@@ -70,6 +73,26 @@ var verifyTests = []verifyTest{
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
+@@ -584,6 +607,30 @@ func nameToKey(name *pkix.Name) string {
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
+ const geoTrustRoot = `-----BEGIN CERTIFICATE-----
+ MIIDVDCCAjygAwIBAgIDAjRWMA0GCSqGSIb3DQEBBQUAMEIxCzAJBgNVBAYTAlVT
+ MRYwFAYDVQQKEw1HZW9UcnVzdCBJbmMuMRswGQYDVQQDExJHZW9UcnVzdCBHbG9i
+-- 
+2.25.1
+
-- 
2.25.1


