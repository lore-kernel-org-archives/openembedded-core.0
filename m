Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB676EB64DD
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:06:50 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.26488.1688656003060049598
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=p8R3ccO9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso630060a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656002; x=1691248002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLD/sbt1gaxTrZOdihVDtaa8oH8D9Ny5afU0KIQESgU=;
        b=p8R3ccO9DFWQCujEtHw3/2wmAFwpVtQXR6Zjg8ZZSQwssU/2Z8N9aurn+BEnsKGwSe
         Q5e0a/Jtpl8K1JzPFsnhlo+m687/6iPW7YCetQIB+tCMpkFAST1GWO9Wc2Z/RvTOB9fY
         VeAV54qMzQE9Ox+1PoLMOgZ5QWadPlJbQHW4BDAKYd5AM61CDUBdQpo1lSLfvwlwEr+h
         ninh2yj1g7vx7mlGfoOTqlw68KQ/GAnplzA4418Km0+h4/Fx/2ypDuGUER5q6czO2E1a
         lb6qllDvgAria+ccX4Zg7EhqIC6KOKzotyIkkB8FzY9Om57SQozAG58useNz30ler/4i
         QcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656002; x=1691248002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLD/sbt1gaxTrZOdihVDtaa8oH8D9Ny5afU0KIQESgU=;
        b=WBd78Gu0wHj1fSUdjrrF5nnM1A+Z34DsJEZRvwUVcdMT5Re3b4vozJnO2nj9i/2XcE
         yG5lYNETEz8jI0sPWtVt9w742baJ6AaFbjNzLBihuR/lqz4SriDBba7Nj3Koz9/G/oGt
         KI2ZlKIgG6Od56eMoTgig68HuOietP008o028l/wY2UbVNm9k1dU+socafSNF4Q2Nsfx
         BaEWkiyavJfKHxqCObdIsD5QlZvkjyKRGbDhydQF/F2AbNdasYfSErnrfKcOeu0dOat/
         xHXE0NDomr0HyfKxFsGeG4gZDIRM+6REK0uMDLl7VyxoQ5cM5CBtu7iD/Ol/SXXgADdJ
         oPbQ==
X-Gm-Message-State: ABy/qLYpnSgdwvWXc1M1+x8YNZEQ6Zq3qN3+jciMRX4QAlMM5sIxkR2u
	oFX+Xu+Ggh2brq7FDzWTUgIoFogaHYiagkK/nmg=
X-Google-Smtp-Source: APBJJlHCPCMM+hxgDN6ItEJ8boxxHrqauckKryc/+X4EO6FipYtJGH4isYxNVCCUCM+lE0SBs0Wg8Q==
X-Received: by 2002:a17:903:11ce:b0:1b3:c4c1:ec4f with SMTP id q14-20020a17090311ce00b001b3c4c1ec4fmr3199307plh.37.1688656002048;
        Thu, 06 Jul 2023 08:06:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.06.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:06:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/28] go: fix CVE-2023-29400 html/template improper handling of empty HTML attributes
Date: Thu,  6 Jul 2023 05:06:04 -1000
Message-Id: <3224084a1ca301ff4fb4735ccc80d24aaec13257.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183954

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.18/CVE-2023-29400.patch           | 99 +++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-29400.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 3365075fe5..73921852fc 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -35,6 +35,7 @@ SRC_URI += "\
     file://CVE-2023-29404.patch \
     file://CVE-2023-29405.patch \
     file://CVE-2023-29402.patch \
+    file://CVE-2023-29400.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-29400.patch b/meta/recipes-devtools/go/go-1.18/CVE-2023-29400.patch
new file mode 100644
index 0000000000..04bd1f5fec
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-29400.patch
@@ -0,0 +1,99 @@
+From 9db0e74f606b8afb28cc71d4b1c8b4ed24cabbf5 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Thu, 13 Apr 2023 14:01:50 -0700
+Subject: [PATCH] [release-branch.go1.19] html/template: emit filterFailsafe
+ for empty unquoted attr value
+
+An unquoted action used as an attribute value can result in unsafe
+behavior if it is empty, as HTML normalization will result in unexpected
+attributes, and may allow attribute injection. If executing a template
+results in a empty unquoted attribute value, emit filterFailsafe
+instead.
+
+Thanks to Juho Nurminen of Mattermost for reporting this issue.
+
+For #59722
+Fixes #59815
+Fixes CVE-2023-29400
+
+Change-Id: Ia38d1b536ae2b4af5323a6c6d861e3c057c2570a
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1826631
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1851498
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/491357
+Run-TryBot: Carlos Amedee <carlos@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/9db0e74f606b8afb28cc71d4b1c8b4ed24cabbf5]
+CVE: CVE-2023-29400
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/html/template/escape.go      |  5 ++---
+ src/html/template/escape_test.go | 15 +++++++++++++++
+ src/html/template/html.go        |  3 +++
+ 3 files changed, 20 insertions(+), 3 deletions(-)
+
+diff --git a/src/html/template/escape.go b/src/html/template/escape.go
+index ca078f4..bdccc65 100644
+--- a/src/html/template/escape.go
++++ b/src/html/template/escape.go
+@@ -362,9 +362,8 @@ func normalizeEscFn(e string) string {
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
+index fbc84a7..4f48afe 100644
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
+index 356b829..636bc21 100644
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
+-- 
+2.25.1
+
-- 
2.34.1


