Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122F7EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 11:23:57 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.10537.1687865032269867025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 04:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=RAq7Mlvi;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b7f223994fso24093155ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 04:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687865031; x=1690457031;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nywb/eii6rIsAwhf/vRRNFra6QXbqgPPQ2Yig8O5qIA=;
        b=RAq7MlviaxOKGLFMjKKt4Zaho9eeDaBpQ/uZUMYolKomE1AYeP9XymaCpKPF1In/dx
         +Xzf4OyEmrui2cK/lY91lqfubmuNvROu1t7TU6Csa3+LIfumHUA+yJgMycJB8ZFeIgtx
         27imSPZ1RayykoxmqY+RR/XpLu1dhPTiak8OU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687865031; x=1690457031;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nywb/eii6rIsAwhf/vRRNFra6QXbqgPPQ2Yig8O5qIA=;
        b=lG1ng0KFyrJla7+W9DaeJF/aEyLy2jACR74NeP7satisz12xwC3drryxHTSl8jsT9M
         EMSAngEqRFPBZ8fcpoKExvsvDBQl17AFd/4hxBmM8RdKOa0IDUuShpkninB9ibQFyaMb
         MR+SoxiWrzrI7tS4p+nu3bRg+0t1R97Vzt6sWYUxdfHlEcERGmQZsRUk7Lo9LZHgH1Iy
         4UBGYVtg9Ozk4NMqp4pUUD83N7WqihF0I2Sxir4d1k5+fxX49TGTXAFow87pMYoKytMe
         RBa2/aUgSBEDQ/uw2BRHr+Rhs8+hSSANHQMlb1zEe2HFmkGEqTOpK7fB+u0FWc0aWXb3
         Nodw==
X-Gm-Message-State: AC+VfDy9cnjxSNqEDdctCxw5IHnhG9AiLe526VS0KGvUnt+YFmWFWh2g
	hD7OXyLRppQKfOa4g9PekwmYGprhmKd98qRnuM0=
X-Google-Smtp-Source: ACHHUZ6D8YKpHAHahWwSeFh8+X8PctEPyDHppL9mghGiI8+OjIYUNfX6k6d3NI8Cm/7LOZu2EHOuMA==
X-Received: by 2002:a17:902:ec88:b0:1b6:9853:1757 with SMTP id x8-20020a170902ec8800b001b698531757mr12431987plg.23.1687865031154;
        Tue, 27 Jun 2023 04:23:51 -0700 (PDT)
Received: from asharma-Latitude-3400 ([2401:4900:1c68:df03:c4e6:1ddb:b8ec:1db5])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902bd8e00b001aad714400asm5743801pls.229.2023.06.27.04.23.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Jun 2023 04:23:50 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 27 Jun 2023 16:53:46 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: Fix CVE-2023-29400
Date: Tue, 27 Jun 2023 16:53:45 +0530
Message-Id: <20230627112345.5724-1-asharma@mvista.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 11:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183485

emit filterFailsafe for empty unquoted attr
value

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2023-29400.patch           | 93 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29400.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index c544b00b22d..1e0c3fab6fa 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -66,6 +66,7 @@ SRC_URI += "\
     file://CVE-2023-24538-3.patch \
     file://CVE-2023-24539.patch \
     file://CVE-2023-24540.patch \
+    file://CVE-2023-29400.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-29400.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-29400.patch
new file mode 100644
index 00000000000..cb0419a920e
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-29400.patch
@@ -0,0 +1,93 @@
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
+ func htmlNospaceEscaper(args ...any) string {
+ 	s, t := stringify(args...)
++	if s == "" {
++		return filterFailsafe
++	}
+ 	if t == contentTypeHTML {
+ 		return htmlReplacer(stripTags(s), htmlNospaceNormReplacementTable, false)
+ 	}
-- 
2.17.1


