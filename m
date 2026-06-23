Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CBACDE003
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:04 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33400.1782253620750671038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mWXoJ0Fm;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4926046fbc5so2234265e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253619; x=1782858419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6o79g/SLJQl4RlHERpP4a6Mkds7gttqIZTFFIgM4Xek=;
        b=mWXoJ0FmeCkWuZXleyZWVRfr1M4G/BX2K8Xu4wlTYa89xQ0t4GLOWSxyfO/nwOTQzd
         KVb28fcphsMzGN44V1JWcvD5RKlS1HeN+YPpEqbiG/fNR7NYwl7CMTO0u1mkJ2cbedje
         +mdaUdpYWnfYv7nLMaJAOsWlliqVJs9x2Kf54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253619; x=1782858419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6o79g/SLJQl4RlHERpP4a6Mkds7gttqIZTFFIgM4Xek=;
        b=XujCP3C8zY4p5Mh+P/qnHQ0LLiSr3V+wVe3Jsxow7gaotg+2kKqCO3w6iHA/vz//2H
         JIjuuoewd0JD6Z+eRpJxNBnqAJaIS2VX5Q0zZP5uyBgJF53VuEEqDUbBoaXeKMS0xnQJ
         CeEGSk15nuerOW0yR89NLVjpRP/WqQ9+yguWpJI/n4EiNv5vm/l5sHUbH0+netomuCdo
         1D/IbmIOQQL3pDpSLTDpAGdqjwMtVCKPcU2CvRlbFeSswoC/KaRTybOd3EyEsDJc+NVs
         HCf/sQtf3+XrmEXzA2LwqJyJScLA63qNc7o6sfDhetFJwzlFofZ/cxZhU/LLx0yQf81m
         8IxA==
X-Gm-Message-State: AOJu0Yz4na1NUncwslbVp93jGyqQjviHFYL8oPaBbZ3wC1/jsvnOeTU7
	zgxDbz6+WokF8Ik4f6jl/yQCnwOitYZdQfixJAQgVIgR4GB06Zz2ThRxms8S+JxxaSCFP5ODVR+
	7b/qk
X-Gm-Gg: AfdE7ckMrRm+4hKbCdlILbfF4FPnTjTIHALnfb8arcu6EZkhMBJdO6bo/yVuicxZrYA
	a8Hc0hfWPprQMpAFi8Mezz4AjM7xYqTxYcTuuQ9SbMmFqy4n+VAhnsRS/QxCKXkZzpHyzUTqpG1
	5qzykpNmOiggoVj3CNFcVoisobPIanjInlOTGCzcclTVblKIMeqTUatDaA31b11yV8iCkmyzqw6
	BjvY7/lJRfdHZlkcSI3+9SQ0YAP5UY2Q7pC1JIMeUdY9URzrZdCDbMiy//4TcZrKAaHiLNHPlgr
	aVeK0IQBQ3HmJdup5jedApp6KOIbKsLuqYuca4TTQvgC1ZHC9kPRn7q4nVbsPTny3sYMKw8Ot3b
	0WYKJsv1B68Ls0qysQUU0sSuVSI9p2LZzXvgH1rGIgVFfC/uLM6Nlv/iwtQayB2xrj2p1eAbclV
	WVWdXAOASQvGXVEfuuI+a/l1jmilpt0T8jBBuhiJCtbjQcnDSaDdcysrfq0jCd7DjhsnxzbF5JQ
	K+wNBIlae+IXuml
X-Received: by 2002:a05:600c:6285:b0:492:4a1a:a96a with SMTP id 5b1f17b1804b1-4925a0b587fmr79518655e9.11.1782253618933;
        Tue, 23 Jun 2026 15:26:58 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.26.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:26:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 04/41] go: fix CVE-2025-58183
Date: Wed, 24 Jun 2026 00:26:03 +0200
Message-ID: <e0285488a93cf3b369ad7424d55938791f57174f.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239426

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1], as referenced in [2],
to address unbounded memory consumption when reading GNU tar pax
1.0 sparse file regions in archive/tar.

