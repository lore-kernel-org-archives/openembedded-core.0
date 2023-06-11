Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD09C77B7A
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 16:03:07 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.39000.1686499377858612571
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 09:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=QDyct8Q2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b025d26f4fso24589655ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 09:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686499377; x=1689091377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GnFcHrqhDHWW4Wc3D5kxM8F4kkAXXAfzLHhcnF+aCI=;
        b=QDyct8Q2V8MestTXTNEaXYLDswu+AWnFS+n9ZY7K3hNm0gPeWQ6y3b21jFJLz1IMh1
         tf7iQ6ZS/JJUK4hordmA60T2Ag6EJGJ7LdbBrsgxfeKMb5WXM5fJM39K25AvUTi2x+0o
         XbGo2da2tFmdKWTWEZjq0vgd6z6FAHXJFTdVX8oF09Ulds+W06BUcRQkbVIQO9Klnng/
         xrOOorJ/xD6S7EMz33xiX1cGCB/N1wfWWwoVTmEdOZ/6Gt2GZIX7ykE+EdKBNpJGXIVG
         CHcqmbJ02Vkn39p2XRJGAKSF4IaamjF2JNyloSAg2TOQsMynwjzvxHjc2WxIZ1cIFNjj
         Yo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686499377; x=1689091377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GnFcHrqhDHWW4Wc3D5kxM8F4kkAXXAfzLHhcnF+aCI=;
        b=Yvgy0yQLqxSS7HAX95OFToiiEaK9kx53Wyghbos9jiMve2zGfzDWbxMeISa2euTb7s
         SngUy4XP9lzdoKjgzB6n5dFCnOSbS56tFSvmjVt8EeONes75hMHjj6RvL5oLgzUQOQAS
         nHHJlsCTUn511J6M33eP4lGQFGFZdtjSlftqZv0TnPz2OAkutRjrQwoKtMSC2/D+ivNZ
         KoH0eMml1sfxqMN5mNG7GblodXol8rFRH5XmpD4axGExnJY2UNanbajg3vSehi7+vmrq
         MIPwjHBsakJlT/48+tX5dfD92BooL/rdaJWNAVOxtzWTfsNDr13i8ts8WBHyOzRbDc/J
         2vkA==
X-Gm-Message-State: AC+VfDwgJPdp0RriVOQANwknCg1bQVvs+QdWz93PYfqOYDWXHmBu/zJ6
	ZRR6vQAbyzv9im3ayUuRS8fbEMAirxXoYQUr36E=
X-Google-Smtp-Source: ACHHUZ7NKwIP/9il/xqwX/hfPYvKDZ3Thijz88zEgLPiv9LpNkC2zin/dYVgtvMPGNVcrPNgjf/3fQ==
X-Received: by 2002:a17:90a:77c4:b0:258:9f25:f258 with SMTP id e4-20020a17090a77c400b002589f25f258mr6728637pjs.12.1686499376856;
        Sun, 11 Jun 2023 09:02:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ix4-20020a170902f80400b001b3d20ef257sm113378plb.97.2023.06.11.09.02.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 09:02:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/11] go: fix CVE-2023-24539 html/template improper sanitization of CSS values
Date: Sun, 11 Jun 2023 06:02:35 -1000
Message-Id: <0a09194f3d4ad98d0cf0d070ec0c99e7a6c8a158.1686499221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686499221.git.steve@sakoman.com>
References: <cover.1686499221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 16:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182624

From: Vivek Kumbhar <vkumbhar@mvista.com>

Angle brackets should not appear in CSS contexts, as they may affect
token boundaries (such as closing a <style> tag, resulting in
injection). Instead emit filterFailsafe, matching the behavior for other
dangerous characters.

Thanks to Juho Nurminen of Mattermost for reporting this issue.

For #59720
Fixes #59811
Fixes CVE-2023-24539

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.18/CVE-2023-24539.patch           | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-24539.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index e5e9d841c4..d430e0669d 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -31,6 +31,7 @@ SRC_URI += "\
     file://CVE-2023-24534.patch \
     file://CVE-2023-24538.patch \
     file://CVE-2023-24540.patch \
+    file://CVE-2023-24539.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-24539.patch b/meta/recipes-devtools/go/go-1.18/CVE-2023-24539.patch
new file mode 100644
index 0000000000..fa19e18264
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-24539.patch
@@ -0,0 +1,53 @@
+From e49282327b05192e46086bf25fd3ac691205fe80 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Thu, 13 Apr 2023 15:40:44 -0700
+Subject: [PATCH] [release-branch.go1.19] html/template: disallow angle
+ brackets in CSS values
+
+Change-Id: Iccc659c9a18415992b0c05c178792228e3a7bae4
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1826636
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1851496
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/491335
+Run-TryBot: Carlos Amedee <carlos@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/e49282327b05192e46086bf25fd3ac691205fe80]
+CVE: CVE-2023-24539
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/html/template/css.go      | 2 +-
+ src/html/template/css_test.go | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/html/template/css.go b/src/html/template/css.go
+index 890a0c6b227fe..f650d8b3e843a 100644
+--- a/src/html/template/css.go
++++ b/src/html/template/css.go
+@@ -238,7 +238,7 @@ func cssValueFilter(args ...any) string {
+ 	// inside a string that might embed JavaScript source.
+ 	for i, c := range b {
+ 		switch c {
+-		case 0, '"', '\'', '(', ')', '/', ';', '@', '[', '\\', ']', '`', '{', '}':
++		case 0, '"', '\'', '(', ')', '/', ';', '@', '[', '\\', ']', '`', '{', '}', '<', '>':
+ 			return filterFailsafe
+ 		case '-':
+ 			// Disallow <!-- or -->.
+diff --git a/src/html/template/css_test.go b/src/html/template/css_test.go
+index a735638b0314f..2b76256a766e9 100644
+--- a/src/html/template/css_test.go
++++ b/src/html/template/css_test.go
+@@ -231,6 +231,8 @@ func TestCSSValueFilter(t *testing.T) {
+ 		{`-exp\000052 ession(alert(1337))`, "ZgotmplZ"},
+ 		{`-expre\0000073sion`, "-expre\x073sion"},
+ 		{`@import url evil.css`, "ZgotmplZ"},
++		{"<", "ZgotmplZ"},
++		{">", "ZgotmplZ"},
+ 	}
+ 	for _, test := range tests {
+ 		got := cssValueFilter(test.css)
-- 
2.34.1


