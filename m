Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2377AEDF036
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 05:00:22 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38435.1770872418020270786
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 21:00:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LztVWgSW;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5772; q=dns/txt;
  s=iport01; t=1770872418; x=1772082018;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hc0lQcYiZDA+FtqvbtUfE8dKRnahrV/zDdA+QrCXqTQ=;
  b=LztVWgSW8M9CFN8BNeIf+wezdKZCIP4ONyuqDjL3Vxr5XGFmDhQjdNPY
   rHevvxP9I/hTC9+7pGMk84vGqqRHOgzi3aJL2PHza8Y/KwRbbGQsGmYAQ
   MfWHMczG9cWTg6+02RTFn8EdqVrrFHIVNhQGQ2JhycN1Lba6P/wgfXbtU
   /YBARRQgMV+niiP16j8sbFmlOwF+4kTAniyjjO4F0R5CWEZrY2vphFYwx
   jlVaDKx06SFffe86rXK9rKjxCPslVe0Bb3hUYEXJTzZxc4OBMkB7cEEge
   Oh34+Po9ym8hGrgTO7d8FXLWwTvoOwfVRyjf4F+7KzYWYaHReNFQSTbk/
   Q==;
X-CSE-ConnectionGUID: 5yujJAsESLWB6dexFSGaRg==
X-CSE-MsgGUID: 7a7J1lYbTgWDVhPAo/c/Jg==
X-IPAS-Result: =?us-ascii?q?A0DxAwAcXY1p/47/Ja1agQmBUIJID3FfQkmEV49TgiGeH?=
 =?us-ascii?q?YF/DwEBAQ89FAQBAZImAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaASkPAXIDAQIDAiYCLSMYCYMCAYJzAgERqE96gTKBA?=
 =?us-ascii?q?YNiAQUCQ0/bJgEFBhQBgQouhTuDGAGEf1sYAYR4JxsbgXKBFYE7gi2BBYFcA?=
 =?us-ascii?q?QGBJ4QUgmkEgiKBDoFkNpFUSIECHANZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?hczWBsHBYgVD4kPeHCBIHIDCxgNSBEsNxQbBD0BbgeOS0GBZAJMAS1hASsgc?=
 =?us-ascii?q?YECARiTJRKQHIIhoQ4KKIN0jB6VOhozqmsLmHuOCZZQhGiBaDw5gQ4LB3AVg?=
 =?us-ascii?q?yJSGQ+OKg4Lg16Bf79jIjU8AgcBCgEBAwmRaoF9AQE?=
IronPort-Data: A9a23:ck0Kl64/XXI28KtJnKI4MQxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mNLC22EM/qIa2r9LY10Pornpk9Q7MLTm4NiSgpopCwyZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+qUzBHf/g2QqajhNsfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eYJwF+MReGkx10
 cMydjwAfj64qOuMz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGc2FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEVUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGISLIYzaGJsLxy50o
 EqZ9jvbWxUrPuCQ9ha78kqFgajE2gH0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBZCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:EbDV6qE5qJii9YEZpLqE48eALOsnbusQ8zAXPidKOHlom62j5q
 KTdZsguyMc5Ax9ZJhCo6HiBEDjexLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowEJ30bFh4lgPW
 AKSdkbNOHN
X-Talos-CUID: =?us-ascii?q?9a23=3A/LtZ4mui7KhveCahI/nO3j+46It4Y2Df7l7LDnS?=
 =?us-ascii?q?cNkw3RLCFZ2S/8Zlrxp8=3D?=
X-Talos-MUID: 9a23:8zMiJgYkYpJpieBT6DazpmhmBc1U7JuCNkA1uJJBsI6mOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,286,1763424000"; 
   d="scan'208";a="663885661"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Feb 2026 05:00:17 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id E8F4B18000D20
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 05:00:16 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 8BBB1CC12B5; Wed, 11 Feb 2026 21:00:16 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core] [scarthgap] [PATCH 3/5] go 1.22.12: Fix CVE-2025-61728
Date: Wed, 11 Feb 2026 20:59:43 -0800
Message-ID: <20260212050011.4080605-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 05:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231007

From: Deepak Rathore <deeratho@cisco.com>

Upstream Repository: https://github.com/golang/go.git

