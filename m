Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D42CC47088
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:23 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.92040.1669557352166009215
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:56:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cy3HgWUs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id p12so7866286plq.4
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYDm+4SSyac8+zL71PJFg9pFdCfIxl2NAimN6cIHx7Y=;
        b=cy3HgWUs9NAYGaAfSExR1Sr+kKg45G1dF8t3lErIuv3EImo+zInwknTui3r2o5ccbQ
         0lo2RMPnxHqqCzBMY5PEEZ2YBAFEaUuHmlIckk9/aPG0jEHp5BrsPPVkz5yIUS+UqsAk
         evCzXJhXDc7epUp9qmTjKVrWRlAzPZR+wrLTip1aMcQQyhvlFbPs4/oSkf6HSOvOhTZJ
         SrTl++RUaeKZtIX+ecSHmfZmpk0ApR9cBkv47iwaeI1xc8YkZ3cZivfqQDj+gdIBnolF
         aN+BnBGHPou/scWgYKoOIHhpcLSga545M2JRKVFBsvhvvpWrM9G2xYXVqZOnrGhRjeHo
         e2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYDm+4SSyac8+zL71PJFg9pFdCfIxl2NAimN6cIHx7Y=;
        b=v6yx8VlEldPWghadjV/usVv1eDDPC/pA1XNb87u7v0juf6NglsQVl6Kpfi+e7/IzqN
         cKgHO+l4rknzowhM87uizDSn3jT6EOF68AF/1QTGnRi3Ss9VscNVRTzJF/3ziwWuT+38
         75N+E9vi0iT0SULepOWesyW3ibXtHLfLcLCJRe5SjGIB9yEVBmvjBIAqucObpmaeWjgW
         bGKaTU0ax3o378hQf/eRPMRQkKzh886jeyF1tBPUitqkybSqUgI+nlz/JCGIMRn92bGD
         JCIyc2sDSpBu9ybTE5LHGyctT4ejItsrLFntA0iPbGBfesqeKlCi6opgZrmdM09TIwTB
         P4fQ==
X-Gm-Message-State: ANoB5plCbkDSW0wgPLyKORZOgcGc3vHIEYlGSLAd6dxtl669PvlLKPDp
	YfOOmhsQYc90aaky1OPxKrRyrvWAgssfJavIvwA=
X-Google-Smtp-Source: AA0mqf54AifLOGFX0KdSqf7hvBcU8d9oYXb+yxfyc1hg+KU45EWrFX5ArezWSj6ISyCj4Cy/jU/NGA==
X-Received: by 2002:a17:903:286:b0:189:39e4:c50b with SMTP id j6-20020a170903028600b0018939e4c50bmr25079706plr.101.1669557374330;
        Sun, 27 Nov 2022 05:56:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.56.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:56:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/31] qemu-helper-native: Correctly pass program name as argv[0]
Date: Sun, 27 Nov 2022 03:55:07 -1000
Message-Id: <c8b7a0570903fc7916530c2fcffaee3b61f27301.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173866

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


