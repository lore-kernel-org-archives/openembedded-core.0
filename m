Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E18AC761A6
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:45:44 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.5142.1679003136797787459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KuMgGRKu;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso2997098pjb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54fuYvq1pzHb65XjQbW754SHkCwa5Ijklib5q92SjoE=;
        b=KuMgGRKufHcUBdK/Gc97pb9TcqWmAxtik2jo1RQu0n4c/S+T5+0wNNIpdnUlaSm46Z
         TtKfo+pjPhS0FpdT9uXVxXRVwZ3eKBWjpcdUFYVFJny33vDAoht4jEj2+yOp5eCX9682
         XQhvqSyVhA3m7J1ZkvzW2vGuQxWgea1kcmHnLBkSbEJdXJ0o9wg7UknPdm3IwI/DY3wU
         R8d1SX5tK0qjXOzkj6Jwn+EQX1Nc21eBWs9YX13F66eo2TZ4XtLrEtxOuvlmehqVPF+S
         gFoL081ksFgAZ9pK3ZPrHfx873rQKCdLC6WIrswAhZavFGxjDlkn4bgapGkMA7w12bPL
         9JCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54fuYvq1pzHb65XjQbW754SHkCwa5Ijklib5q92SjoE=;
        b=qU+5RdcF3D/fkiGv0gv/dJvCehTRqCTq7yMtY7l7wsTRNumwja3dJ9dXuvpD2+LHmq
         nu4mOQVEBktKaY6LKKIq/SqE1dfQrCKwHa4N5xNWvBOxkVhyvgsMtSxGrx0V8r7kgQBW
         qItbcwScwtHBdBtUHr5bjaodf6sJGKDdEK5ph1J+U3CWBa+LFiGkCx7//lm1B74hm+UI
         7fF0heRmN6FyydXHBmW52uupx0J5LMJAHBnrxi7L/jHI3WRkKkuvHdwePNuwbuhJ3hSh
         eZK+uZlsLZNCTBXHVxrPV8NgiTVl3AKWhJH0vm65ieg0Who6LLnS+QfUoOV6j+A7+LAc
         Zbcg==
X-Gm-Message-State: AO0yUKX5LhmR8UG9VG0fvjpMGCTif5r/eoPplWn/wWV5tjGaNmZ3NcLx
	GFx+xnts3+Xi9x3wDTKkn/Q4SqF1cesl06R6bew=
X-Google-Smtp-Source: AK7set+f79wLFYrMkutuvqxyftC0oBnf8UwkXN2bw7qbpieie49VbpODuUcJnPqWKwljTthtq3Pu9g==
X-Received: by 2002:a05:6a20:2445:b0:d4:78f7:c4e8 with SMTP id t5-20020a056a20244500b000d478f7c4e8mr5857634pzc.25.1679003135874;
        Thu, 16 Mar 2023 14:45:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/23] libdnf: update 0.69.0 -> 0.70.0
Date: Thu, 16 Mar 2023 11:45:01 -1000
Message-Id: <7f4f1455ecc5cef1f4938efc3af27086d5b55d86.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178715

From: Alexander Kanavin <alex.kanavin@gmail.com>

- Security fixes:
  - Allow change of architecture for packages during security updates with noarch involved (RhBug:2124483)

- Bug fixes:
  - "dnf_keyring_add_public_keys": reset localError to NULL after free (RhBug:2121222)
  - context: Get RPM db path from RPM
  - Fix memory leak of SolvUserdata

Drop the patch as issue addressed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b5a4c652448284253ab1444d05fdf6bfebfa4273)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


