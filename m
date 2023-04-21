Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A94DC77B73
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 02:50:29 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.3433.1682045425734956351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 19:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=KSA1WAN8;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: vkumbhar@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-517c840f181so1048675a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 19:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1682045424; x=1684637424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mUw7n+/twfMXyqHSFIWGCJ6M1BvN+ZOnq2xi3Ayrp8A=;
        b=KSA1WAN8SfOYDDjTxM3utPDwC4MgwNohFCUTwvjWTfkprx4QREkEf2nRS73C1kEAqR
         t0tv7aWyBuqnjiq6PpWeOMoAfdol4LhSIlaVOHzjl3aHmxdQSIHYiKtfPvRT/IVqLR2h
         bf30nNw2ePctKQ9lDBbr6S5Sa1CwNSQHmfm60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682045424; x=1684637424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUw7n+/twfMXyqHSFIWGCJ6M1BvN+ZOnq2xi3Ayrp8A=;
        b=Qq/+8awae7uXZgIbp3NULsWHiNQ9QnOHV1f1H4Lic+HbgiDWt6pETfgeVBiGTbBgG9
         WzdwWAVRhPjMsodV2F2ktWwobSfd8RP+qcnIsg4DRRP7ORKETeJ9v4DdDYUoEsi57tkF
         343vSS752g4ZvfemHplI82Itp8/xCi9lqg9He6D/CtNW6qiZ7QIbK5KbGo4kSgcCPPz+
         p1MyAaL+ZPmXKo9iuRPb2HDC1EelvkMC5o3QQOMOs/ztSEjPc9Sk4JtFVbcyyUoK4JTS
         mCuLrfQxMkD0szLBKkIUCbCpn8qX80MowM6m2I7xasMEtkF+ss4fdLWPi2yZSkart6o/
         o3ew==
X-Gm-Message-State: AAQBX9clE/1DerIjk7t9Ax1evun5oCj0C6UdJEThTwQzIeC0DTzZOneV
	2LVW2MnWQImk4bnYyOGsIE2q3PW9J8JTiwQAExE=
X-Google-Smtp-Source: AKy350apiiI+e9G5YLy/SUN6++VvQd4/Bad2hROd5W1hy5e9ZhjvUuEbTwHKL4Fr1Upk+W4J41n6fA==
X-Received: by 2002:a17:903:1247:b0:1a5:1a3a:692d with SMTP id u7-20020a170903124700b001a51a3a692dmr4392626plh.22.1682045424576;
        Thu, 20 Apr 2023 19:50:24 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.74.134.63])
        by smtp.gmail.com with ESMTPSA id g22-20020a170902869600b001a67759f9f8sm1745687plo.106.2023.04.20.19.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 19:50:24 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2] go: fix CVE-2023-24537 Infinite loop in parsing
Date: Fri, 21 Apr 2023 08:20:12 +0530
Message-Id: <20230421025012.1609952-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 02:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180260

Setting a large line or column number using a //line directive can cause
integer overflow even in small source files.

Limit line and column numbers in //line directives to 2^30-1, which
is small enough to avoid int32 overflow on all reasonbly-sized files.

Fixes CVE-2023-24537
Fixes #59273
For #59180

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.18/CVE-2023-24537.patch           | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-24537.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 34d58aec2f..cda9227042 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -27,6 +27,7 @@ SRC_URI += "\
     file://add_godebug.patch \
     file://cve-2022-41725.patch \
     file://CVE-2022-41722.patch \
+    file://CVE-2023-24537.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-24537.patch b/meta/recipes-devtools/go/go-1.18/CVE-2023-24537.patch
new file mode 100644
index 0000000000..4521f159ea
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-24537.patch
@@ -0,0 +1,75 @@
+From bf8c7c575c8a552d9d79deb29e80854dc88528d0 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Mon, 20 Mar 2023 10:43:19 -0700
+Subject: [PATCH] [release-branch.go1.20] mime/multipart: limit parsed mime
+ message sizes
+
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802456
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802611
+Reviewed-by: Damien Neil <dneil@google.com>
+Change-Id: Ifdfa192d54f722d781a4d8c5f35b5fb72d122168
+Reviewed-on: https://go-review.googlesource.com/c/go/+/481986
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: Michael Knyszek <mknyszek@google.com>
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/126a1d02da82f93ede7ce0bd8d3c51ef627f2104]
+CVE: CVE-2023-24537
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/go/parser/parser_test.go | 16 ++++++++++++++++
+ src/go/scanner/scanner.go    |  5 ++++-
+ 2 files changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/src/go/parser/parser_test.go b/src/go/parser/parser_test.go
+index 1a46c87..993df63 100644
+--- a/src/go/parser/parser_test.go
++++ b/src/go/parser/parser_test.go
+@@ -746,3 +746,19 @@ func TestScopeDepthLimit(t *testing.T) {
+		}
+	}
+ }
++
++// TestIssue59180 tests that line number overflow doesn't cause an infinite loop.
++func TestIssue59180(t *testing.T) {
++	testcases := []string{
++		"package p\n//line :9223372036854775806\n\n//",
++		"package p\n//line :1:9223372036854775806\n\n//",
++		"package p\n//line file:9223372036854775806\n\n//",
++	}
++
++	for _, src := range testcases {
++		_, err := ParseFile(token.NewFileSet(), "", src, ParseComments)
++		if err == nil {
++			t.Errorf("ParseFile(%s) succeeded unexpectedly", src)
++		}
++	}
++}
+diff --git a/src/go/scanner/scanner.go b/src/go/scanner/scanner.go
+index f08e28c..ff847b5 100644
+--- a/src/go/scanner/scanner.go
++++ b/src/go/scanner/scanner.go
+@@ -251,13 +251,16 @@ func (s *Scanner) updateLineInfo(next, offs int, text []byte) {
+		return
+	}
+
++	// Put a cap on the maximum size of line and column numbers.
++	// 30 bits allows for some additional space before wrapping an int32.
++	const maxLineCol = 1<<30 - 1
+	var line, col int
+	i2, n2, ok2 := trailingDigits(text[:i-1])
+	if ok2 {
+		//line filename:line:col
+		i, i2 = i2, i
+		line, col = n2, n
+-		if col == 0 {
++		if col == 0 || col > maxLineCol {
+			s.error(offs+i2, "invalid column number: "+string(text[i2:]))
+			return
+		}
+--
+2.25.1
-- 
2.25.1


