Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8A1C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:59 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.9116.1645178818378016031
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BVwDTv8a;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so6025267wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HdnFMHg4as7ahztXbxiZLTcJGq1AIpqYKPfctfdEBVI=;
        b=BVwDTv8aQ9y972uLiwB48epkwJZe8rJP6332iIGLxL0+A+XtVP9biNKvmr8bb+Ods2
         CNxOps/JIXOglumq/ceLLOcotqq2Ekgtyz07rFuV/x6tACU4dUe1SOf5wNrnf/07X79D
         o0KMyILBd1gDcnAdg2LDxfP3IxGdkrLt6a7aGowOtAGQc1IBplkLu3oiyd1agUQyCF8v
         cNpOSsKmzs46e+HOZP7DrW1QEyie4lhyBdMRf42tyzc+jpVq5fXDXqnkUfH0RRyCB3Zr
         JMkGL5II3suUe01VSA+2G3vKRGTBGSh9awbMS7QcB7DOTwZ/Tkm9osZaBcG41yBi3K73
         tmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HdnFMHg4as7ahztXbxiZLTcJGq1AIpqYKPfctfdEBVI=;
        b=gDNs5cfIIAkGzxKrMlz6vLiC/KYEFRGRsBf8ria368NVe05t8+emXCEUR+o+q52/Ob
         q1PqkFTqMWx3l0fz9ugr80ysji8cVrRWN7ShBqnYWb69/0b0UpiCz9yWxusILsXwb3D9
         kGxGwTvMRMdVyYJP1Leephr1Ueq1kVV9F33LPV1IS74D1C/7AqDAACVzrzbwcxq0K7ib
         Pm3pdtidnGob+ViDmFTvI5Myoym8tPuR/6M6++5jzVZ1QqkR4xyQxvuhefyg/Y3ICSUQ
         re454URp9+8lS6jqdkrq9tTiKzdN5wW8eSB6T/ZSty5bjB+nEj+nqFWdSZcTS4TTnzy/
         7Kkg==
X-Gm-Message-State: AOAM5305xOpGM1gF4m4cYhlm+2/4CyxIOO0pHK5+6D6Mo5mHjPIXzuR7
	gzHss48faw+1ikGG6lL/2B2f2m/e0pM=
X-Google-Smtp-Source: 
 ABdhPJyeZ+0qdRTRByNbyPeE7owJ5GN1hxiheziFPvLs0tVE+38OGE+QCeW06Vyrf0aJQiLLj6mFAw==
X-Received: by 2002:a05:600c:3486:b0:37c:d45c:179f with SMTP id
 a6-20020a05600c348600b0037cd45c179fmr6320844wmq.6.1645178816898;
        Fri, 18 Feb 2022 02:06:56 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:56 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 38/46][dunfell] grub: add a fix for a memory leak
Date: Fri, 18 Feb 2022 11:05:46 +0100
Message-Id: <20220218100554.1315511-39-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161926

This patch adds a fix for a memory leak in grub's loader/xnu.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 .../0038-loader-xnu-Fix-memory-leak.patch     | 38 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0038-loader-xnu-Fix-memory-leak.patch

diff --git a/meta/recipes-bsp/grub/files/0038-loader-xnu-Fix-memory-leak.patch b/meta/recipes-bsp/grub/files/0038-loader-xnu-Fix-memory-leak.patch
new file mode 100644
index 0000000000..41f09a22fc
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0038-loader-xnu-Fix-memory-leak.patch
@@ -0,0 +1,38 @@
+From 0a4aa7c16f65cdfaa1013f0796afa929f8d6dc1a Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 26 Nov 2020 12:53:10 +0000
+Subject: [PATCH] loader/xnu: Fix memory leak
+
+The code here is finished with the memory stored in name, but it only
+frees it if there curvalue is valid, while it could actually free it
+regardless.
+
+The fix is a simple relocation of the grub_free() to before the test
+of curvalue.
+
+Fixes: CID 96646
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=bcb59ece3263d118510c4440c4da0950f224bb7f]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/loader/xnu.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/loader/xnu.c b/grub-core/loader/xnu.c
+index 07232d2..b3029a8 100644
+--- a/grub-core/loader/xnu.c
++++ b/grub-core/loader/xnu.c
+@@ -1388,9 +1388,9 @@ grub_xnu_fill_devicetree (void)
+     name[len] = 0;
+ 
+     curvalue = grub_xnu_create_value (curkey, name);
++    grub_free (name);
+     if (!curvalue)
+       return grub_errno;
+-    grub_free (name);
+    
+     data = grub_malloc (grub_strlen (var->value) + 1);
+     if (!data)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 8b55afccbb..c9e7a06a3f 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -84,6 +84,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0035-video-readers-jpeg-Test-for-an-invalid-next-marker-r.patch \
            file://0036-gfxmenu-gui_list-Remove-code-that-coverity-is-flaggi.patch \
            file://0037-loader-bsd-Check-for-NULL-arg-up-front.patch \
+           file://0038-loader-xnu-Fix-memory-leak.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


