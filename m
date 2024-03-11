Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D992C54E60
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 16:41:13 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.67784.1710175270595603296
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 09:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d+BPwhP1;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7887649cc6cso31934885a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 09:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710175269; x=1710780069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sb3dqkcggwV5rPDpBgMhAInJtDsK59O1yEpFSfoWxXs=;
        b=d+BPwhP1tbT0zATePjscTaSlR0G2T8ZA/j8DDJoSn+HK7UCs0H5E7dga90QkFalhlF
         k6jWlYE8W5VNnraFz8lnHCu3Y0DcV56PcF53lwKXC8AqdroVXKjovcLRwHIbuw4p3yxg
         b3El95a63T2MTl2hqhXQHZYkxUnJTiJReie6z4CS4j/MMQC6vxWi6M5UAbasJEHnykam
         rDj+yGSE8/RZiMm00EWmlaQzcl6j4dKKVDSq2Q4BNUhW8J9aE/xkY8NCp7u7+edlVOVo
         0f6XCAda6Cd4obdyMkzc2AK+7yIfFpeb2EM8kVJPUmnE+SyKap7BXeIyRZaLbf+Glu3p
         FyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710175269; x=1710780069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sb3dqkcggwV5rPDpBgMhAInJtDsK59O1yEpFSfoWxXs=;
        b=T+SYxSQQUHXxknhfQn1SnI5+cuwO48G9J5srvK7JCkJIx8bUN10iERC+EN5C/eqHiT
         hr3M39yXOJSjKrOoE3shAKqA9xKNELcpw9+UXlhzWQJmgYxxgR4uJlFT8xLc92nQ6bn3
         FkJpzGnWqzrg63xUA57In0hYSqIMisyOlSRqKZbkp2V9Dqb1p7OjPvaW5kW7iQtqDKVa
         AUdjUDFGmyU5UK4mzQHjL6HIh+HBt5jEeuPOYqzLeTjJI3xhICACKjuxppMMkElgvHFa
         Dl10+od+sPQGVfQs41Oi2OkY6ES4obKmFOZcrqU4ZFnKu9Mrchoyx1X9AALQPjqyQzSt
         exGA==
X-Gm-Message-State: AOJu0YyazlyyB3igM/tdmVLkc7XG8rVtVYFnsXXmuJLkXqgfONDQ4rA9
	2xstFI86GnOS/0kHnNkA8hiQasNw+gxhzHm+I8bsKX2jZt07GUbda+yQFhb4NPE=
X-Google-Smtp-Source: AGHT+IEp17rCGasPo5CLWWCaqnBSE/adbo4Nnszvtc+tf8m9Clj2+onGqqUmhjXk7DPVY12Krkb7qQ==
X-Received: by 2002:a05:6214:5909:b0:690:e164:31e0 with SMTP id qo9-20020a056214590900b00690e16431e0mr314462qvb.25.1710175269293;
        Mon, 11 Mar 2024 09:41:09 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id y2-20020ad45302000000b00690c99e7ad5sm1793928qvr.110.2024.03.11.09.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:41:07 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7][kirkstone] linux-yocto/5.15: fix partion scanning
Date: Mon, 11 Mar 2024 12:40:57 -0400
Message-Id: <93b0f123acbc49432e997556e955b326c4c05bd2.1710175022.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710175022.git.bruce.ashfield@gmail.com>
References: <cover.1710175022.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 16:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196951

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
2.39.2


