Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4889DC46CD2
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 00:33:01 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.4649.1706142775911448804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 16:32:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MiT5uq7T;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6ddf05b1922so4603502a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 16:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706142775; x=1706747575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WtsUzN2l7Av61COGvAybcjetyliM33wLvyaDb0n/sK4=;
        b=MiT5uq7T1A0nicvWveReRgPTFLpHejwD2adR405aJy4UxgjgYg+j44oHezYI1pn85Z
         f/f/78MpVKt/nNpwaDP/I6aGfh9MiWdMgLVx+D03AkITr4OYJaeV1EthCNslsA+D123T
         RvjmnPE6vmfl9Xts5YXd/CsYJcr5QYGCzV99tHWPIa6kia6XqmbId3hBajFW31d6AWAv
         5XUhfkgwzeJTZv0CoEURIDv8kpB9sdtPnVpEUqzOT2m0Sg4GSamuXLvwf+XiKjO6a+h+
         FP/sfJ1OE4BbqFXp7zPVZCJ5VKrSzPI+ZML7GFZ8BAdUWPsewurd6SC8YcQ88ocE290v
         rekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706142775; x=1706747575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtsUzN2l7Av61COGvAybcjetyliM33wLvyaDb0n/sK4=;
        b=M80kI2gI0+dZGpPO1Q0cKylY2M581Maqr/SXAtwL3iUO2D3tZLVBdznPer6VMo+mwj
         SZR/6qZa/u136YIpmksPf9DKV/qjyZvfiQ9REkt7zS79N6/djS5yEbG+r73dw0tuHVDT
         dNZfSqu4UaauaPNShu667SOcXBnC5hJJZm+sJn/IOxcN+RLCtea/G4e7WCAhdYrl4OVK
         SqIIJqcHlU1B+np7L3dhkDYLAp0wuOQyCFFyDbWCWsLSTZ0Q8F7s0jjQiYO4yrvJjbPS
         tHrSkzPwIcY2dgMNvr+3aW7Q9X4an9pPPt0Qq6iFB0Zme51XfSx+nGk8AXcloal94lJx
         BG2w==
X-Gm-Message-State: AOJu0YxxJDnfMxApskHlOnrGHhOyAL+F9cDXM6tLfj7xmVX7IbZ5RdCB
	Vn6dxFdL9UYYXWQgugzacZGCOU/7QB+4PfscDIOD0eKimPKvz7G7LDG7MkitDeg=
X-Google-Smtp-Source: AGHT+IERAX27XP2hYOIo5PA9NtYVDFHIWHeGq/0wRd7mxl9CbRzt3tH+U+M8P94t4i4lu1SCbK5zOg==
X-Received: by 2002:a05:6830:e87:b0:6dd:e17e:f714 with SMTP id dp7-20020a0568300e8700b006dde17ef714mr71686otb.27.1706142774866;
        Wed, 24 Jan 2024 16:32:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::907b])
        by smtp.gmail.com with ESMTPSA id o14-20020a63e34e000000b005d3bae243bbsm3338016pgj.4.2024.01.24.16.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 16:32:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu: Replace the basename patch with backport
Date: Wed, 24 Jan 2024 16:32:50 -0800
Message-ID: <20240125003252.2272395-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 00:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194301

Backport the patch that got applied to fix this issue upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +-
 ...io-Include-libgen.h-for-basename-API.patch | 57 -------------------
 ...eplace-basename-with-g_path_get_base.patch | 50 ++++++++++++++++
 3 files changed, 51 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-vfio-Include-libgen.h-for-basename-API.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-vfio-container-Replace-basename-with-g_path_get_base.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ccb28804029..f5e25a620c4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -32,7 +32,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
            file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
            file://fixedmeson.patch \
-           file://0001-vfio-Include-libgen.h-for-basename-API.patch \
+           file://0001-vfio-container-Replace-basename-with-g_path_get_base.patch \
            file://no-pip.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
