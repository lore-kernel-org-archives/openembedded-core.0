Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D8FC433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:09:07 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.6203.1636603745790823035
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KKH7a+8A;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id iq11so3224377pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ITKYwfWn81VCdID9bVS7X4iwdAoFnt2UMun+W1OApho=;
        b=KKH7a+8ADok6MPWb53HzndAt1QHgNAxRLruem3QE9LPeDAWOvDzmGe48+/m6Kp+BOj
         nAyo1xf6wxUq3hHrVnmvbytSbrQUyonvvQV8wwstkCC9jRllQKG4mO6KBskpI86qvpgJ
         zDIfx8qupJ4S/V7I5NhGLujyYgfC7oGjNbcv9Mr84RYCea37As0HmqAnFr4UCKE9ssip
         Wx83oCzGZpmVNWFER56aFvBiw828zmRm6xMngFYWt09HbwsnY6RVZ6yztzO/sVu4Hpz6
         syoShRom3lrKsqfdUzex1mugOq0L43uMIhh0NvM2E4111i1te/TS0FT4ODYK+96tj1Jy
         /I2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ITKYwfWn81VCdID9bVS7X4iwdAoFnt2UMun+W1OApho=;
        b=z33QK6bqZRTQGg1lavBzt5tJPyChNyGT2p54th7bJERdDb+jIg9ysZU+aPst1n4aR8
         9r2B6nWNlH9QuGsbgBHCmlEC84OVmgQFhaiTthjzM1DeDLMlGUwGlBSZTMZJawr8DvlC
         jipAimpn8wlDu2yjNXDxMpGOQY8VZUiRaa8AeCseavaZ1/xEbDAXuQoTkJ06iWpkIFFf
         FzeMjXypCHtzbJ8LUp1KXZzwfbAmkhiKOKUM310WHB0bcg0HHEvceXkGMfBXzsJd3dKV
         +ZlxSoyTt1TPCrS0LwRvyYHhkUqs0C4JAOx/eBDGS2xG8+UM513KWHgWRkEGSYHmUqXG
         bQPQ==
X-Gm-Message-State: AOAM531nWNEnuYUv8eUBx61vGII54PgH5s1via5PxOVPyGDv0W90kyrd
	o+sz0sKIwd/oX1TNKYcGWqLgDGhOJCeUWs78fVE=
X-Google-Smtp-Source: 
 ABdhPJzgPJmJUUA1vAYIZc5fAb+k0XQfu5dINQEPwbzxjb0Dkg1nEtXe6ibAzG/Rzr3nTTgritD9zw==
X-Received: by 2002:a17:902:ce8f:b0:141:f85a:e0de with SMTP id
 f15-20020a170902ce8f00b00141f85ae0demr4386144plg.69.1636603744834;
        Wed, 10 Nov 2021 20:09:04 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm1207686pfg.90.2021.11.10.20.09.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 20:09:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/14] webkitgtk: Fix reproducibility in
 minibrowser
Date: Wed, 10 Nov 2021 18:08:27 -1000
Message-Id: 
 <5ebea40c2236900a11b6025b53b4728eb08e5464.1636591208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636591208.git.steve@sakoman.com>
References: <cover.1636591208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158134

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8f08ca440b6c2ad3494808ffa4ec6091722c0339)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-MiniBrowser-Fix-reproduciblity.patch | 31 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.28.4.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch b/meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch
new file mode 100644
index 0000000000..528dec8c8b
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch
@@ -0,0 +1,31 @@
+From dcf9ae0dc0b4510eddbeeea09e11edfb123f95af Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 2 May 2021 13:10:49 -0700
+Subject: [PATCH] MiniBrowser: Fix reproduciblity
+
+Do not emit references to source dir in generated sourcecode
+
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=225283]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Tools/MiniBrowser/gtk/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Tools/MiniBrowser/gtk/CMakeLists.txt b/Tools/MiniBrowser/gtk/CMakeLists.txt
+index 93b62521..482d3b00 100644
+--- a/Tools/MiniBrowser/gtk/CMakeLists.txt
++++ b/Tools/MiniBrowser/gtk/CMakeLists.txt
+@@ -48,8 +48,8 @@ add_custom_command(
+     OUTPUT ${DERIVED_SOURCES_MINIBROWSER_DIR}/BrowserMarshal.c
+            ${DERIVED_SOURCES_MINIBROWSER_DIR}/BrowserMarshal.h
+     MAIN_DEPENDENCY ${MINIBROWSER_DIR}/browser-marshal.list
+-    COMMAND glib-genmarshal --prefix=browser_marshal ${MINIBROWSER_DIR}/browser-marshal.list --body > ${DERIVED_SOURCES_MINIBROWSER_DIR}/BrowserMarshal.c
+-    COMMAND glib-genmarshal --prefix=browser_marshal ${MINIBROWSER_DIR}/browser-marshal.list --header > ${DERIVED_SOURCES_MINIBROWSER_DIR}/BrowserMarshal.h
++    COMMAND glib-genmarshal --prefix=browser_marshal ${MINIBROWSER_DIR}/browser-marshal.list --body --skip-source > ${DERIVED_SOURCES_MINIBROWSER_DIR}/BrowserMarshal.c
++    COMMAND glib-genmarshal --prefix=browser_marshal ${MINIBROWSER_DIR}/browser-marshal.list --header --skip-source > ${DERIVED_SOURCES_MINIBROWSER_DIR}/BrowserMarshal.h
+     VERBATIM)
+ 
+ if (DEVELOPER_MODE)
+-- 
+2.31.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
index ceda2992d7..2e3f0aa682 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-with-musl.patch \
            file://include_array.patch \
            file://0001-clang-11-fix-build-errors-due-to-WWc-11-narrowing.patch \
+           file://0001-MiniBrowser-Fix-reproduciblity.patch \
            "
 SRC_URI[sha256sum] = "821952e8c9303ed752f1fb1d4283f612c25249d00d705d2b79c2db1bc49c9464"
 
-- 
2.25.1


