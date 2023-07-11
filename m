Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6683EEB64DD
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 08:10:38 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.2815.1689063026595605991
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 01:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=colG7h73;
 spf=pass (domain: mvista.com, ip: 209.85.161.41, mailfrom: asharma@mvista.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-565f3881cbeso4179543eaf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 01:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1689063025; x=1691655025;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZbZrhxfXG0TtQU5P5tHRjiySZ13+9YvZZoP438Ohkw=;
        b=colG7h73uqSS1zmh7ljdzu2DwBUNdGeYQqgH88xT4rrW/XBx9y8jaPtM4BxGaOkIRs
         hxMofkuU9K1YZIeDtguKDNIr1hK4guZyuGkuM0qSxSsf2q+2qVEXk3xK/0Gng4g74q0g
         SB0R5Zi3Ukvmx0xaPFIjbKt+z44g45j8bvinI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689063025; x=1691655025;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZbZrhxfXG0TtQU5P5tHRjiySZ13+9YvZZoP438Ohkw=;
        b=e7jXF/n1yQ2GxmB4JQdFEenqeuhtloJWlgsguLy7j2s4BXQEffzUuk0+meRw/TOBL4
         ulpT7n/e4vlfJ0Ht/eC0NnvoGKwWLxaZ7DrpaZIxbp3V9H4yh4ZoQ11NULROYUJZW3ZT
         ig/godWKiKpjk2ol+aucCwdxQtjkjqx8H0xPHd/DNQFizU2Bh2+CYfCAqMGBgB+l1FAA
         U2M2+j13wxNuBoKfoNzDv2eqWNAGahxRlfPg2EoEKgbpWRoObDXlhFDUwiQIbI2FLEZm
         1jjTzhUbxKMn8rBQDYiff/uO7BCxswOjP16SBnllirPrZvEOxa7rTTiS0tcLvNHn3mwY
         SDAA==
X-Gm-Message-State: ABy/qLay99s2/KuOWcMt9Hnb+uNjXl47CLe+E4NrCbqMrGOFCXPougDT
	E2qlfSZTm2b+wqZ0O+sUHL2zFsnQg0/AOwufy2w=
X-Google-Smtp-Source: APBJJlFMpI5eH3AJIaLk+n3OD2nU0XS1tnxs0Mf4z6H+gWkdIDD/xZXFIoCu9hb+QQbn33gcmssq4A==
X-Received: by 2002:a05:6358:9910:b0:134:ddad:2b4f with SMTP id w16-20020a056358991000b00134ddad2b4fmr14699353rwa.18.1689063025248;
        Tue, 11 Jul 2023 01:10:25 -0700 (PDT)
Received: from asharma-Latitude-3400 ([2401:4900:1c31:670c:91a3:a60d:d381:7b30])
        by smtp.gmail.com with ESMTPSA id i4-20020a63a844000000b00530621e5ee4sm1002341pgp.9.2023.07.11.01.10.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jul 2023 01:10:24 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 11 Jul 2023 13:40:19 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH v2] go: Fix CVE-2023-29400
Date: Tue, 11 Jul 2023 13:40:18 +0530
Message-Id: <20230711081018.4782-1-asharma@mvista.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 08:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184121

emit filterFailsafe for empty unquoted attr
value

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2023-29400.patch           | 94 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29400.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 04787ba69f..023cc653b5 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -70,6 +70,7 @@ SRC_URI += "\
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
2.17.1


