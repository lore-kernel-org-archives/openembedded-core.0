Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BB8C28B2F
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:19:03 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.17455.1741717135201239395
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LjZFxraA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250311181853c845cb0c4ae44a3905-ka72v4@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250311181853c845cb0c4ae44a3905
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:18:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=92JEta+yzPZGk2yXh3F7jtnw3LQDAxgSSybGqzvyzr4=;
 b=LjZFxraAawCrGDZ0VPcGm/HbwQ0GLvIHQKpCt9nih7iE7SI5x6PmR5LvotPVUSyOuR78Qf
 DqGrj0ehvLgXnxNIl+azOK9Gn50PCOQYUEFd+uHBWtPfBvMhJ39vz5ds3qA05qOt4AsrHb4/
 vd43X1MtJfSu6sPtYuEGkuSey1cwxTqQk4q+tVnriXb3pOkv8NONRXe64+wxVdTe0C8B/3BB
 gRilLTm9RguSjhXFjMCe9GCueMB1xHT2DUJq1N3sM541op6IX56xpvDJGu/vkTUF7G6s427J
 qjO7Hwecd9whnhEbgn1cq5w3ROa9ODc6PbLNfpbaWnXmtwyzXV/Pao/g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 07/17] grub: patch CVE-2025-0624
Date: Tue, 11 Mar 2025 19:17:15 +0100
Message-Id: <20250311181725.8986-7-peter.marko@siemens.com>
In-Reply-To: <20250311181725.8986-1-peter.marko@siemens.com>
References: <20250311181725.8986-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212619

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
index 604c2fe568..9e037e953e 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45782_CVE-2024-56737.patch \
            file://CVE-2024-45780.patch \
            file://CVE-2024-45783.patch \
+           file://CVE-2025-0624.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

