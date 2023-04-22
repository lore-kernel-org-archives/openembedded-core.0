Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8B8C77B76
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:58:29 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.10403.1682179104071513233
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=j9OX+u+F;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1a920d484bdso26690425ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682179103; x=1684771103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3yUQiSy43PLSomVgoEr1XAZ3U8MaTa4kFbrKxML/qg=;
        b=j9OX+u+Fg2ZisjOXyr42QAPlpcKBfQ3GPMmrpqrqSlEFiBjkfqGP1cRB0GmJQaYRtB
         5pOYWukPXo3pzBDXgPJuw/jl5rrmE0RSxta3V/NAFDTV9PycyBjVVtgeg5dIxn16yQn5
         Kg0dzog8fXgwA3EFnrQE8Yay3np/t26Zdv7CSJmi8Lhe7RORsysUK7QWdiesll1c3XEG
         Kha/33oJZcsZh04XlggSgz7m5zyXZviY3X3HafLJMV6tzsy5jtW/8ox9kkUrF8ExPrV4
         s2JofKfRtUxlJVO138Y4irINSL1tdKQp809kyq42yFl+JJvqULka9Rv7hA7zQQWpkQik
         GFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682179103; x=1684771103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3yUQiSy43PLSomVgoEr1XAZ3U8MaTa4kFbrKxML/qg=;
        b=FWQh/GQ5oJndQXuZ9UhE84jZFu+JdRoi+NaqbMDvp7IHp4ozgLkwg+TNGYGFX670EJ
         70vKQC3uI+PdEclUWC9L+d7LgajWmaaA48tP4CM23R48t5eW20WBsxaCOOM+aeA6Xwfp
         SMAadze2I8EN96kDLrwCny4UdinaWPeGhr1+VZvSmQlDeMZHrnDD+DBjjCZAGkuEtLbW
         J6vkNVbTGqjL2r1xjwa3thCBNzhGPqSOTrfpNk9hy7pwDAefmMSKt78OmFjyTpIkS+dB
         2MxRCAy+AZe/gCjYXaPmwSqN6lSp6CSSxG5WCqo2gCPzRpnzCORPEv4s8wv9pS4LHafA
         Zq6g==
X-Gm-Message-State: AAQBX9fVWV077dS7oabO0oKuN/5RHQhm8Jddr/w9MaLjvmnzFLY4PgS7
	5B/ZrQ9Gltuan5nghLzh08qiKrwPZLz2/xoxwMc=
X-Google-Smtp-Source: AKy350a5LidB7R7n3bG/ADaJpggaoOfu8vE2tw2XMyxA8pe/piwo14wfAtId+oFpSARkgjgxFxLCbw==
X-Received: by 2002:a17:903:24c:b0:1a6:b1a2:5f21 with SMTP id j12-20020a170903024c00b001a6b1a25f21mr11423539plh.8.1682179103098;
        Sat, 22 Apr 2023 08:58:23 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t13-20020a1709028c8d00b001a4fe00a8d4sm4189412plo.90.2023.04.22.08.58.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:58:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/7] go: fix CVE-2023-24537 Infinite loop in parsing
Date: Sat, 22 Apr 2023 05:58:04 -1000
Message-Id: <d1943e6a0ec00653c81cd4c0bb0d6b7e0909094c.1682178944.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178944.git.steve@sakoman.com>
References: <cover.1682178944.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180318

From: Vivek Kumbhar <vkumbhar@mvista.com>

Setting a large line or column number using a //line directive can cause
integer overflow even in small source files.

Limit line and column numbers in //line directives to 2^30-1, which
is small enough to avoid int32 overflow on all reasonbly-sized files.

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2023-24537.patch           | 76 +++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24537.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 7178739b7e..56f4f12c37 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -56,6 +56,7 @@ SRC_URI += "\
     file://CVE-2022-41722-1.patch \
     file://CVE-2022-41722-2.patch \
     file://CVE-2020-29510.patch \
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
2.34.1


