Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9B8C19F2B
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 14:30:58 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.33303.1659018650145529917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 07:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PwlYoWDL;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 c19-20020a17090ae11300b001f2f94ed5c6so5185863pjz.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 07:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s3xs0Hun53Ns7zk5ReIYbYWuNZzyy0HeZQ2vWQQH5Mw=;
        b=PwlYoWDLaQWULfulV5eOeCcVY8sLZQGymdtMEBUfLA9yovS+48w5XEQts07ey0TdEP
         3/4T9LFAjSKJOYbLuZwwBBgeG3jS+NaTFdaGoqM250Lxv5mFtf3MVBOcI0mklF9yMf3D
         b+86DBFyaiaseCIhtvSkSPCKxR2rkl6CzwxbhS1tsivHvBDvZhl1zZCnRJPsJ3Hpmad6
         Gg2yioEsvWfiCY+o2nvkYv26Y2Kts5yI+YFIrUzsDixaSBdMLEeoCHcXOvH9KO/odhc2
         ztLMRz+4ttDXXsPHAmy9ZeeS9OZo1y7xJz7qNJGRGCQZkN+Zgeqg9ccarJdSDxUP7UMn
         +qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s3xs0Hun53Ns7zk5ReIYbYWuNZzyy0HeZQ2vWQQH5Mw=;
        b=KJm/N4CO+AFdGgN3OzJZaxTJVQ2/C46LFLZEfI8CEm6brvI56bx8/6d/62kRRxAnKR
         JX0cIPJ/WI4oKPP88KuXla6dB8/8NeI3ikvRp9nJihTlVpp6ZUA25O03a3nCQSyX0Yki
         O8Dfwtsqy+cYdvKkFQ69UioMCJk0gCCPtB8GA9sha+Qq4xSZUY1dR06KIx5WavjwrDQH
         aryiDqoeDeKMKhTNhdB/Xb01GCuRZGthbk7Ac+ShMvGGDn3TD1v4oaf1kA4QJil3QUr6
         Clp3A7VhD9Or3lFxtSupm04B9EtGtXnXuo6IjXi36Mm49pnkcfSc4Vt8wRwvAFwe/q1t
         Aj9Q==
X-Gm-Message-State: AJIora/Oig10Q3hM4wSwgrWeOIBpzt3920FaANQ+DiSbeNqoBt0ZyrqA
	QBPsEDmsdmC/yaiCfgFG4WCftlhMd5Kl5A==
X-Google-Smtp-Source: 
 AGRyM1vQdlE0ouj9XnWKn9OicKZ7ql/JD7ogVJwaZVj503MRqmHaLhDtGlCAxHFfkinc+p3w9DE42w==
X-Received: by 2002:a17:90b:4c87:b0:1f2:cf1d:c906 with SMTP id
 my7-20020a17090b4c8700b001f2cf1dc906mr10575841pjb.119.1659018649123;
        Thu, 28 Jul 2022 07:30:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8ca5])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a170902da8100b0016c4cbefea3sm1331481plx.218.2022.07.28.07.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 07:30:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] btrfs-tools: Use linux/mount.h instead of sys/mount.h
Date: Thu, 28 Jul 2022 07:30:44 -0700
Message-Id: <20220728143044.1696098-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728143044.1696098-1-raj.khem@gmail.com>
References: <20220728143044.1696098-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 14:30:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168608

This fixes the conflict thats with mount.h from glibc 2.36+ and kernel
[1]

[1] https://sourceware.org/glibc/wiki/Release/2.36

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...se-linux-mount.h-instead-of-sys-moun.patch | 32 +++++++++++++++++++
 .../btrfs-tools/btrfs-tools_5.18.1.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-device-utils.c-Use-linux-mount.h-instead-of-sys-moun.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-device-utils.c-Use-linux-mount.h-instead-of-sys-moun.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-device-utils.c-Use-linux-mount.h-instead-of-sys-moun.patch
new file mode 100644
index 00000000000..1397e50b30b
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-device-utils.c-Use-linux-mount.h-instead-of-sys-moun.patch
@@ -0,0 +1,32 @@
+From d9f118a3408a8a2530f0f60e8072f4323911530f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 27 Jul 2022 01:08:20 +0000
+Subject: [PATCH] device-utils.c: Use linux mount.h instead of sys/mount.h
+
+This file includes linucx/fs.h which includes linux/mount.h and with
+glibc 2.36 linux/mount.h and glibc mount.h are not compatible [1]
+therefore try to avoid including both headers
+
+[1] https://sourceware.org/glibc/wiki/Release/2.36
+
+Upstream-Status: Submitted [https://www.spinics.net/lists/linux-btrfs/msg126918.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ common/device-utils.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/common/device-utils.c b/common/device-utils.c
+index 617b6746..25a4fb8c 100644
+--- a/common/device-utils.c
++++ b/common/device-utils.c
+@@ -15,7 +15,6 @@
+  */
+ 
+ #include <sys/ioctl.h>
+-#include <sys/mount.h>
+ #include <sys/statfs.h>
+ #include <sys/types.h>
+ #include <stdio.h>
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.1.bb
index 816fc17ae16..5b24bef5cda 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.1.bb
@@ -17,6 +17,7 @@ DEPENDS = "util-linux zlib"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
+           file://0001-device-utils.c-Use-linux-mount.h-instead-of-sys-moun.patch \
            "
 SRCREV = "47b5cf867fc37411ef51eb5c09893a95f7f6c3b7"
 S = "${WORKDIR}/git"
-- 
2.37.1