diff --git a/meta/recipes-devtools/qemu/qemu/0001-vfio-Include-libgen.h-for-basename-API.patch b/meta/recipes-devtools/qemu/qemu/0001-vfio-Include-libgen.h-for-basename-API.patch
deleted file mode 100644
index 5b8b638736a..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-vfio-Include-libgen.h-for-basename-API.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From e31c67ef65a4217f35f6cd40926251054094dff9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 11 Dec 2023 16:44:16 -0800
-Subject: [PATCH v2] vfio: Include libgen.h for basename API
-
-Glibc has two implementation one based on POSIX which is used when
-libgen.h is included and second implementation is GNU implementation
-which is used when string.h is included. The functions are no identical
-in behavior. Musl C library does not implement the GNU version, but it
-has provided a declaration in string.h but this has been corrected in
-latest musl [1] which exposes places where it was being used from
-string.h to error out especially when -Wimplicit-function-declaration is
-treated as error.
-
-| ../qemu-8.1.2/hw/vfio/pci.c:3030:18: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-|  3030 |     group_name = basename(group_path);
-
-clang-17 treats this warning as error by default
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/qemu-devel/2023-12/msg01438.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-v2: Add missing link for [1]
-
- hw/vfio/pci.c      | 1 +
- hw/vfio/platform.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
-index c62c02f7b6..f043c93b9e 100644
---- a/hw/vfio/pci.c
-+++ b/hw/vfio/pci.c
-@@ -19,6 +19,7 @@
-  */
- 
- #include "qemu/osdep.h"
-+#include <libgen.h>
- #include <linux/vfio.h>
- #include <sys/ioctl.h>
- 
-diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
-index 8e3d4ac458..a835ab03be 100644
---- a/hw/vfio/platform.c
-+++ b/hw/vfio/platform.c
-@@ -16,6 +16,7 @@
- 
- #include "qemu/osdep.h"
- #include "qapi/error.h"
-+#include <libgen.h>
- #include <sys/ioctl.h>
- #include <linux/vfio.h>
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-vfio-container-Replace-basename-with-g_path_get_base.patch b/meta/recipes-devtools/qemu/qemu/0001-vfio-container-Replace-basename-with-g_path_get_base.patch
new file mode 100644
index 00000000000..ad4f4101788
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-vfio-container-Replace-basename-with-g_path_get_base.patch
@@ -0,0 +1,50 @@
+From 213ae3ffda463c0503e39e0cf827511b5298c314 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
+Date: Wed, 20 Dec 2023 14:53:02 +0100
+Subject: [PATCH] vfio/container: Replace basename with g_path_get_basename
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+g_path_get_basename() is a portable utility function that has the
+advantage of not modifing the string argument. It also fixes a compile
+breakage with the Musl C library reported in [1].
+
+[1] https://lore.kernel.org/all/20231212010228.2701544-1-raj.khem@gmail.com/
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/213ae3ffda463c0503e39e0cf827511b5298c314]
+Reported-by: Khem Raj <raj.khem@gmail.com>
+Reviewed-by: Eric Auger <eric.auger@redhat.com>
+Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
+Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
+Signed-off-by: Cédric Le Goater <clg@redhat.com>
+---
+ hw/vfio/container.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/hw/vfio/container.c b/hw/vfio/container.c
+index 688cf23bab..8d334f52f2 100644
+--- a/hw/vfio/container.c
++++ b/hw/vfio/container.c
+@@ -869,7 +869,8 @@ static void vfio_put_base_device(VFIODevice *vbasedev)
+ 
+ static int vfio_device_groupid(VFIODevice *vbasedev, Error **errp)
+ {
+-    char *tmp, group_path[PATH_MAX], *group_name;
++    char *tmp, group_path[PATH_MAX];
++    g_autofree char *group_name = NULL;
+     int ret, groupid;
+     ssize_t len;
+ 
+@@ -885,7 +886,7 @@ static int vfio_device_groupid(VFIODevice *vbasedev, Error **errp)
+ 
+     group_path[len] = 0;
+ 
+-    group_name = basename(group_path);
++    group_name = g_path_get_basename(group_path);
+     if (sscanf(group_name, "%d", &groupid) != 1) {
+         error_setg_errno(errp, errno, "failed to read %s", group_path);
+         return -errno;
+-- 
+2.43.0
+
-- 
2.43.0


