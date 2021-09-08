Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.15372.1631124094775639902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LwgM11qC;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id z4so4549534wrr.6
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LvlQU+8Uc6P49+HTnljlcVRLSed2brfSUAhfqS3Mbxc=;
        b=LwgM11qCRTWewl3oPBuX4OaGnNy93Jf2GlRs08+2V0oTVSRRvPvYeQglj4snCkkvXA
         3z53t/c/pzPW7aYdAM1XQEE0kcESJ9dGhiTNBuUnoCwNF1H0Af+MPOrDfVr5oaSsqF+F
         nxy8MfM0qaxm5HNlj+o3aZhiAX1mCURdlRuAkLDKphaDzCYiHpKN9TZcEdwjoFlzl+74
         YudG6phsz+N7uf02PV5ex3MtYA0lCvbA2PLxnD35ocSPVVF1n7wpM/vTL+5GOvfNgxeH
         TJxNxVWFAzs85V1EzQ0Wq90dNURacoAx6kpc9lp91UkR0IBx+Oei5M7d6xx/mLKX7G9H
         oeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LvlQU+8Uc6P49+HTnljlcVRLSed2brfSUAhfqS3Mbxc=;
        b=qldty+0qKZ2A/mDUJkoL44iiOF0RsgQ/0+f0F6V4Z6o3kAIO0o34R6D01graqbL8qg
         nkKr+7mI2stv93icbQuMKZnr6MmLD9cduPBlVF3gixeclc6EqZx2INDNvCprbDeBcY7s
         n0xZIu+mMNwyndj621xiBFW5iypy2EN7eurrMrS3J5ikvyRLX3x1p+NmF9E0HvSfYY79
         q6SiXAFwWqQjaj7srf750RRAe62RY5OtAEwtLD+sPjLfrJHN6KS/6eCUgbwd3Det6iww
         /3rSg7HxywHe5ds3ozR0rvYcKCi9DWyrYmhiXk42n+vqtLntqUSeFT3z1e20ftwp/0iK
         zzCQ==
X-Gm-Message-State: AOAM5338kNqjuYy3GGFHBmW9pCJz6gK+G4e7mIVcUnMhBAV6RMl4MSvD
	WWWy2GlGcPiOEkAfm0w9mynxe0ZQ5n8=
X-Google-Smtp-Source: ABdhPJwgCD/rn7bReADh1Vks6b/dmxq+/f33xAMAXd6ENR8agNOzS5NACbQQMmYaw6brFhnvBihQCA==
X-Received: by 2002:a05:6000:1081:: with SMTP id y1mr5456910wrw.415.1631124093194;
        Wed, 08 Sep 2021 11:01:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/26] libdnf: fix the rpm sqlite-only target setup
Date: Wed,  8 Sep 2021 20:01:05 +0200
Message-Id: <20210908180125.103473-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
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

