Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA74D44D5D
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:33:36 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.45594.1730900011871700561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 05:33:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QRhUY9h6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso5386791b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 05:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730900011; x=1731504811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1s9ZDCOqVnqyU1/yrE1CoOJqaU5FsvoViCfX+w/wYs=;
        b=QRhUY9h6qd+vtX21bv4PvwFddPxhqqPxL5g3u4rN1LIhw3jjjcjOleVwCMaBsVQjQT
         xd6p0WATMnqjTBtl21KzFZz3JPPwDk+BCTfZhPWvqkThEacoH7bxStjAyGBw1fJxuifn
         EmaJNxShiaFEgjCNILTAsrFND7AceGhGGRhIr05iERFhwFMkt5K74fuTBcRfIi/YMh/i
         4Zh6AI1QgDM0/STUMGxpHXfEq9hwox7oQuGDjjfRf+KIrBgibmhrX5sqK1IOdMhtEgw0
         asXxxCcrrttUMpLHbLrY/etNWXaG5dpcQmHgeYJ7Kf4MCinuxwVbkCs5jJX7yZVq85y6
         VUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900011; x=1731504811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1s9ZDCOqVnqyU1/yrE1CoOJqaU5FsvoViCfX+w/wYs=;
        b=kcazx07RF8MGTnj3EVLuQnfhLqKiupw/bTFa98siTubpB3KkrdnfqsgHWNKO28TQ09
         2Y5GTsox/UF2b5O17PoWF0xd/iMRLnAl8x65k7bL2L1+B7h1gCzGD8z2Kivv8CbHnxTW
         qZXG6CfUUaiWeDwM/5t5kg4q3JUg6n2VMmW7b8KjTSE38Ayya2y6z67ix8r7J7xEkG7d
         X7NZAdgI9FMjOeB7qlWLGHl/4CU+CXYjIkFEE358p5S7Msc3jwdO5hiI/B8QoDAGFR3Q
         EmboNtnvsRdWLrjpwSzfnhsJ5hYNmTAQ57xPAJRRjG3jcSC1F5EKCapMvjUvHw2to6wn
         kpGQ==
X-Gm-Message-State: AOJu0YyKZlEqydbdyOxXzWmhN3QUOAO+wlMMl457fzLWUV0rICaAYQ2R
	IJ8IKgXreIXbsQhqS3SDg7CQSAEUnrisaJB/7XOkMSFGGGhCPfyBjdgxCboRhm6cRwlUInMDxPF
	m
X-Google-Smtp-Source: AGHT+IGTntwzWANLkoJL1nQz+nglAa/bVMniOunoYHHXGc5YDMtkRiaSZWOTOOp1csYT4q145ruxpA==
X-Received: by 2002:a05:6a00:228d:b0:714:1d96:e6bd with SMTP id d2e1a72fcca58-720c98d200amr28527179b3a.13.1730900010809;
        Wed, 06 Nov 2024 05:33:30 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e5722sm11631717b3a.71.2024.11.06.05.33.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:33:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/5] zstd: patch CVE-2022-4899
Date: Wed,  6 Nov 2024 05:33:18 -0800
Message-Id: <eb9c9818088105f9bf20b7fdc04a380ce488a5e6.1730899830.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730899830.git.steve@sakoman.com>
References: <cover.1730899830.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 13:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206768

From: Peter Marko <peter.marko@siemens.com>

Pick commits from [1] linked from [2] via [3].

[1] https://github.com/facebook/zstd/pull/3220
[2] https://nvd.nist.gov/vuln/detail/CVE-2022-4899
[3] https://github.com/facebook/zstd/issues/3200

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../zstd/zstd/CVE-2022-4899-1.patch           | 66 +++++++++++++++
 .../zstd/zstd/CVE-2022-4899-2.patch           | 83 +++++++++++++++++++
 meta/recipes-extended/zstd/zstd_1.5.2.bb      |  5 +-
 3 files changed, 153 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/zstd/zstd/CVE-2022-4899-1.patch
 create mode 100644 meta/recipes-extended/zstd/zstd/CVE-2022-4899-2.patch

