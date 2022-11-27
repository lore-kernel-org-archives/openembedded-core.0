Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417BEC352A1
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:23 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.92055.1669557373607379098
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:56:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=8L/jXlg3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id p24so4119318plw.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uiBJ91iRzopvnwMd+x8LgIEg8MmwBTwc605K8GvdmQc=;
        b=8L/jXlg3rXtyx6zFX33CYCSx11lCq/h+DNTqaYe0mdAZjPI/gl/SHasL0kzoijmoh3
         MXQRvL/SQhGGLSTs/hjhop6ZzHp0EksBaFOhZrv3oyJ1Dickgqo0gbqR84DSHB5tJjcn
         kBLtbUoEKK8PDAyYmThuR424vFnNvqAby8p+8lY31XLTnNhKC+1fssn9sitR0g61GD46
         1QAAhCyYw58nMu9jNKiWMEkbxp24ScpXId3vvW28YD4NEt6tRLNi+MgjRTBS6WApGN0k
         UAgfERTjgdtteYmHxCIP0bK//XyYDEtTeDoZWUjpP+yOyoZPZPZYB3F4xLClTkmqkAlp
         6lfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiBJ91iRzopvnwMd+x8LgIEg8MmwBTwc605K8GvdmQc=;
        b=TWJTDenh4l/zWVdGrlQsfoGdcM6VIav6fk7/ftrgVg3AW/uy02oRw+C1+4sikfpAJE
         Ec9dDpeolxF4ChgO9RZPzJz4u/gqCdfmZXAtMLCVGLEsMhiJxVxbxKTnbIDkmvwJCHvt
         Vzz+B/q9LEoAzrMUjXK57EOZPHylPENxY16nWG530zPiBPBABg4cmFxYhfRlp4wfg7DF
         QQRaJQAgfNYGW/uuBqyTjg0qiyBLusJHe0xoCslKxYH7z+KytQYuQTOOpk4wEY4jSCiC
         GH/7Ss34hW/xZunQ2ciIMvC3AYQTImangQTdz8CnSHsWbymRU52JY2Z+Fy1LGCMDr81j
         inyA==
X-Gm-Message-State: ANoB5plvWjBeQM8Rlm+/tUR5dLBA5YbzA0TyIL8Be3sxKzfLJTvgnPFs
	73CjcvUNVSZJ/v8zDbpsuxE1DC0C0ZgrdQjATBI=
X-Google-Smtp-Source: AA0mqf7pFGusGIbCCOyUgfOYhYGOVax3qhpKoWEVFLcQ3TMF6eqJ79XnvikXiu1AHRbXoWj6W8F2Gg==
X-Received: by 2002:a17:90a:d145:b0:211:7e51:9d65 with SMTP id t5-20020a17090ad14500b002117e519d65mr53946199pjw.220.1669557372577;
        Sun, 27 Nov 2022 05:56:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.56.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:56:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/31] qemu-helper-native: Re-write bridge helper as C program
Date: Sun, 27 Nov 2022 03:55:06 -1000
Message-Id: <428a0be91eafb961f0fe92d2abccde5352c54c54.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173865

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


