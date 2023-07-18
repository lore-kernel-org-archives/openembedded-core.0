Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EBEEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 16:01:20 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.11596.1689696079980337254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 09:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ON4J6/e5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-66c729f5618so5920703b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 09:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689696079; x=1692288079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8R/WRKZG51pueBDh+3F5JQS7ywwe/Hc2MCYLI7m4r2g=;
        b=ON4J6/e5Lr56XtJCj12oX0TleXxPEsYoqFOHMGTpmHu8ulU+FT5h5ZjCcExHsJ15J2
         63M3SWLK43qKmIQb93RNenae2f39YqRS3KZWwblwNd6yRk9ok/YEV5w4bQpgYEr/QowR
         fpYFA9H0tqTIbgbVZiNcHMJmy36ZwaAPmDVpapXktCZUf/hJgDWrWv6Z5C1sM7rDu88P
         wbfRt2CVC17UobdSoP/Y+jMexWZe+6ovoHVoDJO3aChXBU8R/tX4Q3UATSO69Xd2RnKM
         d3+kTEmuVQIkv1bKTAlP49f9WGiR7fFVd5LJdIxcI9mvhjK0V5DchmnW3SpyhcDjrqIi
         htHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689696079; x=1692288079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8R/WRKZG51pueBDh+3F5JQS7ywwe/Hc2MCYLI7m4r2g=;
        b=f5vYokbe2wkRtM5KvNdn1Fwsdb4CU7Ky+SadLek3m+EyHmP/koS34Z/v5bmtwUxJqP
         vKr23YvHb4ive//tC58a0J6IAucbaikUnL6jItn3Dm2jbuclNOHycF0Jn05dpJmsoToG
         UHCjHYnHTKrbbqFGQkB2IUnF5bjc4oByM3HHkAMkT25MON1UtC5qcVStHj3eg+6auJU5
         ahBoeXs2VpGA6XfwDn/0YFoxa/pgBRXPmk9ZVRjC4yeolZCiSRGhLbGCul1Qdn881Huw
         xMlgkmULiYi2r3QjlMmetysyKyU6BUbtt6yE4WTHWIbJmV+TC4io4csN9NAjGC3Xl8eU
         7/kA==
X-Gm-Message-State: ABy/qLZjfKx5luYJBbVTB7vz+QixS3zRjyTTn5PuULprCzpk7yi8j6zR
	oY3Na0yIuIBk7WnZAJ28M9usVf/rq401tkwxli4=
X-Google-Smtp-Source: APBJJlFfsdo/t7IA4unrOfq1EQY6R5tPljcuAN+N1Xn/fyayONfjVTcKBv4b/TZOb6Esn2XUfdOVaQ==
X-Received: by 2002:a05:6a21:3297:b0:134:ecc3:8d04 with SMTP id yt23-20020a056a21329700b00134ecc38d04mr7589875pzb.9.1689696078812;
        Tue, 18 Jul 2023 09:01:18 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q17-20020a62e111000000b0064928cb5f03sm1710089pfh.69.2023.07.18.09.01.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:01:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/13] go: Fix CVE-2023-29400
Date: Tue, 18 Jul 2023 06:00:53 -1000
Message-Id: <02a0e76e04ddbbbb381202d61cbb084333336f38.1689690585.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689690585.git.steve@sakoman.com>
References: <cover.1689690585.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 16:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184539

From: Ashish Sharma <asharma@mvista.com>

emit filterFailsafe for empty unquoted attr
value

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2023-29400.patch           | 94 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29400.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index ea7b9ea80f..33b53b1a34 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -67,6 +67,7 @@ SRC_URI += "\
     file://CVE-2023-29405-2.patch \
     file://CVE-2023-29402.patch \
     file://CVE-2023-29404.patch \
+    file://CVE-2023-29400.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-29400.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-29400.patch
new file mode 100644
index 0000000000..092c7aa0ff
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-29400.patch
@@ -0,0 +1,94 @@
+From 0d347544cbca0f42b160424f6bc2458ebcc7b3fc Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Thu, 13 Apr 2023 14:01:50 -0700
+Subject: [PATCH] html/template: emit filterFailsafe for empty unquoted attr
+ value
+
+An unquoted action used as an attribute value can result in unsafe
+behavior if it is empty, as HTML normalization will result in unexpected
+attributes, and may allow attribute injection. If executing a template
+results in a empty unquoted attribute value, emit filterFailsafe
+instead.
+
+Thanks to Juho Nurminen of Mattermost for reporting this issue.
+
+Fixes #59722
+Fixes CVE-2023-29400
+
+Change-Id: Ia38d1b536ae2b4af5323a6c6d861e3c057c2570a
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1826631
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/491617
+Run-TryBot: Carlos Amedee <carlos@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+Upstream-Status: Backport from [https://github.com/golang/go/commit/0d347544cbca0f42b160424f6bc2458ebcc7b3fc]
+CVE: CVE-2023-29400
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+---
+ src/html/template/escape.go      |  5 ++---
+ src/html/template/escape_test.go | 15 +++++++++++++++
+ src/html/template/html.go        |  3 +++
+ 3 files changed, 20 insertions(+), 3 deletions(-)
+
+diff --git a/src/html/template/escape.go b/src/html/template/escape.go
+index 4ba1d6b31897e..a62ef159f0dcd 100644
+--- a/src/html/template/escape.go
++++ b/src/html/template/escape.go
+@@ -382,9 +382,8 @@ func normalizeEscFn(e string) string {
+ // for all x.
+ var redundantFuncs = map[string]map[string]bool{
+ 	"_html_template_commentescaper": {
+-		"_html_template_attrescaper":    true,
+-		"_html_template_nospaceescaper": true,
+-		"_html_template_htmlescaper":    true,
++		"_html_template_attrescaper": true,
++		"_html_template_htmlescaper": true,
+ 	},
+ 	"_html_template_cssescaper": {
+ 		"_html_template_attrescaper": true,
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index 3dd212bac9406..f8b2b448f2dfa 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -678,6 +678,21 @@ func TestEscape(t *testing.T) {
+ 			`<img srcset={{",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,"}}>`,
+ 			`<img srcset=,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,>`,
+ 		},
++		{
++			"unquoted empty attribute value (plaintext)",
++			"<p name={{.U}}>",
++			"<p name=ZgotmplZ>",
++		},
++		{
++			"unquoted empty attribute value (url)",
++			"<p href={{.U}}>",
++			"<p href=ZgotmplZ>",
++		},
++		{
++			"quoted empty attribute value",
++			"<p name=\"{{.U}}\">",
++			"<p name=\"\">",
++		},
+ 	}
+ 
+ 	for _, test := range tests {
+diff --git a/src/html/template/html.go b/src/html/template/html.go
+index bcca0b51a0ef9..a181699a5bda8 100644
+--- a/src/html/template/html.go
++++ b/src/html/template/html.go
+@@ -14,6 +14,9 @@ import (
+ // htmlNospaceEscaper escapes for inclusion in unquoted attribute values.
+ func htmlNospaceEscaper(args ...interface{}) string {
+ 	s, t := stringify(args...)
++	if s == "" {
++		return filterFailsafe
++	}
+ 	if t == contentTypeHTML {
+ 		return htmlReplacer(stripTags(s), htmlNospaceNormReplacementTable, false)
+ 	}
+
-- 
2.34.1


