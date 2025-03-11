Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C21C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:19:23 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.17701.1741717156545316565
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SRh4mtkh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250311181914e432738cd294ac4949-vo82ts@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250311181914e432738cd294ac4949
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:19:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=wANuO3wvE6+OVYkfSjcBR86vI82eCCm91hi00X6A2tI=;
 b=SRh4mtkh6hx5RwwfuUZiae3iTdLsQcmX6+Pc9L7n0u6xmRt7rEvXBktOp4lhf+Ft5C0sII
 BCfKMFK1fRWvZObcyGbFW7pMjyhfysxB58DuoMOkJhc4DUIuK+vlh6rOSa6xJ6WV6KHw3zv5
 6PQYNjG4TKy2rUSOAKLglTE3cwM0yNKP8HfAozjMhjXOubATjYanNIUs58VbnFTYVZCJXj3i
 GO/Rv/TmQ9W/un7f18d48FvsxK4+PrmtuAwfnuBw79ZIs9cDP3x8pTL6WTT/xknXeYUSX2vm
 Q54AzuxqQXaNzzcCPqdiytYDFHyDYP1WPzQyU2qLSEb8u6ULdYTzDGuQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 15/17] grub: patch CVE-2024-45778 and CVE-2024-45779
Date: Tue, 11 Mar 2025 19:17:23 +0100
Message-Id: <20250311181725.8986-15-peter.marko@siemens.com>
In-Reply-To: <20250311181725.8986-1-peter.marko@siemens.com>
References: <20250311181725.8986-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:19:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212627

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
index dbceaf9931..ef16242ed3 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -34,6 +34,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45777.patch \
            file://CVE-2025-0690.patch \
            file://CVE-2025-1118.patch \
+           file://CVE-2024-45778_CVE-2024-45779.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

