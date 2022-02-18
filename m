Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77EC4C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:43 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.8975.1645178802267306741
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AFo28lHP;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso8207480wme.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sgcUXiZKuT+Si+0wkIhD0+HfFQ2nanb9M2QPXhyOLSo=;
        b=AFo28lHPfGSbOoNdOJRRvFlh53IEjtR7jQALw6hC/L3gzs2fRKPITl9RXyjb2WEHQA
         5O0YkzjqKbwhy6NyLuPQ6krpI8Ny6+NJEoyyYO+sM+YL1mrwPEQoRarIaM1gX0fOp7MR
         3voCxIwj4lpj0XkzbGI5KAMZYErlgRW2yL2IW5Hlsc0roZjoT9LKmaOrMZKZ5y6rhUV1
         AVl8aXt7D+MVWu9BPH+eanfflQPT4ZA+8Su7KyFuNISFe/tyX8D0ty4/w4nlZxCMZ3Wd
         b09HggwuuB5b9mzLky0Jo1wvEuD/qTTy/ZqWj5DRDX1JrQjq8vRKxN/+WGuHOzKAy4ax
         9mLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sgcUXiZKuT+Si+0wkIhD0+HfFQ2nanb9M2QPXhyOLSo=;
        b=UOoR82NW3LDpU7y+p0Odw4095l7LD5jWdlE4csAEnp+YBE2tpRFBFpFrf3Kh2irZU8
         baPzyL5Rsrn6ntgpTDZEt1g638/A7QHJ2GVmVAOHgFx2Qy/03KTYYEYjjGRIcgd58ysd
         VOYWUESbXY/fukqlgmauTbE2/ZcZdYyEpB6/2/vOy1l1Mv6rDCWMRwUWqihuFJyeK/wF
         J0ykzn0f7Z0x3bqzEhAWZFWk/0XqRzsq+e+fGs1I1ojjlzrez24BjtZHuJPoFSqcMtaF
         OWiH6Q8sagsi/o1883QKtkEnI3bTQ6X0mndKMQCfP4djIzxiYJnzP4+rs7Xt1ejMgzQb
         +GrA==
X-Gm-Message-State: AOAM530rJkhSYuc6HsIqOITjMUq+zTlU4+5CSDHChtTt6FOAXzTsVmTE
	EysaZGyaKck6uymK6exxgPA=
X-Google-Smtp-Source: 
 ABdhPJz/UFXxqHIc5Lxke2+GOmumy0CuFjTs8ZJOY6jYHw9uRGvgtQH9KOqP3EnoByn9vs9I5ch1gg==
X-Received: by 2002:a7b:c016:0:b0:37b:ebf6:3d13 with SMTP id
 c22-20020a7bc016000000b0037bebf63d13mr10228322wmb.191.1645178800792;
        Fri, 18 Feb 2022 02:06:40 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:40 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 23/46][dunfell] grub: add a fix for possible integer overflows
Date: Fri, 18 Feb 2022 11:05:31 +0100
Message-Id: <20220218100554.1315511-24-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161911

This patch adds a fix for a possible integer overflows in grub's zfs.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...3-zfs-Fix-possible-integer-overflows.patch | 56 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0023-zfs-Fix-possible-integer-overflows.patch

diff --git a/meta/recipes-bsp/grub/files/0023-zfs-Fix-possible-integer-overflows.patch b/meta/recipes-bsp/grub/files/0023-zfs-Fix-possible-integer-overflows.patch
new file mode 100644
index 0000000000..8df758b41f
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0023-zfs-Fix-possible-integer-overflows.patch
@@ -0,0 +1,56 @@
+From ec35d862f3567671048aa0d0d8ad1ded1fd25336 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Tue, 8 Dec 2020 22:17:04 +0000
+Subject: [PATCH] zfs: Fix possible integer overflows
+
+In all cases the problem is that the value being acted upon by
+a left-shift is a 32-bit number which is then being used in the
+context of a 64-bit number.
+
+To avoid overflow we ensure that the number being shifted is 64-bit
+before the shift is done.
+
+Fixes: CID 73684, CID 73695, CID 73764
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=302c12ff5714bc455949117c1c9548ccb324d55b]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/fs/zfs/zfs.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c
+index 9087a72..b078ccc 100644
+--- a/grub-core/fs/zfs/zfs.c
++++ b/grub-core/fs/zfs/zfs.c
+@@ -564,7 +564,7 @@ find_bestub (uberblock_phys_t * ub_array,
+       ubptr = (uberblock_phys_t *) ((grub_properly_aligned_t *) ub_array
+ 				    + ((i << ub_shift)
+ 				       / sizeof (grub_properly_aligned_t)));
+-      err = uberblock_verify (ubptr, offset, 1 << ub_shift);
++      err = uberblock_verify (ubptr, offset, (grub_size_t) 1 << ub_shift);
+       if (err)
+ 	{
+ 	  grub_errno = GRUB_ERR_NONE;
+@@ -1543,7 +1543,7 @@ read_device (grub_uint64_t offset, struct grub_zfs_device_desc *desc,
+ 
+ 	    high = grub_divmod64 ((offset >> desc->ashift) + c,
+ 				  desc->n_children, &devn);
+-	    csize = bsize << desc->ashift;
++	    csize = (grub_size_t) bsize << desc->ashift;
+ 	    if (csize > len)
+ 	      csize = len;
+ 
+@@ -1635,8 +1635,8 @@ read_device (grub_uint64_t offset, struct grub_zfs_device_desc *desc,
+ 
+ 	    while (len > 0)
+ 	      {
+-		grub_size_t csize;
+-		csize = ((s / (desc->n_children - desc->nparity))
++		grub_size_t csize = s;
++		csize = ((csize / (desc->n_children - desc->nparity))
+ 			 << desc->ashift);
+ 		if (csize > len)
+ 		  csize = len;
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 1630235edd..9158fc7f50 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -69,6 +69,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0020-hfsplus-Check-that-the-volume-name-length-is-valid.patch \
            file://0021-zfs-Fix-possible-negative-shift-operation.patch \
            file://0022-zfs-Fix-resource-leaks-while-constructing-path.patch \
+           file://0023-zfs-Fix-possible-integer-overflows.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


