Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE05C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:55 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.6925.1645799274954503757
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=sfKGzLAX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id t14so1864772pgr.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oe5Oa5nkex5THWKsGDQRT7l00B/23k/RrVBbkJUUlEU=;
        b=sfKGzLAX9wI/T+pPnPiPg772wr3DRbYVZifMG5iy15Fk36iK353rVYFKRs45OuEeUy
         +KM5n+sFgdTuAD/u4O30nPmmNubKqPi6U/QEvLtMTUU3wxFBn0Es5XAL7fBJ4mkFedG+
         ScxkOAG2nTpMK3xQie3QW2wxIuu1vI5Ak3diIH2tsteokJmNTWF/PzmWYS9awEic2Amv
         kXQaP9TG3JuFtf6YU/CariZzTfGOVk965FxKAemrxSlDUUz+10m3fVdbdAAbmXAKb3zX
         aCg+WG/lht9kWGv7JazgUvGgdLAhbrUZVQdktGE37w0kD3IybBzg2rLXrKFaWnopT8y9
         KoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oe5Oa5nkex5THWKsGDQRT7l00B/23k/RrVBbkJUUlEU=;
        b=vn25En8BSbNhONxdouO/85UljFJrV8udCWFwTAgkrXU1n2OGgzLCGOpqr/P8ENlZE9
         0z9lDiGJugI7Ncnkd0hXeEQzmiv5CklbqIg99Yt0WpNld3Td+iREPFMRzteFFiSO0n4s
         KFyynO8WbUMKYsKtUpWW0ffarnJ9BoQo7k1ZkfVZKBjsSdwt8KWk2LP2ajEzG3pkpJc3
         qXsv18t83/WMBCTnkoGz8v6Pmch/ii1fB7d8E23ruE4K8DSow+ES5ZigwjGiR5ciEY3L
         tJGIWVojUTTDNTN+WZ7cpn2MePwXUST+OVgJW3Vh9gZJD/SXkR40QghncY6gso6YLArV
         NahQ==
X-Gm-Message-State: AOAM530RTkRt6XrbIZIgwGic1R3UWXgZI47FBPYHUzLBsNRmjuNM0JFm
	7QmY+AI2hcaaHXlrEzZlIbbm0oxWcjj4QL3z
X-Google-Smtp-Source: 
 ABdhPJwKx8qO2ZZGaToV06L14dVEAdaRRqSR9t0xNWHBUI43lZmrc4aPSHo8Y5nalVu15amzdYkkRw==
X-Received: by 2002:a63:d74f:0:b0:374:5bda:909d with SMTP id
 w15-20020a63d74f000000b003745bda909dmr6252538pgi.215.1645799273929;
        Fri, 25 Feb 2022 06:27:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 29/50] grub: add a fix for a memory leak
Date: Fri, 25 Feb 2022 04:26:09 -1000
Message-Id: 
 <95d61effb17a6f11abbaec6ba48cb3fa4926efb0.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162375

From: Marta Rybczynska <rybczynska@gmail.com>

This patch fixes a memory leak in grub's affs. It is a part of
a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../files/0025-affs-Fix-memory-leaks.patch    | 82 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0025-affs-Fix-memory-leaks.patch

diff --git a/meta/recipes-bsp/grub/files/0025-affs-Fix-memory-leaks.patch b/meta/recipes-bsp/grub/files/0025-affs-Fix-memory-leaks.patch
new file mode 100644
index 0000000000..435130516c
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0025-affs-Fix-memory-leaks.patch
@@ -0,0 +1,82 @@
+From 929c2ce8214c53cb95abff57a89556cd18444097 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 26 Nov 2020 12:48:07 +0000
+Subject: [PATCH] affs: Fix memory leaks
+
+The node structure reference is being allocated but not freed if it
+reaches the end of the function. If any of the hooks had returned
+a non-zero value, then node would have been copied in to the context
+reference, but otherwise node is not stored and should be freed.
+
+Similarly, the call to grub_affs_create_node() replaces the allocated
+memory in node with a newly allocated structure, leaking the existing
+memory pointed by node.
+
+Finally, when dir->parent is set, then we again replace node with newly
+allocated memory, which seems unnecessary when we copy in the values
+from dir->parent immediately after.
+
+Fixes: CID 73759
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=178ac5107389f8e5b32489d743d6824a5ebf342a]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/fs/affs.c | 18 ++++++++----------
+ 1 file changed, 8 insertions(+), 10 deletions(-)
+
+diff --git a/grub-core/fs/affs.c b/grub-core/fs/affs.c
+index 220b371..230e26a 100644
+--- a/grub-core/fs/affs.c
++++ b/grub-core/fs/affs.c
+@@ -400,12 +400,12 @@ grub_affs_iterate_dir (grub_fshelp_node_t dir,
+ {
+   unsigned int i;
+   struct grub_affs_file file;
+-  struct grub_fshelp_node *node = 0;
++  struct grub_fshelp_node *node, *orig_node;
+   struct grub_affs_data *data = dir->data;
+   grub_uint32_t *hashtable;
+ 
+   /* Create the directory entries for `.' and `..'.  */
+-  node = grub_zalloc (sizeof (*node));
++  node = orig_node = grub_zalloc (sizeof (*node));
+   if (!node)
+     return 1;
+     
+@@ -414,9 +414,6 @@ grub_affs_iterate_dir (grub_fshelp_node_t dir,
+     return 1;
+   if (dir->parent)
+     {
+-      node = grub_zalloc (sizeof (*node));
+-      if (!node)
+-	return 1;
+       *node = *dir->parent;
+       if (hook ("..", GRUB_FSHELP_DIR, node, hook_data))
+ 	return 1;
+@@ -456,17 +453,18 @@ grub_affs_iterate_dir (grub_fshelp_node_t dir,
+ 
+ 	  if (grub_affs_create_node (dir, hook, hook_data, &node, &hashtable,
+ 				     next, &file))
+-	    return 1;
++	    {
++	      /* Node has been replaced in function. */
++	      grub_free (orig_node);
++	      return 1;
++	    }
+ 
+ 	  next = grub_be_to_cpu32 (file.next);
+ 	}
+     }
+ 
+-  grub_free (hashtable);
+-  return 0;
+-
+  fail:
+-  grub_free (node);
++  grub_free (orig_node);
+   grub_free (hashtable);
+   return 0;
+ }
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a660c069db..13e2b1600d 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -71,6 +71,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0022-zfs-Fix-resource-leaks-while-constructing-path.patch \
            file://0023-zfs-Fix-possible-integer-overflows.patch \
            file://0024-zfsinfo-Correct-a-check-for-error-allocating-memory.patch \
+           file://0025-affs-Fix-memory-leaks.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


