Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBDEEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 11:52:57 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.14230.1687953167041755266
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 04:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=NBcW/MC4;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b7e6512973so23644575ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 04:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687953166; x=1690545166;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0PT3aScIQrrANSCNl0/HM3POZTttBpLU1bbKvZT/jc=;
        b=NBcW/MC40fOPP1CFxZy3I98+TI1wrqaMyx+D+qH96i+NrvLUZ/KXKwcz86IbL/8ZID
         6Jc0bT5YurcofGmlIQeEhwKJv5CDhOoqSOCogRS8sJPJ7Yfd0aKS0M7xARrNdEm08s1K
         mZGA6F1a/dyhFlpNaoECYT5W34wa2g7egmLi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687953166; x=1690545166;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0PT3aScIQrrANSCNl0/HM3POZTttBpLU1bbKvZT/jc=;
        b=f9ETp1u7ODNpZPw8NXmMsNdHQoCsG/HbTgtxZKjpbZ2gE0EVTZ3W+k8RB8H98Kz4Va
         g/Gf/PmJJxG1T6+QEKio/LHTCmVujAiCNFzOrMq89vsEZOHHKTQACCwquwCi5ZNvbA/X
         PBD6dOtUwOJOlDBdA9cVGUVvzvo4Ode1wNh2RniVvZ64h6/frxjqJbIx19bffMzftqel
         1MfUA4Fb7uhH0RZVfWlw1R2BXC2jUWJoExjTJ6jap3L+zYvie6CiBnW1+HplezePrm1g
         99o7yPuCmxW8rezYYg86bD8O0q6Ug6ROGkOH14Wk0/uHzjOzPX2I4sTXVRNS4SHDxtv3
         wxrQ==
X-Gm-Message-State: AC+VfDw4VppLWORmqM4usfc/tZuFI61MkqsfKrl0VawvoawK/uyVdUsp
	7hZNuD/o1j51n9aSReayEvLkdo623Wz0v2qUfuU=
X-Google-Smtp-Source: ACHHUZ72TB6vdDPA0tGCfXS6aKdQbgmu6+upE7N1Cj/m/JG08nsdBvIjSCLfbzWAKW77F+9uy+/c9g==
X-Received: by 2002:a17:902:b108:b0:1b0:6480:1788 with SMTP id q8-20020a170902b10800b001b064801788mr7196070plr.61.1687953166081;
        Wed, 28 Jun 2023 04:52:46 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.84.52])
        by smtp.gmail.com with ESMTPSA id y6-20020a1709029b8600b001b682336f66sm7534583plp.55.2023.06.28.04.52.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Jun 2023 04:52:45 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Wed, 28 Jun 2023 17:20:30 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: Backport fix CVE-2023-29405
Date: Wed, 28 Jun 2023 17:20:28 +0530
Message-Id: <20230628115028.10323-1-asharma@mvista.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 11:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183551

