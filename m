Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE04C54EE9
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 18:11:18 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.16126.1662315071375386215
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 11:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GM5WQvbV;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 n65-20020a17090a5ac700b001fbb4fad865so6665227pji.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 11:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=JwW3waC4p6kqqEVvb8+VPBqKRT6MXKHVYk6yvfXSC2Q=;
        b=GM5WQvbVGq26mRTYkQBsNlWK6q04+SC572KJH4NF28hnFKcQFYi+nxKTF1ZreOwqz7
         9mVlzB8olomjbTn733ExAmO32tArLvQNUUW5UoU4UJpEd2YdF82lGG9QiOjDBJ4x1Xax
         dLCtuSwRLC5GVPv34iEBfAjdZUdcuZKjLX5yAJ+aG2kYZYHgt1Ci5a0YOqClina65UJp
         ipMHu9BhY2rzvFkxrh8VQ0yxy3WGAEjeDq1hlLdwppGs3eGN4RaBih0r1LIBlIQnez/L
         37FaOWDnaY6dJyPSO1uSWhebQ5JCIQiC05OMHEc92I+ED07f164POH4kH1s9V8RELzS/
         lKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=JwW3waC4p6kqqEVvb8+VPBqKRT6MXKHVYk6yvfXSC2Q=;
        b=QaLZYjYpTRBidJa34V9R2VtyMQcxfzvquVAi26KMYqaKp3GRyoqUfBIoWcV5qCXUZg
         vWLRMygACn2Ct/poXJ2oXClVriwn6rE1/J6pcg+vR6XL91CL8qKiZwxLsUVOdCUAK8mI
         O/nrFHAOqfpHboa5+lwVONIShPnT+/rYArDjYZFxxgJDyxkSBcwUNdfvHGhG3N6HT93N
         58Npg7F3OjovuQy8kFqiRk9G4nmHo0INZ4lvx0hL96nmE9xc1rpnlg7fxEgRaz0uqrSu
         n3mYFsKtFiQFRZT36Hl8NbFeORojlFz31sgYqdiOAQm4o1+jHMD6ZuPx6r3RzUdqOwGF
         kZcA==
X-Gm-Message-State: ACgBeo3yNavxxykES5oMH/Hhgd9FOjzttx18AhufMA0Cs13oXx2K0BBn
	SCV/4NlB538UNLlHrPg/BZS3lXpLjEYcwA==
X-Google-Smtp-Source: 
 AA6agR61GzFw5z/nZ2CH7AQpEdaeNe9GAYnMJYbJWM8a9c/J6TkaG9frqkPhgBLKKjnZr5mZlH3hEg==
X-Received: by 2002:a17:90b:278a:b0:1fd:c2bf:81f5 with SMTP id
 pw10-20020a17090b278a00b001fdc2bf81f5mr15598466pjb.81.1662315070452;
        Sun, 04 Sep 2022 11:11:10 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 jn20-20020a170903051400b00172b5d1e054sm2317687plb.17.2022.09.04.11.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 11:11:09 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [PATCH] rust-cross-canadian: Fix for the linker issues caused by
 using the shell
Date: Sun,  4 Sep 2022 23:39:46 +0530
Message-Id: <20220904180946.1954417-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 18:11:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170290

[Yocto #14892]
This is a fix for YOCTO #14878 patch. When sheband is more than 128 characters the default shell /bin/sh is used to execute the linker instead of SDK shell, which causes problems with LD_LIBRARY_PATH.
With this patch shell usage is avoided.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 .../rust/files/target-rust-ccld.c             | 39 +++++++++++++++++++
 .../rust/rust-cross-canadian.inc              | 11 +++---
 2 files changed, 44 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/files/target-rust-ccld.c

diff --git a/meta/recipes-devtools/rust/files/target-rust-ccld.c b/meta/recipes-devtools/rust/files/target-rust-ccld.c
new file mode 100644
index 0000000000..13f06b38f8
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/target-rust-ccld.c
@@ -0,0 +1,39 @@
+/*
+*
+* Copyright (C) 2022      Wind River Systems
+*
+* SPDX-License-Identifier: GPL-2.0-only
+*
+*/
+
+#include <string.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+int main (int argc, char *argv[])
+{
+        int i=0;
+        char cc[1024];
+        char *cmd[1024];
+        char *ccargs[2][1024];
+
+        strcpy(cc,getenv("LD"));
+        char * pch;
+        pch = strtok (cc," ");
+        while (pch != NULL)
+        {
+                strcpy(ccargs+i,pch);
+                printf ("%s\n",ccargs+i);
+                pch = strtok (NULL, " ");
+                i++;
+        }
+
+        strcpy(cmd,ccargs+0);
+
+        unsetenv("LD_LIBRARY_PATH");
+        execv(cmd,argv);
+
+return 0;
+}
+
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


