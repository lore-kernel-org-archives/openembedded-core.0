Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4A7C48BE4
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 04:15:58 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.10841.1659845753258587592
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 21:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UzK3o9up;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 t22-20020a17090a449600b001f617f2bf3eso2933282pjg.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 21:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=VxhrVuWnyAtVcuNfPCP07tvpC93IjwB09C0SmWEmetE=;
        b=UzK3o9uprg5yu3qVt5Xqo6SovAXGDtbqf3E+uQ2n3xclkXOJLSPujueZX1BU4nylTf
         6Yn248ccG1mWu5rAluubFWLuK//jzF0y32/E+tUM/1Sgm2hPjLbX2mY9lMVnogCln7Ii
         6FO1JfF4GsJZeC1ag1WoW7JZi8cmLllwALdPO+u135rH/a829l7f5N8ER9fZocDsSkAa
         7mwQwXjpLgJaijv8Q8V9FoFltEc9gBM3sb2OxKscbo9HMC/GgeYhCM18M6+URh2AJ/2A
         y6JP0LoANSM0vF4yeDeXtUZRPxHrBPSPYF9eEQwX4qBaOQmswZvZBSlUjXYfGormrSxC
         3TkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=VxhrVuWnyAtVcuNfPCP07tvpC93IjwB09C0SmWEmetE=;
        b=IatJTTVJPIE/c3usABkPQi3KHa2wn+hVAoOR152HxA/JtPEra3qoqYFHTCPJ1zMcyR
         SUJGepK68sbzrqrzOut3jthiNsecGnG0lxaoO4KkqoaPmziOiqSvf+Aq1CQWbgBZcPQW
         i2TvE/nnUBGSp/ZhOoRrzF9vzgAh3WmTTv3DxCoEXJdL/eeLibMN+8VqP/zFbDExxXd0
         uLyGZXwUPbWUZjnPyVHi3TiI/LrtBrwgXs1Czk2Y8KOZhawlbSKiwTlVL7jHVPXCdI99
         jEp+6aQyUj0eVZBP9nOFe/wLaAUs467gney9iT6tbHthlVo2weKjIHDWwOt2YSOy2GQk
         pzQA==
X-Gm-Message-State: ACgBeo3j8PAvtUCHFbfHMxQUg2sUhipqnhAu3Ksv4FRqCIP7B9KcfyjM
	9G7wtItn40+LiCF5bGyeOSm/9YzSty4=
X-Google-Smtp-Source: 
 AA6agR41HD2gJjp2kvqpVi5ZnssLeL92zcbiFTDPYE/cMIFKrYK6btNP5XEg+4arl5JrUlHf0O6wEA==
X-Received: by 2002:a17:903:2c6:b0:16d:d2c2:9939 with SMTP id
 s6-20020a17090302c600b0016dd2c29939mr13504856plk.42.1659845752113;
        Sat, 06 Aug 2022 21:15:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 z67-20020a626546000000b0052e8bf1c27fsm5654146pfb.31.2022.08.06.21.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 21:15:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 7/7] efivar: Fix build with glibc 2.36
Date: Sat,  6 Aug 2022 21:15:41 -0700
Message-Id: <20220807041541.2665647-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220807041541.2665647-1-raj.khem@gmail.com>
References: <20220807041541.2665647-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 04:15:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168988

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...x-glibc-2.36-build-mount.h-conflicts.patch | 60 +++++++++++++++++++
 meta/recipes-bsp/efivar/efivar_38.bb          |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-bsp/efivar/efivar/0001-Fix-glibc-2.36-build-mount.h-conflicts.patch

diff --git a/meta/recipes-bsp/efivar/efivar/0001-Fix-glibc-2.36-build-mount.h-conflicts.patch b/meta/recipes-bsp/efivar/efivar/0001-Fix-glibc-2.36-build-mount.h-conflicts.patch
new file mode 100644
index 00000000000..28dadabe6b3
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/0001-Fix-glibc-2.36-build-mount.h-conflicts.patch
@@ -0,0 +1,60 @@
+From 7b0e7ba674321ec1ddd6b9cbb419e5fb44f88bb3 Mon Sep 17 00:00:00 2001
+From: Robbie Harwood <rharwood@redhat.com>
+Date: Thu, 28 Jul 2022 16:11:24 -0400
+Subject: [PATCH] Fix glibc 2.36 build (mount.h conflicts)
+
+glibc has decided that sys/mount.h and linux/mount.h are no longer
+usable at the same time.  This broke the build, since linux/fs.h itself
+includes linux/mount.h.  For now, fix the build by only including
+sys/mount.h where we need it.
+
+See-also: https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
+Resolves: #227
+
+Upstream-Status: Backport [https://github.com/rhboot/efivar/commit/bc65d63ebf8fe6ac8a099ff15ca200986dba1565]
+Signed-off-by: Robbie Harwood <rharwood@redhat.com>
+---
+ src/gpt.c   | 1 +
+ src/linux.c | 1 +
+ src/util.h  | 1 -
+ 3 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/gpt.c b/src/gpt.c
+index 1eda049..21413c3 100644
+--- a/src/gpt.c
++++ b/src/gpt.c
+@@ -17,6 +17,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <sys/mount.h>
+ #include <sys/param.h>
+ #include <sys/stat.h>
+ #include <sys/utsname.h>
+diff --git a/src/linux.c b/src/linux.c
+index 47e45ae..1780816 100644
+--- a/src/linux.c
++++ b/src/linux.c
+@@ -20,6 +20,7 @@
+ #include <stdbool.h>
+ #include <stdio.h>
+ #include <sys/ioctl.h>
++#include <sys/mount.h>
+ #include <sys/socket.h>
+ #include <sys/sysmacros.h>
+ #include <sys/types.h>
+diff --git a/src/util.h b/src/util.h
+index 3300666..1e67e44 100644
+--- a/src/util.h
++++ b/src/util.h
+@@ -23,7 +23,6 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <sys/ioctl.h>
+-#include <sys/mount.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <tgmath.h>
+-- 
+2.37.1
+
diff --git a/meta/recipes-bsp/efivar/efivar_38.bb b/meta/recipes-bsp/efivar/efivar_38.bb
index 42625fa041f..6a6918931ba 100644
--- a/meta/recipes-bsp/efivar/efivar_38.bb
+++ b/meta/recipes-bsp/efivar/efivar_38.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://0001-src-Makefile-build-util.c-separately-for-makeguids.patch \
            file://efisecdb-fix-build-with-musl-libc.patch \
            file://0001-Fix-invalid-free-in-main.patch \
+           file://0001-Fix-glibc-2.36-build-mount.h-conflicts.patch \
            "
 SRCREV = "1753149d4176ebfb2b135ac0aaf79340bf0e7a93"
 
-- 
2.37.1


