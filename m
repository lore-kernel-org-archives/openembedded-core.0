Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797BBC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:07:03 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.9095.1645178822336710130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=exUNkfoq;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id v12so13680422wrv.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=95zYeBRktPqabbGoTbLockpLIb9ujYHVc5tFNXim8vA=;
        b=exUNkfoqyyxrySpORLslbg72EygtdQg5zLqsBa1u0ASRBsR8znQMxQZ8b6Tk57otWe
         qN7TCjOAwxnMBcYocXjDyv4XZ5lNiQ0xyt9g6SbKXVvJ6pcnmJoe5Tvd8h3S29wgcHHM
         DFA3HxnXeVPv5XBou6vXPM1/acind9OJHiVGuOpL1UNAacFR+iFpEy69NEplLB2SBfF+
         ZY3bL4GrxjGOC7PgulthO4AeVEdX4g+srZZjLVVxkB8JK2/KqC5e87a/i9nzNRMc8hWu
         m0JuTJxkS/L6t1U8polEKA9Br69Ex3ZKw6S6JsUgxkusk/GynCWJ2V96VQWbECfZ4nLK
         bc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=95zYeBRktPqabbGoTbLockpLIb9ujYHVc5tFNXim8vA=;
        b=G9BXVLKkCJMbSxjTN8Vk36qj0+bbQWCXrDAlAyZJK/l+IC7q7h5e0NjYm+vLoP/gqx
         vb1LHjMi3TbSQd7X0blEhrTYTjxFPmkw1FjuQWfr7atL06oB21C21auI1FXlLqcWnO3W
         PlFuRFYxLyvZVDdvj9jOtJyWfIScW1towin8PLoaqqMzZZZ+3FnpxdJcEwFZ/NpnM05e
         LagBBiSPxHU0xpyhdf41YW77rdW3BTJTxoQ31eh9j8PEeLbeIZ/elw2Q/2YiOxAVvZ/c
         apNXueg4k5SBc3gRhYUEnkUlUhHBxhy47L7CNCDXmQ3jjEiQIe20+qV8BAkJWct7HCqq
         wBYQ==
X-Gm-Message-State: AOAM5307LPHZoKxzexcqKxJdFrsZBkzlxi8aEzfHKt2J4mcjWKmElkJU
	BNmwBb7ydxf7W1Zps3wvfcw=
X-Google-Smtp-Source: 
 ABdhPJyFQU+eZPJFKXkbKjkogw0i8O33EgtASodHFxRSj35/Qk4xX8m1I48qc1ZKIuv9jbOP86jZlg==
X-Received: by 2002:adf:e942:0:b0:1e3:353:d162 with SMTP id
 m2-20020adfe942000000b001e30353d162mr5426465wrn.299.1645178820920;
        Fri, 18 Feb 2022 02:07:00 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:07:00 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 42/46][dunfell] grub: add a fix for an incorrect cast
Date: Fri, 18 Feb 2022 11:05:50 +0100
Message-Id: <20220218100554.1315511-43-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:07:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161930

This patch adds a fix for incorrect casting from signed to unsigned
in grub's util/grub-editenv. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...v-Fix-incorrect-casting-of-a-signed-.patch | 46 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch

diff --git a/meta/recipes-bsp/grub/files/0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch b/meta/recipes-bsp/grub/files/0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch
new file mode 100644
index 0000000000..0cd8ec3611
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch
@@ -0,0 +1,46 @@
+From 3d68daf2567aace4b52bd238cfd4a8111af3bc04 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 5 Nov 2020 14:33:50 +0000
+Subject: [PATCH] util/grub-editenv: Fix incorrect casting of a signed value
+
+The return value of ftell() may be negative (-1) on error. While it is
+probably unlikely to occur, we should not blindly cast to an unsigned
+value without first testing that it is not negative.
+
+Fixes: CID 73856
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=5dc41edc4eba259c6043ae7698c245ec1baaacc6]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ util/grub-editenv.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/util/grub-editenv.c b/util/grub-editenv.c
+index f3662c9..db6f187 100644
+--- a/util/grub-editenv.c
++++ b/util/grub-editenv.c
+@@ -125,6 +125,7 @@ open_envblk_file (const char *name)
+ {
+   FILE *fp;
+   char *buf;
++  long loc;
+   size_t size;
+   grub_envblk_t envblk;
+ 
+@@ -143,7 +144,12 @@ open_envblk_file (const char *name)
+     grub_util_error (_("cannot seek `%s': %s"), name,
+ 		     strerror (errno));
+ 
+-  size = (size_t) ftell (fp);
++  loc = ftell (fp);
++  if (loc < 0)
++    grub_util_error (_("cannot get file location `%s': %s"), name,
++		     strerror (errno));
++
++  size = (size_t) loc;
+ 
+   if (fseek (fp, 0, SEEK_SET) < 0)
+     grub_util_error (_("cannot seek `%s': %s"), name,
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 7ca0b469e9..a1fbc5e644 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -88,6 +88,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0039-loader-xnu-Free-driverkey-data-when-an-error-is-dete.patch \
            file://0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch \
            file://0041-util-grub-install-Fix-NULL-pointer-dereferences.patch \
+           file://0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


