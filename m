Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B93E9B278
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:12 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21678.1771943586404924577
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZlqGuzB9;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48336a6e932so34614195e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943585; x=1772548385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEkrta58ZDPklME4aTKMeM0YG4/gSFyWo25EuNI7t4Q=;
        b=ZlqGuzB9FDakMEifyeiMgMo8QTWz+cI8bGMGgIUYqT5hhrrfTfMv8EKs+7PhzzikQj
         IH4eDvOL9ECSUa79idBmAThu2gqpwlq372I5I/0ZMbTV7rtTvL+I5VY6mh6cM5VnLVam
         h/uYCnF8cr28Q1VE7PIm13Cm2JiF1pSm2zZbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943585; x=1772548385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qEkrta58ZDPklME4aTKMeM0YG4/gSFyWo25EuNI7t4Q=;
        b=OZQLEIcY4kPFNyUS1nWKPQAH4mL45c3rDQsB0usYHQvkuAE0mDVpVzRmq0DbqdwvAQ
         LZO723RoYRR6RRrOX0C9TyB1Hg4IpwZOWP8gyijq3ZdQm7oUQxcC9sXeFd+SprURHipj
         TerN15VWts4+UVlAAzYefs3DdAplkm1/WzXDrZq9BUBykYMv/O9K4KtdDgqy6godLHL+
         gsKANXUxfouhXbWK6SPsaF9RVFLTGiCD9sSajrDsMVoQVDdcCIOFgmP2GUPAAW+hl9mv
         8TA2oqWcGm1YECy/2zAsi3u/U5fcOhdsmkMswC2IQnCjXT23cFGx7d8an0/Box3YqX/D
         /j/A==
X-Gm-Message-State: AOJu0Yz6EbmImjUwlfLlLIhLQiQAQKtTD6hinlCKHLgkg3n+JyHA9WFv
	HIhlkUUGWZaS2oM67fJjC8Wt3ECewa6811oJCo1Xbws5HeYZEJOiiFf6Z63uPpxPZf4Czml2/Wg
	L/rEk
X-Gm-Gg: AZuq6aLhccWP2YdrU2RKyaiwkQsnidP/jMI0nzJRdOQEX3JVpEBpfx2lh2zF2yV7wxF
	4Q2l75H4wTkBvkjRaVYg5EAR7Ukwf9YbodkT2aPzVj4aReaDysF9gl6O0UbFU0IXRLKEtGfTxn3
	836ySYRBIS45esUpLq/wbVsJSOKucRO+CcAZpprXIYK8Fi6KBa+o5q6+0BocxiBpx267E0KQfuc
	tFb3swli8FuF1/RTZc4VGgmkYkIb7Q0ZCB9ljaocg6UESWURAwjdSWVzpo5eIU9YSmp07Gq1dQ2
	g5JXydcI1HQKCymh05lG7zFer8BpuTTLz1UnyxQ5UaujMcLx1kexaf9xwcmQuayFF42eHxE73oQ
	12psNCCkppn9Mc6ixaIGcr7P1Mfnwh4Bx9ITEvRJkYUXiC8IYpzm+J2Ty1VG80BlgRsWdhg7p33
	rHfPYfxoYSFxfX9nhv0tpdjcTq3dDcy5EnpSOF320iw4eSZWnlJWJzOpl5Jvd9+LL9+jQqeZ0uF
	RC/UZSawJsYnOlwFUW+ejUtt2oSy0xblQ==
X-Received: by 2002:a05:600c:8183:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-483a962e09fmr183915015e9.21.1771943584351;
        Tue, 24 Feb 2026 06:33:04 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:04 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/44] go 1.22.12: Fix CVE-2025-61728
Date: Tue, 24 Feb 2026 15:31:50 +0100
Message-ID: <cc93a7ec879e1ceb95befc7be0f86652d9058fd4.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231829

From: Deepak Rathore <deeratho@cisco.com>

Upstream Repository: https://github.com/golang/go.git

Bug details: https://nvd.nist.gov/vuln/detail/CVE-2025-61728
Type: Security Fix
CVE: CVE-2025-61728
Score: 6.5
Patch: https://github.com/golang/go/commit/3235ef3db85c

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-61728.patch                | 171 ++++++++++++++++++
 2 files changed, 172 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61728.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 46f6ef5d8fe..04e380c821e 100644
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
index 00000000000..99266ed7a8c
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

