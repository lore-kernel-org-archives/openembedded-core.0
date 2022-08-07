Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2286C19F2A
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 04:15:48 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.10839.1659845746782525315
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 21:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G4VCXltj;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 13so5896997pgc.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 21:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=isAI5PoBus58vRCeuRXy5/0srD5DXtU8FU+yFeuJtaE=;
        b=G4VCXltjBYGW7FhD/xIbhlHiG/hHoM7tBQtN6Q+2+osxkfnm8qwPZxPT4LdRXUknie
         m1G2bb3xBsFfB+RBpuxado9BJvkvPCuP1vPF1sgUKlFTbW6Fm7fzoMKwsauyMt22zyQF
         th2hTWduelS1ysaoDypmQ90u1K8UEPg419vbh2R+Cp5Zm3iYvfnKw34sfYnYsZmYLD45
         2p/LjUkg/BW8bKVjclhb6/sUlLqGEzyjZ+y+gWmtgsfe/BkGn0V+NYnCLtcwoaRqaNti
         Ut0c3a20SP9EYQo12NE2hE6Db3v2VwcZdN5zoBHslZ4kxe54elO2znrGUf0WAnoR+Jlr
         phMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=isAI5PoBus58vRCeuRXy5/0srD5DXtU8FU+yFeuJtaE=;
        b=Us2eVBn6U0zySpKLCs2xGD/oIbawixOQSmfC0mINsJHT7jFZKnY75v3s70F2UVAGK0
         QBlMQrwJcfrWljh1CYY59azjWm7Wct9D71x1g9HpsFYxNtCqVNXyax5YneJ5t8YhIVYW
         4zXfKqVmZGSFvdMTBu1VfY294G10yL2W5vDvY5Wn+cRrmbWAdyYB/Jt+MZrnYACFRQo1
         mIy9RiWPxbMnDunduwpxGV6QU+oCmN9GX1sUMw61+e9HbMDCYBcZ9BVmFCBotvQYJSO0
         yFI5twGKWHp87W1zR6NpGL/zwBkaBS0nAKJdPLLhPdD8FYVKYk/AwQ7TLjcmGa6T4CAQ
         9hMA==
X-Gm-Message-State: ACgBeo2jeXLzjjI9lmilQHNG4LqQuGt0D5STTHGwGsIwNQ330tNgjFOt
	A7xseVlNM+ZK8QKBmnpoVIbefoKbFmo=
X-Google-Smtp-Source: 
 AA6agR6uuBRXaq393jn5fSVGoX3tv6kwn8RRwOL1qxNr9nzqnW9VkDGYZFe07MHftnQ0g16X+su8bA==
X-Received: by 2002:a05:6a00:cc7:b0:52f:2ada:11c5 with SMTP id
 b7-20020a056a000cc700b0052f2ada11c5mr1420063pfv.19.1659845745756;
        Sat, 06 Aug 2022 21:15:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 z67-20020a626546000000b0052e8bf1c27fsm5654146pfb.31.2022.08.06.21.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 21:15:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/7] qemu: Fix build with glibc 2.36
Date: Sat,  6 Aug 2022 21:15:36 -0700
Message-Id: <20220807041541.2665647-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220807041541.2665647-1-raj.khem@gmail.com>
References: <20220807041541.2665647-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 04:15:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168982

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


