Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E9FC433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:24:37 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.1195.1652811875861290204
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Y6WXi2P3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id gg20so8104201pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7JmF6fPPQn8MmV6+BJFuOHeOaCl1MwdzTeSDIP5TClA=;
        b=Y6WXi2P3NS8ldbqsX41sOt5cyjHUr4cEYDjGdN2IXff4H+0Y9TLdJOYYEvQoCLwePr
         oMLcIvWeJQFnwmU7/c/7QtWny78yv7NhK77RCOizRLAoYFNsQN3/50QeCfyUbjzlRsMr
         COYRhuU8PqNhM9VX+iAKuWYg1+kmqjmyBzD+vn6r7P7rfkfmqcMm0G7z8dsZGW8YgAc8
         YTYxaJ+cZeL5oXRrj93Ac8fKfgI4BUNz+UzuVuPYX8EYi2lPh9bQbXOxGF2zvGZrowRU
         BywBLJ9+tY4/IVg/AJb1KaaF+VRYEUifN7z156hwfOmUe+5Qt6pws+Xy3DzcOKVn/UQl
         Sf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7JmF6fPPQn8MmV6+BJFuOHeOaCl1MwdzTeSDIP5TClA=;
        b=qCRQ5iZXHNGoETrkAtSlugEm0/Ey871KOznQo5pKa+gnQLrohv/mtFZIcBTVR7J0gP
         0PhWfGCA3qDRMUCj5sRe8VTHqzca2+wrTTOFWwhNFkOwaYyYrV8mYqV16xGo7qBg2XH2
         cocS/5uTpmAXW2iuxj1qafHH3H1HgsHZBbU7noM+pM9C0Yz9YEdPVx4Gk6RKip6DrbNY
         oas4alFpf0XbAK5q8zpflvm1hqP0SwLbsU8MbyfXXXQ7pEwFxQCqGdqG4SF9sbRNG7tM
         yc0PNnQwdZ/yHV4cqKmFYyzEQoKiGkmDBEQ21DyQrgxyUydgveiGEciuplrG4E2vSZoa
         Jp7Q==
X-Gm-Message-State: AOAM532KjP9Dgyqb6GoXIeNTa1xq3dqrPPsX8ebdGCXvSJfH5phiIeSc
	VdSn5xBznYKoHuR26Dof2UqtYsNNAsctax4C
X-Google-Smtp-Source: 
 ABdhPJyDy/43zq6j5mc3OqMuYwN8gp4aqKMtSpMyLQDkrHw9ReEOVwvlj6aaRLdQJTDQuc+5O0mSKQ==
X-Received: by 2002:a17:90b:1a86:b0:1dc:eae9:9b5b with SMTP id
 ng6-20020a17090b1a8600b001dceae99b5bmr26511991pjb.100.1652811874723;
        Tue, 17 May 2022 11:24:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.24.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:24:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/31] freetype: backport patch for
 CVE-2022-27405
Date: Tue, 17 May 2022 08:23:48 -1000
Message-Id: 
 <6ec1c9237837e9d781647805eb2caabcdbaddb7b.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:24:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165747

From: Davide Gardenal <davidegarde2000@gmail.com>

CVE: CVE-2022-27405

Upstream issue:
https://gitlab.freedesktop.org/freetype/freetype/-/issues/1139

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


