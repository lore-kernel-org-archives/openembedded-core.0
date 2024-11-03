Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C49E6F09A
	for <webhook@archiver.kernel.org>; Sun,  3 Nov 2024 12:56:56 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.35041.1730638605895736500
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Nov 2024 04:56:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WqIyjGCR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20241103125641d89c2c612aab68f4cc-rbrvlx@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20241103125641d89c2c612aab68f4cc
        for <openembedded-core@lists.openembedded.org>;
        Sun, 03 Nov 2024 13:56:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=FR9mGGSFPeSbpnLQ5FcDXZ7xhLHndBEJvMu9A25lEy0=;
 b=WqIyjGCRzvPCINse/7oMETs5iHvQzPyH12GNyIvnhfXm9vmhfeEKSiMNemDwYo5jjZfncK
 pQFuS5uSp5yMY3Ar+ntGIeyU1ZLjhqNbnui5vBgVM+zGy4Hwx50/nMLerBrevzr4+BIexyaU
 wx05m0KMQuc6Fwk+Kz+8isc7YznOIWNxUeRG1r8IVlytORx5L8FWLz9gonvisEDMVArjEg3a
 OVLbqEMgpDKff1URpJ6QmNJ2DJWKA2f8wMr9uAluPVHVJ2DC6gjL+e/QqjYqIMi3IRZa5b2n
 MJG0SCAdR79A6P76Ww4b5ZYyPM10RALho2gn/G1mbHNxfM2I/eIUGftw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] zstd: patch CVE-2022-4899
Date: Sun,  3 Nov 2024 13:54:05 +0100
Message-Id: <20241103125405.2039059-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Nov 2024 12:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206665

From: Peter Marko <peter.marko@siemens.com>

Pick commits from [1] linked from [2] via [3].

[1] https://github.com/facebook/zstd/pull/3220
[2] https://nvd.nist.gov/vuln/detail/CVE-2022-4899
[3] https://github.com/facebook/zstd/issues/3200

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
2.30.2


