Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8B2C28B2F
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:11:52 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.17234.1741716710370246178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=d+YD8sXz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025031118114872ac9b5b58ed990a45-grmxdk@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025031118114872ac9b5b58ed990a45
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:11:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QEHJhdrXUAUYzleFkOXeaB8u1KYDOxRNYWRSVbGFujs=;
 b=d+YD8sXzSfbuJreCWnYDWMoNTF4QLJ9FEVhwh9z4ag0JybMstRaS8io3LKGcpq+//Tj8Rz
 /0Kl/VvN+FxInRF2H/SdfdLxUpIMWxXZoLWIFStoInkjxtz6XN7Io51sFDrsnJywzxYhR5ta
 zSGJRvYxyIR7TUu1fob5VFKdu//uAahV4bORXjAcITtUi2XfeTt797bo/LHK+RQsZRnZyzMe
 2m/VEi9yG/Y6mp2lf2/X5isYJWev137tEX4szB7+u/PTnms7JlgeA3rvsngbm0hUmRig/XSL
 rUKKxAhk92PjO/3OD7WbaVY7Fd1N3wTYKgi/TOb1QZ3bWxo61o1P0nQQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 15/17] grub: patch CVE-2024-45778 and CVE-2024-45779
Date: Tue, 11 Mar 2025 19:09:58 +0100
Message-Id: <20250311181000.8582-15-peter.marko@siemens.com>
In-Reply-To: <20250311181000.8582-1-peter.marko@siemens.com>
References: <20250311181000.8582-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:11:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212592

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning these CVEs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../files/CVE-2024-45778_CVE-2024-45779.patch | 55 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch b/meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch
new file mode 100644
index 0000000000..eba013897f
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch
@@ -0,0 +1,55 @@
+From 26db6605036bd9e5b16d9068a8cc75be63b8b630 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Sat, 23 Mar 2024 15:59:43 +1100
+Subject: [PATCH] fs/bfs: Disable under lockdown
+
+The BFS is not fuzz-clean. Don't allow it to be loaded under lockdown.
+This will also disable the AFS.
+
+Fixes: CVE-2024-45778
+Fixes: CVE-2024-45779
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45778
+CVE: CVE-2024-45779
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/fs/bfs.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/fs/bfs.c b/grub-core/fs/bfs.c
+index 022f69fe2..78aeb051f 100644
+--- a/grub-core/fs/bfs.c
++++ b/grub-core/fs/bfs.c
+@@ -30,6 +30,7 @@
+ #include <grub/types.h>
+ #include <grub/i18n.h>
+ #include <grub/fshelp.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -1106,7 +1107,10 @@ GRUB_MOD_INIT (bfs)
+ {
+   COMPILE_TIME_ASSERT (1 << LOG_EXTENT_SIZE ==
+ 		       sizeof (struct grub_bfs_extent));
+-  grub_fs_register (&grub_bfs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_bfs_fs);
++    }
+ }
+ 
+ #ifdef MODE_AFS
+@@ -1115,5 +1119,6 @@ GRUB_MOD_FINI (afs)
+ GRUB_MOD_FINI (bfs)
+ #endif
+ {
+-  grub_fs_unregister (&grub_bfs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_bfs_fs);
+ }
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 19e6fd64b2..8fef137261 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -33,6 +33,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45777.patch \
            file://CVE-2025-0690.patch \
            file://CVE-2025-1118.patch \
+           file://CVE-2024-45778_CVE-2024-45779.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

