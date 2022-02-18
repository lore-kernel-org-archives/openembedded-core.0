Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758B0C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.9180.1645178791642819803
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nhmdZzdy;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 k127-20020a1ca185000000b0037bc4be8713so8218506wme.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=up80nopxMnwbVF/uExENh7DUnzPo4xKW9E6MbxjZAQk=;
        b=nhmdZzdy88aKwV2DAeBnjnHBIR/snOr8Y6pJ+PknIM0xaqCa8w4Vj9ozLutP6BsWZV
         A9P33BH3lcDNxU7ERNrbcSQ9pqP2TxDnQ8l7R7t802rDsFJcyERF701LXqf7ggX9LD+u
         Lgq67VKyNe8szsqgJiUhRX18egPJP5Nve1Lf8K8cH4QA178u8dXaJmME1NnCYXy+hNap
         3b+99/gKJHRj16nUWePlQQ2AVN4Fj7+5P1Rcqx85O/GJMlSld3fsrAwqhUPbckvh3jJF
         dU6xG5YUPuVcVR9uUS518mKwuTTtC2jHAPf399SZqlurKymdqP55KpiOpYX9DfxeKXYV
         HgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=up80nopxMnwbVF/uExENh7DUnzPo4xKW9E6MbxjZAQk=;
        b=4/jyJV5deL+74f+ILLhyPohCttM6tEwn+IGil+QLyKHr1/WqDPkbZQfBwrFCjuj3yg
         cA2s8hEwu5qJ7BTmUJdM1+Bwy9GYjyMv/fMMghwbArE9sBBTp6GG0wfTN81ElJpS2imx
         e+r/5n/xj2VEM5zDfX6QWx09NxR3U3XVaK7dF4h2Yf9E3r5ByypeaJnhGjTUluQT4BTl
         UtI847omOTmp2+87WXEnxeZM4Ug9kd3EfL6H8coHGziGM1Vr51+s9ZAEopphVe9NWQ3X
         +NiaDay2El3bstNPsYvYM8uaZdkSxn5iwCbPaI4Nd/xZ1D2MeNMpKShEiTq5y2bDKqOl
         VmAw==
X-Gm-Message-State: AOAM530sWjy9wHI/dctxB/9Qn2KzY1mmNY26IzxBQXWutDbJ3PKwDxgb
	/yWxtVy3/vBg2yLURsaY0Z0=
X-Google-Smtp-Source: 
 ABdhPJwL8uiHGv7NJ6n7ipYuHBzLSMGG0M3SijPKMqhmzM7H86CWi/O4BzYK/jWaeVrlGH5wOJTWnA==
X-Received: by 2002:a05:600c:3486:b0:37c:d45c:179f with SMTP id
 a6-20020a05600c348600b0037cd45c179fmr6319002wmq.6.1645178790053;
        Fri, 18 Feb 2022 02:06:30 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:29 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 13/46][dunfell] grub: add a fix for unnecessary assignements
Date: Fri, 18 Feb 2022 11:05:21 +0100
Message-Id: <20220218100554.1315511-14-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161901

Add a fix for unnecessary assignements grub's io/lzopio. This patch
is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...e-unnecessary-self-assignment-errors.patch | 41 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch

diff --git a/meta/recipes-bsp/grub/files/0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch b/meta/recipes-bsp/grub/files/0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch
new file mode 100644
index 0000000000..1190b0d090
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch
@@ -0,0 +1,41 @@
+From c529ca446424f1a9c64f0007dfe31fa7645d13ac Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Wed, 21 Oct 2020 14:44:10 +0000
+Subject: [PATCH] io/lzopio: Resolve unnecessary self-assignment errors
+
+These 2 assignments are unnecessary since they are just assigning
+to themselves.
+
+Fixes: CID 73643
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=59666e520f44177c97b82a44c169b3b315d63b42]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/io/lzopio.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/grub-core/io/lzopio.c b/grub-core/io/lzopio.c
+index 3014485..a7d4425 100644
+--- a/grub-core/io/lzopio.c
++++ b/grub-core/io/lzopio.c
+@@ -125,8 +125,6 @@ read_block_header (struct grub_lzopio *lzopio)
+ 			  sizeof (lzopio->block.ucheck)) !=
+ 	  sizeof (lzopio->block.ucheck))
+ 	return -1;
+-
+-      lzopio->block.ucheck = lzopio->block.ucheck;
+     }
+ 
+   /* Read checksum of compressed data.  */
+@@ -143,8 +141,6 @@ read_block_header (struct grub_lzopio *lzopio)
+ 			      sizeof (lzopio->block.ccheck)) !=
+ 	      sizeof (lzopio->block.ccheck))
+ 	    return -1;
+-
+-	  lzopio->block.ccheck = lzopio->block.ccheck;
+ 	}
+     }
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 4ddb9fc4f1..1906a28f30 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -59,6 +59,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0010-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch \
            file://0011-gnulib-regexec-Fix-possible-null-dereference.patch \
            file://0012-gnulib-regcomp-Fix-uninitialized-re_token.patch \
+           file://0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


