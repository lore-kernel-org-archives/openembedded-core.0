Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.5533.1614772399384121785
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 03:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R5mFlu8M;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: flowergom@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d12so13560669pfo.7
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 03:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5QCmXZPexi3tsUDq/xxLjelTSnbrA3Qx62D+IcJFaA=;
        b=R5mFlu8MIZNWnllsFrgR61yzu8QqYaAwbqXoxVVt9ezaY+5CEE0sIlrdtZoa2+0Jsi
         FWa67uw/uLJCNxXcwWAo2rWHqArr1Damtr524Gyu6xxnug2YM8wXOZx5Bge9CRYBPvd6
         p9F43JKKfpOmgn7CjSTPyP+nvpeU8Bw0ogOjhi0EOn3g/CCbkFGI02veOtYaTiH44F3R
         Rk7VowT+rQfpekjTdCrH6Zo6N4p1RPNQBWS4B79KwXcw2QKMjWiWyXdGdw7kY/AQY8pH
         CXQ0Ba4UzS4SHfd4rWQI7gzUpR2yivzgqieY/4ejr3+DzEZFM0Tzi0LD1O5uI7z5J1Ne
         GAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5QCmXZPexi3tsUDq/xxLjelTSnbrA3Qx62D+IcJFaA=;
        b=sdr3u9ojjSOKVXr4Wa/oNjNL0xEP/6S4DncTlCr3jzDVWjPfZFn/aEe7HiIS/Pby9Z
         59Epn6Dn+TYp6KuiQRtIdfdCZ1NDmhYJbw8sgfOdonJ+kXAIaWRrTChVNTClcK4rGDRQ
         b9COaotu69AseLH6eDqmOFIDGkNP/TYb55RJnxeeNjHm9dYs3g+eXzImlFusRDA8qwej
         HikkGcOMJDZlkbj5sp9e7BCTW1Ot6PwG1aP1jrGzmLCng4iE9gyKTOptkJ343tPcUuoF
         e/xN+liVjpyIgwgYipzl63TBIsTdDWVy4XnChvtDyb2laWdoIrd6nCi1A7Tolb7+WzR0
         WOfg==
X-Gm-Message-State: AOAM532C3Bc1Nw5rD+jT+KxczzEHPHlzxq/0ZMmZaBxk6Wgnn+870S5O
	K5t96JGeQfheN5ce8GlVlOkGgLcJZtFdmg==
X-Google-Smtp-Source: ABdhPJxDAeWzleLqsF1sqri3Tds51/vEOoPgqcktzwjOxM/v9moBbsGLvH/kJMxp0/e43e53Vwy88Q==
X-Received: by 2002:a62:6005:0:b029:1d9:ce00:26cf with SMTP id u5-20020a6260050000b02901d9ce0026cfmr2946875pfb.7.1614772398538;
        Wed, 03 Mar 2021 03:53:18 -0800 (PST)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id h20sm23859390pfv.164.2021.03.03.03.53.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Mar 2021 03:53:17 -0800 (PST)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] librepo: fix CVE-2020-14352
Date: Wed,  3 Mar 2021 20:53:07 +0900
Message-Id: <20210303115307.1293-1-flowergom@gmail.com>
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

