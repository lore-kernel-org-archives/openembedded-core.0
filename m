Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217A4CD8C8F
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 14:14:50 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.92772.1696947281997775619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 07:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3GbPgej8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c7373cff01so49476025ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 07:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696947281; x=1697552081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ae4ZrMsgqNWR5rYYpGiGL68KiwyiyLcAQ/bW7g8nFoA=;
        b=3GbPgej8LfVxxXJ7d6CBN4o494ZaE2XpuVTlzUAdC3c5yp5yKwwITZ38f6kVbuN9GQ
         5SHOSwWJQyUIhZI2ZnHwWI6DKR4PniBid0P+/1pk/sPcl6rQWO9aDL/28oGeLJXMSGW6
         Sy+ztpDDZrXcP9lVgTPeh5ck0r3dfi/2tbHgLrRErqpAB9E1OqoshB0qmHBp0yPQ6sQ5
         wQ6iOSMZa1ZI6lxI4XTJ4RpdWrawwaNsU8OMysMO90tdix8zlLm57A5TMnyl49rdOoxV
         HsP5xIzE2SI5asDa6MfsJxjhOWeSM46fNyNh5GauvQyZGhyAyTBLdtaFsyp9M4iUqaKh
         VfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696947281; x=1697552081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ae4ZrMsgqNWR5rYYpGiGL68KiwyiyLcAQ/bW7g8nFoA=;
        b=fvaacllFb6tF4/KZrDaraDzZVpHv3By4xw3eGIjIwrUTEp3sznj1HhX1bw7RLHnA2+
         r0ECU3x+tc11nvHhmN987SzZEwRXxWZZRmDqcafrGqmiG7WYvHItQ088TzfB6mv1Z930
         R+lGhakCc4KX7DpBU/sv+vvS1y1MBaibTgNf15SQvFTRaHn5WCKW1KXPdbO3+MBlOe8b
         D6NcSCyiww+2ld+UGaddstb2y9yjJRSztzJ4zpuQzZI+mH9MHKti86aUeASzU4SG53BA
         rnw9DzC3GGEZE4P45zzO1Kc5Ecqh0DGoF/JFOQbV6QJYWM/CiAuTbhRjfzralKN7uo0l
         HoTQ==
X-Gm-Message-State: AOJu0Yyausj4nOPH4kURqdg3e2m+ObHzkBuq7yWtdUEtGnjzSOa76Vq0
	N0IdxzLGsji9AnxI9z9wUbQZltX9Gktm1hubs2w=
X-Google-Smtp-Source: AGHT+IFIYGzfR+7U7e6q7T+tf4LLp27KliVD9A18r4qOK7oDJFqG9No6QUFrWEK3Ws4BL6+66oEWEg==
X-Received: by 2002:a17:902:e884:b0:1c7:36ff:1feb with SMTP id w4-20020a170902e88400b001c736ff1febmr23220675plg.17.1696947278962;
        Tue, 10 Oct 2023 07:14:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902d50800b001b81a97860asm11737610plg.27.2023.10.10.07.14.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 07:14:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/11] go: Update fix for CVE-2023-24538 & CVE-2023-39318
Date: Tue, 10 Oct 2023 04:14:20 -1000
Message-Id: <cc6f7a8e8805058aababb65e10da7ed2e3d77461.1696946306.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696946306.git.steve@sakoman.com>
References: <cover.1696946306.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 14:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188902

From: Shubham Kulkarni <skulkarni@mvista.com>

Add missing files in fix for CVE-2023-24538 & CVE-2023-39318

Upstream Link -
CVE-2023-24538: https://github.com/golang/go/commit/b1e3ecfa06b67014429a197ec5e134ce4303ad9b
CVE-2023-39318: https://github.com/golang/go/commit/023b542edf38e2a1f87fcefb9f75ff2f99401b4c

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   5 +-
 .../go/go-1.14/CVE-2023-24538-1.patch         |   4 +-
 .../go/go-1.14/CVE-2023-24538-2.patch         | 447 ++++++++++++-
 .../go/go-1.14/CVE-2023-24538_3.patch         | 393 ++++++++++++
 .../go/go-1.14/CVE-2023-24538_4.patch         | 497 +++++++++++++++
 .../go/go-1.14/CVE-2023-24538_5.patch         | 585 ++++++++++++++++++
 ...3-24538-3.patch => CVE-2023-24538_6.patch} | 175 +++++-
 .../go/go-1.14/CVE-2023-39318.patch           |  38 +-
 8 files changed, 2124 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch
 rename meta/recipes-devtools/go/go-1.14/{CVE-2023-24538-3.patch => CVE-2023-24538_6.patch} (53%)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index be63f64825..091b778de8 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -60,7 +60,10 @@ SRC_URI += "\
     file://CVE-2023-24534.patch \
     file://CVE-2023-24538-1.patch \
     file://CVE-2023-24538-2.patch \
-    file://CVE-2023-24538-3.patch \
+    file://CVE-2023-24538_3.patch \
+    file://CVE-2023-24538_4.patch \
+    file://CVE-2023-24538_5.patch \
+    file://CVE-2023-24538_6.patch \
     file://CVE-2023-24539.patch \
     file://CVE-2023-24540.patch \
     file://CVE-2023-29405-1.patch \
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
index eda26e5ff6..23c5075e41 100644
--- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
@@ -1,7 +1,7 @@
 From 8acd01094d9ee17f6e763a61e49a8a808b3a9ddb Mon Sep 17 00:00:00 2001
 From: Brad Fitzpatrick <bradfitz@golang.org>
 Date: Mon, 2 Aug 2021 14:55:51 -0700
-Subject: [PATCH 1/3] net/netip: add new IP address package
+Subject: [PATCH 1/6] net/netip: add new IP address package
 
 Co-authored-by: Alex Willmer <alex@moreati.org.uk> (GitHub @moreati)
 Co-authored-by: Alexander Yastrebov <yastrebov.alex@gmail.com>
@@ -31,7 +31,7 @@ Trust: Brad Fitzpatrick <bradfitz@golang.org>
 
 Dependency Patch #1
 
