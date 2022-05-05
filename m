Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA21C433FE
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:23 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.7302.1651727174681042343
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NzS0AJqm;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id a1so3909790edt.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mdZXp85sUzU6qht5v/Ler8ZDhs3uGZJXqbWPpUXMxjI=;
        b=NzS0AJqm+qB3dQ3DzcvvXwHyMiYVZiPunhXob3mP2fBpeOTCao4rCCcr81P2gAdq7r
         71gLmJxY0ekBKKs1krQMRCCabeLWrFv0d4c+/QO7yCpFumiSpVMdFU1StX3/Mj560CIg
         Kb97p8oTz1MZ2EvKmxo/cXUl3FHReD0gljmU+3hsbJftUj4bWFN7JWStcbUSBRQAKLdl
         76oFBoqmx3C4psO5XJTzzCyDdREIoQctV2ahEzwmBzPYpB/qKQs4cszkYlSOyqib645C
         7+NEivNUeYmWNl0xYISebhUQB8jV95R9i+rnxHfo9h6sn8nLOZ9cc6h0jLSA71e3fvKN
         istw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mdZXp85sUzU6qht5v/Ler8ZDhs3uGZJXqbWPpUXMxjI=;
        b=Bz+FYM7CF+h+K9VzwExMGdLbSdekGqkDl/9hApMfW8VNoHH0rcguaglMr5EvZA+67i
         3BMMobw4pOkU8oQBiBtIJf/vo9dVKpB1gkZObJM0zDpQOIW02gYtQpsVcObVLr0SbSB9
         mMriBY+zNcVnKWtzdV4pjxhqqYNfl8V/Vuz1F2Rs7sDHTUcUQTzlNrvU36/LFYb/IbA1
         InUu2jp3Dlsthc6oQAgAqCoR2fu2lzgfiivXqITeRLHMDEIbqubJpXjKe6LbpARTGXW2
         Sz3u5Z0Bxz82WdXzMffsTTolJy57xoGEtR0uii4kBYVmVxNxjA/UFYqFCXAUObg0zgyb
         jtfg==
X-Gm-Message-State: AOAM533h87mpXA1uL6pqLxJiCDaH+1M+ilRIRVO0h08jr+kKH1MsVbd/
	ZCwTSEhYFf1sNVHMTEQH5asslTvqpfw=
X-Google-Smtp-Source: 
 ABdhPJwXUhAnFSN8GCDMsbMyMDpdkjYbHLxPiDbCnsPR1nPNEl6/SUu4OGRl/P9msh+1pPbMUAIJ+w==
X-Received: by 2002:a05:6402:440d:b0:412:9e8a:5e51 with SMTP id
 y13-20020a056402440d00b004129e8a5e51mr27637737eda.362.1651727173255;
        Wed, 04 May 2022 22:06:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 33/61] parted: upgrade 3.4 -> 3.5
Date: Thu,  5 May 2022 07:05:16 +0200
Message-Id: <20220505050544.651895-33-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165263

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../parted/files/check-vfat.patch             | 51 -------------------
 .../parted/{parted_3.4.bb => parted_3.5.bb}   |  4 +-
 2 files changed, 1 insertion(+), 54 deletions(-)
 delete mode 100644 meta/recipes-extended/parted/files/check-vfat.patch
 rename meta/recipes-extended/parted/{parted_3.4.bb => parted_3.5.bb} (92%)

diff --git a/meta/recipes-extended/parted/files/check-vfat.patch b/meta/recipes-extended/parted/files/check-vfat.patch
deleted file mode 100644
index fad50292d9..0000000000
--- a/meta/recipes-extended/parted/files/check-vfat.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Add checks for both mkfs.vfat and the vfat file system in the kernel before
-running tests.
-
-Upstream-Status: Submitted [https://alioth-lists.debian.net/pipermail/parted-devel/2021-August/005653.html]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/tests/t-lib-helpers.sh b/tests/t-lib-helpers.sh
-index 4c6c75f..2cc7577 100644
---- a/tests/t-lib-helpers.sh
-+++ b/tests/t-lib-helpers.sh
-@@ -418,3 +418,13 @@ require_64bit_()
-           ;;
-   esac
- }
-+
-+# Check if the specified filesystem is either built into the kernel, or can be loaded
-+# as a module
-+# Usage: has_filesystem vfat
-+# Ruturns 0 if the filesystem is available, otherwise skips the test
-+require_filesystem_()
-+{
-+  grep -q $1 /proc/filesystems && return 0
-+  modprobe --quiet --dry-run $1 || skip_ "this test requires kernel support for $1"
-+}
-diff --git a/tests/t1100-busy-label.sh b/tests/t1100-busy-label.sh
-index f1a13df..0f47b08 100755
---- a/tests/t1100-busy-label.sh
-+++ b/tests/t1100-busy-label.sh
-@@ -19,6 +19,9 @@
- . "${srcdir=.}/init.sh"; path_prepend_ ../parted
- require_root_
- require_scsi_debug_module_
-+require_fat_
-+require_filesystem_ vfat
-+
- ss=$sector_size_
- 
- scsi_debug_setup_ sector_size=$ss dev_size_mb=90 > dev-name ||
-diff --git a/tests/t1101-busy-partition.sh b/tests/t1101-busy-partition.sh
-index e35e6f0..c813848 100755
---- a/tests/t1101-busy-partition.sh
-+++ b/tests/t1101-busy-partition.sh
-@@ -22,6 +22,8 @@ test "$VERBOSE" = yes && parted --version
- 
- require_root_
- require_scsi_debug_module_
-+require_fat_
-+require_filesystem_ vfat
- 
- # create memory-backed device
- scsi_debug_setup_ dev_size_mb=80 > dev-name ||
diff --git a/meta/recipes-extended/parted/parted_3.4.bb b/meta/recipes-extended/parted/parted_3.5.bb
similarity index 92%
rename from meta/recipes-extended/parted/parted_3.4.bb
rename to meta/recipes-extended/parted/parted_3.5.bb
index d83b002f82..ea2b68bbd8 100644
--- a/meta/recipes-extended/parted/parted_3.4.bb
+++ b/meta/recipes-extended/parted/parted_3.5.bb
@@ -9,11 +9,9 @@ DEPENDS = "ncurses util-linux virtual/libiconv"
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-doc-mandir.patch \
            file://run-ptest \
-           file://check-vfat.patch \
            "
 
-SRC_URI[md5sum] = "357d19387c6e7bc4a8a90fe2d015fe80"
-SRC_URI[sha256sum] = "e1298022472da5589b7f2be1d5ee3c1b66ec3d96dfbad03dc642afd009da5342"
+SRC_URI[sha256sum] = "4938dd5c1c125f6c78b1f4b3e297526f18ee74aa43d45c248578b1d2470c05a2"
 
 inherit autotools pkgconfig gettext texinfo ptest
 
-- 
2.30.2


