Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD28CDE002
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:36 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20445.1782220471361892483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=y7PXCfu4;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b613a17bso47000545e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220470; x=1782825270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRoLi/EHBoW8jRLSyzK42vHVNktka9GhxhFhhS+3ZFE=;
        b=y7PXCfu4Wmd/VyPofH3GGmJjT0LYu8Q17IhX/vJf3n8AATfRzCyVN8YqIrGmpQtXNu
         4+b+Bsbyzrpy5yVxHA4Zdwjl8PwESZpkLiunEksUSkMSeeFEhcEtz30xUvBzPBDlWVSY
         r4VdZU2tq6Kk9LfpZ3oumhidW0csFkQCwaZD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220470; x=1782825270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QRoLi/EHBoW8jRLSyzK42vHVNktka9GhxhFhhS+3ZFE=;
        b=adCJU4WKPOg8yHkZz3M9WQp2t+hDyTAWbMEdrWU/vu1I4wTUIi6BMc/fMkAstWpwUT
         IbqSMDizr9TFCaMqjR5/iI9n8HnIueldN19jFfruni8IIMkd/BokYz0IX1jaZ0kl7gTQ
         3r4KjY/hntXmLhlPIRBiyQcaBp0P3FYa4MfSaB5nOGeh3lPzkEpYSwQqRbpJtE/1xCSO
         W0tpyO5y/Rv5v9FY3PU/R15iQicInZ93VL91DlygUAlExf0SjNIQA5WN/9U955TkQ+VI
         yvjASM2VjXDQnEeAB3UkfmXurBuAW1eODlh4UMV5K0GYzt+Y0DjGc26IWlMGpS7QQ3i4
         tQ8A==
X-Gm-Message-State: AOJu0YyO5stOjoaml23URoe7VFq8aGvhVnPhltq3LrGO81N/4eKi9SEJ
	B8LKnU9qYi7xDx9HEUJkWlwkue5bFcWmS2WBmdXnhHs5nMmOUBrpu/3EyOryYtBKQ8TWs4KxkD/
	Pm/3n
X-Gm-Gg: AfdE7cnZLa1BScVtf7L2p8KuJgZwXX3L4igEzYhqYejKpMMEBcMTkZ/TUAeO0790sYN
	CSrgKqU0gAQF3ype/IYAvDJsAC6lXzGpwgrcR1YxWj9baQDLpwGCdva68FjpBvPC0eYAJ5JTVtS
	5jpJfUrVrOhgtxmWBWhgXJ/JtVxcMdYjF3oDhsOGik0Lv1MHi01tHTqi3JQOnR7EFdc8d3pmKi7
	OPNi+h4eXuML22E3rTUHYUoWPn7n1sO40g9ixt8W8ekFHPazouogDzFTn4blvPnHCPAFFxVZvtf
	ld6/LmO8QXJfmyrMTaI32KvlIAdSpP3yF5A8BJdbDi3lIXprUyanclEpFX3+F8TtTIDzcMYq4MJ
	gTM20qq90qso4XOWzLuc56RgD1T5yh/bZqbwUYIWMw4xnvWgIxheKhHvk1YdiuQUnuSatJGHCtK
	fZ1ck2fUou9jWO8SXUrtYKdWRQa+6e3AH5tDsETo5ywNRE8aaeOFhBFRiMc/UMevadsk6N5zEM+
	A49dFNwOwNs3BNlqA==
X-Received: by 2002:a05:600c:c0c5:b0:492:4ff5:fb9e with SMTP id 5b1f17b1804b1-4924ff5fe1fmr138149625e9.37.1782220469333;
        Tue, 23 Jun 2026 06:14:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/26] go: fix CVE-2026-32288
Date: Tue, 23 Jun 2026 15:13:47 +0200
Message-ID: <775c3af36899eebe5612844accdfd2a8a2a9327a.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239372

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

