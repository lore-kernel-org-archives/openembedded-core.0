Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72399C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:03 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.6780.1645799222876880579
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=wjmDmRxR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id d15so1559999pjg.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WnM3pQfF4FD7T5NEnL3mhxZdJiT9sOdNfr9Pz3aT/ec=;
        b=wjmDmRxRPQQw909g+fpuxWH3AG/2hYBSsU42XT1QIq3iqzVaaUQYELrUPNBvmOJKTE
         EDRFzZQ5Xuahi+khwbxrkrBqEZQD12qxDQdbhwp31iJkhsM3em1mlTPNw2YsfM5aeptK
         ezlXoIn7NihQrJEBFpksLL7J9Tm9IyVgVBZsExSgbexJRZKox5mFYhEPxTdCS728Y8MX
         wxb9Asy1s+nCLLi6hS2h9adCivxMXdxe4qt/DbYFCXbjqA8rc2VAMpsUNbRRLaGQedfA
         APKt5Mv8NpzPCXG61gU4r3YkiY+JM7mRyJlr4HL6Ozyzm1kcqPqjW93zCZ1q+giJNw3w
         nhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WnM3pQfF4FD7T5NEnL3mhxZdJiT9sOdNfr9Pz3aT/ec=;
        b=lThVUa1iWEvsXF8ERH5PWgLt81A+okNV/D0KezG/tv8LlIpcpFq+0z98w+NNfyEw8j
         dw42ieLvbvC7MQbyk3gE1mGikNQcff+Aaaa7Lr9GJUEtTqH9AX68XPodycANId4axvuX
         6iicADDMGOvjolTaLxtRECXUzepwdElGRTRkZxIBPhr+/nVU3LpduvZy51mrbwqypCYl
         e3mUlrWzyWM2jAjEz5VSyE3AhAAhtWUs3MV4XnCmrMhHzKGdZmuX2jiB+h7FH9gB19q/
         R4y9+rgIVcWh4Ckluag+M82OmAtX9rRdJVlYkdvUKd29jqAHGPUAM/qr3ejTU+fQVO8u
         JZ6w==
X-Gm-Message-State: AOAM533TEEze6PUROq65VXPYgR0DVqDxP9iI2Ks2udsXrWzgYfxyw8KI
	nRYcOgeReqhbYrwAOhLbBqinZGSbOaIH0+n3
X-Google-Smtp-Source: 
 ABdhPJwozGY0K6/kuoceeQfMJL3cqlzvuO4rdaaWueFNxvjYhGwXmamDx8AVdHbBn20YhfGmYEIZ2w==
X-Received: by 2002:a17:90a:241:b0:1bc:1def:a8c5 with SMTP id
 t1-20020a17090a024100b001bc1defa8c5mr3381801pje.105.1645799221927;
        Fri, 25 Feb 2022 06:27:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/50] grub: add a fix for a possible NULL
 dereference
Date: Fri, 25 Feb 2022 04:25:46 -1000
Message-Id: 
 <5e62b476b541d3803e537f2228a264224b72cf81.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162352

From: Marta Rybczynska <rybczynska@gmail.com>

This fix removes a possible NULL pointer dereference in grub
networking code. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ible-dereference-to-of-a-NULL-pointe.patch | 39 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0002-net-net-Fix-possible-dereference-to-of-a-NULL-pointe.patch

diff --git a/meta/recipes-bsp/grub/files/0002-net-net-Fix-possible-dereference-to-of-a-NULL-pointe.patch b/meta/recipes-bsp/grub/files/0002-net-net-Fix-possible-dereference-to-of-a-NULL-pointe.patch
new file mode 100644
index 0000000000..d00821f5c3
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0002-net-net-Fix-possible-dereference-to-of-a-NULL-pointe.patch
@@ -0,0 +1,39 @@
+From f216a75e884ed5e4e94bf86965000dde51148f94 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Fri, 27 Nov 2020 15:10:26 +0000
+Subject: [PATCH] net/net: Fix possible dereference to of a NULL pointer
+
+It is always possible that grub_zalloc() could fail, so we should check for
+a NULL return. Otherwise we run the risk of dereferencing a NULL pointer.
+
+Fixes: CID 296221
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=03f2515ae0c503406f1a99a2178405049c6555db]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/net/net.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/net/net.c b/grub-core/net/net.c
+index 38f19df..7c2cdf2 100644
+--- a/grub-core/net/net.c
++++ b/grub-core/net/net.c
+@@ -86,8 +86,13 @@ grub_net_link_layer_add_address (struct grub_net_card *card,
+ 
+   /* Add sender to cache table.  */
+   if (card->link_layer_table == NULL)
+-    card->link_layer_table = grub_zalloc (LINK_LAYER_CACHE_SIZE
+-					  * sizeof (card->link_layer_table[0]));
++    {
++      card->link_layer_table = grub_zalloc (LINK_LAYER_CACHE_SIZE
++					    * sizeof (card->link_layer_table[0]));
++      if (card->link_layer_table == NULL)
++	return;
++    }
++
+   entry = &(card->link_layer_table[card->new_ll_entry]);
+   entry->avail = 1;
+   grub_memcpy (&entry->ll_address, ll, sizeof (entry->ll_address));
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a06beac5ef..2c0bff8fd0 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -48,6 +48,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2020-25632.patch \
            file://CVE-2020-25647.patch \
            file://0001-mmap-Fix-memory-leak-when-iterating-over-mapped-memo.patch \
+           file://0002-net-net-Fix-possible-dereference-to-of-a-NULL-pointe.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


