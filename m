Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1B0CDB481
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:03 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32853.1782253621663443819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ujuRBN7l;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-492329c5514so1388305e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253620; x=1782858420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRoLi/EHBoW8jRLSyzK42vHVNktka9GhxhFhhS+3ZFE=;
        b=ujuRBN7lHZPfNdtZCgiSZWfRyhWJGkXHD+WsaEjaeTKixwid457KO217PdbNiYxXV/
         TuHztGZ8P90QGrVCGoSuEh9OY5zXQ/n9HI9Zoixg2S5nR3QvqsoGZHa/ZIy1SXpJddm1
         9OnNpZOqD+XCtPWaLf8fTBAOaxRjRiPEGg130=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253620; x=1782858420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QRoLi/EHBoW8jRLSyzK42vHVNktka9GhxhFhhS+3ZFE=;
        b=kjAVm1+DjlcD2QZbYNlUUH3MC6ZSX6Ow2haxwxlU/WhreNIixva1ZgEWSAHMXrnoEs
         SpOrHD7Os1XWmacs128NxrKw2Ug9ZoOw2M1T/itwSb3h8QQwx6Fb2NSrYD+Y3yC2QVAz
         wJN2ktSSEIn0HA8f8mVy78ti+aC7HxRgM8FcGKfcrzV2Mp/ZaK2jdC6GIiyU8U4koOyV
         hjsh5JxyIRbeaR8xkSv1Jfl9dS4t92VT4owEJOLdTi1AAmC+umn4oMpsoO+p7Umg3Ecp
         QOHxVqqXR01S4S6Ebq1FVTf7PNA/w59egmm/ldUfZ44iOvFFRE8wPCGqnu+wmqbcGomg
         RZbA==
X-Gm-Message-State: AOJu0Yzl/v9/GjBgKES4qW27UjzWWN72tcd5YxfbewyM/afwSKqfhL45
	akRFLl5FmYlpTLdIF3koGTdkniEGK78HsoN0vLzileeQmq9Zf8jpk3IIUHFGIFm8Zw8wIqFhQoc
	aAppU
X-Gm-Gg: AfdE7cm5QrZkR1ksty3mEqYmSjPQCT6pxi52k7J+UiaCXrmx4r1K6LLrjrbjCHROwgN
	auQu56QthtSACBitEmme3fuWb8Lb3ML0lI/9cfSN2Zs0MS/ou7nx9+gkynxmg+fudldpf2AJJx6
	pymgyF68r7pCQyAIbJI/9bTQln16ydJWBgdI3c27guesVO3VtDkHUkB9Z7e3ZZ7+57+AXRATbWA
	kWRggCaQ/YBxNIm8s/rXsb0DqHWkIgMoGV1YFV+5dsIxKuUYyIVa/bDYwHANjyLN7+FyC5ljn9j
	FHMHtXBeww0iYG0KzGoWKnWDeOGH27Uz1Vdr+k/tH0PEdGBvo4WQ6ZYo4p0N8gBnRc6ODV1WSCV
	FiLLB5kLltIkAXLTmKKBqY6xsp9Z6UoMrjKGVkZifgGEhEIKDkJCxwvJjj0dA8EFVA68vWXvPph
	ItwArjDsDLWmq/+M3Z+1sVhTHqiUZobz5fV71FBdiglQt3NH0q2fMS/XQ1A67JbH01Wtb7l4kGB
	EGG5ckQS3cqQwb+LMvlkokSSeI=
X-Received: by 2002:a05:600c:4689:b0:492:38c9:b265 with SMTP id 5b1f17b1804b1-4925a0c5671mr75678185e9.15.1782253619767;
        Tue, 23 Jun 2026 15:26:59 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.26.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:26:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 06/41] go: fix CVE-2026-32288
Date: Wed, 24 Jun 2026 00:26:05 +0200
Message-ID: <775c3af36899eebe5612844accdfd2a8a2a9327a.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239428

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1], as referenced in [2],
to address unbounded sparse map handling in `archive/tar`.

