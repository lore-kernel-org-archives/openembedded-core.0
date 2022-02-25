Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F13DC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:05 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.6905.1645799284530948992
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Dqs2jLj3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 j10-20020a17090a94ca00b001bc2a9596f6so4927487pjw.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6LfYOjSHVLKQmxvnol4xKm4mgMWT3i2z+az0A6MkCR8=;
        b=Dqs2jLj3q6ONl/VYTjJSbILJd3vjEJVcYN9kg8SHyp8bW20N9pHrHitU851HikYoWe
         mjs0Hzh977xkKK5rFO2+H1Sg+EtK1zsvI5r6jsMDXa6y/UM4nr2OrkzETaWPItEdzbik
         thc1NYktXKWoLiKGDXHrBlN0Rsfata+ala8U3PP/bVtE8KlH/bCoK0nLmVDPxNAcU8Se
         fGVGXC7Stryi+XShkDVxslfYxI+Gwp1OO1K+Au7AxcQzCF8AvZi6ls5fdKdwCXvT1VOA
         0RwJ+L0ME1zAPPp+7ZEM58ZgdK2WetYFt3WvdmjBsSuW3UDkgjQEi3ZEXC9GF91nFNPy
         239Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6LfYOjSHVLKQmxvnol4xKm4mgMWT3i2z+az0A6MkCR8=;
        b=TYrcLDqacmj2UoNxzBDVyq3V+BMDZagc1KSxn0zK2Hvhr/P7+ajoPV3Fi83yJyHiZu
         eR/0gRyxgLhVdaF2Q98Yep8IltAOpBO2Su+CclWipNqklTL2f7ydaacaZ8WtF6+leIv/
         5GAYGEeJLwCSolQAo5ZSoKR5f7YlSSulKuffQKvCRJQ/KyF1jwFIQfMbKpvX+PGdxEX3
         At3WwiWyeTJjHPm9Ub8p6ToZcClCSasqNFmChhctUpZgpvNWwyPclenOw+ddfnq3H4Uq
         udhSXJdYJSGP85fpPgMc1/ERlUrEjBEqNInz0wlHq8BR/MgYUmGL9HD26CwVp0HyYp7d
         zEzA==
X-Gm-Message-State: AOAM531n30FjbBymXwfCqzPuT5N7gtpGWW0j8c4LBYQtk0sQIa3j36ds
	uKvuQQPwx7ny0n9/J4LZXrPaQR443keKGgDf
X-Google-Smtp-Source: 
 ABdhPJzc4Q9FJnYM+XHbTTuCoVqA5Npz4as8QTcxxn/eWvO1XL1/CUJBCS+yyQ9D5jzh1LUT6A1CEg==
X-Received: by 2002:a17:90a:2e0e:b0:1bc:dbe:2d04 with SMTP id
 q14-20020a17090a2e0e00b001bc0dbe2d04mr3466595pjd.74.1645799283552;
        Fri, 25 Feb 2022 06:28:03 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 33/50] grub: add a fix for a memory leak
Date: Fri, 25 Feb 2022 04:26:13 -1000
Message-Id: 
 <e58e6e646c2efb91dba3ffa6db3a43b7972f0c87.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162379

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for a memory leak in grub's normal/completion.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...n-Fix-leaking-of-memory-when-process.patch | 52 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0029-normal-completion-Fix-leaking-of-memory-when-process.patch

diff --git a/meta/recipes-bsp/grub/files/0029-normal-completion-Fix-leaking-of-memory-when-process.patch b/meta/recipes-bsp/grub/files/0029-normal-completion-Fix-leaking-of-memory-when-process.patch
new file mode 100644
index 0000000000..8a26e5bc5b
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0029-normal-completion-Fix-leaking-of-memory-when-process.patch
@@ -0,0 +1,52 @@
+From 2367049d2021e00d82d19cee923e06a4b04ebc30 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Fri, 4 Dec 2020 18:56:48 +0000
+Subject: [PATCH] normal/completion: Fix leaking of memory when processing a
+ completion
+
+It is possible for the code to reach the end of the function without
+freeing the memory allocated to argv and argc still to be 0.
+
+We should always call grub_free(argv). The grub_free() will handle
+a NULL argument correctly if it reaches that code without the memory
+being allocated.
+
+Fixes: CID 96672
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=9213575b7a95b514bce80be5964a28d407d7d56d]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/normal/completion.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/grub-core/normal/completion.c b/grub-core/normal/completion.c
+index 5961028..46e473c 100644
+--- a/grub-core/normal/completion.c
++++ b/grub-core/normal/completion.c
+@@ -400,8 +400,8 @@ char *
+ grub_normal_do_completion (char *buf, int *restore,
+ 			   void (*hook) (const char *, grub_completion_type_t, int))
+ {
+-  int argc;
+-  char **argv;
++  int argc = 0;
++  char **argv = NULL;
+ 
+   /* Initialize variables.  */
+   match = 0;
+@@ -516,10 +516,8 @@ grub_normal_do_completion (char *buf, int *restore,
+ 
+  fail:
+   if (argc != 0)
+-    {
+-      grub_free (argv[0]);
+-      grub_free (argv);
+-    }
++    grub_free (argv[0]);
++  grub_free (argv);
+   grub_free (match);
+   grub_errno = GRUB_ERR_NONE;
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index c965f0fd15..1460e559b9 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -75,6 +75,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0026-libgcrypt-mpi-Fix-possible-unintended-sign-extension.patch \
            file://0027-libgcrypt-mpi-Fix-possible-NULL-dereference.patch \
            file://0028-syslinux-Fix-memory-leak-while-parsing.patch \
+           file://0029-normal-completion-Fix-leaking-of-memory-when-process.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


