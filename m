Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AAB0C19F2D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 20:35:06 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.8722.1660422904740592503
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 13:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L77tqrJd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id q30so4648556wra.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 13:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=HH4iRuQ+HK+qfyubj5jcUmwzn4FBH7IHI+7FcrmdOdo=;
        b=L77tqrJdb0JtTWtPN9OA9afD5ozcUUmWJIgjtTzpe0mox8Rkb3Su0m6NgaJWJVi9aD
         V6+EK1ri2fWVe9LtjaeC0T1OoU+QyKtzn466vMc0KCypPCk8A+AnrROyJ1Tmst/Exrq7
         q/qvpNHfj801Ml69HUndORCOFD+KuRkkvawiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=HH4iRuQ+HK+qfyubj5jcUmwzn4FBH7IHI+7FcrmdOdo=;
        b=ljQRKGg31g8cLuDtUPwBbgiOQzgxNqTHgUOi5LJiG6Y3bbV9zMDBADuDtzYDJH56jL
         C9GrdU6GQolrZOyLadVBTAEYnX14KqGjNzcpKWC7+yEQEGbVv1cBo6q0XqcCY6d4Q/zR
         tjih9Bcr4tAys4Pv5SqH+OLLfP3RpfMFZpmj6EoVT04SIcW20f4XFT/32uAVDIxydy1j
         dRI3THXcMf7pqwLPOXvVRTEGzYfeRCkIFU+ENAnW6pTjhSJTKb8AX8QdEOujs227z48e
         F8XJ387eZ/t/ul5JW9EvJDc6gnZzaY/YQ2iE+9rDWVf2G93eUPgHCAZdDNexibVPxV5H
         PwRQ==
X-Gm-Message-State: ACgBeo0XUdms1Kc2+tnqa5iBiQV5279C7NG3KE0oRsY479d2Mr+fyCa+
	SYoTVD2FO3tiqxCgY8MqNrFtkcr7MNTHiw==
X-Google-Smtp-Source: 
 AA6agR6N/uk46DgFkE8c+BJAdhOCmt6X0vb6Xg0XgQK5+rmaXFCC4wdND/OxFzxtobNyMlVHC+Pq4A==
X-Received: by 2002:adf:e5ca:0:b0:21f:15f2:9894 with SMTP id
 a10-20020adfe5ca000000b0021f15f29894mr5223486wrn.115.1660422902471;
        Sat, 13 Aug 2022 13:35:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f6d8:ef31:d475:da8f])
        by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c4f0e00b003a1980d55c4sm4182050wmq.47.2022.08.13.13.35.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 13:35:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] gcc: Resolve relative prefix-map filenames
Date: Sat, 13 Aug 2022 21:34:57 +0100
Message-Id: <20220813203501.1111519-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 20:35:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169313

Add a patch to gcc so that relative paths are handled by -fdebug-prefix-map
and friends. In OE we use relative paths in autotools and removing that
creates a lot of issues we'd have to fix. This alternative allows us to
fix the paths within gcc and improve our debug file coverage (and SPDX
manifests) accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-12.1.inc        |  1 +
 .../gcc/gcc/prefix-map-realpath.patch         | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch

diff --git a/meta/recipes-devtools/gcc/gcc-12.1.inc b/meta/recipes-devtools/gcc/gcc-12.1.inc
index 56678c78bef..c42fa3d72f0 100644
--- a/meta/recipes-devtools/gcc/gcc-12.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.1.inc
@@ -65,6 +65,7 @@ SRC_URI = "${BASEURI} \
            file://0025-Move-sched.h-include-ahead-of-user-headers.patch \
            file://0026-rust-recursion-limit.patch \
            file://0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch \
+           file://prefix-map-realpath.patch \
 "
 SRC_URI[sha256sum] = "62fd634889f31c02b64af2c468f064b47ad1ca78411c45abe6ac4b5f8dd19c7b"
 
diff --git a/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch b/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch
new file mode 100644
index 00000000000..137fc645624
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch
@@ -0,0 +1,46 @@
+Relative paths don't work with -fdebug-prefix-map and friends. This
+can lead to paths which the user wanted to be remapped being missed.
+Setting -fdebug-prefix-map to work with a relative path isn't practical
+either.
+
+Instead, call gcc's realpath function on the incomming path name before
+comparing it with the remapping. This means other issues like symlinks
+are also accounted for and leads to a more consistent remapping experience.
+
+Upstream-Status: Pending [need to see if gcc developers would accept this]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+
+Index: gcc-12.1.0/gcc/file-prefix-map.cc
+===================================================================
+--- gcc-12.1.0.orig/gcc/file-prefix-map.cc
++++ gcc-12.1.0/gcc/file-prefix-map.cc
+@@ -70,19 +70,25 @@ remap_filename (file_prefix_map *maps, c
+   file_prefix_map *map;
+   char *s;
+   const char *name;
++  char *realname;
+   size_t name_len;
+ 
++  realname = lrealpath (filename);
++
+   for (map = maps; map; map = map->next)
+-    if (filename_ncmp (filename, map->old_prefix, map->old_len) == 0)
++    if (filename_ncmp (realname, map->old_prefix, map->old_len) == 0)
+       break;
+-  if (!map)
++  if (!map) {
++    free (realname);
+     return filename;
+-  name = filename + map->old_len;
++  }
++  name = realname + map->old_len;
+   name_len = strlen (name) + 1;
+ 
+   s = (char *) ggc_alloc_atomic (name_len + map->new_len);
+   memcpy (s, map->new_prefix, map->new_len);
+   memcpy (s + map->new_len, name, name_len);
++  free (realname);
+   return s;
+ }
+ 
-- 
2.34.1


