Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAB6C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:51 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.6795.1645799270717650099
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=iWczxnIE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id g1so4833140pfv.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7KNAqP7de0bBVkhdAWYfQWUCpUuyo6VZmANyRf49S1g=;
        b=iWczxnIEwJ16ORlcoWxWeLut+sImYjAWXH914BqsowobGEYqJ4lritPQSE7Fp4bWCo
         6vcZqOIERvyJXN4H7CEaTCiQIfXxY8nZ/CZKUwFPHyDmyAcngH7P22cLCML91OfWNsXS
         /TVJO7GDvxDRGw0V+++PoTG54gvbc57EXPUSjfnn+F7a0N7A+KnmFxLq7VqdcHnRgdZp
         TsmjVnJIfy8VkZt+Pad0GcHGIIY0fMcAESVn0yCvzTUpNY6MD6+cj9yAlOfoYGo1b4us
         nqT+dOWh/6o/ZwhMoL7n6i4y1oNjv9yEoMshjI8BMveAB37VUVqcsikkIvlFlCJBxwea
         qWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7KNAqP7de0bBVkhdAWYfQWUCpUuyo6VZmANyRf49S1g=;
        b=d3MGsX9bpIesVjMRX9cWvTGSa3E/Z29wjnu5ybOgjZaLOilJdYjbiqHnWJ5WnQZvgD
         QgNea3ZvQIQ0eRlN0rm1A9waqrCagbMnEWUTTHDsxZarfMtQKyusNXboOXeGBmDEuPWX
         3KGRNWTvau0WBAUkrF2VwPLR+I1zDn/29mkxtcy9AWsEjpaATRVvVHdBGQeE+22n88s9
         D8VK2iR7Gs36AAZIVCuEsVWfYKuhMvm1wmayHWLeYiVqrDrf/1O7/wN2xfrhDxwvm3rN
         BB9s8QNcIBI+tJsLWbNA/Ki85Ugk3JtGnsSI7A5zS57yIKur+GpO0TbICjJVfP7Ffo3X
         rcDw==
X-Gm-Message-State: AOAM5301BqmaBth08udjBvRj5TYa3iF6rEE7o1aerhGofPnAac70jYcf
	BtIzW+8Fzhop/wHdhpJIx5nivvK3quRUD6b9
X-Google-Smtp-Source: 
 ABdhPJz8Tlyo8SDjCrNmnggfJZ50bHukJ9iAVoPn3LhPcF6eVQflTJoY2IOWQMMehx4MrUaMPDH1kw==
X-Received: by 2002:a05:6a00:139e:b0:4f1:37e5:c350 with SMTP id
 t30-20020a056a00139e00b004f137e5c350mr8049046pfg.27.1645799269647;
        Fri, 25 Feb 2022 06:27:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 27/50] grub: add a fix for possible integer
 overflows
Date: Fri, 25 Feb 2022 04:26:07 -1000
Message-Id: 
 <a21a1f225090b2f9d4c76e323fa7cc2051587924.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162373

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for a possible integer overflows in grub's zfs.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


