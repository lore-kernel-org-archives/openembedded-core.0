Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C0AC19F2D
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 03:36:05 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.11754.1660620961376759997
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m56J1YPq;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 c19-20020a17090ae11300b001f2f94ed5c6so420242pjz.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=pk7KOq6HLl7etsqQY35UC+Jov+e7shwSkO4G6rRqAi4=;
        b=m56J1YPqFa3ZIsNU7+yA5d47RhC12s9BGIEYwkAJ/XOmRS9QvSJJL/8NPDHJhpASpi
         zl3pgqYALmOsJENgMRqbtPVXtHNN9rMXNwxGfF54Fjd4EuiuP7XArwPSkLWDVMJycIXn
         uJxWvXN5DZx2MBDipMjmArDA3sHyzNRT0olVn5fP2sw3U1eerr+17OfbaD7N+azZngG0
         lT/GndxonhfAir8TlRqKgOiRGxE2WEajdTICT7PU7secuHNacDA9I/O7rtdjRaEIogfq
         GKIBqgkr/IkjX7Pg83pw4FhvGoaBz4HuZYIfiMec8J+M2I1s/g1+MUOmPvNBUZG9BfcA
         RfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=pk7KOq6HLl7etsqQY35UC+Jov+e7shwSkO4G6rRqAi4=;
        b=EFK4mMDpMDBxBrSR7ZWx+lWGsz3VSU93oPldHQL7ItTPnUDlQ2LyLzqbABJDOsXR20
         js3tEYLTQXx4sh5RY1n+rBQOVhmGRy+mqblWW+FAFGRvYy2JQ82kGmQm97Rckpit2lKg
         wrWWPcxK4Quevig9GL3/Jl9G+HGiZ4yYE2NLQWGkFQ3ZpWSYQ9jnent030NGvZF89Ba6
         iV5l1cbdXj4XLWjcZakUbya70agQvz9xR1NR96oyzWNqjeaKHczsMMrVZmWpEn9nRIGD
         t+oPf5SVCl4Ea8Q8xPgP0yiS8ZSDgqTQWy/0WfVGHYIaG06p8TM3r6mo+mgFsqfKmvn+
         jVuw==
X-Gm-Message-State: ACgBeo2Llg0lX2DAMyMN+Fub8FDRzlRHHy2gTCeF+pm16LbOu8I0axhm
	LVsPuu1sHlUh8FR5eZhPck9fXh93No5gVw==
X-Google-Smtp-Source: 
 AA6agR7s6fiK2N7zBqHTfzNAInUFTUOgHB1tUDOT+AmGB9UijAC9gErlRhZYhwNz1+CUhFGcBhx6mA==
X-Received: by 2002:a17:902:ea07:b0:16e:daf6:6087 with SMTP id
 s7-20020a170902ea0700b0016edaf66087mr19914075plg.68.1660620960357;
        Mon, 15 Aug 2022 20:36:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 f8-20020a170902ce8800b001714853e503sm7821428plg.36.2022.08.15.20.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 20:35:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 5/5] systemd: Upgrade to 251.4 and fix build with binutils
 2.39
Date: Mon, 15 Aug 2022 20:35:51 -0700
Message-Id: <20220816033551.2701240-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816033551.2701240-1-raj.khem@gmail.com>
References: <20220816033551.2701240-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 03:36:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169425

The mount.h conflict patch is now upstream so drop it.
Additionally this version fixes build with binutils-2.39 [1]

