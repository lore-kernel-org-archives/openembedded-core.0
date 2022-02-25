Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8233EC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:24 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.7081.1645799304071898615
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=75X5SHfu;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id b8so4888402pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=brPYRUfnLIuY9pX8ArqVwueidd6qcxJYFhWNI2Zyf0c=;
        b=75X5SHfuYkD8QTjmyJeeCz0+QXZ331OXu95pB03hm5t9hzy8nVn7qh4q8t3KR6jkug
         pPDIlckaS7EQEy5dsao5XJSOGWe6DHnoKwxpFJFnco8pO6qthtm/DieA5T6wWDX1/WQd
         Okb5A3/AQBTzVInu210qrgNWEMGq4eX2NOS83EWRV9WJZcElxWFyAlUEh89XqX6p8Pd7
         IZH6UWRQHVDSIVoGij6Y+LlWEdI9ecaWbEXFk0xGFS0i73f5j5qSQyu/C/fc/4xocX0G
         8t7mRP9NNtyhj734lNVCaYVKugLbpLidS1lYUTrmblmuj74YG9hP4R0JH3HMDimkb/kL
         0lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=brPYRUfnLIuY9pX8ArqVwueidd6qcxJYFhWNI2Zyf0c=;
        b=noLkPZVgT6m2NQ5oHB3Es2QQfbPHd1gLZu8J4nReea53R343AvCcK3V1Kd+WEUyRZR
         oTZcApvW1yYO6wcJBJmgi9Hw5hIwt2G3ZFQKT1da7CCP4y2Om40b6mNMZkUEQe9fDLO8
         cTlj3kKLR7aDZRNvbjAbL2INyM21/eX0j86HE8aU8q1zJHCTP3lA+vo0J1dR3fT9N8AW
         4w0DkOU39ftyaqu0Q8Mjo7I/zg5KPvND5yozj5h1ZKbdvhZgKV079UXTeYXFhcwhDmyu
         r5RU9YdAw8jRJl18IJmEPjq+5mBJZztgJkjPawHeLN5KHt7OJJqd7tKa+NBQyXATD7Pm
         Q93Q==
X-Gm-Message-State: AOAM530BSCaf043aL6n8t0vf1+mN8zX88lbpzkMXyE1zTD+q7kCTKOIX
	EpL4VCR3qj1ZoGDIgWszwQtYjz+bjzfkLBJk
X-Google-Smtp-Source: 
 ABdhPJxVPTSxsVN7wueV9XI9jSopc14OIhXO0rFIkQEPZ/lGopN2i+loZh4a8rnY3CV1SljlGS3dEw==
X-Received: by 2002:a17:902:ec92:b0:14f:e593:5e99 with SMTP id
 x18-20020a170902ec9200b0014fe5935e99mr7878071plg.42.1645799303106;
        Fri, 25 Feb 2022 06:28:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 42/50] grub: add a fix for a memory leak
Date: Fri, 25 Feb 2022 04:26:22 -1000
Message-Id: 
 <b53db9013a0f4b3a2a91ec6e5c39d939f388749c.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162388

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for a memory leak in grub's loader/xnu.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


