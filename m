Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46376C6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 11:54:43 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.6530.1681818878670311954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 04:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Gi+vGaMC;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: skulkarni@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-63b73203e0aso7869178b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 04:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1681818878; x=1684410878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BlPMjwhxCvnKMZPvJhTPEy8/9SMZWGrQ9l2WEX2W7Ys=;
        b=Gi+vGaMC0WdLATkpnBHMqSLfp0xaBbHbIkHSjbI6Nj43R3k6cPzSggvs/+GWE4lMuA
         HKR+YnPgSc3LHoGNJ3RDw1blMOZueUnoTMhrxTYpOIHEztJBSce56cH+F80vqeG50294
         OB1T2uwQQF7ZF9FgFCAB1qcXCT76Byz8D4ia0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681818878; x=1684410878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BlPMjwhxCvnKMZPvJhTPEy8/9SMZWGrQ9l2WEX2W7Ys=;
        b=aOchr/8ksjKrHnEs5UNHugrZBlcBt9YtUtyYybXSe51KEgtTXJ9YG6iSIQ5vS694bO
         m6itiLKcE3a3yX12b8dU7DZiNZeiULt/hWeHUS0steKUL1obVv+Wy0NDbfLybEDjEA76
         2ZhlYJFRwdd6e2vmFv4DCvg1fXBY2yoE0ZBDZFU+TeD5kG5XCLgndMZEyygXCQgh9g8E
         O2PsUu8v4gfB5R0X3+LUR2dZP0N3tQ1q08cYc5CawEcyd1nAvwjsqH+xdTgdIzEFkRfO
         JwYzupxm3za821cdIXoK38wsQt7lRGjs7RgwlAzwWK2Kz/ZdGYDZG9IfJkmdgvKZR9s6
         ap2w==
X-Gm-Message-State: AAQBX9fx+WKkOf9qH+DTqY6R3Vf0tXYYanzLTLCjBlv5geE/psvSBKB4
	JVJ4rcKtk6m3NBx1FzO/J3DfogCMNqCuPKJokHQ=
X-Google-Smtp-Source: AKy350bwoU6KGU4kS8fH8rKWQ/KmQIk5V5g5UyL8w1rbCrU1tqCgT6l4Vw7OtsFDkm67Yo2inwtBYQ==
X-Received: by 2002:a17:903:22cc:b0:1a6:3737:750c with SMTP id y12-20020a17090322cc00b001a63737750cmr2043970plg.21.1681818877576;
        Tue, 18 Apr 2023 04:54:37 -0700 (PDT)
Received: from kite.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id k8-20020a170902ba8800b001a6e9d170b8sm3106859pls.265.2023.04.18.04.54.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Apr 2023 04:54:37 -0700 (PDT)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][kirkstone][PATCH] go-runtime: Security fix for CVE-2022-41722
Date: Tue, 18 Apr 2023 17:24:23 +0530
Message-Id: <20230418115423.30752-1-skulkarni@mvista.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 11:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180187

From: Shubham Kulkarni <skulkarni@mvista.com>

path/filepath: do not Clean("a/../c:/b") into c:\b on Windows

Backport from https://github.com/golang/go/commit/bdf07c2e168baf736e4c057279ca12a4d674f18c

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2022-41722.patch           | 102 ++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 14d58932dc..d104e34408 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -23,6 +23,7 @@ SRC_URI += "\
     file://CVE-2022-2879.patch \
     file://CVE-2022-41720.patch \
     file://CVE-2022-41723.patch \
+    file://CVE-2022-41722.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch b/meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch
new file mode 100644
index 0000000000..447c3d45bd
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch
@@ -0,0 +1,102 @@
+From a826b19625caebed6dd0f3fbd9d0111f6c83737c Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Mon, 12 Dec 2022 16:43:37 -0800
+Subject: [PATCH] path/filepath: do not Clean("a/../c:/b") into c:\b on Windows
+
+Do not permit Clean to convert a relative path into one starting
+with a drive reference. This change causes Clean to insert a .
+path element at the start of a path when the original path does not
+start with a volume name, and the first path element would contain
+a colon.
+
+This may introduce a spurious but harmless . path element under
+some circumstances. For example, Clean("a/../b:/../c") becomes `.\c`.
+
+This reverts CL 401595, since the change here supersedes the one
+in that CL.
+
+Thanks to RyotaK (https://twitter.com/ryotkak) for reporting this issue.
+
+Updates #57274
+Fixes #57276
+Fixes CVE-2022-41722
+
+Change-Id: I837446285a03aa74c79d7642720e01f354c2ca17
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1675249
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+TryBot-Result: Security TryBots <security-trybots@go-security-trybots.iam.gserviceaccount.com>
+(cherry picked from commit 8ca37f4813ef2f64600c92b83f17c9f3ca6c03a5)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1728944
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/468119
+Reviewed-by: Than McIntosh <thanm@google.com>
+Run-TryBot: Michael Pratt <mpratt@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Auto-Submit: Michael Pratt <mpratt@google.com>
+
+Upstream-Status: Backport from https://github.com/golang/go/commit/bdf07c2e168baf736e4c057279ca12a4d674f18
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ src/path/filepath/path.go | 27 ++++++++++++++-------------
+ 1 file changed, 14 insertions(+), 13 deletions(-)
+
+diff --git a/src/path/filepath/path.go b/src/path/filepath/path.go
+index 8300a32..94621a0 100644
+--- a/src/path/filepath/path.go
++++ b/src/path/filepath/path.go
+@@ -15,6 +15,7 @@ import (
+	"errors"
+	"io/fs"
+	"os"
++	"runtime"
+	"sort"
+	"strings"
+ )
+@@ -117,21 +118,9 @@ func Clean(path string) string {
+		case os.IsPathSeparator(path[r]):
+			// empty path element
+			r++
+-		case path[r] == '.' && r+1 == n:
++		case path[r] == '.' && (r+1 == n || os.IsPathSeparator(path[r+1])):
+			// . element
+			r++
+-		case path[r] == '.' && os.IsPathSeparator(path[r+1]):
+-			// ./ element
+-			r++
+-
+-			for r < len(path) && os.IsPathSeparator(path[r]) {
+-				r++
+-			}
+-			if out.w == 0 && volumeNameLen(path[r:]) > 0 {
+-				// When joining prefix "." and an absolute path on Windows,
+-				// the prefix should not be removed.
+-				out.append('.')
+-			}
+		case path[r] == '.' && path[r+1] == '.' && (r+2 == n || os.IsPathSeparator(path[r+2])):
+			// .. element: remove to last separator
+			r += 2
+@@ -157,6 +146,18 @@ func Clean(path string) string {
+			if rooted && out.w != 1 || !rooted && out.w != 0 {
+				out.append(Separator)
+			}
++			// If a ':' appears in the path element at the start of a Windows path,
++			// insert a .\ at the beginning to avoid converting relative paths
++			// like a/../c: into c:.
++			if runtime.GOOS == "windows" && out.w == 0 && out.volLen == 0 && r != 0 {
++				for i := r; i < n && !os.IsPathSeparator(path[i]); i++ {
++					if path[i] == ':' {
++						out.append('.')
++						out.append(Separator)
++						break
++					}
++				}
++			}
+			// copy element
+			for ; r < n && !os.IsPathSeparator(path[r]); r++ {
+				out.append(path[r])
+--
+2.7.4
-- 
2.33.0


