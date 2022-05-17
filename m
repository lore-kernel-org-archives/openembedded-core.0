Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5850C4332F
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 09:44:41 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.5156.1652780673230950166
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 02:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SZ5L9Xwo;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d17so16882954plg.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 02:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=mermZrDijOCftfZuzEdEChaUQQQvupMj2V8SwDgac80=;
        b=SZ5L9XwonwFMifEjKATiHdaV/6N2sQMCn6S+T3Yv98dJZQNR6AqO9RoRsSiykyVjR6
         UHTPhLrpOTBu5pZp72Io2SpXwX/2A1AUnVQqfBIUwCkuBOV6iSfjAs7qVnqnYqduTTKF
         04MjA6JVdixm4gwgIslT/qvFhT/FYVAb08EErjimIg1G3J3tgpTV212YU8rNW2zza4tc
         SqpVv8/SK4j6PiwA5Crxbjf2S37IYfoiPJ7yyPLc2tPFnvg/Rl7xoT/ysh5FD8sZsiGE
         /poZoiFrXJ0rvYbaAabzkYYpnbPB6Pw5RFY5sfkuKyQb9me/hCb1oQmGBQyRWqmkT7IG
         K2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mermZrDijOCftfZuzEdEChaUQQQvupMj2V8SwDgac80=;
        b=UTPAjd7saMNUL6l/lujPxznch8MIUd2kvW4liJPVXSGBj6CJHHMibgUYPn2CUiAWT6
         UppemBoQuthOax0NY/elbf2PVEfwhA7xL2lWtoRzf5djSs4LbkffdFo2hbPElXEK0Uu9
         TWXVxEjb4vUBKD7ZhmYT+Q86GkAcI9IwkdvItaVHANP5Ow/a988IKsHizYqmqZYHG+st
         twJx0Ck9ipsI6bFXdasWIfVCKDfXSR9iggpJ1UYpUQisn9uC520Oil1/ClrXuAMvbiX0
         dAvXXtihpG1sjgk2hrI2HvSdsC++y4TXRazGwH2uPfyt3Ntkn0qGhoHvzpoy/5sk38Ip
         TbWg==
X-Gm-Message-State: AOAM533x77aMbdIVvPcADP+lF9LhFutptVeUFJZ8iJdPuR7mfYvxe0YX
	P9AknMEeq2jPdagpgBvgPFJYdEKa6Rw=
X-Google-Smtp-Source: 
 ABdhPJzYlzkt/+f5hgrT7NtUBdGWTq4IlmIrDrC7/2fK+gic/fZNUm6mSBN2/CaAnBfrbHOoOWRfcQ==
X-Received: by 2002:a17:90b:4b84:b0:1dc:93c0:ba01 with SMTP id
 lr4-20020a17090b4b8400b001dc93c0ba01mr35679867pjb.70.1652780672338;
        Tue, 17 May 2022 02:44:32 -0700 (PDT)
Received: from localhost.localdomain ([103.81.94.250])
        by smtp.gmail.com with ESMTPSA id
 fh9-20020a17090b034900b001dc37aef4ffsm1210550pjb.48.2022.05.17.02.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 02:44:31 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][dunfell][PATCH 1/2] freetype: Fix CVEs for freetype
Date: Tue, 17 May 2022 15:14:11 +0530
Message-Id: <20220517094412.20616-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 09:44:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165723

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Apply below patches to fix the CVEs for freetype:

CVE-2022-27404.patch
Link: https://gitlab.freedesktop.org/freetype/freetype/-/commit/53dfdcd8198d2b3201a23c4bad9190519ba918db.patch

CVE-2022-27405.patch
Link: https://gitlab.freedesktop.org/freetype/freetype/-/commit/22a0cccb4d9d002f33c1ba7a4b36812c7d4f46b5.patch

CVE-2022-27406.patch
Link: https://gitlab.freedesktop.org/freetype/freetype/-/commit/0c2bdb01a2e1d24a3e592377a6d0822856e10df2.patch

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../freetype/freetype/CVE-2022-27404.patch    | 33 ++++++++++++++++
 .../freetype/freetype/CVE-2022-27405.patch    | 38 +++++++++++++++++++
 .../freetype/freetype/CVE-2022-27406.patch    | 31 +++++++++++++++
 .../freetype/freetype_2.10.1.bb               |  3 ++
 4 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27404.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27405.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27406.patch

diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2022-27404.patch b/meta/recipes-graphics/freetype/freetype/CVE-2022-27404.patch
new file mode 100644
index 0000000000..e66400ddb1
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2022-27404.patch
@@ -0,0 +1,33 @@
+From 53dfdcd8198d2b3201a23c4bad9190519ba918db Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Thu, 17 Mar 2022 19:24:16 +0100
+Subject: [PATCH] [sfnt] Avoid invalid face index.
+
+Fixes #1138.
+
+* src/sfnt/sfobjs.c (sfnt_init_face), src/sfnt/sfwoff2.c (woff2_open_font):
+Check `face_index` before decrementing.
+
+CVE: CVE-2022-27404
+Upstream-Status: Backport [https://gitlab.freedesktop.org/freetype/freetype/-/commit/53dfdcd8198d2b3201a23c4bad9190519ba918db.patch]
+Comment: Removed second hunk as sfwoff2.c file is not part of current v2.10.1 code
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+---
+ src/sfnt/sfobjs.c  | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sfnt/sfobjs.c b/src/sfnt/sfobjs.c
+index f9d4d3858..9771c35df 100644
+--- a/src/sfnt/sfobjs.c
++++ b/src/sfnt/sfobjs.c
+@@ -566,7 +566,7 @@
+     face_index = FT_ABS( face_instance_index ) & 0xFFFF;
+
+     /* value -(N+1) requests information on index N */
+-    if ( face_instance_index < 0 )
++    if ( face_instance_index < 0 && face_index > 0 )
+       face_index--;
+
+     if ( face_index >= face->ttc_header.count )
+-- 
+GitLab
diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2022-27405.patch b/meta/recipes-graphics/freetype/freetype/CVE-2022-27405.patch
new file mode 100644
index 0000000000..08fccd5a3b
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2022-27405.patch
@@ -0,0 +1,38 @@
+From 22a0cccb4d9d002f33c1ba7a4b36812c7d4f46b5 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Sat, 19 Mar 2022 06:40:17 +0100
+Subject: [PATCH] * src/base/ftobjs.c (ft_open_face_internal): Properly guard
+ `face_index`.
+We must ensure that the cast to `FT_Int` doesn't change the sign.
+Fixes #1139.
+
+CVE: CVE-2022-27405
+Upstream-Status: Backport [https://gitlab.freedesktop.org/freetype/freetype/-/commit/22a0cccb4d9d002f33c1ba7a4b36812c7d4f46b5]
+Comment: No Change in any hunk
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+---
+ src/base/ftobjs.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/base/ftobjs.c b/src/base/ftobjs.c
+index 2c0f0e6c9..10952a6c6 100644
+--- a/src/base/ftobjs.c
++++ b/src/base/ftobjs.c
+@@ -2527,6 +2527,15 @@
+ #endif
+ 
+ 
++    /* only use lower 31 bits together with sign bit */
++    if ( face_index > 0 )
++      face_index &= 0x7FFFFFFFL;
++    else
++    {
++      face_index &= 0x7FFFFFFFL;
++      face_index  = -face_index;
++    }
++
+ #ifdef FT_DEBUG_LEVEL_TRACE
+     FT_TRACE3(( "FT_Open_Face: " ));
+     if ( face_index < 0 )
+-- 
+GitLab
diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2022-27406.patch b/meta/recipes-graphics/freetype/freetype/CVE-2022-27406.patch
new file mode 100644
index 0000000000..4b5e629f30
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2022-27406.patch
@@ -0,0 +1,31 @@
+From 0c2bdb01a2e1d24a3e592377a6d0822856e10df2 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Sat, 19 Mar 2022 09:37:28 +0100
+Subject: [PATCH] * src/base/ftobjs.c (FT_Request_Size): Guard `face->size`.
+
+Fixes #1140.
+
+CVE: CVE-2022-27406
+Upstream-Status: Backport [https://gitlab.freedesktop.org/freetype/freetype/-/commit/0c2bdb01a2e1d24a3e592377a6d0822856e10df2]
+Comment: No Change in any hunk
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+---
+ src/base/ftobjs.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/base/ftobjs.c b/src/base/ftobjs.c
+index 6492a1517..282c9121a 100644
+--- a/src/base/ftobjs.c
++++ b/src/base/ftobjs.c
+@@ -3409,6 +3409,9 @@
+     if ( !face )
+       return FT_THROW( Invalid_Face_Handle );
+ 
++    if ( !face->size )
++      return FT_THROW( Invalid_Size_Handle );
++
+     if ( !req || req->width < 0 || req->height < 0 ||
+          req->type >= FT_SIZE_REQUEST_TYPE_MAX )
+       return FT_THROW( Invalid_Argument );
+-- 
+GitLab
diff --git a/meta/recipes-graphics/freetype/freetype_2.10.1.bb b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
index 2d444bbf19..72001c529a 100644
--- a/meta/recipes-graphics/freetype/freetype_2.10.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
@@ -15,6 +15,9 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://use-right-libtool.patch \
            file://0001-sfnt-Fix-heap-buffer-overflow-59308.patch \
+           file://CVE-2022-27404.patch \
+           file://CVE-2022-27405.patch \
+           file://CVE-2022-27406.patch \
           "
 SRC_URI[md5sum] = "bd42e75127f8431923679480efb5ba8f"
 SRC_URI[sha256sum] = "16dbfa488a21fe827dc27eaf708f42f7aa3bb997d745d31a19781628c36ba26f"
-- 
2.17.1


