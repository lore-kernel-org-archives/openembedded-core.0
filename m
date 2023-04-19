Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C0FC6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 12:33:19 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.36209.1681907594696839775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 05:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=Q28uq94r;
 spf=pass (domain: mvista.com, ip: 209.85.210.169, mailfrom: skulkarni@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-63d4595d60fso6562277b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1681907593; x=1684499593;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PD2gUskYKW+8y6wmjV9g0+aYsYA7mEvCeiU5IIRohHo=;
        b=Q28uq94rPoW1WtnMPPAHZD8SVS2ecWOiDr7GOqKGLnJZdwnx2WNlOrNPpNOFLTVf/a
         z1c8LlBWTqAgR84d9zRIr9XBccXk2JB6+Idyp6b0biarfjL4k70EJbL05J5EhkWOIDPR
         C+UrLy0AG7DE7ZeNsRn+K3tEyatroHFZac0KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681907593; x=1684499593;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PD2gUskYKW+8y6wmjV9g0+aYsYA7mEvCeiU5IIRohHo=;
        b=NVFam/GABcjqwxi1VwxQPJiqsvvMLsLmFOBKrTCQP0gBm8nqTcxyvsPZvlL+XkWehV
         Tn58MDBHgnpENz1zyPwrHoxjImvPdtF+BvgBXoTV9SAFgGQ3dGCBSswW8uVgE2tJlgSf
         M9Vx7uXuBMizYjfZEJFqwtsOPoCO6nCuBipkcQ8RzgADiIyVRBB/6TCZG8M1l1FEsaBz
         WhLbAe6MDPd+bzdKe1A34Am4RT2a2YttfL9PABiY5bhL1lO7P6dhEG/0krENZLhsaYqp
         m/T+88ZVVLFIP+hgCA0/TW7PpnykTh63Kc1gH4qARHn+JrFc7wrgCAAWU+6zSIXSHGqe
         udJQ==
X-Gm-Message-State: AAQBX9eKQKL45VEbqgoD7N5yFoSgEyFI09qBQn1PKHFxVypUhbDPfZ2m
	xE8Fq1HNuib2TVJ+dJX0OmwoOTuIT4Qyi3LA4kQ=
X-Google-Smtp-Source: AKy350b/JVyqVb1zBmaOV9F8BkjFlUjBoX7Qy/nidoAuLD4i58XxycWAmT1NY5PWUM/J36Iwn9STPg==
X-Received: by 2002:a17:90b:128f:b0:247:1081:d08e with SMTP id fw15-20020a17090b128f00b002471081d08emr2740524pjb.8.1681907592986;
        Wed, 19 Apr 2023 05:33:12 -0700 (PDT)
Received: from kite.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id i1-20020a63e441000000b0050376cedb3asm10403172pgk.24.2023.04.19.05.33.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Apr 2023 05:33:12 -0700 (PDT)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][dunfell][PATCH] go-runtime: Security fix for CVE-2022-41722
Date: Wed, 19 Apr 2023 18:02:49 +0530
Message-Id: <1681907569-31148-1-git-send-email-skulkarni@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 12:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180217

From: Shubham Kulkarni <skulkarni@mvista.com>

path/filepath: do not Clean("a/../c:/b") into c:\b on Windows

Backport from https://github.com/golang/go/commit/bdf07c2e168baf736e4c057279ca12a4d674f18c

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc               |   2 +
 .../go/go-1.14/CVE-2022-41722-1.patch              |  53 +++++++++++
 .../go/go-1.14/CVE-2022-41722-2.patch              | 104 +++++++++++++++++++++
 3 files changed, 159 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index f2a5fc3..74017f4 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -53,6 +53,8 @@ SRC_URI += "\
     file://CVE-2022-41717.patch \
     file://CVE-2022-1962.patch \
     file://CVE-2022-41723.patch \
+    file://CVE-2022-41722-1.patch \
+    file://CVE-2022-41722-2.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.patch
new file mode 100644
index 0000000..f5bffd7
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.patch
@@ -0,0 +1,53 @@
+From 94e0c36694fb044e81381d112fef3692de7cdf52 Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Fri, 22 Apr 2022 10:07:51 +0900
+Subject: [PATCH 1/2] path/filepath: do not remove prefix "." when following
+ path contains ":".
+
+Fixes #52476
+
+Change-Id: I9eb72ac7dbccd6322d060291f31831dc389eb9bb
+Reviewed-on: https://go-review.googlesource.com/c/go/+/401595
+Auto-Submit: Ian Lance Taylor <iant@google.com>
+Reviewed-by: Alex Brainman <alex.brainman@gmail.com>
+Run-TryBot: Ian Lance Taylor <iant@google.com>
+Reviewed-by: Ian Lance Taylor <iant@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+Upstream-Status: Backport from https://github.com/golang/go/commit/9cd1818a7d019c02fa4898b3e45a323e35033290
+CVE: CVE-2022-41722
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ src/path/filepath/path.go | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/src/path/filepath/path.go b/src/path/filepath/path.go
+index 26f1833..92dc090 100644
+--- a/src/path/filepath/path.go
++++ b/src/path/filepath/path.go
+@@ -116,9 +116,21 @@ func Clean(path string) string {
+		case os.IsPathSeparator(path[r]):
+			// empty path element
+			r++
+-		case path[r] == '.' && (r+1 == n || os.IsPathSeparator(path[r+1])):
++		case path[r] == '.' && r+1 == n:
+			// . element
+			r++
++		case path[r] == '.' && os.IsPathSeparator(path[r+1]):
++			// ./ element
++			r++
++
++			for r < len(path) && os.IsPathSeparator(path[r]) {
++				r++
++			}
++			if out.w == 0 && volumeNameLen(path[r:]) > 0 {
++				// When joining prefix "." and an absolute path on Windows,
++				// the prefix should not be removed.
++				out.append('.')
++			}
+		case path[r] == '.' && path[r+1] == '.' && (r+2 == n || os.IsPathSeparator(path[r+2])):
+			// .. element: remove to last separator
+			r += 2
+--
+2.7.4
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.patch
new file mode 100644
index 0000000..e1f7a55
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.patch
@@ -0,0 +1,104 @@
+From b8803cb711ae163b8e67897deb6cf8c49702227c Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Mon, 12 Dec 2022 16:43:37 -0800
+Subject: [PATCH 2/2] path/filepath: do not Clean("a/../c:/b") into c:\b on
+ Windows
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
+Upstream-Status: Backport from https://github.com/golang/go/commit/bdf07c2e168baf736e4c057279ca12a4d674f18c
+CVE: CVE-2022-41722
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ src/path/filepath/path.go | 27 ++++++++++++++-------------
+ 1 file changed, 14 insertions(+), 13 deletions(-)
+
+diff --git a/src/path/filepath/path.go b/src/path/filepath/path.go
+index 92dc090..f0f095e 100644
+--- a/src/path/filepath/path.go
++++ b/src/path/filepath/path.go
+@@ -14,6 +14,7 @@ package filepath
+ import (
+	"errors"
+	"os"
++	"runtime"
+	"sort"
+	"strings"
+ )
+@@ -116,21 +117,9 @@ func Clean(path string) string {
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
+@@ -156,6 +145,18 @@ func Clean(path string) string {
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
2.7.4


