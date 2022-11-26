Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13690C46467
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:16:06 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.70847.1669472157072884891
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=TzWKQgvL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id mv18so5814915pjb.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uiBJ91iRzopvnwMd+x8LgIEg8MmwBTwc605K8GvdmQc=;
        b=TzWKQgvLDTs2gW9lqXrFKO2VVNmpG2GgmE9dUB7kAUE8Ro15vEEDyhvTMoM4f51lL2
         OIS7GL72QoW7G9xXRZngcSBfOLljP093TPlyHbpsilaQSKDzjzeKZ++JFfRpMw1+mwR/
         szw/MHz2Lk41D7o+axzxXreg55M9LDz4V3XKF+c+j9Bwu4y7PgkMpnBuBU1mmPwYqWVA
         4f/BAvWyj5XIcQSONx8No/0BjllDP9rO4FoosuqyF9aCbpFslj2dQZ4TV1eWBa44/ZJF
         r8npMNMC88OmjRO5ooEdzte20FvSgDdoheAPsReqBcO4x22juRhX+8dToyMxBNs3WOUV
         6K6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiBJ91iRzopvnwMd+x8LgIEg8MmwBTwc605K8GvdmQc=;
        b=mB/naRrMKjQ0sSr05g0xZ+6FRX5DV8Ebtey/D9TS5wiyHMedpauo/v+Hf8v+TSZqg7
         TUzeVCmXaooVABuzwYs4SjQA8AQBBoHpyTMcq+B+SS0I+k1JADhMo+/QjZFvgdWGroPa
         YHa+T4Zly5oMaLz3pWi2oUkefbcjp1FKao8gcMKSLt6sqlBHI8n65M4Kv6KvkNwmbQhO
         lgGpVCdp+9devYyO+lNyT7/wFFb4nlxRhqFhl+LxQxrX6hVRfjQ1trEYYWDHaoFQyjYb
         JRZhh/LbafEOwP6yA1XMKtHs/nMUQbEhoUf0HkUZ5zRiqY2lQZP57U4kciyo5hzd92X1
         AvGA==
X-Gm-Message-State: ANoB5pkIZhOcm0ung7aDKuGu8xOP4kctBPrIeFm315VGex4/IzbXQk0T
	EHkIfmjFeJoAEpXt4g75oFBeK2JDjRncYjik26M=
X-Google-Smtp-Source: AA0mqf5I7UZEItcCpunjuNOvfb4KinKcNt2a2fVgONA1rsySJy1xvlYR9CdKCbIDquZPJcwfm1akSw==
X-Received: by 2002:a17:90b:4f85:b0:216:92a9:fd60 with SMTP id qe5-20020a17090b4f8500b0021692a9fd60mr50663486pjb.24.1669472156139;
        Sat, 26 Nov 2022 06:15:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 24/37] qemu-helper-native: Re-write bridge helper as C program
Date: Sat, 26 Nov 2022 04:14:28 -1000
Message-Id: <adabfbd9245553d1fb6abb050856e3da89f7a3d5.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173817

From: Joshua Watt <JPEWhacker@gmail.com>

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f698e98f2f09952b34488b8cf9e73e82bd7aea07)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


