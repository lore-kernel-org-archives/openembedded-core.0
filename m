Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D0BC5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 05:03:45 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.14280.1709874215948985696
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 21:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ljE2qO+P;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: nikhilar2410@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-21f0c82e97fso330392fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 21:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709874214; x=1710479014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DYiHRgVn5gJ3y9xaUSAs9+Atbgg6/92Q3GEUwMLEgTQ=;
        b=ljE2qO+Pj0HQEkJWj4lV0WSm7VQvoDW5mSktdFxHeavP8KeWH4L9ZwKX1ieHQQkd7b
         LufrLtrE5nuxpyzSNowbdVmhQkeXc8Tp2kfRnYELDu7U0X+xUaaO98eVNHoRM5bBIah/
         duWoIQNHBv+PRKNDd2iG+vcIgKUqLpzoESrrcJKpzzZGRUkD2SpZ7ozRQwaqfYz5c9IR
         7+XtdZh4pxYlIhJ4dY6NYHIKI3e46qXq+ogYPDuJ3LUz3A9xqcSzG4LoZ4TJxDp29S5k
         gATnxyGAWnWInYcQqwLtVtcx6lJCUKWy2XYIXqYaOJgEW8gen8pAa9VulACWu3JDsyzh
         1tVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709874214; x=1710479014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYiHRgVn5gJ3y9xaUSAs9+Atbgg6/92Q3GEUwMLEgTQ=;
        b=IqzE/sYV3uDUVMhleLvROMBzQ9qGFBMtcAWyha9urxOC05kT7DBvkimsKLYMJu6f5+
         7yvs0vkRnhdHU+rJEu0prisWtwv6xXb/VkBtLuu+HAoJJ045wNkKlNO9FDFM9eHe3zSj
         qQ+CbDOiEJhMKE/jljOQiTx3NjrmHKTuqC9F8Oe/wwpvIFs7lRYWYCdb3bvCD5oVS6DW
         rrxFbnJdcwCtseq3Y7dR6LPQsj4lFcU6cz6TxGW3jpumMi1rLR8uquX4aimZGK4B8i89
         I9IQ+f7qc+hoHDOH5bwbLTNwDVVOo7maq0mn1Fa+vndSbDyAlz7Lzg+5VJhSdytAanXp
         8Zqg==
X-Gm-Message-State: AOJu0YzD6QFHBH+BLLizr8PJWriCRjUHPvbPiT9u8Dp31zi3ycDSzlPi
	GjzOyne9KaAiGahxR18NYRKct6/E/Ium3tFxAZ+M1atrVwVGLMtCIP+WvtIPOA==
X-Google-Smtp-Source: AGHT+IGy7F8xRsA6wAlDpVGct6buTb2WxKJzfn8kiI8LTnYDBpD76krGv+fZp02mq9c2iyOK69FITQ==
X-Received: by 2002:a05:6870:1159:b0:220:dc43:f9f2 with SMTP id 25-20020a056870115900b00220dc43f9f2mr1728723oag.38.1709874214355;
        Thu, 07 Mar 2024 21:03:34 -0800 (PST)
Received: from localhost.localdomain ([103.146.224.223])
        by smtp.gmail.com with ESMTPSA id lb14-20020a056a004f0e00b006e58d5b1828sm13397625pfb.28.2024.03.07.21.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 21:03:33 -0800 (PST)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-core@lists.openembedded.org,
	nikhilar2410@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Nikhil R <nikhil.r@kpit.com>
Subject: [OE-core][master][PATCH v2] librsvg: Fix do_package_qa error for librsvg
Date: Fri,  8 Mar 2024 10:33:28 +0530
Message-Id: <20240308050328.33102-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 05:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196846

When using meta-rust layer for rust below
do_package_qa error in librsvg is observed

Fix the below error:
ERROR: librsvg-2.52.10-r0 do_package_qa: QA Issue: File /usr/bin/rsvg-convert in package rsvg doesn't have GNU_HASH (didn't pass LDFLAGS?) File /usr/bin/rsvg-convert in package rsvg doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags] ERROR: librsvg-2.52.10-r0 do_package_qa: Fatal QA errors were found, failing task.

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.56.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb b/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
index 9824b8898d..e6eece6858 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
@@ -77,3 +77,5 @@ FILES:librsvg-gtk = "${libdir}/gdk-pixbuf-2.0/*/*/*.so \
 RRECOMMENDS:librsvg-gtk = "gdk-pixbuf-bin"
 
 PIXBUF_PACKAGES = "librsvg-gtk"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.25.1


