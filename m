Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FEFC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:42 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.7087.1645799322174332903
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=s6LsyqKW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id s1so4926864plg.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1b0ncTD1okVKZEW7vWIePMxkJeKyogxDVnp/ryFmBZ0=;
        b=s6LsyqKWiktaJ3QkhRmbxWjl0emIZhfQCwpaZsfY/6BuGxZ9tYPJksG9wcDuExo8WD
         d+DIuSaYj00LaEp9Wp0Al0TVtK96OfLzhpBRP+0GB0k5gFRVlKoRWGTgIq4zcSLhVpPD
         wODKeZoo7R4ee1ZITn9RvGUBXc1NkrBzevlr5++rQazrhO+nwfBq9IIh/9EVxncOuOiU
         i3K+kuQSee1Pmlw+/WB5Ad2ZZh+wNvtJMwk77ljyJqVOp7rD9i//pmd0pt8A/l+vMR6z
         D9gPg/Jgf5ziUKFgKMEn89BLAwnOAgW99TU/4q4ZPKfdPtGomMk7jtJZFmfRB+ARoC5n
         y+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1b0ncTD1okVKZEW7vWIePMxkJeKyogxDVnp/ryFmBZ0=;
        b=H+ybDZ1mx1m33ceRY9qvgfx2VMmm4PBueOo2Lr8AZZMLcACrBlIlAA3FsWpe/hISOA
         sUEVzdkAF/XGUteAUbzP1B/sNj7W4uDEoP02aqZIrNzSWra7UMtrn3mj66smRTDytu/L
         ejJlDdmnXEN8oFaaCmyeYocw3sBaja9eo8a7b1GESQqW3XU09ynEs3cB7ctffWKGbsD8
         ZSRSgzJBpNOzqJLEXR38lxZirX99E/Lg77FGDJxk0GwgHzJHnsg5K5272y46aUhlTzpV
         Nc09OPlOnLS/YwLdE8dvGCepfIdCxLeoRXcyycNEHPaHXDZmgAjzKCrUDVY+jzqAszxK
         300A==
X-Gm-Message-State: AOAM530Gwng+U8/RT4YVRVUCv7owrgeE97BPRX9TIXCzMhlu0dIFOxBr
	9z6vXF5uHvKNoxVMXmIOUXaIg9d3QqxMbPLc
X-Google-Smtp-Source: 
 ABdhPJw404L35duxXPXZgG/BETM849axv2GhZJamusYjLhUs2y6eLI9Y2J1jE4xfys+2UhFN3SFhiA==
X-Received: by 2002:a17:90a:4581:b0:1bc:d215:8722 with SMTP id
 v1-20020a17090a458100b001bcd2158722mr3403926pjg.149.1645799321268;
        Fri, 25 Feb 2022 06:28:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 50/50] grub: add a fix for a crash in scripts
Date: Fri, 25 Feb 2022 04:26:30 -1000
Message-Id: 
 <79ce9059f716546a7d6f4562ba194aedd90c22cd.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162396

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for a crash in grub's script handling. It is
a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...void-crash-when-using-outside-a-func.patch | 37 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0046-script-execute-Avoid-crash-when-using-outside-a-func.patch

diff --git a/meta/recipes-bsp/grub/files/0046-script-execute-Avoid-crash-when-using-outside-a-func.patch b/meta/recipes-bsp/grub/files/0046-script-execute-Avoid-crash-when-using-outside-a-func.patch
new file mode 100644
index 0000000000..84117a9073
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0046-script-execute-Avoid-crash-when-using-outside-a-func.patch
@@ -0,0 +1,37 @@
+From df2505c4c3cf42b0c419c99a5f9e1ce63e5a5938 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Mon, 11 Jan 2021 17:30:42 +1100
+Subject: [PATCH] script/execute: Avoid crash when using "$#" outside a
+ function scope
+
+"$#" represents the number of arguments to a function. It is only
+defined in a function scope, where "scope" is non-NULL. Currently,
+if we attempt to evaluate "$#" outside a function scope, "scope" will
+be NULL and we will crash with a NULL pointer dereference.
+
+Do not attempt to count arguments for "$#" if "scope" is NULL. This
+will result in "$#" being interpreted as an empty string if evaluated
+outside a function scope.
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=fe0586347ee46f927ae27bb9673532da9f5dead5]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/script/execute.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/script/execute.c b/grub-core/script/execute.c
+index 5ea2aef..23d34bd 100644
+--- a/grub-core/script/execute.c
++++ b/grub-core/script/execute.c
+@@ -485,7 +485,7 @@ gettext_putvar (const char *str, grub_size_t len,
+     return 0;
+ 
+   /* Enough for any number.  */
+-  if (len == 1 && str[0] == '#')
++  if (len == 1 && str[0] == '#' && scope != NULL)
+     {
+       grub_snprintf (*ptr, 30, "%u", scope->argv.argc);
+       *ptr += grub_strlen (*ptr);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 0454b09d52..75ef31f249 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -92,6 +92,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch \
            file://0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch \
            file://0045-commands-ls-Require-device_name-is-not-NULL-before-p.patch \
+           file://0046-script-execute-Avoid-crash-when-using-outside-a-func.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


