Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDE1C35FF2
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:15:42 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.17343.1741716942392990095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=bjZ/xL/I;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202503111815403f52840356f5fec24c-febmjk@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202503111815403f52840356f5fec24c
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:15:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=KjztLRF24ThBm+gxJZyg3UXEO+d4JZiSl+mNMrbZnpQ=;
 b=bjZ/xL/IOaajyb+GQQf1757IwrLCMWe4cNVkSJimZQETFr+59i3iJffPN9EZ8WP2qC//fR
 ViSPG8pVnNhAuFo9+ttnkzUOISRnHLJUu+bMttPyCLEjaYora4okThwTWqmy2LYymvHXFUXb
 LWN5X0ZtkENuOrxnSUw/qO2+5YQ9lpm6Yzsc3LRvZIxw9OB5zjio4bX89nAbdh73XMOwJuaB
 Bz0vNVJGU4mUY4V5AUbK0GWZ2j4DA/evDPXkvTK6XwZ4a7grKaEsz01Szw0P/cyz6ebwLuWM
 /VbePKGbwLvxVGJzSNTKAd8ZsHetbpucqMDADmwtvN4Q8HokHng8LI2A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH 11/17] grub: patch CVE-2024-45776
Date: Tue, 11 Mar 2025 19:14:18 +0100
Message-Id: <20250311181424.8837-11-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212605

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../grub/files/CVE-2024-45776.patch           | 39 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45776.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45776.patch b/meta/recipes-bsp/grub/files/CVE-2024-45776.patch
new file mode 100644
index 0000000000..8deea958b8
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45776.patch
@@ -0,0 +1,39 @@
+From 09bd6eb58b0f71ec273916070fa1e2de16897a91 Mon Sep 17 00:00:00 2001
+From: Lidong Chen <lidong.chen@oracle.com>
+Date: Fri, 22 Nov 2024 06:27:56 +0000
+Subject: [PATCH] gettext: Integer overflow leads to heap OOB write or read
+
+Calculation of ctx->grub_gettext_msg_list size in grub_mofile_open() may
+overflow leading to subsequent OOB write or read. This patch fixes the
+issue by replacing grub_zalloc() and explicit multiplication with
+grub_calloc() which does the same thing in safe manner.
+
+Fixes: CVE-2024-45776
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
+
+CVE: CVE-2024-45776
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=09bd6eb58b0f71ec273916070fa1e2de16897a91]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/gettext/gettext.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
+index e4f4f8ee6..63bb1ab73 100644
+--- a/grub-core/gettext/gettext.c
++++ b/grub-core/gettext/gettext.c
+@@ -323,8 +323,8 @@ grub_mofile_open (struct grub_gettext_context *ctx,
+   for (ctx->grub_gettext_max_log = 0; ctx->grub_gettext_max >> ctx->grub_gettext_max_log;
+        ctx->grub_gettext_max_log++);
+ 
+-  ctx->grub_gettext_msg_list = grub_zalloc (ctx->grub_gettext_max
+-					    * sizeof (ctx->grub_gettext_msg_list[0]));
++  ctx->grub_gettext_msg_list = grub_calloc (ctx->grub_gettext_max,
++					    sizeof (ctx->grub_gettext_msg_list[0]));
+   if (!ctx->grub_gettext_msg_list)
+     {
+       grub_file_close (fd);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 7d463f8aeb..581855eb4b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -29,6 +29,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0622-01.patch \
            file://CVE-2025-0622-02.patch \
            file://CVE-2025-0622-03.patch \
+           file://CVE-2024-45776.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

