Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1001C5AC78
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.27914.1650884098580435060
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 03:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D7971FB
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 03:54:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19FEB3F73B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 03:54:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] e2fsprogs: fix CVE-2022-1304
Date: Mon, 25 Apr 2022 11:54:55 +0100
Message-Id: <20220425105455.3561063-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164815

Backport a submitted patch to fix CVE-2022-1304.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../e2fsprogs/e2fsprogs/extents.patch         | 56 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.46.5.bb             |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.pat=
ch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch b/me=
ta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
new file mode 100644
index 0000000000..ffaecc622a
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
@@ -0,0 +1,56 @@
+CVE: CVE-2022-1304
+Upstream-Status: Submitted [https://lore.kernel.org/linux-ext4/202204211=
73148.20193-1-lczerner@redhat.com/]
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
+Addressess: https://bugzilla.redhat.com/show_bug.cgi?id=3D2068113
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
+ 		newpath->max_entries =3D ext2fs_le16_to_cpu(eh->eh_max);
+=20
++		/* Make sure there is at least one extent present */
++		if (newpath->left <=3D 0)
++			return EXT2_ET_EXTENT_NO_DOWN;
++
+ 		if (path->left > 0) {
+ 			ix++;
+ 			newpath->end_blk =3D ext2fs_le32_to_cpu(ix->ei_block);
+@@ -1630,6 +1634,10 @@ errcode_t ext2fs_extent_delete(ext2_extent_handle=
_t handle, int flags)
+=20
+ 	cp =3D path->curr;
+=20
++	/* Sanity check before memmove() */
++	if (path->left < 0)
++		return EXT2_ET_EXTENT_LEAF_BAD;
++
+ 	if (path->left) {
+ 		memmove(cp, cp + sizeof(struct ext3_extent_idx),
+ 			path->left * sizeof(struct ext3_extent_idx));
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb b/meta/r=
ecipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
index 16c183eed3..ec48f419c7 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
@@ -4,6 +4,7 @@ SRC_URI +=3D "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
+           file://extents.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patc=
h \
--=20
2.25.1


