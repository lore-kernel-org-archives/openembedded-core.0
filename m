Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42BEE6FE47
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:26:16 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.109025.1766525175533387630
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bG7bCk1i;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0a33d0585so50823475ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766525175; x=1767129975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H82EE5mkOWaGOxlFY5NS0B1xtLA22cTj+2tZmwcqB7c=;
        b=bG7bCk1i5igtvnb+UgClOuBIvaKPYboEgd2VY97nWIrvAy5ecR5rpGlpaigN9dkMk0
         TaDVHq9oL6c0odt0elAXW+DffSYVI0dueNc56/tryIWUHo82Ln7Kzmj2CTvBfObDbFBY
         R/DKUQCPLHQxGSQo4L8eHSCeoT1AxybZoC4MDfvKVdPgQFyZX9d6KNmFqfRPKI6XaC6Y
         Zi7+PMjEQIdWlGTn9RjqhfRnhNvRnesLvMOpWHvMqqxHv9SNE4Xj2i6n/pM4KJ3vj6W1
         q8RZYLEcBt/pf+2WL/J3WlZ64Vy7YEe0hfAtHvoDTwBqZ9/e+bpMw+lgngxiH2qyZVbk
         UEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766525175; x=1767129975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H82EE5mkOWaGOxlFY5NS0B1xtLA22cTj+2tZmwcqB7c=;
        b=xBm0eTIl5iydGE6emAGmZC65sX4LOiPdvFkS23UMKOmXgexUnJ1CkCe2UykcNeNmIJ
         vWZ88nkVBXwAlxyeCp/s1QpQEAa4vVvs2W+65QKvjOAPp2N7Tx6Hj7WVVZBgXi/F1ULU
         yFHlemiAyRjh4hVA6BEIn7m04dYtNifqoUiL40azC+M/tFmFe4x7QYHlHd00AIx+6Hyr
         3niJl2lLiqk8fnawcHVO0pDKhVvL5XgZuL5SfYbvfk/fdIY1BNgtKyjTg49tzpYQ9jyU
         cjpbgNiosSmq3QWFXHHK8mBxgIF7lvRsnaacmB0Jhp4qMJTPxSnGQfCxR63+kRhOithd
         DBvw==
X-Gm-Message-State: AOJu0YwsLJ0TRML9PlF+HB1Xg+N1u/2AEdGVQ0QK2VhcnXTMt8PtSH7U
	7cPRAsz4L+mp+Q1yWN1l0DOpJJ8vTKgwRL0oxO62ChTG3maYlZdpytdPTJFJ3pG1TmnDRQ/qt4z
	Fwc0k
X-Gm-Gg: AY/fxX54qn154PjG9n5ZVuAGBAyqV6fnhd+ADNG1PstUgGNIoxsKRm9uYb7VSgNzOjd
	FdplkSjKLgv1nJ6lQAsRcGDTZMJ7PrLtfQWoA06/umjOFr3GghPwA+kiJHEBAXpd1lM3F0JQ5iF
	oWdqEzJ16Cta39bJy643kdo4le233rBsnURljI22wH97Rc6HHEy+IOhcofG6+GqTo7baUjNjmeG
	7Xa2F/65mpCfmyVlff/t2jzE1UVFqH4/lVKpTD/jlQa4dIJyFgloJog2OFzdSWjvwu0Wnmupzgo
	DvJjgvlz5s7NxGGNyEetgbGbWZ6QiGYY4yjmRbh0EgDeMQXrPV3/yCGCPQXLALdQ1MiRkjmA9xs
	hrhy+2aW5dFhSJ4GSrR/G8aDbkfKlWyOdwfwqX1zVU0LAJHhmMzPaQEwAr6q9ddqQJkXzrFfhuB
	BcRw==
X-Google-Smtp-Source: AGHT+IGuXjckhJWaBQGmDzE6ej1dn56fmSlpAxCJEUylaSoJZE37CWLDU2XQ4S/hGt+IMmdBeJPBBw==
X-Received: by 2002:a17:903:2347:b0:295:6e0:7b0d with SMTP id d9443c01a7336-2a2f2a3fca5mr129454345ad.56.1766525174750;
        Tue, 23 Dec 2025 13:26:14 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a80esm133756765ad.8.2025.12.23.13.26.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:26:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/10] go: Fix CVE-2023-39323
