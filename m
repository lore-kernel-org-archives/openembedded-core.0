Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE20C28B2F
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:16:03 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.17578.1741716951276213823
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ZAEYRVi/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2025031118155330b0bdf91597a5e038-sbdrwm@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025031118155330b0bdf91597a5e038
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:15:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ZCEgxF6rDIuU+7bW4XD0tZ1HzT8lQojVUBHXVGdlSHM=;
 b=ZAEYRVi/y+yokHhjxaudmUri7jPCP9lFz5LUuzrK8tskf7YAdJBuDi8pZUpEuYccPJFdrQ
 atyd6wzfBfd/k1xnt5Vx8UZ4y6IQNqvloEgnyYPWed/lSUvfJv7e72Kn9xe1QqgpvexGPTIm
 rMwdxgxGfVBF5daOykzTLjdhF8ue/6RibMfwyl2i9tZQ17FDMlaDL1yC1wE7jLXakKXHIs8i
 ZeGC0o1C+6rBTnjLdOF4l2puLrNm5bk6Xj80TWnvkvTsjvTncjjpUSmCgUCEt2UecZyuLuH3
 hyrV00QD5EyJRLjuPP8tdr9R5UpFy8/p4umgf4F4peNz1umPyTazJRdA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH 17/17] grub: patch CVE-2025-0678 and CVE-2025-1125
Date: Tue, 11 Mar 2025 19:14:24 +0100
Message-Id: <20250311181424.8837-17-peter.marko@siemens.com>
In-Reply-To: <20250311181424.8837-1-peter.marko@siemens.com>
References: <20250311181424.8837-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212612

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning these CVEs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../files/CVE-2025-0678_CVE-2025-1125.patch   | 87 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0678_CVE-2025-1125.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0678_CVE-2025-1125.patch b/meta/recipes-bsp/grub/files/CVE-2025-0678_CVE-2025-1125.patch
new file mode 100644
index 0000000000..14e67cf35b
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0678_CVE-2025-1125.patch
@@ -0,0 +1,87 @@
+From 84bc0a9a68835952ae69165c11709811dae7634e Mon Sep 17 00:00:00 2001
+From: Lidong Chen <lidong.chen@oracle.com>
+Date: Tue, 21 Jan 2025 19:02:37 +0000
+Subject: [PATCH] fs: Prevent overflows when allocating memory for arrays
+
+Use grub_calloc() when allocating memory for arrays to ensure proper
+overflow checks are in place.
+
+The HFS+ and squash4 security vulnerabilities were reported by
+Jonathan Bar Or <jonathanbaror@gmail.com>.
+
+Fixes: CVE-2025-0678
+Fixes: CVE-2025-1125
+
+Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0678
+CVE: CVE-2025-1125
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=84bc0a9a68835952ae69165c11709811dae7634e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/fs/btrfs.c       | 4 ++--
+ grub-core/fs/hfspluscomp.c | 9 +++++++--
+ grub-core/fs/squash4.c     | 8 ++++----
+ 3 files changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c
+index 0625b1166..9c1e925c9 100644
+--- a/grub-core/fs/btrfs.c
++++ b/grub-core/fs/btrfs.c
+@@ -1276,8 +1276,8 @@ grub_btrfs_mount (grub_device_t dev)
+     }
+ 
+   data->n_devices_allocated = 16;
+-  data->devices_attached = grub_malloc (sizeof (data->devices_attached[0])
+-					* data->n_devices_allocated);
++  data->devices_attached = grub_calloc (data->n_devices_allocated,
++					sizeof (data->devices_attached[0]));
+   if (!data->devices_attached)
+     {
+       grub_free (data);
+diff --git a/grub-core/fs/hfspluscomp.c b/grub-core/fs/hfspluscomp.c
+index 48ae438d8..a80954ee6 100644
+--- a/grub-core/fs/hfspluscomp.c
++++ b/grub-core/fs/hfspluscomp.c
+@@ -244,14 +244,19 @@ hfsplus_open_compressed_real (struct grub_hfsplus_file *node)
+ 	  return 0;
+ 	}
+       node->compress_index_size = grub_le_to_cpu32 (index_size);
+-      node->compress_index = grub_malloc (node->compress_index_size
+-					  * sizeof (node->compress_index[0]));
++      node->compress_index = grub_calloc (node->compress_index_size,
++					  sizeof (node->compress_index[0]));
+       if (!node->compress_index)
+ 	{
+ 	  node->compressed = 0;
+ 	  grub_free (attr_node);
+ 	  return grub_errno;
+ 	}
++
++      /*
++       * The node->compress_index_size * sizeof (node->compress_index[0]) is safe here
++       * due to relevant checks done in grub_calloc() above.
++       */
+       if (grub_hfsplus_read_file (node, 0, 0,
+ 				  0x104 + sizeof (index_size),
+ 				  node->compress_index_size
+diff --git a/grub-core/fs/squash4.c b/grub-core/fs/squash4.c
+index f91ff3bfa..cf2bca822 100644
+--- a/grub-core/fs/squash4.c
++++ b/grub-core/fs/squash4.c
+@@ -816,10 +816,10 @@ direct_read (struct grub_squash_data *data,
+ 	  break;
+ 	}
+       total_blocks = ((total_size + data->blksz - 1) >> data->log2_blksz);
+-      ino->block_sizes = grub_malloc (total_blocks
+-				      * sizeof (ino->block_sizes[0]));
+-      ino->cumulated_block_sizes = grub_malloc (total_blocks
+-						* sizeof (ino->cumulated_block_sizes[0]));
++      ino->block_sizes = grub_calloc (total_blocks,
++				      sizeof (ino->block_sizes[0]));
++      ino->cumulated_block_sizes = grub_calloc (total_blocks,
++						sizeof (ino->cumulated_block_sizes[0]));
+       if (!ino->block_sizes || !ino->cumulated_block_sizes)
+ 	{
+ 	  grub_free (ino->block_sizes);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a9d55ba015..820a30c6c2 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -35,6 +35,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-1118.patch \
            file://CVE-2024-45778_CVE-2024-45779.patch \
            file://CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch \
+           file://CVE-2025-0678_CVE-2025-1125.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

