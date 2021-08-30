Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.1311.1630349291136105110
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 11:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q2mJYrDT;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id q14so23846098wrp.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 11:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LvlQU+8Uc6P49+HTnljlcVRLSed2brfSUAhfqS3Mbxc=;
        b=Q2mJYrDTvQFoYUpNPu8xQxtmCwhj+GuVDL05n5mkT3/hyUblnDFaL0v6x4+7jHwUZ/
         F+quosl5DCgJNzJkQbZFumAC2l6SZvAYhftHr1rAmpYqHTXxCwb30IGsXeCiWw+qT4/B
         FmXtLNKrZRpswg/CbSTDO9/PeCCBxytfyZedz2coCdebK25hZKbiWqHcmyJhvth86tgy
         lEYccgnqsnwrQMgi7te/dE42I7cO2xzF3+K5ImJZ3T5sOIdzhMiFEOfVMAxCWk2usZ7h
         O/U/+n1cSoDijfD2hYS+DmTBsz4l6yVb2NcT/1XCLkuV/FG9IwTRjgREMv1ZBskNq0PF
         fIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LvlQU+8Uc6P49+HTnljlcVRLSed2brfSUAhfqS3Mbxc=;
        b=AmMz8TYlT0p7Rc6Z0d1/EI6MncpeYhHbuYjFMWEIh/j72Pzg7EJb21iRTYiaCuNY4r
         ZwgPNiWSLEC983rdPQgTdm6tRn2sSP9gNpzpXw26G1Hd0dlfiprDP/mTFgz+l7fEX0Wa
         tjjtU8pPZBTM/j/wgxy2McoH6jcd+xsxaFiD5fWUlKsOOu0cxIzFvqBYvmjod+hym0lf
         PbvbL19ws+3/wzOzXCSnfhyyk8rDzr6EBgl5BFiybzLBoMW1V88QOf06C2xonF8+QJeB
         AQnf5fzKJPFx/RU3pOf1uJzZgSps018MIclo1W2gQXdVLXEzNTOH7ln9enKCah+rnGtl
         sQ3g==
X-Gm-Message-State: AOAM530tTBZn0ysUbDRCtXVDAjzDSWWyI/FErs6ZGZ9IHu2zlopHivM6
	oqutoKSuBFHC5zflOZLc940qWC0T9Tm5Vw==
X-Google-Smtp-Source: ABdhPJwvmBPAKx5fXVTU5fMQ2NbG59WTR+kK+tuu+K/ZCvudFuBYEEeBZy/7kBoEoEFftp70goHN5A==
X-Received: by 2002:a5d:4c4c:: with SMTP id n12mr27615196wrt.19.1630349289741;
        Mon, 30 Aug 2021 11:48:09 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id e2sm18141487wrq.56.2021.08.30.11.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 11:48:09 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 4/7] libdnf: fix the rpm sqlite-only target setup
Date: Mon, 30 Aug 2021 20:47:57 +0200
Message-Id: <20210830184800.954770-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830184800.954770-1-alex.kanavin@gmail.com>
References: <20210830184800.954770-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...xt.cpp-do-not-try-to-access-BDB-data.patch | 37 +++++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.63.1.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch
new file mode 100644
index 0000000000..6f8a3dcb50
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch
@@ -0,0 +1,37 @@
+From 2f7382b35d59fe08034603497e82ffb943fedef1 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 30 Jun 2021 15:31:16 +0200
+Subject: [PATCH] libdnf/dnf-context.cpp: do not try to access BDB database
+
+Upstream-Status: Inappropriate [upstream needs to rework this to support
+sqlite]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ libdnf/dnf-context.cpp | 14 --------------
+ 1 file changed, 14 deletions(-)
+
+diff --git a/libdnf/dnf-context.cpp b/libdnf/dnf-context.cpp
+index 86f71a79..9cdcf769 100644
+--- a/libdnf/dnf-context.cpp
++++ b/libdnf/dnf-context.cpp
+@@ -2264,20 +2264,6 @@ dnf_context_setup(DnfContext *context,
+         !dnf_context_set_os_release(context, error))
+         return FALSE;
+ 
+-    /* setup a file monitor on the rpmdb, if we're operating on the native / */
+-    if (g_strcmp0(priv->install_root, "/") == 0) {
+-        rpmdb_path = g_build_filename(priv->install_root, "var/lib/rpm/Packages", NULL);
+-        file_rpmdb = g_file_new_for_path(rpmdb_path);
+-        priv->monitor_rpmdb = g_file_monitor_file(file_rpmdb,
+-                               G_FILE_MONITOR_NONE,
+-                               NULL,
+-                               error);
+-        if (priv->monitor_rpmdb == NULL)
+-            return FALSE;
+-        g_signal_connect(priv->monitor_rpmdb, "changed",
+-                         G_CALLBACK(dnf_context_rpmdb_changed_cb), context);
+-    }
+-
+     /* copy any vendor distributed cached metadata */
+     if (!dnf_context_copy_vendor_cache(context, error))
+         return FALSE;
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.63.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.63.1.bb
index 282c28e2c4..a9f393e722 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.63.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.63.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://enable_test_data_dir_set.patch \
            file://0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
+           file://0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch \
            "
 
 SRCREV = "8e451380bf84bd76e3925cbae2a06bb0e56f5cd9"
-- 
2.31.1