[1] https://github.com/golang/go/commit/613e746327381d820759ebea6ce722720b343556
[2] https://security-tracker.debian.org/tracker/CVE-2025-58183

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-58183

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-58183.patch                | 107 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-58183.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 7016acd0616..f6feb1d0b5f 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -58,6 +58,7 @@ SRC_URI += "\
     file://CVE-2026-42501.patch \
     file://CVE-2026-42504.patch \
     file://CVE-2026-42507.patch \
+    file://CVE-2025-58183.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-58183.patch b/meta/recipes-devtools/go/go/CVE-2025-58183.patch
new file mode 100644
index 00000000000..51a4f02ddcd
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-58183.patch
@@ -0,0 +1,107 @@
+From c25bf45db0b232e8ad9d2bc53e61678ebc5efe90 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 11 Sep 2025 13:32:10 -0700
+Subject: [PATCH] [release-branch.go1.24] archive/tar: set a limit on the
+ size of GNU sparse file 1.0 regions
+
+Sparse files in tar archives contain only the non-zero components
+of the file. There are several different encodings for sparse
+files. When reading GNU tar pax 1.0 sparse files, archive/tar did
+not set a limit on the size of the sparse region data. A malicious
+archive containing a large number of sparse blocks could cause
+archive/tar to read an unbounded amount of data from the archive
+into memory.
+
+Since a malicious input can be highly compressable, a small
+compressed input could cause very large allocations.
+
+Cap the size of the sparse block data to the same limit used
+for PAX headers (1 MiB).
+
+Thanks to Harshit Gupta (Mr HAX) (https://www.linkedin.com/in/iam-harshit-gupta/)
+for reporting this issue.
+
+Fixes CVE-2025-58183
+For #75677
+Fixes #75710
+
+CVE: CVE-2025-58183
+Upstream-Status: Backport [https://github.com/golang/go/commit/613e746327381d820759ebea6ce722720b343556]
+
+Backport Changes:
+- The upstream fix includes a testdata tarball as a git binary diff.
+  However, quilt cannot apply git binary diffs and fails with the error:
+  "File src/archive/tar/testdata/gnu-sparse-many-zeros.tar.bz2:
+   git binary diffs are not supported."
+- As a result, the unnecessary bzip2 test file
+  src/archive/tar/testdata/gnu-sparse-many-zeros.tar.bz2
+  has been removed.
+- Furthermore, in src/archive/tar/reader_test.go, within the TestReader()
+  function, the test vector entry for testdata/gnu-sparse-many-zeros.tar.bz2
+  has been removed.
+
+Change-Id: I70b907b584a7b8676df8a149a1db728ae681a770
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2800
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2967
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/709843
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+TryBot-Bypass: Michael Pratt <mpratt@google.com>
+Auto-Submit: Michael Pratt <mpratt@google.com>
+(cherry picked from commit 613e746327381d820759ebea6ce722720b343556)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ src/archive/tar/common.go | 1 +
+ src/archive/tar/reader.go | 9 +++++++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/archive/tar/common.go b/src/archive/tar/common.go
+index 4910908f81e..ec1b8668547 100644
+--- a/src/archive/tar/common.go
++++ b/src/archive/tar/common.go
+@@ -38,6 +38,7 @@ var (
+ 	errMissData        = errors.New("archive/tar: sparse file references non-existent data")
+ 	errUnrefData       = errors.New("archive/tar: sparse file contains unreferenced data")
+ 	errWriteHole       = errors.New("archive/tar: write non-NUL byte in sparse hole")
++	errSparseTooLong   = errors.New("archive/tar: sparse map too long")
+ )
+ 
+ type headerError []string
+diff --git a/src/archive/tar/reader.go b/src/archive/tar/reader.go
+index 0811779adda..71d0b20b76d 100644
+--- a/src/archive/tar/reader.go
++++ b/src/archive/tar/reader.go
+@@ -531,12 +531,17 @@ func readGNUSparseMap1x0(r io.Reader) (sparseDatas, error) {
+ 		cntNewline int64
+ 		buf        bytes.Buffer
+ 		blk        block
++		totalSize  int
+ 	)
+ 
+ 	// feedTokens copies data in blocks from r into buf until there are
+ 	// at least cnt newlines in buf. It will not read more blocks than needed.
+ 	feedTokens := func(n int64) error {
+ 		for cntNewline < n {
++			totalSize += len(blk)
++			if totalSize > maxSpecialFileSize {
++				return errSparseTooLong
++			}
+ 			if _, err := mustReadFull(r, blk[:]); err != nil {
+ 				return err
+ 			}
+@@ -569,8 +574,8 @@ func readGNUSparseMap1x0(r io.Reader) (sparseDatas, error) {
+ 	}
+ 
+ 	// Parse for all member entries.
+-	// numEntries is trusted after this since a potential attacker must have
+-	// committed resources proportional to what this library used.
++	// numEntries is trusted after this since feedTokens limits the number of
++	// tokens based on maxSpecialFileSize.
+ 	if err := feedTokens(2 * numEntries); err != nil {
+ 		return nil, err
+ 	}
+-- 
+2.35.6
+

