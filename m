Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53579C433FE
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:24:47 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.1196.1652811878144835050
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=PlVa/E6n;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id p8so17623113pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=n83O9aEhgFG7mS3IardW96JcysdGyQhWIt93HXehb78=;
        b=PlVa/E6nR06kIWUsBFij5LB/thvL2r0OKZWYVXNx0XmkkZ9JHarZ0PH3WUkmzjA+Jd
         jdM7D4CSNdScF+AsD0bl0vktRM/uV5lqeeYnpN+cJ/NNd2mfB9pJaWbBhHtUq21alpro
         4KJK7jlZtTziR1sxTprT7L82fBt9LZ9JFIYt5JTnMsWiVcoerNjhV2+XJsKeaEsEm8ro
         Ryu6b59PDMsxnbel6SD20JRWxyZb6G6tHO+NF/86cJw2tZiOqMgrP5SNc5LsStTf6z5u
         bAXbTDH6vH4PWs6yhnCrCQ7i40NTRd42FXkDADlp7F33QdxpiSFfmAWz50bv8BJEmuuO
         jX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n83O9aEhgFG7mS3IardW96JcysdGyQhWIt93HXehb78=;
        b=Fj3iYQV+GuoeT1sz2qvnVQy+fFAjrUqBGw4vqWfvlKECg0Uo3lBCH5+UEpAGictV31
         EwPj4ytAXCFkN8912PgDaG4jv2AL4tgHPozfUcPn4PCJR1tU3Cd7G/aWhCLdckSEuyWq
         o/Ifb625HkycXhNdYEjg7VVyeLJ10/nIu9WKr4DQj2iIYJd2CXRSM2Gb55O8Ilo7jlsb
         SNxiSJsOvPRUC6XSL873XDnCcAgbQ8KPuD4x+muvDw/S53A7qnxzExcI+1Rm930wtUnM
         jzC5jmXWSZXPQ/RnF3aSvNIIXwS69iYI+FFYrruE/p4VSv4n+zgqJIGq97OgBhEa0dRf
         Nadg==
X-Gm-Message-State: AOAM532OKl3Nuxlpij+LD+q9EXpe2s9ojCaoLlJwNJJ12dCPmFKZX8ed
	nAFzFvUQLNWZxV3+Cq/D/a+WUtuF6SZnWmzi
X-Google-Smtp-Source: 
 ABdhPJwdu7uOf7pB9tcHsWFVrz34v1GQKkbwGEQTr7ag8G3uQyVUS7ohw+l8Y7dntIwqjI/O7Pe+Gw==
X-Received: by 2002:a05:6a00:f85:b0:518:10e1:86b with SMTP id
 ct5-20020a056a000f8500b0051810e1086bmr2404083pfb.34.1652811876987;
        Tue, 17 May 2022 11:24:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.24.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:24:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/31] freetype: backport patch for
 CVE-2022-27406
Date: Tue, 17 May 2022 08:23:49 -1000
Message-Id: 
 <2c1df19405e2f52b06feec0506ad56cef7d4c6c1.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165748

From: Davide Gardenal <davidegarde2000@gmail.com>

CVE: CVE-2022-27406

Upstream issue:
https://gitlab.freedesktop.org/freetype/freetype/-/issues/1140

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../freetype/freetype/CVE-2022-27406.patch    | 32 +++++++++++++++++++
 .../freetype/freetype_2.11.1.bb               |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27406.patch

diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2022-27406.patch b/meta/recipes-graphics/freetype/freetype/CVE-2022-27406.patch
new file mode 100644
index 0000000000..49f76c643f
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2022-27406.patch
@@ -0,0 +1,32 @@
+From 0c2bdb01a2e1d24a3e592377a6d0822856e10df2 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Sat, 19 Mar 2022 09:37:28 +0100
+Subject: [PATCH] * src/base/ftobjs.c (FT_Request_Size): Guard `face->size`.
+
+Fixes #1140.
+
+Upstream-Status: Backport
+https://gitlab.freedesktop.org/freetype/freetype/-/commit/0c2bdb01a2e1d24a3e592377a6d0822856e10df2
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
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
+
diff --git a/meta/recipes-graphics/freetype/freetype_2.11.1.bb b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
index 02a81a4f4f..5b464d3d70 100644
--- a/meta/recipes-graphics/freetype/freetype_2.11.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=a5927784d823d443c6cae55701d01553 \
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \ 
            file://CVE-2022-27404.patch \
            file://CVE-2022-27405.patch \
+           file://CVE-2022-27406.patch \
            "
 SRC_URI[sha256sum] = "3333ae7cfda88429c97a7ae63b7d01ab398076c3b67182e960e5684050f2c5c8"
 
-- 
2.25.1


