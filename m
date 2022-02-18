Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B188C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:07:00 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.9117.1645178819243963143
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VFd2Hvbo;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso6007369wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zAJGYlbDaghrJxEzT1FxRWRdsFh+wwqOK8JaI3+ofo0=;
        b=VFd2HvboBDnB/ySoY3R32Z5J86M22C+9K+UT+lWYqI1qNG9ELlnUvKD/rHCVRmhgaT
         018Lyv5fvI2WsBoGnIb462xDlUBlX2tdccBJiCBbqlTKVvDqmdJRaHE50btBBY8m7st2
         LXZzOQhsLRbGuOKHIWhlf7cRLqF2xFOoqVIQgXyBHB8x6xJhDyA3cjyBmvBW2FNf+UjQ
         mRAH2yq8UZ3Uv7O5Io4Rs1/hkDOSPY6zogPxY/AFFZSY6096hQdMSX8kpps8VG4r4gNY
         4WUmGaqrj1wm4cuq+HBz7NgWgMhdIt2Adn9tsTn0EY4Q8WK6t5V84Qkb2YWLZJby+ujo
         o2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zAJGYlbDaghrJxEzT1FxRWRdsFh+wwqOK8JaI3+ofo0=;
        b=EMqBRLRqJ1u2mBsnTmgyNJw3XgewAPABy/o79Zuxvfhqff5VlaNP9L+qK6OSAQ7E1R
         tVgyDmfGfbz7jY62ZwiD/2JRzbsknqkG8yTRC6N5BFWgm2RGlwXAujczcnvOOUkLPF3d
         vFmJ7YqUK1f46njFLIlO6KvzCQ7uyrC+mtkVubetR1DzqqNpzSAEpG1HarjvIsaSv3Vj
         IeYrx1qHS2zy0ZpkY0QuohiwtbGVLyz+SgnIf/ODllK+pDgTOUgzqWGRqY2jNfhcBMDB
         OL1SJ4YniAYUw5egkItETlTzVMjWhXoqTo+BZ8m7yuRp9zkCjnmaIR8SKxQipgm8RiMs
         7nIQ==
X-Gm-Message-State: AOAM531j9uK+hzuzAJkNXHzTMmUkhdJkqBD2WPSKcRQ1UwA3P9ofskD+
	erdSjlTiN67+FLxsPzEos0s=
X-Google-Smtp-Source: 
 ABdhPJyioJStvm/+d4nfPgvLDS3NWVHt+MC2h4yqjYJnkMNdBSq7xEV6qJnGgeQAeysFFIuRfIDudA==
X-Received: by 2002:a7b:c057:0:b0:37b:ebad:c9c8 with SMTP id
 u23-20020a7bc057000000b0037bebadc9c8mr9881770wmc.61.1645178817806;
        Fri, 18 Feb 2022 02:06:57 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:57 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 39/46][dunfell] grub: avoid a memory leak
Date: Fri, 18 Feb 2022 11:05:47 +0100
Message-Id: <20220218100554.1315511-40-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:07:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161927

This patch fixes a memory leak in grub's loader/xnu when an error is
detected in grub_xnu_writetree_toheap(). It is a part of a security
series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...driverkey-data-when-an-error-is-dete.patch | 77 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0039-loader-xnu-Free-driverkey-data-when-an-error-is-dete.patch

diff --git a/meta/recipes-bsp/grub/files/0039-loader-xnu-Free-driverkey-data-when-an-error-is-dete.patch b/meta/recipes-bsp/grub/files/0039-loader-xnu-Free-driverkey-data-when-an-error-is-dete.patch
new file mode 100644
index 0000000000..f9ad0fc34c
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0039-loader-xnu-Free-driverkey-data-when-an-error-is-dete.patch
@@ -0,0 +1,77 @@
+From 81117a77a9e945ee5e7c1f12bd5667e2a16cbe32 Mon Sep 17 00:00:00 2001
+From: Marco A Benatto <mbenatto@redhat.com>
+Date: Mon, 30 Nov 2020 12:18:24 -0300
+Subject: [PATCH] loader/xnu: Free driverkey data when an error is detected in
+ grub_xnu_writetree_toheap()
+
+... to avoid memory leaks.
+
+Fixes: CID 96640
+
+Signed-off-by: Marco A Benatto <mbenatto@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=4b4027b6b1c877d7ab467896b04c7bd1aadcfa15]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/loader/xnu.c | 24 ++++++++++++++++++++----
+ 1 file changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/grub-core/loader/xnu.c b/grub-core/loader/xnu.c
+index b3029a8..39ceff8 100644
+--- a/grub-core/loader/xnu.c
++++ b/grub-core/loader/xnu.c
+@@ -224,26 +224,33 @@ grub_xnu_writetree_toheap (grub_addr_t *target, grub_size_t *size)
+   if (! memorymap)
+     return grub_errno;
+ 
+-  driverkey = (struct grub_xnu_devtree_key *) grub_malloc (sizeof (*driverkey));
++  driverkey = (struct grub_xnu_devtree_key *) grub_zalloc (sizeof (*driverkey));
+   if (! driverkey)
+     return grub_errno;
+   driverkey->name = grub_strdup ("DeviceTree");
+   if (! driverkey->name)
+-    return grub_errno;
++    {
++      err = grub_errno;
++      goto fail;
++    }
++
+   driverkey->datasize = sizeof (*extdesc);
+   driverkey->next = memorymap->first_child;
+   memorymap->first_child = driverkey;
+   driverkey->data = extdesc
+     = (struct grub_xnu_extdesc *) grub_malloc (sizeof (*extdesc));
+   if (! driverkey->data)
+-    return grub_errno;
++    {
++      err = grub_errno;
++      goto fail;
++    }
+ 
+   /* Allocate the space based on the size with dummy value. */
+   *size = grub_xnu_writetree_get_size (grub_xnu_devtree_root, "/");
+   err = grub_xnu_heap_malloc (ALIGN_UP (*size + 1, GRUB_XNU_PAGESIZE),
+ 			      &src, target);
+   if (err)
+-    return err;
++    goto fail;
+ 
+   /* Put real data in the dummy. */
+   extdesc->addr = *target;
+@@ -252,6 +259,15 @@ grub_xnu_writetree_toheap (grub_addr_t *target, grub_size_t *size)
+   /* Write the tree to heap. */
+   grub_xnu_writetree_toheap_real (src, grub_xnu_devtree_root, "/");
+   return GRUB_ERR_NONE;
++
++ fail:
++  memorymap->first_child = NULL;
++
++  grub_free (driverkey->data);
++  grub_free (driverkey->name);
++  grub_free (driverkey);
++
++  return err;
+ }
+ 
+ /* Find a key or value in parent key. */
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index c9e7a06a3f..eebe9a7233 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -85,6 +85,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0036-gfxmenu-gui_list-Remove-code-that-coverity-is-flaggi.patch \
            file://0037-loader-bsd-Check-for-NULL-arg-up-front.patch \
            file://0038-loader-xnu-Fix-memory-leak.patch \
+           file://0039-loader-xnu-Free-driverkey-data-when-an-error-is-dete.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


