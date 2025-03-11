Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5165C2BA1B
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:15:32 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.17565.1741716923043416534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ahtwOrXm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250311181531cfda1e1f0e11795ffd-blryco@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250311181531cfda1e1f0e11795ffd
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:15:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=V5Uvma60WpUA7axz7H4FzVOYCCbdxzQbYR8n39nJHqM=;
 b=ahtwOrXmsVZxeEtwreCImf0BkmbHq2H52U1kmqlGeUjPiVfD/XQMPO5t6QjiDjl/FB/NPq
 JEjVLD23E7Qg4l/igMcbKkSKlHwbs0mu8xR/C8mQHjuk6z5YKGemlQKteuR2xd2c5RGjGCj6
 fez+13XD7EtPNIX5uPS6TE1kHxaPut9KiWHMIDVMrrXxwJIyLZ61OAD5QkJGer0TuwvRKvwf
 CvfMfeAruIdD3OMCoqX1mC9yy7NzEWyfZYiKG2E+RlcAUqyMNd/z5cJxcZAyy3XOlkMy+qxC
 4jR2ROfY8o+eyVuyFOWUTaKMrqyFA5KJRQgWZjg8dXRdh9Sw5RjXdKkA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH 07/17] grub: patch CVE-2025-0624
Date: Tue, 11 Mar 2025 19:14:14 +0100
Message-Id: <20250311181424.8837-7-peter.marko@siemens.com>
In-Reply-To: <20250311181424.8837-1-peter.marko@siemens.com>
References: <20250311181424.8837-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212601

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../grub/files/CVE-2025-0624.patch            | 84 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0624.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0624.patch b/meta/recipes-bsp/grub/files/CVE-2025-0624.patch
new file mode 100644
index 0000000000..229fe6399e
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0624.patch
@@ -0,0 +1,84 @@
+From 5eef88152833062a3f7e017535372d64ac8ef7e1 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Fri, 15 Nov 2024 13:12:09 +0000
+Subject: [PATCH] net: Fix OOB write in grub_net_search_config_file()
+
+The function included a call to grub_strcpy() which copied data from an
+environment variable to a buffer allocated in grub_cmd_normal(). The
+grub_cmd_normal() didn't consider the length of the environment variable.
+So, the copy operation could exceed the allocation and lead to an OOB
+write. Fix the issue by replacing grub_strcpy() with grub_strlcpy() and
+pass the underlying buffers size to the grub_net_search_config_file().
+
+Fixes: CVE-2025-0624
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0624
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=5eef88152833062a3f7e017535372d64ac8ef7e1]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/net/net.c     | 7 ++++---
+ grub-core/normal/main.c | 2 +-
+ include/grub/net.h      | 2 +-
+ 3 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/grub-core/net/net.c b/grub-core/net/net.c
+index 0e41e21a5..9939ff601 100644
+--- a/grub-core/net/net.c
++++ b/grub-core/net/net.c
+@@ -1909,14 +1909,15 @@ grub_config_search_through (char *config, char *suffix,
+ }
+ 
+ grub_err_t
+-grub_net_search_config_file (char *config)
++grub_net_search_config_file (char *config, grub_size_t config_buf_len)
+ {
+-  grub_size_t config_len;
++  grub_size_t config_len, suffix_len;
+   char *suffix;
+ 
+   config_len = grub_strlen (config);
+   config[config_len] = '-';
+   suffix = config + config_len + 1;
++  suffix_len = config_buf_len - (config_len + 1);
+ 
+   struct grub_net_network_level_interface *inf;
+   FOR_NET_NETWORK_LEVEL_INTERFACES (inf)
+@@ -1942,7 +1943,7 @@ grub_net_search_config_file (char *config)
+ 
+       if (client_uuid)
+         {
+-          grub_strcpy (suffix, client_uuid);
++          grub_strlcpy (suffix, client_uuid, suffix_len);
+           if (grub_config_search_through (config, suffix, 1, 0) == 0)
+             return GRUB_ERR_NONE;
+         }
+diff --git a/grub-core/normal/main.c b/grub-core/normal/main.c
+index 90879dc21..838f57fa5 100644
+--- a/grub-core/normal/main.c
++++ b/grub-core/normal/main.c
+@@ -344,7 +344,7 @@ grub_cmd_normal (struct grub_command *cmd __attribute__ ((unused)),
+ 
+           if (grub_strncmp (prefix + 1, "tftp", sizeof ("tftp") - 1) == 0 &&
+               !disable_net_search)
+-            grub_net_search_config_file (config);
++            grub_net_search_config_file (config, config_len);
+ 
+ 	  grub_enter_normal_mode (config);
+ 	  grub_free (config);
+diff --git a/include/grub/net.h b/include/grub/net.h
+index 228d04963..58a4f83fc 100644
+--- a/include/grub/net.h
++++ b/include/grub/net.h
+@@ -579,7 +579,7 @@ void
+ grub_net_remove_dns_server (const struct grub_net_network_level_address *s);
+ 
+ grub_err_t
+-grub_net_search_config_file (char *config);
++grub_net_search_config_file (char *config, grub_size_t config_buf_len);
+ 
+ extern char *grub_net_default_server;
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 05aea4cc6a..3526c43835 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45782_CVE-2024-56737.patch \
            file://CVE-2024-45780.patch \
            file://CVE-2024-45783.patch \
+           file://CVE-2025-0624.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

