Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB98CCFA04
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 20:59:47 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2250.1762203578607190744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 12:59:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=e67P7U97;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso2067862b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 12:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762203578; x=1762808378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=de7N/XhamQM8wU5w8codXLSzfpje8MKOLouEZgGinRs=;
        b=e67P7U97zQjWqysVGOE1KB7o+idXJvtgmzbFZRZzuzIuAnbu1RAsYEE8A5PpjcQoQY
         4nFhnbarqdrvBwujl2TD/dAvAjpqwYnjp32JNamR9/DwnztsYTQcUMK1RChKMYOLqbLs
         H0JMnTQ/m3UfUQLcNXBYBHQo99sxijYCopQ4/foN8SYu2z6S3S94hMRuw6TmXabyoMWl
         HdmqnpXqLCbom0k8h0MQsVFOuN1iDD+rTFfinAJ455Qgu9X3/f8NLeA/FYhuh2tmOIs/
         19cXAqtJSU1N6VYYVyWTQDrX7OjX/TLxLb81T14MBe6/stk2vB1sU3oLhnkMIuvOuRG8
         0Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762203578; x=1762808378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=de7N/XhamQM8wU5w8codXLSzfpje8MKOLouEZgGinRs=;
        b=PWtZzhu6Crg9iph1ZpJ/Nf5iOloIkkhlaLPBWLCKQKUfKDhMDPa3LlfxStifED915G
         bs8MWN6xiJL4AcPzep4sKoiuj50ZimI24EqTPCyoTDWuiMNNvbXYxd2ltm1hmUZr00Hs
         8VerKiNs8/wawdMmvsaAn2IQxOQLX/+SCM0lQ0errmU1sEoMf05L+fKpJaWNjXEEl4h5
         M1rf9GSuaXG+kfqjhcYdtJIf2jfg0oEnhjzdLxRTHSw6g6K7oolL3OEG7MM7c4yZBmwc
         xprLAV+D+zpZYkk+MiGLUxdOy+78oE5BXaKmfk++xGuagAmoC8G03NvfJWfNtaF3bXUQ
         JTRA==
X-Gm-Message-State: AOJu0YyG+yJyjXU7XHCduzvajXaPccNIvyCe5PtJ8HUa5wcJ0d3C8x6K
	ugSHjL5/ObjF9+3/1xlEM9tyLEntmJ86GcyF6UgRLo37P1Ont/GRi26vH7uzuKc+MWx21eAXcED
	p7jC1CEo=
X-Gm-Gg: ASbGnct3LW5jsqj3+RWfbFkpuofsesc+5nTC504HpNdxT8fjqJKR++Cusx5FGMyKeo6
	ConXg9GrpHgRnSb43x9E+6yAPCCkZoHjHRgjnIs1fcFSkc+q0DCSjT1MmUxF9Vf5MGVwb8Wb6cz
	wjQ5InxaXZDInA8P/0quabc7poRm5mT0tLiTQATtqCoLigXEeF25XMyYr9+tbAByGikRLVwQpbT
	q/O17fUQOUmGHhtR9rO0VB9m4LZCp9zW11UehdVJBLpeT03p4vWVq8E+GrkiGvZGIAE1vItKLg1
	+LkwCInyYogQdLHHTIibnh+ogfREF4Kt5y9Fa8rzTj8N+aDXczW05zAQ6BD4Xnh4MCR30mQFLGo
	00u2TmUOEAaCC7rwfFPEAziylDxbZXe4XU/DgBSQuCkSWjdTuZggB/Gz8mF/AaSYp8G7qI8qpZF
	tuuw==
X-Google-Smtp-Source: AGHT+IGVO75BUuCr44ZLOAR3xLri9q/C598Ghz+elnEtPmjk2fAcZQutU2WglGXnelzlULeaeew2ig==
X-Received: by 2002:a05:6a20:430d:b0:343:55a9:3ebf with SMTP id adf61e73a8af0-348ca763736mr18504922637.16.1762203577791;
        Mon, 03 Nov 2025 12:59:37 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:6a2d:a521:f4d2:20a3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415b02891asm2024911a91.9.2025.11.03.12.59.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:59:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/8] go: fix CVE-2024-24783
Date: Mon,  3 Nov 2025 12:59:13 -0800
Message-ID: <b7d89fae22b317199b8f72978712075078a17005.1762203396.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762203396.git.steve@sakoman.com>
References: <cover.1762203396.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 20:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225702

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport https://github.com/golang/go/commit/be5b52bea674190ef7de272664be6c7ae93ec5a0

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


