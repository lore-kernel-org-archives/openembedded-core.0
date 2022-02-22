Return-Path: <purushottamchoudhary29@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32B7C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 12:35:35 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.12199.1645533334538289844
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 04:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TTOQ0BDo;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: purushottamchoudhary29@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id v4so18350446pjh.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 04:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=cpPMp0YN6CS8OsZXyLsMnhl1ckKx768A93EXCJB2lTM=;
        b=TTOQ0BDoGGn8jrXpIgAR2CR7yHTbKwTe6jHJuVFA1dftcdluxdhg2xaqNb8/BvuKJ1
         SWvZ6BlGBE4dZVRDxUdrUUCciAsHVDv813572B8o1z59sngZ4ca6Z/Akc92ZRDdv8bJr
         REfQZHm/wQ1SAXaqaCaF2RywK3Z/wNKAKzXkQFq5+xk3luV7nJo3kfGhquIy9o6YQQrH
         8Nftm23NuDFM0aGp8TiPvopcK0xEH5qggXuEKb28QNRRo3hGg1LzoEQaF2liFWYBkpKU
         ltTBNlhOoZflJH4L/+ErxETAn8bGbsx03yF+l0gNSAcc/pJhWJs8KOCKdwO3SOVmJRQm
         P0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cpPMp0YN6CS8OsZXyLsMnhl1ckKx768A93EXCJB2lTM=;
        b=CdgAA9vncHfgnO+tSrhdd/VM9GHxwFC5c96XiOqNhgD2hyiWs2y2pSlx/ENkon8YQ5
         A8gfgL6sVGiO5/HGtZ+Pj4vhoBtMYyAv4KO7Km7MYpdUIUQFxUVDQNUC8U8CLKL87elb
         hQZOGpB9QHMEfOu15kRtV+x9m5pZgp/5Mvl1Lad2g2J1klhXsohtUARen9B4RXVO3BHC
         o5H3s7KX33LrfT+TJVvIOdrdusF/RwuQgGPGJUx0IF3mSBSj+yKdWvYTl/KHV4Kb3D7f
         HxiH6bFFEKxQkn3NoCyfvR/EkvRq7vZUglSlLUSoCSFbQV8cToOhkwOAvPgpnJ1guOES
         7eLg==
X-Gm-Message-State: AOAM533hgJz7Q9BuuuwyU37JuxMGf/EtzLKPNShna28c6kbGLW5Gf25l
	CPEuwD7nQWRP0kQHA9IyyQn5yE8VO9wrlA==
X-Google-Smtp-Source: 
 ABdhPJzXWr1dGfuSfe+fODjeZTYahf8GZlK0m6OT6LcgzVcl+ELirxwCPk3wQ8p+oRtpSPWX4aILig==
X-Received: by 2002:a17:90b:1d0e:b0:1b9:5a43:2277 with SMTP id
 on14-20020a17090b1d0e00b001b95a432277mr3957894pjb.52.1645533333371;
        Tue, 22 Feb 2022 04:35:33 -0800 (PST)
Received: from localhost.localdomain
 ([2405:201:a410:a06c:3c78:8bed:1d7f:4558])
        by smtp.gmail.com with ESMTPSA id
 s24sm2544162pjp.23.2022.02.22.04.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 04:35:32 -0800 (PST)
From: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Purushottam Choudhary <purushottam.choudhary@kpit.com>
Subject: [OE-core][dunfell][PATCH] tiff: fix for CVE-2022-22844
Date: Tue, 22 Feb 2022 18:04:53 +0530
Message-Id: <20220222123453.32415-1-purushottamchoudhary29@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 12:35:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162131

Backport patch from:
https://gitlab.com/libtiff/libtiff/-/commit/03047a26952a82daaa0792957ce211e0aa51bc64

Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
---
 ...al-buffer-overflow-for-ASCII-tags-wh.patch | 52 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch

diff --git a/meta/recipes-multimedia/libtiff/files/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch b/meta/recipes-multimedia/libtiff/files/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
new file mode 100644
index 0000000000..31f867e000
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
@@ -0,0 +1,52 @@
+From b12a0326e6064b6e0b051d1184a219877472f69b Mon Sep 17 00:00:00 2001
+From: 4ugustus <wangdw.augustus@qq.com>
+Date: Tue, 25 Jan 2022 16:25:28 +0000
+Subject: [PATCH] tiffset: fix global-buffer-overflow for ASCII tags where
+ count is required (fixes #355)
+
+CVE: CVE-2022-22844
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/03047a26952a82daaa0792957ce211e0aa51bc64]
+Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
+Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
+Comments: Add header stdint.h in tiffset.c explicitly for UINT16_MAX
+---
+ tools/tiffset.c | 17 ++++++++++++++---
+ 1 file changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/tools/tiffset.c b/tools/tiffset.c
+index 8c9e23c5..e7a88c09 100644
+--- a/tools/tiffset.c
++++ b/tools/tiffset.c
+@@ -33,6 +33,7 @@
+ #include <string.h>
+ #include <stdlib.h>
+ 
++#include <stdint.h>
+ #include "tiffio.h"
+ 
+ static char* usageMsg[] = {
+@@ -146,9 +146,19 @@ main(int argc, char* argv[])
+ 
+             arg_index++;
+             if (TIFFFieldDataType(fip) == TIFF_ASCII) {
+-                if (TIFFSetField(tiff, TIFFFieldTag(fip), argv[arg_index]) != 1)
+-                    fprintf( stderr, "Failed to set %s=%s\n",
+-                             TIFFFieldName(fip), argv[arg_index] );
++                if(TIFFFieldPassCount( fip )) {
++                    size_t len;
++                    len = strlen(argv[arg_index]) + 1;
++                    if (len > UINT16_MAX || TIFFSetField(tiff, TIFFFieldTag(fip),
++                            (uint16_t)len, argv[arg_index]) != 1)
++                        fprintf( stderr, "Failed to set %s=%s\n",
++                            TIFFFieldName(fip), argv[arg_index] );
++                } else {
++                    if (TIFFSetField(tiff, TIFFFieldTag(fip),
++                            argv[arg_index]) != 1)
++                        fprintf( stderr, "Failed to set %s=%s\n",
++                            TIFFFieldName(fip), argv[arg_index] );
++                }
+             } else if (TIFFFieldWriteCount(fip) > 0
+ 		       || TIFFFieldWriteCount(fip) == TIFF_VARIABLE) {
+                 int     ret = 1;
+-- 
+GitLab
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 43f210111d..0948bb4e2f 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://001_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch \
            file://002_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch \
            file://CVE-2020-35521_and_CVE-2020-35522.patch \
+           file://0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.17.1