Upstream-Status: Backport
[https://github.com/golang/go/commit/fa60c381ed06c12f9c27a7b50ca44c5f84f7f0f4
&
https://github.com/golang/go/commit/1008486a9ff979dbd21c7466eeb6abf378f9c637]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   2 +
 .../go/go-1.14/CVE-2023-29405-1.patch         | 112 ++++++++++++++++++
 .../go/go-1.14/CVE-2023-29405-2.patch         |  38 ++++++
 3 files changed, 152 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29405-1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29405-2.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 1e0c3fab6fa..a185e0ff66e 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -67,6 +67,8 @@ SRC_URI += "\
     file://CVE-2023-24539.patch \
     file://CVE-2023-24540.patch \
     file://CVE-2023-29400.patch \
+    file://CVE-2023-29405-1.patch \
+    file://CVE-2023-29405-2.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-29405-1.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-29405-1.patch
new file mode 100644
index 00000000000..70d50cc08a4
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-29405-1.patch
@@ -0,0 +1,112 @@
+From fa60c381ed06c12f9c27a7b50ca44c5f84f7f0f4 Mon Sep 17 00:00:00 2001
+From: Ian Lance Taylor <iant@golang.org>
+Date: Thu, 4 May 2023 14:06:39 -0700
+Subject: [PATCH] [release-branch.go1.20] cmd/go,cmd/cgo: in _cgo_flags use one
+ line per flag
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
+Updates #60306
+Fixes #60514
+Fixes CVE-2023-29405
+
+Change-Id: I36b6e188a44c80d7b9573efa577c386770bd2ba3
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1875094
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+(cherry picked from commit bcdfcadd5612212089d958bc352a6f6c90742dcc)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1902228
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+TryBot-Result: Security TryBots <security-trybots@go-security-trybots.iam.gserviceaccount.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1904345
+Reviewed-by: Michael Knyszek <mknyszek@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/501220
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: David Chase <drchase@google.com>
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+---
+Upstream-Status: Backport [https://github.com/golang/go/commit/fa60c381ed06c12f9c27a7b50ca44c5f84f7f0f4]
+CVE: CVE-2023-29405
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ src/cmd/cgo/out.go                            |  4 +++-
+ src/cmd/go/internal/work/gccgo.go             | 14 ++++++-------
+ .../go/testdata/script/gccgo_link_ldflags.txt | 20 +++++++++++++++++++
+ 3 files changed, 29 insertions(+), 9 deletions(-)
+ create mode 100644 src/cmd/go/testdata/script/gccgo_link_ldflags.txt
+
+diff --git a/src/cmd/cgo/out.go b/src/cmd/cgo/out.go
+index d26f9e76a374a..d0c6fe3d4c2c2 100644
+--- a/src/cmd/cgo/out.go
++++ b/src/cmd/cgo/out.go
+@@ -47,7 +47,9 @@ func (p *Package) writeDefs() {
+ 
+ 	fflg := creat(*objDir + "_cgo_flags")
+ 	for k, v := range p.CgoFlags {
+-		fmt.Fprintf(fflg, "_CGO_%s=%s\n", k, strings.Join(v, " "))
++		for _, arg := range v {
++			fmt.Fprintf(fflg, "_CGO_%s=%s\n", arg)
++		}
+ 		if k == "LDFLAGS" && !*gccgo {
+ 			for _, arg := range v {
+ 				fmt.Fprintf(fgo2, "//go:cgo_ldflag %q\n", arg)
+diff --git a/src/cmd/go/internal/work/gccgo.go b/src/cmd/go/internal/work/gccgo.go
+index 08a4c2d8166c7..a048b7f4eecef 100644
+--- a/src/cmd/go/internal/work/gccgo.go
++++ b/src/cmd/go/internal/work/gccgo.go
+@@ -280,14 +280,12 @@ func (tools gccgoToolchain) link(b *Builder, root *Action, out, importcfg string
+ 		const ldflagsPrefix = "_CGO_LDFLAGS="
+ 		for _, line := range strings.Split(string(flags), "\n") {
+ 			if strings.HasPrefix(line, ldflagsPrefix) {
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
+ 				}
+ 			}
+ 		}
+diff --git a/src/cmd/go/testdata/script/gccgo_link_ldflags.txt b/src/cmd/go/testdata/script/gccgo_link_ldflags.txt
+new file mode 100644
+index 0000000000000..4e91ae56505b6
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
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-29405-2.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-29405-2.patch
new file mode 100644
index 00000000000..369eca581e7
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-29405-2.patch
@@ -0,0 +1,38 @@
+From 1008486a9ff979dbd21c7466eeb6abf378f9c637 Mon Sep 17 00:00:00 2001
+From: Ian Lance Taylor <iant@golang.org>
+Date: Tue, 6 Jun 2023 12:51:17 -0700
+Subject: [PATCH] [release-branch.go1.20] cmd/cgo: correct _cgo_flags output
+
+For #60306
+For #60514
+
+Change-Id: I3f5d14aee7d7195030e8872e42b1d97aa11d3582
+Reviewed-on: https://go-review.googlesource.com/c/go/+/501298
+Run-TryBot: Ian Lance Taylor <iant@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: David Chase <drchase@google.com>
+Reviewed-by: Dmitri Shuralyov <dmitshur@golang.org>
+---
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/1008486a9ff979dbd21c7466eeb6abf378f9c637]
+CVE: CVE-2023-29405
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+
+ src/cmd/cgo/out.go | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cmd/cgo/out.go b/src/cmd/cgo/out.go
+index d0c6fe3d4c2c2..a48f52105628a 100644
+--- a/src/cmd/cgo/out.go
++++ b/src/cmd/cgo/out.go
+@@ -48,7 +48,7 @@ func (p *Package) writeDefs() {
+ 	fflg := creat(*objDir + "_cgo_flags")
+ 	for k, v := range p.CgoFlags {
+ 		for _, arg := range v {
+-			fmt.Fprintf(fflg, "_CGO_%s=%s\n", arg)
++			fmt.Fprintf(fflg, "_CGO_%s=%s\n", k, arg)
+ 		}
+ 		if k == "LDFLAGS" && !*gccgo {
+ 			for _, arg := range v {
-- 
2.17.1


