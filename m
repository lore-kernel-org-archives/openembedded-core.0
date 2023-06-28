Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030F7EB64DD
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:08 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.17356.1687961583118190326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=KUCAPXcx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b7f223994fso35331285ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961582; x=1690553582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZGugfmuMzh9hw3iIRAG1HVB5kWvQxTBfomxRRr9ZAg=;
        b=KUCAPXcx3w062Xmvx6vQD+T2vE0k8QTYEMMUVCn0fKU2fD/Fud8WS6OX72Fbn2Lr/P
         9llVhEvWXdY0TJnRU/wol515LkZsSkfw6nQVuUo1LzBdnBT5K4cGw2os5aYQuyEpFKG6
         VZiZWVrUK/1jTj3K1WJJYPSxdGrBATn7fabwbZzOIEgyo2hIzvTKMe1nz6ml3GF13soo
         rAIjI7abiJJyW9ylneRrnaTiz69j2slqd4TU/ZZ29osWwrLdBnPRxxXlC5IAKiJXZ40O
         KsBtd9Ke/4CeSB1GF9NjIkvzoEClN9ufhJ5XxQc6Ho6obKpIY5KGbgqJsx9HU2ysJ2vt
         Vu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961582; x=1690553582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZGugfmuMzh9hw3iIRAG1HVB5kWvQxTBfomxRRr9ZAg=;
        b=RugNRQ81ULfA8EKrs1DY2pGnS5VVDMar9chnq2Xbc8O2Ogg75UykZDrcnWL6kX0dcK
         avb79LxrwRk5XTYmT1sNUVd8KalZkI1DgN/EM40hUL+gaNNPZ1yl74qccfQ6eMCcDRIg
         SRsx1a65pO0nlUxlGgRCDd1FSdo47q4IXPeeB/pF/uJiITKwktQir+T29zxs7+CDdgyP
         vO+/uiPRuuNdJQAf9d/kQQm9Xvu6W6N/F4/YhluNSQ9EJhGQrH91yZc80evPDtMS+woI
         u7IO6+JZJjB5tspjK5sqmULnglbFC4HGxz0K6UQR1LFaXA/GZiASVdJpHv+X+b7jNu4t
         XPZg==
X-Gm-Message-State: AC+VfDz+db5v2CUxC00iSbxb05JO8BxuidrgmDzOTvxjRmtbdmKK3+7h
	q183DNw/iBnCtxHSKeEKHJ9qa+om7o59UhihQh9v3A==
X-Google-Smtp-Source: ACHHUZ49S+sKEvrGAsKv6H+jq/byiLZeAD2gNmPfEOJMSfiN7tDgQQEh5aUhWEFBLU5ZuiufWQZoLg==
X-Received: by 2002:a17:902:ce88:b0:1b6:68bb:6ad0 with SMTP id f8-20020a170902ce8800b001b668bb6ad0mr17408301plg.55.1687961582067;
        Wed, 28 Jun 2023 07:13:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/29] go: fix CVE-2023-29404
Date: Wed, 28 Jun 2023 04:12:26 -1000
Message-Id: <3e51122f8e2b4a7cd2a1c711175e6daf59b8368b.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183556

From: Archana Polampalli <archana.polampalli@windriver.com>

The go command may execute arbitrary code at build time when using cgo.
This may occur when running "go get" on a malicious module, or when running
any other command which builds untrusted code. This is can by triggered by
linker flags, specified via a "#cgo LDFLAGS" directive. The arguments for a
number of flags which are non-optional are incorrectly considered optional,
allowing disallowed flags to be smuggled through the LDFLAGS sanitization.
This affects usage of both the gc and gccgo compilers.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-29404