-Upstream-Status: Backport [https://github.com/golang/go/commit/a59e33224e42d60a97fa720a45e1b74eb6aaa3d0]
+Upstream-Status: Backport from https://github.com/golang/go/commit/a59e33224e42d60a97fa720a45e1b74eb6aaa3d0
 CVE: CVE-2023-24538
 Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
 ---
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
index 5036f2890b..f200c41e16 100644
--- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
@@ -1,7 +1,7 @@
 From 6fc21505614f36178df0dad7034b6b8e3f7588d5 Mon Sep 17 00:00:00 2001
 From: empijei <robclap8@gmail.com>
 Date: Fri, 27 Mar 2020 19:27:55 +0100
-Subject: [PATCH 2/3] html/template,text/template: switch to Unicode escapes
+Subject: [PATCH 2/6] html/template,text/template: switch to Unicode escapes
  for JSON compatibility
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -31,10 +31,238 @@ Upstream-Status: Backport from https://github.com/golang/go/commit/d4d298040d072
 CVE: CVE-2023-24538
 Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
 ---
- src/html/template/js.go    | 70 +++++++++++++++++++++++++++-------------------
- src/text/template/funcs.go |  8 +++---
- 2 files changed, 46 insertions(+), 32 deletions(-)
+ src/html/template/content_test.go  | 70 +++++++++++++++++++-------------------
+ src/html/template/escape_test.go   |  6 ++--
+ src/html/template/example_test.go  |  6 ++--
+ src/html/template/js.go            | 70 +++++++++++++++++++++++---------------
+ src/html/template/js_test.go       | 68 ++++++++++++++++++------------------
+ src/html/template/template_test.go | 39 +++++++++++++++++++++
+ src/text/template/exec_test.go     |  6 ++--
+ src/text/template/funcs.go         |  8 ++---
+ 8 files changed, 163 insertions(+), 110 deletions(-)
 
+diff --git a/src/html/template/content_test.go b/src/html/template/content_test.go
+index 72d56f5..bd86527 100644
+--- a/src/html/template/content_test.go
++++ b/src/html/template/content_test.go
+@@ -18,7 +18,7 @@ func TestTypedContent(t *testing.T) {
+		HTML(`Hello, <b>World</b> &amp;tc!`),
+		HTMLAttr(` dir="ltr"`),
+		JS(`c && alert("Hello, World!");`),
+-		JSStr(`Hello, World & O'Reilly\x21`),
++		JSStr(`Hello, World & O'Reilly\u0021`),
+		URL(`greeting=H%69,&addressee=(World)`),
+		Srcset(`greeting=H%69,&addressee=(World) 2x, https://golang.org/favicon.ico 500.5w`),
+		URL(`,foo/,`),
+@@ -70,7 +70,7 @@ func TestTypedContent(t *testing.T) {
+				`Hello, <b>World</b> &amp;tc!`,
+				` dir=&#34;ltr&#34;`,
+				`c &amp;&amp; alert(&#34;Hello, World!&#34;);`,
+-				`Hello, World &amp; O&#39;Reilly\x21`,
++				`Hello, World &amp; O&#39;Reilly\u0021`,
+				`greeting=H%69,&amp;addressee=(World)`,
+				`greeting=H%69,&amp;addressee=(World) 2x, https://golang.org/favicon.ico 500.5w`,
+				`,foo/,`,
+@@ -100,7 +100,7 @@ func TestTypedContent(t *testing.T) {
+				`Hello,&#32;World&#32;&amp;tc!`,
+				`&#32;dir&#61;&#34;ltr&#34;`,
+				`c&#32;&amp;&amp;&#32;alert(&#34;Hello,&#32;World!&#34;);`,
+-				`Hello,&#32;World&#32;&amp;&#32;O&#39;Reilly\x21`,
++				`Hello,&#32;World&#32;&amp;&#32;O&#39;Reilly\u0021`,
+				`greeting&#61;H%69,&amp;addressee&#61;(World)`,
+				`greeting&#61;H%69,&amp;addressee&#61;(World)&#32;2x,&#32;https://golang.org/favicon.ico&#32;500.5w`,
+				`,foo/,`,
+@@ -115,7 +115,7 @@ func TestTypedContent(t *testing.T) {
+				`Hello, World &amp;tc!`,
+				` dir=&#34;ltr&#34;`,
+				`c &amp;&amp; alert(&#34;Hello, World!&#34;);`,
+-				`Hello, World &amp; O&#39;Reilly\x21`,
++				`Hello, World &amp; O&#39;Reilly\u0021`,
+				`greeting=H%69,&amp;addressee=(World)`,
+				`greeting=H%69,&amp;addressee=(World) 2x, https://golang.org/favicon.ico 500.5w`,
+				`,foo/,`,
+@@ -130,7 +130,7 @@ func TestTypedContent(t *testing.T) {
+				`Hello, &lt;b&gt;World&lt;/b&gt; &amp;tc!`,
+				` dir=&#34;ltr&#34;`,
+				`c &amp;&amp; alert(&#34;Hello, World!&#34;);`,
+-				`Hello, World &amp; O&#39;Reilly\x21`,
++				`Hello, World &amp; O&#39;Reilly\u0021`,
+				`greeting=H%69,&amp;addressee=(World)`,
+				`greeting=H%69,&amp;addressee=(World) 2x, https://golang.org/favicon.ico 500.5w`,
+				`,foo/,`,
+@@ -146,7 +146,7 @@ func TestTypedContent(t *testing.T) {
+				// Not escaped.
+				`c && alert("Hello, World!");`,
+				// Escape sequence not over-escaped.
+-				`"Hello, World & O'Reilly\x21"`,
++				`"Hello, World & O'Reilly\u0021"`,
+				`"greeting=H%69,\u0026addressee=(World)"`,
+				`"greeting=H%69,\u0026addressee=(World) 2x, https://golang.org/favicon.ico 500.5w"`,
+				`",foo/,"`,
+@@ -162,7 +162,7 @@ func TestTypedContent(t *testing.T) {
+				// Not JS escaped but HTML escaped.
+				`c &amp;&amp; alert(&#34;Hello, World!&#34;);`,
+				// Escape sequence not over-escaped.
+-				`&#34;Hello, World &amp; O&#39;Reilly\x21&#34;`,
++				`&#34;Hello, World &amp; O&#39;Reilly\u0021&#34;`,
+				`&#34;greeting=H%69,\u0026addressee=(World)&#34;`,
+				`&#34;greeting=H%69,\u0026addressee=(World) 2x, https://golang.org/favicon.ico 500.5w&#34;`,
+				`&#34;,foo/,&#34;`,
+@@ -171,30 +171,30 @@ func TestTypedContent(t *testing.T) {
+		{
+			`<script>alert("{{.}}")</script>`,
+			[]string{
+-				`\x3cb\x3e \x22foo%\x22 O\x27Reilly \x26bar;`,
+-				`a[href =~ \x22\/\/example.com\x22]#foo`,
+-				`Hello, \x3cb\x3eWorld\x3c\/b\x3e \x26amp;tc!`,
+-				` dir=\x22ltr\x22`,
+-				`c \x26\x26 alert(\x22Hello, World!\x22);`,
++				`\u003cb\u003e \u0022foo%\u0022 O\u0027Reilly \u0026bar;`,
++				`a[href =~ \u0022\/\/example.com\u0022]#foo`,
++				`Hello, \u003cb\u003eWorld\u003c\/b\u003e \u0026amp;tc!`,
++				` dir=\u0022ltr\u0022`,
++				`c \u0026\u0026 alert(\u0022Hello, World!\u0022);`,
+				// Escape sequence not over-escaped.
+-				`Hello, World \x26 O\x27Reilly\x21`,
+-				`greeting=H%69,\x26addressee=(World)`,
+-				`greeting=H%69,\x26addressee=(World) 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
++				`Hello, World \u0026 O\u0027Reilly\u0021`,
++				`greeting=H%69,\u0026addressee=(World)`,
++				`greeting=H%69,\u0026addressee=(World) 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
+				`,foo\/,`,
+			},
+		},
+		{
+			`<script type="text/javascript">alert("{{.}}")</script>`,
+			[]string{
+-				`\x3cb\x3e \x22foo%\x22 O\x27Reilly \x26bar;`,
+-				`a[href =~ \x22\/\/example.com\x22]#foo`,
+-				`Hello, \x3cb\x3eWorld\x3c\/b\x3e \x26amp;tc!`,
+-				` dir=\x22ltr\x22`,
+-				`c \x26\x26 alert(\x22Hello, World!\x22);`,
++				`\u003cb\u003e \u0022foo%\u0022 O\u0027Reilly \u0026bar;`,
++				`a[href =~ \u0022\/\/example.com\u0022]#foo`,
++				`Hello, \u003cb\u003eWorld\u003c\/b\u003e \u0026amp;tc!`,
++				` dir=\u0022ltr\u0022`,
++				`c \u0026\u0026 alert(\u0022Hello, World!\u0022);`,
+				// Escape sequence not over-escaped.
+-				`Hello, World \x26 O\x27Reilly\x21`,
+-				`greeting=H%69,\x26addressee=(World)`,
+-				`greeting=H%69,\x26addressee=(World) 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
++				`Hello, World \u0026 O\u0027Reilly\u0021`,
++				`greeting=H%69,\u0026addressee=(World)`,
++				`greeting=H%69,\u0026addressee=(World) 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
+				`,foo\/,`,
+			},
+		},
+@@ -208,7 +208,7 @@ func TestTypedContent(t *testing.T) {
+				// Not escaped.
+				`c && alert("Hello, World!");`,
+				// Escape sequence not over-escaped.
+-				`"Hello, World & O'Reilly\x21"`,
++				`"Hello, World & O'Reilly\u0021"`,
+				`"greeting=H%69,\u0026addressee=(World)"`,
+				`"greeting=H%69,\u0026addressee=(World) 2x, https://golang.org/favicon.ico 500.5w"`,
+				`",foo/,"`,
+@@ -224,7 +224,7 @@ func TestTypedContent(t *testing.T) {
+				`Hello, <b>World</b> &amp;tc!`,
+				` dir=&#34;ltr&#34;`,
+				`c &amp;&amp; alert(&#34;Hello, World!&#34;);`,
+-				`Hello, World &amp; O&#39;Reilly\x21`,
++				`Hello, World &amp; O&#39;Reilly\u0021`,
+				`greeting=H%69,&amp;addressee=(World)`,
+				`greeting=H%69,&amp;addressee=(World) 2x, https://golang.org/favicon.ico 500.5w`,
+				`,foo/,`,
+@@ -233,15 +233,15 @@ func TestTypedContent(t *testing.T) {
+		{
+			`<button onclick='alert("{{.}}")'>`,
+			[]string{
+-				`\x3cb\x3e \x22foo%\x22 O\x27Reilly \x26bar;`,
+-				`a[href =~ \x22\/\/example.com\x22]#foo`,
+-				`Hello, \x3cb\x3eWorld\x3c\/b\x3e \x26amp;tc!`,
+-				` dir=\x22ltr\x22`,
+-				`c \x26\x26 alert(\x22Hello, World!\x22);`,
++				`\u003cb\u003e \u0022foo%\u0022 O\u0027Reilly \u0026bar;`,
++				`a[href =~ \u0022\/\/example.com\u0022]#foo`,
++				`Hello, \u003cb\u003eWorld\u003c\/b\u003e \u0026amp;tc!`,
++				` dir=\u0022ltr\u0022`,
++				`c \u0026\u0026 alert(\u0022Hello, World!\u0022);`,
+				// Escape sequence not over-escaped.
+-				`Hello, World \x26 O\x27Reilly\x21`,
+-				`greeting=H%69,\x26addressee=(World)`,
+-				`greeting=H%69,\x26addressee=(World) 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
++				`Hello, World \u0026 O\u0027Reilly\u0021`,
++				`greeting=H%69,\u0026addressee=(World)`,
++				`greeting=H%69,\u0026addressee=(World) 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
+				`,foo\/,`,
+			},
+		},
+@@ -253,7 +253,7 @@ func TestTypedContent(t *testing.T) {
+				`Hello%2c%20%3cb%3eWorld%3c%2fb%3e%20%26amp%3btc%21`,
+				`%20dir%3d%22ltr%22`,
+				`c%20%26%26%20alert%28%22Hello%2c%20World%21%22%29%3b`,
+-				`Hello%2c%20World%20%26%20O%27Reilly%5cx21`,
++				`Hello%2c%20World%20%26%20O%27Reilly%5cu0021`,
+				// Quotes and parens are escaped but %69 is not over-escaped. HTML escaping is done.
+				`greeting=H%69,&amp;addressee=%28World%29`,
+				`greeting%3dH%2569%2c%26addressee%3d%28World%29%202x%2c%20https%3a%2f%2fgolang.org%2ffavicon.ico%20500.5w`,
+@@ -268,7 +268,7 @@ func TestTypedContent(t *testing.T) {
+				`Hello%2c%20%3cb%3eWorld%3c%2fb%3e%20%26amp%3btc%21`,
+				`%20dir%3d%22ltr%22`,
+				`c%20%26%26%20alert%28%22Hello%2c%20World%21%22%29%3b`,
+-				`Hello%2c%20World%20%26%20O%27Reilly%5cx21`,
++				`Hello%2c%20World%20%26%20O%27Reilly%5cu0021`,
+				// Quotes and parens are escaped but %69 is not over-escaped. HTML escaping is not done.
+				`greeting=H%69,&addressee=%28World%29`,
+				`greeting%3dH%2569%2c%26addressee%3d%28World%29%202x%2c%20https%3a%2f%2fgolang.org%2ffavicon.ico%20500.5w`,
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index e72a9ba..c709660 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -238,7 +238,7 @@ func TestEscape(t *testing.T) {
+		{
+			"jsStr",
+			"<button onclick='alert(&quot;{{.H}}&quot;)'>",
+-			`<button onclick='alert(&quot;\x3cHello\x3e&quot;)'>`,
++			`<button onclick='alert(&quot;\u003cHello\u003e&quot;)'>`,
+		},
+		{
+			"badMarshaler",
+@@ -259,7 +259,7 @@ func TestEscape(t *testing.T) {
+		{
+			"jsRe",
+			`<button onclick='alert(/{{"foo+bar"}}/.test(""))'>`,
+-			`<button onclick='alert(/foo\x2bbar/.test(""))'>`,
++			`<button onclick='alert(/foo\u002bbar/.test(""))'>`,
+		},
+		{
+			"jsReBlank",
+@@ -825,7 +825,7 @@ func TestEscapeSet(t *testing.T) {
+				"main":   `<button onclick="title='{{template "helper"}}'; ...">{{template "helper"}}</button>`,
+				"helper": `{{11}} of {{"<100>"}}`,
+			},
+-			`<button onclick="title='11 of \x3c100\x3e'; ...">11 of &lt;100&gt;</button>`,
++			`<button onclick="title='11 of \u003c100\u003e'; ...">11 of &lt;100&gt;</button>`,
+		},
+		// A non-recursive template that ends in a different context.
+		// helper starts in jsCtxRegexp and ends in jsCtxDivOp.
+diff --git a/src/html/template/example_test.go b/src/html/template/example_test.go
+index 9d965f1..6cf936f 100644
+--- a/src/html/template/example_test.go
++++ b/src/html/template/example_test.go
+@@ -116,9 +116,9 @@ func Example_escape() {
+	// &#34;Fran &amp; Freddie&#39;s Diner&#34; &lt;tasty@example.com&gt;
+	// &#34;Fran &amp; Freddie&#39;s Diner&#34; &lt;tasty@example.com&gt;
+	// &#34;Fran &amp; Freddie&#39;s Diner&#34;32&lt;tasty@example.com&gt;
+-	// \"Fran \x26 Freddie\'s Diner\" \x3Ctasty@example.com\x3E
+-	// \"Fran \x26 Freddie\'s Diner\" \x3Ctasty@example.com\x3E
+-	// \"Fran \x26 Freddie\'s Diner\"32\x3Ctasty@example.com\x3E
++	// \"Fran \u0026 Freddie\'s Diner\" \u003Ctasty@example.com\u003E
++	// \"Fran \u0026 Freddie\'s Diner\" \u003Ctasty@example.com\u003E
++	// \"Fran \u0026 Freddie\'s Diner\"32\u003Ctasty@example.com\u003E
+	// %22Fran+%26+Freddie%27s+Diner%2232%3Ctasty%40example.com%3E
+
+ }
 diff --git a/src/html/template/js.go b/src/html/template/js.go
 index 0e91458..ea9c183 100644
 --- a/src/html/template/js.go
@@ -173,6 +401,217 @@ index 0e91458..ea9c183 100644
 	'?':  `\?`,
 	'[':  `\[`,
 	'\\': `\\`,
+diff --git a/src/html/template/js_test.go b/src/html/template/js_test.go
+index 075adaa..d7ee47b 100644
+--- a/src/html/template/js_test.go
++++ b/src/html/template/js_test.go
+@@ -137,7 +137,7 @@ func TestJSValEscaper(t *testing.T) {
+		{"foo", `"foo"`},
+		// Newlines.
+		{"\r\n\u2028\u2029", `"\r\n\u2028\u2029"`},
+-		// "\v" == "v" on IE 6 so use "\x0b" instead.
++		// "\v" == "v" on IE 6 so use "\u000b" instead.
+		{"\t\x0b", `"\t\u000b"`},
+		{struct{ X, Y int }{1, 2}, `{"X":1,"Y":2}`},
+		{[]interface{}{}, "[]"},
+@@ -173,7 +173,7 @@ func TestJSStrEscaper(t *testing.T) {
+	}{
+		{"", ``},
+		{"foo", `foo`},
+-		{"\u0000", `\0`},
++		{"\u0000", `\u0000`},
+		{"\t", `\t`},
+		{"\n", `\n`},
+		{"\r", `\r`},
+@@ -183,14 +183,14 @@ func TestJSStrEscaper(t *testing.T) {
+		{"\\n", `\\n`},
+		{"foo\r\nbar", `foo\r\nbar`},
+		// Preserve attribute boundaries.
+-		{`"`, `\x22`},
+-		{`'`, `\x27`},
++		{`"`, `\u0022`},
++		{`'`, `\u0027`},
+		// Allow embedding in HTML without further escaping.
+-		{`&amp;`, `\x26amp;`},
++		{`&amp;`, `\u0026amp;`},
+		// Prevent breaking out of text node and element boundaries.
+-		{"</script>", `\x3c\/script\x3e`},
+-		{"<![CDATA[", `\x3c![CDATA[`},
+-		{"]]>", `]]\x3e`},
++		{"</script>", `\u003c\/script\u003e`},
++		{"<![CDATA[", `\u003c![CDATA[`},
++		{"]]>", `]]\u003e`},
+		// https://dev.w3.org/html5/markup/aria/syntax.html#escaping-text-span
+		//   "The text in style, script, title, and textarea elements
+		//   must not have an escaping text span start that is not
+@@ -201,11 +201,11 @@ func TestJSStrEscaper(t *testing.T) {
+		// allow regular text content to be interpreted as script
+		// allowing script execution via a combination of a JS string
+		// injection followed by an HTML text injection.
+-		{"<!--", `\x3c!--`},
+-		{"-->", `--\x3e`},
++		{"<!--", `\u003c!--`},
++		{"-->", `--\u003e`},
+		// From https://code.google.com/p/doctype/wiki/ArticleUtf7
+		{"+ADw-script+AD4-alert(1)+ADw-/script+AD4-",
+-			`\x2bADw-script\x2bAD4-alert(1)\x2bADw-\/script\x2bAD4-`,
++			`\u002bADw-script\u002bAD4-alert(1)\u002bADw-\/script\u002bAD4-`,
+		},
+		// Invalid UTF-8 sequence
+		{"foo\xA0bar", "foo\xA0bar"},
+@@ -228,7 +228,7 @@ func TestJSRegexpEscaper(t *testing.T) {
+	}{
+		{"", `(?:)`},
+		{"foo", `foo`},
+-		{"\u0000", `\0`},
++		{"\u0000", `\u0000`},
+		{"\t", `\t`},
+		{"\n", `\n`},
+		{"\r", `\r`},
+@@ -238,19 +238,19 @@ func TestJSRegexpEscaper(t *testing.T) {
+		{"\\n", `\\n`},
+		{"foo\r\nbar", `foo\r\nbar`},
+		// Preserve attribute boundaries.
+-		{`"`, `\x22`},
+-		{`'`, `\x27`},
++		{`"`, `\u0022`},
++		{`'`, `\u0027`},
+		// Allow embedding in HTML without further escaping.
+-		{`&amp;`, `\x26amp;`},
++		{`&amp;`, `\u0026amp;`},
+		// Prevent breaking out of text node and element boundaries.
+-		{"</script>", `\x3c\/script\x3e`},
+-		{"<![CDATA[", `\x3c!\[CDATA\[`},
+-		{"]]>", `\]\]\x3e`},
++		{"</script>", `\u003c\/script\u003e`},
++		{"<![CDATA[", `\u003c!\[CDATA\[`},
++		{"]]>", `\]\]\u003e`},
+		// Escaping text spans.
+-		{"<!--", `\x3c!\-\-`},
+-		{"-->", `\-\-\x3e`},
++		{"<!--", `\u003c!\-\-`},
++		{"-->", `\-\-\u003e`},
+		{"*", `\*`},
+-		{"+", `\x2b`},
++		{"+", `\u002b`},
+		{"?", `\?`},
+		{"[](){}", `\[\]\(\)\{\}`},
+		{"$foo|x.y", `\$foo\|x\.y`},
+@@ -284,27 +284,27 @@ func TestEscapersOnLower7AndSelectHighCodepoints(t *testing.T) {
+		{
+			"jsStrEscaper",
+			jsStrEscaper,
+-			"\\0\x01\x02\x03\x04\x05\x06\x07" +
+-				"\x08\\t\\n\\x0b\\f\\r\x0E\x0F" +
+-				"\x10\x11\x12\x13\x14\x15\x16\x17" +
+-				"\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f" +
+-				` !\x22#$%\x26\x27()*\x2b,-.\/` +
+-				`0123456789:;\x3c=\x3e?` +
++			`\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007` +
++				`\u0008\t\n\u000b\f\r\u000e\u000f` +
++				`\u0010\u0011\u0012\u0013\u0014\u0015\u0016\u0017` +
++				`\u0018\u0019\u001a\u001b\u001c\u001d\u001e\u001f` +
++				` !\u0022#$%\u0026\u0027()*\u002b,-.\/` +
++				`0123456789:;\u003c=\u003e?` +
+				`@ABCDEFGHIJKLMNO` +
+				`PQRSTUVWXYZ[\\]^_` +
+				"`abcdefghijklmno" +
+-				"pqrstuvwxyz{|}~\x7f" +
++				"pqrstuvwxyz{|}~\u007f" +
+				"\u00A0\u0100\\u2028\\u2029\ufeff\U0001D11E",
+		},
+		{
+			"jsRegexpEscaper",
+			jsRegexpEscaper,
+-			"\\0\x01\x02\x03\x04\x05\x06\x07" +
+-				"\x08\\t\\n\\x0b\\f\\r\x0E\x0F" +
+-				"\x10\x11\x12\x13\x14\x15\x16\x17" +
+-				"\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f" +
+-				` !\x22#\$%\x26\x27\(\)\*\x2b,\-\.\/` +
+-				`0123456789:;\x3c=\x3e\?` +
++			`\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007` +
++				`\u0008\t\n\u000b\f\r\u000e\u000f` +
++				`\u0010\u0011\u0012\u0013\u0014\u0015\u0016\u0017` +
++				`\u0018\u0019\u001a\u001b\u001c\u001d\u001e\u001f` +
++				` !\u0022#\$%\u0026\u0027\(\)\*\u002b,\-\.\/` +
++				`0123456789:;\u003c=\u003e\?` +
+				`@ABCDEFGHIJKLMNO` +
+				`PQRSTUVWXYZ\[\\\]\^_` +
+				"`abcdefghijklmno" +
+diff --git a/src/html/template/template_test.go b/src/html/template/template_test.go
+index 13e6ba4..86bd4db 100644
+--- a/src/html/template/template_test.go
++++ b/src/html/template/template_test.go
+@@ -6,6 +6,7 @@ package template_test
+
+ import (
+	"bytes"
++	"encoding/json"
+	. "html/template"
+	"strings"
+	"testing"
+@@ -121,6 +122,44 @@ func TestNumbers(t *testing.T) {
+	c.mustExecute(c.root, nil, "12.34 7.5")
+ }
+
++func TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped(t *testing.T) {
++	// See #33671 and #37634 for more context on this.
++	tests := []struct{ name, in string }{
++		{"empty", ""},
++		{"invalid", string(rune(-1))},
++		{"null", "\u0000"},
++		{"unit separator", "\u001F"},
++		{"tab", "\t"},
++		{"gt and lt", "<>"},
++		{"quotes", `'"`},
++		{"ASCII letters", "ASCII letters"},
++		{"Unicode", "ʕ⊙ϖ⊙ʔ"},
++		{"Pizza", "P"},
++	}
++	const (
++		prefix = `<script type="application/ld+json">`
++		suffix = `</script>`
++		templ  = prefix + `"{{.}}"` + suffix
++	)
++	tpl := Must(New("JS string is JSON string").Parse(templ))
++	for _, tt := range tests {
++		t.Run(tt.name, func(t *testing.T) {
++			var buf bytes.Buffer
++			if err := tpl.Execute(&buf, tt.in); err != nil {
++				t.Fatalf("Cannot render template: %v", err)
++			}
++			trimmed := bytes.TrimSuffix(bytes.TrimPrefix(buf.Bytes(), []byte(prefix)), []byte(suffix))
++			var got string
++			if err := json.Unmarshal(trimmed, &got); err != nil {
++				t.Fatalf("Cannot parse JS string %q as JSON: %v", trimmed[1:len(trimmed)-1], err)
++			}
++			if got != tt.in {
++				t.Errorf("Serialization changed the string value: got %q want %q", got, tt.in)
++			}
++		})
++	}
++}
++
+ type testCase struct {
+	t    *testing.T
+	root *Template
+diff --git a/src/text/template/exec_test.go b/src/text/template/exec_test.go
+index 77294ed..b8a809e 100644
+--- a/src/text/template/exec_test.go
++++ b/src/text/template/exec_test.go
+@@ -911,9 +911,9 @@ func TestJSEscaping(t *testing.T) {
+		{`Go "jump" \`, `Go \"jump\" \\`},
+		{`Yukihiro says "今日は世界"`, `Yukihiro says \"今日は世界\"`},
+		{"unprintable \uFDFF", `unprintable \uFDFF`},
+-		{`<html>`, `\x3Chtml\x3E`},
+-		{`no = in attributes`, `no \x3D in attributes`},
+-		{`&#x27; does not become HTML entity`, `\x26#x27; does not become HTML entity`},
++		{`<html>`, `\u003Chtml\u003E`},
++		{`no = in attributes`, `no \u003D in attributes`},
++		{`&#x27; does not become HTML entity`, `\u0026#x27; does not become HTML entity`},
+	}
+	for _, tc := range testCases {
+		s := JSEscapeString(tc.in)
 diff --git a/src/text/template/funcs.go b/src/text/template/funcs.go
 index 46125bc..f3de9fb 100644
 --- a/src/text/template/funcs.go
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch
new file mode 100644
index 0000000000..cd7dd0957c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch
@@ -0,0 +1,393 @@
+From 7ddce23c7d5b728acf8482f5006497c7b9915f8a Mon Sep 17 00:00:00 2001
+From: Ariel Mashraki <ariel@mashraki.co.il>
+Date: Wed, 22 Apr 2020 22:17:56 +0300
+Subject: [PATCH 3/6] text/template: add CommentNode to template parse tree
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes #34652
+
+Change-Id: Icf6e3eda593fed826736f34f95a9d66f5450cc98
+Reviewed-on: https://go-review.googlesource.com/c/go/+/229398
+Reviewed-by: Daniel Martí <mvdan@mvdan.cc>
+Run-TryBot: Daniel Martí <mvdan@mvdan.cc>
+TryBot-Result: Gobot Gobot <gobot@golang.org>
+
+Dependency Patch #3
+
+Upstream-Status: Backport from https://github.com/golang/go/commit/c8ea03828b0645b1fd5725888e44873b75fcfbb6
+CVE: CVE-2023-24538
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ api/next.txt                          | 19 +++++++++++++++++++
+ src/html/template/escape.go           |  2 ++
+ src/html/template/template_test.go    | 16 ++++++++++++++++
+ src/text/template/exec.go             |  1 +
+ src/text/template/parse/lex.go        |  8 +++++++-
+ src/text/template/parse/lex_test.go   |  7 +++++--
+ src/text/template/parse/node.go       | 33 +++++++++++++++++++++++++++++++++
+ src/text/template/parse/parse.go      | 22 +++++++++++++++++++---
+ src/text/template/parse/parse_test.go | 25 +++++++++++++++++++++++++
+ 9 files changed, 127 insertions(+), 6 deletions(-)
+
+diff --git a/api/next.txt b/api/next.txt
+index e69de29..076f39e 100644
+--- a/api/next.txt
++++ b/api/next.txt
+@@ -0,0 +1,19 @@
++pkg unicode, const Version = "13.0.0"
++pkg unicode, var Chorasmian *RangeTable
++pkg unicode, var Dives_Akuru *RangeTable
++pkg unicode, var Khitan_Small_Script *RangeTable
++pkg unicode, var Yezidi *RangeTable
++pkg text/template/parse, const NodeComment = 20
++pkg text/template/parse, const NodeComment NodeType
++pkg text/template/parse, const ParseComments = 1
++pkg text/template/parse, const ParseComments Mode
++pkg text/template/parse, method (*CommentNode) Copy() Node
++pkg text/template/parse, method (*CommentNode) String() string
++pkg text/template/parse, method (CommentNode) Position() Pos
++pkg text/template/parse, method (CommentNode) Type() NodeType
++pkg text/template/parse, type CommentNode struct
++pkg text/template/parse, type CommentNode struct, Text string
++pkg text/template/parse, type CommentNode struct, embedded NodeType
++pkg text/template/parse, type CommentNode struct, embedded Pos
++pkg text/template/parse, type Mode uint
++pkg text/template/parse, type Tree struct, Mode Mode
+diff --git a/src/html/template/escape.go b/src/html/template/escape.go
+index f12dafa..8739735 100644
+--- a/src/html/template/escape.go
++++ b/src/html/template/escape.go
+@@ -124,6 +124,8 @@ func (e *escaper) escape(c context, n parse.Node) context {
+	switch n := n.(type) {
+	case *parse.ActionNode:
+		return e.escapeAction(c, n)
++	case *parse.CommentNode:
++		return c
+	case *parse.IfNode:
+		return e.escapeBranch(c, &n.BranchNode, "if")
+	case *parse.ListNode:
+diff --git a/src/html/template/template_test.go b/src/html/template/template_test.go
+index 86bd4db..1f2c888 100644
+--- a/src/html/template/template_test.go
++++ b/src/html/template/template_test.go
+@@ -10,6 +10,7 @@ import (
+	. "html/template"
+	"strings"
+	"testing"
++	"text/template/parse"
+ )
+
+ func TestTemplateClone(t *testing.T) {
+@@ -160,6 +161,21 @@ func TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped(t *testing.T) {
+	}
+ }
+
++func TestSkipEscapeComments(t *testing.T) {
++	c := newTestCase(t)
++	tr := parse.New("root")
++	tr.Mode = parse.ParseComments
++	newT, err := tr.Parse("{{/* A comment */}}{{ 1 }}{{/* Another comment */}}", "", "", make(map[string]*parse.Tree))
++	if err != nil {
++		t.Fatalf("Cannot parse template text: %v", err)
++	}
++	c.root, err = c.root.AddParseTree("root", newT)
++	if err != nil {
++		t.Fatalf("Cannot add parse tree to template: %v", err)
++	}
++	c.mustExecute(c.root, nil, "1")
++}
++
+ type testCase struct {
+	t    *testing.T
+	root *Template
+diff --git a/src/text/template/exec.go b/src/text/template/exec.go
+index ac3e741..7ac5175 100644
+--- a/src/text/template/exec.go
++++ b/src/text/template/exec.go
+@@ -256,6 +256,7 @@ func (s *state) walk(dot reflect.Value, node parse.Node) {
+		if len(node.Pipe.Decl) == 0 {
+			s.printValue(node, val)
+		}
++	case *parse.CommentNode:
+	case *parse.IfNode:
+		s.walkIfOrWith(parse.NodeIf, dot, node.Pipe, node.List, node.ElseList)
+	case *parse.ListNode:
+diff --git a/src/text/template/parse/lex.go b/src/text/template/parse/lex.go
+index 30371f2..e41373a 100644
+--- a/src/text/template/parse/lex.go
++++ b/src/text/template/parse/lex.go
+@@ -41,6 +41,7 @@ const (
+	itemBool                         // boolean constant
+	itemChar                         // printable ASCII character; grab bag for comma etc.
+	itemCharConstant                 // character constant
++	itemComment                      // comment text
+	itemComplex                      // complex constant (1+2i); imaginary is just a number
+	itemAssign                       // equals ('=') introducing an assignment
+	itemDeclare                      // colon-equals (':=') introducing a declaration
+@@ -112,6 +113,7 @@ type lexer struct {
+	leftDelim      string    // start of action
+	rightDelim     string    // end of action
+	trimRightDelim string    // end of action with trim marker
++	emitComment    bool      // emit itemComment tokens.
+	pos            Pos       // current position in the input
+	start          Pos       // start position of this item
+	width          Pos       // width of last rune read from input
+@@ -203,7 +205,7 @@ func (l *lexer) drain() {
+ }
+
+ // lex creates a new scanner for the input string.
+-func lex(name, input, left, right string) *lexer {
++func lex(name, input, left, right string, emitComment bool) *lexer {
+	if left == "" {
+		left = leftDelim
+	}
+@@ -216,6 +218,7 @@ func lex(name, input, left, right string) *lexer {
+		leftDelim:      left,
+		rightDelim:     right,
+		trimRightDelim: rightTrimMarker + right,
++		emitComment:    emitComment,
+		items:          make(chan item),
+		line:           1,
+		startLine:      1,
+@@ -323,6 +326,9 @@ func lexComment(l *lexer) stateFn {
+	if !delim {
+		return l.errorf("comment ends before closing delimiter")
+	}
++	if l.emitComment {
++		l.emit(itemComment)
++	}
+	if trimSpace {
+		l.pos += trimMarkerLen
+	}
+diff --git a/src/text/template/parse/lex_test.go b/src/text/template/parse/lex_test.go
+index 563c4fc..f6d5f28 100644
+--- a/src/text/template/parse/lex_test.go
++++ b/src/text/template/parse/lex_test.go
+@@ -15,6 +15,7 @@ var itemName = map[itemType]string{
+	itemBool:         "bool",
+	itemChar:         "char",
+	itemCharConstant: "charconst",
++	itemComment:      "comment",
+	itemComplex:      "complex",
+	itemDeclare:      ":=",
+	itemEOF:          "EOF",
+@@ -90,6 +91,7 @@ var lexTests = []lexTest{
+	{"text", `now is the time`, []item{mkItem(itemText, "now is the time"), tEOF}},
+	{"text with comment", "hello-{{/* this is a comment */}}-world", []item{
+		mkItem(itemText, "hello-"),
++		mkItem(itemComment, "/* this is a comment */"),
+		mkItem(itemText, "-world"),
+		tEOF,
+	}},
+@@ -311,6 +313,7 @@ var lexTests = []lexTest{
+	}},
+	{"trimming spaces before and after comment", "hello- {{- /* hello */ -}} -world", []item{
+		mkItem(itemText, "hello-"),
++		mkItem(itemComment, "/* hello */"),
+		mkItem(itemText, "-world"),
+		tEOF,
+	}},
+@@ -389,7 +392,7 @@ var lexTests = []lexTest{
+
+ // collect gathers the emitted items into a slice.
+ func collect(t *lexTest, left, right string) (items []item) {
+-	l := lex(t.name, t.input, left, right)
++	l := lex(t.name, t.input, left, right, true)
+	for {
+		item := l.nextItem()
+		items = append(items, item)
+@@ -529,7 +532,7 @@ func TestPos(t *testing.T) {
+ func TestShutdown(t *testing.T) {
+	// We need to duplicate template.Parse here to hold on to the lexer.
+	const text = "erroneous{{define}}{{else}}1234"
+-	lexer := lex("foo", text, "{{", "}}")
++	lexer := lex("foo", text, "{{", "}}", false)
+	_, err := New("root").parseLexer(lexer)
+	if err == nil {
+		t.Fatalf("expected error")
+diff --git a/src/text/template/parse/node.go b/src/text/template/parse/node.go
+index 1c116ea..a9dad5e 100644
+--- a/src/text/template/parse/node.go
++++ b/src/text/template/parse/node.go
+@@ -70,6 +70,7 @@ const (
+	NodeTemplate                   // A template invocation action.
+	NodeVariable                   // A $ variable.
+	NodeWith                       // A with action.
++	NodeComment                    // A comment.
+ )
+
+ // Nodes.
+@@ -149,6 +150,38 @@ func (t *TextNode) Copy() Node {
+	return &TextNode{tr: t.tr, NodeType: NodeText, Pos: t.Pos, Text: append([]byte{}, t.Text...)}
+ }
+
++// CommentNode holds a comment.
++type CommentNode struct {
++	NodeType
++	Pos
++	tr   *Tree
++	Text string // Comment text.
++}
++
++func (t *Tree) newComment(pos Pos, text string) *CommentNode {
++	return &CommentNode{tr: t, NodeType: NodeComment, Pos: pos, Text: text}
++}
++
++func (c *CommentNode) String() string {
++	var sb strings.Builder
++	c.writeTo(&sb)
++	return sb.String()
++}
++
++func (c *CommentNode) writeTo(sb *strings.Builder) {
++	sb.WriteString("{{")
++	sb.WriteString(c.Text)
++	sb.WriteString("}}")
++}
++
++func (c *CommentNode) tree() *Tree {
++	return c.tr
++}
++
++func (c *CommentNode) Copy() Node {
++	return &CommentNode{tr: c.tr, NodeType: NodeComment, Pos: c.Pos, Text: c.Text}
++}
++
+ // PipeNode holds a pipeline with optional declaration
+ type PipeNode struct {
+	NodeType
+diff --git a/src/text/template/parse/parse.go b/src/text/template/parse/parse.go
+index c9b80f4..496d8bf 100644
+--- a/src/text/template/parse/parse.go
++++ b/src/text/template/parse/parse.go
+@@ -21,6 +21,7 @@ type Tree struct {
+	Name      string    // name of the template represented by the tree.
+	ParseName string    // name of the top-level template during parsing, for error messages.
+	Root      *ListNode // top-level root of the tree.
++	Mode      Mode      // parsing mode.
+	text      string    // text parsed to create the template (or its parent)
+	// Parsing only; cleared after parse.
+	funcs     []map[string]interface{}
+@@ -29,8 +30,16 @@ type Tree struct {
+	peekCount int
+	vars      []string // variables defined at the moment.
+	treeSet   map[string]*Tree
++	mode      Mode
+ }
+
++// A mode value is a set of flags (or 0). Modes control parser behavior.
++type Mode uint
++
++const (
++	ParseComments Mode = 1 << iota // parse comments and add them to AST
++)
++
+ // Copy returns a copy of the Tree. Any parsing state is discarded.
+ func (t *Tree) Copy() *Tree {
+	if t == nil {
+@@ -220,7 +229,8 @@ func (t *Tree) stopParse() {
+ func (t *Tree) Parse(text, leftDelim, rightDelim string, treeSet map[string]*Tree, funcs ...map[string]interface{}) (tree *Tree, err error) {
+	defer t.recover(&err)
+	t.ParseName = t.Name
+-	t.startParse(funcs, lex(t.Name, text, leftDelim, rightDelim), treeSet)
++	emitComment := t.Mode&ParseComments != 0
++	t.startParse(funcs, lex(t.Name, text, leftDelim, rightDelim, emitComment), treeSet)
+	t.text = text
+	t.parse()
+	t.add()
+@@ -240,12 +250,14 @@ func (t *Tree) add() {
+	}
+ }
+
+-// IsEmptyTree reports whether this tree (node) is empty of everything but space.
++// IsEmptyTree reports whether this tree (node) is empty of everything but space or comments.
+ func IsEmptyTree(n Node) bool {
+	switch n := n.(type) {
+	case nil:
+		return true
+	case *ActionNode:
++	case *CommentNode:
++		return true
+	case *IfNode:
+	case *ListNode:
+		for _, node := range n.Nodes {
+@@ -276,6 +288,7 @@ func (t *Tree) parse() {
+			if t.nextNonSpace().typ == itemDefine {
+				newT := New("definition") // name will be updated once we know it.
+				newT.text = t.text
++				newT.Mode = t.Mode
+				newT.ParseName = t.ParseName
+				newT.startParse(t.funcs, t.lex, t.treeSet)
+				newT.parseDefinition()
+@@ -331,13 +344,15 @@ func (t *Tree) itemList() (list *ListNode, next Node) {
+ }
+
+ // textOrAction:
+-//	text | action
++//	text | comment | action
+ func (t *Tree) textOrAction() Node {
+	switch token := t.nextNonSpace(); token.typ {
+	case itemText:
+		return t.newText(token.pos, token.val)
+	case itemLeftDelim:
+		return t.action()
++	case itemComment:
++		return t.newComment(token.pos, token.val)
+	default:
+		t.unexpected(token, "input")
+	}
+@@ -539,6 +554,7 @@ func (t *Tree) blockControl() Node {
+
+	block := New(name) // name will be updated once we know it.
+	block.text = t.text
++	block.Mode = t.Mode
+	block.ParseName = t.ParseName
+	block.startParse(t.funcs, t.lex, t.treeSet)
+	var end Node
+diff --git a/src/text/template/parse/parse_test.go b/src/text/template/parse/parse_test.go
+index 4e09a78..d9c13c5 100644
+--- a/src/text/template/parse/parse_test.go
++++ b/src/text/template/parse/parse_test.go
+@@ -348,6 +348,30 @@ func TestParseCopy(t *testing.T) {
+	testParse(true, t)
+ }
+
++func TestParseWithComments(t *testing.T) {
++	textFormat = "%q"
++	defer func() { textFormat = "%s" }()
++	tests := [...]parseTest{
++		{"comment", "{{/*\n\n\n*/}}", noError, "{{/*\n\n\n*/}}"},
++		{"comment trim left", "x \r\n\t{{- /* hi */}}", noError, `"x"{{/* hi */}}`},
++		{"comment trim right", "{{/* hi */ -}}\n\n\ty", noError, `{{/* hi */}}"y"`},
++		{"comment trim left and right", "x \r\n\t{{- /* */ -}}\n\n\ty", noError, `"x"{{/* */}}"y"`},
++	}
++	for _, test := range tests {
++		t.Run(test.name, func(t *testing.T) {
++			tr := New(test.name)
++			tr.Mode = ParseComments
++			tmpl, err := tr.Parse(test.input, "", "", make(map[string]*Tree))
++			if err != nil {
++				t.Errorf("%q: expected error; got none", test.name)
++			}
++			if result := tmpl.Root.String(); result != test.result {
++				t.Errorf("%s=(%q): got\n\t%v\nexpected\n\t%v", test.name, test.input, result, test.result)
++			}
++		})
++	}
++}
++
+ type isEmptyTest struct {
+	name  string
+	input string
+@@ -358,6 +382,7 @@ var isEmptyTests = []isEmptyTest{
+	{"empty", ``, true},
+	{"nonempty", `hello`, false},
+	{"spaces only", " \t\n \t\n", true},
++	{"comment only", "{{/* comment */}}", true},
+	{"definition", `{{define "x"}}something{{end}}`, true},
+	{"definitions and space", "{{define `x`}}something{{end}}\n\n{{define `y`}}something{{end}}\n\n", true},
+	{"definitions and text", "{{define `x`}}something{{end}}\nx\n{{define `y`}}something{{end}}\ny\n", false},
+--
+2.7.4
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch
new file mode 100644
index 0000000000..d5e2eb6684
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch
@@ -0,0 +1,497 @@
+From 760d88497091fb5d6d231a18e6f4e06ecb9af9b2 Mon Sep 17 00:00:00 2001
+From: Russ Cox <rsc@golang.org>
+Date: Thu, 10 Sep 2020 18:53:26 -0400
+Subject: [PATCH 4/6] text/template: allow newlines inside action delimiters
+
+This allows multiline constructs like:
+
+	{{"hello" |
+	  printf}}
+
+Now that unclosed actions can span multiple lines,
+track and report the start of the action when reporting errors.
+
+Also clean up a few "unexpected <error message>" to be just "<error message>".
+
+Fixes #29770.
+
+Change-Id: I54c6c016029a8328b7902a4b6d85eab713ec3285
+Reviewed-on: https://go-review.googlesource.com/c/go/+/254257
+Trust: Russ Cox <rsc@golang.org>
+Run-TryBot: Russ Cox <rsc@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-by: Rob Pike <r@golang.org>
+
+Dependency Patch #4
+
+Upstream-Status: Backport from https://github.com/golang/go/commit/9384d34c58099657bb1b133beaf3ff37ada9b017
+CVE: CVE-2023-24538
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ src/text/template/doc.go              | 21 ++++-----
+ src/text/template/exec_test.go        |  2 +-
+ src/text/template/parse/lex.go        | 84 +++++++++++++++++------------------
+ src/text/template/parse/lex_test.go   |  2 +-
+ src/text/template/parse/parse.go      | 59 +++++++++++++-----------
+ src/text/template/parse/parse_test.go | 36 ++++++++++++---
+ 6 files changed, 117 insertions(+), 87 deletions(-)
+
+diff --git a/src/text/template/doc.go b/src/text/template/doc.go
+index 4b0efd2..7b30294 100644
+--- a/src/text/template/doc.go
++++ b/src/text/template/doc.go
+@@ -40,16 +40,17 @@ More intricate examples appear below.
+ Text and spaces
+
+ By default, all text between actions is copied verbatim when the template is
+-executed. For example, the string " items are made of " in the example above appears
+-on standard output when the program is run.
+-
+-However, to aid in formatting template source code, if an action's left delimiter
+-(by default "{{") is followed immediately by a minus sign and ASCII space character
+-("{{- "), all trailing white space is trimmed from the immediately preceding text.
+-Similarly, if the right delimiter ("}}") is preceded by a space and minus sign
+-(" -}}"), all leading white space is trimmed from the immediately following text.
+-In these trim markers, the ASCII space must be present; "{{-3}}" parses as an
+-action containing the number -3.
++executed. For example, the string " items are made of " in the example above
++appears on standard output when the program is run.
++
++However, to aid in formatting template source code, if an action's left
++delimiter (by default "{{") is followed immediately by a minus sign and white
++space, all trailing white space is trimmed from the immediately preceding text.
++Similarly, if the right delimiter ("}}") is preceded by white space and a minus
++sign, all leading white space is trimmed from the immediately following text.
++In these trim markers, the white space must be present:
++"{{- 3}}" is like "{{3}}" but trims the immediately preceding text, while
++"{{-3}}" parses as an action containing the number -3.
+
+ For instance, when executing the template whose source is
+
+diff --git a/src/text/template/exec_test.go b/src/text/template/exec_test.go
+index b8a809e..3309b33 100644
+--- a/src/text/template/exec_test.go
++++ b/src/text/template/exec_test.go
+@@ -1295,7 +1295,7 @@ func TestUnterminatedStringError(t *testing.T) {
+		t.Fatal("expected error")
+	}
+	str := err.Error()
+-	if !strings.Contains(str, "X:3: unexpected unterminated raw quoted string") {
++	if !strings.Contains(str, "X:3: unterminated raw quoted string") {
+		t.Fatalf("unexpected error: %s", str)
+	}
+ }
+diff --git a/src/text/template/parse/lex.go b/src/text/template/parse/lex.go
+index e41373a..6784071 100644
+--- a/src/text/template/parse/lex.go
++++ b/src/text/template/parse/lex.go
+@@ -92,15 +92,14 @@ const eof = -1
+ // If the action begins "{{- " rather than "{{", then all space/tab/newlines
+ // preceding the action are trimmed; conversely if it ends " -}}" the
+ // leading spaces are trimmed. This is done entirely in the lexer; the
+-// parser never sees it happen. We require an ASCII space to be
+-// present to avoid ambiguity with things like "{{-3}}". It reads
++// parser never sees it happen. We require an ASCII space (' ', \t, \r, \n)
++// to be present to avoid ambiguity with things like "{{-3}}". It reads
+ // better with the space present anyway. For simplicity, only ASCII
+-// space does the job.
++// does the job.
+ const (
+-	spaceChars      = " \t\r\n" // These are the space characters defined by Go itself.
+-	leftTrimMarker  = "- "      // Attached to left delimiter, trims trailing spaces from preceding text.
+-	rightTrimMarker = " -"      // Attached to right delimiter, trims leading spaces from following text.
+-	trimMarkerLen   = Pos(len(leftTrimMarker))
++	spaceChars    = " \t\r\n"  // These are the space characters defined by Go itself.
++	trimMarker    = '-'        // Attached to left/right delimiter, trims trailing spaces from preceding/following text.
++	trimMarkerLen = Pos(1 + 1) // marker plus space before or after
+ )
+
+ // stateFn represents the state of the scanner as a function that returns the next state.
+@@ -108,19 +107,18 @@ type stateFn func(*lexer) stateFn
+
+ // lexer holds the state of the scanner.
+ type lexer struct {
+-	name           string    // the name of the input; used only for error reports
+-	input          string    // the string being scanned
+-	leftDelim      string    // start of action
+-	rightDelim     string    // end of action
+-	trimRightDelim string    // end of action with trim marker
+-	emitComment    bool      // emit itemComment tokens.
+-	pos            Pos       // current position in the input
+-	start          Pos       // start position of this item
+-	width          Pos       // width of last rune read from input
+-	items          chan item // channel of scanned items
+-	parenDepth     int       // nesting depth of ( ) exprs
+-	line           int       // 1+number of newlines seen
+-	startLine      int       // start line of this item
++	name        string    // the name of the input; used only for error reports
++	input       string    // the string being scanned
++	leftDelim   string    // start of action
++	rightDelim  string    // end of action
++	emitComment bool      // emit itemComment tokens.
++	pos         Pos       // current position in the input
++	start       Pos       // start position of this item
++	width       Pos       // width of last rune read from input
++	items       chan item // channel of scanned items
++	parenDepth  int       // nesting depth of ( ) exprs
++	line        int       // 1+number of newlines seen
++	startLine   int       // start line of this item
+ }
+
+ // next returns the next rune in the input.
+@@ -213,15 +211,14 @@ func lex(name, input, left, right string, emitComment bool) *lexer {
+		right = rightDelim
+	}
+	l := &lexer{
+-		name:           name,
+-		input:          input,
+-		leftDelim:      left,
+-		rightDelim:     right,
+-		trimRightDelim: rightTrimMarker + right,
+-		emitComment:    emitComment,
+-		items:          make(chan item),
+-		line:           1,
+-		startLine:      1,
++		name:        name,
++		input:       input,
++		leftDelim:   left,
++		rightDelim:  right,
++		emitComment: emitComment,
++		items:       make(chan item),
++		line:        1,
++		startLine:   1,
+	}
+	go l.run()
+	return l
+@@ -251,7 +248,7 @@ func lexText(l *lexer) stateFn {
+		ldn := Pos(len(l.leftDelim))
+		l.pos += Pos(x)
+		trimLength := Pos(0)
+-		if strings.HasPrefix(l.input[l.pos+ldn:], leftTrimMarker) {
++		if hasLeftTrimMarker(l.input[l.pos+ldn:]) {
+			trimLength = rightTrimLength(l.input[l.start:l.pos])
+		}
+		l.pos -= trimLength
+@@ -280,7 +277,7 @@ func rightTrimLength(s string) Pos {
+
+ // atRightDelim reports whether the lexer is at a right delimiter, possibly preceded by a trim marker.
+ func (l *lexer) atRightDelim() (delim, trimSpaces bool) {
+-	if strings.HasPrefix(l.input[l.pos:], l.trimRightDelim) { // With trim marker.
++	if hasRightTrimMarker(l.input[l.pos:]) && strings.HasPrefix(l.input[l.pos+trimMarkerLen:], l.rightDelim) { // With trim marker.
+		return true, true
+	}
+	if strings.HasPrefix(l.input[l.pos:], l.rightDelim) { // Without trim marker.
+@@ -297,7 +294,7 @@ func leftTrimLength(s string) Pos {
+ // lexLeftDelim scans the left delimiter, which is known to be present, possibly with a trim marker.
+ func lexLeftDelim(l *lexer) stateFn {
+	l.pos += Pos(len(l.leftDelim))
+-	trimSpace := strings.HasPrefix(l.input[l.pos:], leftTrimMarker)
++	trimSpace := hasLeftTrimMarker(l.input[l.pos:])
+	afterMarker := Pos(0)
+	if trimSpace {
+		afterMarker = trimMarkerLen
+@@ -342,7 +339,7 @@ func lexComment(l *lexer) stateFn {
+
+ // lexRightDelim scans the right delimiter, which is known to be present, possibly with a trim marker.
+ func lexRightDelim(l *lexer) stateFn {
+-	trimSpace := strings.HasPrefix(l.input[l.pos:], rightTrimMarker)
++	trimSpace := hasRightTrimMarker(l.input[l.pos:])
+	if trimSpace {
+		l.pos += trimMarkerLen
+		l.ignore()
+@@ -369,7 +366,7 @@ func lexInsideAction(l *lexer) stateFn {
+		return l.errorf("unclosed left paren")
+	}
+	switch r := l.next(); {
+-	case r == eof || isEndOfLine(r):
++	case r == eof:
+		return l.errorf("unclosed action")
+	case isSpace(r):
+		l.backup() // Put space back in case we have " -}}".
+@@ -439,7 +436,7 @@ func lexSpace(l *lexer) stateFn {
+	}
+	// Be careful about a trim-marked closing delimiter, which has a minus
+	// after a space. We know there is a space, so check for the '-' that might follow.
+-	if strings.HasPrefix(l.input[l.pos-1:], l.trimRightDelim) {
++	if hasRightTrimMarker(l.input[l.pos-1:]) && strings.HasPrefix(l.input[l.pos-1+trimMarkerLen:], l.rightDelim) {
+		l.backup() // Before the space.
+		if numSpaces == 1 {
+			return lexRightDelim // On the delim, so go right to that.
+@@ -526,7 +523,7 @@ func lexFieldOrVariable(l *lexer, typ itemType) stateFn {
+ // day to implement arithmetic.
+ func (l *lexer) atTerminator() bool {
+	r := l.peek()
+-	if isSpace(r) || isEndOfLine(r) {
++	if isSpace(r) {
+		return true
+	}
+	switch r {
+@@ -657,15 +654,18 @@ Loop:
+
+ // isSpace reports whether r is a space character.
+ func isSpace(r rune) bool {
+-	return r == ' ' || r == '\t'
+-}
+-
+-// isEndOfLine reports whether r is an end-of-line character.
+-func isEndOfLine(r rune) bool {
+-	return r == '\r' || r == '\n'
++	return r == ' ' || r == '\t' || r == '\r' || r == '\n'
+ }
+
+ // isAlphaNumeric reports whether r is an alphabetic, digit, or underscore.
+ func isAlphaNumeric(r rune) bool {
+	return r == '_' || unicode.IsLetter(r) || unicode.IsDigit(r)
+ }
++
++func hasLeftTrimMarker(s string) bool {
++	return len(s) >= 2 && s[0] == trimMarker && isSpace(rune(s[1]))
++}
++
++func hasRightTrimMarker(s string) bool {
++	return len(s) >= 2 && isSpace(rune(s[0])) && s[1] == trimMarker
++}
+diff --git a/src/text/template/parse/lex_test.go b/src/text/template/parse/lex_test.go
+index f6d5f28..6510eed 100644
+--- a/src/text/template/parse/lex_test.go
++++ b/src/text/template/parse/lex_test.go
+@@ -323,7 +323,7 @@ var lexTests = []lexTest{
+		tLeft,
+		mkItem(itemError, "unrecognized character in action: U+0001"),
+	}},
+-	{"unclosed action", "{{\n}}", []item{
++	{"unclosed action", "{{", []item{
+		tLeft,
+		mkItem(itemError, "unclosed action"),
+	}},
+diff --git a/src/text/template/parse/parse.go b/src/text/template/parse/parse.go
+index 496d8bf..5e6e512 100644
+--- a/src/text/template/parse/parse.go
++++ b/src/text/template/parse/parse.go
+@@ -24,13 +24,14 @@ type Tree struct {
+	Mode      Mode      // parsing mode.
+	text      string    // text parsed to create the template (or its parent)
+	// Parsing only; cleared after parse.
+-	funcs     []map[string]interface{}
+-	lex       *lexer
+-	token     [3]item // three-token lookahead for parser.
+-	peekCount int
+-	vars      []string // variables defined at the moment.
+-	treeSet   map[string]*Tree
+-	mode      Mode
++	funcs      []map[string]interface{}
++	lex        *lexer
++	token      [3]item // three-token lookahead for parser.
++	peekCount  int
++	vars       []string // variables defined at the moment.
++	treeSet    map[string]*Tree
++	actionLine int // line of left delim starting action
++	mode       Mode
+ }
+
+ // A mode value is a set of flags (or 0). Modes control parser behavior.
+@@ -187,6 +188,16 @@ func (t *Tree) expectOneOf(expected1, expected2 itemType, context string) item {
+
+ // unexpected complains about the token and terminates processing.
+ func (t *Tree) unexpected(token item, context string) {
++	if token.typ == itemError {
++		extra := ""
++		if t.actionLine != 0 && t.actionLine != token.line {
++			extra = fmt.Sprintf(" in action started at %s:%d", t.ParseName, t.actionLine)
++			if strings.HasSuffix(token.val, " action") {
++				extra = extra[len(" in action"):] // avoid "action in action"
++			}
++		}
++		t.errorf("%s%s", token, extra)
++	}
+	t.errorf("unexpected %s in %s", token, context)
+ }
+
+@@ -350,6 +361,8 @@ func (t *Tree) textOrAction() Node {
+	case itemText:
+		return t.newText(token.pos, token.val)
+	case itemLeftDelim:
++		t.actionLine = token.line
++		defer t.clearActionLine()
+		return t.action()
+	case itemComment:
+		return t.newComment(token.pos, token.val)
+@@ -359,6 +372,10 @@ func (t *Tree) textOrAction() Node {
+	return nil
+ }
+
++func (t *Tree) clearActionLine() {
++	t.actionLine = 0
++}
++
+ // Action:
+ //	control
+ //	command ("|" command)*
+@@ -384,12 +401,12 @@ func (t *Tree) action() (n Node) {
+	t.backup()
+	token := t.peek()
+	// Do not pop variables; they persist until "end".
+-	return t.newAction(token.pos, token.line, t.pipeline("command"))
++	return t.newAction(token.pos, token.line, t.pipeline("command", itemRightDelim))
+ }
+
+ // Pipeline:
+ //	declarations? command ('|' command)*
+-func (t *Tree) pipeline(context string) (pipe *PipeNode) {
++func (t *Tree) pipeline(context string, end itemType) (pipe *PipeNode) {
+	token := t.peekNonSpace()
+	pipe = t.newPipeline(token.pos, token.line, nil)
+	// Are there declarations or assignments?
+@@ -430,12 +447,9 @@ decls:
+	}
+	for {
+		switch token := t.nextNonSpace(); token.typ {
+-		case itemRightDelim, itemRightParen:
++		case end:
+			// At this point, the pipeline is complete
+			t.checkPipeline(pipe, context)
+-			if token.typ == itemRightParen {
+-				t.backup()
+-			}
+			return
+		case itemBool, itemCharConstant, itemComplex, itemDot, itemField, itemIdentifier,
+			itemNumber, itemNil, itemRawString, itemString, itemVariable, itemLeftParen:
+@@ -464,7 +478,7 @@ func (t *Tree) checkPipeline(pipe *PipeNode, context string) {
+
+ func (t *Tree) parseControl(allowElseIf bool, context string) (pos Pos, line int, pipe *PipeNode, list, elseList *ListNode) {
+	defer t.popVars(len(t.vars))
+-	pipe = t.pipeline(context)
++	pipe = t.pipeline(context, itemRightDelim)
+	var next Node
+	list, next = t.itemList()
+	switch next.Type() {
+@@ -550,7 +564,7 @@ func (t *Tree) blockControl() Node {
+
+	token := t.nextNonSpace()
+	name := t.parseTemplateName(token, context)
+-	pipe := t.pipeline(context)
++	pipe := t.pipeline(context, itemRightDelim)
+
+	block := New(name) // name will be updated once we know it.
+	block.text = t.text
+@@ -580,7 +594,7 @@ func (t *Tree) templateControl() Node {
+	if t.nextNonSpace().typ != itemRightDelim {
+		t.backup()
+		// Do not pop variables; they persist until "end".
+-		pipe = t.pipeline(context)
++		pipe = t.pipeline(context, itemRightDelim)
+	}
+	return t.newTemplate(token.pos, token.line, name, pipe)
+ }
+@@ -614,13 +628,12 @@ func (t *Tree) command() *CommandNode {
+		switch token := t.next(); token.typ {
+		case itemSpace:
+			continue
+-		case itemError:
+-			t.errorf("%s", token.val)
+		case itemRightDelim, itemRightParen:
+			t.backup()
+		case itemPipe:
++			// nothing here; break loop below
+		default:
+-			t.errorf("unexpected %s in operand", token)
++			t.unexpected(token, "operand")
+		}
+		break
+	}
+@@ -675,8 +688,6 @@ func (t *Tree) operand() Node {
+ // A nil return means the next item is not a term.
+ func (t *Tree) term() Node {
+	switch token := t.nextNonSpace(); token.typ {
+-	case itemError:
+-		t.errorf("%s", token.val)
+	case itemIdentifier:
+		if !t.hasFunction(token.val) {
+			t.errorf("function %q not defined", token.val)
+@@ -699,11 +710,7 @@ func (t *Tree) term() Node {
+		}
+		return number
+	case itemLeftParen:
+-		pipe := t.pipeline("parenthesized pipeline")
+-		if token := t.next(); token.typ != itemRightParen {
+-			t.errorf("unclosed right paren: unexpected %s", token)
+-		}
+-		return pipe
++		return t.pipeline("parenthesized pipeline", itemRightParen)
+	case itemString, itemRawString:
+		s, err := strconv.Unquote(token.val)
+		if err != nil {
+diff --git a/src/text/template/parse/parse_test.go b/src/text/template/parse/parse_test.go
+index d9c13c5..220f984 100644
+--- a/src/text/template/parse/parse_test.go
++++ b/src/text/template/parse/parse_test.go
+@@ -250,6 +250,13 @@ var parseTests = []parseTest{
+	{"comment trim left and right", "x \r\n\t{{- /* */ -}}\n\n\ty", noError, `"x""y"`},
+	{"block definition", `{{block "foo" .}}hello{{end}}`, noError,
+		`{{template "foo" .}}`},
++
++	{"newline in assignment", "{{ $x \n := \n 1 \n }}", noError, "{{$x := 1}}"},
++	{"newline in empty action", "{{\n}}", hasError, "{{\n}}"},
++	{"newline in pipeline", "{{\n\"x\"\n|\nprintf\n}}", noError, `{{"x" | printf}}`},
++	{"newline in comment", "{{/*\nhello\n*/}}", noError, ""},
++	{"newline in comment", "{{-\n/*\nhello\n*/\n-}}", noError, ""},
++
+	// Errors.
+	{"unclosed action", "hello{{range", hasError, ""},
+	{"unmatched end", "{{end}}", hasError, ""},
+@@ -426,23 +433,38 @@ var errorTests = []parseTest{
+	// Check line numbers are accurate.
+	{"unclosed1",
+		"line1\n{{",
+-		hasError, `unclosed1:2: unexpected unclosed action in command`},
++		hasError, `unclosed1:2: unclosed action`},
+	{"unclosed2",
+		"line1\n{{define `x`}}line2\n{{",
+-		hasError, `unclosed2:3: unexpected unclosed action in command`},
++		hasError, `unclosed2:3: unclosed action`},
++	{"unclosed3",
++		"line1\n{{\"x\"\n\"y\"\n",
++		hasError, `unclosed3:4: unclosed action started at unclosed3:2`},
++	{"unclosed4",
++		"{{\n\n\n\n\n",
++		hasError, `unclosed4:6: unclosed action started at unclosed4:1`},
++	{"var1",
++		"line1\n{{\nx\n}}",
++		hasError, `var1:3: function "x" not defined`},
+	// Specific errors.
+	{"function",
+		"{{foo}}",
+		hasError, `function "foo" not defined`},
+-	{"comment",
++	{"comment1",
+		"{{/*}}",
+-		hasError, `unclosed comment`},
++		hasError, `comment1:1: unclosed comment`},
++	{"comment2",
++		"{{/*\nhello\n}}",
++		hasError, `comment2:1: unclosed comment`},
+	{"lparen",
+		"{{.X (1 2 3}}",
+		hasError, `unclosed left paren`},
+	{"rparen",
+-		"{{.X 1 2 3)}}",
+-		hasError, `unexpected ")"`},
++		"{{.X 1 2 3 ) }}",
++		hasError, `unexpected ")" in command`},
++	{"rparen2",
++		"{{(.X 1 2 3",
++		hasError, `unclosed action`},
+	{"space",
+		"{{`x`3}}",
+		hasError, `in operand`},
+@@ -488,7 +510,7 @@ var errorTests = []parseTest{
+		hasError, `missing value for parenthesized pipeline`},
+	{"multilinerawstring",
+		"{{ $v := `\n` }} {{",
+-		hasError, `multilinerawstring:2: unexpected unclosed action`},
++		hasError, `multilinerawstring:2: unclosed action`},
+	{"rangeundefvar",
+		"{{range $k}}{{end}}",
+		hasError, `undefined variable`},
+--
+2.7.4
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch
new file mode 100644
index 0000000000..fc38929648
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch
@@ -0,0 +1,585 @@
+From e0e6bca6ddc0e6d9fa3a5b644af9b446924fbf83 Mon Sep 17 00:00:00 2001
+From: Russ Cox <rsc@golang.org>
+Date: Thu, 20 May 2021 12:46:33 -0400
+Subject: [PATCH 5/6] html/template, text/template: implement break and
+ continue for range loops
+
+Break and continue for range loops was accepted as a proposal in June 2017.
+It was implemented in CL 66410 (Oct 2017)
+but then rolled back in CL 92155 (Feb 2018)
+because html/template changes had not been implemented.
+
+This CL reimplements break and continue in text/template
+and then adds support for them in html/template as well.
+
+Fixes #20531.
+
+Change-Id: I05330482a976f1c078b4b49c2287bd9031bb7616
+Reviewed-on: https://go-review.googlesource.com/c/go/+/321491
+Trust: Russ Cox <rsc@golang.org>
+Run-TryBot: Russ Cox <rsc@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-by: Rob Pike <r@golang.org>
+
+Dependency Patch #5
+
+Upstream-Status: Backport from https://github.com/golang/go/commit/d0dd26a88c019d54f22463daae81e785f5867565
+CVE: CVE-2023-24538
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ src/html/template/context.go          |  4 ++
+ src/html/template/escape.go           | 71 ++++++++++++++++++++++++++++++++++-
+ src/html/template/escape_test.go      | 24 ++++++++++++
+ src/text/template/doc.go              |  8 ++++
+ src/text/template/exec.go             | 24 +++++++++++-
+ src/text/template/exec_test.go        |  2 +
+ src/text/template/parse/lex.go        | 13 ++++++-
+ src/text/template/parse/lex_test.go   |  2 +
+ src/text/template/parse/node.go       | 36 ++++++++++++++++++
+ src/text/template/parse/parse.go      | 42 ++++++++++++++++++++-
+ src/text/template/parse/parse_test.go |  8 ++++
+ 11 files changed, 230 insertions(+), 4 deletions(-)
+
+diff --git a/src/html/template/context.go b/src/html/template/context.go
+index f7d4849..aaa7d08 100644
+--- a/src/html/template/context.go
++++ b/src/html/template/context.go
+@@ -6,6 +6,7 @@ package template
+
+ import (
+	"fmt"
++	"text/template/parse"
+ )
+
+ // context describes the state an HTML parser must be in when it reaches the
+@@ -22,6 +23,7 @@ type context struct {
+	jsCtx   jsCtx
+	attr    attr
+	element element
++	n       parse.Node // for range break/continue
+	err     *Error
+ }
+
+@@ -141,6 +143,8 @@ const (
+	// stateError is an infectious error state outside any valid
+	// HTML/CSS/JS construct.
+	stateError
++	// stateDead marks unreachable code after a {{break}} or {{continue}}.
++	stateDead
+ )
+
+ // isComment is true for any state that contains content meant for template
+diff --git a/src/html/template/escape.go b/src/html/template/escape.go
+index 8739735..6dea79c 100644
+--- a/src/html/template/escape.go
++++ b/src/html/template/escape.go
+@@ -97,6 +97,15 @@ type escaper struct {
+	actionNodeEdits   map[*parse.ActionNode][]string
+	templateNodeEdits map[*parse.TemplateNode]string
+	textNodeEdits     map[*parse.TextNode][]byte
++	// rangeContext holds context about the current range loop.
++	rangeContext *rangeContext
++}
++
++// rangeContext holds information about the current range loop.
++type rangeContext struct {
++	outer     *rangeContext // outer loop
++	breaks    []context     // context at each break action
++	continues []context     // context at each continue action
+ }
+
+ // makeEscaper creates a blank escaper for the given set.
+@@ -109,6 +118,7 @@ func makeEscaper(n *nameSpace) escaper {
+		map[*parse.ActionNode][]string{},
+		map[*parse.TemplateNode]string{},
+		map[*parse.TextNode][]byte{},
++		nil,
+	}
+ }
+
+@@ -124,8 +134,16 @@ func (e *escaper) escape(c context, n parse.Node) context {
+	switch n := n.(type) {
+	case *parse.ActionNode:
+		return e.escapeAction(c, n)
++	case *parse.BreakNode:
++		c.n = n
++		e.rangeContext.breaks = append(e.rangeContext.breaks, c)
++		return context{state: stateDead}
+	case *parse.CommentNode:
+		return c
++	case *parse.ContinueNode:
++		c.n = n
++		e.rangeContext.continues = append(e.rangeContext.breaks, c)
++		return context{state: stateDead}
+	case *parse.IfNode:
+		return e.escapeBranch(c, &n.BranchNode, "if")
+	case *parse.ListNode:
+@@ -427,6 +445,12 @@ func join(a, b context, node parse.Node, nodeName string) context {
+	if b.state == stateError {
+		return b
+	}
++	if a.state == stateDead {
++		return b
++	}
++	if b.state == stateDead {
++		return a
++	}
+	if a.eq(b) {
+		return a
+	}
+@@ -466,14 +490,27 @@ func join(a, b context, node parse.Node, nodeName string) context {
+
+ // escapeBranch escapes a branch template node: "if", "range" and "with".
+ func (e *escaper) escapeBranch(c context, n *parse.BranchNode, nodeName string) context {
++	if nodeName == "range" {
++		e.rangeContext = &rangeContext{outer: e.rangeContext}
++	}
+	c0 := e.escapeList(c, n.List)
+-	if nodeName == "range" && c0.state != stateError {
++	if nodeName == "range" {
++		if c0.state != stateError {
++			c0 = joinRange(c0, e.rangeContext)
++		}
++		e.rangeContext = e.rangeContext.outer
++		if c0.state == stateError {
++			return c0
++		}
++
+		// The "true" branch of a "range" node can execute multiple times.
+		// We check that executing n.List once results in the same context
+		// as executing n.List twice.
++		e.rangeContext = &rangeContext{outer: e.rangeContext}
+		c1, _ := e.escapeListConditionally(c0, n.List, nil)
+		c0 = join(c0, c1, n, nodeName)
+		if c0.state == stateError {
++			e.rangeContext = e.rangeContext.outer
+			// Make clear that this is a problem on loop re-entry
+			// since developers tend to overlook that branch when
+			// debugging templates.
+@@ -481,11 +518,39 @@ func (e *escaper) escapeBranch(c context, n *parse.BranchNode, nodeName string)
+			c0.err.Description = "on range loop re-entry: " + c0.err.Description
+			return c0
+		}
++		c0 = joinRange(c0, e.rangeContext)
++		e.rangeContext = e.rangeContext.outer
++		if c0.state == stateError {
++			return c0
++		}
+	}
+	c1 := e.escapeList(c, n.ElseList)
+	return join(c0, c1, n, nodeName)
+ }
+
++func joinRange(c0 context, rc *rangeContext) context {
++	// Merge contexts at break and continue statements into overall body context.
++	// In theory we could treat breaks differently from continues, but for now it is
++	// enough to treat them both as going back to the start of the loop (which may then stop).
++	for _, c := range rc.breaks {
++		c0 = join(c0, c, c.n, "range")
++		if c0.state == stateError {
++			c0.err.Line = c.n.(*parse.BreakNode).Line
++			c0.err.Description = "at range loop break: " + c0.err.Description
++			return c0
++		}
++	}
++	for _, c := range rc.continues {
++		c0 = join(c0, c, c.n, "range")
++		if c0.state == stateError {
++			c0.err.Line = c.n.(*parse.ContinueNode).Line
++			c0.err.Description = "at range loop continue: " + c0.err.Description
++			return c0
++		}
++	}
++	return c0
++}
++
+ // escapeList escapes a list template node.
+ func (e *escaper) escapeList(c context, n *parse.ListNode) context {
+	if n == nil {
+@@ -493,6 +558,9 @@ func (e *escaper) escapeList(c context, n *parse.ListNode) context {
+	}
+	for _, m := range n.Nodes {
+		c = e.escape(c, m)
++		if c.state == stateDead {
++			break
++		}
+	}
+	return c
+ }
+@@ -503,6 +571,7 @@ func (e *escaper) escapeList(c context, n *parse.ListNode) context {
+ // which is the same as whether e was updated.
+ func (e *escaper) escapeListConditionally(c context, n *parse.ListNode, filter func(*escaper, context) bool) (context, bool) {
+	e1 := makeEscaper(e.ns)
++	e1.rangeContext = e.rangeContext
+	// Make type inferences available to f.
+	for k, v := range e.output {
+		e1.output[k] = v
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index c709660..fa2b84a 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -920,6 +920,22 @@ func TestErrors(t *testing.T) {
+			"<a href='/foo?{{range .Items}}&{{.K}}={{.V}}{{end}}'>",
+			"",
+		},
++		{
++			"{{range .Items}}<a{{if .X}}{{end}}>{{end}}",
++			"",
++		},
++		{
++			"{{range .Items}}<a{{if .X}}{{end}}>{{continue}}{{end}}",
++			"",
++		},
++		{
++			"{{range .Items}}<a{{if .X}}{{end}}>{{break}}{{end}}",
++			"",
++		},
++		{
++			"{{range .Items}}<a{{if .X}}{{end}}>{{if .X}}{{break}}{{end}}{{end}}",
++			"",
++		},
+		// Error cases.
+		{
+			"{{if .Cond}}<a{{end}}",
+@@ -956,6 +972,14 @@ func TestErrors(t *testing.T) {
+			"z:2:8: on range loop re-entry: {{range}} branches",
+		},
+		{
++			"{{range .Items}}<a{{if .X}}{{break}}{{end}}>{{end}}",
++			"z:1:29: at range loop break: {{range}} branches end in different contexts",
++		},
++		{
++			"{{range .Items}}<a{{if .X}}{{continue}}{{end}}>{{end}}",
++			"z:1:29: at range loop continue: {{range}} branches end in different contexts",
++		},
++		{
+			"<a b=1 c={{.H}}",
+			"z: ends in a non-text context: {stateAttr delimSpaceOrTagEnd",
+		},
+diff --git a/src/text/template/doc.go b/src/text/template/doc.go
+index 7b30294..0228b15 100644
+--- a/src/text/template/doc.go
++++ b/src/text/template/doc.go
+@@ -112,6 +112,14 @@ data, defined in detail in the corresponding sections that follow.
+		T0 is executed; otherwise, dot is set to the successive elements
+		of the array, slice, or map and T1 is executed.
+
++	{{break}}
++		The innermost {{range pipeline}} loop is ended early, stopping the
++		current iteration and bypassing all remaining iterations.
++
++	{{continue}}
++		The current iteration of the innermost {{range pipeline}} loop is
++		stopped, and the loop starts the next iteration.
++
+	{{template "name"}}
+		The template with the specified name is executed with nil data.
+
+diff --git a/src/text/template/exec.go b/src/text/template/exec.go
+index 7ac5175..6cb140a 100644
+--- a/src/text/template/exec.go
++++ b/src/text/template/exec.go
+@@ -5,6 +5,7 @@
+ package template
+
+ import (
++	"errors"
+	"fmt"
+	"internal/fmtsort"
+	"io"
+@@ -244,6 +245,12 @@ func (t *Template) DefinedTemplates() string {
+	return b.String()
+ }
+
++// Sentinel errors for use with panic to signal early exits from range loops.
++var (
++	walkBreak    = errors.New("break")
++	walkContinue = errors.New("continue")
++)
++
+ // Walk functions step through the major pieces of the template structure,
+ // generating output as they go.
+ func (s *state) walk(dot reflect.Value, node parse.Node) {
+@@ -256,7 +263,11 @@ func (s *state) walk(dot reflect.Value, node parse.Node) {
+		if len(node.Pipe.Decl) == 0 {
+			s.printValue(node, val)
+		}
++	case *parse.BreakNode:
++		panic(walkBreak)
+	case *parse.CommentNode:
++	case *parse.ContinueNode:
++		panic(walkContinue)
+	case *parse.IfNode:
+		s.walkIfOrWith(parse.NodeIf, dot, node.Pipe, node.List, node.ElseList)
+	case *parse.ListNode:
+@@ -335,6 +346,11 @@ func isTrue(val reflect.Value) (truth, ok bool) {
+
+ func (s *state) walkRange(dot reflect.Value, r *parse.RangeNode) {
+	s.at(r)
++	defer func() {
++		if r := recover(); r != nil && r != walkBreak {
++			panic(r)
++		}
++	}()
+	defer s.pop(s.mark())
+	val, _ := indirect(s.evalPipeline(dot, r.Pipe))
+	// mark top of stack before any variables in the body are pushed.
+@@ -348,8 +364,14 @@ func (s *state) walkRange(dot reflect.Value, r *parse.RangeNode) {
+		if len(r.Pipe.Decl) > 1 {
+			s.setTopVar(2, index)
+		}
++		defer s.pop(mark)
++		defer func() {
++			// Consume panic(walkContinue)
++			if r := recover(); r != nil && r != walkContinue {
++				panic(r)
++			}
++		}()
+		s.walk(elem, r.List)
+-		s.pop(mark)
+	}
+	switch val.Kind() {
+	case reflect.Array, reflect.Slice:
+diff --git a/src/text/template/exec_test.go b/src/text/template/exec_test.go
+index 3309b33..a639f44 100644
+--- a/src/text/template/exec_test.go
++++ b/src/text/template/exec_test.go
+@@ -563,6 +563,8 @@ var execTests = []execTest{
+	{"range empty no else", "{{range .SIEmpty}}-{{.}}-{{end}}", "", tVal, true},
+	{"range []int else", "{{range .SI}}-{{.}}-{{else}}EMPTY{{end}}", "-3--4--5-", tVal, true},
+	{"range empty else", "{{range .SIEmpty}}-{{.}}-{{else}}EMPTY{{end}}", "EMPTY", tVal, true},
++	{"range []int break else", "{{range .SI}}-{{.}}-{{break}}NOTREACHED{{else}}EMPTY{{end}}", "-3-", tVal, true},
++	{"range []int continue else", "{{range .SI}}-{{.}}-{{continue}}NOTREACHED{{else}}EMPTY{{end}}", "-3--4--5-", tVal, true},
+	{"range []bool", "{{range .SB}}-{{.}}-{{end}}", "-true--false-", tVal, true},
+	{"range []int method", "{{range .SI | .MAdd .I}}-{{.}}-{{end}}", "-20--21--22-", tVal, true},
+	{"range map", "{{range .MSI}}-{{.}}-{{end}}", "-1--3--2-", tVal, true},
+diff --git a/src/text/template/parse/lex.go b/src/text/template/parse/lex.go
+index 6784071..95e3377 100644
+--- a/src/text/template/parse/lex.go
++++ b/src/text/template/parse/lex.go
+@@ -62,6 +62,8 @@ const (
+	// Keywords appear after all the rest.
+	itemKeyword  // used only to delimit the keywords
+	itemBlock    // block keyword
++	itemBreak    // break keyword
++	itemContinue // continue keyword
+	itemDot      // the cursor, spelled '.'
+	itemDefine   // define keyword
+	itemElse     // else keyword
+@@ -76,6 +78,8 @@ const (
+ var key = map[string]itemType{
+	".":        itemDot,
+	"block":    itemBlock,
++	"break":    itemBreak,
++	"continue": itemContinue,
+	"define":   itemDefine,
+	"else":     itemElse,
+	"end":      itemEnd,
+@@ -119,6 +123,8 @@ type lexer struct {
+	parenDepth  int       // nesting depth of ( ) exprs
+	line        int       // 1+number of newlines seen
+	startLine   int       // start line of this item
++	breakOK     bool      // break keyword allowed
++	continueOK  bool      // continue keyword allowed
+ }
+
+ // next returns the next rune in the input.
+@@ -461,7 +467,12 @@ Loop:
+			}
+			switch {
+			case key[word] > itemKeyword:
+-				l.emit(key[word])
++				item := key[word]
++				if item == itemBreak && !l.breakOK || item == itemContinue && !l.continueOK {
++					l.emit(itemIdentifier)
++				} else {
++					l.emit(item)
++				}
+			case word[0] == '.':
+				l.emit(itemField)
+			case word == "true", word == "false":
+diff --git a/src/text/template/parse/lex_test.go b/src/text/template/parse/lex_test.go
+index 6510eed..df6aabf 100644
+--- a/src/text/template/parse/lex_test.go
++++ b/src/text/template/parse/lex_test.go
+@@ -35,6 +35,8 @@ var itemName = map[itemType]string{
+	// keywords
+	itemDot:      ".",
+	itemBlock:    "block",
++	itemBreak:    "break",
++	itemContinue: "continue",
+	itemDefine:   "define",
+	itemElse:     "else",
+	itemIf:       "if",
+diff --git a/src/text/template/parse/node.go b/src/text/template/parse/node.go
+index a9dad5e..c398da0 100644
+--- a/src/text/template/parse/node.go
++++ b/src/text/template/parse/node.go
+@@ -71,6 +71,8 @@ const (
+	NodeVariable                   // A $ variable.
+	NodeWith                       // A with action.
+	NodeComment                    // A comment.
++	NodeBreak                      // A break action.
++	NodeContinue                   // A continue action.
+ )
+
+ // Nodes.
+@@ -907,6 +909,40 @@ func (i *IfNode) Copy() Node {
+	return i.tr.newIf(i.Pos, i.Line, i.Pipe.CopyPipe(), i.List.CopyList(), i.ElseList.CopyList())
+ }
+
++// BreakNode represents a {{break}} action.
++type BreakNode struct {
++	tr *Tree
++	NodeType
++	Pos
++	Line int
++}
++
++func (t *Tree) newBreak(pos Pos, line int) *BreakNode {
++	return &BreakNode{tr: t, NodeType: NodeBreak, Pos: pos, Line: line}
++}
++
++func (b *BreakNode) Copy() Node                  { return b.tr.newBreak(b.Pos, b.Line) }
++func (b *BreakNode) String() string              { return "{{break}}" }
++func (b *BreakNode) tree() *Tree                 { return b.tr }
++func (b *BreakNode) writeTo(sb *strings.Builder) { sb.WriteString("{{break}}") }
++
++// ContinueNode represents a {{continue}} action.
++type ContinueNode struct {
++	tr *Tree
++	NodeType
++	Pos
++	Line int
++}
++
++func (t *Tree) newContinue(pos Pos, line int) *ContinueNode {
++	return &ContinueNode{tr: t, NodeType: NodeContinue, Pos: pos, Line: line}
++}
++
++func (c *ContinueNode) Copy() Node                  { return c.tr.newContinue(c.Pos, c.Line) }
++func (c *ContinueNode) String() string              { return "{{continue}}" }
++func (c *ContinueNode) tree() *Tree                 { return c.tr }
++func (c *ContinueNode) writeTo(sb *strings.Builder) { sb.WriteString("{{continue}}") }
++
+ // RangeNode represents a {{range}} action and its commands.
+ type RangeNode struct {
+	BranchNode
+diff --git a/src/text/template/parse/parse.go b/src/text/template/parse/parse.go
+index 5e6e512..7f78b56 100644
+--- a/src/text/template/parse/parse.go
++++ b/src/text/template/parse/parse.go
+@@ -31,6 +31,7 @@ type Tree struct {
+	vars       []string // variables defined at the moment.
+	treeSet    map[string]*Tree
+	actionLine int // line of left delim starting action
++	rangeDepth int
+	mode       Mode
+ }
+
+@@ -223,6 +224,8 @@ func (t *Tree) startParse(funcs []map[string]interface{}, lex *lexer, treeSet ma
+	t.vars = []string{"$"}
+	t.funcs = funcs
+	t.treeSet = treeSet
++	lex.breakOK = !t.hasFunction("break")
++	lex.continueOK = !t.hasFunction("continue")
+ }
+
+ // stopParse terminates parsing.
+@@ -385,6 +388,10 @@ func (t *Tree) action() (n Node) {
+	switch token := t.nextNonSpace(); token.typ {
+	case itemBlock:
+		return t.blockControl()
++	case itemBreak:
++		return t.breakControl(token.pos, token.line)
++	case itemContinue:
++		return t.continueControl(token.pos, token.line)
+	case itemElse:
+		return t.elseControl()
+	case itemEnd:
+@@ -404,6 +411,32 @@ func (t *Tree) action() (n Node) {
+	return t.newAction(token.pos, token.line, t.pipeline("command", itemRightDelim))
+ }
+
++// Break:
++//	{{break}}
++// Break keyword is past.
++func (t *Tree) breakControl(pos Pos, line int) Node {
++	if token := t.next(); token.typ != itemRightDelim {
++		t.unexpected(token, "in {{break}}")
++	}
++	if t.rangeDepth == 0 {
++		t.errorf("{{break}} outside {{range}}")
++	}
++	return t.newBreak(pos, line)
++}
++
++// Continue:
++//	{{continue}}
++// Continue keyword is past.
++func (t *Tree) continueControl(pos Pos, line int) Node {
++	if token := t.next(); token.typ != itemRightDelim {
++		t.unexpected(token, "in {{continue}}")
++	}
++	if t.rangeDepth == 0 {
++		t.errorf("{{continue}} outside {{range}}")
++	}
++	return t.newContinue(pos, line)
++}
++
+ // Pipeline:
+ //	declarations? command ('|' command)*
+ func (t *Tree) pipeline(context string, end itemType) (pipe *PipeNode) {
+@@ -479,8 +512,14 @@ func (t *Tree) checkPipeline(pipe *PipeNode, context string) {
+ func (t *Tree) parseControl(allowElseIf bool, context string) (pos Pos, line int, pipe *PipeNode, list, elseList *ListNode) {
+	defer t.popVars(len(t.vars))
+	pipe = t.pipeline(context, itemRightDelim)
++	if context == "range" {
++		t.rangeDepth++
++	}
+	var next Node
+	list, next = t.itemList()
++	if context == "range" {
++		t.rangeDepth--
++	}
+	switch next.Type() {
+	case nodeEnd: //done
+	case nodeElse:
+@@ -522,7 +561,8 @@ func (t *Tree) ifControl() Node {
+ //	{{range pipeline}} itemList {{else}} itemList {{end}}
+ // Range keyword is past.
+ func (t *Tree) rangeControl() Node {
+-	return t.newRange(t.parseControl(false, "range"))
++	r := t.newRange(t.parseControl(false, "range"))
++	return r
+ }
+
+ // With:
+diff --git a/src/text/template/parse/parse_test.go b/src/text/template/parse/parse_test.go
+index 220f984..ba45636 100644
+--- a/src/text/template/parse/parse_test.go
++++ b/src/text/template/parse/parse_test.go
+@@ -230,6 +230,10 @@ var parseTests = []parseTest{
+		`{{range $x := .SI}}{{.}}{{end}}`},
+	{"range 2 vars", "{{range $x, $y := .SI}}{{.}}{{end}}", noError,
+		`{{range $x, $y := .SI}}{{.}}{{end}}`},
++	{"range with break", "{{range .SI}}{{.}}{{break}}{{end}}", noError,
++		`{{range .SI}}{{.}}{{break}}{{end}}`},
++	{"range with continue", "{{range .SI}}{{.}}{{continue}}{{end}}", noError,
++		`{{range .SI}}{{.}}{{continue}}{{end}}`},
+	{"constants", "{{range .SI 1 -3.2i true false 'a' nil}}{{end}}", noError,
+		`{{range .SI 1 -3.2i true false 'a' nil}}{{end}}`},
+	{"template", "{{template `x`}}", noError,
+@@ -279,6 +283,10 @@ var parseTests = []parseTest{
+	{"adjacent args", "{{printf 3`x`}}", hasError, ""},
+	{"adjacent args with .", "{{printf `x`.}}", hasError, ""},
+	{"extra end after if", "{{if .X}}a{{else if .Y}}b{{end}}{{end}}", hasError, ""},
++	{"break outside range", "{{range .}}{{end}} {{break}}", hasError, ""},
++	{"continue outside range", "{{range .}}{{end}} {{continue}}", hasError, ""},
++	{"break in range else", "{{range .}}{{else}}{{break}}{{end}}", hasError, ""},
++	{"continue in range else", "{{range .}}{{else}}{{continue}}{{end}}", hasError, ""},
+	// Other kinds of assignments and operators aren't available yet.
+	{"bug0a", "{{$x := 0}}{{$x}}", noError, "{{$x := 0}}{{$x}}"},
+	{"bug0b", "{{$x += 1}}{{$x}}", hasError, ""},
+--
+2.7.4
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.patch
similarity index 53%
rename from meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch
rename to meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.patch
index d5bb33e091..baf400b891 100644
--- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.patch
@@ -1,7 +1,7 @@
 From 16f4882984569f179d73967c9eee679bb9b098c5 Mon Sep 17 00:00:00 2001
 From: Roland Shoemaker <bracewell@google.com>
 Date: Mon, 20 Mar 2023 11:01:13 -0700
-Subject: [PATCH 3/3] html/template: disallow actions in JS template literals
+Subject: [PATCH 6/6] html/template: disallow actions in JS template literals
 
 ECMAScript 6 introduced template literals[0][1] which are delimited with
 backticks. These need to be escaped in a similar fashion to the
@@ -52,12 +52,15 @@ CVE: CVE-2023-24538
 Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
 ---
  src/html/template/context.go      |  2 ++
- src/html/template/error.go        | 13 +++++++++++++
- src/html/template/escape.go       | 11 +++++++++++
+ src/html/template/error.go        | 13 ++++++++
+ src/html/template/escape.go       | 11 +++++++
+ src/html/template/escape_test.go  | 66 ++++++++++++++++++++++-----------------
  src/html/template/js.go           |  2 ++
- src/html/template/jsctx_string.go |  9 +++++++++
- src/html/template/transition.go   |  7 ++++++-
- 6 files changed, 43 insertions(+), 1 deletion(-)
+ src/html/template/js_test.go      |  2 +-
+ src/html/template/jsctx_string.go |  9 ++++++
+ src/html/template/state_string.go | 37 ++++++++++++++++++++--
+ src/html/template/transition.go   |  7 ++++-
+ 9 files changed, 116 insertions(+), 33 deletions(-)
 
 diff --git a/src/html/template/context.go b/src/html/template/context.go
 index f7d4849..0b65313 100644
@@ -125,6 +128,104 @@ index f12dafa..29ca5b3 100644
 	case stateJSRegexp:
 		s = append(s, "_html_template_jsregexpescaper")
 	case stateCSS:
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index fa2b84a..1b150e9 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -681,35 +681,31 @@ func TestEscape(t *testing.T) {
+	}
+
+	for _, test := range tests {
+-		tmpl := New(test.name)
+-		tmpl = Must(tmpl.Parse(test.input))
+-		// Check for bug 6459: Tree field was not set in Parse.
+-		if tmpl.Tree != tmpl.text.Tree {
+-			t.Errorf("%s: tree not set properly", test.name)
+-			continue
+-		}
+-		b := new(bytes.Buffer)
+-		if err := tmpl.Execute(b, data); err != nil {
+-			t.Errorf("%s: template execution failed: %s", test.name, err)
+-			continue
+-		}
+-		if w, g := test.output, b.String(); w != g {
+-			t.Errorf("%s: escaped output: want\n\t%q\ngot\n\t%q", test.name, w, g)
+-			continue
+-		}
+-		b.Reset()
+-		if err := tmpl.Execute(b, pdata); err != nil {
+-			t.Errorf("%s: template execution failed for pointer: %s", test.name, err)
+-			continue
+-		}
+-		if w, g := test.output, b.String(); w != g {
+-			t.Errorf("%s: escaped output for pointer: want\n\t%q\ngot\n\t%q", test.name, w, g)
+-			continue
+-		}
+-		if tmpl.Tree != tmpl.text.Tree {
+-			t.Errorf("%s: tree mismatch", test.name)
+-			continue
+-		}
++		t.Run(test.name, func(t *testing.T) {
++			tmpl := New(test.name)
++			tmpl = Must(tmpl.Parse(test.input))
++			// Check for bug 6459: Tree field was not set in Parse.
++			if tmpl.Tree != tmpl.text.Tree {
++				t.Fatalf("%s: tree not set properly", test.name)
++			}
++			b := new(strings.Builder)
++			if err := tmpl.Execute(b, data); err != nil {
++				t.Fatalf("%s: template execution failed: %s", test.name, err)
++			}
++			if w, g := test.output, b.String(); w != g {
++				t.Fatalf("%s: escaped output: want\n\t%q\ngot\n\t%q", test.name, w, g)
++			}
++			b.Reset()
++			if err := tmpl.Execute(b, pdata); err != nil {
++				t.Fatalf("%s: template execution failed for pointer: %s", test.name, err)
++			}
++			if w, g := test.output, b.String(); w != g {
++				t.Fatalf("%s: escaped output for pointer: want\n\t%q\ngot\n\t%q", test.name, w, g)
++			}
++			if tmpl.Tree != tmpl.text.Tree {
++				t.Fatalf("%s: tree mismatch", test.name)
++			}
++		})
+	}
+ }
+
+@@ -936,6 +932,10 @@ func TestErrors(t *testing.T) {
+			"{{range .Items}}<a{{if .X}}{{end}}>{{if .X}}{{break}}{{end}}{{end}}",
+			"",
+		},
++		{
++			"<script>var a = `${a+b}`</script>`",
++			"",
++		},
+		// Error cases.
+		{
+			"{{if .Cond}}<a{{end}}",
+@@ -1082,6 +1082,10 @@ func TestErrors(t *testing.T) {
+			// html is allowed since it is the last command in the pipeline, but urlquery is not.
+			`predefined escaper "urlquery" disallowed in template`,
+		},
++		{
++			"<script>var tmpl = `asd {{.}}`;</script>",
++			`{{.}} appears in a JS template literal`,
++		},
+	}
+	for _, test := range tests {
+		buf := new(bytes.Buffer)
+@@ -1304,6 +1308,10 @@ func TestEscapeText(t *testing.T) {
+			context{state: stateJSSqStr, delim: delimDoubleQuote, attr: attrScript},
+		},
+		{
++			"<a onclick=\"`foo",
++			context{state: stateJSBqStr, delim: delimDoubleQuote, attr: attrScript},
++		},
++		{
+			`<A ONCLICK="'`,
+			context{state: stateJSSqStr, delim: delimDoubleQuote, attr: attrScript},
+		},
 diff --git a/src/html/template/js.go b/src/html/template/js.go
 index ea9c183..b888eaf 100644
 --- a/src/html/template/js.go
@@ -145,6 +246,19 @@ index ea9c183..b888eaf 100644
 	'+':  `\u002b`,
 	'/':  `\/`,
 	'<':  `\u003c`,
+diff --git a/src/html/template/js_test.go b/src/html/template/js_test.go
+index d7ee47b..7d963ae 100644
+--- a/src/html/template/js_test.go
++++ b/src/html/template/js_test.go
+@@ -292,7 +292,7 @@ func TestEscapersOnLower7AndSelectHighCodepoints(t *testing.T) {
+				`0123456789:;\u003c=\u003e?` +
+				`@ABCDEFGHIJKLMNO` +
+				`PQRSTUVWXYZ[\\]^_` +
+-				"`abcdefghijklmno" +
++				"\\u0060abcdefghijklmno" +
+				"pqrstuvwxyz{|}~\u007f" +
+				"\u00A0\u0100\\u2028\\u2029\ufeff\U0001D11E",
+		},
 diff --git a/src/html/template/jsctx_string.go b/src/html/template/jsctx_string.go
 index dd1d87e..2394893 100644
 --- a/src/html/template/jsctx_string.go
@@ -165,6 +279,55 @@ index dd1d87e..2394893 100644
  const _jsCtx_name = "jsCtxRegexpjsCtxDivOpjsCtxUnknown"
 
  var _jsCtx_index = [...]uint8{0, 11, 21, 33}
+diff --git a/src/html/template/state_string.go b/src/html/template/state_string.go
+index 05104be..6fb1a6e 100644
+--- a/src/html/template/state_string.go
++++ b/src/html/template/state_string.go
+@@ -4,9 +4,42 @@ package template
+
+ import "strconv"
+
+-const _state_name = "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateError"
++func _() {
++	// An "invalid array index" compiler error signifies that the constant values have changed.
++	// Re-run the stringer command to generate them again.
++	var x [1]struct{}
++	_ = x[stateText-0]
++	_ = x[stateTag-1]
++	_ = x[stateAttrName-2]
++	_ = x[stateAfterName-3]
++	_ = x[stateBeforeValue-4]
++	_ = x[stateHTMLCmt-5]
++	_ = x[stateRCDATA-6]
++	_ = x[stateAttr-7]
++	_ = x[stateURL-8]
++	_ = x[stateSrcset-9]
++	_ = x[stateJS-10]
++	_ = x[stateJSDqStr-11]
++	_ = x[stateJSSqStr-12]
++	_ = x[stateJSBqStr-13]
++	_ = x[stateJSRegexp-14]
++	_ = x[stateJSBlockCmt-15]
++	_ = x[stateJSLineCmt-16]
++	_ = x[stateCSS-17]
++	_ = x[stateCSSDqStr-18]
++	_ = x[stateCSSSqStr-19]
++	_ = x[stateCSSDqURL-20]
++	_ = x[stateCSSSqURL-21]
++	_ = x[stateCSSURL-22]
++	_ = x[stateCSSBlockCmt-23]
++	_ = x[stateCSSLineCmt-24]
++	_ = x[stateError-25]
++	_ = x[stateDead-26]
++}
++
++const _state_name = "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead"
+
+-var _state_index = [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 286, 296}
++var _state_index = [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 243, 256, 267, 283, 298, 308, 317}
+
+ func (i state) String() string {
+	if i >= state(len(_state_index)-1) {
 diff --git a/src/html/template/transition.go b/src/html/template/transition.go
 index 06df679..92eb351 100644
 --- a/src/html/template/transition.go
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
index 20e70c0485..00def8fcda 100644
--- a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
@@ -34,9 +34,9 @@ Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
  src/html/template/context.go      |  6 ++-
  src/html/template/escape.go       |  5 +-
  src/html/template/escape_test.go  | 10 ++++
- src/html/template/state_string.go |  4 +-
+ src/html/template/state_string.go | 26 +++++-----
  src/html/template/transition.go   | 80 ++++++++++++++++++++-----------
- 5 files changed, 72 insertions(+), 33 deletions(-)
+ 5 files changed, 84 insertions(+), 43 deletions(-)
 
 diff --git a/src/html/template/context.go b/src/html/template/context.go
 index 0b65313..4eb7891 100644
@@ -105,14 +105,38 @@ diff --git a/src/html/template/state_string.go b/src/html/template/state_string.
 index 05104be..b5cfe70 100644
 --- a/src/html/template/state_string.go
 +++ b/src/html/template/state_string.go
-@@ -4,9 +4,9 @@ package template
- 
- import "strconv"
+@@ -25,21 +25,23 @@ func _() {
+ 	_ = x[stateJSRegexp-14]
+ 	_ = x[stateJSBlockCmt-15]
+ 	_ = x[stateJSLineCmt-16]
+-	_ = x[stateCSS-17]
+-	_ = x[stateCSSDqStr-18]
+-	_ = x[stateCSSSqStr-19]
+-	_ = x[stateCSSDqURL-20]
+-	_ = x[stateCSSSqURL-21]
+-	_ = x[stateCSSURL-22]
+-	_ = x[stateCSSBlockCmt-23]
+-	_ = x[stateCSSLineCmt-24]
+-	_ = x[stateError-25]
+-	_ = x[stateDead-26]
++	_ = x[stateJSHTMLOpenCmt-17]
++	_ = x[stateJSHTMLCloseCmt-18]
++	_ = x[stateCSS-19]
++	_ = x[stateCSSDqStr-20]
++	_ = x[stateCSSSqStr-21]
++	_ = x[stateCSSDqURL-22]
++	_ = x[stateCSSSqURL-23]
++	_ = x[stateCSSURL-24]
++	_ = x[stateCSSBlockCmt-25]
++	_ = x[stateCSSLineCmt-26]
++	_ = x[stateError-27]
++	_ = x[stateDead-28]
+ }
  
--const _state_name = "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateError"
+-const _state_name = "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead"
 +const _state_name = "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateJSHTMLOpenCmtstateJSHTMLCloseCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead"
  
--var _state_index = [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 286, 296}
+-var _state_index = [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 243, 256, 267, 283, 298, 308, 317}
 +var _state_index = [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 111, 118, 130, 142, 154, 167, 182, 196, 214, 233, 241, 254, 267, 280, 293, 304, 320, 335, 345, 354}
  
  func (i state) String() string {
-- 
2.34.1


