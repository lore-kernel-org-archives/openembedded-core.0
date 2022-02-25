Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5A4C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:01 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.6886.1645799220509658319
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=suQo8Z7v;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id x11so4933498pll.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qruG9ss2cxOI4qldARAhgzV+TB6/KvtboP0WkX1HbFo=;
        b=suQo8Z7v/AHt1KnMEv2d1RoswzYrFgX7tr08nAKORaIbATFt9nBkWUU/wOhEm4XSsi
         4OLv/UO11zyYf0dFkf48AzpAFAMgua1Tb4v+bwr0j4iU4xZwLB+GMDnaKbfsQyYO7IJ3
         6qRivr1/W32UW0/czr90RTe0cKOOldF5ZhPRF3d6++k/KT88s/FRI/oOXNVYXqhdxoCQ
         VVbImMmGpzNvZekhUWI9d1HkTmdXtlx/EX+xTwubADIWV9xGxt65SvMMxCZI0pt4nhxR
         kEnvgUqNV8fL0iL7+q/ofKB8VM3z+3rn1+fHiszsd0GCGvtGQsMrdm3ScKS4qs6ZLhCS
         CaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qruG9ss2cxOI4qldARAhgzV+TB6/KvtboP0WkX1HbFo=;
        b=8Bc1ILrY5rK6xLU+y1a1XcYyKwxz3OnUIoRelLP+oLOZ5xSIxIRZTObiG1hXBgLzTK
         ecwWUL5KHQFpG5YKSYwY3tY1cQ/dMUjnFYmXsMSoTs9QzLs5lXJwATzxOxC9JibLkCz9
         OTMt2zxvIDLEX/UM3Sm+FUfa8JOlXs15wu4FqyJPXPARAkcM56jqP0A9Gw1ZrlQqEI6e
         YNfDBUSScYq/CaaB2+YDJaNDiP0b6HDuaIaGZ8sI/KIm1mn1913KMy8439u2sqv2yMze
         NUBhqIYkHod/Jj60+vW5HUfnjKY1thilq5zcfjOT8GrIK+XcPQeGg34eY2YxpIBAWXWK
         QfWA==
X-Gm-Message-State: AOAM533Y4OJ+ai8a+KYBmtmb2gKkEgLIfdcDHoN43osIo+kgt/0FoUMp
	ysQHwnZJwu4t3v+FSl7dOYfYgXXiI9+L0Dyg
X-Google-Smtp-Source: 
 ABdhPJzokf+j39CuMqUgxbofUXvNlw7jPY7aqOGD3RInGDXAdb0b5XGUD/mUbX9w1sjunewnzjgfBg==
X-Received: by 2002:a17:90a:3046:b0:1bc:2b36:87bc with SMTP id
 q6-20020a17090a304600b001bc2b3687bcmr3327372pjl.191.1645799219558;
        Fri, 25 Feb 2022 06:26:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.26.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:26:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/50] grub: fix a memory leak
Date: Fri, 25 Feb 2022 04:25:45 -1000
Message-Id: 
 <330ef99ae58e025b78bf30b9a9d09b32dfa2f605.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162351

From: Marta Rybczynska <rybczynska@gmail.com>

Backport a fix for a memory leak in grub_mmap_iterate(). This patch
is a part of a security series [1]

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


