Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5E3C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:11:22 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.17454.1741716673560318351
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ILjIPSZa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202503111811110068d08848c04051bf-8_5uin@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202503111811110068d08848c04051bf
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:11:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MKiCm0RegTmH/OSEpIE+W5L8mB9hUO9TA+/EldTvipo=;
 b=ILjIPSZaIkrq/PzA1nytDCddrepH4PpRXzA+F1YxRwCjeIFxOubw+YrmOroJC3kHeShKhH
 hI4K50Cu8YOLe32uf3yIcS28lYRz+wBTMwmGtnG0Pc+Jb9Ztnrw15rS+w7i+goLn6hZ9uas5
 BYoAahXjeU6AWKq9Ppsdp/iZx7ngB1wpgxpSUhb032fUcJxwSEHD92Tl4s/oqT9neHGG32nX
 xMkNn3Z6hJxDz+A9ysLFwVDOx306nhUG078RQoHn1u6gcm68C225iPJKWtyb/GL/SaoM0DES
 1oUNxm/x2e9Xx4C3ZFNa9zXFrWBangAXCpYLC6psMeun21EbL4FWW9zw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 04/17] grub: patch CVE-2024-45782 and CVE-2024-56737
Date: Tue, 11 Mar 2025 19:09:47 +0100
Message-Id: <20250311181000.8582-4-peter.marko@siemens.com>
In-Reply-To: <20250311181000.8582-1-peter.marko@siemens.com>
References: <20250311181000.8582-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212581

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning these CVEs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../files/CVE-2024-45782_CVE-2024-56737.patch | 36 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch b/meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch
new file mode 100644
index 0000000000..41cc025b81
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch
@@ -0,0 +1,36 @@
+From 417547c10410b714e43f08f74137c24015f8f4c3 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Sun, 12 May 2024 02:48:33 +0100
+Subject: [PATCH] fs/hfs: Fix stack OOB write with grub_strcpy()
+
+Replaced with grub_strlcpy().
+
+Fixes: CVE-2024-45782
+Fixes: CVE-2024-56737
+Fixes: https://savannah.gnu.org/bugs/?66599
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45782
+CVE: CVE-2024-56737
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=417547c10410b714e43f08f74137c24015f8f4c3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/fs/hfs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/hfs.c b/grub-core/fs/hfs.c
+index 91dc0e69c..920112b03 100644
+--- a/grub-core/fs/hfs.c
++++ b/grub-core/fs/hfs.c
+@@ -379,7 +379,7 @@ grub_hfs_mount (grub_disk_t disk)
+      volume name.  */
+   key.parent_dir = grub_cpu_to_be32_compile_time (1);
+   key.strlen = data->sblock.volname[0];
+-  grub_strcpy ((char *) key.str, (char *) (data->sblock.volname + 1));
++  grub_strlcpy ((char *) key.str, (char *) (data->sblock.volname + 1), sizeof (key.str));
+ 
+   if (grub_hfs_find_node (data, (char *) &key, data->cat_root,
+ 			  0, (char *) &dir, sizeof (dir)) == 0)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index f166a2e052..0e08485b40 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-RISC-V-Restore-the-typcast-to-long.patch \
            file://0001-misc-Implement-grub_strlcpy.patch \
            file://CVE-2024-45781.patch \
+           file://CVE-2024-45782_CVE-2024-56737.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