[1] https://github.com/systemd/systemd-stable/commit/8a6f966be404897b5333c218701965ac3b5a0806

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...md-boot_251.3.bb => systemd-boot_251.4.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...lude-linux-fs.h-to-resolve-fsconfig_.patch | 97 -------------------
 .../{systemd_251.3.bb => systemd_251.4.bb}    |  1 -
 4 files changed, 1 insertion(+), 99 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_251.3.bb => systemd-boot_251.4.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch
 rename meta/recipes-core/systemd/{systemd_251.3.bb => systemd_251.4.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_251.3.bb b/meta/recipes-core/systemd/systemd-boot_251.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_251.3.bb
rename to meta/recipes-core/systemd/systemd-boot_251.4.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 03f1559f026..71eb93f23a2 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "516108f273888df3dcfa4f42b140252a285a2288"
+SRCREV = "2a674b4b66af1a050a0362b646d2fca90c90112e"
 SRCBRANCH = "v251-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
 "
diff --git a/meta/recipes-core/systemd/systemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch b/meta/recipes-core/systemd/systemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch
deleted file mode 100644
index 6222dfe60dd..00000000000
--- a/meta/recipes-core/systemd/systemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From b0933e76c6f0594c10cf8a9a70b34e15b68066d1 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Sat, 23 Jul 2022 10:38:49 +0000
-Subject: [PATCH] glibc: Remove #include <linux/fs.h> to resolve fsconfig_command/mount_attr conflict with glibc 2.36
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/pull/23992/commits/21c03ad5e9d8d0350e30dae92a5e15da318a1539]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build             | 13 ++++++++++++-
- src/basic/fd-util.c     |  2 ++
- src/core/namespace.c    |  2 ++
- src/shared/mount-util.c |  2 ++
- 4 files changed, 18 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 9c170acc0a..a2e4d5054e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -481,7 +481,6 @@ decl_headers = '''
- #include <uchar.h>
- #include <sys/mount.h>
- #include <sys/stat.h>
--#include <linux/fs.h>
- '''
- 
- foreach decl : ['char16_t',
-@@ -493,6 +492,17 @@ foreach decl : ['char16_t',
-         # We get -1 if the size cannot be determined
-         have = cc.sizeof(decl, prefix : decl_headers, args : '-D_GNU_SOURCE') > 0
- 
-+        if decl == 'struct mount_attr'
-+                if have
-+                        want_linux_fs_h = false
-+                else
-+                        have = cc.sizeof(decl,
-+                                         prefix : decl_headers + '#include <linux/fs.h>',
-+                                         args : '-D_GNU_SOURCE') > 0
-+                        want_linux_fs_h = have
-+                endif
-+        endif
-+
-         if decl == 'struct statx'
-                 if have
-                         want_linux_stat_h = false
-@@ -508,6 +518,7 @@ foreach decl : ['char16_t',
- endforeach
- 
- conf.set10('WANT_LINUX_STAT_H', want_linux_stat_h)
-+conf.set10('WANT_LINUX_FS_H', want_linux_fs_h)
- 
- foreach ident : ['secure_getenv', '__secure_getenv']
-         conf.set10('HAVE_' + ident.to_upper(), cc.has_function(ident))
-diff --git a/src/basic/fd-util.c b/src/basic/fd-util.c
-index 6c1de92a26..00591d6c2d 100644
---- a/src/basic/fd-util.c
-+++ b/src/basic/fd-util.c
-@@ -3,7 +3,9 @@
- #include <errno.h>
- #include <fcntl.h>
- #include <linux/btrfs.h>
-+#if WANT_LINUX_FS_H
- #include <linux/fs.h>
-+#endif
- #include <linux/magic.h>
- #include <sys/ioctl.h>
- #include <sys/resource.h>
-diff --git a/src/core/namespace.c b/src/core/namespace.c
-index 3256871803..2eafe43290 100644
---- a/src/core/namespace.c
-+++ b/src/core/namespace.c
-@@ -7,7 +7,9 @@
- #include <sys/file.h>
- #include <sys/mount.h>
- #include <unistd.h>
-+#if WANT_LINUX_FS_H
- #include <linux/fs.h>
-+#endif
- 
- #include "alloc-util.h"
- #include "base-filesystem.h"
-diff --git a/src/shared/mount-util.c b/src/shared/mount-util.c
-index e76e4a0b38..0c8dec7688 100644
---- a/src/shared/mount-util.c
-+++ b/src/shared/mount-util.c
-@@ -7,7 +7,9 @@
- #include <sys/statvfs.h>
- #include <unistd.h>
- #include <linux/loop.h>
-+#if WANT_LINUX_FS_H
- #include <linux/fs.h>
-+#endif
- 
- #include "alloc-util.h"
- #include "chase-symlinks.h"
--- 
-2.25.1
-
diff --git a/meta/recipes-core/systemd/systemd_251.3.bb b/meta/recipes-core/systemd/systemd_251.4.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_251.3.bb
rename to meta/recipes-core/systemd/systemd_251.4.bb
index 72b9155f2e1..8497e24af97 100644
--- a/meta/recipes-core/systemd/systemd_251.3.bb
+++ b/meta/recipes-core/systemd/systemd_251.4.bb
@@ -25,7 +25,6 @@ SRC_URI += " \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
-           file://0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch \
            "
 
 # patches needed by musl
-- 
2.37.2


