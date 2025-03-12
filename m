Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A7FC35FF5
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:27 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.4764.1741809386403064878
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=X9pIMQSK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2239c066347so4677585ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809386; x=1742414186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OO+MqLQvTB6vyzMl1J0lxHzxYWly6GZ6GSOjUZWomeQ=;
        b=X9pIMQSKdR6cTCzhiTT3uzatGe9IkpKXOjH/3Pg/zf7DPvY0EC8BrqA3gZUvHZkp91
         /ei5YuuKhF2A+M2KmFpXdj16fLhjl+AC3RmjlAFyYTieYAH3YrHCovHyB3wBlb41vs4p
         kv7YgTTOr/6mNpEj3WK7cZ6fOtLgiRDTvXJ5y9Rl+OmctXiRWM+7hapD3ht4j9QyO80b
         MjV9yvqrABVCGej9+/QFMmMGIbUeCpOvbdfdLbgvqs1H7M7hgFbBz5wYG9tTmC7Shie+
         3PxY73dp0PUOo/pZZLr3XF0QIXVsJGPHIAvAKD7iT6jSh6MzxzxaHEn5hzGwVoagj1yT
         QTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809386; x=1742414186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OO+MqLQvTB6vyzMl1J0lxHzxYWly6GZ6GSOjUZWomeQ=;
        b=FdU2OB86QPkyokBJeNAibKZ1Ay6tXeQFcvISky8Nzd14Go9kEe4J+RDPHQUsrKJmrS
         InMRrZ/z+TKofuAY9+0IhuXxuYSz0FWF58KvMhh1ZkfY+tQQk/Y6tN40pzXADyVNPHH6
         9TgCRJ+nXExHm7K+uOuAKmvr1SXpimNrqE5ly6Py4Vl7GI+ik1gLI5E0BlvC97oRoonS
         ogZvQTrCjDHvcKZXW/FBnijgz4D5cSZ7+f63YDp0Qtq0H1wcwoqBXG+LFyvNP8mcI2ED
         79yAdwjOUUqZLsbA2QsMz3IuBw5aVzZDpPvL9j0kQs1mzddUz+QHln5R6/72pxtCa32l
         lQ4w==
X-Gm-Message-State: AOJu0YxT3LfG9jEDH5IgbmVGITXfmVTen6PGxNVSmVR3b1p5vm52vtx6
	IO3VG4/DsvGioA0KrRvo5ygSDb3fpjv9/N1czLPWATYgffkCawMmxB5qNXJNad/3SzU6Hs2vd9G
	u
X-Gm-Gg: ASbGnctBeHWbrydr82R/dag8bo49Cwtz8dHCqvXRGQZ9zHqlkRsMgqXBDg0Dxd+LKae
	22N4Tfbdgm3VRSxZw3YkIFmj0Sj1wUshWNmof2EGGKAAnsEyYbmxBjG1l5AxP8m3gYjsYA+Wn3O
	2TedJHFOGkXmvzgWrH9lIV2vS+5o8Q+Hr4A9xH3KJ20XpaMM5mDh7RuDD7ngBZ4r/AtyP1s80EB
	diWpnDUOdV6cO2FDkoP6mKhLS4+5gBAsekczduL71fpoiyqIEFy7JmTPjvjbB/NpD2bvFJ0hpji
	v+VZ56DkhdUc5UrKi8rVHxLhF/Xg/tSFSeqfffV68b2rTw==
X-Google-Smtp-Source: AGHT+IHu52GPxTztgwxrizz5UiaxRx/atwYHhOtuo/PympDGZOv2UqP6IBAkOe2rHhchqVrnYnxCig==
X-Received: by 2002:a05:6a21:6011:b0:1f5:8714:8147 with SMTP id adf61e73a8af0-1f587149dbemr16938183637.23.1741809385649;
        Wed, 12 Mar 2025 12:56:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/28] grub: patch CVE-2024-45778 and CVE-2024-45779
Date: Wed, 12 Mar 2025 12:55:40 -0700
Message-ID: <eb9811ef2a38f1dcd4074eef6f809fd63e98454f.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212713

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning these CVEs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


