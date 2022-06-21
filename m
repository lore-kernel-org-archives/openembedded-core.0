Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E371CCA482
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:28:48 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.1187.1655854121611000700
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=A5kozp4P;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 h34-20020a17090a29a500b001eb01527d9eso14170497pjd.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dNigL2JlWZ1EMq7HGDDyozn41ypvWtZQ5bXZCHvYiys=;
        b=A5kozp4PNeQpfDpenGEUwZwiI7wVpv2/BWMO+Kpqk43kNE6Z8ytqgiWEmvxohVCfR8
         BLuGzgAavxh/7tZPi9bYYBE7YWHhoD7tQzoo6o5xQRairauBoX4mEK9NeOKolABCW2Z2
         GJEQeL6I4bkovUSyfMLxiAW+FueSktHad1jUNBb7IJ9ZfvSMSJ+L/UHkNMS6uGYd0Tvs
         VNRNh1beyhQunLteptdSPiPXkw9eaPSIpX4umfq8HmLcWUOv/nyvy4zkBnxZGiKpZcfe
         ODGTWJl8ic22lVDpENuDvwTCUg6WPmElI0HaXbznbu4Q7SFELfBw2vRWqZXyDJENzf6M
         xUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dNigL2JlWZ1EMq7HGDDyozn41ypvWtZQ5bXZCHvYiys=;
        b=vylXamB0fPEeCLExUcJvzThif656tP4jhK/74XIX+UDOQkvLUUHu2/0rBHHFjTEV5v
         6ASmpcRg0KZLDrBA+H0/6RvI7phxIfysZbza3XgnVYF8yam5ZD4XcrwwHndG+HBMxpy7
         fxbGd4O+6F/97gPolW6RV4l/cax8+EkCWQ0+9LExlV/3fuWZ+V0hgtmNWwzaqEkTUEg4
         W7VFR0Dr8FDGkaqR4i+QO9fF6MF1fNEtnoPRtwB9KcuhfLbbxXr0jN6vCkTtUJyGxdqh
         ewjy3qO4tO44kTZEJoee54BYiVFj9P4fJFh0RzTer34uxwv36HnfE33rQazcXdK9Gs6G
         Bc2g==
X-Gm-Message-State: AJIora/c3SkWh8om8ubc9I7YltXXK6VJaF743yhwFa+v5QLGbG20ij5H
	EupqQQKaN/1iaaYJW4EHkGKEg9JcGM3eqMw8
X-Google-Smtp-Source: 
 AGRyM1umuiMpcTi+qA9yMtoFN0jNU9tAJOYoP2su71c2SWSRfiACfdk9m+4XglcqXs4TYUqv7eAEiw==
X-Received: by 2002:a17:90b:1b49:b0:1ec:a756:edc with SMTP id
 nv9-20020a17090b1b4900b001eca7560edcmr425064pjb.200.1655854120631;
        Tue, 21 Jun 2022 16:28:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z9-20020a1709027e8900b0015e8d4eb209sm11323565pla.83.2022.06.21.16.28.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:28:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/13] gtk-doc: Fix potential shebang overflow on
 gtkdoc-mkhtml2
Date: Tue, 21 Jun 2022 13:27:57 -1000
Message-Id: 
 <bffe06fca6b31914289fdd441a6dcae94b3902fe.1655848177.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655848177.git.steve@sakoman.com>
References: <cover.1655848177.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:28:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167201

From: Paulo Neves <ptsneves@gmail.com>

A native path can cause a shebang overflow on gtkdoc-mkhtml.
Replace it with /usr/bin/env.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f018d3f77f27b73206a26c78228fed563950bd9d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
index 150d2c0b23..392913fcc6 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
@@ -43,6 +43,7 @@ do_install:append () {
         ${datadir}/gtk-doc/python/gtkdoc/config.py; do
         sed -e 's,${RECIPE_SYSROOT_NATIVE}/usr/bin/pkg-config,${bindir}/pkg-config,' \
             -e 's,${HOSTTOOLS_DIR}/python3,${bindir}/python3,' \
+            -e '1s|^#!.*|#!/usr/bin/env python3|' \
             -i ${D}$fn
     done
 }
-- 
2.25.1


