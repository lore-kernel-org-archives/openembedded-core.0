Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C90EE92FF7
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 23:03:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53753.1767049414176703962
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 15:03:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1sae+WcW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0d0788adaso84924555ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 15:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767049413; x=1767654213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zINGPzZi092SuR/VI14o+sv5d5IvQkR0r80oVA7CXSk=;
        b=1sae+WcWogzvPsEmqrFihUzHfuDs5UBRr2/KhXMP3EHIVlDmorOu1gCWnpDKrMAmZq
         HCWRPuyMZ/4dchOeOtkUz03O0DdLCESyEA3OWZ35sreOryJRbBCsZWdaWJRncpW4vZI+
         Gb+6/f5vCCCezSgDTvPuRVKtQxAl2DgUHqKOA2JIFj96YaJ3jbeWHxnDHY8/1qjnD94R
         NCRl7cmPmREHw8f6vWdfSXKojKJrzlUkihfV532QsTSN2GyzzPBOZhIa4IcW0VDZX6+f
         TyaxEQ7JTbKxdDwT+v4Me/Fiok1DmR+BWxxRgpzTRKFXl5pD6ULvu7uIHxQdgvT2+S8/
         lF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767049413; x=1767654213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zINGPzZi092SuR/VI14o+sv5d5IvQkR0r80oVA7CXSk=;
        b=SPjGZ3HtalDO27LBhx78G0BuhgaskgBoSK3zzgyxboT0UpczrM85+BcggjJGXazsfY
         vPnbZDfi5ZMj7wBqOhRXezv6OF6HZOUTZifTUV3B89tOXvoCRiIvqeT47D0Lbkc7sQvB
         LNi3FtpCSSqCSYX+XsheyRmvP2s/yebu4Dw9GyYc+Dkz6oEOBh7Mhjk23IILs46fOjo3
         V/tmOCckj9TaUp5sp3xQ4Y8/+8ppxyQUuYcUX+qCAg1a2lzMFvDddYzr5uqhYeVAwTd6
         BeX27oxO4fEf0N+iEtxVFWW2yNDPyp38JfSvey3p0tcobaG+83YYgIzMh+lyGDybwxhh
         Kp/w==
X-Gm-Message-State: AOJu0YxSbRUPYELGzBziAw/TsxrX2RGgfP4ms9TlMsoCquuhGDOV7oCI
	UpW1mUTAXNGPdfidiP/z+i/CtfDWHCUfhtwgAgSnA+GSZMUZNIaezFfALX9+q3fH8EaZhaVhIf4
	J/2Rw
X-Gm-Gg: AY/fxX7QTXxBkVND69Tq8pIilCOiWvy/klr47I4sI6vPXddeZZ9tv7fKu+AKAeecbOx
	BRBcnaYD4PUXVLG+Qh4zdi1sW0iiIbMIXvQ9KQKYD+yyncfuGY505AvzxcgOD3UbFyHIKxfApkV
	KpPdU7KFbAf/jZGyPMFY3GJhdOd0a8ihQbI9ltEanlb4MBASvlvOSJgOboO+jgS3Oe6ceO3DpNi
	qOFrnyr//ZWzZLwjG308tgWDmZQIv/90xmIWhomC3BErH8ILZl4NOuZJ+IGzEwIzu+VLpRMPR96
	ZFy6XE56AXfdUVkjESSoTROl+HDY6sqIugEK6gSlLBoOhU/+qALtWraY2PTAOV+4OB8OfGLSlfr
	IuMS1cowwwYAFA6Ef+Jl4zVmNv/uPMa63nG60qTG4wxL4poHcb0CvZ+1mmKEUxzLWEA1qCglOBh
	nexdQhl8vGX8Fx
X-Google-Smtp-Source: AGHT+IF6I6tlksVwu6W6sBoIrDn2tBr0F5PmtYIBvbAA7vXZY4vw/DEK079UgDSD1sEKI8UDs7YaFw==
X-Received: by 2002:a17:902:cf04:b0:29e:bf76:2d91 with SMTP id d9443c01a7336-2a2f293ed92mr353389035ad.42.1767049413313;
        Mon, 29 Dec 2025 15:03:33 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c013:8f5c:baf3:22c3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8d10esm277796855ad.42.2025.12.29.15.03.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 15:03:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/4] go: Fix CVE-2025-61729
Date: Mon, 29 Dec 2025 15:03:19 -0800
Message-ID: <0057fc49725db8637656fac10631d8f89799bad3.1767048412.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767048412.git.steve@sakoman.com>
References: <cover.1767048412.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 23:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228620

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/golang/go/commit/3a842bd5c6aa8eefa13c0174de3ab361e50bd672

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


