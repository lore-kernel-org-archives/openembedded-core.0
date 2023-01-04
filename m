Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37131C54EBE
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:42 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9362.1672830357307718609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ui8OLyci;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id h16so32518710wrz.12
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PndgF2+7oBPwARI6hTcWLD6kgV6FMV2O7NouVPsITsI=;
        b=Ui8OLyciQXBw0S0IDXu3IcskagTQ1D0Fp+s84CDfygq0zvPkI7D5A/FGwrBA61ZSyg
         DFQDx2Xp26bxGovowp9bMhLyzD0PLcCI12CqmdJmU3hZNjJJJ+O3L9CkmdoIDexmUrNO
         EQMDRPvOSsq4wZbCBROeLenlvMYn6XiGi3FAaXEp9qS7zRMH5ePeag4ewBusNpwJoyJ6
         slkT61paN3EigIhTvBlOsfSYZ/132hyLagnHL/xCJduHq4kdaIbnfWblWDw6X1BQmC8W
         cmhUjtEeH+1eRqrVXLw7lQXIWqv78HRRm92bV5ly9P0XLIdnQgxdhczSBDP1h/wf1DuI
         8/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PndgF2+7oBPwARI6hTcWLD6kgV6FMV2O7NouVPsITsI=;
        b=1el9dMwVG5dPlB2ZxVG8hlMxM/YD6jJ3Vz2k3NGKZnGQzztX6xOrPI2tuwdCIgC91r
         R7mEDHK6AntOtGvhHDKWr/wFgZctqwFVeyYLGjjfDECNqmsauJjfVVXX0Yvaz3j1mqti
         Fd4NRoaPTUtHbqrc5IZULQR7JL35haTmAjKZeirm0fB43BroZuqfH0DqlI4YPqL7CdII
         w2Imiw6edF1zP+vt42N7F+Y2TH7KRe/hiOOnF+KUz5ODVPXFgMYJoh5q5Td92jIAc6bc
         FglOGnVPYUSbMZiOQHkaDwRKnhDMiTKA57Ls/1KKh9HsjqUlHrsG5mrTlT99mijYNfBg
         xrMg==
X-Gm-Message-State: AFqh2koKvsU6BSaNtPe+tNlIAbPoPuDt0HC+b5Qh0twpwgphB2LL3HGZ
	dFfZQFkVeuJX2B96y7mJDNWOukG3K58=
X-Google-Smtp-Source: AMrXdXvlqi/GKMm6hptQdlNZRbYQ3pRk6oY4h4twDZZILgU71BnKqQAcXG/w4iyT9Iqt/UexcWOoEA==
X-Received: by 2002:adf:eb08:0:b0:242:e73:f636 with SMTP id s8-20020adfeb08000000b002420e73f636mr39193335wrn.4.1672830398398;
        Wed, 04 Jan 2023 03:06:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 60/77] gobject-introspection: upgrade 1.72.0 -> 1.74.0
Date: Wed,  4 Jan 2023 12:05:31 +0100
Message-Id: <20230104110548.2537259-60-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175445

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-Relocate-the-repository-directory-for-native-builds.patch | 4 ++--
 ...ntrospection_1.72.0.bb => gobject-introspection_1.74.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.72.0.bb => gobject-introspection_1.74.0.bb} (99%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index ba965092e1..030ff17601 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 74a0fee892235c722ac60ddea6ee79bc3d7a93f5 Mon Sep 17 00:00:00 2001
+From d396e5126461631e2c73ce98ba034f1e44598f6a Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
@@ -21,7 +21,7 @@ Signed-off-by: Sascha Silbe <x-yo17@se-silbe.de>
  2 files changed, 14 insertions(+), 3 deletions(-)
 
 diff --git a/girepository/girepository.c b/girepository/girepository.c
-index 7d03485..20f4813 100644
+index a0754f4..2d456f9 100644
 --- a/girepository/girepository.c
 +++ b/girepository/girepository.c
 @@ -21,6 +21,8 @@
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb
similarity index 99%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb
index d935cbd905..ab9d2d35d9 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0001-g-ir-tool-template.in-fix-girdir-path.patch \
            "
 
-SRC_URI[sha256sum] = "02fe8e590861d88f83060dd39cda5ccaa60b2da1d21d0f95499301b186beaabc"
+SRC_URI[sha256sum] = "347b3a719e68ba4c69ff2d57ee2689233ea8c07fc492205e573386779e42d653"
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.30.2


