Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E15DC369B1
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 20:33:53 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.36476.1744403628927350817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 13:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pRbUN4Ax;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-739be717eddso1926434b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 13:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744403628; x=1745008428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tt0J4OEvJBu+13S7af/y15Hrbjl0vCqGV/+c+dcH4I4=;
        b=pRbUN4AxRkV5P+zRZ+myenwwXNX1jOxnr/Bu9eakMjreqEYf0mXb92JgnlyNd5R3te
         ChTkQmGrp3XV0E6TMTIibYyqQuhkv/nBBlkXaoFID0e2ZV97V3AKf9P2Z9vpUcfaf8mE
         4RcbR2P6Miu+Y1xgEvpXmTFCqt+jpy7sPge0K/k6tnzA12fuN9nkAYuRz+WIkWUldcQz
         GbcnQYPWUAvzn08MS5J4CTTiZl73b/bs34kjnq7fOLbE7+xxyZg3fVQrI132NaeHp3B4
         qBIgEZZlAevtMqTJEBZ1oR058nK3u5g3OF45+LfgKlq4TdsyKekwK8j5L0pkZsIzE1TQ
         Kd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403628; x=1745008428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tt0J4OEvJBu+13S7af/y15Hrbjl0vCqGV/+c+dcH4I4=;
        b=lGw236aTcm06pDz2e67nEtNSILoGVhle1Arg/G8DNu4FtYVOCu6gzwV4kXV7HMrUd1
         cvnYDnEhmUjqJAlWDW7YO+D8tfh1yXwfjXxOzohTW0CDDYC3fWcHhcyPPyA9XMAHv6AM
         bnmJ5XPlrB7p4gRJEd5Nlscp9b12AYcW9TJ0+EV6q4UXzu02Xl3Zky0ov1/bCmQ32Q3t
         l55x3VxgHRTF6h0yOpKNy1AsdY/LvQeemuPo9YdTCi+jaJBEQQ2xypUY9PNJbkr4xJgq
         0d6WD+SHV9Kxwdo+YubfEpczKA9/6QCVilE3WhGV+sl49w2Bn3J7VrQregmOJk/AeaiN
         QvHA==
X-Gm-Message-State: AOJu0YxPW3+mypKPxLQQThMnPPkLPy/8YySyY+iPXuf8T6EGPh467j1d
	QRr1RAG1W9MDzCI44Wes9RJWiMRC9DbwYKE56rVhVEyHghmVs+8UkENxkt6K4PEnpEw1WNq9ylu
	C
X-Gm-Gg: ASbGncvzYxqZKCN1NHoDFhqQn52olGxxu0xaFkZfglb5X+TFka12JXccBD4L/o19d7C
	cr2VFCk1PsRFMxW4uRmykdh8YBwrppmVPDREj34Dw7Kas8/DLB0Ys6mQouOXiQQ+ECBeyswTIeN
	Z/CZw5tkMu+T1mfWw1pfOony0vvYOF63ILi1/D9/dCwANMbQkAQt2Y6SXupHZNVgybHXVw8cPc4
	4lo3CH1wWiKifcuI4T55J1Up85nFQiA9gZ/ZAQmcuilZwE4PRiD0ut8k6LyaJ3MNEDj1luPmuhZ
	qB4Af6jqDHKAmBnhdqWzxMZIX9Ppiz60
X-Google-Smtp-Source: AGHT+IF8C3KzCFw585R20cviGAOWnJNoOIRTHa9hEKEKkc2RxpzapDlMiwnmEtgYtupWv082z0uF3g==
X-Received: by 2002:a05:6a00:2405:b0:736:5544:7ad7 with SMTP id d2e1a72fcca58-73bd1203c12mr4399204b3a.14.1744403627945;
        Fri, 11 Apr 2025 13:33:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c93f:3642:a7d6:27ed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230d697sm2067498b3a.123.2025.04.11.13.33.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:33:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/8] go: fix CVE-2025-22870
