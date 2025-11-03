Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93BCCCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 06:13:57 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14760.1762150434261962083
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 22:13:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Cl52lqJS;
 spf=pass (domain: mvista.com, ip: 209.85.216.51, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33e27a3b153so3911860a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 22:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1762150433; x=1762755233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GqWB56GCRD7uYpKV/SJ1vM0IVKFxNtCcmmDWnZvsJHQ=;
        b=Cl52lqJST1bN/xDq9srkg5jPGHCoJXra9Ls2Mg2dfb8uYs/N2011sWTeq1xBfSYY/y
         DcxvOumJrPqDgMAcl+uxGmOu6GN+ROtQ4ElTv8IexbPSC5FFL6jn5sda2Ja31NW6sf/s
         u2kwkAePqDHOtydFo7WbPi+Avc7QcuQTvzJQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762150433; x=1762755233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GqWB56GCRD7uYpKV/SJ1vM0IVKFxNtCcmmDWnZvsJHQ=;
        b=wFKiijIQcx9czl748wM6MKdPZlv0zXL4oKK2sZ79bNNBFeke/1+sy/XGZyN7CGSB2S
         TTwiPyIUD3ptS8AYIOzWSdz3sbG0yi1wMFtsrFyOwEaNIfcHr26PqQR/I4iRc0+TxZr9
         yw9hmJzqQo+x9KQBunOUEKFNqPrpLVEwejkMsJDWMtZK2oWOmnvSe3PzcNPNWbgvCWxR
         h8+JqR20gCXQh2eQq03pSWihuXKH4voadmaZFwtxy7awcvwzIv9ZaA8xfMv0QRHFTVGR
         Hl1JESULVDuNRU6/SXpeGdtJ5JuKDHpXMGcMM77LQRTS1U1QjXR5+SVAEAhXysnbCsTe
         9qvg==
X-Gm-Message-State: AOJu0YzvWL8gxtLAl/xDV9Y952U7NhMhNrB435ytDOTOcMc0tn6pIDzM
	dtyrNNe55/yuUxzaCOdu0bZCXrjpVDGDDtt5jymblUSd/qrZi2irwBBRiHavCPYxeuDEeqDFI0Z
	BFvz4
X-Gm-Gg: ASbGncsc74iSJb9A5w6Oi4TldF49AAEz8cZE7Ssc90l/VF6EnC4CjkyoUIP+uCa0Byx
	/tZsHVauZfEihYdZca7If+hbOdLPmQYqIo1uFc423UbK/ctZEOBcl0BX6weOG3EgUyGRM7bvI3l
	szoPhaSPEHQPME/5rvLdg8anIpDdQq433w7F3Q4HOnkoDuWYrkSdy60b+tZ2VYGzAkBl09ras7D
	AheDJQwoltvXXOVsDeU/HtACXaIpuaKBgZRcQcpNievBqT7J434mcdfZhBpB3KVQGHhx9Q9DI0L
	X1Fxbkf+skk8NoZLPzJo78HnHBbn8xY9FB+3c6VI2lCr1U2KcC1PsvltASbiJ0YgKQX9jiZ1BO+
	cdSWg/Q0vp1XREoNBqAqr4vegvj/4I6x0oGVNOIb2ITeKslq4AnY/kF2Z1FDDSzfp7OG2NRAtrW
	uXunesAq+2pdKvig==
X-Google-Smtp-Source: AGHT+IEHwIqdud9RKudj0jJgtwoITwc6PXda1iEKImvBP1RRVx7uFH182flNvxlGhX69TdzYOiqNQg==
X-Received: by 2002:a17:90b:4a43:b0:340:e4fb:130b with SMTP id 98e67ed59e1d1-340e4fb1b03mr5954366a91.14.1762150433485;
        Sun, 02 Nov 2025 22:13:53 -0800 (PST)
Received: from MVIN00013.mvista.com ([103.250.136.214])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340d1a4a587sm5668837a91.3.2025.11.02.22.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 22:13:53 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] go: fix CVE-2024-24783
Date: Mon,  3 Nov 2025 11:43:36 +0530
Message-ID: <20251103061336.53074-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 06:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225587

