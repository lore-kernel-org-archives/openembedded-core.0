Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787BCC433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:45 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.8976.1645178804530531623
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dpm7jTOf;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id m27so1843951wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EN/Si7yw7eYL9s5CnCOw/Ow5dn9/jmpJuHS+Pw/l1zg=;
        b=Dpm7jTOfWDc7WJhLw3x+0CPFYH9CXFIBBBG5Zc/n7z1/Y/AO6Yz4C0ZoIqKNrn4+/j
         cb3nKw0dunMSoqFe0lvRAzItNfftihcrYuAUjurL8zOnVOI+6BeXZMqev4xdO5dhzrTR
         pO6yfZ8mRQLImKrnzcnHwsiOAeAofN4kPClEGldL4xv2AhhkMN+dMVqbAMZbGsBHZr+k
         mmLErW39IhJJpcko7u4KZ7YfYqOg2FSNiIQZMc2n/a2iMZoK5RGrJO/bR0pdXFMiuToq
         colvvJIAtve7YgETZogGPGS7pju6ef/lsxkVVVwHTEf0pOCNQfzTIl0/7e48JHGBqWFK
         K2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EN/Si7yw7eYL9s5CnCOw/Ow5dn9/jmpJuHS+Pw/l1zg=;
        b=GWZbiJlaj1WtzZRg4kYC7227d/Z+goJBhXFtv0uQkm/5pXvokmNP54vj4biSbTePuW
         +9sN94SFbPJj3f/AgTJfOgspty4puINygEuo+peIGHQ1JVRVwEGTnEPz9Pul0hKP2mVc
         Q8RJjiYXcdf2NO8nOWv27zN+k0wPf2sHsRijzl83xMHqpf3H9URhiWk+vXp+GIq3nGt7
         RuAg+8rWWahZ4UOLy197itJSt+ga9iri7EZ69jUuIkgUExqv30hylL3844E7uR4xUmAD
         5367SQKdc95Td6lbCpjJ/3WXV5HrnLirZdLp1sN/WlzWURczRW3/EGSXGoBS3Lg4pM3x
         QkMg==
X-Gm-Message-State: AOAM533ZvbnAqvoOasfKs+nMemrXVTUlR/pQjKvpsldfgNPNKectTXVD
	z+HFVlpyXpDrInEzakbr/1Y=
X-Google-Smtp-Source: 
 ABdhPJwT6Giq22aZzZJk2HRjAyuZmRstqA5GQWgGRaoBlhZOLbp5RTroWrszdvuL+Ukami+KxGB3Gw==
X-Received: by 2002:a5d:680c:0:b0:1e4:2d98:46fe with SMTP id
 w12-20020a5d680c000000b001e42d9846femr5602713wru.411.1645178803030;
        Fri, 18 Feb 2022 02:06:43 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:42 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 25/46][dunfell] grub: add a fix for a memory leak
Date: Fri, 18 Feb 2022 11:05:33 +0100
Message-Id: <20220218100554.1315511-26-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161913

This patch fixes a memory leak in grub's affs. It is a part of
a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
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
2.33.0


