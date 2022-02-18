Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759ACC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.9087.1645178800101121356
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f7ShmLaN;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so6024648wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Va8D6+aLfs2dbpdI8ByudUJBjWpuScttYwJQMGtB7oU=;
        b=f7ShmLaN5Lo2bBNqIiW2efmx2LzRY6mYlUy/CPr0oZx3av3XIxc2psLIDczE751Wby
         oX+WXP0k6mil4dUt6mBGxgWW5wr/7h5UhXeVRSgkMcnMNVRNF8R92GZdhXYvf/TpS5Hf
         7SOkLclEFOBazeevq4allXr6RJGLLSfxe4yOxPWJs8MSPmU+BNmw85n7nYGd8AtT28D/
         Pl+fo3VZIgBrM4zVzSVuJmSWO23VtkIR7gAo2hDCu0RikfytYaAZQQrgj1MKbLmRtHEp
         bxGxE+Zz8oTI7M+R+9z4futQlc9oZIb/SaEhtsqSNzo+MrSpblVpc2J8StS0RaxyMTY7
         dzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Va8D6+aLfs2dbpdI8ByudUJBjWpuScttYwJQMGtB7oU=;
        b=5O2ejMvB1vsG7asOzTUUvna1/1LZQ2TPgt/+fUfD1YKJBBNLkpr1po6Bjez1dvjlZl
         TbjTgBD/eQkgfc99HCpOB/bJQYvgn79aPCXxhapeT5eTZ2UCZEeHVJmZjSQncjsML4DJ
         ZUjPn93nNTlQmNQsiGA+wd5aYWFWBnhgUzqicvqOweP2ZObN4179em7rUgPiU516pXoF
         cxrhTFgW+kSupZZO6x3joALKUhlRO2u8gYnvJ3CjrYFdTi03vrgWn0pejhsB0Zlc34aQ
         /JiY9Nk9sUg0w2nq0ZaqitELlmqA3a9M8BiKhJzXm0XdLvJi7kaqCukJet9r5H64E5DS
         yygA==
X-Gm-Message-State: AOAM531W8ZO0fOv4/e2XBYGohx3+Ds48USOGQwLeLCk91vaiQNFqd/2m
	3681kQz1LUbrTAzH2osyriE=
X-Google-Smtp-Source: 
 ABdhPJzIj0I2O6D6EVkc1YzPVC+p+eR+RoUo/lunhaSD0m6/MisoU8in2NVQy/ZnxTDW+TKe3nucVA==
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id
 o24-20020a1c7518000000b0037c07ebf255mr9826754wmc.29.1645178798603;
        Fri, 18 Feb 2022 02:06:38 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:38 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 21/46][dunfell] grub: add a fix for a possible negative shift
Date: Fri, 18 Feb 2022 11:05:29 +0100
Message-Id: <20220218100554.1315511-22-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161909

This patch adds a fix for a possible negative shift in grub's zfs.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
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
2.33.0


