Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B67C2BA1B
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:15:42 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.17336.1741716935333029132
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=IbYRiGQ0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2025031118153337e3f00552b5fbb129-dvhr3r@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025031118153337e3f00552b5fbb129
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:15:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=rOShKo/+FdgKmSp6UWiSB9ahSzqFgGiEYcBXn2tcydY=;
 b=IbYRiGQ0yxkjTpoZ0SaM79CnqcgzbAvop9kBgSUup1iQpBLTmZWK+jj3CuvSTqAB30UC5S
 9AWVvS/H+EpXDWKXlAAL4hUDafmS3hLaV5DHwSQfV2EGV7KtjiRvWV1fsSBfou8ictd3soUw
 L69o9BvHMXsHREYe3HRu1EHyAT0zGhhiEIzpLieWdb8eJFiSagdhqJeILOwRkMlm8oNxh5g1
 P/wPQokzprl7pP9/Y3K/TDl5B5Bc5yf/Ai3pryL4C9r0B9rVo5s85aNcZMfKEGSAFXNx72mr
 0Xl8qzhBEbBQBIq6Ut5MvLNFtn7/4Xanj9Gf36zxKX3MaL0y//lmof2w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH 08/17] grub: patch CVE-2024-45774
Date: Tue, 11 Mar 2025 19:14:15 +0100
Message-Id: <20250311181424.8837-8-peter.marko@siemens.com>
In-Reply-To: <20250311181424.8837-1-peter.marko@siemens.com>
References: <20250311181424.8837-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212602

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../grub/files/CVE-2024-45774.patch           | 37 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45774.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45774.patch b/meta/recipes-bsp/grub/files/CVE-2024-45774.patch
new file mode 100644
index 0000000000..55aecc17d7
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45774.patch
@@ -0,0 +1,37 @@
+From 2c34af908ebf4856051ed29e46d88abd2b20387f Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Fri, 8 Mar 2024 22:47:20 +1100
+Subject: [PATCH] video/readers/jpeg: Do not permit duplicate SOF0 markers in
+ JPEG
+
+Otherwise a subsequent header could change the height and width
+allowing future OOB writes.
+
+Fixes: CVE-2024-45774
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45774
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2c34af908ebf4856051ed29e46d88abd2b20387f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/video/readers/jpeg.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/grub-core/video/readers/jpeg.c b/grub-core/video/readers/jpeg.c
+index ae634fd41..631a89356 100644
+--- a/grub-core/video/readers/jpeg.c
++++ b/grub-core/video/readers/jpeg.c
+@@ -339,6 +339,10 @@ grub_jpeg_decode_sof (struct grub_jpeg_data *data)
+   if (grub_errno != GRUB_ERR_NONE)
+     return grub_errno;
+ 
++  if (data->image_height != 0 || data->image_width != 0)
++    return grub_error (GRUB_ERR_BAD_FILE_TYPE,
++		       "jpeg: cannot have duplicate SOF0 markers");
++
+   if (grub_jpeg_get_byte (data) != 8)
+     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
+ 		       "jpeg: only 8-bit precision is supported");
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 3526c43835..ea6e19072e 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45780.patch \
            file://CVE-2024-45783.patch \
            file://CVE-2025-0624.patch \
+           file://CVE-2024-45774.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