diff --git a/meta/recipes-extended/zstd/zstd/CVE-2022-4899-1.patch b/meta/recipes-extended/zstd/zstd/CVE-2022-4899-1.patch
new file mode 100644
index 0000000000..c21aae7cb1
--- /dev/null
+++ b/meta/recipes-extended/zstd/zstd/CVE-2022-4899-1.patch
@@ -0,0 +1,66 @@
+From e1873ad576cb478fff0e6e44ad99599cd5fd2846 Mon Sep 17 00:00:00 2001
+From: Elliot Gorokhovsky <embg@fb.com>
+Date: Fri, 29 Jul 2022 11:10:47 -0700
+Subject: [PATCH 1/2] Fix buffer underflow for null dir1
+
+CVE: CVE-2022-4899
+Upstream-Status: Backport [https://github.com/facebook/zstd/pull/3220/commits/e1873ad576cb478fff0e6e44ad99599cd5fd2846]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ programs/util.c | 38 +++++++++++++++++++-------------------
+ 1 file changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/programs/util.c b/programs/util.c
+index f53eb03fbe..b874344c4d 100644
+--- a/programs/util.c
++++ b/programs/util.c
+@@ -870,30 +870,30 @@ static const char * trimPath(const char *pathname)
+ 
+ static char* mallocAndJoin2Dir(const char *dir1, const char *dir2)
+ {
+-    const size_t dir1Size = strlen(dir1);
+-    const size_t dir2Size = strlen(dir2);
+-    char *outDirBuffer, *buffer, trailingChar;
+-
+     assert(dir1 != NULL && dir2 != NULL);
+-    outDirBuffer = (char *) malloc(dir1Size + dir2Size + 2);
+-    CONTROL(outDirBuffer != NULL);
++    {   const size_t dir1Size = strlen(dir1);
++        const size_t dir2Size = strlen(dir2);
++        char *outDirBuffer, *buffer;
+ 
+-    memcpy(outDirBuffer, dir1, dir1Size);
+-    outDirBuffer[dir1Size] = '\0';
++        outDirBuffer = (char *) malloc(dir1Size + dir2Size + 2);
++        CONTROL(outDirBuffer != NULL);
+ 
+-    if (dir2[0] == '.')
+-        return outDirBuffer;
++        memcpy(outDirBuffer, dir1, dir1Size);
++        outDirBuffer[dir1Size] = '\0';
+ 
+-    buffer = outDirBuffer + dir1Size;
+-    trailingChar = *(buffer - 1);
+-    if (trailingChar != PATH_SEP) {
+-        *buffer = PATH_SEP;
+-        buffer++;
+-    }
+-    memcpy(buffer, dir2, dir2Size);
+-    buffer[dir2Size] = '\0';
++        if (dir2[0] == '.')
++            return outDirBuffer;
+ 
+-    return outDirBuffer;
++        buffer = outDirBuffer + dir1Size;
++        if (dir1Size > 0 && *(buffer - 1) != PATH_SEP) {
++            *buffer = PATH_SEP;
++            buffer++;
++        }
++        memcpy(buffer, dir2, dir2Size);
++        buffer[dir2Size] = '\0';
++
++        return outDirBuffer;
++    }
+ }
+ 
+ /* this function will return NULL if input srcFileName is not valid name for mirrored output path */
diff --git a/meta/recipes-extended/zstd/zstd/CVE-2022-4899-2.patch b/meta/recipes-extended/zstd/zstd/CVE-2022-4899-2.patch
new file mode 100644
index 0000000000..15dcda5ddc
--- /dev/null
+++ b/meta/recipes-extended/zstd/zstd/CVE-2022-4899-2.patch
@@ -0,0 +1,83 @@
+From f9f27de91c89d826c6a39c3ef44fb1b02f9a43aa Mon Sep 17 00:00:00 2001
+From: Elliot Gorokhovsky <embg@fb.com>
+Date: Fri, 29 Jul 2022 14:44:22 -0700
+Subject: [PATCH 2/2] Disallow empty output directory
+
+CVE: CVE-2022-4899
+Upstream-Status: Backport [https://github.com/facebook/zstd/pull/3220/commits/f9f27de91c89d826c6a39c3ef44fb1b02f9a43aa]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ programs/zstdcli.c                             | 18 ++++++++++++++++--
+ tests/cli-tests/basic/output_dir.sh            |  7 +++++++
+ .../cli-tests/basic/output_dir.sh.stderr.exact |  2 ++
+ .../cli-tests/basic/output_dir.sh.stdout.exact |  2 ++
+ 4 files changed, 27 insertions(+), 2 deletions(-)
+ create mode 100755 tests/cli-tests/basic/output_dir.sh
+ create mode 100644 tests/cli-tests/basic/output_dir.sh.stderr.exact
+ create mode 100644 tests/cli-tests/basic/output_dir.sh.stdout.exact
+
+diff --git a/programs/zstdcli.c b/programs/zstdcli.c
+index fbacb908a9..1143ac3fe8 100644
+--- a/programs/zstdcli.c
++++ b/programs/zstdcli.c
+@@ -990,7 +990,14 @@ int main(int argCount, const char* argv[])
+                 if (longCommandWArg(&argument, "--stream-size=")) { streamSrcSize = readSizeTFromChar(&argument); continue; }
+                 if (longCommandWArg(&argument, "--target-compressed-block-size=")) { targetCBlockSize = readSizeTFromChar(&argument); continue; }
+                 if (longCommandWArg(&argument, "--size-hint=")) { srcSizeHint = readSizeTFromChar(&argument); continue; }
+-                if (longCommandWArg(&argument, "--output-dir-flat")) { NEXT_FIELD(outDirName); continue; }
++                if (longCommandWArg(&argument, "--output-dir-flat")) {
++                    NEXT_FIELD(outDirName);
++                    if (strlen(outDirName) == 0) {
++                        DISPLAY("error: output dir cannot be empty string (did you mean to pass '.' instead?)\n");
++                        CLEAN_RETURN(1);
++                    }
++                    continue;
++                }
+ #ifdef ZSTD_MULTITHREAD
+                 if (longCommandWArg(&argument, "--auto-threads")) {
+                     const char* threadDefault = NULL;
+@@ -1001,7 +1008,14 @@ int main(int argCount, const char* argv[])
+                 }
+ #endif
+ #ifdef UTIL_HAS_MIRRORFILELIST
+-                if (longCommandWArg(&argument, "--output-dir-mirror")) { NEXT_FIELD(outMirroredDirName); continue; }
++                if (longCommandWArg(&argument, "--output-dir-mirror")) {
++                    NEXT_FIELD(outMirroredDirName);
++                    if (strlen(outMirroredDirName) == 0) {
++                        DISPLAY("error: output dir cannot be empty string (did you mean to pass '.' instead?)\n");
++                        CLEAN_RETURN(1);
++                    }
++                    continue;
++                }
+ #endif
+ #ifndef ZSTD_NOTRACE
+                 if (longCommandWArg(&argument, "--trace")) { char const* traceFile; NEXT_FIELD(traceFile); TRACE_enable(traceFile); continue; }
+diff --git a/tests/cli-tests/basic/output_dir.sh b/tests/cli-tests/basic/output_dir.sh
+new file mode 100755
+index 0000000000..a8819d2926
+--- /dev/null
++++ b/tests/cli-tests/basic/output_dir.sh
+@@ -0,0 +1,7 @@
++#!/bin/sh
++
++println "+ zstd -r * --output-dir-mirror=\"\""
++zstd -r * --output-dir-mirror="" && die "Should not allow empty output dir!"
++println "+ zstd -r * --output-dir-flat=\"\""
++zstd -r * --output-dir-flat="" && die "Should not allow empty output dir!"
++exit 0
+diff --git a/tests/cli-tests/basic/output_dir.sh.stderr.exact b/tests/cli-tests/basic/output_dir.sh.stderr.exact
+new file mode 100644
+index 0000000000..e12b50427c
+--- /dev/null
++++ b/tests/cli-tests/basic/output_dir.sh.stderr.exact
+@@ -0,0 +1,2 @@
++error: output dir cannot be empty string (did you mean to pass '.' instead?)
++error: output dir cannot be empty string (did you mean to pass '.' instead?)
+diff --git a/tests/cli-tests/basic/output_dir.sh.stdout.exact b/tests/cli-tests/basic/output_dir.sh.stdout.exact
+new file mode 100644
+index 0000000000..1e478cd753
+--- /dev/null
++++ b/tests/cli-tests/basic/output_dir.sh.stdout.exact
+@@ -0,0 +1,2 @@
+++ zstd -r * --output-dir-mirror=""
+++ zstd -r * --output-dir-flat=""
diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-extended/zstd/zstd_1.5.2.bb
index 591e823049..63bf0d3fb9 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
@@ -9,7 +9,10 @@ LICENSE = "BSD-3-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
 
-SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https"
+SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https \
+    file://CVE-2022-4899-1.patch \
+    file://CVE-2022-4899-2.patch \
+"
 
 SRCREV = "e47e674cd09583ff0503f0f6defd6d23d8b718d3"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


