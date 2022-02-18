Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FFDC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:34 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.9081.1645178793638717275
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MyoGiPq/;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso8207222wme.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g5sl50RpMMYLiGVhC5b6iy6hOtbHmkGYsUUjIGy/Hzg=;
        b=MyoGiPq/E6XoKKfGYsWAiHwf+E3N8okE7K7IEUnpN7nCvHEtHSDLQGn2s5lyxOgNym
         GN2uVWiHGHiHH0BoGtkTlPSQxAh0Rwfr5fg3G2VTm8WSRX45bDrsq3MiPe8L2ZKBGFGw
         955Lsb7747Dq9ks8rrW+ewKzKCxT12x0mW40lPv2F2NTWIb+RJ8G0xDxj6zGg1cilMNf
         vJiY9oEhS2larUIHEheaA79mRm4MJZ1kyORmstteJixMcxb3vdCrVTW+SZEy+NYKbCGK
         wI+XCnMFrXao9+U/C0JE64h5jlx3ToesY7d0kgpZnWc9RQk6p3wXVKv3+WIeVEH0bUsL
         gM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g5sl50RpMMYLiGVhC5b6iy6hOtbHmkGYsUUjIGy/Hzg=;
        b=soXcrfbb8bQqSBgkrY9ytx1WGM1+Eu05Bx06pydXv2B2XVQDDLdk0fnB6sdab/Lyu3
         fdsX7rP0VyJhlPrRCjA45MORqTFb00gRA1/EZZ/XrGziIoyd4Jo7EAVVqZA9Ci0hdlJi
         eaO7qAvOuNCcJkIpu4ckeeJCg4B840aiaJ9DV32HoQsphleIObTfyRRkA9v1pbkK2xSJ
         3oJyOS6WIX+TPX2A3Gk2p9xPGihhTC7gai2glN/T8ccHntfzeSZ72ASEeND5vsrBuYZ+
         E2scd8o8yj/R490w+ehGa/9QFP2+VUjSepTl8H1hK01czIPLo0Yk+xBr4DJ7p6lOEewD
         zuMg==
X-Gm-Message-State: AOAM531jSV1C+Vps5WU0sHb34VEYv480euwuv1x0vUMec7Lp85v0eb9S
	ZhI+ZvIZ6XH632sOZZS7wdo=
X-Google-Smtp-Source: 
 ABdhPJyik9lBF3Df5cc9l4c1mckJP7t6i9wwRxwing1kgaDBOln0XsloBzNhZgADK5MAZsAwVnWOnQ==
X-Received: by 2002:a05:600c:3acb:b0:37b:db39:f3b1 with SMTP id
 d11-20020a05600c3acb00b0037bdb39f3b1mr6376257wms.175.1645178792104;
        Fri, 18 Feb 2022 02:06:32 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:31 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 15/46][dunfell] grub: add a missing NULL check
Date: Fri, 18 Feb 2022 11:05:23 +0100
Message-Id: <20220218100554.1315511-16-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161903

This fix adds a missing check for NULL pointer from an external source
in grub's kern/partition. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...heck-for-NULL-before-dereferencing-i.patch | 43 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0015-kern-partition-Check-for-NULL-before-dereferencing-i.patch

diff --git a/meta/recipes-bsp/grub/files/0015-kern-partition-Check-for-NULL-before-dereferencing-i.patch b/meta/recipes-bsp/grub/files/0015-kern-partition-Check-for-NULL-before-dereferencing-i.patch
new file mode 100644
index 0000000000..af9fcd45cc
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0015-kern-partition-Check-for-NULL-before-dereferencing-i.patch
@@ -0,0 +1,43 @@
+From 0da8ef2e03a8591586b53a29af92d2ace76a04e3 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Fri, 23 Oct 2020 09:49:59 +0000
+Subject: [PATCH] kern/partition: Check for NULL before dereferencing input
+ string
+
+There is the possibility that the value of str comes from an external
+source and continuing to use it before ever checking its validity is
+wrong. So, needs fixing.
+
+Additionally, drop unneeded part initialization.
+
+Fixes: CID 292444
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=bc9c468a2ce84bc767234eec888b71f1bc744fff]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/kern/partition.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/kern/partition.c b/grub-core/kern/partition.c
+index e499147..b10a184 100644
+--- a/grub-core/kern/partition.c
++++ b/grub-core/kern/partition.c
+@@ -109,11 +109,14 @@ grub_partition_map_probe (const grub_partition_map_t partmap,
+ grub_partition_t
+ grub_partition_probe (struct grub_disk *disk, const char *str)
+ {
+-  grub_partition_t part = 0;
++  grub_partition_t part;
+   grub_partition_t curpart = 0;
+   grub_partition_t tail;
+   const char *ptr;
+ 
++  if (str == NULL)
++    return 0;
++
+   part = tail = disk->partition;
+ 
+   for (ptr = str; *ptr;)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 7cf4d64149..94b89aa643 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -61,6 +61,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0012-gnulib-regcomp-Fix-uninitialized-re_token.patch \
            file://0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch \
            file://0014-zstd-Initialize-seq_t-structure-fully.patch \
+           file://0015-kern-partition-Check-for-NULL-before-dereferencing-i.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


