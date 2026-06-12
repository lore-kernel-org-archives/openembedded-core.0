Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8057CD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 13:18:46 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70357.1781270317873400863
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 06:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=R4kkXF+G;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7437; q=dns/txt;
  s=iport01; t=1781270317; x=1782479917;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=raWFgl0OQKBBOm9GIrhpxJNTVkjYtdf62sC+2HcznOM=;
  b=R4kkXF+GDh9QWgcamhmmPksDYFoZPojc7o91wqfs9siE6Ga0sYxrnl4n
   en0iAHgKzuv5cB2uXU9BKm6lUyEzZTSpw53GV+rckgYj+y9X4HbcAs3xY
   axoPeMJmuHVmMvZIoHMLdudGAvsyWo2M9JutD8v3LCFXXqj72m6pAiqJ1
   QFQhXHcdAyBlQ5Z0eL3BKoJgMY+vRrKG7mhv1xzVREOsN9DqgJOw2EBKy
   YIMjfOnp+cOjG/tNkcSDzdVGL04149UaFPh9tqwW+9IvUHwibKacGLww8
   BA3Q+BPggXTOj0lrJSAKsXW4HA15W466oHOPXLzluXx4V0qr8hqQfLIU3
   g==;
X-CSE-ConnectionGUID: biOMvSQiQPm2D4dYQmFT3Q==
X-CSE-MsgGUID: dEi4IbqiTvKUetQu3rna3g==
X-IPAS-Result: =?us-ascii?q?A0BHAgCiBSxq/4r/Ja1aHgEBCxIMggULgld0X0JJA5Qng?=
 =?us-ascii?q?iEDnhuBJANXDwEBAQ9EDQQBAYUGAo1AAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBAgEDMgFWHAMBAi8rIwgZgwIBgnMCARGzK?=
 =?us-ascii?q?4IsgQGDYgEFAkNQ2ysBBQYUAYE4hT+IH1sYAYR8JxsbgXKECHaBBYFcAQGBN?=
 =?us-ascii?q?wGGbQSCIoEMgV2CI4xmSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMG?=
 =?us-ascii?q?wcFgUqBK2qBA4UNIx8DOX+BdIEoZ2kVMDWBAhESAwsYDUgRLDcUGwQ+bgeMQ?=
 =?us-ascii?q?hcPgUsBJS0fAS0QPhMBKyAvATWBDgEYo1WCIaEPCiiDdYwhlToaM4QElBeSU?=
 =?us-ascii?q?QuYfYsngmOWD0GEaIFoPDmBDgsHcBWDIlMZD44qAwsLg2CBf4MUwxUkNQsDL?=
 =?us-ascii?q?wEBBwIHDgMLgWiQAAEngVUBAQ?=
IronPort-Data: A9a23:QWVVWK7ZRtLeP4WLRMXMlwxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mYcWz+Oa/qLNDH3f9AibIjgpBsEuJTSyNNjHAs/r309Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/6UzBHf/g2QqajxNsfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eN4w/3/hMOGB3z
 flCBGwBXymGqd7t+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYfUrsUIMpWcOOAnWTzbjhSqFu9rqss6G+Vxwt0uFToGIaEIYTXFJsJwi50o
 ErK0mWlIxsDNeCB6geI7kux3fXJlHj0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:4ApBLakCEMb7Y8WK5SxUgC1zZTrpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:M9fz6WGKiUMSR1T7qmJt9WkxBPscc0TlyS38f0OJMGNHdOasHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AM66Omg6ZkqoTU9S0Uj3mosj6xoxkzqXyKUoUkKk?=
 =?us-ascii?q?YmPSJKRVtYC2bhW+4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,200,1774310400"; 
   d="scan'208";a="493059644"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jun 2026 13:18:36 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id C6328180001DB
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 13:18:36 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 6237ACB6A93; Fri, 12 Jun 2026 06:18:36 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 3/3] go: fix CVE-2026-32288
Date: Fri, 12 Jun 2026 06:16:19 -0700
Message-Id: <20260612131618.664716-3-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260612131618.664716-1-sudumbha@cisco.com>
References: <20260612131618.664716-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 13:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238620

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1], as referenced in [2],
to address unbounded sparse map handling in `archive/tar`.

[1] https://github.com/golang/go/commit/82b0cdb7411ea2cf02d3a45e6983cc7c8c009d9e
[2] https://security-tracker.debian.org/tracker/CVE-2026-32288

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-32288

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-32288.patch                | 162 ++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32288.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 7dd1c021cb..b3cb3b58b4 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -43,6 +43,7 @@ SRC_URI += "\
     file://CVE-2025-68121_p3.patch \
     file://CVE-2025-58183.patch \
     file://CVE-2026-25679.patch \
+    file://CVE-2026-32288.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-32288.patch b/meta/recipes-devtools/go/go/CVE-2026-32288.patch
new file mode 100644
index 0000000000..7b838db345
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
-- 
2.35.6


