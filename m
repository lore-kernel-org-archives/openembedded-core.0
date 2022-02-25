Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B5EC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:07 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.6912.1645799227149155477
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=6QB34BZ2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id p8so4812722pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nU98zbeHUSB3tqVcJXipYK+p3cNHClKhOWw1WFHlvLM=;
        b=6QB34BZ2L7NF1RzMD2gq4XQwr17SZhEf0rUDsHRSpQgqMC8KREVX6stJMlZwLcqISo
         /tI0PCoi2JiSnLSMs/MrgxSURDZTXzJu+kp27N2drxrTWcsjYmFi/HbU6x+eaWXGNMud
         yZ86sz7+DPeOZnjD1s7J0F5yUUAdxpDZHp0NpB6YKQbInRIy4k+lg5ViQTzuI/jOVVWf
         BKJnheCdqsR1JX4OQUREECHlm7o510CegcpHBasPZs8gAcSc0m0Psf4GwgmJ8Y7C/8Tw
         oFDS/dETH1PoRwAHmJNmVK5lelH5DBzMO6JTJyKOWYM6cVAkWtPM7kvIRZHiY97Eg/tQ
         4B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nU98zbeHUSB3tqVcJXipYK+p3cNHClKhOWw1WFHlvLM=;
        b=Imw5/RxXnLWGid4RwTCSkCNn9pXBZ3UE408CKntNn2jUeRcjdZIlWGna1t4gjY2ZYk
         AhrJ5Bs1sLx3WJS+cJZTLNU1ehh+tkSSwPx+gVNUrSgn0RTpXJNKpcmqn+oINf+4m/W1
         hE1IhXTHGGNHq0x91kfQCw918XMKSaF6syn6rNclZ0lZmHTQXI1gJecH/CFGnIynG5gK
         SYkEjapmqljoZwgIaxWp1/XvZPvQfW0k32t6TthCQNAp+Psa8N+T15lkao/TFfLZSQha
         I5EQX8yyyqeVEQSsggd93V9oRpRMOYQkfSKPLs3hrVMs9fPRU6MkOHXLaXWgLdOw9aRm
         K4lA==
X-Gm-Message-State: AOAM532vi171TvetZjyDcJ44L//Bu5T6Ful69E+EaDNVv5qshMKySWSk
	Hx6RK5/NdEV3j3595iQtcbLs/rbsy5F04ACt
X-Google-Smtp-Source: 
 ABdhPJxLlQMNcY+yZKebAw86I2EoTbmAjo1RuaRFoSYid/ULKAu6qLwpcQhpnf+rOw7yxikhSDOBVw==
X-Received: by 2002:a05:6a00:1146:b0:4c9:ede0:725a with SMTP id
 b6-20020a056a00114600b004c9ede0725amr8100958pfm.35.1645799226157;
        Fri, 25 Feb 2022 06:27:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/50] grub: fix wrong handling of argc == 0
Date: Fri, 25 Feb 2022 04:25:48 -1000
Message-Id: 
 <8e537ef16bc1ef4bc807cc165d3b7eb1301578de.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162354

From: Marta Rybczynska <rybczynska@gmail.com>

This change fixes wrong handling of argc == 0 causing a memory leak.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...n-parser-Fix-resource-leak-if-argc-0.patch | 50 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0004-kern-parser-Fix-resource-leak-if-argc-0.patch

diff --git a/meta/recipes-bsp/grub/files/0004-kern-parser-Fix-resource-leak-if-argc-0.patch b/meta/recipes-bsp/grub/files/0004-kern-parser-Fix-resource-leak-if-argc-0.patch
new file mode 100644
index 0000000000..933416605c
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0004-kern-parser-Fix-resource-leak-if-argc-0.patch
@@ -0,0 +1,50 @@
+From 8861fa6226f7229105722ba669465e879b56ee2b Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Fri, 22 Jan 2021 12:32:41 +0000
+Subject: [PATCH] kern/parser: Fix resource leak if argc == 0
+
+After processing the command-line yet arriving at the point where we are
+setting argv, we are allocating memory, even if argc == 0, which makes
+no sense since we never put anything into the allocated argv.
+
+The solution is to simply return that we've successfully processed the
+arguments but that argc == 0, and also ensure that argv is NULL when
+we're not allocating anything in it.
+
+There are only 2 callers of this function, and both are handling a zero
+value in argc assuming nothing is allocated in argv.
+
+Fixes: CID 96680
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=d06161b035dde4769199ad65aa0a587a5920012b]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/kern/parser.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/grub-core/kern/parser.c b/grub-core/kern/parser.c
+index 619db31..d1cf061 100644
+--- a/grub-core/kern/parser.c
++++ b/grub-core/kern/parser.c
+@@ -146,6 +146,7 @@ grub_parser_split_cmdline (const char *cmdline,
+   int i;
+ 
+   *argc = 0;
++  *argv = NULL;
+   do
+     {
+       if (!rd || !*rd)
+@@ -207,6 +208,10 @@ grub_parser_split_cmdline (const char *cmdline,
+       (*argc)++;
+     }
+ 
++  /* If there are no args, then we're done. */
++  if (!*argc)
++    return 0;
++
+   /* Reserve memory for the return values.  */
+   args = grub_malloc (bp - buffer);
+   if (!args)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 678aa5c4e2..2e4e6d7ac2 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -50,6 +50,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-mmap-Fix-memory-leak-when-iterating-over-mapped-memo.patch \
            file://0002-net-net-Fix-possible-dereference-to-of-a-NULL-pointe.patch \
            file://0003-net-tftp-Fix-dangling-memory-pointer.patch \
+           file://0004-kern-parser-Fix-resource-leak-if-argc-0.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


