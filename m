Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4D0C7618E
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:55:09 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.10303.1682178906146855925
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xN/p/eG3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1a526aa3dd5so34658985ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682178905; x=1684770905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvMMPuPSTdFfFZKgO4zayv+MN3L6LTmbCTuNRnPypC8=;
        b=xN/p/eG3OGOkF5jKdt41+j107lOct9FPBVvqbuuJyFWv5zQ9m7fTn5EGPp5xYS2skl
         euPLpwi7n0HTkJuS+9cGg4RtsXaQ8xs8K3fNSg79R2In8JI6WnJDCS4SUApI/a8iOfkA
         FumnTlzv27M4IAswNrx6W3Pz/wGsfmK5livNXIm7yLwdPCtwHjoc+A2Xgmgdi9Jqi1Sc
         x//CLWcRkSGGSJnKd2I3OkCXFzHkhVrRSKHLUc70LNcu63fx/2n5KHCi7pEu1MmKjhYb
         ySbSveU7I/kt0HYoAEOEvctkZeBh0vgWtRsI2xV3cmtMdHKBa1zXD4B8WXO+ZKIHs9/c
         Vu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682178905; x=1684770905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvMMPuPSTdFfFZKgO4zayv+MN3L6LTmbCTuNRnPypC8=;
        b=ZbTjX7Q5NAhgjuBtNXB1koqXIjcw56uuIKzv27VReOj/w6UOtqpQ2o3lKgoGLetguZ
         ru+UyL+ONaltf5x9jjJlHnIwvnwyWX0aAKuP1QigSqOV0nr/MgnJ2zB5ed8/rRh/RbKG
         7007P2c5leIbDmoFmC+PajrM7sz10vivvmhEYQmnpxcansORITsMZPi3rug/x9BcYbpW
         7uqH3dZJm7JHI4ChkFmh3rYljdUXBbyqfZaou96uqOkchpFPs+5Q8rRn+e7A0HlCF1XD
         4w2y7ylS6c6jmG882ySkB5DG/YgRPbKpznxla38mjr59hcngVQYX6uwnlZrqOikmafza
         kBXw==
X-Gm-Message-State: AAQBX9exyIjbZsBiTjC5rQnW+ekwl7CQJ+a5mGJvz8gwtxehM/biYh90
	u0HMzJ//0OI5sirKZ+Kew5BdqX4gqhynAScOwA0=
X-Google-Smtp-Source: AKy350Z4PFIJtWs6dJhGeOb7zLhAoRX5kYMUfc7gdqKjEbl4ZhBSBO3rQu7IHFSIeWOvf9BmHgJH8g==
X-Received: by 2002:a17:903:1106:b0:1a9:2e10:4028 with SMTP id n6-20020a170903110600b001a92e104028mr11593607plh.24.1682178905153;
        Sat, 22 Apr 2023 08:55:05 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001a686578b44sm4205342pld.110.2023.04.22.08.55.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:55:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/8] go: fix CVE-2023-24537 Infinite loop in parsing
Date: Sat, 22 Apr 2023 05:54:40 -1000
Message-Id: <15c07dff384ce4fb0e90f4f32c182a82101a1c82.1682178752.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178752.git.steve@sakoman.com>
References: <cover.1682178752.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180310

From: Vivek Kumbhar <vkumbhar@mvista.com>

Setting a large line or column number using a //line directive can cause
integer overflow even in small source files.

Limit line and column numbers in //line directives to 2^30-1, which
is small enough to avoid int32 overflow on all reasonbly-sized files.

Fixes CVE-2023-24537
Fixes #59273
For #59180

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


