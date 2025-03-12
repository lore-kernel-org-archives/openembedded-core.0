Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD12C35FF1
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:52:56 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.4655.1741809169783199607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nZbZEGzn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so645790a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809169; x=1742413969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1LXAQ9jxRbwI8OLbIF1Xpo/Ak0F5Ux7TZ5l9vSbNJk=;
        b=nZbZEGzn8nmSD+hnb0Mn6gj/cuD10Y4nG7h2mNZAAxhdt7zGE5j6qFt9xThyiQfSgy
         bxUQq5xGjXIWQoEJbPMXGoFwGwt4FEPMiMv4cSKRi7WGYObL2DWUHgnH4ku3yyVcr4fm
         Yd8QpEQ1jRTLhv+D9u4NgCHDopnJ2TWXncjRRId/UAmBlfu5cT5+y3uxbwqJIswI8nbW
         f/xIFzmut75K0aJDBRiX72/FiDAWRyNx66XaY5+bd2y2tDBW3kgDZ0SEIcvNkR+0V5xg
         eB+wziUfjyWHwXA0QN25DxGCumRkRDO9g+9dEIHVQ4+/MyrI8MSQhyf1exZFlWc1C4mB
         5mgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809169; x=1742413969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1LXAQ9jxRbwI8OLbIF1Xpo/Ak0F5Ux7TZ5l9vSbNJk=;
        b=mDl/1UYHYw/DNhJbht3YOYvcb3TvrvX0Z5AqExv6vhwWJtg0pUE6PUyXeo7TIEsYdK
         x2ZRYHPGdEp1l7OuHbqnVqBUvaPdYR56i4Pbukjw/hOeJ27rBM+tkH7yC7q5Bbw33/ee
         VonRQnZkJOQdDy4VCeab/9DIuvGXdRXUgAMNGATRqE3o6aSN/yVXRcMDtDJNRCzbrnIm
         rH62g/PL0SZP02GpSv94mOdMxSwtZ/ZGeRRn23MhpAQ1PF76qNexS1GceK/5b/PKKtiC
         aPy46lo4cF3yFmWm9xE47dbGYdLE1A3HDTo7/5SF+4Mw60qnNlC+OmepK4Z5eqOBVgUs
         pjYw==
X-Gm-Message-State: AOJu0Yx3mCiOV9qdoazNEU7SZR3dz2IteUZIDNp5VDP3W+XJwbz8jSw+
	/3nA9Am8TV2OUIZIpLFr7FEQF7YKivfIkVK4EoYvzl8uicztKTRXoW8BZ75JYriSttDlZytdbcn
	H
X-Gm-Gg: ASbGnctYC99+ZF/Nql/QKiFRywSt11Ugi4xBnPKB08xj0XTPRNjJVVj08mMxbDyBsF+
	GGjK0Nt0Lj/ZrrELkHf0I/BX5BMToOutmaF6H/zG6LT8GJ9p2gmgP89CDg6F78WW1hzZOf4ecLF
	KwSYv4X0fDEV1NurOgxBzG7RW4Y1WRfZgQPzIhOVC1DtlIqhjfninVE+KHZ3qsLO2MFig4cm1dg
	xmyI2nOfcI7A1XHKxY9YE9S/Rg7YamrpbMYACezC315ipP8QSZN+LnvCNqqsUg1Lq8QxUIZ0yZ/
	BOiOyws/26qfFLc4iYYWQDz88cDmnAB7geO/baBw/GzV3Q==
X-Google-Smtp-Source: AGHT+IFqBrFi/J8ZxXci32qnQgau4kXs2c6ojTOjRt651ET2QMPHxjquVdixYCLPOjpiRFwagu2QvA==
X-Received: by 2002:a05:6a21:700c:b0:1f5:7df9:f13c with SMTP id adf61e73a8af0-1f57df9f412mr22603005637.41.1741809169060;
        Wed, 12 Mar 2025 12:52:49 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.52.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:52:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 06/25] grub: patch CVE-2024-45782 and CVE-2024-56737
Date: Wed, 12 Mar 2025 12:52:14 -0700
Message-ID: <3b497db0bff69c8e7a4f5466b155d1c84051cc59.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212673

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
index 58f4a6e181..f5112d773d 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-RISC-V-Restore-the-typcast-to-long.patch \
            file://0001-misc-Implement-grub_strlcpy.patch \
            file://CVE-2024-45781.patch \
+           file://CVE-2024-45782_CVE-2024-56737.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


