Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BEBC7EE31
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 06:40:13 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.2917.1684910406060144002
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 23:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kahy/8Ia;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ae74ab3089so4554775ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 23:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684910405; x=1687502405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4qiYXZt7lsrSg1tG1mN5mRDR6gQbmXsE1iEGpZ0QCdM=;
        b=kahy/8IaCghej/3BvtT5WO1hqb1hNzxwcass66Jj2wZevgCJkje2JMLPWnx0wwCiie
         OHOXnqKl3TRAHxskNJwb2ldAV36j6GMeepV+96xkMoJBuTgH5uQZLGWcxvNu5HxV8gQd
         WRuPRnconqly6zMzkoFdtrdXX5raOgL4gUDNlGb1yNutJzVvpzW6NgesckRs+4vAILqU
         RJtAfNlCBLmiQVPRniNmzCo87oClzzx273mfHTzS0JgSnLsQF4dpGAYeDyjp2uhofv/i
         +YR7i9Lp4QiqKIVSISv96nqICX0Zhs/nr0gYau1SpDKmLd3VyIlwNh3oNozKNXVZ3+ho
         ak5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684910405; x=1687502405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qiYXZt7lsrSg1tG1mN5mRDR6gQbmXsE1iEGpZ0QCdM=;
        b=PwaMOkz4FCI27qkVq8oBT7Z+oTonBg9AGFwj4PkLYbIPty8h++hfo1kmC44HQutES2
         9sVggDg1C4n0A0u3bGlT093IUgUzM21PWSKWNeyqwsPB7hqDcaK0QpyI7jKZULzjWdSI
         t//WVvs90SQra/ZwI4XFh1EPKO4tK94E7YtFCRxu3AcXlNvkVVXhsGRgIeld9lvlt2R/
         dELw2LsLr8hNMtNBy7XlE2cIt/4KhTswLoN0Fleg7UIy/zYhAe02hdw16vspLkxjmKB0
         yKoJSk8npl5wHXGaDVvVu9unfETFkdnYFhsdUHnA/gzRSslobZWBZj39teYJ5FYWcAr3
         SAdQ==
X-Gm-Message-State: AC+VfDxX2P8YwK98IToR0NMUpyQVdWF1bE8WAzsZ+AjBeZrhm4Im/NDI
	H6fMsQQoiBWAvJPO5V/lP17vdMgtUMc=
X-Google-Smtp-Source: ACHHUZ49XehtqZnE1Fl1KiYPn8Bkpdl15rhuf6/MG0wIOlaOhqD/0ckmHQfIUM6hM15PxD8Vqm0/tA==
X-Received: by 2002:a17:902:d4c2:b0:1ac:946e:4690 with SMTP id o2-20020a170902d4c200b001ac946e4690mr17508607plg.49.1684910405086;
        Tue, 23 May 2023 23:40:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id n13-20020a170902d2cd00b00186a2274382sm7845039plc.76.2023.05.23.23.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 23:40:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Drop a backport
Date: Tue, 23 May 2023 23:40:02 -0700
Message-Id: <20230524064002.3443934-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 06:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181659

This patch should have been dropped when upgrading to 253
since its already available upstream since then

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0007-Add-sys-stat.h-for-S_IFDIR.patch     | 29 -------------------
 meta/recipes-core/systemd/systemd_253.3.bb    |  1 -
 2 files changed, 30 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0007-Add-sys-stat.h-for-S_IFDIR.patch

diff --git a/meta/recipes-core/systemd/systemd/0007-Add-sys-stat.h-for-S_IFDIR.patch b/meta/recipes-core/systemd/systemd/0007-Add-sys-stat.h-for-S_IFDIR.patch
deleted file mode 100644
index 479b9a1ca1e..00000000000
--- a/meta/recipes-core/systemd/systemd/0007-Add-sys-stat.h-for-S_IFDIR.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1480ef4ea9f71befbc22272c219b62ee5cd71d43 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 21 Jan 2022 15:17:37 -0800
-Subject: [PATCH] Add sys/stat.h for S_IFDIR
-
-../git/src/shared/mkdir-label.c:13:61: error: use of undeclared identifier 'S_IFDIR'
-        r = mac_selinux_create_file_prepare_at(dirfd, path, S_IFDIR);
-
-Upstream-Status: Backport [29b7114c5d9624002aa7c17748d960cd1e45362d]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/shared/mkdir-label.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/shared/mkdir-label.c b/src/shared/mkdir-label.c
-index e3afc2b666..f1df778966 100644
---- a/src/shared/mkdir-label.c
-+++ b/src/shared/mkdir-label.c
-@@ -7,6 +7,7 @@
- #include "selinux-util.h"
- #include "smack-util.h"
- #include "user-util.h"
-+#include <sys/stat.h>
- 
- int mkdirat_label(int dirfd, const char *path, mode_t mode) {
-         int r;
--- 
-2.39.2
-
diff --git a/meta/recipes-core/systemd/systemd_253.3.bb b/meta/recipes-core/systemd/systemd_253.3.bb
index 09432f91926..93d313f2e30 100644
--- a/meta/recipes-core/systemd/systemd_253.3.bb
+++ b/meta/recipes-core/systemd/systemd_253.3.bb
@@ -49,7 +49,6 @@ SRC_URI_MUSL = "\
                file://0023-Handle-missing-gshadow.patch \
                file://0024-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch \
                file://0005-pass-correct-parameters-to-getdents64.patch \
-               file://0007-Add-sys-stat.h-for-S_IFDIR.patch \
                file://0001-Adjust-for-musl-headers.patch \
                file://0006-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch \
                file://0003-errno-util-Make-STRERROR-portable-for-musl.patch \
-- 
2.40.1


