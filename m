Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECF2C4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 21:25:51 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.48309.1707081949360671815
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 13:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WU2NoQgF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40fd6c24812so5703835e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 13:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707081947; x=1707686747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GfrQ6lNupmb5QNUMFv+uoi86fKKcRgx1B/XCGqO6DK4=;
        b=WU2NoQgFTLxH8sfVBxwJ9ByBqZS6NUmxZr4f85CVW1MW8eaAvbL1xh7Ai5Y9dlTIkj
         6Y8VDaoLOUHSQSoJ2z5+/TEcHx1MiitBvCPxHcuQwGKtzofj6fWU8nvDxG5KTLlFnYZZ
         WLhc/S6MFatnkuq02AW+ElzSNPlpyk0cWw7lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707081947; x=1707686747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GfrQ6lNupmb5QNUMFv+uoi86fKKcRgx1B/XCGqO6DK4=;
        b=H+Px9UVwQ9H7QvfW1cVVxiiGuv6SjnRdAKzdEVMyKHgXd3JVwKOPpgasuwaHFLDHzb
         8EL6fr2ZYwNgsOBT0AvAjRlBkD7BUUyxEj+Y/klsLariM9085/LSywDLh+Faf37tfGJL
         kKI3Gd9Ryr1p5aPpuVI5dStdAzQGgDlULLp4aBQx+Vn3Cupw+iPZ/8syfrCjq0gHilMl
         CAWtyBW16lFskzwRee+vwPtJPrM282sF9NqYG179ZEkldNHdIcq/zD7urQuYcgO+nMj6
         aSBUMeUDFk0moUucfBzoM6kVaaCO5Vi3pZse8ZM94FhhqhS8nX8goneRT+9xW86751iN
         WsIA==
X-Gm-Message-State: AOJu0YxzY6uawBXzqzgibcIjdxQPeMALSgjgVyf5Zq5t+h5plMwUEzBV
	00erCAMoCXnLZh2F4UV4Q23GAjpe/9C9IE3qblp1GIljSWHHNVQsjQ9K7o6oH5saBUI03jvgnTk
	C
X-Google-Smtp-Source: AGHT+IFDd7S9zBfX/UOHDzJ2yErTWFoeTn6ioMxPrQ8Dd3nGUct/A6dmFfSrK6MapNBNhSJbWLcINQ==
X-Received: by 2002:a05:600c:458f:b0:40e:8fe8:a173 with SMTP id r15-20020a05600c458f00b0040e8fe8a173mr3103558wmo.4.1707081947083;
        Sun, 04 Feb 2024 13:25:47 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8ea0:9a0d:a119:2213])
        by smtp.gmail.com with ESMTPSA id s12-20020a05600c45cc00b0040fc5878289sm6748938wmo.34.2024.02.04.13.25.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 13:25:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Upgrade 8.2.0 -> 8.2.1
Date: Sun,  4 Feb 2024 21:25:45 +0000
Message-Id: <20240204212545.2347898-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194915

This was a bugfix release containing several important fixes according to upstream.

Drop a backported patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...u-native_8.2.0.bb => qemu-native_8.2.1.bb} |  0
 ...e_8.2.0.bb => qemu-system-native_8.2.1.bb} |  0
 meta/recipes-devtools/qemu/qemu.inc           |  3 +-
 ...eplace-basename-with-g_path_get_base.patch | 50 -------------------
 .../qemu/{qemu_8.2.0.bb => qemu_8.2.1.bb}     |  0
 5 files changed, 1 insertion(+), 52 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_8.2.0.bb => qemu-native_8.2.1.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.2.0.bb => qemu-system-native_8.2.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-vfio-container-Replace-basename-with-g_path_get_base.patch
 rename meta/recipes-devtools/qemu/{qemu_8.2.0.bb => qemu_8.2.1.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_8.2.0.bb b/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_8.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_8.2.1.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_8.2.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_8.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_8.2.1.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 14b975db305..2a818701513 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -32,7 +32,6 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
            file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
            file://fixedmeson.patch \
-           file://0001-vfio-container-Replace-basename-with-g_path_get_base.patch \
            file://no-pip.patch \
            file://fix_segv.patch \
            file://qemu-guest-agent.init \
@@ -53,7 +52,7 @@ SRC_URI:append:class-native = " \
 	file://0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch \
         "
 
-SRC_URI[sha256sum] = "bf00d2fa12010df8b0ade93371def58e632cb32a6bfdc5f5a0ff8e6a1fb1bf32"
+SRC_URI[sha256sum] = "8562751158175f9d187c5f22b57555abe3c870f0325c8ced12c34c6d987729be"
 
 CVE_STATUS[CVE-2017-5957] = "cpe-incorrect: Applies against virglrender < 0.6.0 and not qemu itself"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-vfio-container-Replace-basename-with-g_path_get_base.patch b/meta/recipes-devtools/qemu/qemu/0001-vfio-container-Replace-basename-with-g_path_get_base.patch
deleted file mode 100644
index ad4f4101788..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-vfio-container-Replace-basename-with-g_path_get_base.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 213ae3ffda463c0503e39e0cf827511b5298c314 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
-Date: Wed, 20 Dec 2023 14:53:02 +0100
-Subject: [PATCH] vfio/container: Replace basename with g_path_get_basename
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-g_path_get_basename() is a portable utility function that has the
-advantage of not modifing the string argument. It also fixes a compile
-breakage with the Musl C library reported in [1].
-
-[1] https://lore.kernel.org/all/20231212010228.2701544-1-raj.khem@gmail.com/
-
-Upstream-Status: Backport [https://github.com/qemu/qemu/commit/213ae3ffda463c0503e39e0cf827511b5298c314]
-Reported-by: Khem Raj <raj.khem@gmail.com>
-Reviewed-by: Eric Auger <eric.auger@redhat.com>
-Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
-Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
-Signed-off-by: Cédric Le Goater <clg@redhat.com>
----
- hw/vfio/container.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/hw/vfio/container.c b/hw/vfio/container.c
-index 688cf23bab..8d334f52f2 100644
---- a/hw/vfio/container.c
-+++ b/hw/vfio/container.c
-@@ -869,7 +869,8 @@ static void vfio_put_base_device(VFIODevice *vbasedev)
- 
- static int vfio_device_groupid(VFIODevice *vbasedev, Error **errp)
- {
--    char *tmp, group_path[PATH_MAX], *group_name;
-+    char *tmp, group_path[PATH_MAX];
-+    g_autofree char *group_name = NULL;
-     int ret, groupid;
-     ssize_t len;
- 
-@@ -885,7 +886,7 @@ static int vfio_device_groupid(VFIODevice *vbasedev, Error **errp)
- 
-     group_path[len] = 0;
- 
--    group_name = basename(group_path);
-+    group_name = g_path_get_basename(group_path);
-     if (sscanf(group_name, "%d", &groupid) != 1) {
-         error_setg_errno(errp, errno, "failed to read %s", group_path);
-         return -errno;
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/qemu/qemu_8.2.0.bb b/meta/recipes-devtools/qemu/qemu_8.2.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.2.0.bb
rename to meta/recipes-devtools/qemu/qemu_8.2.1.bb
-- 
2.40.1


