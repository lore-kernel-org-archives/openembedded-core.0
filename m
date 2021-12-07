Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92222C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:07:19 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.66832.1638882438458480263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TcGsNm6w;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso1671251wms.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q+Tql/NCbivXhaMY1uxqVIv9+pA6fPUET1S/EfYQsGY=;
        b=TcGsNm6wtnkU7gdQIOCe2CaOK+v9qgPaSwj91UPAzGHhb2Y649W0EAvRCUMrKtTDFB
         RFbKHl3ukh+y4IeliQVtXpfKvG4+A11sMwhZQrEPp7uDXSbVgevtGzIAwvojleMAFRdt
         GzW38kfJ7vgcgpMjQ+nPWYRVu+RmQDyj/1jb0KELnCvzMmdggtoW3Kih9VG0pPY0Z0js
         YX9u1cuU1vfIeI3+8DO/iezpOZQShRMZxioYQVIWfw9W3PYZLGSH535b0rAWTgaLDL43
         4DWwQo3PZ71pP17XhTTOQza7U4OfYTAwMvSJStq5lpRqufJZ/J/FxlRUKo0sgsMlSh9t
         wR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q+Tql/NCbivXhaMY1uxqVIv9+pA6fPUET1S/EfYQsGY=;
        b=ktflwzheNsIpg3Q2i7sD1wWcMEWj+CHhknsLwDlwrj2EnK+nwrQbCkxDp7hGBJ54ZV
         lv4Zkafru5fKpPuplSr8f771F9LEyiHLrgICN32a+XcFuVHfeAfGFqH6yzTQfczASkVE
         +6YNio7zwitqrq1UNZdhgoRTbgUzN+JvGlBxrkerW3pDHdEqL4lcQlOPoiHHzTJmTWJv
         Kp4m8jqzpCp0G4dYB6gGnZw04i9hzyNTUF/PVDuT3HYKP4r6WiSxa7yiSIbtb98Nvx8/
         TNU7BB/46QuYnm/GNtqIr44DJCl5MEyQXu1ct9sD1y10dPVXa/HSYc/qoR4b3ScveEFd
         MYSA==
X-Gm-Message-State: AOAM533QlQDHsTF2zBXHsp7u9iIhibQ/mAFsrTEIbv3EJu3woUSLno2S
	DiEylOQaFzKtGqCR6ZaVWxXLku3Zd0CgSQ==
X-Google-Smtp-Source: 
 ABdhPJzPjelrfxKFuUX3SINFdWeCcS2ElUXJa19dOlkH8JUWE8RJlSznCBV/itjWajoUY6dsQUa7rQ==
X-Received: by 2002:a05:600c:190e:: with SMTP id
 j14mr6655570wmq.75.1638882436952;
        Tue, 07 Dec 2021 05:07:16 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n4sm16592468wri.41.2021.12.07.05.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 05:07:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/16] erofs-utils: update 1.3 -> 1.4
Date: Tue,  7 Dec 2021 14:06:59 +0100
Message-Id: <20211207130703.3196805-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207130703.3196805-1-alex@linutronix.de>
References: <20211207130703.3196805-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 13:07:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159297

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0001-fsck-main.c-add-missing-include.patch | 26 +++++++++++++++++++
 ...{erofs-utils_1.3.bb => erofs-utils_1.4.bb} |  6 +++--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/0001-fsck-main.c-add-missing-include.patch
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.3.bb => erofs-utils_1.4.bb} (79%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/0001-fsck-main.c-add-missing-include.patch b/meta/recipes-devtools/erofs-utils/erofs-utils/0001-fsck-main.c-add-missing-include.patch
new file mode 100644
index 0000000000..c3b3c0bd56
--- /dev/null
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils/0001-fsck-main.c-add-missing-include.patch
@@ -0,0 +1,26 @@
+From 821778286843b8e88d0cd73a97d20b5a2fff8ea1 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 6 Dec 2021 20:12:54 +0100
+Subject: [PATCH] fsck/main.c: add missing include
+
+Otherwise musl C library builds fail with missing S_IFMT/S_IFDIR
+definitions.
+
+Upstream-Status: Submitted [email to linux-erofs@lists.ozlabs.org,hsiangkao@linux.alibaba.com]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ fsck/main.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/fsck/main.c b/fsck/main.c
+index aefa881..ad48e35 100644
+--- a/fsck/main.c
++++ b/fsck/main.c
+@@ -6,6 +6,7 @@
+ #include <stdlib.h>
+ #include <getopt.h>
+ #include <time.h>
++#include <sys/stat.h>
+ #include "erofs/print.h"
+ #include "erofs/io.h"
+ #include "erofs/decompress.h"
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.3.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
similarity index 79%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.3.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
index 77cce2fdaf..6ac8a37163 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.3.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
@@ -4,8 +4,10 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94fa01670a2a8f2d3ab2de15004e0848"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "2cd522105ea771ec30b269cd4c57e2265a4d6349"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master"
+SRCREV = "ee97fe5fb77c737df0f77d92ab0d92edd3a11be6"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master \
+           file://0001-fsck-main.c-add-missing-include.patch \
+           "
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
-- 
2.20.1


