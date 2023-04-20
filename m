Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0AFC77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 09:31:47 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.3917.1681983102209158036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 02:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=HiBeg+4A;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1a66b9bd7dfso9811865ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 02:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1681983101; x=1684575101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aZAO3CkL72TuXwOnxY85m7xjnu3AmCqRjyVDmeJyZ8w=;
        b=HiBeg+4AcAVp02iEHF0Ikah5uhF8GsfVA7cZ/gb1CMlDY3NzhUDbdPhobgA6U0S2lC
         GG7lG9K0D4hsEhRm0qc/ST1EtvRkIe9VJqjZXOWmriiqYOWhHNtabYs4i2i/4juGEt3V
         OhBgCg9ioEudhaCVrwoNmJpjC6yrfQvotm+k4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681983101; x=1684575101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZAO3CkL72TuXwOnxY85m7xjnu3AmCqRjyVDmeJyZ8w=;
        b=OOUQ+UgYWKbyBnYIuulVgSuO4DIEeB0CfFGK6eB0jP+aJRk7AG7lKfdPTiNd+OaeYz
         +rEqQ9iIAHGn2OF3BaAqeth3eXMu9GSbLDuzVpcS++o1WUftuIZ01G1LMVatb6y62Hgb
         vXg8O0DgER8f1OAAWdMBGFO0IBYI0qSXBghDUfhntkheZ1erSJ2hcCq01bSSZQjDGG7W
         U3mAUCyNym4n8sQBGVLx7EYYcqMr3PFajOz6sSKpyfH17NGo2DZm0jB/8m/ToAk490Ue
         CQc6g+b0yl1t8erME7w1bD4xp0ymTmtcbQfn8XgGCUTSdNNBKxFBBsULUt2bcynSxNe6
         tzUQ==
X-Gm-Message-State: AAQBX9eXAqSQWaCIaiijxJzrPoHeZ6HmN+uuVj219yx0kpEURRlcMiIy
	y04Oo6PqWwRFGbxnmBkXyCW3xuBIGmDNmkPIsR4=
X-Google-Smtp-Source: AKy350Z2ybw7YW44Dx9V5xEvir3r+vMPsfysk93jmdhqbpLoGPhAUo/GuZJDV8akubytqSawioJUVg==
X-Received: by 2002:a17:902:e883:b0:1a6:bb7b:7a68 with SMTP id w3-20020a170902e88300b001a6bb7b7a68mr1182913plg.37.1681983101202;
        Thu, 20 Apr 2023 02:31:41 -0700 (PDT)
Received: from localhost.localdomain ([116.74.134.63])
        by smtp.gmail.com with ESMTPSA id jj21-20020a170903049500b001a69e002c7esm793093plb.178.2023.04.20.02.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 02:31:40 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] go: fix CVE-2023-24537 Infinite loop in parsing
Date: Thu, 20 Apr 2023 15:01:28 +0530
Message-Id: <20230420093128.1209660-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 09:31:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180243

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
 .../go/go-1.18/CVE-2023-24537.patch           | 72 +++++++++++++++++++
 2 files changed, 73 insertions(+)
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
index 0000000000..7733a605e7
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-24537.patch
@@ -0,0 +1,72 @@
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
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+Upstream-Status: Backport [https://github.com/golang/go/commit/126a1d02da82f93ede7ce0bd8d3c51ef627f2104]
+CVE: CVE-2023-24537
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/go/parser/parser_test.go | 16 ++++++++++++++++
+ src/go/scanner/scanner.go    |  7 +++++--
+ 2 files changed, 21 insertions(+), 2 deletions(-)
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
+index f08e28c..2276e07 100644
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
-- 
2.25.1


