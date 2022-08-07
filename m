Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50FAC25B0C
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 04:15:48 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.10839.1659845746782525315
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 21:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MZRLHIfo;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 13so5897019pgc.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 21:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=HiapugUhpST0IJ2JcT6f1gidanXmCcQAZZ6bd8EOl38=;
        b=MZRLHIfo4ukTYbRFnvP7oGcnfhi6r+YFSNGGbrVOwYIMFXZM0VKo4NZ4Ubd6oMp4Qj
         +BT5mbt1ox+n950mmt117DnnUEDBf4YWeB7tDNNkwKqHv7J6ilXWnUnykxw1zBIXqXZD
         4qjsS8QdhB8rsLW7felEo9qmEJYpTwWlC69+hf8PBhudbbC7ivXL4fKZ25CjQt0bdPHJ
         O0lfGfLS9CD9KrgzXP/Y0Ak2S3i7yzn4VWn3+YLfDOZoY/2wKSJhx0Hm4QuTOqQuOKBp
         5D+GVfCjmSj3XiD/B9J2SE/j39pa3hd/DMd3wquBnKAiA8eOrhRE9pMD/9/m+FFcaP5m
         mbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=HiapugUhpST0IJ2JcT6f1gidanXmCcQAZZ6bd8EOl38=;
        b=8HDjOz7UPIuHSySw3yMv2uJwB65mij3EdxkV8iHLPfm+VDZEu4b53epWPFRvpX+AOP
         JF2kt9YCVfpolSoti0AEtscULYdvBRG+agauXJENGSaVbGEcWESnB98Fjm3gkgSkJ1BN
         wlg0Lt7oEwN3uE0E6W4WopKbZoInpcSJQvx0FImwfNMt6XDVc5+JSN43oainvNK8BayP
         YtMknkjM/jlSTHsc1a4mCPUdBWw7ETQOmREMVVWCcJKJAk9aT0aWIreyJSAB+HiSppaZ
         orf6PmOY293Dfn/rDPBkSxe3jg27M4ptlLDdLBeUdJMEiXchP/cmw5SgByMsUsZNRO3a
         HKbw==
X-Gm-Message-State: ACgBeo1xEJy/ATc90UquJQz2tc/zGBikfRa1q2fyXaly0aPmX8xU8PP0
	m2myVth4BBC1j7q2tsjShIzVWnz2JCI=
X-Google-Smtp-Source: 
 AA6agR7POSX4hlgKY3oZ5bG80V268oeQeS4/0AAS7j9eAORVdjAc/vFrSkH01JsXS6bCWEan0RNDZA==
X-Received: by 2002:a63:fe46:0:b0:41b:bf59:f4a2 with SMTP id
 x6-20020a63fe46000000b0041bbf59f4a2mr11405128pgj.198.1659845747022;
        Sat, 06 Aug 2022 21:15:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 z67-20020a626546000000b0052e8bf1c27fsm5654146pfb.31.2022.08.06.21.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 21:15:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/7] mtd-utils: Fix build with glibc 2.36
Date: Sat,  6 Aug 2022 21:15:37 -0700
Message-Id: <20220807041541.2665647-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220807041541.2665647-1-raj.khem@gmail.com>
References: <20220807041541.2665647-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 04:15:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168984

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...used-linux-fs.h-header-from-includes.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
new file mode 100644
index 00000000000..73d4a8475f0
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
@@ -0,0 +1,31 @@
+From 6fb10bd18488ed84776675bc1b2982800a51d839 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Aug 2022 20:14:38 -0700
+Subject: [mtd-utils][PATCH] tests: Remove unused linux/fs.h header from includes
+
+This header is not needed, moreover it includes linux/mount.h which is
+now in conflict[1] with glibc provided sys/mount.h from glibc 2.36 onwards
+
+[1] https://sourceware.org/glibc/wiki/Release/2.36
+
+Upstream-Status: Submitted [https://lists.infradead.org/pipermail/linux-mtd/2022-August/094667.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/fs-tests/lib/tests.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tests/fs-tests/lib/tests.c b/tests/fs-tests/lib/tests.c
+index d1a2e0c..3db0426 100644
+--- a/tests/fs-tests/lib/tests.c
++++ b/tests/fs-tests/lib/tests.c
+@@ -35,7 +35,6 @@
+ #include <sys/vfs.h>
+ #include <sys/mount.h>
+ #include <sys/statvfs.h>
+-#include <linux/fs.h>
+ #include <linux/jffs2.h>
+ 
+ #include "tests.h"
+-- 
+2.37.1
+
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 3318277477f..d5dfbcdf7a0 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -16,6 +16,7 @@ PV = "2.1.4"
 SRCREV = "c7f1bfa44a84d02061787e2f6093df5cc40b9f5c"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
+           file://0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.37.1


