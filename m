Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E54ECD98DD
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:27:00 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71895.1781274410380702586
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SVx72xN/;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so640994f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274409; x=1781879209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M//vCLIYhnCNQa3cdRUpWAbqO+Y8EY5iQ6r/7Rcj9D8=;
        b=SVx72xN/Aq4WVz9R5mIKubEa5WAn0+h38wOdZn+o6e0SctNNO6SlCZbv0LVD77cAls
         iG+VCn8vpGtZNX3mfc1HpKcfBdkirN/HzIMlzwpBigUNHDW+r0rubyvHNCFVlHBJ81sF
         ZZkKxAqSS7n/187gOVwpyD1QLf/VN0g8Abql4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274409; x=1781879209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M//vCLIYhnCNQa3cdRUpWAbqO+Y8EY5iQ6r/7Rcj9D8=;
        b=g976K29QiyL+mdGlNe3i+osuBFZD9ORk9zns3udcdCLMD7rReMsvSarDYplMDEO78a
         tNVAEuJE0+E8b5agTQYEf+70pYyrKn9+6gCKuCG7BSL9jv3yOjir2w9uNoa0ZzGhSWWd
         Emft8rFZlWx7syShRCwwVY+f3DPbgF4CdZtTo4VVRbGjCvuayWNvv80pibN2eKpAeMdh
         6PMPYBjupo1GWzdJoZQH5CMJemQbSuO/orZiMhGd0BufXD7KhAaCXHx3yLkILZnDt93n
         OuGe+BN/UWszBnMbHf2VrX429NqhdkpecZscZfeXVYWM+WpkUFUF1h7pyf7t2KLlDfjY
         lpEg==
X-Gm-Message-State: AOJu0YxHFYy4IByDNM2q8s/Jd6RZxEWPpIO2l1QBW6JrXIPNx3rPXIya
	UpzXFMNVI8XQKQF2jQ22p984OVIJ3cIjoN/zl2aRPzlqFq01R3dq7qMn9/ApLcqiw1+sGDpJLIm
	N5BOd1g==
X-Gm-Gg: Acq92OHnvly/oG8+AVveydkqesKuGSz9Vn9hqk0Nz/grhpzic+IYdq8B2m07f/AA7HU
	oiLupGwg6+VvbdZgwHGNSQ5ZDHPMzXYMxsjCSVgvog1XAt0LUy2a7YXGqeaW1yXqIqD5GZ3miO9
	ifKEj/RgBXZFxJJ1/yDBbnjg8fXy7MRBGHUWZR0csYDKBcBzU8COjcM5Fmyf50VSwZ7tNrrxrno
	dw0o5MLKTHh3AByu/7N6uYRsqLImmJ09Sqr5u8SOm4clmMN3RtIm1W2tCS18PoDochj0Q6+iWtW
	bNevZNxi13ufP7vFhA4bUnW6/C1LHSWS5EZCACezpSE/cXQNkbOTLds74CEce77q6qAd60DOwHB
	BkTOAgeqnJzBjV35BRw3CKvDJiwra8PUh6UR5yJ1doOKJaaQHisI6kfirMEGnAHVUTEX6pfKcrc
	3hEdpwLzooHhM07CJj4z68Rug=
X-Received: by 2002:a05:6000:220d:b0:43d:733f:aee6 with SMTP id ffacd0b85a97d-4606da665e6mr4799990f8f.10.1781274408745;
        Fri, 12 Jun 2026 07:26:48 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:48 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 16/21] go: patch CVE-2026-39826
Date: Fri, 12 Jun 2026 16:26:06 +0200
Message-ID: <3398ab7d66e68a36eea2f230aacbace7f9d8461a.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238638

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/771180

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-39826.patch                | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39826.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 952c0e4638..77e6bcd59d 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -50,6 +50,7 @@ SRC_URI += "\
     file://CVE-2026-39819.patch \
     file://CVE-2026-39820.patch \
     file://CVE-2026-39825.patch \
+    file://CVE-2026-39826.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-39826.patch b/meta/recipes-devtools/go/go/CVE-2026-39826.patch
new file mode 100644
index 0000000000..d9fa751adc
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-39826.patch
@@ -0,0 +1,65 @@
+From 0d41a827f4d691be89c0285cd136cc45640341d4 Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Mon, 27 Apr 2026 17:34:58 -0400
+Subject: [PATCH] html/template: fix escaper bypass by treating empty script
+ type as JavaScript
+
+Thank you to Mundur (https://github.com/M0nd0R) for reporting this issue.
+
+Fixes #78981
+Fixes CVE-2026-39826
+
+Change-Id: I3f2e06496020ece655d156fb099ff556af8cc836
+Reviewed-on: https://go-review.googlesource.com/c/go/+/771180
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+
+CVE: CVE-2026-39826
+Upstream-Status: Backport [https://github.com/golang/go/commit/a63b23ffb2eebc9ca3a14c369b615ca623bb20f7]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/html/template/escape_test.go | 15 +++++++++++++++
+ src/html/template/js.go          |  1 +
+ 2 files changed, 16 insertions(+)
+
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index 435c83378f..ce06440738 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -231,6 +231,21 @@ func TestEscape(t *testing.T) {
+ 			"<script>alert({{.A}})</script>",
+ 			`<script>alert(["\u003ca\u003e","\u003cb\u003e"])</script>`,
+ 		},
++		{
++			"scriptTypeSpace",
++			"<script type=\" \">{{.H}}</script>",
++			"<script type=\" \">\"\\u003cHello\\u003e\"</script>",
++		},
++		{
++			"scriptTypeTab",
++			"<script type=\"\t\">{{.H}}</script>",
++			"<script type=\"\t\">\"\\u003cHello\\u003e\"</script>",
++		},
++		{
++			"scriptTypeEmpty",
++			"<script type=\"\">{{.H}}</script>",
++			"<script type=\"\">\"\\u003cHello\\u003e\"</script>",
++		},
+ 		{
+ 			"jsObjValueNotOverEscaped",
+ 			"<button onclick='alert({{.A | html}})'>",
+diff --git a/src/html/template/js.go b/src/html/template/js.go
+index d911ada26d..90cf2dc982 100644
+--- a/src/html/template/js.go
++++ b/src/html/template/js.go
+@@ -459,6 +459,7 @@ func isJSType(mimeType string) bool {
+ 	mimeType = strings.TrimSpace(mimeType)
+ 	switch mimeType {
+ 	case
++		"",
+ 		"application/ecmascript",
+ 		"application/javascript",
+ 		"application/json",
+-- 
+2.43.0
+
-- 
2.53.0


