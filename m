Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838E2C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:20 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.9073.1645178779023469290
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d9UcXSag;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id d27so13636378wrc.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pOtzSx++VtixBTphaVNWKRbxPTEH+b2sfi6cjjyOfvc=;
        b=d9UcXSagf8YroAGX9gvTWrxI6t3rVWQrMwWNYbzSCQWRWuMOMRtx121qNbHu9GMJAi
         pKytOXMSjq1907qpY0xKl2mk2IijqZSF6HAyA7ndqzbyv5NUVOrrhR7vKjAsoN4uzZSj
         y+Zh2fRfLMtBlK/L+Jlxsqon73bD5BA4ltMXENQ3OvCWnSKXr/AraLLZ5VaXmXrEr8nr
         UVg5GBwNGIktIuNvVJ7RpS4TP2I5ToEFe0bIHPSO/hLwkVDY9v+YYKydimczkc5YT8tw
         /oBUhy6/u1BVrObpN3VW5V231NhJLVWUP8gu0A0nSjvUdZQgrkwHAnpBnQU8lbmyvwZE
         ZFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pOtzSx++VtixBTphaVNWKRbxPTEH+b2sfi6cjjyOfvc=;
        b=4e2NXqRw3+UTKIgxqoWBCFGsUDp498T+6oHL8vru39pOMuybicSVqO6BSX/Cb/RNJ/
         nuILJBRJJQ57zgMy9JdZNz8bJ7sMNBPjowOoyi7jfznb0gFeWCL/ThCKrmZZGVEQSX9e
         BpDDv/H86rHqTkH0K0NSo5ugKFuKx6qLud/+e7Pwiodaq+1KJ/JCXCsQKWcmC4suLwoJ
         +zNYuFRc2rI2Y8gDlzhPgiSp/CI20K7WVam2hFT0kF7FplYcf3o/EG+XimuClLik/QXS
         z8iftdtVSKTWrOEU0jiq1N2pOKyLN+JU8ln7TA59qX4LAHB3dlimYrXtrEJY60329HmT
         QKkw==
X-Gm-Message-State: AOAM532ayL28lp4NO4OZAeo0bY6X7pwxW7F3yCAw0JT8T9JSiHnnva8Z
	qsOCJPWi4etcGk8olq0U5wo=
X-Google-Smtp-Source: 
 ABdhPJzri+o16lD46NOwpmX1mcB/Pz2X/GQvBiZWQLplo6HCm2qxX26q1AIph/MvXGdUW+WAu7yyow==
X-Received: by 2002:a5d:6701:0:b0:1e3:3ba6:d2e8 with SMTP id
 o1-20020a5d6701000000b001e33ba6d2e8mr5378223wru.221.1645178777570;
        Fri, 18 Feb 2022 02:06:17 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:17 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 01/46][dunfell] grub: fix a memory leak
Date: Fri, 18 Feb 2022 11:05:09 +0100
Message-Id: <20220218100554.1315511-2-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161889

Backport a fix for a memory leak in grub_mmap_iterate(). This patch
is a part of a security series [1]

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...leak-when-iterating-over-mapped-memo.patch | 39 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/grub/files/0001-mmap-Fix-memory-leak-when-iterating-over-mapped-memo.patch

diff --git a/meta/recipes-bsp/grub/files/0001-mmap-Fix-memory-leak-when-iterating-over-mapped-memo.patch b/meta/recipes-bsp/grub/files/0001-mmap-Fix-memory-leak-when-iterating-over-mapped-memo.patch
new file mode 100644
index 0000000000..eaaa7effae
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-mmap-Fix-memory-leak-when-iterating-over-mapped-memo.patch
@@ -0,0 +1,39 @@
+From 0900f11def2e7fbb4880efff0cd9c9b32f1cdb86 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 3 Dec 2020 14:39:45 +0000
+Subject: [PATCH] mmap: Fix memory leak when iterating over mapped memory
+
+When returning from grub_mmap_iterate() the memory allocated to present
+is not being released causing it to leak.
+
+Fixes: CID 96655
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=8cb2848f9699642a698af84b12ba187cab722031]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/mmap/mmap.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/grub-core/mmap/mmap.c b/grub-core/mmap/mmap.c
+index 7ebf32e..8bf235f 100644
+--- a/grub-core/mmap/mmap.c
++++ b/grub-core/mmap/mmap.c
+@@ -270,6 +270,7 @@ grub_mmap_iterate (grub_memory_hook_t hook, void *hook_data)
+ 		   hook_data))
+ 	{
+ 	  grub_free (ctx.scanline_events);
++	  grub_free (present);
+ 	  return GRUB_ERR_NONE;
+ 	}
+ 
+@@ -282,6 +283,7 @@ grub_mmap_iterate (grub_memory_hook_t hook, void *hook_data)
+     }
+ 
+   grub_free (ctx.scanline_events);
++  grub_free (present);
+   return GRUB_ERR_NONE;
+ }
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 9b20e1c09b..a06beac5ef 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -47,7 +47,8 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2020-27779_7.patch \
            file://CVE-2020-25632.patch \
            file://CVE-2020-25647.patch \
-"
+           file://0001-mmap-Fix-memory-leak-when-iterating-over-mapped-memo.patch \
+           "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
 
-- 
2.33.0