Bug details: https://nvd.nist.gov/vuln/detail/CVE-2025-61728
Type: Security Fix
CVE: CVE-2025-61728
Score: 6.5
Patch: https://github.com/golang/go/commit/3235ef3db85c

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 46f6ef5d8f..04e380c821 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -33,6 +33,7 @@ SRC_URI += "\
     file://CVE-2025-61729.patch \
     file://CVE-2025-61730.patch \
     file://CVE-2025-61726.patch \
+    file://CVE-2025-61728.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-61728.patch b/meta/recipes-devtools/go/go/CVE-2025-61728.patch
new file mode 100644
index 0000000000..99266ed7a8
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-61728.patch
@@ -0,0 +1,171 @@
+From 727c39f7e6c9dc9d4a40d67f39f68ae8867a2abd Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Tue, 4 Nov 2025 17:00:33 -0800
+Subject: [PATCH] [release-branch.go1.24] archive/zip: reduce CPU usage in
+ index construction
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Constructing the zip index (which is done once when first opening
+a file in an archive) can consume large amounts of CPU when
+processing deeply-nested directory paths.
+
+Switch to a less inefficient algorithm.
+
+Thanks to Jakub Ciolek for reporting this issue.
+
+	goos: darwin
+	goarch: arm64
+	pkg: archive/zip
+	cpu: Apple M4 Pro
+	                          │  /tmp/bench.0  │            /tmp/bench.1            │
+	                          │     sec/op     │   sec/op     vs base               │
+	ReaderOneDeepDir-14         25983.62m ± 2%   46.01m ± 2%  -99.82% (p=0.000 n=8)
+	ReaderManyDeepDirs-14          16.221 ± 1%    2.763 ± 6%  -82.96% (p=0.000 n=8)
+	ReaderManyShallowFiles-14      130.3m ± 1%   128.8m ± 2%   -1.20% (p=0.003 n=8)
+	geomean                         3.801        253.9m       -93.32%
+
+Fixes #77102
+Fixes CVE-2025-61728
+
+CVE: CVE-2025-61728
+Upstream-Status: Backport [https://github.com/golang/go/commit/3235ef3db85c]
+
+Change-Id: I2c9c864be01b2a2769eb67fbab1b250aeb8f6c42
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3060
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3328
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/736703
+TryBot-Bypass: Michael Pratt <mpratt@google.com>
+Auto-Submit: Michael Pratt <mpratt@google.com>
+Reviewed-by: Junyang Shao <shaojunyang@google.com>
+(cherry picked from commit 3235ef3db85c2d7e797b976822a7addaf6d5ca2a)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/archive/zip/reader.go      | 11 ++++-
+ src/archive/zip/reader_test.go | 81 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 91 insertions(+), 1 deletion(-)
+
+diff --git a/src/archive/zip/reader.go b/src/archive/zip/reader.go
+index 60b34b76ee..8a79f5d140 100644
+--- a/src/archive/zip/reader.go
++++ b/src/archive/zip/reader.go
+@@ -830,7 +830,16 @@ func (r *Reader) initFileList() {
+				continue
+			}
+
+-			for dir := path.Dir(name); dir != "."; dir = path.Dir(dir) {
++			dir := name
++			for {
++				if idx := strings.LastIndex(dir, "/"); idx < 0 {
++					break
++				} else {
++					dir = dir[:idx]
++				}
++				if dirs[dir] {
++					break
++				}
+				dirs[dir] = true
+			}
+
+diff --git a/src/archive/zip/reader_test.go b/src/archive/zip/reader_test.go
+index 9a77c1aa62..278714bf49 100644
+--- a/src/archive/zip/reader_test.go
++++ b/src/archive/zip/reader_test.go
+@@ -8,6 +8,7 @@ import (
+	"bytes"
+	"encoding/binary"
+	"encoding/hex"
++	"fmt"
+	"internal/obscuretestdata"
+	"io"
+	"io/fs"
+@@ -1834,3 +1835,83 @@ func TestBaseOffsetPlusOverflow(t *testing.T) {
+	// as the section reader offset & size were < 0.
+	NewReader(bytes.NewReader(data), int64(len(data))+1875)
+ }
++
++func BenchmarkReaderOneDeepDir(b *testing.B) {
++	var buf bytes.Buffer
++	zw := NewWriter(&buf)
++
++	for i := range 4000 {
++		name := strings.Repeat("a/", i) + "data"
++		zw.CreateHeader(&FileHeader{
++			Name:   name,
++			Method: Store,
++		})
++	}
++
++	if err := zw.Close(); err != nil {
++		b.Fatal(err)
++	}
++	data := buf.Bytes()
++
++	for b.Loop() {
++		zr, err := NewReader(bytes.NewReader(data), int64(len(data)))
++		if err != nil {
++			b.Fatal(err)
++		}
++		zr.Open("does-not-exist")
++	}
++}
++
++func BenchmarkReaderManyDeepDirs(b *testing.B) {
++	var buf bytes.Buffer
++	zw := NewWriter(&buf)
++
++	for i := range 2850 {
++		name := fmt.Sprintf("%x", i)
++		name = strings.Repeat("/"+name, i+1)[1:]
++
++		zw.CreateHeader(&FileHeader{
++			Name:   name,
++			Method: Store,
++		})
++	}
++
++	if err := zw.Close(); err != nil {
++		b.Fatal(err)
++	}
++	data := buf.Bytes()
++
++	for b.Loop() {
++		zr, err := NewReader(bytes.NewReader(data), int64(len(data)))
++		if err != nil {
++			b.Fatal(err)
++		}
++		zr.Open("does-not-exist")
++	}
++}
++
++func BenchmarkReaderManyShallowFiles(b *testing.B) {
++	var buf bytes.Buffer
++	zw := NewWriter(&buf)
++
++	for i := range 310000 {
++		name := fmt.Sprintf("%v", i)
++		zw.CreateHeader(&FileHeader{
++			Name:   name,
++			Method: Store,
++		})
++	}
++
++	if err := zw.Close(); err != nil {
++		b.Fatal(err)
++	}
++	data := buf.Bytes()
++
++	for b.Loop() {
++		zr, err := NewReader(bytes.NewReader(data), int64(len(data)))
++		if err != nil {
++			b.Fatal(err)
++		}
++		zr.Open("does-not-exist")
++	}
++}
+--
+2.35.6
-- 
2.35.6


