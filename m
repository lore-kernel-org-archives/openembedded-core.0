Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.5901.1614516649137303194
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 04:50:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F+OuS3Pt;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: flowergom@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e7so12245526ile.7
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 04:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5QCmXZPexi3tsUDq/xxLjelTSnbrA3Qx62D+IcJFaA=;
        b=F+OuS3PtFKMhgUudlhbitXSIbm5h/NkXX448frJmbeyuDVdyaHn7sqIV95el3JIHAu
         yKS3TDW37CbFQmHv+DsA4TIooavpvM5X7BWjpN9/LQj/5BolMvKq/azbegIdyJvOh8f1
         tK1tGXyf+DmHy3HIV33eLUxLJRSlX6af6+XCYxAHUtREa/B1nKV2kfghADz16Xg1J2BJ
         fp0QAVaCOhsoBlxaxw0s/lcFwd6v/m3Fr0gHalFKeQ9kYYmSfWu2MMGPo+jqRVLH5MMy
         6816+gmSsN277hCcTEDtnYRAHDuyzGBUT4I+71fP0Iu94XTsQ+NxXN4gNiLEAArAT5ra
         Hc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5QCmXZPexi3tsUDq/xxLjelTSnbrA3Qx62D+IcJFaA=;
        b=sxzeJ+hV+iY7O8V5CUY2zcayw2a5CM1eoS18pOMyHjYVQuQ65t1WR2x8ZGCRvdWgbD
         4j6QO5lBEq0PZ8CpwVtMoLuMZeYV6NoRnnJOKaxpA8TBApURaQ0/oWe/wXmK6Yf1C261
         smT5sIAWXX90iY9EdSzKQZkn8BtD70YzYlwHEdhKOWUQaQ8eyec9j+U6vP3FGi9EisrQ
         OCNUjSnUXVzRIhcBwhO5LKIdj+oEFJQV5jeQSMOH3itqtosZPkNcCRzlPr4oOEYoG/wI
         BBj58hLtn72bVgX3lteBP+gTDglFCxeZxnECpL1l4CDF+to9OZAYIOxmYDc/q4U819zj
         oyEQ==
X-Gm-Message-State: AOAM532AO996ln91rjLpgub4ujswiRjLh/R2c62wRCPUPicJWSu5Y+UR
	9fW10rtEp523hyjIX+TmyYJ8/HGww3q7Kw==
X-Google-Smtp-Source: ABdhPJyAWDGMb7JBkXZnZl8gFSc9Cg+u/EGMVAJ3x/Mf8g5rHJRqtN/6VwSTch3nSzH3WUDOT0C3Dw==
X-Received: by 2002:a92:c54b:: with SMTP id a11mr9705769ilj.208.1614516647938;
        Sun, 28 Feb 2021 04:50:47 -0800 (PST)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id h128sm8204856ioa.32.2021.02.28.04.50.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Feb 2021 04:50:47 -0800 (PST)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [PATCH] librepo: fix CVE-2020-14352
Date: Sun, 28 Feb 2021 21:50:22 +0900
Message-Id: <20210228125022.1211-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

librepo: missing path validation in repomd.xml may lead to directory traversal

Upstream-Status: Acepted [https://github.com/rpm-software-management/librepo/commit/7daea2a2429a54dad68b1de9b37a5f65c5cf2600]
CVE: CVE-2020-14352
Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 .../librepo/librepo/CVE-2020-14352.patch      | 55 +++++++++++++++++++
 .../librepo/librepo_1.11.2.bb                 |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/librepo/librepo/CVE-2020-14352.patch

diff --git a/meta/recipes-devtools/librepo/librepo/CVE-2020-14352.patch b/meta/recipes-devtools/librepo/librepo/CVE-2020-14352.patch
new file mode 100644
index 0000000000..8f4c5b73bc
--- /dev/null
+++ b/meta/recipes-devtools/librepo/librepo/CVE-2020-14352.patch
@@ -0,0 +1,55 @@
+From 6027d68337b537bf9a68cf810cf9b8e40dac22f8 Mon Sep 17 00:00:00 2001
+From: Jaroslav Rohel <jrohel@redhat.com>
+Date: Wed, 12 Aug 2020 08:35:28 +0200
+Subject: [PATCH] Validate path read from repomd.xml (RhBug:1868639)
+
+= changelog =
+msg: Validate path read from repomd.xml
+type: security
+resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1868639
+
+Upstream-Status: Acepted [https://github.com/rpm-software-management/librepo/commit/7daea2a2429a54dad68b1de9b37a5f65c5cf2600]
+CVE: CVE-2020-14352
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ librepo/yum.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/librepo/yum.c b/librepo/yum.c
+index 3059188..529257b 100644
+--- a/librepo/yum.c
++++ b/librepo/yum.c
+@@ -23,6 +23,7 @@
+ #define  BITS_IN_BYTE 8
+ 
+ #include <stdio.h>
++#include <libgen.h>
+ #include <assert.h>
+ #include <stdlib.h>
+ #include <errno.h>
+@@ -770,6 +771,22 @@ prepare_repo_download_targets(LrHandle *handle,
+             continue;
+ 
+         char *location_href = record->location_href;
++
++        char *dest_dir = realpath(handle->destdir, NULL);
++        path = lr_pathconcat(handle->destdir, record->location_href, NULL);
++        char *requested_dir = realpath(dirname(path), NULL);
++        lr_free(path);
++        if (!g_str_has_prefix(requested_dir, dest_dir)) {
++            g_debug("%s: Invalid path: %s", __func__, location_href);
++            g_set_error(err, LR_YUM_ERROR, LRE_IO, "Invalid path: %s", location_href);
++            g_slist_free_full(*targets, (GDestroyNotify) lr_downloadtarget_free);
++            free(requested_dir);
++            free(dest_dir);
++            return FALSE;
++        }
++        free(requested_dir);
++        free(dest_dir);
++
+         gboolean is_zchunk = FALSE;
+         #ifdef WITH_ZCHUNK
+         if (handle->cachedir && record->header_checksum)
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/librepo/librepo_1.11.2.bb b/meta/recipes-devtools/librepo/librepo_1.11.2.bb
index 6a0a59f865..b1d97eba53 100644
--- a/meta/recipes-devtools/librepo/librepo_1.11.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.11.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
+           file://CVE-2020-14352.patch \
            "
 
 SRCREV = "67c2d1f83f1bf87be3f26ba730fce7fbdf0c9fba"
-- 
2.24.3 (Apple Git-128)

