Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8771CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:26:48 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71825.1781274408100564241
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pNxNMU3x;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso16905615e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274406; x=1781879206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIiHLYimagvB4ULdeUo2gTLB7eiUG+oVMNNC9qaYqls=;
        b=pNxNMU3x8gAGdZGa1BWBRUj073rNtZGOVG+HdnUWs2gGeCvQq77tTw3ahfP+1c5BXS
         3bQMTIKdSCQlF2JMqG8e7QsHzUHKiOwdDMX7UP9MZKj0Zm4mok3CXubNvUb0SY7veit2
         fA4RSoL4Fo6T0E5B/Jq7mFpL5JJ+S6E+QQx5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274406; x=1781879206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LIiHLYimagvB4ULdeUo2gTLB7eiUG+oVMNNC9qaYqls=;
        b=Q9nmGsQ8hO1gBde7XXL+cmrzhnDcirxenE9OC/B1w9+Jk/I/vGOPc+LzK3hpW4B3af
         NfL9rYQrkTcbxtzumTAiN38fcyXFaez6/XpSQF8NjQ8KZ2rCme61pC2yBpOUE14Kk3Ze
         ubpoWlzJa2Zjjuh246uoz/g/MEwxlwT63vjDwn/0FglVohryY3JDBEpzzrrIWKZi9Ytk
         vapftDzSeeymtczTeSj3IxNN7vveH2pj8yWXjsnLbU5XkDJzDo4EVXLtK55YBJX4IXtm
         THVQ/YmAAPbBCVgueBLM6EiHOhQem3FqWZcevHvJzbq1CJ2uo0fWOTOpKrqcDDI4TfkY
         jdGg==
X-Gm-Message-State: AOJu0YwSFSW6Hh0+1rxvzTi50LKzCGdgdl9KHH1YjIRidzhLgVXBF6jq
	d1Vf6hfLJ2iy+4B1MxriK3dj528TnsTPrnwODwgb3sYIfQvEHjn7mrEvdTHu2X+YzfQz2Si7Tf+
	fgAzp1g==
X-Gm-Gg: Acq92OFWrSU84zQzKt/RmVlWie1twdwfeiEDhAUJF683UnQ0rS1FLTcyBiwVFZrwCi4
	xhZG/aK3z4JdyX6ypfUwpryDH+LYLVrTMVy4wTS99Hl7IxnN7sTBRLZ9vewI932iFMCVUpjAkqA
	nVVhii40Xr4WcDXUbmepizFnXPIn/mTedlQllPamyGIzCZW4P0VyOa5R/BLH+ap5usuVajLBG3y
	IGC7W2aM4UnvQFPPPy2j9m9E0SScTT2yjgujxdd3scbdeqdHlDiyB0ErMjT3uIwzHQizSIn8LrB
	S7K2tNxFM/XDOYD6Ps0r8S+19KYwYYDybdYTCWfiCMmtdbMvjbvZw+P6h39zsRO4EJzKG/Mp0RG
	dg9KOA9vBvPkJT8Feye3R0ZVDBM0ZldEmoDkolt20F7v3hhs53fTYl84toctjiUESGrX6HLGXXo
	jLjsLsyBS7LkK1U1kLoa9skeE=
X-Received: by 2002:a05:600c:4ca8:b0:490:b5ab:b41f with SMTP id 5b1f17b1804b1-490ea9e3753mr24690715e9.13.1781274406471;
        Fri, 12 Jun 2026 07:26:46 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:46 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 13/21] go: patch CVE-2026-39819
Date: Fri, 12 Jun 2026 16:26:03 +0200
Message-ID: <1cbe36a8bdcf6a32d7d0910f0ad2bb4dea9f7c6e.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238635

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/763882

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-39819.patch                | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39819.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index f06b974e04..dba826011b 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -47,6 +47,7 @@ SRC_URI += "\
     file://CVE-2026-32289.patch \
     file://CVE-2026-33811.patch \
     file://CVE-2026-39817.patch \
+    file://CVE-2026-39819.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-39819.patch b/meta/recipes-devtools/go/go/CVE-2026-39819.patch
new file mode 100644
index 0000000000..cb767e1320
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-39819.patch
@@ -0,0 +1,48 @@
+From db6ceacb046779c763f87060d8a1ba5c936309c9 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 8 Apr 2026 09:55:54 -0700
+Subject: [PATCH] cmd/go: use MkdirTemp to create temp directory for "go bug"
+
+Don't use a predictable, potentially attacker-controlled filename in /tmp.
+
+Fixes #78584
+Fixes CVE-2026-39819
+
+Change-Id: I72116aa6dd8fa50f65b6dc0292a15a8c6a6a6964
+Reviewed-on: https://go-review.googlesource.com/c/go/+/763882
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+
+CVE: CVE-2026-39819
+Upstream-Status: Backport [https://github.com/golang/go/commit/5d6aa23e5b6151d25955a512532383c28c745e18]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/cmd/go/internal/bug/bug.go | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/cmd/go/internal/bug/bug.go b/src/cmd/go/internal/bug/bug.go
+index ed1813605e..9bf97dd511 100644
+--- a/src/cmd/go/internal/bug/bug.go
++++ b/src/cmd/go/internal/bug/bug.go
+@@ -182,14 +182,14 @@ func firstLine(buf []byte) []byte {
+ // printGlibcVersion prints information about the glibc version.
+ // It ignores failures.
+ func printGlibcVersion(w io.Writer) {
+-	tempdir := os.TempDir()
+-	if tempdir == "" {
++	tempdir, err := os.MkdirTemp("", "")
++	if err != nil {
+ 		return
+ 	}
+ 	src := []byte(`int main() {}`)
+ 	srcfile := filepath.Join(tempdir, "go-bug.c")
+ 	outfile := filepath.Join(tempdir, "go-bug")
+-	err := os.WriteFile(srcfile, src, 0644)
++	err = os.WriteFile(srcfile, src, 0644)
+ 	if err != nil {
+ 		return
+ 	}
+-- 
+2.43.0
+
-- 
2.53.0