Date: Tue, 23 Dec 2025 13:25:55 -0800
Message-ID: <62f4c3aec8f80a259472ce19104596d08741c101.1766525021.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766525021.git.steve@sakoman.com>
References: <cover.1766525021.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228497

From: Libo Chen <libo.chen.cn@windriver.com>

Line directives ("//line") can be used to bypass the restrictions on
"//go:cgo_" directives, allowing blocked linker and compiler flags to
be passed during compilation. This can result in unexpected execution
of arbitrary code when running "go build". The line directive requires
the absolute path of the file in which the directive lives, which makes
exploiting this issue significantly more complex.

Made below changes for Go 1.17 backport:
- drop the modifications of test codes

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-39323

Upstream-patch:
https://github.com/golang/go/commit/e7c142a19d8b3944c2f1b9ab7fd94c63d8d0c555

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.21/CVE-2023-39323.patch           | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2023-39323.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index bb5e839950..47ef84c35a 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -73,6 +73,7 @@ SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main \
            file://CVE-2025-58189.patch \
            file://CVE-2025-61723.patch \
            file://CVE-2025-61724.patch \
+           file://CVE-2023-39323.patch \
            "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2023-39323.patch b/meta/recipes-devtools/go/go-1.21/CVE-2023-39323.patch
new file mode 100644
index 0000000000..613c91706b
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2023-39323.patch
@@ -0,0 +1,55 @@
+From 5e0a62c44fbaff6443bffe67911370bc0ea25f6d Mon Sep 17 00:00:00 2001
+From: Ian Lance Taylor <iant@golang.org>
+Date: Wed, 20 Sep 2023 16:16:29 -0700
+Subject: [PATCH] cmd/compile: use absolute file name in isCgo check
+
+For #23672
+Fixes #63211
+Fixes CVE-2023-39323
+
+Change-Id: I4586a69e1b2560036afec29d53e53cf25e6c7352
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2032884
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/534158
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Ian Lance Taylor <iant@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Auto-Submit: Ian Lance Taylor <iant@google.com>
+
+Upstream-Status: Backport
+CVE: CVE-2023-39323
+
+Reference to upstream patch:
+https://github.com/golang/go/commit/e7c142a19d8b3944c2f1b9ab7fd94c63d8d0c555
+
+Backport patch to fix CVE-2023-39323 and drop the modifications of test codes.
+
+Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
+---
+ src/cmd/compile/internal/noder/noder.go | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/cmd/compile/internal/noder/noder.go b/src/cmd/compile/internal/noder/noder.go
+index 5fcad096c2..f35e065a31 100644
+--- a/src/cmd/compile/internal/noder/noder.go
++++ b/src/cmd/compile/internal/noder/noder.go
+@@ -1690,8 +1690,14 @@ func (p *noder) pragma(pos syntax.Pos, blankLine bool, text string, old syntax.P
+ // contain cgo directives, and for security reasons
+ // (primarily misuse of linker flags), other files are not.
+ // See golang.org/issue/23672.
++// Note that cmd/go ignores files whose names start with underscore,
++// so the only _cgo_ files we will see from cmd/go are generated by cgo.
++// It's easy to bypass this check by calling the compiler directly;
++// we only protect against uses by cmd/go.
+ func isCgoGeneratedFile(pos syntax.Pos) bool {
+-	return strings.HasPrefix(filepath.Base(filepath.Clean(fileh(pos.Base().Filename()))), "_cgo_")
++	// We need the absolute file, independent of //line directives,
++	// so we call pos.Base().Pos().Base().
++	return strings.HasPrefix(filepath.Base(filepath.Clean(fileh(pos.Base().Pos().Base().Filename()))), "_cgo_")
+ }
+ 
+ // safeArg reports whether arg is a "safe" command-line argument,
+-- 
+2.34.1
+
-- 
2.43.0


