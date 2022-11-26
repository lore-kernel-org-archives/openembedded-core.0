Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6FDC4708A
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:16:06 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.70850.1669472158911880147
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=rYsbxOft;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id p12so6308937plq.4
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYDm+4SSyac8+zL71PJFg9pFdCfIxl2NAimN6cIHx7Y=;
        b=rYsbxOft/cDaY+PRRNGQbDuynmHV5kMW1Rsb+S5tnjjEnMiaIPWrvib7jpJTh284Aj
         vmQATggEb/TGEsby98hjjVr6revtRmn52RYb2L9f269SG5KEHxOndWdB9n/Nr31AYSjS
         PSEUC558NmDDbwS9m+DMsA0WXYvEuCDuWj/pXCuUwBWIZQQg6JEihQJ5PRxtu+Ucv17v
         2k89sHHdQcR15sX4pOHTUUWnhsc7xO2aB5AEfzm85A20v816XmDIlhsGS5YW5GTKWK6M
         yC1RNPAJvKCAD3oNX1mFpo4ARGFqE2BsZ2GDOWi2o/gviLtYJABa23BPZyWjysd0N74Q
         51ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYDm+4SSyac8+zL71PJFg9pFdCfIxl2NAimN6cIHx7Y=;
        b=HOZNtTWGDcRsxf8IIzMmgkosUXeRnoMgOy165uGbjCJBzj6R694M2a+JIuLy8Y8yoQ
         PxNQf5+GP9JFUQxrRp+KUTiluLghmHYKPuyzFTgjjrUBvgguQKWx7CAkhAGuDvYcUobg
         WKybJLjFwdomGP9ih+QH39DowD5jWZolnaqaxm2fXhwUI5x26LMsUkmjiQKV1FS1jOR0
         4TIhP4PUjVzvTCZBFJIayQhyP420VnMC3ftX1BwZk9dXbMiyd/7u/aaUF7Hm4c4Nmpzh
         JR6wgZ7fe51fAocJQ2aNRJE3AcQyoTbc79+PP8MqCYOsK8WSxGVTf3TjGNxpS5NixyzJ
         gNNw==
X-Gm-Message-State: ANoB5pnYm40MOUwB/vsTT1vDMninjl4z2rb+16k1GTDL9enEKjSYjLX5
	LKYY9qUxZdqpfECkdTYcVAjzEYci0pByecKbVmY=
X-Google-Smtp-Source: AA0mqf4CelF/RjJQqhG+3KLC0ewJj7yo2RCu4CAevQHcERVIrv4es3cKuzq2ZdZ7gdLuQGQqKr/I5w==
X-Received: by 2002:a17:90a:a012:b0:20d:7c09:c92d with SMTP id q18-20020a17090aa01200b0020d7c09c92dmr45034066pjp.95.1669472157993;
        Sat, 26 Nov 2022 06:15:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 25/37] qemu-helper-native: Correctly pass program name as argv[0]
Date: Sat, 26 Nov 2022 04:14:29 -1000
Message-Id: <25edeac14bf7c68111b9880e1367b3c981d59ea0.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173818

From: Joshua Watt <JPEWhacker@gmail.com>

The previous version of this wasn't correctly passing the program name
as argv[0], and was also over-complicated anyway because argv[] is
guaranteed to be terminated with a NULL pointer, so it can be passed
directly to the execv'd process without needing to be copied.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 6edf38add3c20c44efe0588e2815bb280d22e0c4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../qemu/qemu-helper/qemu-oe-bridge-helper.c      | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c b/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
index cadf2a012a..9434e1d269 100644
--- a/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
+++ b/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
@@ -8,6 +8,7 @@
 
 #include <stdio.h>
 #include <unistd.h>
+#include <stdlib.h>
 
 void try_program(char const* path, char** args) {
     if (access(path, X_OK) == 0) {
@@ -18,22 +19,14 @@ void try_program(char const* path, char** args) {
 int main(int argc, char** argv) {
     char* var;
 
-    /* Copy arguments so that they are a NULL terminated list, skipping argv[0]
-     * since it is this program name */
-    char** args = malloc(argc * sizeof(char*));
-    for (int i = 0; i < argc - 1; i++) {
-        args[i] = argv[i + 1];
-    }
-    args[argc - 1] = NULL;
-
     var = getenv("QEMU_BRIDGE_HELPER");
     if (var && var[0] != '\0') {
-        execvp(var, args);
+        execvp(var, argv);
         return 1;
     }
 
-    try_program("/usr/libexec/qemu-bridge-helper", args);
-    try_program("/usr/lib/qemu/qemu-bridge-helper", args);
+    try_program("/usr/libexec/qemu-bridge-helper", argv);
+    try_program("/usr/lib/qemu/qemu-bridge-helper", argv);
 
     fprintf(stderr, "No bridge helper found\n");
     return 1;
-- 
2.25.1