Upstream-Status: Backport https://github.com/golang/go/commit/be5b52bea674190ef7de272664be6c7ae93ec5a0

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.21/CVE-2024-24783.patch           | 83 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-24783.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index aab8e85c22..465f24e108 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -68,6 +68,7 @@ SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main \
            file://CVE-2025-47907-pre-0002.patch \
            file://CVE-2025-47907.patch \
            file://CVE-2025-47906.patch \
+           file://CVE-2024-24783.patch \
            "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2024-24783.patch b/meta/recipes-devtools/go/go-1.21/CVE-2024-24783.patch
new file mode 100644
index 0000000000..952258be20
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2024-24783.patch
@@ -0,0 +1,83 @@
+From be5b52bea674190ef7de272664be6c7ae93ec5a0 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Thu, 18 Jan 2024 12:51:13 -0800
+Subject: [PATCH] [release-branch.go1.21] crypto/x509: make sure pub key is
+ non-nil before interface conversion
+
+alreadyInChain assumes all keys fit a interface which contains the
+Equal method (which they do), but this ignores that certificates may
+have a nil key when PublicKeyAlgorithm is UnknownPublicKeyAlgorithm. In
+this case alreadyInChain panics.
+
+Check that the key is non-nil as part of considerCandidate (we are never
+going to build a chain containing UnknownPublicKeyAlgorithm anyway).
+
+For #65390
+Fixes #65392
+Fixes CVE-2024-24783
+
+Change-Id: Ibdccc0a487e3368b6812be35daad2512220243f3
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2137282
+Reviewed-by: Damien Neil <dneil@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2173774
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Carlos Amedee <amedee@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/569238
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+
+CVE: CVE-2024-24783
+Upstream-Status: Backport [https://github.com/golang/go/commit/be5b52bea674190ef7de272664be6c7ae93ec5a0]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/crypto/x509/verify.go      |  3 +++
+ src/crypto/x509/verify_test.go | 19 +++++++++++++++++++
+ 2 files changed, 22 insertions(+)
+
+diff --git a/src/crypto/x509/verify.go b/src/crypto/x509/verify.go
+index 9ef1146..3e95808 100644
+--- a/src/crypto/x509/verify.go
++++ b/src/crypto/x509/verify.go
+@@ -819,6 +819,9 @@ func (c *Certificate) buildChains(cache map[*Certificate][][]*Certificate, curre
+ 	)
+ 
+ 	considerCandidate := func(certType int, candidate *Certificate) {
++		if candidate.PublicKey == nil {
++			return
++		}
+ 		for _, cert := range currentChain {
+ 			if cert.Equal(candidate) {
+ 				return
+diff --git a/src/crypto/x509/verify_test.go b/src/crypto/x509/verify_test.go
+index 9954a67..9da39ca 100644
+--- a/src/crypto/x509/verify_test.go
++++ b/src/crypto/x509/verify_test.go
+@@ -1968,3 +1968,22 @@ func TestSystemRootsErrorUnwrap(t *testing.T) {
+ 		t.Error("errors.Is failed, wanted success")
+ 	}
+ }
++
++func TestVerifyNilPubKey(t *testing.T) {
++	c := &Certificate{
++		RawIssuer:      []byte{1, 2, 3},
++		AuthorityKeyId: []byte{1, 2, 3},
++	}
++	opts := &VerifyOptions{}
++	opts.Roots = NewCertPool()
++	r := &Certificate{
++		RawSubject:   []byte{1, 2, 3},
++		SubjectKeyId: []byte{1, 2, 3},
++	}
++	opts.Roots.AddCert(r)
++
++	_, err := c.buildChains(nil, []*Certificate{r}, nil, opts)
++	if _, ok := err.(UnknownAuthorityError); !ok {
++		t.Fatalf("buildChains returned unexpected error, got: %v, want %v", err, UnknownAuthorityError{})
++	}
++}
+-- 
+2.50.1
+
-- 
2.50.1


