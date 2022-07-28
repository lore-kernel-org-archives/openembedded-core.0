Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D294C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 14:30:58 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.33206.1659018648986494867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 07:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aDCYs/KY;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id o12so2084679pfp.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 07:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yAKhXqoQKVATRqAeqwWuSoRtRG88nBfwdSfagFJgVlk=;
        b=aDCYs/KYdbkCM/bHMaVcJsqR2RS98p3i5VAkb4bmcNHUVaQaLJq4092IG2i4Y3GpSo
         Bj9IUuqCKF1i6lLaNX5QDhXimzJKKdrQ+oj8V1RLJwexsZ35HRmuuSoTOKHpaxoqASr5
         n6oL9loCRgTmsxBEuM88kRfq86ikmrkgWEqpS/DFakQBKuVkYASp9lI3ICqHQLAgKCfd
         RbA6b4wpfEtz/bSGt8gUCWEIgNLfn87tbmWXzumvbmHoAJSIU0zzZjyoXJkQDnMvAhYj
         vbjdZeBo0yCDiwL+M/9oVJ533r5a33La20C1C4O2uCwaswyxmio+xXxBETymCsa3+nf5
         GMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yAKhXqoQKVATRqAeqwWuSoRtRG88nBfwdSfagFJgVlk=;
        b=1braeOziClslpwCKtrnk647r8KfkLUWu0bRc7l25S3d8j5UO5EmXUDHP6bzly4whAJ
         NkuKQ/08EKkDZFs36efosrqbWSMJGaOL0Fch/sE41ZEjbOhgkD3n51dRhxdNVL7RwrCX
         CAb6TbPo2ZkAnsJ/i9xOePvrAIPQAZ0LSnBWxKKhpYuL/x4zHshXm6QxL3Pc3REdLX0U
         zl68v4RTfXtQ2KMzLHlfkisi92mC3grkHe3+I09YtD/k8k+1PQXaoH2xIxkp48EkDmDx
         PiirIIgmATlgydmCv2LCUzwbhYgzJqyCbaI3PJXDLzVzC8HwLWDVfYUF/rQ25HHp+62T
         jfCw==
X-Gm-Message-State: AJIora8WqfyBJCF6IVAcnzOXKHzC8fUX8NjHLzEHt+0+RsxSQSp9LC0d
	L28D0OO+AqCTH9gEAEMKKGP2Ho5+eV48QA==
X-Google-Smtp-Source: 
 AGRyM1ttlg55M6Y2Bw78YJOkEW4d/W4mAuIUayox9C4mmlyUmTkCXQc96u+7/f6Jz7RUlvAPj6b/nA==
X-Received: by 2002:a05:6a00:22cc:b0:52b:1840:ad8b with SMTP id
 f12-20020a056a0022cc00b0052b1840ad8bmr27588299pfj.58.1659018648016;
        Thu, 28 Jul 2022 07:30:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8ca5])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a170902da8100b0016c4cbefea3sm1331481plx.218.2022.07.28.07.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 07:30:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] libarchive: Avoid mount.h conflict between kernel and
 glibc
Date: Thu, 28 Jul 2022 07:30:43 -0700
Message-Id: <20220728143044.1696098-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 14:30:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168607

glibc 2.36 implements fsconfig_command but it now conflicts with kernel
mount.h and there is no workaround, code in apps have to be adjusted to
use correct API see [1]

[1] https://sourceware.org/glibc/wiki/Release/2.36

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-include-sys-mount.h-when-linux-fs..patch | 47 +++++++++++++++++++
 .../libarchive/libarchive_3.6.1.bb            |  4 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-libarchive-Do-not-include-sys-mount.h-when-linux-fs..patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-libarchive-Do-not-include-sys-mount.h-when-linux-fs..patch b/meta/recipes-extended/libarchive/libarchive/0001-libarchive-Do-not-include-sys-mount.h-when-linux-fs..patch
new file mode 100644
index 00000000000..0d217996826
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-libarchive-Do-not-include-sys-mount.h-when-linux-fs..patch
@@ -0,0 +1,47 @@
+From a2f68263a1da5ad227bcb9cd8fa91b93c8b6c99f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Jul 2022 10:56:53 -0700
+Subject: [PATCH] libarchive: Do not include sys/mount.h when linux/fs.h is
+ present
+
+These headers are in conflict and only one is needed by
+archive_read_disk_posix.c therefore include linux/fs.h if it exists
+otherwise include sys/mount.h
+
+It also helps compiling with glibc 2.36
+where sys/mount.h conflicts with linux/mount.h see [1]
+
+[1] https://sourceware.org/glibc/wiki/Release/2.36
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/1761]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libarchive/archive_read_disk_posix.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/libarchive/archive_read_disk_posix.c b/libarchive/archive_read_disk_posix.c
+index 2b39e672..a96008db 100644
+--- a/libarchive/archive_read_disk_posix.c
++++ b/libarchive/archive_read_disk_posix.c
+@@ -34,9 +34,6 @@ __FBSDID("$FreeBSD$");
+ #ifdef HAVE_SYS_PARAM_H
+ #include <sys/param.h>
+ #endif
+-#ifdef HAVE_SYS_MOUNT_H
+-#include <sys/mount.h>
+-#endif
+ #ifdef HAVE_SYS_STAT_H
+ #include <sys/stat.h>
+ #endif
+@@ -54,6 +51,8 @@ __FBSDID("$FreeBSD$");
+ #endif
+ #ifdef HAVE_LINUX_FS_H
+ #include <linux/fs.h>
++#elif HAVE_SYS_MOUNT_H
++#include <sys/mount.h>
+ #endif
+ /*
+  * Some Linux distributions have both linux/ext2_fs.h and ext2fs/ext2_fs.h.
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
index 761cfca6473..24d7918bf9d 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
@@ -32,7 +32,9 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 
 EXTRA_OECONF += "--enable-largefile"
 
-SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+           file://0001-libarchive-Do-not-include-sys-mount.h-when-linux-fs..patch \
+           "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "c676146577d989189940f1959d9e3980d28513d74eedfbc6b7f15ea45fe54ee2"
-- 
2.37.1


