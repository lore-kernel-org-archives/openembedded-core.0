Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57926E94106
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 23:08:16 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53864.1767049691548103103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 15:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ndZS8FtF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo10621191b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 15:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767049691; x=1767654491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xrx+fZKMSeO/kIADwn9oUviEtWaWdBpTAkIbWgvYgGE=;
        b=ndZS8FtFmtgU6yyZH+zGExk2OYfEpMkTeGQfT2jRCFDLF4EcEC0F4Tmmy6agVgzcNc
         DHNgCjcqT0tANKuA2Gm4cqS0Bd81EUwaJEIgKLLKtH/JnVGP6quoOB9xzLEIFRoXog7Z
         vB4KC4m9b2eW0pmVkdaJpeX44CqcF+eIIMFsjGM/MaYZqtFk0TS+xnpIeDefHJlwKwW0
         hVkVpa3plqNyl2nr9/yK/e34McGNuyC2cGqkV3/pJVlTm/7NASmKAqZAaC7yaoHhHrES
         7/aQKHXkI0RTBNicdCIiOppsfEkMfmAc/Re8LhGGiR5M5OnbyAXU4Cr28F8SgukN24gx
         vdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767049691; x=1767654491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xrx+fZKMSeO/kIADwn9oUviEtWaWdBpTAkIbWgvYgGE=;
        b=I6PJAcHLZpocHuo8/LKuiCLuuggLJUDrPn3NF7C05IJ6oqGfCsmtm0+O0oVAO+Fk1a
         iDj51GajLfKyx02HJq6zqR02iN76723xKmlWk+AfCzW+qFyLB9wtnGL0e44VVIoTTEkb
         JbSnZeizTUL/sDQ0TJ4M/AbOHKdjo7eLbbWIIDt24Gk/2sGB9I5GRF1U/KfhxaS3GhaU
         T4AFxVLLGUbbqcc/TatisZe33MfxCLv/WmeZjiKK8DReaLU7V2eZKf797IDE4oxhmIDA
         30b+7mycdpSZ+dUAdobhvWTDdyKT4qcZvWNrUG+A3sXQ+oE1Rg73KbJjBjn3lbA2kd4z
         1rQg==
X-Gm-Message-State: AOJu0Yy36vw3vG1P5cfQtNPbyxXF2PARbuZQoA6P4eEehMwrcQGx1lky
	k/l1Y2KWseCobE0rnZDWmCSQ9TtH5CEwuvr6rWG+U4xQ4baAeKyHgyATPBU8nWlJzye+5VbYQyN
	djEgC
X-Gm-Gg: AY/fxX6Xh/0wknQ27IjNlMi0CpclE9R/Gk+AsFRIXBPXRmjL4/4jozq+cTQCS9dS8j+
	xovt9p31U49DIe/tuRSHOIz8ZS6YYS+fkrX3qlccjmZiSrCOypyzuFrfliPypNIEnPzgykudI+l
	44ZJcSo6nM71LZfLILbbk3xmFDLXQt6Y5dxYVzXYFQQmb8iGANlCcg9IP0hq8VxTC6OaFwmMC8z
	DTXfTgKFXtG2Biic9VT3lb1gZTSXBDTIDAqshr6WhOG8kksm7oM6RoQr4NHN4YdCnfZNVV9ld/9
	jltXQ9Y35kmWeu4VHleBUOprRMsXc6LvqbE9xypAA+9jqU6mOBGWDGj7r/5AgLsIa9KCBoC8j+E
	nKy+qGg/zHpJcsMUuT6ziDbQ5LXMmaocgxK5zpD0/HYL8vwrK6FAQXmZMzZvCpCuzH8gb1+6cS4
	3ARw==
X-Google-Smtp-Source: AGHT+IHSHanDKbfTUxIH3gq2za/1o3DG4FCgbI6yGgBDAynCLuo/M5Rr7wHrKKfag3Oej6Hre9LCrA==
X-Received: by 2002:a05:6a00:6ca2:b0:7a9:c738:5e88 with SMTP id d2e1a72fcca58-7ff657a1298mr27039066b3a.8.1767049690702;
        Mon, 29 Dec 2025 15:08:10 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c013:8f5c:baf3:22c3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm30340938b3a.50.2025.12.29.15.08.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 15:08:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/5] go: Fix CVE-2025-61729
Date: Mon, 29 Dec 2025 15:07:39 -0800
Message-ID: <2d6d68e46a430a1dbba7bd8b7d37ff56f4f5a0e6.1767049440.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767049440.git.steve@sakoman.com>
References: <cover.1767049440.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 23:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228626

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/golang/go/commit/3a842bd5c6aa8eefa13c0174de3ab361e50bd672

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


