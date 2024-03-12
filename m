Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F34C54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 13:53:48 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.10101.1710251626154765720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 06:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eiftfcbB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dd878da011so16822625ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 06:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710251625; x=1710856425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAZKNDvHtKLOSVND8EIGWaRKFv+IHGIAB5EUdgUtnwo=;
        b=eiftfcbBTI5/9zz1GROEQ+kLWfM71xwZjlXQ4UX0BshuMt7n9YKF/NuAhYeKwvvPYQ
         gfDSLXS3tsNtqrQzEwXqL63yhQS6CsSvl6lvfuYsOXttibVuBdCvnRCrkchLWoFgRaSM
         yAqz67cGjnz2KTm+q4lPV6lO9vX0Z/zQv7GnJrpwm9NRfkKyWAu33kpnxtEf14tswTx/
         b3Xi+YaKFB1bEnovdWH58vrG4KV3i5RM21S0wPG237208Axkb3dcVKMpzX/X5eIeYtR5
         y5fr82BFML2nbzYrUJfc42MSqoREmLswGCGQePsabB4kJr8s2Ek2iw9mbG0W/3JvQwvn
         C/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710251625; x=1710856425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAZKNDvHtKLOSVND8EIGWaRKFv+IHGIAB5EUdgUtnwo=;
        b=sHinRFCIusjBeI23mMlUsPFGvnEC9SVmSdBrVyT+2lX8C+Y02iFvwmvmmZxSQ0vw+C
         t+yGk14s5piQEY0fItA6Act2derDFfWEUANhMM0opD4MenQdCF+ZLsLHWAej7wLDwrKn
         tiZO0ifCvjiuqnrM7QKoKF6slYFt7TMWdpeu4aVE5C9YktHhiRJFaVdqlcfKoNoRUXMW
         fW3I/xcktDWquxZ4gU7q/b8WtBQ32NkC98CJ2QJ7PHBgXR104XF+TAzdOiMLvwqNiLx8
         VJ9USRLb9rykVlJBv5JTNL97XAOKKOlf5W4FmaPmuYTWkPqOc13epsmrKKO7VXDKjFre
         4W1A==
X-Gm-Message-State: AOJu0YwqJXHrMUKwf3jsNyhyDiAgARZjeJqNfPh2DVxA5JJsniGDybqW
	6+Yy7ahHFAb67mxxPWJus4coJeM/WAqQ2Ds1XgLC1Z7i1YQ+e91pG7p7t9Xpl+WcK7NMkgz9yMK
	JRSQ=
X-Google-Smtp-Source: AGHT+IGew//hrZWtOU7EaA/dsyI65oCwV9mIj8Fd7l0WhZ/N1DV1WpzPfdlos+fe/qM+Yc9SHNgLXg==
X-Received: by 2002:a17:902:c412:b0:1dd:76f0:4455 with SMTP id k18-20020a170902c41200b001dd76f04455mr1945008plk.49.1710251625353;
        Tue, 12 Mar 2024 06:53:45 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c10c00b001dc3916853csm6734776pli.73.2024.03.12.06.53.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 06:53:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/8] linux-yocto/5.15: fix partion scanning
Date: Tue, 12 Mar 2024 03:53:22 -1000
Message-Id: <768ac24afff43d58c32617025391049d5d0d166b.1710251458.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710251458.git.steve@sakoman.com>
References: <cover.1710251458.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 13:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196989

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

