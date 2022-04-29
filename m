Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9241CC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:01:29 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.12116.1651248080842933956
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=TjcBpdjZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so10952934pjq.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Fr2HeMfEIfxDHiDk3JtE4mjYZELIiab17NYNhlhcQVc=;
        b=TjcBpdjZUf9UudLuyqPxM5Fyr7UEUxd2/GQMCBiapaLmWLbwpqsxqX9zMSdTpwh/3J
         KULvj0gEL3TqgAgmqpiObnYYrT2qwAZjAf8/6a1MwhxqxRdpYZ24ZAU2o2dL3Lz8g0bs
         KZQoF0tIwAZeRjUJ9J/7ZrTfXjXnIp5Ehjw9+AQrgzl+nWa/je522u6+rs3yfCnSaUIW
         rWgtXsVFvq2a7HlNHpOGc953xR4K3hlIEtD22lCdYC4BOneamc6P6E7B800ILgQTDfk8
         IKWN9YhufyYvAMRHmHTDcnIuejEw2VLE9VaL1/FRXVCJBBrMNceM0qMF6esoCd2iI7qt
         2ToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fr2HeMfEIfxDHiDk3JtE4mjYZELIiab17NYNhlhcQVc=;
        b=fbIviBaFml17iGeXjvkS5Ulo9VmUhWRd4KNeozqzwm5EzyaR5VWbD3hgiVPGENU6WY
         YHc8YdY7gQetKV8pcj8Vekmp8f8W3cKSEUGEMaVushAts0MqAU67lPXrGK8smJM1pTsT
         PK0xTs1w4J07B0ioQ4Zrh3NTdSaQ8o6FKlewyvPO0LAt3gSCrRnHMQpE+sLJSbVI5/8e
         WyCp1gt1ByD+f91w94pPnucIghH8RWeh2Eoe1+Z3VUROlePV5qC3/SUY8xHrlCDUed/S
         KdkotMlW92wwWR6OSjhQ8tLg8l91W381ZByD5VJMTy1OXtBRCKTYRJ481qE65w8nPEaG
         3i4A==
X-Gm-Message-State: AOAM530iV/LdmvFWVyI/03E7kPuwtMQsLLHI9dxi2AJKD2XDVjhC6GZo
	v/tFyXiw1SucmU64Q3qAcrFbTFMYpNKol7lNYk4=
X-Google-Smtp-Source: 
 ABdhPJzrv0ivR0qusfT+GpoD6tsamo4abBbGrVnYYwu1jSQekalPvwWKGu7yahY+0NsMwUoKT/T1rQ==
X-Received: by 2002:a17:903:4052:b0:156:229d:ffed with SMTP id
 n18-20020a170903405200b00156229dffedmr39215573pla.98.1651248073129;
        Fri, 29 Apr 2022 09:01:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.01.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:01:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/34] e2fsprogs: fix CVE-2022-1304
Date: Fri, 29 Apr 2022 06:00:20 -1000
Message-Id: 
 <6b31ebb379369cfd9448f64fca6a664b72a7f4fa.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:01:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165020

From: Ross Burton <ross.burton@arm.com>

Backport a submitted patch to fix CVE-2022-1304.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 31fd4ca6fa85ed1e62faf37e6d7bed5b558cb309)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../e2fsprogs/e2fsprogs/extents.patch         | 56 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.46.5.bb             |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
new file mode 100644
index 0000000000..ffaecc622a
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
@@ -0,0 +1,56 @@
+CVE: CVE-2022-1304
+Upstream-Status: Submitted [https://lore.kernel.org/linux-ext4/20220421173148.20193-1-lczerner@redhat.com/]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 347084c9c1ad20f47dae16f5a3dcd8628d5fc7b0 Mon Sep 17 00:00:00 2001
+From: Lukas Czerner <lczerner@redhat.com>
+Date: Thu, 21 Apr 2022 19:31:48 +0200
+Subject: [PATCH] e2fsprogs: add sanity check to extent manipulation
+
+It is possible to have a corrupted extent tree in such a way that a leaf
+node contains zero extents in it. Currently if that happens and we try
+to traverse the tree we can end up accessing wrong data, or possibly
+even uninitialized memory. Make sure we don't do that.
+
+Additionally make sure that we have a sane number of bytes passed to
+memmove() in ext2fs_extent_delete().
+
+Note that e2fsck is currently unable to spot and fix such corruption in
+pass1.
+
+Signed-off-by: Lukas Czerner <lczerner@redhat.com>
+Reported-by: Nils Bars <nils_bars@t-online.de>
+Addressess: https://bugzilla.redhat.com/show_bug.cgi?id=2068113
+---
+ lib/ext2fs/extent.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/lib/ext2fs/extent.c b/lib/ext2fs/extent.c
+index b324c7b0..1a206a16 100644
+--- a/lib/ext2fs/extent.c
++++ b/lib/ext2fs/extent.c
+@@ -495,6 +495,10 @@ retry:
+ 			ext2fs_le16_to_cpu(eh->eh_entries);
+ 		newpath->max_entries = ext2fs_le16_to_cpu(eh->eh_max);
+ 
++		/* Make sure there is at least one extent present */
++		if (newpath->left <= 0)
++			return EXT2_ET_EXTENT_NO_DOWN;
++
+ 		if (path->left > 0) {
+ 			ix++;
+ 			newpath->end_blk = ext2fs_le32_to_cpu(ix->ei_block);
+@@ -1630,6 +1634,10 @@ errcode_t ext2fs_extent_delete(ext2_extent_handle_t handle, int flags)
+ 
+ 	cp = path->curr;
+ 
++	/* Sanity check before memmove() */
++	if (path->left < 0)
++		return EXT2_ET_EXTENT_LEAF_BAD;
++
+ 	if (path->left) {
+ 		memmove(cp, cp + sizeof(struct ext3_extent_idx),
+ 			path->left * sizeof(struct ext3_extent_idx));
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
index 16c183eed3..ec48f419c7 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
+           file://extents.patch \
            "
 SRC_URI:append:class-native = " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
-- 
2.25.1


