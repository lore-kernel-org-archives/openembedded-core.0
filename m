Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37016C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:53:17 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.4678.1741809189351751295
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2hcKBrkQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fec3176ef3so491633a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809188; x=1742413988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Il07PQ+saXp+RmnavAOmIYx/jW1VFaYcSA5j+lwiyE=;
        b=2hcKBrkQ6tvm8eVae6V4zSaABoK4ULMKTzU0uke3dVayQ5PXoXlmOfEukI4XWkTlle
         i+EQvtnSbkDwcexhhP/QMAk4EpIG67B2JF0mUMrRiqHtLRoEgC3ZS8lVHasHPH6L9Lj3
         XGhPncGof7J95P15aqX7wi9F9Ow/Hn1dv0r1+FGlOw/7x5ek9HSMyaTiDUTdhLEY0hHx
         7wdckRaC6yhOhzw0+GFari7im1e3qmYZOOI653vhTV+PAd7dGfXuiyGgOoxM3ybH71zE
         nuTE1iQLMp6S9h9pbe+7LR/CfP8fwC7fkC3fT+zwLFovlGoU7IKlo5sgQWORJkrY/su2
         ThdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809188; x=1742413988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Il07PQ+saXp+RmnavAOmIYx/jW1VFaYcSA5j+lwiyE=;
        b=Os1DqOBOMyCLDupm0CiwC08KbW9gJ2+pqY/BWACe3xuoZSYOg7lE9Tfdnaw/hT6eUO
         //lswHXv7kinEfc28P24kWTIQ85DQ9aF746oewgXT8AXW7IyvXBeh3z4pbK6dKM1A4mi
         nxtDRUda9ykhi9eBE8hzE3KJfnvBnUQ2FRHHd1B5A3hsQDRpe6nMKx+z4BLdTg1+Ed6C
         TRs4+CRhuOsSB47rzV8IPZ4uY6EI/XZFHJoBd0bViwNE+MpqJsWfUwhQBcQMDa5dZ7Nb
         PBbXOM1/u3LJULIAEFrDyWqOgqzlQb40bPOBO8mNNMQLO2ySLNLkos3iytNKwfT4Wi7R
         JfwA==
X-Gm-Message-State: AOJu0YxzYifKC/TOzurmqAc4pg9inLJFP+ECsvYVoFjUPgG5EUxV+79y
	6UefMVVMt2bQc9slXaek4eps4H1VFnCiO8n3d6NTfbINbQA/UL5LmqBVrYEPWQaoGk0T7E1/Pfh
	k
X-Gm-Gg: ASbGncuouXUP/rpO9F/RZaWBn4NBJmTPp/VNI/dq7YKdLKd8GQAL82DXuNpudU7rapF
	9TFrjJxeO9G1UMUcdyQOeaHoXDbRxoaFADRR16ACgV47Fw/7YmSA8Z79tHNcGBZe6YCzbRtJDLD
	to4yx/excaBd3mCzjrHfGSRk72yAq3YSSIuHZA0UCU9Wp41+xfdHwYGBO1xJMkQPxAhq1+CvglA
	7HURXeZ9jII0vRr/YI1bC93jqagmVHPIsqcupgbk2Z27bYigHLwZ9cofMnxKhjoY+bjNb2kSDVH
	k3aBGyF5Iq7w35vzJlFlvIu8b3CHy/dS+ag=
X-Google-Smtp-Source: AGHT+IFjlV5E1gDdn3YBqOy1hHnkB++u5/ArbeYx5xSUvCH/mNqW78AlffxPvRzD6Br8UPpwi1pviw==
X-Received: by 2002:a05:6a21:6915:b0:1f5:837b:1880 with SMTP id adf61e73a8af0-1f5837b19edmr18236545637.23.1741809188501;
        Wed, 12 Mar 2025 12:53:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.53.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:53:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 19/25] grub: patch CVE-2025-0678 and CVE-2025-1125
Date: Wed, 12 Mar 2025 12:52:27 -0700
Message-ID: <d0283e421e41b6775f40a51de6018c2c5cfda61f.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212686

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning these CVEs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


