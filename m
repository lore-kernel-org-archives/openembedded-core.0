Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BD8C47088
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:16 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.70818.1669472112228844556
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nVT3P+tx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id q1so6079616pgl.11
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3mYfMpuoN1TcJMmz5Lmz/AJV0WiyaoUrnb+iKHJMpI=;
        b=nVT3P+txCXd0ST9PlTNycXtSd3YoUk7CnaurCreb+OWG5MIMbQahkjf3w8hzvw4MUC
         a1iGldyyInFIahDkhr28u2iTgNRPqCi1AYzFVBxpZdr9jE5IwjGmmHaFzmkxmbXEIf2S
         VvGdb9noVZ1zmHiQeErmvGZSQO/JBjeEG2HewyHfcxK0D7xIpSdJmBYxeO7rk1t3R/0v
         fvtGeVaWSciBgj1XrAnrS7I3jt+Pfprb4szqKmm9yyrce65+A2ORHZ2btmX1HwoZPWt0
         PBJj8V6aC8E5RdJCpi/QS3La3gOpNuC+dR3K7DPMrO+BngUJQxLz27pKWoLBhih/X5Az
         FMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3mYfMpuoN1TcJMmz5Lmz/AJV0WiyaoUrnb+iKHJMpI=;
        b=uupjXKHjV8yJWU6JsVsDfds4mr616s8Gn55Vqcn2WL4fNyJ2OHTfijQGpDJi7YP+dR
         EYNLoy1zzd0BOkNs9M9f7JV07ee6Fqk45KcPc8i3RKpZPBJP7FSw+gT+x5HEfA0TqM0G
         qqhUC+NLvbSKRiKSl/vsAG1dqVOenyjF9CE8IRAgJINBysKfQAHc87MeOFrCleNtEeoW
         zH71r2krbx3bTEt85gFMLyXPSZqmoj8KTy2tnXfgc7PzY3RU1AEWo8GzRKWdEVGF0ItK
         AzcqztBw2ZBteTCSqsf3riWDZEw1fu1p3hveWnYrtk9acLAD0DbpKiZzGtRM4NjGHRHs
         10iA==
X-Gm-Message-State: ANoB5pm17j4s4LvyJy6TIhJz7OQ91F9S4X5Yjntz041RNvC5kdhPZqJK
	UQ7sDtt8O2jItiZyNRJEFeVnFcu2j4xy+LvoAhU=
X-Google-Smtp-Source: AA0mqf7Sr5FOgJAfNUuBWvY4TAm8WabbUjjEQ62YHYZox/VyVQiOhiPuRT3Y952bpwJGG+74wI8L3g==
X-Received: by 2002:a62:838f:0:b0:56c:8b7:f2dc with SMTP id h137-20020a62838f000000b0056c08b7f2dcmr28160078pfe.16.1669472111117;
        Sat, 26 Nov 2022 06:15:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/37] mtd-utils: upgrade 2.1.4 -> 2.1.5
Date: Sat, 26 Nov 2022 04:14:11 -1000
Message-Id: <b0ad2ab380c0f4dfb483845723a2dda4819cd4c4.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173800

From: Alexander Kanavin <alex.kanavin@gmail.com>

Raw short log since the 2.1.4 release:

Alex Henrie (1):
       mkfs.jffs2: fix spelling of --compression-mode parameter in help text

Andrew Mellor (1):
       ubinfo: Fix --vol_id return code for absent volume id

Christophe Kerello (1):
       nandflipbits: fix corrupted oob

David Oberhollenzer (1):
       Release mtd-utils-2.1.5

Enrico Jorns (1):
       libmtd: do not ignore non-zero eraseblock size when MTD_NO_ERASE is set

Frederic Germain (2):
       .gitignore: add new ubiscan utility
       Fix warning about unaligned pointer in jffs2reader

Khem Raj (1):
       tests: Remove unused linux/fs.h header from includes

Michael Walle (1):
       mtd-utils: flash_otp_dump make offset optional

Mike Frysinger (1):
       fix test bashism

Rafał Miłecki (1):
       nandwrite: warn about writing 0xff blocks

Sascha Hauer (1):
       mtd-utils: nanddump: fix writing big images on 32bit machines

liaohua (1):
       nor-utils: fix memory leak

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a3289c988764e5b864873b4adc7656c101a5b9c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


