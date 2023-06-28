Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C107EEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 06:06:45 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.10005.1687932402141488986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 23:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=i8rX7K+B;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b7f2239bfdso33303245ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 23:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687932401; x=1690524401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7GLyHdCDKUlyG5Rusfs1qE8Lbm4Ag6PZn+gJfq3P3fM=;
        b=i8rX7K+BD+q99aAz24BBbdhg6qFcsU7NpeXgsug1chcYM0bdKbt7Yx+YDfPtchnFNO
         8aZiaGrzVZakREtTQxPtXnbSZZFWQGCyea9gDqt3rswM/74gXAw9JaQYr2ClIYJktYV4
         QNIt5cRE1jvISogtMqhkB+zUNP87An3+6x9CE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687932401; x=1690524401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GLyHdCDKUlyG5Rusfs1qE8Lbm4Ag6PZn+gJfq3P3fM=;
        b=fVA/Oc2VJbBjS1ldJwlwxzxkFxXjO9RVAOei6c6kCVRpVoY8My86WZoEpaXUQddQqZ
         /ysRNAnkBFCLnoZO+qF2oc15qOCGpIeF+c6T54kY1+5kk6aEt9/n4WQFSv2OIHQUwx3g
         18MP77SyxyRyKkf9t1PHy9Rgul/2qwZM9rDArT2Sx1M6bwb9ZJEPbjFbKUMotbbZTyU3
         0iFRyeIa8Tgiz7zj/0NnC1g4hSXaB6lMbdTWkexNYf3SUqPca0LE0Npfodlapl68XFTs
         Gw4b1hzDpoU+tmHlQIyieLGThrO8Va/XpGUk0IVE3q8qzIhmxPm6a172BLpgigo+mLTc
         zKGg==
X-Gm-Message-State: AC+VfDwb376SbvLAvE75CyX/f6ztcHJ+smM3pjIwZSs5x1oX61/bgYQh
	yNpXGBFsseCAkYa6qngj4wXPxW9/RcB/CnK2kpI=
X-Google-Smtp-Source: ACHHUZ7GseR1ozYSBzAdPDrnigel4xlAp86PX+SCuSS2NCSExdilrkGr4n5THPpHx9BZd6pFIDLeJA==
X-Received: by 2002:a17:902:eccd:b0:1b5:561a:5c88 with SMTP id a13-20020a170902eccd00b001b5561a5c88mr15510698plh.66.1687932400937;
        Tue, 27 Jun 2023 23:06:40 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.74.131.206])
        by smtp.googlemail.com with ESMTPSA id ji18-20020a170903325200b001b80bc9d8c2sm4058653plb.277.2023.06.27.23.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 23:06:40 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] go: fix CVE-2023-29400 html/template improper handling of empty HTML attributes
Date: Wed, 28 Jun 2023 11:36:22 +0530
Message-Id: <20230628060622.837240-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 06:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183541

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
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
2.25.1