[1] https://github.com/golang/go/commit/82b0cdb7411ea2cf02d3a45e6983cc7c8c009d9e
[2] https://security-tracker.debian.org/tracker/CVE-2026-32288

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-32288

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-32288.patch                | 162 ++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32288.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 7d4274b4eb4..f85104d6f15 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -60,6 +60,7 @@ SRC_URI += "\
     file://CVE-2026-42507.patch \
     file://CVE-2025-58183.patch \
     file://CVE-2026-25679.patch \
+    file://CVE-2026-32288.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-32288.patch b/meta/recipes-devtools/go/go/CVE-2026-32288.patch
new file mode 100644
index 00000000000..a80029ede0a
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-32288.patch
@@ -0,0 +1,162 @@
+From 12bbeb57c20d32519c3f891b428c6f7765db8f55 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Mon, 23 Mar 2026 13:12:44 -0700
+Subject: [PATCH] [release-branch.go1.25] archive/tar: limit the number of
+ old GNU sparse format entries
+
+We did not set a limit on the maximum size of sparse maps in
+the old GNU sparse format. Set a limit based on the cumulative
+size of the extension blocks used to encode the map (consistent
+with how we limit the sparse map size for other formats).
+
+Add an additional limit to the total number of sparse file entries,
+regardless of encoding, to all sparse formats.
+
+Thanks to Colin Walters (walters@verbum.org),
+Uuganbayar Lkhamsuren (https://github.com/uug4na),
+and Jakub Ciolek for reporting this issue.
+
+Fixes #78301
+Fixes CVE-2026-32288
+
+CVE: CVE-2026-32288
+Upstream-Status: Backport [https://github.com/golang/go/commit/82b0cdb7411ea2cf02d3a45e6983cc7c8c009d9e]
+
+Change-Id: I84877345d7b41cc60c58771860ba70e16a6a6964
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3901
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/4003
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/763554
+TryBot-Bypass: Gopher Robot <gobot@golang.org>
+Auto-Submit: Gopher Robot <gobot@golang.org>
+Reviewed-by: Junyang Shao <shaojunyang@google.com>
+Reviewed-by: David Chase <drchase@google.com>
+(cherry picked from commit 82b0cdb7411ea2cf02d3a45e6983cc7c8c009d9e)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ src/archive/tar/format.go      |  6 ++++++
+ src/archive/tar/reader.go      | 28 ++++++++++++++++++++++++----
+ src/archive/tar/reader_test.go | 11 +++++++++++
+ 3 files changed, 41 insertions(+), 4 deletions(-)
+
+diff --git a/src/archive/tar/format.go b/src/archive/tar/format.go
+index 9954b4d9f55..32e58a9d9b4 100644
+--- a/src/archive/tar/format.go
++++ b/src/archive/tar/format.go
+@@ -147,6 +147,12 @@ const (
+ 	// Max length of a special file (PAX header, GNU long name or link).
+ 	// This matches the limit used by libarchive.
+ 	maxSpecialFileSize = 1 << 20
++
++	// Maximum number of sparse file entries.
++	// We should never actually hit this limit
++	// (every sparse encoding will first be limited by maxSpecialFileSize),
++	// but this adds an additional layer of defense.
++	maxSparseFileEntries = 1 << 20
+ )
+ 
+ // blockPadding computes the number of bytes needed to pad offset up to the
+diff --git a/src/archive/tar/reader.go b/src/archive/tar/reader.go
+index 71d0b20b76d..3bb8d62106c 100644
+--- a/src/archive/tar/reader.go
++++ b/src/archive/tar/reader.go
+@@ -490,7 +490,8 @@ func (tr *Reader) readOldGNUSparseMap(hdr *Header, blk *block) (sparseDatas, err
+ 	}
+ 	s := blk.toGNU().sparse()
+ 	spd := make(sparseDatas, 0, s.maxEntries())
+-	for {
++	totalSize := len(s)
++	for totalSize < maxSpecialFileSize {
+ 		for i := 0; i < s.maxEntries(); i++ {
+ 			// This termination condition is identical to GNU and BSD tar.
+ 			if s.entry(i).offset()[0] == 0x00 {
+@@ -501,7 +502,11 @@ func (tr *Reader) readOldGNUSparseMap(hdr *Header, blk *block) (sparseDatas, err
+ 			if p.err != nil {
+ 				return nil, p.err
+ 			}
+-			spd = append(spd, sparseEntry{Offset: offset, Length: length})
++			var err error
++			spd, err = appendSparseEntry(spd, sparseEntry{Offset: offset, Length: length})
++			if err != nil {
++				return nil, err
++			}
+ 		}
+ 
+ 		if s.isExtended()[0] > 0 {
+@@ -510,10 +515,12 @@ func (tr *Reader) readOldGNUSparseMap(hdr *Header, blk *block) (sparseDatas, err
+ 				return nil, err
+ 			}
+ 			s = blk.toSparse()
++			totalSize += len(s)
+ 			continue
+ 		}
+ 		return spd, nil // Done
+ 	}
++	return nil, errSparseTooLong
+ }
+ 
+ // readGNUSparseMap1x0 reads the sparse map as stored in GNU's PAX sparse format
+@@ -586,7 +593,10 @@ func readGNUSparseMap1x0(r io.Reader) (sparseDatas, error) {
+ 		if err1 != nil || err2 != nil {
+ 			return nil, ErrHeader
+ 		}
+-		spd = append(spd, sparseEntry{Offset: offset, Length: length})
++		spd, err = appendSparseEntry(spd, sparseEntry{Offset: offset, Length: length})
++		if err != nil {
++			return nil, err
++		}
+ 	}
+ 	return spd, nil
+ }
+@@ -620,12 +630,22 @@ func readGNUSparseMap0x1(paxHdrs map[string]string) (sparseDatas, error) {
+ 		if err1 != nil || err2 != nil {
+ 			return nil, ErrHeader
+ 		}
+-		spd = append(spd, sparseEntry{Offset: offset, Length: length})
++		spd, err = appendSparseEntry(spd, sparseEntry{Offset: offset, Length: length})
++		if err != nil {
++			return nil, err
++		}
+ 		sparseMap = sparseMap[2:]
+ 	}
+ 	return spd, nil
+ }
+ 
++func appendSparseEntry(spd sparseDatas, ent sparseEntry) (sparseDatas, error) {
++	if len(spd) >= maxSparseFileEntries {
++		return nil, errSparseTooLong
++	}
++	return append(spd, ent), nil
++}
++
+ // Read reads from the current file in the tar archive.
+ // It returns (0, io.EOF) when it reaches the end of that file,
+ // until [Next] is called to advance to the next file.
+diff --git a/src/archive/tar/reader_test.go b/src/archive/tar/reader_test.go
+index 7e0462c3f88..4a527766ba8 100644
+--- a/src/archive/tar/reader_test.go
++++ b/src/archive/tar/reader_test.go
+@@ -1126,6 +1126,17 @@ func TestReadOldGNUSparseMap(t *testing.T) {
+ 		input: makeInput(FormatGNU, "",
+ 			makeSparseStrings(sparseDatas{{10 << 30, 512}, {20 << 30, 512}})...),
+ 		wantMap: sparseDatas{{10 << 30, 512}, {20 << 30, 512}},
++	}, {
++		input: makeInput(FormatGNU, "",
++			makeSparseStrings(func() sparseDatas {
++				var datas sparseDatas
++				// This is more than enough entries to exceed our limit.
++				for i := range int64(1 << 20) {
++					datas = append(datas, sparseEntry{i * 2, (i * 2) + 1})
++				}
++				return datas
++			}())...),
++		wantErr: errSparseTooLong,
+ 	}}
+ 
+ 	for i, v := range vectors {
+-- 
+2.35.6
+

