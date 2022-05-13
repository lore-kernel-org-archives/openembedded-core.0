Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F263AC433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 09:57:59 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.6475.1652435875636644567
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 02:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KCKKVYcg;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id z2so15236964ejj.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 02:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=akGar6utB77/uk5DLsp7z0DgVKwE9uMLaZlwyunfukM=;
        b=KCKKVYcg6eYgXJuFClotDOwql6+dkHj8QJqXa94gNEZtYyojtByQHcuiGI4GJp6UBv
         CiSuJ1xycPXhpl3v6mgAdcVg4q1CVS8XZLWuQNebInbSdZUdfX3WUDboLAbrzbIHXZi7
         RH+/TcdG8Ydwk+LqMqghJBRhChmvtTuNDQE+IzsHSpplPeJc87tFaKhLY+TD/aAW9/s1
         iD6+Nid3vuVVqWqA3JUuvuTqXxiZSNCyJ6vkImQwGs6hgVbSJqxzMlhORdQIjtt15Iir
         TQdxKV6lWdjxQ3jYh14Xc2o6KDFdm+DhqDeasrYp1hLUW6D2QB7KLi6ckAlTCz3TqKQN
         Bkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=akGar6utB77/uk5DLsp7z0DgVKwE9uMLaZlwyunfukM=;
        b=FpwB9It70yHKlC5mLhGGuO1dczmgAQ7D8VuROp9gpPDQuTeoq4vylcEp4/9Ek5vIyz
         loiXbQWZxcJ59WZ2Y3MjX9laDae/sZfI72eZx7pjmDWWnIwzYubcn72GTFfi9Y2ypj0y
         mIxdSIrrQ/HDVwiX3z84scBWCkOh+qr6brDu2wHFqtqrOAThEk1bM7D+xY9CQ03AQ7U3
         wCd1JcD08Jpz28kwd9JhPXrMp4osJV65EdUw5MEsEpgmQaVPSnu1+FE4/S6k1NWyDIex
         s/jTuaAvNNEeQi3EusHlQWSi5/KPwNWQXZtFmsEJ74v/3Og+1oUR4O3SzaNuytO4fkcX
         oHpA==
X-Gm-Message-State: AOAM533ioH2EbRjrmq8EQJ8zxBClY/TPN4DxZ+Q9MJbL0b9DD60DFhxk
	24Kkd0VsnB8vMImon4nBRhQvoiRTZpI=
X-Google-Smtp-Source: 
 ABdhPJxOFQRDyDCgqe23HTcaJqdPb6LR15+E/ntp3IDKV6v0ZfXnG4TZ4tPnZJVl5oIO2ZWrSDhCfg==
X-Received: by 2002:a17:907:948c:b0:6f5:183f:eb6 with SMTP id
 dm12-20020a170907948c00b006f5183f0eb6mr3397183ejc.112.1652435873298;
        Fri, 13 May 2022 02:57:53 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-80.retail.telecomitalia.it. [87.5.19.80])
        by smtp.gmail.com with ESMTPSA id
 r2-20020a170906550200b006f3ef214e72sm573973ejp.216.2022.05.13.02.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:57:52 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [kirkstone][PATCH 2/3] freetype: backport patch for CVE-2022-27405
Date: Fri, 13 May 2022 11:57:50 +0200
Message-Id: <20220513095750.635811-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 09:57:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165553

CVE: CVE-2022-27405

Upstream issue:
https://gitlab.freedesktop.org/freetype/freetype/-/issues/1139

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 .../freetype/freetype/CVE-2022-27405.patch    | 41 +++++++++++++++++++
 .../freetype/freetype_2.11.1.bb               |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27405.patch

diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2022-27405.patch b/meta/recipes-graphics/freetype/freetype/CVE-2022-27405.patch
new file mode 100644
index 0000000000..582a985221
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2022-27405.patch
@@ -0,0 +1,41 @@
+From 22a0cccb4d9d002f33c1ba7a4b36812c7d4f46b5 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Sat, 19 Mar 2022 06:40:17 +0100
+Subject: [PATCH] * src/base/ftobjs.c (ft_open_face_internal): Properly guard
+ `face_index`.
+
+We must ensure that the cast to `FT_Int` doesn't change the sign.
+
+Fixes #1139.
+
+Upstream-Status: Backport
+https://gitlab.freedesktop.org/freetype/freetype/-/commit/22a0cccb4d9d002f33c1ba7a4b36812c7d4f46b5
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
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
+
diff --git a/meta/recipes-graphics/freetype/freetype_2.11.1.bb b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
index 257c5c6d9a..02a81a4f4f 100644
--- a/meta/recipes-graphics/freetype/freetype_2.11.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=a5927784d823d443c6cae55701d01553 \
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \ 
            file://CVE-2022-27404.patch \
+           file://CVE-2022-27405.patch \
            "
 SRC_URI[sha256sum] = "3333ae7cfda88429c97a7ae63b7d01ab398076c3b67182e960e5684050f2c5c8"
 
-- 
2.32.0


