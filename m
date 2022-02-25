Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B687C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:46 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.6940.1645799266133441620
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YK7SVqXl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id e13so4962549plh.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fGnPFmoilQaM2FP9RwblpfFoJaSJBxXu/BvgTrXqG1M=;
        b=YK7SVqXlLasMVxSekbaNejIE+aYbsjAceZ9LgsSstitzUZn2koy169aObr9aMzIb41
         LpuJ3kwRl4/R1b2tHQzbRyzrQce5jddajJxrA5L4M0j+YWMa6VcR0nzqEs0PRXu2POoE
         gG3xb9c0/dIz5JmhWI3jRdi3kIRZiUlDdm6i84W0nXYB5zeE4bmCE+2fnYw3gGJEdpCD
         1hoYnDDyhkcObyGCEa2aZtTmVIuiXmrhSeKU4BS+WuxzXZHWH5eLZgqzCmorcwh2GnV5
         zyCxMQS0hZcChEgAtEP6DZzhkt56b/JvLUR8m2jj1z0p486mzjbFAceIvfKyBXj3uUDw
         TmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fGnPFmoilQaM2FP9RwblpfFoJaSJBxXu/BvgTrXqG1M=;
        b=dqH7wEKLGDWJuq5NSiweB5Ph7cajZbJoNHfg8xN3ywd70sMIHx2MyyPTNPfdMnulJr
         9dzMMPJsbZy3D2XUM6DZXL60Fq5HmFq+ZwTEdKGGGqowVgNIsAv9Kl63Bj7rD3yWliOz
         FXwnNQraeZvz4vwcz/5n/w/qgQ8Sj78BpXFsBaXKUMnnT0gPKlDK4PSVVT0CIZbtcMeJ
         +kIjoAPmPxgY1dgj2KXcvQrFqDI46pSqI232gosRZmuBFPmnwkOS7g9ke6RK4LTiCnDv
         h/JzpHQcyxO3Qwd3PZ3zXsnVE9pEiOFXo10iN4rQ3F+/gt/KNxi3+uzBoBCfPTWp/oAn
         KvaQ==
X-Gm-Message-State: AOAM532rZ0SBV4Y8fUAxyO2IyPYusgDnxsCt9yro2zWuZF0UrT9tZJrg
	Tcjn8w1f53HJiUceru29hJw8qOY2T4x+QaB7
X-Google-Smtp-Source: 
 ABdhPJw948huytVkaEhIIbNTMSsvDUImd3THd/0JYBic7UjjdUyoWcTtKss9p9aRLqrRBW0FKsO+vQ==
X-Received: by 2002:a17:90a:528b:b0:1bc:c5f9:82a with SMTP id
 w11-20020a17090a528b00b001bcc5f9082amr3417076pjh.210.1645799265079;
        Fri, 25 Feb 2022 06:27:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/50] grub: add a fix for a possible negative
 shift
Date: Fri, 25 Feb 2022 04:26:05 -1000
Message-Id: 
 <d5a93d55b5f3bfd890aa2925869d2a5ba4299801.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162371

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for a possible negative shift in grub's zfs.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ix-possible-negative-shift-operation.patch | 42 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0021-zfs-Fix-possible-negative-shift-operation.patch

diff --git a/meta/recipes-bsp/grub/files/0021-zfs-Fix-possible-negative-shift-operation.patch b/meta/recipes-bsp/grub/files/0021-zfs-Fix-possible-negative-shift-operation.patch
new file mode 100644
index 0000000000..12418858f9
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0021-zfs-Fix-possible-negative-shift-operation.patch
@@ -0,0 +1,42 @@
+From c757779e5d09719666c3b155afd2421978a107bd Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Tue, 24 Nov 2020 16:41:49 +0000
+Subject: [PATCH] zfs: Fix possible negative shift operation
+
+While it is possible for the return value from zfs_log2() to be zero
+(0), it is quite unlikely, given that the previous assignment to blksz
+is shifted up by SPA_MINBLOCKSHIFT (9) before 9 is subtracted at the
+assignment to epbs.
+
+But, while unlikely during a normal operation, it may be that a carefully
+crafted ZFS filesystem could result in a zero (0) value to the
+dn_datalbkszsec field, which means that the shift left does nothing
+and assigns zero (0) to blksz, resulting in a negative epbs value.
+
+Fixes: CID 73608
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=a02091834d3e167320d8a262ff04b8e83c5e616d]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/fs/zfs/zfs.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c
+index 36d0373..0c42cba 100644
+--- a/grub-core/fs/zfs/zfs.c
++++ b/grub-core/fs/zfs/zfs.c
+@@ -2667,6 +2667,11 @@ dnode_get (dnode_end_t * mdn, grub_uint64_t objnum, grub_uint8_t type,
+   blksz = grub_zfs_to_cpu16 (mdn->dn.dn_datablkszsec, 
+ 			     mdn->endian) << SPA_MINBLOCKSHIFT;
+   epbs = zfs_log2 (blksz) - DNODE_SHIFT;
++
++  /* While this should never happen, we should check that epbs is not negative. */
++  if (epbs < 0)
++    epbs = 0;
++
+   blkid = objnum >> epbs;
+   idx = objnum & ((1 << epbs) - 1);
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 3c5274fd96..360e86685b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -67,6 +67,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0018-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch \
            file://0019-disk-cryptodisk-Fix-potential-integer-overflow.patch \
            file://0020-hfsplus-Check-that-the-volume-name-length-is-valid.patch \
+           file://0021-zfs-Fix-possible-negative-shift-operation.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


