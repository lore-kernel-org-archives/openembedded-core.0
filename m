Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391EFC02185
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:38:04 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.22643.1736951880045001742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 06:38:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XVflOBAM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21680814d42so102535705ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 06:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736951879; x=1737556679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uu+vx0ADfZ28oW0RGVvN60aTETYGJly0irJhz7iQil8=;
        b=XVflOBAM8CVj7I3JYsU06RP4RfKv6A5iUoGX2alW6g1gePk0Qf9NK6aPVvRaHbjp2l
         s601yDc29VifAjJGIrsvwxUDCPCVewY/lW9eQe4xRHDwgk6guRSqWMbb3uh40Yct2pZY
         3FcxzloQLc4tGO3zsGnMyUw+RRmkGsYICZYjlmPVjVI98AOueW1Y+QosHOUDXrUVGOv6
         VFlsEBY0l7iq6W+Av9Sb98LCW4ykm5gos2mbjJktHohN4LTkLohioli7s6FNtnHyQgD4
         FNMULbSCH0IxNN9Ippbt+6+GeIzASeoX+QE0ad8kmFWduZljxKBNKM5PKsj+w+wPsnXb
         vOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951879; x=1737556679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uu+vx0ADfZ28oW0RGVvN60aTETYGJly0irJhz7iQil8=;
        b=lwfXLU5sXnMHkQLvVT2EALwV+OOI8/sSvPlzIoABAYEw96EeXe/I1OmqxAvbRuOWF2
         wWIXv2l07oWZShwtL9FpcWjPbC9LvQ5G+zh9oI0M9WnJjUFx0MEDlqE2FPhkVKhvjtu+
         ik4PxwU0dRIvrA63jGxIDaZteqJrgtfc/uUxUf58jpbOZuRhXT4s8llZjNrSEhU4gFCb
         330czGYEmLRn6ILi+O33y2SjHNOAfmfZCrndQvLOzfP1GWGj7DHmEB6xBXy1IIlnM0aX
         3nyaF+lQetk0lNcv0fthI6cuSRopvdNEds6M+ZGgGeX59x2G8ecCr5VG0tulvRL6NhYR
         nm0A==
X-Gm-Message-State: AOJu0YxetIyoKCAt6Qa2140hVo7HNKUVhjlxp6+efm8Sj9t89ghl7mjG
	4ZIqMLuU03jbsEkHOrV/jKGpBDhlUUzA/vcia6atwyrVPKRMelpJBai0QMXGJf8B3LpgXMXTEHa
	9HQI=
X-Gm-Gg: ASbGncu7hhoo5nMKNU90jlu95vDNkyX9l/xWb75NroX3+7MYK3b2JFiel32YNAlPVqm
	QHfwcC8DfeDleeUOn4qLBkbQ/Rk+noSJNoP0hbKjdNMwXoknPB1NFOVQpbIJ2BjyByAbTRkbj7U
	Dbd1OYK7TdYgV/WjdiX8+NVGwmZlKEjBCpWGqaAYepiNX5zlTvfn1+MJQho6Dr+CjvAdIWsfEVP
	cv2oM7ugGpv2BWFNtJaKVr7sX99AJX8M9YoU2+9B2efng==
X-Google-Smtp-Source: AGHT+IHokmwyVpjnf8yqV9hHMZezm2wZJpmKHDiA/WNh9bO4oD7VKUeS5Dm3/SN1fceNk2f2b3dWgA==
X-Received: by 2002:a17:902:ccc2:b0:216:4165:c05e with SMTP id d9443c01a7336-21a83f67982mr539555005ad.24.1736951879190;
        Wed, 15 Jan 2025 06:37:59 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f244cccsm82333295ad.210.2025.01.15.06.37.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:37:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/11] go: Fix CVE-2024-34155
Date: Wed, 15 Jan 2025 06:37:39 -0800
Message-ID: <9d21d527e2448e202030ae7ad38c88e25943a2f3.1736951751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736951751.git.steve@sakoman.com>
References: <cover.1736951751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 14:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209906

From: Archana Polampalli <archana.polampalli@windriver.com>

Calling any of the Parse functions on Go source code which contains
deeply nested literals can cause a panic due to stack exhaustion.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-34155

