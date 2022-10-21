Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB9BC433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 18:15:02 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web09.1296.1666376095581363975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 11:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L/gXqd2E;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-132fb4fd495so4503250fac.12
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 11:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ulPx8mZqDIjTrS2BXSVqzYR1U2TNZ1RNhWL6q3DOFAI=;
        b=L/gXqd2EeTYOuuDdegKWYdegwvOw3WrYqHTizTBE4+M4xS+QOTdQmtLZPD0Tssmpiv
         8y4tYKKHHL5HUjAG79fxb2gXYLieRaOFMiknbwwYH7xD9p4vbs9/tAqn94xzEA3BHfbX
         b5YWIgg/DlxQDyJisP4loovjOLYlctR2+52yFMZXE2TP1sSQhs7MVI0JWKoE4fthm1gY
         B+yTsXNKGv0ikVZirkc2ieHqb9tWpnHggEHuCivZezfOKT0iCWSPCHi0M/LHYW8sIA47
         NIuYuuMqIty9p1RkoipIHjdlDAZfE3SCD3nO0zoqEXYUzq679IJ1ZPvNqNgE1lv8cRID
         4h8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulPx8mZqDIjTrS2BXSVqzYR1U2TNZ1RNhWL6q3DOFAI=;
        b=glNeylE31PwuRoBEMt3gYwg08++mcrIMpQigvZbLQraO1+VDjKW2wnUZSI8quPGtVp
         FdFssPwgzP9Y1lgGRYO816uK/iFK16SJq9YcSZVn7vhI5kqeLNvGqwoID2frNLOZaKt6
         5jHJLJM4U4gi9votU7JzkoQcBkkzRG3EmQpEZVOh7A2/T4yOX5W98nbavXKMNMFqE8rt
         wzus9uL1r57YSVVCPWpGqnyW99HQ8QQ9T481rZZGRW4d7fHMJqXrIyGJMkDXJmYEKyP6
         KWsJF6O1UGxtf/peYG7hrFl4iT4OoOMd4QQvzYpTHB5JbIAk+3w1os4obCUw16PS43RH
         wkTw==
X-Gm-Message-State: ACrzQf10AFwjQozVArtJUx6pagaTX20TGjZfV6CEqr3ZH4ee/IflKPq1
	bIBf6UmxeR2mSRJEBecf3gZuN5V0yIw=
X-Google-Smtp-Source: AMsMyM71yGYYN49KwL9q+gXWVkR8/j+FWIkhbQ/HEBSFPvqnCKEh9MguYTV79fiKxsfOsoIqwNLC6A==
X-Received: by 2002:a05:6870:1685:b0:132:d9b7:5fd6 with SMTP id j5-20020a056870168500b00132d9b75fd6mr13251631oae.252.1666376094582;
        Fri, 21 Oct 2022 11:14:54 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id z1-20020a05683010c100b006619f38a686sm1356487oto.56.2022.10.21.11.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 11:14:54 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] qemu-helper-native: Re-write bridge helper as C program
Date: Fri, 21 Oct 2022 13:14:51 -0500
Message-Id: <20221021181451.120630-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 18:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172040

The bridge helper program is invoked directly from QEMU when it needs to
attach to a network bridge. As such, it is subject to the environment of
QEMU itself. Specifically, if bridging is enabled with direct rendering
acceleration, QEMU is run with an LD_PRELOAD that attempts to preload
several uninative libraries; however /bin/sh doesn't use the uninative
loader which means it can fail to start with an error like:

 /bin/sh: symbol lookup error: sysroots-uninative/x86_64-linux/lib/librt.so.1: undefined symbol: __libc_unwind_link_get, version GLIBC_PRIVATE

Converting the helper program to a C program resolves this problem
because it will now use the uninative loader so the preload doesn't
cause errors.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../qemu/qemu-helper-native_1.0.bb            |  6 +--
 .../qemu/qemu-helper/qemu-oe-bridge-helper    | 25 -----------
 .../qemu/qemu-helper/qemu-oe-bridge-helper.c  | 41 +++++++++++++++++++
 3 files changed, 44 insertions(+), 28 deletions(-)
 delete mode 100755 meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper
 create mode 100644 meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c

diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index aa9e499c77..e297586bbb 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/tunctl.c;endline=4;md5=ff3a09996bc5fff6bc5
 
 SRC_URI = "\
     file://tunctl.c \
-    file://qemu-oe-bridge-helper \
+    file://qemu-oe-bridge-helper.c \
     "
 
 S = "${WORKDIR}"
@@ -16,13 +16,13 @@ inherit native
 
 do_compile() {
 	${CC} ${CFLAGS} ${LDFLAGS} -Wall tunctl.c -o tunctl
+	${CC} ${CFLAGS} ${LDFLAGS} -Wall qemu-oe-bridge-helper.c -o qemu-oe-bridge-helper
 }
 
 do_install() {
 	install -d ${D}${bindir}
 	install tunctl ${D}${bindir}/
-
-    install -m 755 ${WORKDIR}/qemu-oe-bridge-helper ${D}${bindir}/
+	install qemu-oe-bridge-helper ${D}${bindir}/
 }
 
 DEPENDS += "qemu-system-native"
diff --git a/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper b/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper
deleted file mode 100755
index f057d4eef0..0000000000
--- a/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper
+++ /dev/null
@@ -1,25 +0,0 @@
-#! /bin/sh
-# Copyright 2020 Garmin Ltd. or its subsidiaries
-#
-# SPDX-License-Identifier: GPL-2.0
-#
-# Attempts to find and exec the host qemu-bridge-helper program
-
-# If the QEMU_BRIDGE_HELPER variable is set by the user, exec it.
-if [ -n "$QEMU_BRIDGE_HELPER" ]; then
-    exec "$QEMU_BRIDGE_HELPER" "$@"
-fi
-
-# Search common paths for the helper program
-BN="qemu-bridge-helper"
-PATHS="/usr/libexec/ /usr/lib/qemu/"
-
-for p in $PATHS; do
-    if [ -e "$p/$BN" ]; then
-        exec "$p/$BN" "$@"
-    fi
-done
-
-echo "$BN not found!" > /dev/stderr
-exit 1
-
diff --git a/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c b/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
new file mode 100644
index 0000000000..cadf2a012a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
@@ -0,0 +1,41 @@
+/*
+ * Copyright 2022 Garmin Ltd. or its subsidiaries
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ *
+ * Attempts to find and exec the host qemu-bridge-helper program
+ */
+
+#include <stdio.h>
+#include <unistd.h>
+
+void try_program(char const* path, char** args) {
+    if (access(path, X_OK) == 0) {
+        execv(path, args);
+    }
+}
+
+int main(int argc, char** argv) {
+    char* var;
+
+    /* Copy arguments so that they are a NULL terminated list, skipping argv[0]
+     * since it is this program name */
+    char** args = malloc(argc * sizeof(char*));
+    for (int i = 0; i < argc - 1; i++) {
+        args[i] = argv[i + 1];
+    }
+    args[argc - 1] = NULL;
+
+    var = getenv("QEMU_BRIDGE_HELPER");
+    if (var && var[0] != '\0') {
+        execvp(var, args);
+        return 1;
+    }
+
+    try_program("/usr/libexec/qemu-bridge-helper", args);
+    try_program("/usr/lib/qemu/qemu-bridge-helper", args);
+
+    fprintf(stderr, "No bridge helper found\n");
+    return 1;
+}
+
-- 
2.33.0


