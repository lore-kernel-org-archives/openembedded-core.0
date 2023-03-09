Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FD4C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:11 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.16017.1678375209608285310
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X1mmITD1;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so1484415wmq.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxmAriV4ECYUIhdOlAC8FFs3D511n6K7rmTE4Y1ZOFU=;
        b=X1mmITD1VMYPKZlB3GTfQsel9m/KD+f+xA/xbFla8Ln3JWO82h8BmIic9hH7dD1uzR
         9V4vi+dUKGd5fI/q9yvYykXeTuiHhcTzgIimahKyGgc5kAB0Ux4qv8obwx/nkUDTge6v
         CzysoOT7hEESiIoMPMHUGf0/UnVYh4i46PQbJCs1N0nNwpZtZ4Iq7IwNOSt49nMtv8n7
         Yk1YFK7oLle+uXReQhrTyVYnEjVzMJd+4nBtnaNC6AJWfcBL5qoszgyYuY4JgMB4QisE
         z5Ft3K/zd6rL1lfzmPHcB/YJxGIbjYGlfZ/oVryU/ChPUpR7SyPuKamofPZw/lrAl/ow
         NCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxmAriV4ECYUIhdOlAC8FFs3D511n6K7rmTE4Y1ZOFU=;
        b=WBc0ol3AqZBfnG5tCkY1Gq25/aHxfC50PkdxsvKL33o83idOGWYWL7CHNNAGIqQc6q
         oIlkVL2CQvIwKX9tIhJmueASVkuKD1CqWQjeccs0DeVQHVNJ43yvx0l9t9FiAxIXpEAy
         eeCpZDEoOqIcaW+2i+2F7q+jIbJJ+xACFIdFeiWteL5pftGLdDsUiz6yFrpxXfKInQ68
         w199R8xEYhXgIdynhvELrcUjuBTPloGvaS1V+GPm3AsLkkwYtb+jv5FuhZlbmrJLEtaK
         gIxmi3bIoIA5rVsZhtsHKZ048L2bBjq9QJy7/ZOEdb0ytVazxJeNgIQXSrbItN/+6ep7
         W4rQ==
X-Gm-Message-State: AO0yUKXzWRMFKU9ZdLTVjebqQwGOfhaEnh7fyX6f576b5HizXc683LEg
	smL1qVnjx26HyENTJymkAA84PG/yL9M=
X-Google-Smtp-Source: AK7set84c5GX2nNzu/HGO8UP3p2Nab9nYAU1qAHTgzxntA1aCMGvWLxoDZgjqfoN5tP9YUr+sAnORA==
X-Received: by 2002:a05:600c:46c6:b0:3eb:3cc9:9f85 with SMTP id q6-20020a05600c46c600b003eb3cc99f85mr21555035wmo.26.1678375208173;
        Thu, 09 Mar 2023 07:20:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/26] libdnf: update 0.69.0 -> 0.70.0
Date: Thu,  9 Mar 2023 16:19:39 +0100
Message-Id: <20230309151958.3619193-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178232

Drop the patch as issue addressed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...xt.cpp-do-not-try-to-access-BDB-data.patch | 37 -------------------
 .../{libdnf_0.69.0.bb => libdnf_0.70.0.bb}    |  3 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch
 rename meta/recipes-devtools/libdnf/{libdnf_0.69.0.bb => libdnf_0.70.0.bb} (93%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch
deleted file mode 100644
index 6f8a3dcb50..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 2f7382b35d59fe08034603497e82ffb943fedef1 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 30 Jun 2021 15:31:16 +0200
-Subject: [PATCH] libdnf/dnf-context.cpp: do not try to access BDB database
-
-Upstream-Status: Inappropriate [upstream needs to rework this to support
-sqlite]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- libdnf/dnf-context.cpp | 14 --------------
- 1 file changed, 14 deletions(-)
-
-diff --git a/libdnf/dnf-context.cpp b/libdnf/dnf-context.cpp
-index 86f71a79..9cdcf769 100644
---- a/libdnf/dnf-context.cpp
-+++ b/libdnf/dnf-context.cpp
-@@ -2264,20 +2264,6 @@ dnf_context_setup(DnfContext *context,
-         !dnf_context_set_os_release(context, error))
-         return FALSE;
- 
--    /* setup a file monitor on the rpmdb, if we're operating on the native / */
--    if (g_strcmp0(priv->install_root, "/") == 0) {
--        rpmdb_path = g_build_filename(priv->install_root, "var/lib/rpm/Packages", NULL);
--        file_rpmdb = g_file_new_for_path(rpmdb_path);
--        priv->monitor_rpmdb = g_file_monitor_file(file_rpmdb,
--                               G_FILE_MONITOR_NONE,
--                               NULL,
--                               error);
--        if (priv->monitor_rpmdb == NULL)
--            return FALSE;
--        g_signal_connect(priv->monitor_rpmdb, "changed",
--                         G_CALLBACK(dnf_context_rpmdb_changed_cb), context);
--    }
--
-     /* copy any vendor distributed cached metadata */
-     if (!dnf_context_copy_vendor_cache(context, error))
-         return FALSE;
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.69.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.70.0.bb
similarity index 93%
rename from meta/recipes-devtools/libdnf/libdnf_0.69.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.70.0.bb
index da2550d323..14d6a37de1 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.69.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.70.0.bb
@@ -10,10 +10,9 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            file://enable_test_data_dir_set.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
-           file://0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch \
            "
 
-SRCREV = "5c6d9cd6e5955e7038722f091396607c60fcbdd1"
+SRCREV = "93759bc5cac262906e52b6a173d7b157914ec29e"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.30.2


