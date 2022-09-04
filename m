Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4DCECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:24 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.11125.1662276858282547897
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K+cw4J4b;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id p18so5770703plr.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=co6zoSaWXBUF+IWSPO+CL69SjyhaL3KkTY+spzbLSWs=;
        b=K+cw4J4beRRn6xwzPS0HIJrR/ER77HlkPQcWCb+eVJqWlUuC5edm6AdjIrRqsTpoPv
         QAp1heM8IAEfLzVI8kK72n7USM5vLkbAlSf8L8x5BXULelNZ8HUcABeRf0RywL3xESBi
         ciVz1wswfAx4vETSYztPThvkuC8JxmCcA7e5hFR0XzBWs60iZS8asmcfAbgs/hZET37i
         9jAUnm8dAl/rQPWbF/pyTH8vk9bki+lGmuhq8BDrQWb91aEPcIW5ytCJoybt7WPcBnHs
         2XFXf3/fcVQReUZYon4S6/Uy/cwV4DZTBRMPtDSd7r7rJ3pgJEIIRTaIor3TSiYpoau2
         Ateg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=co6zoSaWXBUF+IWSPO+CL69SjyhaL3KkTY+spzbLSWs=;
        b=fkfEquKmVPIhVLQDLA+6XWOkJFtfmJ7PQW7j9Xn+lIpQHF+vRJDBh+7txjKtElkAE/
         SohfKzGFFtjv3pxIDIezcWOXGObZafJh2TOBdCVV1OCGkE3T9p27Enz06R1o+pZTxkbC
         /xjyTK9mLsVTlUstvFprrdvkAGxI76DdZd9/8UzvXQeHXMMIO82D8Hs3mLvjFcpuNAb8
         7cA5nBTTYz5+b9FeO1Aqyzxq7P57XK42kG4dVPbkKFuxphXvobqKghT9ckAaAHPfOZKo
         Q7q/lLHnJYqF1Gf5/dUcYUSo+mccLMstKEIBGSUU6mrjX+bv32/mmx89df+gzm9rxuLv
         n6gw==
X-Gm-Message-State: ACgBeo2SAFdAR/P9D7hzy7d8SVvH7AXJpqLrFG5JGLHiTPOSt+n1Acyf
	+v+5a4QhW5MxPGNuf8Hgx07uOrwWeMkuQw==
X-Google-Smtp-Source: 
 AA6agR6uSZJLt9Xz3Wf9H3gmA76NMGuYM0pnp3agopuei1z4TB69GdkbMiysXCKPMXZMWIHlCIDLyA==
X-Received: by 2002:a17:902:bf48:b0:176:9e69:253f with SMTP id
 u8-20020a170902bf4800b001769e69253fmr2404566pls.130.1662276857325;
        Sun, 04 Sep 2022 00:34:17 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 x6-20020aa79a46000000b0052d432b4cc0sm5082352pfj.33.2022.09.04.00.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:16 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [PATCH] rust-cross-canadian: Fix for the issue caused by using sdk
 shell
Date: Sun,  4 Sep 2022 13:02:38 +0530
Message-Id: <20220904073238.2707233-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170281

[Yocto #14892]
This is a fix for YOCTO #14878 patch. When sheband is more than 128 characters the default shell /bin/sh is used instead of SDK shell, which causes problems with LD_LIBRARY_PATH.
With this patch shell usage is avoided.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 .../rust/files/target-rust-ccld.c             | 20 +++++++++++++++++++
 .../rust/rust-cross-canadian.inc              | 11 +++++-----
 2 files changed, 25 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/files/target-rust-ccld.c

diff --git a/meta/recipes-devtools/rust/files/target-rust-ccld.c b/meta/recipes-devtools/rust/files/target-rust-ccld.c
new file mode 100644
index 0000000000..5d903a0d1e
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/target-rust-ccld.c
@@ -0,0 +1,20 @@
+/*
+*
+* Copyright (C) 2022      Wind River Systems
+*
+* SPDX-License-Identifier: GPL-2.0-only
+*
+*/
+
+        #include <string.h>
+        #include <stdlib.h>
+        #include <unistd.h>
+
+        int main (int argc, char *argv[])
+        {
+        unsetenv("LD_LIBRARY_PATH");
+        execvp("x86_64-pokysdk-linux-gcc",argv);
+
+        return 0;
+	}
+
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 7bf75a4712..375c435bff 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -7,16 +7,15 @@ LICENSE = "MIT"
 
 MODIFYTOS = "0"
 
+DEPENDS += "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+
+SRC_URI += "file://target-rust-ccld.c"
+
 # Need to use our SDK's sh here, see #14878
 create_sdk_wrapper () {
         file="$1"
         shift
-
-        cat <<- EOF > "${file}"
-		#!${base_prefix}/bin/sh
-		\$$1 \$@
-		EOF
-
+	${CC} ${WORKDIR}/target-rust-ccld.c -o "${file}"
         chmod +x "$file"
 }
 
-- 
2.25.1


