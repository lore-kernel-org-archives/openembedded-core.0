Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBCAC41535
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.4301.1667832921280123705
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GeoAjORu;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id k8so16649915wrh.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4F8lAc6KDF7AqsEmYoY4G2ReSjn503NyuOnMvq96bxs=;
        b=GeoAjORukmc37vs0cRY3fZraG5NiOdwh2vTMUXAo7sU1IHqKboXOkGM730Pdky+sio
         qXir884dCIuk/Y0SUHHrjzeGnCLWVDNHcCwsF9hFjUVRfapym6EP0JcSkYk3zvz6cCA6
         7VHFxfwvYksAxECbpHgn9R1u7qz4XgRyrBS0HSnAsal4OGOAGQgREWsWuiRvrqYmgk9M
         SrifjSdItAN3Idx2KURT/DA35BSzsPpZDbr3HwqK2/MqwRjO8kwp+pUO05/T037W6xQx
         a7hRsnEcM4QhIEnIJ2FzjT+5KXmNnsXeeYdLIV6dsP7Igv4CdgUQXjkix30n1EJRSMv2
         H0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4F8lAc6KDF7AqsEmYoY4G2ReSjn503NyuOnMvq96bxs=;
        b=L6oNXNUl7nWOurHHu5CmpgJW+gLoMDO1I3HRJSICK7Or0z8wDyzjb5RezhKL3XJfRN
         t3awAAaw9anbpeitwcraOzcNFWZSLPcwlC1uN1GIFqj0awt8eKq6FZvCL0ixevkHp+FW
         +YcUou9dCXVFXj1r9th15+9SPccO39CN11CkORHYk5cA46PZwM4/92UrHl7BMNSmFyux
         PIbJ9hXerLpJ6tP8nUMzXwD9vPpK/uVYt6Cs0/3QrmEU1icFVXt5sIbILqHJHeHeTu3u
         TknTuERfZ+d2QhVljRt2lCIqqF2fUK3vB8TIPgSHRxIvi8PjNfnJEghvXiIb46hPi+3m
         N1GQ==
X-Gm-Message-State: ACrzQf2iUd+uDzqeJqNzHyDghf+pBPfHEDG2DC/D+Ksp8VXQi0RJPE7/
	z1BqP0nBLVtv9tMr2BkhEw9XEcXoNRU=
X-Google-Smtp-Source: AMsMyM4HJKmSRZfpm7CBcSmGqHvAubSEj8C41pM1LUgqa+Hhn3TgidJgj4iSXWLQBxFMdTUtmMbTwQ==
X-Received: by 2002:adf:e810:0:b0:236:5152:b95 with SMTP id o16-20020adfe810000000b0023651520b95mr30568060wrm.529.1667832940176;
        Mon, 07 Nov 2022 06:55:40 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/48] mtd-utils: upgrade 2.1.4 -> 2.1.5
Date: Mon,  7 Nov 2022 15:54:46 +0100
Message-Id: <20221107145508.1051404-26-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172876

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...used-linux-fs.h-header-from-includes.patch | 31 -------------------
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |  8 ++---
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
deleted file mode 100644
index 73d4a8475f..0000000000
--- a/meta/recipes-devtools/mtd/mtd-utils/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6fb10bd18488ed84776675bc1b2982800a51d839 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 6 Aug 2022 20:14:38 -0700
-Subject: [mtd-utils][PATCH] tests: Remove unused linux/fs.h header from includes
-
-This header is not needed, moreover it includes linux/mount.h which is
-now in conflict[1] with glibc provided sys/mount.h from glibc 2.36 onwards
-
-[1] https://sourceware.org/glibc/wiki/Release/2.36
-
-Upstream-Status: Submitted [https://lists.infradead.org/pipermail/linux-mtd/2022-August/094667.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/fs-tests/lib/tests.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/tests/fs-tests/lib/tests.c b/tests/fs-tests/lib/tests.c
-index d1a2e0c..3db0426 100644
---- a/tests/fs-tests/lib/tests.c
-+++ b/tests/fs-tests/lib/tests.c
-@@ -35,7 +35,6 @@
- #include <sys/vfs.h>
- #include <sys/mount.h>
- #include <sys/statvfs.h>
--#include <linux/fs.h>
- #include <linux/jffs2.h>
- 
- #include "tests.h"
--- 
-2.37.1
-
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 943666e529..2d76991d2f 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,12 +11,10 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
 
-PV = "2.1.4"
+PV = "2.1.5"
 
-SRCREV = "c7f1bfa44a84d02061787e2f6093df5cc40b9f5c"
-SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
-           file://0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch \
-           "
+SRCREV = "3f3b4cc6c3120107e7aaa21c6415772a255ac49c"
+SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


