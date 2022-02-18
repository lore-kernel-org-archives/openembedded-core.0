Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A5EC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.9090.1645178808940545847
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pBAHEit1;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso6007025wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BycceO+JRXOouZrc6IZe0czYRxhAYwbX6v2oy0kmNLo=;
        b=pBAHEit1XeHItlqu6e9ZG0AQVXO4hi644KPTf/ncV7CtvvN83K4CDRahwmV5OOwYPC
         GtX/mAjAd37N2EX0teymUDL5QFA8nyqmtZds3N9IKuWH7GLTQ1ezanTH1Qiv7LuGU2CE
         pwrwfsl9y+mp2aeomtaM71u0DEiVj5ninRqiNt5pyUZu8lWcTgmx9ytp2v5j4I2aXAmN
         YTmNNgqrRktlxTtL2oAxp6xiHLg9w9oNiCnOXR0qZgtQZ4JC8PR7PQqVIm52iH8WIPJj
         LiGt3bU6fcL5/VOh2MZ7ZPJghgBJNAkB4PZTsqsUJtl5rjwbWu8Cf3lOWm1N/fMd2YCe
         tj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BycceO+JRXOouZrc6IZe0czYRxhAYwbX6v2oy0kmNLo=;
        b=XG1iGuTiSe9SGTZDvZXYIT0XGoLrCv34ig0iUKRg0FkW5IUKGAl69B0ZWHWgikSCna
         jIAOrdmSIybA1cQwPwjqtciEmVjwyVI5v4ZwSbw/LhjMwjsCoLjxuPb8aCQ/bmEKJiyB
         shEy8KCrB2O0TX3vfz6n71BMvF/Q2LkcqdAyoVW9GVQYzHiPYuPRRCBa3D8Ge+66Lw7a
         sx8Ob7i1RDBi/OGt/Xic6A7sgUFhWdyrxHNAEIGkQAhYVhMnIlMo9AcJOk9trKhJpRnt
         qFhrxa1+y3lgB1bIJA/9PORcBhKtGMXoHAY6iJ8dMlhKsDO3A4UpZdnucukAwcLNeVQB
         aXdg==
X-Gm-Message-State: AOAM530xXloM3mTFqkQaeSD6mgAqGT5LMdwDcdhvf1MuXiFFvo1oWXUK
	Q8vE3p7AsQs1jp8B8PN/LNI=
X-Google-Smtp-Source: 
 ABdhPJwKqYNMy5YF8NldWdfLgPKwOOcco7LhKsXrNzEAl3OosUAU2n1W2nyflXSRNuzrc6AmCsUzjg==
X-Received: by 2002:a05:600c:3512:b0:352:d502:bd0c with SMTP id
 h18-20020a05600c351200b00352d502bd0cmr9695016wmq.164.1645178807423;
        Fri, 18 Feb 2022 02:06:47 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:46 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 29/46][dunfell] grub: add a fix for a memory leak
Date: Fri, 18 Feb 2022 11:05:37 +0100
Message-Id: <20220218100554.1315511-30-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161917

This patch adds a fix for a memory leak in grub's normal/completion.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
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
2.33.0


