Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76171C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:17 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.4553.1741809369519533637
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z3AMqrPH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fee4d9c2efso487140a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809369; x=1742414169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=865OxS4PJJAuWoe+pExYnv5PJfKYIw4ILtsLOC++dIU=;
        b=z3AMqrPHsErhI3Pv9X20hQOl4ONk+SFaF9uA0u5Zz2z6SoB7OGVNbz3jWpzQimgwed
         iGNckkVx1vvqMN6MW4oUzR63VhXlb/UjcUxN+iE6vKav9KjFsO/DWFkHdED/16UN+zrf
         8CpbrfqhyC5LlEdDBDJQ25EfJIXig3qYi6bkkV7ttfGNyXAVk6Jx1VL4ut72YEu8ZM2N
         BRYfkhy4SwxoOjWxMCzAt0OefvcV4rZxnsrWcoExgAL7Dkv78Du/he+Kg0IAIRfw6DgU
         F6MWvLagmd0E77iCWTfq2ylJxVMj93Hiho1rCAaGQw5C7RapwQA8N89AqU3zUL9g9h9m
         TVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809369; x=1742414169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=865OxS4PJJAuWoe+pExYnv5PJfKYIw4ILtsLOC++dIU=;
        b=SSGpbxgvPXHYvsBFDqlL2CB3VYut3KA0JKqWQwEZ9nGPGw2W42NMUkCZwCmee/GfFt
         DfRIdJGZlX1X3mDfTnYwNkQFEMwxxJ8oPheZYZJRHhIvDRlerRVrsDoPm6wksqBb0muB
         tm/hZMl6G5M7O6lck9nTD/LKMD9z1XmnZs/NZgX/qoHgGK5leOFL+kLPDKSyI5ZwTnpG
         vz0r57QlZ9WTxKNWaZMdDqWRsJ78s2X/OHz9Jr81dEuksmXP2jCYQ77F0olIE27m08rf
         wmlPCGQicBTzVcDDV8g4KauoU23GIg7gSUZJMHrL+GWNpaZZBuLjwjzV96AncivQpvBt
         wACQ==
X-Gm-Message-State: AOJu0YyOhkCyJqW2Xi5yUQcBHcvZ35ygCXX/wNqkg3mdITddnTZAJTTC
	IdpaadDJUk5e2zdTLB74P5S36btbYv3L9YbcLs1+INovZwBUv0TYEj2V2IfHqvdL4dX4bDxEMgP
	s
X-Gm-Gg: ASbGncshxkK5vJGLaTdMJXNdDLENPHyVH9xRs86cBMq35ID5a5oe4y4NBanto6Yi7mY
	MJMbSnNozOoU2VBFHxhPjLqM23j1t1fRR4/xc0xk3i/Ta6j+yERrcrEPYisv5qE3IGWT9gw+POq
	/X2VszGWcxt83NxfydpVQMQP03COSe/ouoQHz3t/ldec5pLLSfKFmgxDT0dsSmTA3ytOO5s/uSL
	i5cDP/ZYXNunP1UoIY0H9ZdQHfYQ41Vh8ZY5wtiSMx1tJuyZxeWqUHEkWvUGbOz0Dph3sR2atb7
	v06W6WoYC8lTCte5MVxKDkCOPIH+KgRX6Lk=
X-Google-Smtp-Source: AGHT+IFYBs+rEws3kXv/rwTTk77aR/5rAAt9X9vt3393IJo91b8CZ0kJhs4yU4/tDmgNHmXLRcHoXw==
X-Received: by 2002:a05:6a21:730a:b0:1f5:72eb:8b3f with SMTP id adf61e73a8af0-1f572eb8eaamr23339696637.24.1741809368736;
        Wed, 12 Mar 2025 12:56:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/28] grub: patch CVE-2024-45782 and CVE-2024-56737
Date: Wed, 12 Mar 2025 12:55:29 -0700
Message-ID: <61268080ba160a4965873ba5aad6ebbfd1ee2fe1.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212702

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning these CVEs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../files/CVE-2024-45782_CVE-2024-56737.patch | 36 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch b/meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch
new file mode 100644
index 0000000000..41cc025b81
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch
@@ -0,0 +1,36 @@
+From 417547c10410b714e43f08f74137c24015f8f4c3 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Sun, 12 May 2024 02:48:33 +0100
+Subject: [PATCH] fs/hfs: Fix stack OOB write with grub_strcpy()
+
+Replaced with grub_strlcpy().
+
+Fixes: CVE-2024-45782
+Fixes: CVE-2024-56737
+Fixes: https://savannah.gnu.org/bugs/?66599
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45782
+CVE: CVE-2024-56737
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=417547c10410b714e43f08f74137c24015f8f4c3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/fs/hfs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/hfs.c b/grub-core/fs/hfs.c
+index 91dc0e69c..920112b03 100644
+--- a/grub-core/fs/hfs.c
++++ b/grub-core/fs/hfs.c
+@@ -379,7 +379,7 @@ grub_hfs_mount (grub_disk_t disk)
+      volume name.  */
+   key.parent_dir = grub_cpu_to_be32_compile_time (1);
+   key.strlen = data->sblock.volname[0];
+-  grub_strcpy ((char *) key.str, (char *) (data->sblock.volname + 1));
++  grub_strlcpy ((char *) key.str, (char *) (data->sblock.volname + 1), sizeof (key.str));
+ 
+   if (grub_hfs_find_node (data, (char *) &key, data->cat_root,
+ 			  0, (char *) &dir, sizeof (dir)) == 0)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index bace594ac4..8146ead5db 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-RISC-V-Restore-the-typcast-to-long.patch \
            file://0001-misc-Implement-grub_strlcpy.patch \
            file://CVE-2024-45781.patch \
+           file://CVE-2024-45782_CVE-2024-56737.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


