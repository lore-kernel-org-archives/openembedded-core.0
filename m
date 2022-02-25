Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828ABC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:27 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.6808.1645799306363082527
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=r5ivn/OU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id e6so3397786pgn.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eAHOlyKavLL/MuANQ9JIrL4rPw+3TZBCc6evPMFXlhk=;
        b=r5ivn/OUytNmDwYmgh+JlxNDf+b8KyYZTCpIEzCYWJAbFTf/spxmO1BPc3l5c7/4+m
         20AnLlXyF+UHA2E+BlHbKCCFaffWpR7XoBo/JdEkxxuJzgSCQ/39nvdprD4taOeXf2CU
         To50CmYQ8QNqf+L0iXL6OPlRRsKI4ffZrn0LfcIN2YosB6ikTvuyWtgpOhg2Xft4ro6n
         a9luAKjRe8NZkzyS+PqY4F3ar1QL294yz5ts5xQoFI9cniSA0dcPJDBU6uUVOqNm9FkB
         zM0jhmx1tHDi7KRn9XCdgZMZ0xe0Ty2GYhGaqD6HlH2DWzb19lBUwVa1+aO0+oQBKZvi
         4Acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eAHOlyKavLL/MuANQ9JIrL4rPw+3TZBCc6evPMFXlhk=;
        b=Kkv6xz54reYQn8wk7xJJW35XfXVlsKcdjY+autFUJfYhgMVhc1ikm8o4GcjvnkY4du
         ELYNfbshpviBkD3+ondW2fnXzdcwiQL1d+7vwXw/EsCuHNL6reauSsWWn/Y7ttVKSe/1
         YaAlRXXztoo7QjqKb+PxvDpLzxBgyWU8wv1PYhHyXWGO4KWu5J2udBZzyA7hqEchPOUM
         l+BfCWeqwcnDY4V/0DecVlx8rlZWQUnxbfDeVrOQg5dctHQ0TZJ2Cej7b9MqMc2rS3VU
         xw1VhF499pQWBHvPK44KWBcTBET4CasfZxio7O5+w+iPpMVgzN12/txkhioydGqNrI4E
         XEog==
X-Gm-Message-State: AOAM530p8Vhoa3Fncm/b8tGyxB8wpMzb9nC28AaUgwm+JjNEBr3n+XCu
	5BHAlbo+40cNdbTCP3ys9IuWCHSrVebUxcpj
X-Google-Smtp-Source: 
 ABdhPJzjZ8zzHDeK98e/8JFOQKvctXrUTPwcyqzjIv0rqSyrnupkXXrwTEkN5w4Ak5rJAuh5DnwsaQ==
X-Received: by 2002:aa7:8890:0:b0:4e1:b25b:634c with SMTP id
 z16-20020aa78890000000b004e1b25b634cmr8104268pfe.31.1645799305153;
        Fri, 25 Feb 2022 06:28:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 43/50] grub: avoid a memory leak
Date: Fri, 25 Feb 2022 04:26:23 -1000
Message-Id: 
 <265baabc6e7ce4962c22489158dba113e0d74b91.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162389

From: Marta Rybczynska <rybczynska@gmail.com>

This patch fixes a memory leak in grub's loader/xnu when an error is
detected in grub_xnu_writetree_toheap(). It is a part of a security
series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


