Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76DEC19F2D
	for <webhook@archiver.kernel.org>; Sat,  6 Aug 2022 16:55:35 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.5237.1659804930121241797
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 09:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZAZz3cdy;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so5547632pjf.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=isAI5PoBus58vRCeuRXy5/0srD5DXtU8FU+yFeuJtaE=;
        b=ZAZz3cdyXZyXrVHqaKV+xHXILVlLrhr9sAAW8SYQuGElNAsgqqWMLCxrqoP/cHEcUl
         AEGyICNojIvx7tBNsW65zGQxkf/DHpBVWDL/6oicRAmsCL9L40btSv2dKPgMpYgRxWXL
         PXsOoxGgQpM33M9nSKqVK4u8Q+hTXWCO5ptMB8fUDrHB+XoEb+IwvCy0rkJh2jCLpvjN
         hu9eTHHh/wHNHBI1gqBtqLhjYuBtYceYGMfF5pvliRynkKrvZFgUGsfqlBvDE9dkm+cx
         iUWJCgAZLV64EioEoW3uoBr9Hyx1v+m/qR+7NlWlHZOlNXAiQMNVJm5ZWwbnyzBOwAGJ
         a52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=isAI5PoBus58vRCeuRXy5/0srD5DXtU8FU+yFeuJtaE=;
        b=HIsoQhaxypgm4FGF9eiGXDK1xd/O+SXUojLozG1PcAE8Zdn4Go4XOq6GmY0pVd2/tb
         uX1dMZEOhgVaBRwooyNCx3rWBO4YvBU7MtfBrJ+q173L/YKVz3oh+tUBDp4nBxjVK2wo
         vddIR5E7k7WNEUMuI4bzeagjn5I+3ij+fIxMldukV0zX2yhY7QJWlOv1hqrBMuZUNon5
         pZv7kvYw3KHA7KvlbaKeJMov1abe9KyFcNCG1IUm+9BhgW4vgXuiqF+QsKeGpKR0PrDb
         B51Ct/OG8ZoG3OdBp+sYPG3k0i2fn/DokOnimX23uLNGMRNTOHMtmZUYhQE+cjOdPjAl
         Ffcg==
X-Gm-Message-State: ACgBeo02oYkTE9P48CuOdh94/ByYSpJpNTm5ZYtiorlYJPtAR4h2mMYR
	yTWHxHOahg4Gtm9K1/WyFwEnw9oZVYk=
X-Google-Smtp-Source: 
 AA6agR5zIggMYyBKE2lPIXAZ9x2Nb/jeimS9x/YY+0wj4WQFcD71VJUXrJ/gbEGCxJ6ZDoIEnPIbZQ==
X-Received: by 2002:a17:902:ea0f:b0:16f:6d84:b6b5 with SMTP id
 s15-20020a170902ea0f00b0016f6d84b6b5mr11351279plg.39.1659804928926;
        Sat, 06 Aug 2022 09:55:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 i13-20020a17090332cd00b0016dd4b1ceb5sm5321252plr.124.2022.08.06.09.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 09:55:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu: Fix build with glibc 2.36
Date: Sat,  6 Aug 2022 09:55:25 -0700
Message-Id: <20220806165525.1285588-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Aug 2022 16:55:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168977

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/qemu-7.0.0-glibc-2.36.patch     | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-7.0.0-glibc-2.36.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0db67017359..bcaa56bbbac 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -27,6 +27,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-tests-meson.build-use-relative-path-to-refer-to-file.patch \
            file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
+           file://qemu-7.0.0-glibc-2.36.patch \
            file://CVE-2022-35414.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/qemu/qemu/qemu-7.0.0-glibc-2.36.patch b/meta/recipes-devtools/qemu/qemu/qemu-7.0.0-glibc-2.36.patch
new file mode 100644
index 00000000000..abad1cfeeb8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/qemu-7.0.0-glibc-2.36.patch
@@ -0,0 +1,46 @@
+Avoid conflicts between sys/mount.h and linux/mount.h that are seen
+with glibc 2.36
+
+Source: https://github.com/archlinux/svntogit-packages/blob/packages/qemu/trunk/qemu-7.0.0-glibc-2.36.patch
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -95,7 +95,25 @@
+ #include <linux/soundcard.h>
+ #include <linux/kd.h>
+ #include <linux/mtio.h>
++
++#ifdef HAVE_SYS_MOUNT_FSCONFIG
++/*
++ * glibc >= 2.36 linux/mount.h conflicts with sys/mount.h,
++ * which in turn prevents use of linux/fs.h. So we have to
++ * define the constants ourselves for now.
++ */
++#define FS_IOC_GETFLAGS                _IOR('f', 1, long)
++#define FS_IOC_SETFLAGS                _IOW('f', 2, long)
++#define FS_IOC_GETVERSION              _IOR('v', 1, long)
++#define FS_IOC_SETVERSION              _IOW('v', 2, long)
++#define FS_IOC_FIEMAP                  _IOWR('f', 11, struct fiemap)
++#define FS_IOC32_GETFLAGS              _IOR('f', 1, int)
++#define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
++#define FS_IOC32_GETVERSION            _IOR('v', 1, int)
++#define FS_IOC32_SETVERSION            _IOW('v', 2, int)
++#else
+ #include <linux/fs.h>
++#endif
+ #include <linux/fd.h>
+ #if defined(CONFIG_FIEMAP)
+ #include <linux/fiemap.h>
+--- a/meson.build
++++ b/meson.build
+@@ -1686,6 +1686,8 @@ config_host_data.set('HAVE_OPTRESET',
+                      cc.has_header_symbol('getopt.h', 'optreset'))
+ config_host_data.set('HAVE_IPPROTO_MPTCP',
+                      cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
++config_host_data.set('HAVE_SYS_MOUNT_FSCONFIG',
++                     cc.has_header_symbol('sys/mount.h', 'FSCONFIG_SET_FLAG'))
+ 
+ # has_member
+ config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
-- 
2.37.1


