Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DECEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:07 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.17560.1687961585112138182
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=aORjMQlW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b8171718a1so18902515ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961584; x=1690553584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=is7Rdi+ks0N1IwBQzff26eadxBGmKiQE56im/aUWyms=;
        b=aORjMQlW5PsnGMjqijipDHDFNlgVxZmy/XKoopnshYOOF1Hk/agsywt4gAwyKz9+aO
         Tn4zOnJbMtwkeNj4g3P+GA7qErn011r6PqhmSAje9eIXrZ533PD68qOiZj7sKwDWOZvK
         jblf8q4ReocnGoVAjqmKzmSgoi3/iWgtrf7l8rn2h1vmN6oZirHxmxiW3XVbLOVe/5Xg
         dHKQWMZjw3gajoRE9Rbsa4bmmCV01tSmq4kyoYj4FpjRL5smfi44a3ht8168f6CSoxUr
         ktn1MSMlIdAVpahucYRM7064sQPa+fXvG22hZbrhU37dcTv+wWrx4n/MxrBknVyzOIxz
         TSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961584; x=1690553584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=is7Rdi+ks0N1IwBQzff26eadxBGmKiQE56im/aUWyms=;
        b=HjsZdq3A59I+PkCOpQTR5TDFX4Q6J5waWyZqq3WrpzP3Ea+PPsI8+0F1n2sVSrGQxt
         c4V4bd9EJJ+un/p6lsJhDijCvKdsUq88HZ2Nva7lMFR6kckinIcWQM44syqoItSL8Iag
         peNOElFqGBFD3H7zsV/Dp8k2uoPvqoPiprCAolCp0iK8M9q4bjo0iXx0Rgrr+6M3PsU9
         XcwxvslajjQJapUDRZ80Ejv17InKDyzPl4/KFCaACijjN9/tcWSZMvZsoJRWlJuQggvC
         ffoouO67XzptCG0V0pOuUvqMMnFVdhxZQ8+0pCWihDXP7vxAk3q3hMuah5nV+NKQ+Y8V
         PRCA==
X-Gm-Message-State: AC+VfDzfBBPnJiKSD7vsrBfx4SVBafwE34s9dlI23CFkwA1g0hbsZwHp
	0lDxrOIwNjQ5JQ/oviMtrGxCogRXwyZnxeTwkZjStw==
X-Google-Smtp-Source: ACHHUZ5WZPg+HywVoUeifqkuq4LVYB9zQexmwtv7FwpTTKWtOT0NtyIkukjciB4V1BQhE+ZklPSbAw==
X-Received: by 2002:a17:902:ecc5:b0:1b7:f98d:5567 with SMTP id a5-20020a170902ecc500b001b7f98d5567mr11598402plh.68.1687961583896;
        Wed, 28 Jun 2023 07:13:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/29] go: fix CVE-2023-29405
Date: Wed, 28 Jun 2023 04:12:27 -1000
Message-Id: <7ce6d0029effc06cff500271a124150f1a7db7b3.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183557

From: Archana Polampalli <archana.polampalli@windriver.com>

The go command may execute arbitrary code at build time when using cgo.
This may occur when running "go get" on a malicious module, or when running
any other command which builds untrusted code. This is can by triggered by
linker flags, specified via a "#cgo LDFLAGS" directive. Flags containing
embedded spaces are mishandled, allowing disallowed flags to be smuggled
through the LDFLAGS sanitization by including them in the argument of
another flag. This only affects usage of the gccgo compiler.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-29405

