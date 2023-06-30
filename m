Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F66EB64DD
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:33:44 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.3937.1688092417375616228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0MMTNz94;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3a0423ea74eso1005287b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092416; x=1690684416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mevffEeB54poFSMTH1VSA3tQlUqvFElwE4Ps2ncRGo=;
        b=0MMTNz94xgCD6tu1eJPqWu0w7TwG+qAXOl0xPrt93QHjDT8ra6E9oSDS3jEXm/rg85
         06YcdfoOEmt83Mf3Pd8Spr8/Byh1zFSC57/kkZT1pxjDjrn/ApxVbXzAfzKbeQ6Zpw7F
         oFxiP1MA1F073V6VsLZC7LDdRVP7eAcV3bmVpNisUIjwasWUBqWZiFfuJ5U1vlozhr8s
         bE8QOw1VAT6NYLwOBNtzkD+e6PuP0K/eJsorJvJ2G/bHdHFvyRuotiIOfn0iAXHgNgNg
         7YWrpqkSnvHOLrr1ighTa02EbitoVabbLP/sNIp/X/PcrnKq/Fj2a/X0dcSHsZs/pRnQ
         ermg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092416; x=1690684416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mevffEeB54poFSMTH1VSA3tQlUqvFElwE4Ps2ncRGo=;
        b=hbHcvD+QiSJS2/fZTlfPpUnt8NBtIHU9H1VeahLICWmEhvw8RvPOiGo/tAG7m8UEu4
         ukQQJNIXt5v36dY/Ybm6O/m2uCpzxx8F+Pgi2hL4Xp0kXCQa8QmZaboCTj3b1d1s3rP7
         RI3pWHBpR29A8m12aqfx54sqirtHTX5RI4gErRjadr50WEMzG3S8qimBcgdC4VFigOKs
         9sZAed7BcyqONajAOsEFFC5rl4NbUty7gARUq0xQVGudEflV8TzXz8zzIlfpBnLIZ6TO
         UmwoQQIi4hSVKxs7Uf/zncNSUfih+Y63pi0poi+dHztnQx5gJYEg4IfN10Xy20fFRD2k
         Rwjw==
X-Gm-Message-State: AC+VfDzpejQ/VgLizZf581F7cjcFkIFf/x0rgtwxC9koo11v9VHsy9/v
	rFe47wTivr2FmBNJrDpFMJaUwx8uwkl3gMMq5C73nA==
X-Google-Smtp-Source: ACHHUZ6UAgts17zsxZEx5kG7NwDm58eeZ9ozf+Mw6CBBfM6OWIuKkaG0STnl/jldhyam+RirJ04EVQ==
X-Received: by 2002:a05:6808:1645:b0:3a3:7978:32ec with SMTP id az5-20020a056808164500b003a3797832ecmr1333444oib.1.1688092416199;
        Thu, 29 Jun 2023 19:33:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id l22-20020a62be16000000b006815fbe3245sm3028607pff.37.2023.06.29.19.33.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:33:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/10] go: Backport fix CVE-2023-29405
Date: Thu, 29 Jun 2023 16:33:16 -1000
Message-Id: <ce213403b4e82f1b191fed4ef6494e9dee55c4f8.1688092252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092252.git.steve@sakoman.com>
References: <cover.1688092252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183674

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport
[https://github.com/golang/go/commit/fa60c381ed06c12f9c27a7b50ca44c5f84f7f0f4
&
https://github.com/golang/go/commit/1008486a9ff979dbd21c7466eeb6abf378f9c637]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   2 +
 .../go/go-1.14/CVE-2023-29405-1.patch         | 112 ++++++++++++++++++
 .../go/go-1.14/CVE-2023-29405-2.patch         |  38 ++++++
 3 files changed, 152 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29405-1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29405-2.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 2c500e8331..ed505c01b3 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -63,6 +63,8 @@ SRC_URI += "\
     file://CVE-2023-24538-3.patch \
     file://CVE-2023-24539.patch \
     file://CVE-2023-24540.patch \
+    file://CVE-2023-29405-1.patch \
+    file://CVE-2023-29405-2.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-29405-1.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-29405-1.patch
new file mode 100644
index 0000000000..70d50cc08a
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
index 0000000000..369eca581e
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
2.34.1