Upstream patches:
https://github.com/golang/go/commit/bbeb55f5faf93659e1cfd6ab073ab3c9d126d195

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.19/CVE-2023-29404.patch           | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-29404.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index d430e0669d..2c1febfe9c 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -32,6 +32,7 @@ SRC_URI += "\
     file://CVE-2023-24538.patch \
     file://CVE-2023-24540.patch \
     file://CVE-2023-24539.patch \
+    file://CVE-2023-29404.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-29404.patch b/meta/recipes-devtools/go/go-1.19/CVE-2023-29404.patch
new file mode 100644
index 0000000000..c6beced884
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-29404.patch
@@ -0,0 +1,78 @@
+From bbeb55f5faf93659e1cfd6ab073ab3c9d126d195 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Fri, 5 May 2023 13:10:34 -0700
+Subject: [PATCH] cmd/go: enforce flags with non-optional arguments
+
+Enforce that linker flags which expect arguments get them, otherwise it
+may be possible to smuggle unexpected flags through as the linker can
+consume what looks like a flag as an argument to a preceding flag (i.e.
+"-Wl,-O -Wl,-R,-bad-flag" is interpreted as "-O=-R -bad-flag"). Also be
+somewhat more restrictive in the general format of some flags.
+
+Thanks to Juho Nurminen of Mattermost for reporting this issue.
+
+Fixes #60305
+Fixes CVE-2023-29404
+
+Change-Id: I913df78a692cee390deefc3cd7d8f5b031524fc9
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1876275
+Reviewed-by: Ian Lance Taylor <iant@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/501225
+Run-TryBot: David Chase <drchase@google.com>
+Reviewed-by: Michael Knyszek <mknyszek@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/bbeb55f5faf93659e1cfd6ab073ab3c9d126d195]
+CVE: CVE-2023-29404
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/cmd/go/internal/work/security.go      | 6 +++---
+ src/cmd/go/internal/work/security_test.go | 5 +++++
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/src/cmd/go/internal/work/security.go b/src/cmd/go/internal/work/security.go
+index e9b9f6c..91e6e4c 100644
+--- a/src/cmd/go/internal/work/security.go
++++ b/src/cmd/go/internal/work/security.go
+@@ -179,10 +179,10 @@ var validLinkerFlags = []*lazyregexp.Regexp{
+	re(`-Wl,-berok`),
+	re(`-Wl,-Bstatic`),
+	re(`-Wl,-Bsymbolic-functions`),
+-	re(`-Wl,-O([^@,\-][^,]*)?`),
++	re(`-Wl,-O[0-9]+`),
+	re(`-Wl,-d[ny]`),
+	re(`-Wl,--disable-new-dtags`),
+-	re(`-Wl,-e[=,][a-zA-Z0-9]*`),
++	re(`-Wl,-e[=,][a-zA-Z0-9]+`),
+	re(`-Wl,--enable-new-dtags`),
+	re(`-Wl,--end-group`),
+	re(`-Wl,--(no-)?export-dynamic`),
+@@ -191,7 +191,7 @@ var validLinkerFlags = []*lazyregexp.Regexp{
+	re(`-Wl,--hash-style=(sysv|gnu|both)`),
+	re(`-Wl,-headerpad_max_install_names`),
+	re(`-Wl,--no-undefined`),
+-	re(`-Wl,-R([^@\-][^,@]*$)`),
++	re(`-Wl,-R,?([^@\-,][^,@]*$)`),
+	re(`-Wl,--just-symbols[=,]([^,@\-][^,@]+)`),
+	re(`-Wl,-rpath(-link)?[=,]([^,@\-][^,]+)`),
+	re(`-Wl,-s`),
+diff --git a/src/cmd/go/internal/work/security_test.go b/src/cmd/go/internal/work/security_test.go
+index 8d4be0a..3616548 100644
+--- a/src/cmd/go/internal/work/security_test.go
++++ b/src/cmd/go/internal/work/security_test.go
+@@ -227,6 +227,11 @@ var badLinkerFlags = [][]string{
+	{"-Wl,-R,@foo"},
+	{"-Wl,--just-symbols,@foo"},
+	{"../x.o"},
++	{"-Wl,-R,"},
++	{"-Wl,-O"},
++	{"-Wl,-e="},
++	{"-Wl,-e,"},
++	{"-Wl,-R,-flag"},
+ }
+
+ func TestCheckLinkerFlags(t *testing.T) {
+--
+2.40.0
-- 
2.34.1


