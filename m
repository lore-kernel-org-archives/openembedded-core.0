Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CAFC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:23 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.9114.1645178782071145580
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pQGTxWXp;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id v12so13677189wrv.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dH/vFu0PyJo8ct9F/gGHDBCxmbgQL3CldTYkZbJavY4=;
        b=pQGTxWXpyY/iwrmeyREbseygASIJNJQUlawfF704QCRGmti6BirD2h3vwoZoxX/cu6
         WHBCuy2gufSKXd0XLoROCWadPJ7Z0nu6eW4+F6e8TLnrcjJYeOmI3JYDFwVNGdGlr0ML
         GUGE/vvuk45JqR+IfSy4p022Xan42h0IzAXxBVwcdWd2FoFNC+epPjfV4YfWXS3Wlt3R
         ZNFES94NWYkIfTjqpCG96sOnoTYZ4tcX+E8G47Y20nB41X9OL7e7ZPErD/KkwbHcXl3b
         XURN+6eyYsnfHvhmMOUspczqxX2EWlXEWYovpRDnkQvkz3ER2gZqZs+PbFaXmFh3XV+0
         h9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dH/vFu0PyJo8ct9F/gGHDBCxmbgQL3CldTYkZbJavY4=;
        b=i/KRJQkFjHtNg9ahiAyMEgv+zNNPwOiwmbtXGpH58ZHsYC7fjnqCKShkQAgyTLBrPP
         FCNV1cY1/rd/T6cDE0a7h1xHysjZaY9+aazOMmVkXrMa1DsrKoH2TtoQNSjwmUD5Q/GC
         E0mK7Kk4jC7gTXPwi8BxebqyRe6Z1/WOtuLkuNdGbqbON2d8vaz8p/eC/WGwgjf6rPD3
         DFtr+hnl3YXpCJATCXQaOOlrZygeern/f8ykxlGxNPat3lsbRV1BjqszGGqsresveeBb
         Tkj2pU91uzD8bTObRQWkB/3RScgMPkMX8lo//lLthrXjihhiFhQpLYjVVtcUD8CqpevE
         +PCQ==
X-Gm-Message-State: AOAM533dhZXmvGnQhHuuCQ80R0iuWZ+Vywx94CE1TWhtMvIlcfnQZCyV
	IBbl0+n88RZwWWesuEty/4M=
X-Google-Smtp-Source: 
 ABdhPJxa10OHzCBvgsVxQY7jmVep2iqD3vRPzbvqO0LELCWcbLGK5nrPYfVoVkGp51elnuMfpxhPgA==
X-Received: by 2002:adf:ef44:0:b0:1e4:99e8:a65e with SMTP id
 c4-20020adfef44000000b001e499e8a65emr5656017wrp.365.1645178780545;
        Fri, 18 Feb 2022 02:06:20 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:20 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 04/46][dunfell] grub: fix wrong handling of argc == 0
Date: Fri, 18 Feb 2022 11:05:12 +0100
Message-Id: <20220218100554.1315511-5-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161892

This change fixes wrong handling of argc == 0 causing a memory leak.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
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
2.33.0


