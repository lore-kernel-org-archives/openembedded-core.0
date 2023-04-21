Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24326C77B75
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 05:50:50 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.5357.1682056240258243300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 22:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=Z7n8I3vD;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1a682eee3baso15339995ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 22:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1682056239; x=1684648239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2iHSlmacZSQUQCLXU/71mqi96fn4asw+f1vAdpvAK5U=;
        b=Z7n8I3vDOsiwKkO/Zn4D+rjLb62zJJ8gToV++7fzhFeEIq60oYdHHFUDfJbJcU1UBi
         pL2ckyo7oU3BbPR5pHLPZf56/OtmMPqK0Vm6IuJcflNe6MbU/2s+m2KQcZxLrg7aZmHJ
         /JNRo+MCffxoRl/h1OAjz/tX0AtyWQBZEixkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682056239; x=1684648239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iHSlmacZSQUQCLXU/71mqi96fn4asw+f1vAdpvAK5U=;
        b=MRez41wo4aC70SLT8OfGtxEms8kPNVgMS+N1OPSdPWKdHjFp3q0Tye1w3yoUndoq48
         SnuhXDMwkQeLLfciXKeO9iICUbP5u7rNB3yVpxeIPV7YrGTkdKQ1q84XWMbsuI7QzwEZ
         DkoVsj1lCmkUbN0sxsPbiLdz72GRfJMYnJmDxvf0LSspOg4kIAcCTSoK2u7BXUJ5u3pU
         gk/K1w39omOjlv2jwfM5B2+Troe8fyrqOkWLNhRd4Ym0i0B9so0v79/U/0GSItzBvo67
         BLFCanfH47myYc5KX3mvW5uUcBO4yKSYegLYLtPGD8xdDKWKamoZBwkqUhWIHtiWwmq7
         X4rQ==
X-Gm-Message-State: AAQBX9c/yLgDG6hiWiabOJxF2pX1R2l7d76xDLX3/8KG8IubQ6jAZ/fH
	lbyorC/x8dHywZe0eVBKQAfr95Pineqfcalogsk=
X-Google-Smtp-Source: AKy350YoXhe9Di4IIosSfceR6XgJIng+qIowX6Az11kNBIqA0Wfc/aE78As6RKThIjznaLIwngawQg==
X-Received: by 2002:a17:903:1209:b0:1a6:4606:6e06 with SMTP id l9-20020a170903120900b001a646066e06mr4783224plh.17.1682056239179;
        Thu, 20 Apr 2023 22:50:39 -0700 (PDT)
Received: from localhost.localdomain ([116.74.134.63])
        by smtp.gmail.com with ESMTPSA id iz12-20020a170902ef8c00b001a212a93295sm1968123plb.189.2023.04.20.22.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 22:50:38 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: fix CVE-2023-24537 Infinite loop in parsing
Date: Fri, 21 Apr 2023 11:20:27 +0530
Message-Id: <20230421055027.995731-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 05:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180271

Setting a large line or column number using a //line directive can cause
integer overflow even in small source files.

Limit line and column numbers in //line directives to 2^30-1, which
is small enough to avoid int32 overflow on all reasonbly-sized files.

Fixes CVE-2023-24537
Fixes #59273
For #59180

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2023-24537.patch           | 76 +++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24537.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 8df9d62612..c3201da8b2 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -55,6 +55,7 @@ SRC_URI += "\
     file://CVE-2022-41723.patch \
     file://CVE-2022-41722-1.patch \
     file://CVE-2022-41722-2.patch \
+    file://CVE-2023-24537.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24537.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24537.patch
new file mode 100644
index 0000000000..e04b717fc1
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24537.patch
@@ -0,0 +1,76 @@
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
+index 37a6a2b..714557c 100644
+--- a/src/go/parser/parser_test.go
++++ b/src/go/parser/parser_test.go
+@@ -738,3 +738,19 @@ func TestScopeDepthLimit(t *testing.T) {
+ 		}
+ 	}
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
+index 00fe2dc..3159d25 100644
+--- a/src/go/scanner/scanner.go
++++ b/src/go/scanner/scanner.go
+@@ -246,13 +246,16 @@ func (s *Scanner) updateLineInfo(next, offs int, text []byte) {
+ 		return
+ 	}
+ 
++	// Put a cap on the maximum size of line and column numbers.
++	// 30 bits allows for some additional space before wrapping an int32.
++	const maxLineCol = 1<<30 - 1
+ 	var line, col int
+ 	i2, n2, ok2 := trailingDigits(text[:i-1])
+ 	if ok2 {
+ 		//line filename:line:col
+ 		i, i2 = i2, i
+ 		line, col = n2, n
+-		if col == 0 {
++		if col == 0 || col > maxLineCol {
+ 			s.error(offs+i2, "invalid column number: "+string(text[i2:]))
+ 			return
+ 		}
+-- 
+2.25.1
+
-- 
2.25.1


