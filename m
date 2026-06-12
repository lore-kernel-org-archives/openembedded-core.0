Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9300CD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 13:18:16 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70327.1781270286396324211
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 06:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WByjkXBk;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5843; q=dns/txt;
  s=iport01; t=1781270286; x=1782479886;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VHprbx1l+1GRZWN8VIEgA2xnZ1lYvkatcZFpx+TMV8A=;
  b=WByjkXBkhDdeRnlx3xpTYEBbJWog5hdS9eV5QOUPwfhG0l71USMN1AL7
   HMq0PDOZqqZsOljvWifpptU53i5ZnimUkIcRxfozijNpnOPHT+6iSvtTV
   3slE67yI9bcugk5HnI+nUJSb/au8UDHtm4Tm6G4tGg+3rjBVx2TsGaRjJ
   nTjL/FGfBj5wvVT97rCimRB/RCbTWb9Ff+urqacDKxVhnNwcyvERxhueL
   m942uwsFEFkgW4aI58ePTY4HA0sIyT9WyQasTE6DjqxIgWwtEApZhbEeG
   OrmQJajkFX0pK4rY3cKiEbHSjaQCvcDjPRk7MsvcqxGnqU+w4bBJ7g3xZ
   g==;
X-CSE-ConnectionGUID: 8Oi9maqvTwSPZYdHE/HF1g==
X-CSE-MsgGUID: qq5zrBYNR3ukiAxPvh9q1Q==
X-IPAS-Result: =?us-ascii?q?A0BDAgCMBixq/4v/Ja1aHgEBCxIMggULgld0X0JJA5Qng?=
 =?us-ascii?q?iGeHhSBEANXDwEBAQ9EDQQBAZJIAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBOAFyAwECWiMhgwIBgnMCARGzM4IsgQGDYgEFA?=
 =?us-ascii?q?kNQ2ywBBQYUAYE4hT+IH1sYAYR8JxsbgXKEfoEFgVwBAYE4DoZfBIIJGYEMY?=
 =?us-ascii?q?3qPCUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYFKgStqgQOFD?=
 =?us-ascii?q?SMfAzl/gXSBKGdpFTA1gQIREgMLGA1IESw3FBsEPm4HjEIXD4FMJS0fAXsTA?=
 =?us-ascii?q?SsgMTSBDgEYTqUooQ8KKIN1jCGVOhozhASUF5JRC5h9jgqWUIRogWg8OYEOC?=
 =?us-ascii?q?wdwFYMiUxkPjioDCwuDYIF/gxTDFSQ1CwMvAQEHAgcOAwuBaJABgXwBAQ?=
IronPort-Data: A9a23:UrI0NqDommvjuBVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApD8hhDIFx
 jRNWDyAOareYmv1fY0lPYznoxtQucKEnYM3OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jX2thh
 fuo+5eBYAH8gWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEk9JvXUQ/JJMk5d1PM1BC1
 dFfCB5UYUXW7w626OrTpuhEnM8vKozveYgYoHwllWufBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGE+BPjDS0Un1lM/E48ygeKihnDXeDxDo1XTrq0yi4TW5FAgi+mwaoaEKrRmQ+1MhxuKv
 Ej32V6iHxIbHcyn1zrU6yuV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOP9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:Q1dI2qlsJFzCZdzggU3KqgZ55RHpDfIc3DAbv31ZSRFFG/Fw8P
 re/sjzuiWbtN98YhwdcLO7Scq9qA3nlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadE/DFCm5rY4ts3CBxWPGVXV50=
X-Talos-CUID: 9a23:Ov9AQWOCh2Gs9+5DCA5mpUsdA94ZbUbl/kbcA2L/KUgwR+jA
X-Talos-MUID: 9a23:vzmLFAmcTficoT8vWfXpdnp7LZp6+Y6fLnpWjJYHktm8KywhIm6k2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,200,1774310400"; 
   d="scan'208";a="493952498"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jun 2026 13:18:03 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 841B6180007F5
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 13:18:03 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id D7AB1CB6A93; Fri, 12 Jun 2026 06:18:02 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 1/3] go: fix CVE-2025-58183
Date: Fri, 12 Jun 2026 06:16:16 -0700
Message-Id: <20260612131618.664716-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 13:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238618

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1], as referenced in [2],
to address unbounded memory consumption when reading GNU tar pax
1.0 sparse file regions in archive/tar.

[1] https://github.com/golang/go/commit/613e746327381d820759ebea6ce722720b343556
[2] https://security-tracker.debian.org/tracker/CVE-2025-58183

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-58183

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-58183.patch                | 107 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-58183.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 3fa421e223..5bd3e98938 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -41,6 +41,7 @@ SRC_URI += "\
     file://CVE-2025-68121_p1.patch \
     file://CVE-2025-68121_p2.patch \
     file://CVE-2025-68121_p3.patch \
+    file://CVE-2025-58183.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-58183.patch b/meta/recipes-devtools/go/go/CVE-2025-58183.patch
new file mode 100644
index 0000000000..b3e043ea0a
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
-- 
2.35.6


