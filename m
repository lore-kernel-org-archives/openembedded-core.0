Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4614C28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:37 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.4569.1741809390050761393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OI9PGB2U;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22185cddbffso25467555ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809389; x=1742414189; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgSYaY5zmafAx0lOv/DyDCE5B4m05JkbJmAXZve20TQ=;
        b=OI9PGB2UveuQi9OGK2vN+fZchkwlniHKxpQiizSv/f5Y7mTeikkjPj2cCMhQjChm1d
         LVOk12voV/4ofYyAGSpT9Dlxo9jGCT9sFOmFeAlq+0gZWnAbUChcSzJXfZntoiQfiiKU
         7L+c+a5Y+UGc0Jpt7z43F/Ou85jmEwMSKUwUVViLjUBhDOFAimAh53LyVHUAb7B6Mf/h
         HXR3t4/aziawkLjx96E27HR1hxjb4+dmlYYs7uH2nSy3nLwyv/ZXrL0BYZubgS8LbQSs
         yuCGeUOp0jQDsl+TylSQU+S3/GtPrRXuloI9ba62Pvl7SFQLdOtrKwG/yAi+Ix6IKHX8
         N8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809389; x=1742414189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgSYaY5zmafAx0lOv/DyDCE5B4m05JkbJmAXZve20TQ=;
        b=bNTB79iHEBLnQStLH7F+BD1ep1AGlgVQaGRKpNpBSL0G39EjTWu2R9JIBg1Rg3MSws
         rQ/J/Xc7rJrsHy6VHj/DYN1ikMM/UTyONq0Avwyhk+HdBdxM39K82ATKx9SQCKMYJ7gd
         SNP5iTtCZoDl9fzbPPmTzAIDQjwKJXhbQrKput2urwbt/VYs8qBTMt1S5raINacZ/7JA
         lAtevdQEuGKeK4Vrzj05DYXZ26P7nwvBIodk1RFyh3OD/0Eyl9Uq2/ll7pficodCbQ6V
         /TZodZ2jdvPSVaekSSOE9DF+khrPM0DfFITfO0/n4sdjI1cbYmoPCAbljtlonFRqeFX3
         IiiQ==
X-Gm-Message-State: AOJu0Yy0ZcSu/IAxtYOit2/Tf/6eXwhNr7IUxLITO1GMhYrxgqr/mhKr
	UCAJ4ZAgR0rv3zcXMG5j49lIEPe9RiUjutsbTaMN/6VF/0Bi5Tl1igaBTlI3Je4JnmRSlVGut+l
	w
X-Gm-Gg: ASbGncsoY3NXuA8G6aQfagVHDbFHPwJkclaNoCoUecSSu/HYzAOoVHqW+m/TNeE6t6S
	yMGptaZ6yjahp9iQ4nznsrKPuqX2fDQIvtiUz7YHy35ejuh0vtb0LPdgvssRbvMKIb7yhb6j9OU
	A31TeFBLm87Ut0KT9cJk5Y9/7lpehHKf78Ducw+HX3nCYsx/V8vWDOpTdoIKvu5MNnpwAt0R10y
	CdqKbI6qC9WDgCYv3nxwf/LaurmYqFxa3oeAHWBDNaivkzkoxGjdf3bZZ8+AkxxLzz/+x5RkIpV
	y8VLwZrjUVKRkR3YvpdtVg/Co/M85WtXFVc=
X-Google-Smtp-Source: AGHT+IFosjis9aM4hr2bBRkvPViCSLNFCMWlVZFCwngZKlOXDf2lWnWII/xX7VAnuCBxJoscM+QRjQ==
X-Received: by 2002:a05:6a20:8425:b0:1ee:ab52:b8cc with SMTP id adf61e73a8af0-1f5ad6a3937mr968404637.21.1741809389178;
        Wed, 12 Mar 2025 12:56:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/28] grub: patch CVE-2025-0678 and CVE-2025-1125
Date: Wed, 12 Mar 2025 12:55:42 -0700
Message-ID: <d96bf8ec82ed07c006167e15f7aa0d5e81440977.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212715

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
index f34b5ee50e..7c83febaa2 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -36,6 +36,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-1118.patch \
            file://CVE-2024-45778_CVE-2024-45779.patch \
            file://CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch \
+           file://CVE-2025-0678_CVE-2025-1125.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


