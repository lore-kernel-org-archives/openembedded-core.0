Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.12795.1614955662925205569
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:47:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cdFnyX8f;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id o10so1525342pgg.4
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qyLAdcL30emq/f4lahMENj+XHbxtCjAzsCy/FpTp+ks=;
        b=cdFnyX8fauMqlD+dJ/HiwYmWXOh6slRrd8or1DIzHO8WJf3L3+gYUunuJMz6gMqZ2x
         LUbw69zioZwPBXixNnt+c1RzPeEpWL0A39oNgBu1Ql6QMgiIJn30kJ21ApqnQC83dExW
         XV2sm390gRe1JfZ8N/FF3BiyeDDtdllnwKNbDHOCoBGsYpvU8Hd+Qx/KiQcxc9ps/aRV
         ew0JNPE6EJRpy8507ZxDj4QGAYAkMVk2o7/Z99sOw3Eo6s3YU+EZa09aoKvOcRpZa9U/
         gFvF/8gm627PhB6cD7xErejW4YltdeqE9Cz7zF2kr8VSP9cBSm1EcZyxeoIC/dRDfPg7
         knWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qyLAdcL30emq/f4lahMENj+XHbxtCjAzsCy/FpTp+ks=;
        b=hf1EPS+LeCEJH2BnJ195jKqDGU0D85A3nRud5SJKHRTc37NgawZiM5AfGFhnBsmqfR
         tzThhJe94q0F5ceUjfNCCOb6fSZhjfyxPYuFxUahs5dVKOMlImaDqb5W7jeLM9qsh8Sf
         vmzBr9DjxHo4bMEQmRhORmUg5BgJ18MlboyVjmOB1XwGfLSA78GCOIT15AXEIvVxv0c8
         VpRV7Mpa6qTqXLYf8cWW4Sts+7AQkWjouE++bTr9qAKNm+EF5KpcIbEdsG4DTItO7dmr
         CI2pGWab51tIHsa15zTzFafO3/uu5udMJUTgUvgNwXbUMVX4ZW1U4VuWTLllGYcbWCUp
         inyw==
X-Gm-Message-State: AOAM530cQrrEktwOSPjZR9TjEmtQggyEiodzwM2nSJjuIw68Vq2DQ0EG
	yrWweezLovEsaYehxNz5B2G6i59NqZNErpUG
X-Google-Smtp-Source: ABdhPJx/O8J16eo1caP8yw4MrJqwkU+bXuuOdHubUR0txNDy1/ljIHBY5dfh8eErScpF0XXHL0iFdg==
X-Received: by 2002:a63:c941:: with SMTP id y1mr8928424pgg.313.1614955661484;
        Fri, 05 Mar 2021 06:47:41 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.47.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:47:40 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/27] librepo: fix CVE-2020-14352
Date: Fri,  5 Mar 2021 04:46:17 -1000
Message-Id: <f0df1ff1de6ca9a239d7eafd335b753d6a6e6471.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minjae Kim <flowergom@gmail.com>

librepo: missing path validation in repomd.xml may lead to directory traversal

Upstream-Status: Acepted [https://github.com/rpm-software-management/librepo/commit/7daea2a2429a54dad68b1de9b37a5f65c5cf2600]
CVE: CVE-2020-14352
Signed-off-by: Minjae Kim <flowergom@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1

