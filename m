Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F52C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:21 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.9074.1645178780137095868
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m+sxxJtH;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id v12so13677023wrv.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t0UIR1DpC180Nw0taSSdQ2F+4ueqBKOld/tbJWg3CLA=;
        b=m+sxxJtHrSR5ZNI/ZCgWb0RWoOz5wwHM2KEjKYZzW4+UoVbsU9uhxhMxyWQy+Xsc8U
         7n74bCvLJUrNrfqrE+/1idiIhMeQoD+iWeYu9BBhwU+YwSIbp62s/oVKnKjjd8MG7j4k
         3I+IgJ03Jrd864AVjDI7WAjpEZB/tLgJioUuSuDP6YoonsilwZpSdYtvH+AUHdndVUSF
         9OZJBpHqZr31jlI4xWiRQ4uQNCDUw3tmOnguf8ZWCGyaxDjzeGQO0/ggkoJtE6MSc2hE
         KqwuJUeaqKdBqeudorRIOdz9lU55MQG1ub3XesYU93ggFenoRmmVHhr6SwgH9DwdO7vN
         Q0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t0UIR1DpC180Nw0taSSdQ2F+4ueqBKOld/tbJWg3CLA=;
        b=Pmpc2OTNbsauHxHXGm9FFpu5/xYfiauzpLqgsEpsteoqd4nlxXOwse6vMkD2tZKF+W
         9vMFiFCFEiZsrzUy7jQz2n5JWWvRproWmGYZASNUI1jXARianA09UZcuNh8mn2x8GMD1
         gcbaP8gRuu+Q0zoVCXEv/M4HO5uVONe6XWnASIEooL0kM3wtFKbK6E6MIZAMpkiT7nrm
         O6TbMvgPHnmKIi7mOYPX48IVbLjTvVSm/VUe9FcnwApgrMuXq1iy3kd6ynajYlopJClQ
         A/kmC+pdudoEeiQ+gB6jdyqwXv7DJ0truNTIBPfeyZdmrq8ncQRG9WdFi6Rfjxf+rg7y
         zx7Q==
X-Gm-Message-State: AOAM5328zWfrpXQxeo73Wku6/shfrjL3k+Nr2EtfhRvdYiHE0XMwV+aS
	N7eIklnzwUwgOLlGO0RJ+Yw=
X-Google-Smtp-Source: 
 ABdhPJwRtAH8drVt4en9Bgi+lD0NqCiduROjZxSzQfdl1Piz7aLnYljYR30xfC959rQYYD04djyboA==
X-Received: by 2002:adf:dd0d:0:b0:1e3:37ee:ab8 with SMTP id
 a13-20020adfdd0d000000b001e337ee0ab8mr5723007wrm.251.1645178778448;
        Fri, 18 Feb 2022 02:06:18 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:18 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 02/46][dunfell] grub: add a fix for a possible NULL
 dereference
Date: Fri, 18 Feb 2022 11:05:10 +0100
Message-Id: <20220218100554.1315511-3-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161890

This fix removes a possible NULL pointer dereference in grub
networking code. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
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
2.33.0


