Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71747C433FE
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:26:56 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.7051.1645799213831933847
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:26:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lvDHMpJV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 iq13-20020a17090afb4d00b001bc4437df2cso4959694pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fch1dlqdQk90TVUoQLiZ+4jUwc6WSGVL+X4ZveFs33A=;
        b=lvDHMpJVo0Id4FopQJTJlV3tbiOMCA+30i3A1gw/m9jXRPOke+tMJpkOZw8Z0J2/Ya
         djGpNe7poSDr5tYdZETc4jve6hTULd8mA5V54zO4ExRj+LrAxXFVQAG5lMMr9vBwQbzj
         itVmhbykKZpREg7Pg/Wdx9P5OLKnbp88hxsjKNaeDftVjoxzP/plEWT2QHyylgj5OoOD
         JOwB3TNuJjRi4d8K+DlS8X7q9+xUhsY41QBaET1f6KbCyN2w5nfGQg61GiE1Ou/jiUQR
         gufecLq0PguraEqoYSvTFveK61359mjsmqLjTLK6vpBkT6oE0iwM89zYwCzvJOTIVWFN
         /0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fch1dlqdQk90TVUoQLiZ+4jUwc6WSGVL+X4ZveFs33A=;
        b=YUOE5FvnXsV7BlhBQr8IpEE3kDTlaaDlYsE7ID5Me9BAZnGgsAUhKhAMVasLgLC/PF
         J4uUhFewxEttn6Stf1I6xtOsvZW6nZt4qtYYICbKDTQuDihaXreepJL6aU9jnDXi9tnm
         mFQL6YOTRH33sMGQJi0gepxPrqbrchekoF4+zVdMZHN2SrpivKjvvbdjWa0u/M50bRR0
         8n32RF8S43q67WeZXGwfsEnFjk+b7Y8OmOS7ezPdwPhdis4jjrE4y1OIVtMaxONrfZqA
         VbVo7AWqXURLG/S1w4FNjWv6FLimsetShadKAXkQy+vfl46ftevEFKPoS/abpRrE8ayT
         gwzA==
X-Gm-Message-State: AOAM532+9dtzVa83+h+pgMkvxGB/eRMYvvx63Qyw17faJcjm9D0Bg163
	I4BdPvQfqUU3J8+ipjkD9xHmalZYOPB3s6Hh
X-Google-Smtp-Source: 
 ABdhPJz8EWDgCM9aUyO63fOfvSj2yFJiqqMqySdJuTUWUZ7RrOwEsrZud3+sb5ncHReIb3ea1EuvsA==
X-Received: by 2002:a17:902:ec92:b0:14f:e593:5e99 with SMTP id
 x18-20020a170902ec9200b0014fe5935e99mr7871986plg.42.1645799212722;
        Fri, 25 Feb 2022 06:26:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.26.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:26:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/50] tiff: fix for CVE-2022-22844
Date: Fri, 25 Feb 2022 04:25:42 -1000
Message-Id: 
 <68b59e37d25ead5aaf68d24c6a55b7d1864203fa.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:26:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162348

From: Purushottam Choudhary <purushottamchoudhary29@gmail.com>

Backport patch from:
https://gitlab.com/libtiff/libtiff/-/commit/03047a26952a82daaa0792957ce211e0aa51bc64

Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


