Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56389C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.3152.1675840923470174630
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RisSNdlw;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id j23so581531wra.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfhoLGvdJqVdP+Qu0TB7SyQmaHST6P9wTtu4IAuj82A=;
        b=RisSNdlw5Pwf7PbUML+gQCBA02HV2ryhEmIGcy+fc+0ZalmD7MenkQv6eWgMETE0du
         VrPXEGrgarXerrFmWXI31GwZWqK0u9ok0m7BwW7wweknHhSZO8YMR4qVNA+NJ3vqVVRC
         9OkrapBcT+PZNQtDBrreL5cC5425WEI9ZMzNptbV+OWCRwSlkHdOA1YWxqiMPvqNHNS+
         eXJALav3rPLO9wlvffVL/eywreaRcJ5GJCyyGFkiDOOHriut7yXLU7YMFVuJwy24YSqm
         ROGnRqSuxK7wpwKzIxirD1WU5POkv9qCXdBKVHdwAIgEWXiHs9xDMcpMwTFfP8vbo2PR
         /cag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfhoLGvdJqVdP+Qu0TB7SyQmaHST6P9wTtu4IAuj82A=;
        b=zFVxRzoLIG38wBDJN4MIGZUrMZNdj2F/x3/4CgfMUFiRSt6usmn6Waq6XW983fkpB7
         zM68l1nUbRfyJmR5mBkh1r1/NEd247V9ZPEQ2frqMAiZbkHoSJCeFcapqaSoA23GJ/+f
         yOg7sj7Vu0oG9bhbCHFwrZT0jFFrGa0Xvu2iz5nEJl78PTPmw6O1Aa7EWtwb9SIo8zW1
         HW55UllPo4Fmo7D1kfRD9KGAa/0DFFepW8ORS/ENU2jmvEeS48ZRVZti5vhJRBYeYThy
         n9incRfBB6G90ZjAJC5BL9cHS4RUPaSJzC7kckf9nDfLMR3ulqFQ+SzAS2P89QAZEZ83
         uW0Q==
X-Gm-Message-State: AO0yUKXnM+4WSuKvI70zZeuxzhPhl59wf5qvTRx7OBrnw/0UeevpZD4F
	8HcnGyVFYL0z8ilww5FW7VbVUSvD0rE=
X-Google-Smtp-Source: AK7set9X4eo+EwYu1PsmDje10N7vO8AUyjME4yT+Oseia6ODQPjUsABJAhC2eD5l5uVgwedKQwhLrA==
X-Received: by 2002:a5d:6386:0:b0:2c3:dc42:5252 with SMTP id p6-20020a5d6386000000b002c3dc425252mr4892434wru.70.1675840922027;
        Tue, 07 Feb 2023 23:22:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/52] fontconfig: upgrade 2.14.1 -> 2.14.2
Date: Wed,  8 Feb 2023 08:21:16 +0100
Message-Id: <20230208072143.2930292-25-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176866

License-update: remove fccache.c as all licenses are collected in COPYING.

fcache.c used to contain a public domain notice of md5
implementation in the middle of itself, but that too has moved
to COPYING.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../fontconfig/{fontconfig_2.14.1.bb => fontconfig_2.14.2.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.14.1.bb => fontconfig_2.14.2.bb} (92%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb
similarity index 92%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb
index ae5a45be54..a3d29ddbae 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb
@@ -14,7 +14,6 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 LICENSE = "MIT & MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=00252fd272bf2e722925613ad74cb6c7 \
                     file://src/fcfreetype.c;endline=45;md5=ce976b310a013a6ace6b60afa71851c1 \
-                    file://src/fccache.c;beginline=1671;endline=1686;md5=906c2f04b0c79a1bcc84ecfca4de5619 \
                     "
 
 SECTION = "libs"
@@ -25,7 +24,7 @@ SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://revert-static-pkgconfig.patch \
            "
 
-SRC_URI[sha256sum] = "ae480e9ca34382790312ff062c625ec70df94d6d9a9366e2b2b3d525f7f90387"
+SRC_URI[sha256sum] = "3ba2dd92158718acec5caaf1a716043b5aa055c27b081d914af3ccb40dce8a55"
 
 UPSTREAM_CHECK_REGEX = "fontconfig-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.30.2


