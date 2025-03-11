Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA51C35FF1
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:11:52 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.17479.1741716703522631912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=N+aJeqrl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025031118114164a7ef8e4c9b5c0832-xxrzii@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025031118114164a7ef8e4c9b5c0832
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:11:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7S0yV/XuvjSnyhKUEDDQxr3+Mw7OuH0xUFMCQcvDZuY=;
 b=N+aJeqrlIuOSdRmfugY3Gjhzxpwo57nmDhsV77rkF+d0wi8z4yUV7Jhi/EBtqk2SfYxH1K
 A42J5MFCzmkBmzSas69ssIBeaqCxC+/Kjg6rOPjQlIOaSlCX1jnwkQtG1bGQwzf1souKlqLL
 8iOKxzWKsxKzbEdR6LiPeQ41nOhHse0Auy3Eg7RWlNnfzPFNuROpvIC+vXXAWj6D4N8UvV8Z
 fPlttmWcptitJ6/CsElnq0I272rkETmUPJkZ8ZJPkEeRolJ13Nr7dqqCO8ioE/HB4RDB6Gt3
 ox8LAwRxltccmkidSl3j9fsovFuBhis8Hvgm2klrIP5+WBkokRLqzMMA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 13/17] grub: patch CVE-2025-0690
Date: Tue, 11 Mar 2025 19:09:56 +0100
Message-Id: <20250311181000.8582-13-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212590

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../grub/files/CVE-2025-0690.patch            | 73 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0690.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0690.patch b/meta/recipes-bsp/grub/files/CVE-2025-0690.patch
new file mode 100644
index 0000000000..be585c96ad
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0690.patch
@@ -0,0 +1,73 @@
+From dad8f502974ed9ad0a70ae6820d17b4b142558fc Mon Sep 17 00:00:00 2001
+From: Jonathan Bar Or <jonathanbaror@gmail.com>
+Date: Thu, 23 Jan 2025 19:17:05 +0100
+Subject: [PATCH] commands/read: Fix an integer overflow when supplying more
+ than 2^31 characters
+
+The grub_getline() function currently has a signed integer variable "i"
+that can be overflown when user supplies more than 2^31 characters.
+It results in a memory corruption of the allocated line buffer as well
+as supplying large negative values to grub_realloc().
+
+Fixes: CVE-2025-0690
+
+Reported-by: Jonathan Bar Or <jonathanbaror@gmail.com>
+Signed-off-by: Jonathan Bar Or <jonathanbaror@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0690
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=dad8f502974ed9ad0a70ae6820d17b4b142558fc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/commands/read.c | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/grub-core/commands/read.c b/grub-core/commands/read.c
+index 597c90706..8d72e45c9 100644
+--- a/grub-core/commands/read.c
++++ b/grub-core/commands/read.c
+@@ -25,6 +25,7 @@
+ #include <grub/types.h>
+ #include <grub/extcmd.h>
+ #include <grub/i18n.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -37,13 +38,14 @@ static const struct grub_arg_option options[] =
+ static char *
+ grub_getline (int silent)
+ {
+-  int i;
++  grub_size_t i;
+   char *line;
+   char *tmp;
+   int c;
++  grub_size_t alloc_size;
+ 
+   i = 0;
+-  line = grub_malloc (1 + i + sizeof('\0'));
++  line = grub_malloc (1 + sizeof('\0'));
+   if (! line)
+     return NULL;
+ 
+@@ -59,8 +61,17 @@ grub_getline (int silent)
+       line[i] = (char) c;
+       if (!silent)
+ 	grub_printf ("%c", c);
+-      i++;
+-      tmp = grub_realloc (line, 1 + i + sizeof('\0'));
++      if (grub_add (i, 1, &i))
++        {
++          grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++          return NULL;
++        }
++      if (grub_add (i, 1 + sizeof('\0'), &alloc_size))
++        {
++          grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++          return NULL;
++        }
++      tmp = grub_realloc (line, alloc_size);
+       if (! tmp)
+ 	{
+ 	  grub_free (line);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 160dfc5d2b..2c61fb66bc 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -31,6 +31,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0622-03.patch \
            file://CVE-2024-45776.patch \
            file://CVE-2024-45777.patch \
+           file://CVE-2025-0690.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

