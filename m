Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5926C77B7F
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:58:19 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.10393.1682179094447524943
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=KYwX6giI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2478485fd76so2138525a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682179093; x=1684771093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNFtpu3K+6LUAfNDOjtfAqk2cMjPOXjaEt+gxIfe9tY=;
        b=KYwX6giIQwiMS7fdHyWKb2mMsIy2wzWF4Li8dq4sdunNsBy7pOujmYUVscZR1OdMCT
         rsdQ/ctMBfZmMtDG/gUZfWlHC27CrbeOq/4WN2S2mffQId4GfIf5PfDguGichgsDJNYN
         rjW3S3JNRVhPJ099LcjKb6kIXrAG3hKhntPd82W4L6hv4PCZb4zec5/8Jxhta9A134z3
         IpdtsUzVuFNVi3xYGjA+NHM7ZIFYwv/4tC3CIOECSbdDHoUkbnECRDMyJA2xiGb8P/je
         gv5GM9zOgNOzlZow47NDTnjwP0twh159imwidRprGap0WGItnPi5xHvS7SGQAbzjbCMd
         nY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682179093; x=1684771093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNFtpu3K+6LUAfNDOjtfAqk2cMjPOXjaEt+gxIfe9tY=;
        b=j1nW/BYN2Qy+xeUlsLfRKEf6vsz5u2GOmTiaVv6yVgfks4P8E/NUSldOCOIWbxxhKJ
         0gHCeUoR2vdOV0OBqDnyvmIILPi6UZsQyJXNnchVzVPcHRD7ur07MPzRLIhTOtcYbUsj
         l02FaOWZoEPppjMJxvxIZDBouweLqkUEQpeTW+f00Yj3Y7ADlqqNwOs+FAIBUcsPPJdy
         0pYvn5S3wMq7Ld1h4GPG/zTxDxMLD1BrMpBrUvS0/FwbJpEGB+4OBg2WT53+mi9p/NiV
         GFayH8OReeVmqrI1VbcAJG9EYlb46Gq3zr+1excKkzPZ+rkTaIg6YWQf/8vFIhxGxMFZ
         EGsQ==
X-Gm-Message-State: AAQBX9czU/qzovjYF2oUgJvuvX1O5RVdbq7RcDOjNn7ILo5B+ZrzJJQ0
	EJSCrc+Z2Zj2KH6+Crfo2G3rafyGzTYuqXNHJNc=
X-Google-Smtp-Source: AKy350YAtg8FcC96tDABmkWTRdLWAqMArE7kUxvyLpkJi0fgTk11nBc0rzNLz5olhs39+j3Y4qLyPw==
X-Received: by 2002:a17:90b:3507:b0:246:8f9b:d28e with SMTP id ls7-20020a17090b350700b002468f9bd28emr8799843pjb.18.1682179093342;
        Sat, 22 Apr 2023 08:58:13 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t13-20020a1709028c8d00b001a4fe00a8d4sm4189412plo.90.2023.04.22.08.58.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:58:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/7] go-runtime: Security fix for CVE-2022-41722
Date: Sat, 22 Apr 2023 05:57:59 -1000
Message-Id: <70135bf04eb7173434a7240ddf11639d13aab003.1682178944.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178944.git.steve@sakoman.com>
References: <cover.1682178944.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180313

From: Shubham Kulkarni <skulkarni@mvista.com>

path/filepath: do not Clean("a/../c:/b") into c:\b on Windows

Backport from https://github.com/golang/go/commit/bdf07c2e168baf736e4c057279ca12a4d674f18c

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   2 +
 .../go/go-1.14/CVE-2022-41722-1.patch         |  53 +++++++++
 .../go/go-1.14/CVE-2022-41722-2.patch         | 104 ++++++++++++++++++
 3 files changed, 159 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index f2a5fc3f7c..74017f4d90 100644
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
index 0000000000..f5bffd7a0b
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
index 0000000000..e1f7a55581
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
2.34.1


