Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79226C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:21 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.9175.1645178780820563036
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=abPPgJcr;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id m27so1842172wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=df1np1Zq/vo1edPT5QN52CSeFd04igwewxjlYNVdsEw=;
        b=abPPgJcrzmpQMzNTyHrWWiMqQn/U9BskJMns1/oJtCb+xbD2tCR/FtzTdzThER5dIb
         CDEWFu5pO45b5z0uVEpE/tr7e1lacjmM2V0lq6gyBhTgnBJ4T/drvykH8op95M1XU3aq
         I4swdntwdvYkvn24P9h+gw65aU4FGwrw0FuzTYCJzYoLhRweRUpDtGqKu75YV3ksMfKf
         Z9T6Eaqf639NQOrPvv9CcJEXJwXofz/XcQOQBqjWuf6BTzHclxLpEWY2VgBWUIY1G5V+
         wEVJqGg8I+eIs6G2VRUVyxfF6/eT/LtOKRc33RlNaV3sLsPPFI4ER1ghACxgkgDn6c4b
         aMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=df1np1Zq/vo1edPT5QN52CSeFd04igwewxjlYNVdsEw=;
        b=66rRG98VusGB4fvrL7R1lrVbla46l3OUBYkCtFcTXP7YL6UD14rkQD5Nk7HWjfaXlO
         HJSdM8nVzyqDn4+MwQxSB07+4my5lOPrpjjLF88UuPliUTkyPeC4LSbe+Xf7XzLF8bFJ
         +Gw2pmqMG08jaFinlHXgHcs5Kopj2Bj+FQ+5annxznfOoEHuFtP3piY0aFaA/Pe5ZXZC
         KEi4+AA49PnV1aVRE4bE5qLR8R2jNQ+YjwflpWCmbGug3CdKdXbirGymGbGDqopJvrPk
         HKou/b/YOObiAy9ndXZQ2SC/kEir/HFXoNzkqKKsx6PsPu38WzfAXU9MruyUieJUBwWd
         fdcA==
X-Gm-Message-State: AOAM533fCOy5bqinWHUUmZuyRgUdmMPFJJsoQSzgKSS6sUjkUHPiytcA
	BkY1HDTmfJmTFHimysChc2A=
X-Google-Smtp-Source: 
 ABdhPJwzNEymSkTsdhVf8e9XHsMSCCpK8Y+gbUfP9k1uaGhy//BCxN9u/TIN1JLYWDSFcRAiTIp7pg==
X-Received: by 2002:a5d:58d7:0:b0:1e1:9215:8bb3 with SMTP id
 o23-20020a5d58d7000000b001e192158bb3mr5304787wrf.678.1645178779365;
        Fri, 18 Feb 2022 02:06:19 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:19 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 03/46][dunfell] grub: fix a dangling memory pointer
Date: Fri, 18 Feb 2022 11:05:11 +0100
Message-Id: <20220218100554.1315511-4-rybczynska@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/161891

This change fixes a dangling memory pointer in the grub TFTP code.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...net-tftp-Fix-dangling-memory-pointer.patch | 33 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0003-net-tftp-Fix-dangling-memory-pointer.patch

diff --git a/meta/recipes-bsp/grub/files/0003-net-tftp-Fix-dangling-memory-pointer.patch b/meta/recipes-bsp/grub/files/0003-net-tftp-Fix-dangling-memory-pointer.patch
new file mode 100644
index 0000000000..3b4633507d
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0003-net-tftp-Fix-dangling-memory-pointer.patch
@@ -0,0 +1,33 @@
+From 09cc0df477758b60f51fbc0da1dee2f5d54c333d Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Fri, 19 Feb 2021 17:12:23 +0000
+Subject: [PATCH] net/tftp: Fix dangling memory pointer
+
+The static code analysis tool, Parfait, reported that the valid of
+file->data was left referencing memory that was freed by the call to
+grub_free(data) where data was initialized from file->data.
+
+To ensure that there is no unintentional access to this memory
+referenced by file->data we should set the pointer to NULL.
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=0cb838b281a68b536a09681f9557ea6a7ac5da7a]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/net/tftp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/grub-core/net/tftp.c b/grub-core/net/tftp.c
+index 7d90bf6..f76b19f 100644
+--- a/grub-core/net/tftp.c
++++ b/grub-core/net/tftp.c
+@@ -468,6 +468,7 @@ tftp_close (struct grub_file *file)
+     }
+   destroy_pq (data);
+   grub_free (data);
++  file->data = NULL;
+   return GRUB_ERR_NONE;
+ }
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 2c0bff8fd0..678aa5c4e2 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -49,6 +49,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2020-25647.patch \
            file://0001-mmap-Fix-memory-leak-when-iterating-over-mapped-memo.patch \
            file://0002-net-net-Fix-possible-dereference-to-of-a-NULL-pointe.patch \
+           file://0003-net-tftp-Fix-dangling-memory-pointer.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


