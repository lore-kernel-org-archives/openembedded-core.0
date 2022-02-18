Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CFAC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:38 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.9181.1645178797010572014
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MRM8ij54;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id c192so4884201wma.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DPYXC1q++SMAPEkU4OWyGO6/6lyPqwuzs5SQKSLz8XI=;
        b=MRM8ij544ouI8NvXhOpgL3q1vZa0LjKD1JnYecoc+pwkex/rMejLTOF5NQ8URYR9of
         3sRhiqCx/gAwd44okBrjdGNkeZRPRXrLXbuhKMPbecbPZm7QC7CWddrXHiOSeZ7YEXSh
         hvW3mijvuHA2l9Axhy+kqERd3miN2oGn3hZ5yxIg6BjkXdsE8Iat/s0aqdDsZ6qdndvJ
         G6ZaP2BltK2rX66SlMa9EZfYbmCcXZqRbyZOzKMscAg62MXZ9p/Sh0ft9Bqz2MHSk0sY
         DHgeiukhysRM8fxX6nKhb4+ZvtJ016Um9RegrtCVTR+ncpd4qGFQa9PJ5gLL+m+5Zxbb
         uLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DPYXC1q++SMAPEkU4OWyGO6/6lyPqwuzs5SQKSLz8XI=;
        b=Rhx/DW1rfpGQ2B82w7oYFQP3ZPNBzNN1sHTo9Nrh0GUAwJ2YSddcSDO2nXuxdUAmYR
         4KW4JXSBlfy+VblhEAijyxDm59giECRspO+0rgIwEjJ6iw/hjVVzyAhb4AdADd3ZhYFQ
         kr8wA22xiWSrV16N/DRImPTXgwSksb4nzOE0CExaR6VDt9fpmBhF4kIFWeTof6q4smrl
         Wa1RriEgZH/ynSuxS0QC1A3uDaOSAsqec49p5xmplb0e2A3n4wP3GzWu/CcjhUzzPpoZ
         fNjK1DbI7/VhWQa2ddCaujrEH2yzK3tqGCNE/kbu6zhboXxIn9WCTLngNX8Kjlcmf4BJ
         Wzhg==
X-Gm-Message-State: AOAM53343aQMKuvwMnnVDawdKvpCa/xOvshwF23Zv9ZkiwLdCLAPwbHT
	CQWTgKi9SE/MLG6gAm7s4lM=
X-Google-Smtp-Source: 
 ABdhPJwz8sOy69sezzAtN7AYyU8jtYk1ogwEPeg2V/XfYnu5+SiBWdBKzVDyC7zZakoR+OPUVEF6SQ==
X-Received: by 2002:a7b:c192:0:b0:37b:c6f5:4df0 with SMTP id
 y18-20020a7bc192000000b0037bc6f54df0mr6497104wmi.79.1645178795499;
        Fri, 18 Feb 2022 02:06:35 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:34 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 18/46][dunfell] grub: fix a memory leak
Date: Fri, 18 Feb 2022 11:05:26 +0100
Message-Id: <20220218100554.1315511-19-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161906

Add a fix for a memory leak in grub'd disk/ldm. It is a part of
a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...ory-leak-on-uninserted-lv-references.patch | 50 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0018-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch

diff --git a/meta/recipes-bsp/grub/files/0018-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch b/meta/recipes-bsp/grub/files/0018-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch
new file mode 100644
index 0000000000..26932f674c
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0018-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch
@@ -0,0 +1,50 @@
+From 3e1d2f1959acbe5152cdd5818d495f6455d1a158 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Tue, 8 Dec 2020 10:00:51 +0000
+Subject: [PATCH] disk/ldm: Fix memory leak on uninserted lv references
+
+The problem here is that the memory allocated to the variable lv is not
+yet inserted into the list that is being processed at the label fail2.
+
+As we can already see at line 342, which correctly frees lv before going
+to fail2, we should also be doing that at these earlier jumps to fail2.
+
+Fixes: CID 73824
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=156c281a1625dc73fd350530630c6f2d5673d4f6]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/disk/ldm.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/disk/ldm.c b/grub-core/disk/ldm.c
+index 54713f4..e82e989 100644
+--- a/grub-core/disk/ldm.c
++++ b/grub-core/disk/ldm.c
+@@ -321,7 +321,10 @@ make_vg (grub_disk_t disk,
+ 	  lv->visible = 1;
+ 	  lv->segments = grub_zalloc (sizeof (*lv->segments));
+ 	  if (!lv->segments)
+-	    goto fail2;
++	    {
++	      grub_free (lv);
++	      goto fail2;
++	    }
+ 	  lv->segments->start_extent = 0;
+ 	  lv->segments->type = GRUB_DISKFILTER_MIRROR;
+ 	  lv->segments->node_count = 0;
+@@ -329,7 +332,10 @@ make_vg (grub_disk_t disk,
+ 	  lv->segments->nodes = grub_calloc (lv->segments->node_alloc,
+ 					     sizeof (*lv->segments->nodes));
+ 	  if (!lv->segments->nodes)
+-	    goto fail2;
++	    {
++	      grub_free (lv);
++	      goto fail2;
++	    }
+ 	  ptr = vblk[i].dynamic;
+ 	  if (ptr + *ptr + 1 >= vblk[i].dynamic
+ 	      + sizeof (vblk[i].dynamic))
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a8ee0dd68a..2fccdc2d62 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -64,6 +64,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0015-kern-partition-Check-for-NULL-before-dereferencing-i.patch \
            file://0016-disk-ldm-Make-sure-comp-data-is-freed-before-exiting.patch \
            file://0017-disk-ldm-If-failed-then-free-vg-variable-too.patch \
+           file://0018-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