Upstream patches:
https://github.com/golang/go/commit/6d8af00a630aa51134e54f0f321658621c6410f0

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.19/CVE-2023-29405.patch           | 109 ++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-29405.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 2c1febfe9c..9af9eb2752 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -33,6 +33,7 @@ SRC_URI += "\
     file://CVE-2023-24540.patch \
     file://CVE-2023-24539.patch \
     file://CVE-2023-29404.patch \
+    file://CVE-2023-29405.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-29405.patch b/meta/recipes-devtools/go/go-1.19/CVE-2023-29405.patch
new file mode 100644
index 0000000000..d806e1e67d
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-29405.patch
@@ -0,0 +1,109 @@
+From 6d8af00a630aa51134e54f0f321658621c6410f0 Mon Sep 17 00:00:00 2001
+From: Ian Lance Taylor <iant@golang.org>
+Date: Thu, 4 May 2023 14:06:39 -0700
+Subject: [PATCH] cmd/go,cmd/cgo: in _cgo_flags use one line per flag
+
+The flags that we recorded in _cgo_flags did not use any quoting,
+so a flag containing embedded spaces was mishandled.
+Change the _cgo_flags format to put each flag on a separate line.
+That is a simple format that does not require any quoting.
+
+As far as I can tell only cmd/go uses _cgo_flags, and it is only
+used for gccgo. If this patch doesn't cause any trouble, then
+in the next release we can change to only using _cgo_flags for gccgo.
+
+Thanks to Juho Nurminen of Mattermost for reporting this issue.
+
+Fixes #60306
+Fixes CVE-2023-29405
+
+Change-Id: I81fb5337db8a22e1f4daca22ceff4b79b96d0b4f
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1875094
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/501224
+Reviewed-by: Ian Lance Taylor <iant@google.com>
+Run-TryBot: David Chase <drchase@google.com>
+Reviewed-by: Michael Knyszek <mknyszek@google.com>
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/6d8af00a630aa51134e54f0f321658621c6410f0]
+CVE: CVE-2023-29405
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/cmd/cgo/out.go                            |  4 +++-
+ src/cmd/go/internal/work/gccgo.go             | 14 ++++++-------
+ .../go/testdata/script/gccgo_link_ldflags.txt | 20 +++++++++++++++++++
+ 3 files changed, 29 insertions(+), 9 deletions(-)
+ create mode 100644 src/cmd/go/testdata/script/gccgo_link_ldflags.txt
+
+diff --git a/src/cmd/cgo/out.go b/src/cmd/cgo/out.go
+index 94152f4..62e6528 100644
+--- a/src/cmd/cgo/out.go
++++ b/src/cmd/cgo/out.go
+@@ -47,7 +47,9 @@ func (p *Package) writeDefs() {
+
+	fflg := creat(*objDir + "_cgo_flags")
+	for k, v := range p.CgoFlags {
+-		fmt.Fprintf(fflg, "_CGO_%s=%s\n", k, strings.Join(v, " "))
++		for _, arg := range v {
++			fmt.Fprintf(fflg, "_CGO_%s=%s\n", k, arg)
++		}
+		if k == "LDFLAGS" && !*gccgo {
+			for _, arg := range v {
+				fmt.Fprintf(fgo2, "//go:cgo_ldflag %q\n", arg)
+diff --git a/src/cmd/go/internal/work/gccgo.go b/src/cmd/go/internal/work/gccgo.go
+index 1499536..bb4be2f 100644
+--- a/src/cmd/go/internal/work/gccgo.go
++++ b/src/cmd/go/internal/work/gccgo.go
+@@ -283,14 +283,12 @@ func (tools gccgoToolchain) link(b *Builder, root *Action, out, importcfg string
+		const ldflagsPrefix = "_CGO_LDFLAGS="
+		for _, line := range strings.Split(string(flags), "\n") {
+			if strings.HasPrefix(line, ldflagsPrefix) {
+-				newFlags := strings.Fields(line[len(ldflagsPrefix):])
+-				for _, flag := range newFlags {
+-					// Every _cgo_flags file has -g and -O2 in _CGO_LDFLAGS
+-					// but they don't mean anything to the linker so filter
+-					// them out.
+-					if flag != "-g" && !strings.HasPrefix(flag, "-O") {
+-						cgoldflags = append(cgoldflags, flag)
+-					}
++				flag := line[len(ldflagsPrefix):]
++				// Every _cgo_flags file has -g and -O2 in _CGO_LDFLAGS
++				// but they don't mean anything to the linker so filter
++				// them out.
++				if flag != "-g" && !strings.HasPrefix(flag, "-O") {
++					cgoldflags = append(cgoldflags, flag)
+				}
+			}
+		}
+diff --git a/src/cmd/go/testdata/script/gccgo_link_ldflags.txt b/src/cmd/go/testdata/script/gccgo_link_ldflags.txt
+new file mode 100644
+index 0000000..4e91ae5
+--- /dev/null
++++ b/src/cmd/go/testdata/script/gccgo_link_ldflags.txt
+@@ -0,0 +1,20 @@
++# Test that #cgo LDFLAGS are properly quoted.
++# The #cgo LDFLAGS below should pass a string with spaces to -L,
++# as though searching a directory with a space in its name.
++# It should not pass --nosuchoption to the external linker.
++
++[!cgo] skip
++
++go build
++
++[!exec:gccgo] skip
++
++go build -compiler gccgo
++
++-- go.mod --
++module m
++-- cgo.go --
++package main
++// #cgo LDFLAGS: -L "./ -Wl,--nosuchoption"
++import "C"
++func main() {}
+--
+2.40.0
-- 
2.34.1