Date: Fri, 11 Apr 2025 13:33:28 -0700
Message-ID: <88e79f915137edc5a37a110abdc79f5800404e45.1744403103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744403103.git.steve@sakoman.com>
References: <cover.1744403103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 20:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214755

From: Archana Polampalli <archana.polampalli@windriver.com>

Matching of hosts against proxy patterns can improperly treat an IPv6 zone ID
as a hostname component. For example, when the NO_PROXY environment variable
is set to "*.example.com", a request to "[::1%25.example.com]:80` will incorrectly
match and not be proxied.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2025-22870.patch                | 80 +++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-22870.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 05aa3a95b6..df77794506 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -14,5 +14,6 @@ SRC_URI += "\
     file://0007-exec.go-filter-out-build-specific-paths-from-linker-.patch \
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
+    file://CVE-2025-22870.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
diff --git a/meta/recipes-devtools/go/go/CVE-2025-22870.patch b/meta/recipes-devtools/go/go/CVE-2025-22870.patch
new file mode 100644
index 0000000000..6ed394c8e5
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-22870.patch
@@ -0,0 +1,80 @@
+From 25177ecde0922c50753c043579d17828b7ee88e7 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 26 Feb 2025 16:08:57 -0800
+Subject: [PATCH] all: updated vendored x/net with security fix
+
+0b6d719 [internal-branch.go1.23-vendor] proxy, http/httpproxy: do not mismatch IPv6 zone ids against hosts
+
+Fixes CVE-2025-22870
+For #71985
+
+Change-Id: Ib72c96bd0ab44d9ed2ac1428e0a9fc245464b3fc
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2141
+Commit-Queue: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/654695
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Michael Pratt <mpratt@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Auto-Submit: Junyang Shao <shaojunyang@google.com>
+
+CVE: CVE-2025-22870
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/25177ecde0922c50753c043579d17828b7ee88e7]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/cmd/internal/moddeps/moddeps_test.go            |  1 +
+ src/vendor/golang.org/x/net/http/httpproxy/proxy.go | 10 ++++++++--
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/src/cmd/internal/moddeps/moddeps_test.go b/src/cmd/internal/moddeps/moddeps_test.go
+index 3d4c99e..ffaa16c 100644
+--- a/src/cmd/internal/moddeps/moddeps_test.go
++++ b/src/cmd/internal/moddeps/moddeps_test.go
+@@ -33,6 +33,7 @@ import (
+ // See issues 36852, 41409, and 43687.
+ // (Also see golang.org/issue/27348.)
+ func TestAllDependencies(t *testing.T) {
++	t.Skip("TODO(#71985) 1.23.7 contains unreleased changes from vendored modules")
+	goBin := testenv.GoToolPath(t)
+
+	// Ensure that all packages imported within GOROOT
+diff --git a/src/vendor/golang.org/x/net/http/httpproxy/proxy.go b/src/vendor/golang.org/x/net/http/httpproxy/proxy.go
+index c3bd9a1..864961c 100644
+--- a/src/vendor/golang.org/x/net/http/httpproxy/proxy.go
++++ b/src/vendor/golang.org/x/net/http/httpproxy/proxy.go
+@@ -14,6 +14,7 @@ import (
+	"errors"
+	"fmt"
+	"net"
++	"net/netip"
+	"net/url"
+	"os"
+	"strings"
+@@ -180,8 +181,10 @@ func (cfg *config) useProxy(addr string) bool {
+	if host == "localhost" {
+		return false
+	}
+-	ip := net.ParseIP(host)
+-	if ip != nil {
++	nip, err := netip.ParseAddr(host)
++	var ip net.IP
++	if err == nil {
++		ip = net.IP(nip.AsSlice())
+		if ip.IsLoopback() {
+			return false
+		}
+@@ -363,6 +366,9 @@ type domainMatch struct {
+ }
+
+ func (m domainMatch) match(host, port string, ip net.IP) bool {
++	if ip != nil {
++		return false
++	}
+	if strings.HasSuffix(host, m.host) || (m.matchHost && host == m.host[1:]) {
+		return m.port == "" || m.port == port
+	}
+--
+2.40.0
-- 
2.43.0


