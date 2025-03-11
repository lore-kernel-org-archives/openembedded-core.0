Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7328C28B2F
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:11:12 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.17209.1741716669210506648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=hixUwxUo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202503111811079c87d984d2a9414a6a-k1svkd@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202503111811079c87d984d2a9414a6a
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:11:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Yl893lRwhJiGL/jtSc/MNVugmVuSOz+4/Y1RaKhkFcg=;
 b=hixUwxUoEYCheZJ5BmyQXgPw+09oPClIasqFMOJqlp0tu4SjSgyH6Up/pzVHSz7Nu9CqV/
 /DvAX/l/QV/LNOgQ6w1Q50xWelxOCswo7FaMvHeB4qlg15I3e+Y6KKfh9UqSGawJJIb7G8Yf
 JFN2n+pCacaCs/JA0EOOgRyT9Q/Ns6KEmpgPmr3RC27rU+5A1qAWENYqZ519I936frZjJrvg
 rCG8hbykGTyoXlzFWFeOt9Y4S/tlm6hql7p9MCJ350mM0YRCSIdIIi1WBOSalQ8dMS8gJgKi
 +9n0ylsc25ADltoht3U1wu3KY1TiCwR3n72KQ7PUC+Wdjm1PhBFW9U6Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 03/17] grup: patch CVE-2024-45781
Date: Tue, 11 Mar 2025 19:09:46 +0100
Message-Id: <20250311181000.8582-3-peter.marko@siemens.com>
In-Reply-To: <20250311181000.8582-1-peter.marko@siemens.com>
References: <20250311181000.8582-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212580

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
index a7d24dd68d..f166a2e052 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
            file://0001-RISC-V-Restore-the-typcast-to-long.patch \
            file://0001-misc-Implement-grub_strlcpy.patch \
+           file://CVE-2024-45781.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

