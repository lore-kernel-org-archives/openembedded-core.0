Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E500FC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 05:35:10 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.4589.1699335305024616194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 21:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=droA5o6U;
 spf=pass (domain: mvista.com, ip: 209.85.128.177, mailfrom: asharma@mvista.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59b5484fbe6so61884687b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 21:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1699335304; x=1699940104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAEH3nS83Did6kGkmFny+TY+gMomiyRy5uOPJXfezak=;
        b=droA5o6U+smvQ+d2LY33eVJhnpeg3WMI6lU/FDBA92Is2QEKOqpdFuJEGMibNmWa+a
         lgRt8kz4lgba93oB4S+G19KXjS+KbCNn9s5gM0xX+U1FMi/aMX3/WfKwLM18buFnP//U
         rrOVyYaNCQq7gRNqeUpgO/vkQfxi9SGuNKbgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699335304; x=1699940104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAEH3nS83Did6kGkmFny+TY+gMomiyRy5uOPJXfezak=;
        b=gRUkKA4qq8FG2SzkHXAnCENV/KAua1uopOnMpFQGWZsMcCeIXYPIiola1Pysdp2Tez
         PPesq1Z84w8SKcKrkFRD9GIl3HXsfJZKtsUbvABNSxMdUQySCpR8hqioN8GR42BkWluE
         RPecJub5Mo4Yh75SOKfvX1gLXaxKhCOqgFKpNySg7kSZ5T0OwvAVOHB+Y5zOSTA/6TXD
         3Rx2pgbKe6Rc2P5KRHI188hP0RugeZQ4CQPH/7b4ZYH7KJoFA/CPv7xHCHY6wEv9OONm
         WGX4FCnUm9U8nNYt2dOArqsvTZWN4CoE0gW7lo5yoqqbY5WC2ZFVFftTOfPNfbKWor2o
         kn2g==
X-Gm-Message-State: AOJu0Yw5CqRgqkiVL31auL+RIgPxe9Z7pruk548VqLCIwygzDrox02sZ
	5/gjT8ZA7zeiOIiBBGY/YvVch2EDqzhKmsb/CxA=
X-Google-Smtp-Source: AGHT+IE79pGqQR7Kl3biRQZ+7Y+cg8GZQk9detKgfU53qgAP/qli75nyieujhFxHVCAeHthtbn6luA==
X-Received: by 2002:a0d:dc47:0:b0:5a1:635e:e68 with SMTP id f68-20020a0ddc47000000b005a1635e0e68mr11140609ywe.46.1699335303810;
        Mon, 06 Nov 2023 21:35:03 -0800 (PST)
Received: from asharma-Latitude-3400 ([223.190.83.79])
        by smtp.gmail.com with ESMTPSA id o17-20020a635d51000000b005b96b42f7ccsm586219pgm.82.2023.11.06.21.35.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 21:35:03 -0800 (PST)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 07 Nov 2023 11:02:48 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][kirkstone][PATCH] zlib: Backport fix CVE-2023-45853
Date: Tue,  7 Nov 2023 11:02:40 +0530
Message-Id: <20231107053240.22718-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 05:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190251

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../zlib/zlib/CVE-2023-45853.patch            | 40 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2023-45853.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch b/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch
new file mode 100644
index 00000000000..77afb7ad1b6
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch
@@ -0,0 +1,40 @@
+From 73331a6a0481067628f065ffe87bb1d8f787d10c Mon Sep 17 00:00:00 2001
+From: Hans Wennborg <hans@chromium.org>
+Date: Fri, 18 Aug 2023 11:05:33 +0200
+Subject: [PATCH] Reject overflows of zip header fields in minizip.
+
+This checks the lengths of the file name, extra field, and comment
+that would be put in the zip headers, and rejects them if they are
+too long. They are each limited to 65535 bytes in length by the zip
+format. This also avoids possible buffer overflows if the provided
+fields are too long.
+
+Upstream-Status: Backport from [https://github.com/madler/zlib/commit/73331a6a0481067628f065ffe87bb1d8f787d10c]
+CVE: CVE-2023-45853
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ contrib/minizip/zip.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/contrib/minizip/zip.c b/contrib/minizip/zip.c
+index 3d3d4cadd..0446109b2 100644
+--- a/contrib/minizip/zip.c
++++ b/contrib/minizip/zip.c
+@@ -1043,6 +1043,17 @@ extern int ZEXPORT zipOpenNewFileInZip4_64(zipFile file, const char* filename, c
+       return ZIP_PARAMERROR;
+ #endif
+ 
++    // The filename and comment length must fit in 16 bits.
++    if ((filename!=NULL) && (strlen(filename)>0xffff))
++        return ZIP_PARAMERROR;
++    if ((comment!=NULL) && (strlen(comment)>0xffff))
++        return ZIP_PARAMERROR;
++    // The extra field length must fit in 16 bits. If the member also requires
++    // a Zip64 extra block, that will also need to fit within that 16-bit
++    // length, but that will be checked for later.
++    if ((size_extrafield_local>0xffff) || (size_extrafield_global>0xffff))
++        return ZIP_PARAMERROR;
++
+     zi = (zip64_internal*)file;
+ 
+     if (zi->in_opened_file_inzip == 1)
diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index f768b41988b..fbd99480d34 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -11,7 +11,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://CVE-2018-25032.patch \
            file://run-ptest \
-	    file://CVE-2022-37434.patch \
+           file://CVE-2022-37434.patch \
+           file://CVE-2023-45853.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.35.7


