Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D86EC77B76
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:54:59 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.10297.1682178898671847750
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=b2tNoiTX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1a920d4842bso24825205ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682178898; x=1684770898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NsYoHmSpFhGLNUMaq5XY7XF+QrwJ+Wgxo+l/+FM70E=;
        b=b2tNoiTXm/8ehCt61fgo1/beDmALmqW/H1QhzMwf4gA36rMSaFgVmnjNs/vGYiB7kk
         SrBoOV3NhfGjHTpoudyXPPs6Fk/ceE3wJvgQC/a2Ml1LWJRzmZ7lKTkgg46ETMw+QPUb
         5URjEmgkNyNOIOZfzOTQFdHY+/MsGQENjpYhIFNBTEfhVD9HAWrS8d/v0cILPWuwz2j0
         OH/NMgA5Pi7xvn72FBgwWK7Bx+YK6S1kY7zI0JuIw2RPaVzh/3s5QI45bPzWUD6b/26L
         Kxi1gJzWvcpXGwGLZVsWaWBsigiTi62zdmBlLRzgWKlyQc+RJjavYRLN0gJLiZK1jkWh
         7YBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682178898; x=1684770898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NsYoHmSpFhGLNUMaq5XY7XF+QrwJ+Wgxo+l/+FM70E=;
        b=Ww70mRnYUvXI02g9aJLwudXuAgypPvjuUhQJFkML60AFz2DEhd2VVvKxO96VEf4YUa
         g/K3uniw5JUPfl4UW8P2s3ap+oLfHkTr58S/iI9ONKZmXEiDdm4h07QdGETxrSo1hF4F
         V3z6wEo5EGdz6jkzKm3onpPjPcNjZRMuYO6mgDejXAF1OX0PphvuclAeFQ8k0mfrFtFm
         L4ro3oeWsSXLJvtRzV2QeGi5s9CzkqcJ1Apa6VlGreo08mIqj3/e3eobUlEgzkB1mEdq
         2Y5tL/JxDEiTjm+yH6FfEpgcGAmpQiWxvKDRoI2tPM8cZk3iLYmnSKzoW90wcH+lrRCt
         AChg==
X-Gm-Message-State: AAQBX9faDWaKb0BL11bFUC18GhRlYL/F1w+2HbF2MM56/z1H1eOkmwiv
	zEhJd60RcVirnQR6wlGPU1x27YC0Pf7LxEGkvc8=
X-Google-Smtp-Source: AKy350ZNqxnumj84n84QnP6BgONpivJMI0YdrQAPmPgHRex18oaVbaB9EojSBtgfzgKTv5TMtDcq2Q==
X-Received: by 2002:a17:902:dac4:b0:1a9:5c41:3f8e with SMTP id q4-20020a170902dac400b001a95c413f8emr2805297plx.42.1682178897689;
        Sat, 22 Apr 2023 08:54:57 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001a686578b44sm4205342pld.110.2023.04.22.08.54.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:54:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/8] go-runtime: Security fix for CVE-2022-41722
Date: Sat, 22 Apr 2023 05:54:36 -1000
Message-Id: <f60637b3c9045656047d6ffcfaadbef5ad1d3d06.1682178752.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178752.git.steve@sakoman.com>
References: <cover.1682178752.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180306

From: Shubham Kulkarni <skulkarni@mvista.com>

path/filepath: do not Clean("a/../c:/b") into c:\b on Windows

Backport from https://github.com/golang/go/commit/bdf07c2e168baf736e4c057279ca12a4d674f18c

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2022-41722.patch           | 103 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 23380f04c3..15d19ed124 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -26,6 +26,7 @@ SRC_URI += "\
     file://cve-2022-41724.patch \
     file://add_godebug.patch \
     file://cve-2022-41725.patch \
+    file://CVE-2022-41722.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch b/meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch
new file mode 100644
index 0000000000..426a4f925f
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch
@@ -0,0 +1,103 @@
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
+CVE: CVE-2022-41722
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
2.34.1


