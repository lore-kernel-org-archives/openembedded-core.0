Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6A9C28B2F
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:18:43 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.17673.1741717120467981927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=QBwi2aQz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250311181841941cec7e993be0ac57-j56kmj@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250311181841941cec7e993be0ac57
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:18:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=F/wmdakdfagMfZulR8M3qFnkhB/pgRus4w+ZAUXW8qA=;
 b=QBwi2aQzdm/+Hc+YG4m4iyBnNDaKHpNB2E/NBEB1yWt50JEQyyMn4mNRVTvUzSkGPHcYpC
 83Sax8mni1M3PAZzSrSV7PZRVUMb1mf3fZTWiu7hmo06YWUmMUDknGPXS1xR0WwWaJDJOMhC
 K9VmB2bvzQ794sBZVe0qZJbg1SC61/3T4T0pT/iFCIv4jJSpPA0uTNzpQ9Za5uddMhiTZIyn
 VILW/DsPXOvula3h2CkhhdZvT2R0Kr2da9MMB2x2xGiB6bBBcozdoaexqttV5pn9TfOs4zvp
 TI8bMtjf1QKrtdrggpUow3wT9Bi8LV7OT+dRj36dk0/45tufN018U47A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 03/17] grup: patch CVE-2024-45781
Date: Tue, 11 Mar 2025 19:17:11 +0100
Message-Id: <20250311181725.8986-3-peter.marko@siemens.com>
In-Reply-To: <20250311181725.8986-1-peter.marko@siemens.com>
References: <20250311181725.8986-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212615

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../grub/files/CVE-2024-45781.patch           | 35 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45781.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45781.patch b/meta/recipes-bsp/grub/files/CVE-2024-45781.patch
new file mode 100644
index 0000000000..bd0b6aa04a
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45781.patch
@@ -0,0 +1,35 @@
+From c1a291b01f4f1dcd6a22b61f1c81a45a966d16ba Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Sun, 12 May 2024 02:03:33 +0100
+Subject: [PATCH 2/2] fs/ufs: Fix a heap OOB write
+
+grub_strcpy() was used to copy a symlink name from the filesystem
+image to a heap allocated buffer. This led to a OOB write to adjacent
+heap allocations. Fix by using grub_strlcpy().
+
+Fixes: CVE-2024-45781
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45781
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=c1a291b01f4f1dcd6a22b61f1c81a45a966d16ba]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/fs/ufs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/ufs.c b/grub-core/fs/ufs.c
+index a354c92d9..01235101b 100644
+--- a/grub-core/fs/ufs.c
++++ b/grub-core/fs/ufs.c
+@@ -463,7 +463,7 @@ grub_ufs_lookup_symlink (struct grub_ufs_data *data, int ino)
+   /* Check against zero is paylindromic, no need to swap.  */
+   if (data->inode.nblocks == 0
+       && INODE_SIZE (data) <= sizeof (data->inode.symlink))
+-    grub_strcpy (symlink, (char *) data->inode.symlink);
++    grub_strlcpy (symlink, (char *) data->inode.symlink, sz);
+   else
+     {
+       if (grub_ufs_read_file (data, 0, 0, 0, sz, symlink) < 0)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index f3279f7d2b..bace594ac4 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
            file://0001-RISC-V-Restore-the-typcast-to-long.patch \
            file://0001-misc-Implement-grub_strlcpy.patch \
+           file://CVE-2024-45781.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