1/1 [
    Author: Christoph Hellwig
    Email: hch@lst.de
    Subject: block, loop: support partitions without scanning
    Date: Fri, 27 May 2022 07:58:06 +0200

    Historically we did distinguish between a flag that surpressed partition
    scanning, and a combinations of the minors variable and another flag if
    any partitions were supported.  This was generally confusing and doesn't
    make much sense, but some corner case uses of the loop driver actually
    do want to support manually added partitions on a device that does not
    actively scan for partitions.  To make things worsee the loop driver
    also wants to dynamically toggle the scanning for partitions on a live
    gendisk, which makes the disk->flags updates non-atomic.

    Introduce a new GD_SUPPRESS_PART_SCAN bit in disk->state that disables
    just scanning for partitions, and toggle that instead of GENHD_FL_NO_PART
    in the loop driver.

    [bva: Notes for this backport:
       - drop return code in disk_scan_partitions for GD_SUPPRESS_PART_SCAN.
         The check doesn't strictly need ot be in this routine in 5.15, but
         this faciliates future changes in this area, since there are
         other checks in the same function.
       - GD_SUPPRESS_PART_SCAN could go to genh.c, but genhd.c includes
         blkdev.h, so we leave the new GD_SUPPRESS_PART_SCAN definition
         in the same places as where it was introduced upstream to keep
         the changes to a minimum
       - upstream commit e16e506ccd673 merges blkdev_reread_part into
         disk_scan_partitions. Backporting that change is more churn
         than we need, so we also add the check for GD_SUPPRESS_PART_SCAN
         into that routine to have the check hit in a 5.15 context.
    ]

    Upstream-Status: Backport [commit b9684a71fca79]

    Fixes: 1ebe2e5f9d68 ("block: remove GENHD_FL_EXT_DEVT")
    Reported-by: Ming Lei <ming.lei@redhat.com>
    Signed-off-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Ming Lei <ming.lei@redhat.com>
    Link: https://lore.kernel.org/r/20220527055806.1972352-1-hch@lst.de
    Signed-off-by: Jens Axboe <axboe@kernel.dk>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 7e80b6a3b2..00c03411b1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e856ac0473964a3f7b3b5544814decb8ae514c9a"
-SRCREV_meta ?= "7057b38eb882224cc002d13b7303e1a1767fa629"
+SRCREV_machine ?= "da32201bc41d994b0300c6b4738505f4875dc190"
+SRCREV_meta ?= "bef59dc5a78b4d101d1be23d4b36a73fd849241a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 7253ab15f3..2051d1c0a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9dc9a9a07dba418b65e884e42e230c6c6e1a7f44"
-SRCREV_meta ?= "7057b38eb882224cc002d13b7303e1a1767fa629"
+SRCREV_machine ?= "540fc92dd7359025bb09962431565b5a9627536b"
+SRCREV_meta ?= "bef59dc5a78b4d101d1be23d4b36a73fd849241a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 065091f25a..101aceb3dc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,17 +14,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f99523c4bf2f8e48e9b2d2cd3cffee6c494b124e"
-SRCREV_machine:qemuarm64 ?= "8ee4ded018a7d795de4df15931c4a0a3a1b1d54d"
-SRCREV_machine:qemumips ?= "b8fbb69a10c4eea7ae580e8249a46056d1db24d1"
-SRCREV_machine:qemuppc ?= "533c5a1f7605c4f94161378a24a5d938b4b8c269"
-SRCREV_machine:qemuriscv64 ?= "68dd3d2718105c6a692c1333ae24c939297f8337"
-SRCREV_machine:qemuriscv32 ?= "68dd3d2718105c6a692c1333ae24c939297f8337"
-SRCREV_machine:qemux86 ?= "68dd3d2718105c6a692c1333ae24c939297f8337"
-SRCREV_machine:qemux86-64 ?= "68dd3d2718105c6a692c1333ae24c939297f8337"
-SRCREV_machine:qemumips64 ?= "a74663ee8ab0d74555ea13a4f7490bde20c4fce2"
-SRCREV_machine ?= "68dd3d2718105c6a692c1333ae24c939297f8337"
-SRCREV_meta ?= "7057b38eb882224cc002d13b7303e1a1767fa629"
+SRCREV_machine:qemuarm ?= "f7ce03f6b5de6a323b165e8adbaa3caae8646c20"
+SRCREV_machine:qemuarm64 ?= "db39986a84e0bcfe5a488ab8dca114ed27e469ce"
+SRCREV_machine:qemumips ?= "695cf3a24eaedc1e40393947afc22f8dc8324b47"
+SRCREV_machine:qemuppc ?= "3dfb435f3fb9ec38c60d1eeeeebf63b6a88308d3"
+SRCREV_machine:qemuriscv64 ?= "7c82dac028864e8a608e70d3ac2dbc05b3cd1e14"
+SRCREV_machine:qemuriscv32 ?= "7c82dac028864e8a608e70d3ac2dbc05b3cd1e14"
+SRCREV_machine:qemux86 ?= "7c82dac028864e8a608e70d3ac2dbc05b3cd1e14"
+SRCREV_machine:qemux86-64 ?= "7c82dac028864e8a608e70d3ac2dbc05b3cd1e14"
+SRCREV_machine:qemumips64 ?= "2f830b0a13ad4dbe738960d9e7d255ac411064b4"
+SRCREV_machine ?= "7c82dac028864e8a608e70d3ac2dbc05b3cd1e14"
+SRCREV_meta ?= "bef59dc5a78b4d101d1be23d4b36a73fd849241a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


