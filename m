Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90950E9B272
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:12 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21680.1771943588615655332
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dyL6qF+u;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48374014a77so58238455e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943587; x=1772548387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjSTZ+RzM9UkK4kEVwG8vXCZNTuaXAq78ldW9tDOr/0=;
        b=dyL6qF+uGqytGNuZW7bx9Stb8hU/hnf0m3iENZcRSe2JzcCn3GRGs4SvxZWhusJE+y
         pEoraAIWGdfjaXpLbnJocFH2jKwZbAdHwF5NTO2o2tj120d0PeC1KL+HfgLg4yw7mAAB
         kNxHruSOGhJe2qc4CLW3inF8j6U69JWZcI3MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943587; x=1772548387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KjSTZ+RzM9UkK4kEVwG8vXCZNTuaXAq78ldW9tDOr/0=;
        b=qZ79wJ1Cz/ajGlulRGsb6lDU6cGiLPUCdKbFbzRXo8jouc/76uQTdeD33BzBKHNQNh
         ATUbbnDhlm+UbIxET0xuDT6ypunS32PkvASVHxRZiwQrfsK71mAzOlWYHBXMTgIq59w+
         QinFsgA0kEfOsbp3vUC2Y/kEJbG2+KYh1HleAf/LofQTqcPQ2FShDJoJhX2jawoWFsES
         CSoPayqfUDwIw6TiPyT0wkwKli5ovFEl0z3z1fKoJcIWgwRx7ojYlLudP0nPxbyfF1l9
         VL9zCljHXUmSktWA+yK//zkcy3FSKMTV23uCA3eGBHiUUT4mK2Kavpw4FQ9DyPrbDCu8
         DwRA==
X-Gm-Message-State: AOJu0YyyPMGxd/5Y8LdUCK5aBffikvuVK/yg0s+Yn0UwSgiLl1ETuoVM
	Yh4lLCVs4sPHj2nPLFt4m02ZPA9pSflopoQvJ4gjeD8lubYiRfdIGmg416VsA1Qn2goBhrVA90A
	yl2vv
X-Gm-Gg: AZuq6aKR8EO+LQCLMDe23/W9oWhweujYmuEnudR5it+Z3xSZMMxBw80+TEE9JVxhfnI
	G9d6EXIqCNLe7u7xzJ88bpbyHmXAQQuXwQPWVdAogomJ9RLfgGdCIyWfkTbIu+va+EwdCb1wcxN
	w2HTTPnxjlLS2+D6YaBZcGbDqvj50Yx2GkPQyoLnGsh1kUn4M9Z1qoIUqsi2Y1Yt9ke0KiqIIkI
	r0V7Ii+oynZssMUQNMJlFPs54PVynXbf34Ry8V1GnOLim98x9WQ9Hztv+ycvaznRsFrb0VmcmjQ
	MYHVx8ZcLTi3NjxzCyhggj+vUJ/auH2hNV7xs1XVnKY1p2WqPToBmTmM0e1PvjSB3x6cehn5d/5
	zbD9Iu/sH6+E+o111lBDJLl9MSMevgadh0X9hicO4c9Cqo+I28yW81X+RCYa3tTfbjtkm4pBeyo
	JJ4gSyH7AVd2BWg8jrZhjvTcX9flkUcCEHZXKCNF5yElrC+goreFSHwMKi5pTCaR00k7lzL925x
	aOKh6wTDPpsA2krVtPtOxL/mmIySKYhnw==
X-Received: by 2002:a05:600c:37cc:b0:47e:e20e:bbbe with SMTP id 5b1f17b1804b1-483a95e9b65mr210908405e9.25.1771943586486;
        Tue, 24 Feb 2026 06:33:06 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:06 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/44] go 1.22.12: Fix CVE-2025-61732
Date: Tue, 24 Feb 2026 15:31:53 +0100
Message-ID: <5a04a727bf2eaf4791b8c77a11eb7741ec252c28.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231831

From: Deepak Rathore <deeratho@cisco.com>

Upstream Repository: https://github.com/golang/go.git

Bug details: https://nvd.nist.gov/vuln/detail/CVE-2025-61732
Type: Security Fix
CVE: CVE-2025-61732
Score: 8.6
Patch:  https://github.com/golang/go/commit/14d0bb39c1c4

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2025-61732.patch                | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61732.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index ca0f05f7c86..cc4f98a8fe6 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -37,6 +37,7 @@ SRC_URI += "\
     file://CVE-2025-61731.patch \
     file://CVE-2025-68119-dependent.patch \
     file://CVE-2025-68119.patch \
+    file://CVE-2025-61732.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-61732.patch b/meta/recipes-devtools/go/go/CVE-2025-61732.patch
new file mode 100644
index 00000000000..523660def28
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-61732.patch
@@ -0,0 +1,53 @@
+From fe8c665f1608126e7b644ab07bb0698ad1c0b4b6 Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Tue, 6 Jan 2026 16:09:19 -0500
+Subject: [PATCH] [release-branch.go1.24] cmd/go: remove user-content from doc
+ strings in cgo ASTs.
+
+Thank you to RyotaK (https://ryotak.net) of GMO Flatt Security Inc. for reporting this issue.
+
+Updates #76697
+Fixes #77128
+Fixes CVE-2025-61732
+
+CVE: CVE-2025-61732
+Upstream-Status: Backport [https://github.com/golang/go/commit/14d0bb39c1c4]
+
+Change-Id: Ie2a96b79a813e362cbf8e6cb0e3c2d0c022bcb29
+Reviewed-on: https://go-review.googlesource.com/c/go/+/740001
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+(cherry picked from commit 14d0bb39c1c4093bd02740d14b1a2ca720ced97c)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/cmd/cgo/ast.go | 11 +++--------
+ 1 file changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/src/cmd/cgo/ast.go b/src/cmd/cgo/ast.go
+index 3cbbeafdca..eb373bdefa 100644
+--- a/src/cmd/cgo/ast.go
++++ b/src/cmd/cgo/ast.go
+@@ -301,17 +301,12 @@ func (f *File) saveExport(x interface{}, context astContext) {
+			error_(c.Pos(), "export comment has wrong name %q, want %q", name, n.Name.Name)
+		}
+
+-		doc := ""
+-		for _, c1 := range n.Doc.List {
+-			if c1 != c {
+-				doc += c1.Text + "\n"
+-			}
+-		}
+-
+		f.ExpFunc = append(f.ExpFunc, &ExpFunc{
+			Func:    n,
+			ExpName: name,
+-			Doc:     doc,
++			// Caution: Do not set the Doc field on purpose
++			// to ensure that there are no unintended artifacts
++			// in the binary. See https://go.dev/issue/76697.
+		})
+		break
+	}
+--
+2.35.6