Upstream-patch:
https://github.com/golang/go/commit/b232596139dbe96a62edbe3a2a203e856bf556eb

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.21/CVE-2024-34155.patch           | 71 +++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-34155.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 349b0be6be..11bd2afde0 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -58,6 +58,7 @@ SRC_URI += "\
     file://CVE-2023-45288.patch \
     file://CVE-2024-24789.patch \
     file://CVE-2024-24791.patch \
+    file://CVE-2024-34155.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2024-34155.patch b/meta/recipes-devtools/go/go-1.21/CVE-2024-34155.patch
new file mode 100644
index 0000000000..515d9dcdff
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2024-34155.patch
@@ -0,0 +1,71 @@
+From b232596139dbe96a62edbe3a2a203e856bf556eb Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Mon, 10 Jun 2024 15:34:12 -0700
+Subject: [PATCH] go/parser: track depth in nested element lists
+
+Prevents stack exhaustion with extremely deeply nested literal values,
+i.e. field values in structs.
+
+Updates #69138
+Fixes #69142
+Fixes CVE-2024-34155
+
+Change-Id: I2e8e33b44105cc169d7ed1ae83fb56df0c10f1ee
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/1520
+Reviewed-by: Robert Griesemer <gri@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Russ Cox <rsc@google.com>
+(cherry picked from commit eb1b038c0d01761694e7a735ef87ac9164c6568e)
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/1561
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/611181
+Reviewed-by: Michael Pratt <mpratt@google.com>
+TryBot-Bypass: Dmitri Shuralyov <dmitshur@google.com>
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2024-34155
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/b232596139dbe96a62edbe3a2a203e856bf556eb]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/go/parser/parser.go      | 2 ++
+ src/go/parser/parser_test.go | 9 +++++----
+ 2 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/src/go/parser/parser.go b/src/go/parser/parser.go
+index 2c42b9f..a728d9a 100644
+--- a/src/go/parser/parser.go
++++ b/src/go/parser/parser.go
+@@ -1481,6 +1481,8 @@ func (p *parser) parseElementList() (list []ast.Expr) {
+ }
+
+ func (p *parser) parseLiteralValue(typ ast.Expr) ast.Expr {
++	defer decNestLev(incNestLev(p))
++
+	if p.trace {
+		defer un(trace(p, "LiteralValue"))
+	}
+diff --git a/src/go/parser/parser_test.go b/src/go/parser/parser_test.go
+index 993df63..b2cd501 100644
+--- a/src/go/parser/parser_test.go
++++ b/src/go/parser/parser_test.go
+@@ -607,10 +607,11 @@ var parseDepthTests = []struct {
+	{name: "chan2", format: "package main; var x «<-chan »int"},
+	{name: "interface", format: "package main; var x «interface { M() «int» }»", scope: true, scopeMultiplier: 2}, // Scopes: InterfaceType, FuncType
+	{name: "map", format: "package main; var x «map[int]»int"},
+-	{name: "slicelit", format: "package main; var x = «[]any{«»}»", parseMultiplier: 2},             // Parser nodes: UnaryExpr, CompositeLit
+-	{name: "arraylit", format: "package main; var x = «[1]any{«nil»}»", parseMultiplier: 2},         // Parser nodes: UnaryExpr, CompositeLit
+-	{name: "structlit", format: "package main; var x = «struct{x any}{«nil»}»", parseMultiplier: 2}, // Parser nodes: UnaryExpr, CompositeLit
+-	{name: "maplit", format: "package main; var x = «map[int]any{1:«nil»}»", parseMultiplier: 2},    // Parser nodes: CompositeLit, KeyValueExpr
++	{name: "slicelit", format: "package main; var x = []any{«[]any{«»}»}", parseMultiplier: 3},      // Parser nodes: UnaryExpr, CompositeLit
++	{name: "arraylit", format: "package main; var x = «[1]any{«nil»}»", parseMultiplier: 3},         // Parser nodes: UnaryExpr, CompositeLit
++	{name: "structlit", format: "package main; var x = «struct{x any}{«nil»}»", parseMultiplier: 3}, // Parser nodes: UnaryExpr, CompositeLit
++	{name: "maplit", format: "package main; var x = «map[int]any{1:«nil»}»", parseMultiplier: 3},    // Parser nodes: CompositeLit, KeyValueExpr
++	{name: "element", format: "package main; var x = struct{x any}{x: «{«»}»}"},
+	{name: "dot", format: "package main; var x = «x.»x"},
+	{name: "index", format: "package main; var x = x«[1]»"},
+	{name: "slice", format: "package main; var x = x«[1:2]»"},
+--
+2.40.0
-- 
2.43.0


