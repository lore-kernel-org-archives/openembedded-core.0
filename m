Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2594C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 09:58:09 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.6431.1652435886146378886
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 02:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fQACGll/;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id kq17so15231595ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 02:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tWGdEL9Q0mG1geTsCAfcskX0I5tkowPpZq94kV+SID0=;
        b=fQACGll/Yl0Qt8YpUfxIuFLfG2/YuKtADCuI6JcInZq9qvanw34AhZKD6D29v8anuH
         0wSpgn5NfPG6DT87Mv+G5ts+bwfUIy6Nh0uomk/LphRRLBUvjvMDWvHE0+OceBQ5+bR7
         OlH5NZPdU7wGc+aWVJVKsv7e9vfbZv60QS0gkUnoiWU7skTxFTKhZ/RsZ+/250FPs3N6
         bIJTQqD8o6UjRb/1gmBq7mBcW9YbLg0Yh4MHdIrsXZCw50pwjmOipxRcufmu5X4GcxiL
         nC+3MpKYc2U4dM/lLzaZ696v9eFE9DKuC9XCEGLh8rzgupsPEhJX2hG8PzeyuMTQj7pK
         AtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tWGdEL9Q0mG1geTsCAfcskX0I5tkowPpZq94kV+SID0=;
        b=NH706eZWDeWooEdPrGwU8vETkkSFGK8vqKME7WLWpOa3w9rZ25gTUAJwEaRK1JTKeH
         n0ijj9kqRjBE8/vQZY+Bnsd+GMNa+LoHrrZhwYsU6QipxSZlWpZFpgREo9Z8dkEOleuj
         ygAyf0Ujx512NQF2K1DVnr32SBaeUNaOvoFARtjX/uqgSDKNU1WmVCldOyFkzIZgTIiC
         /JRVeiSYDYLR9RJNRwl8RKTeQU2SagGZ4T8VBcOFVoqx+4y2HEQKfZYBDObVL5jtM8q5
         4c8i32g7C/ZvhaPcZ2RTRkAUsl+7wMkorT4Lbvt14OPY+3e5aD6p5dbymJ+NQPVulM34
         whQQ==
X-Gm-Message-State: AOAM533QEPkxESZ4Owqin0qOPvbQfqaOeuoGU0nM/u5EXHewk0ZKY3+5
	hSjyRml/6Trd9kuiE1uAulFgXGVfGMQ=
X-Google-Smtp-Source: 
 ABdhPJyp5zYm5z0CfVvgM3M078vK1740iJtwPJA1qrS8lO9bHYpDxvIAC39RzQOXqxBTE82nhccarQ==
X-Received: by 2002:a17:906:d550:b0:6f4:abbd:d033 with SMTP id
 cr16-20020a170906d55000b006f4abbdd033mr3506550ejc.200.1652435884049;
        Fri, 13 May 2022 02:58:04 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-80.retail.telecomitalia.it. [87.5.19.80])
        by smtp.gmail.com with ESMTPSA id
 y24-20020aa7ccd8000000b0042617ba6397sm753451edt.33.2022.05.13.02.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:58:03 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [kirkstone][PATCH 3/3] freetype: backport patch for CVE-2022-27406
Date: Fri, 13 May 2022 11:58:01 +0200
Message-Id: <20220513095801.635870-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 09:58:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165554

CVE: CVE-2022-27406

Upstream issue:
https://gitlab.freedesktop.org/freetype/freetype/-/issues/1140

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
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
2.32.0


