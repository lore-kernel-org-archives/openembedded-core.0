Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BE4C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 16:52:11 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.306.1643907130894285990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 08:52:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D2/RCzGO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id s10so3653133wra.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 08:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=17OKCSy7GmiwNRC/kwqVSJws5Yj13N6Dxo4jKhCHTvs=;
        b=D2/RCzGOi2Eum7kFBJHYmCvx0Gbci8snYXdFeuFQfPk8RMCWacTCYh0/TnAgbhITQa
         MM6w9vQaoSvBnBgteAEc/e17Qsia1dbmSwACenqGT+qIRaAt712uOQv2JzgHk46MYkJt
         +dnLw/kvu56YRAgCfSAuPFtOnDZKk4QOk3rhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=17OKCSy7GmiwNRC/kwqVSJws5Yj13N6Dxo4jKhCHTvs=;
        b=1MudSX8Lml9nF1v3ru16ZXeJxHkrygCOie0yGlzrdZX3GH7eakPLz/b9LZIWR6TCNZ
         4SYiZn79Aw2RldmR8wFKyxwZKjD68+1e7z7kgOQQ3HNn0HZ/gmyZqrDRegCM/Y2tpt6Z
         hSV36iT1geNansIjlgyu2SNIiGU7hS0wK+EhcxZEmEUu97Zy4YITpENOs5HtkrJJJpNY
         tVdSQaoeAMvYMo9AGLj/BAN6OCfAyY2TXZIp3rFjZHH1vkeuGujy+FruKaHCQarcj7lO
         SNbgKii496v5tL9YgqLZc4H2w33XAmYWiheOcAhtoxRriABg+F9IngmX36U72tnL4pT2
         SjuQ==
X-Gm-Message-State: AOAM533NbLtDUFJwEfEAs7NnMVkcmsFq3t1XW2tNSe0b6k9AHUDaVQtA
	QP9axi/WcPnI8oZG6rZ1Otu02XUO3fpENg==
X-Google-Smtp-Source: 
 ABdhPJypPPcfmTkWV6M8hEnuyg5jftmdLXDWBFp63acfY7wOwyo/yn8tsiE6aUOY3UMqsuOzsLeLKA==
X-Received: by 2002:a5d:43c2:: with SMTP id v2mr3709358wrr.455.1643907129109;
        Thu, 03 Feb 2022 08:52:09 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e772:7635:2207:1103])
        by smtp.gmail.com with ESMTPSA id
 i13sm21089185wrf.3.2022.02.03.08.52.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 08:52:08 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] glibc: Drop prelink patch
Date: Thu,  3 Feb 2022 16:52:07 +0000
Message-Id: <20220203165207.2401847-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220203165207.2401847-1-richard.purdie@linuxfoundation.org>
References: <20220203165207.2401847-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 16:52:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161289

With the removal of prelink, we no longer need the glibc patch for it
either.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ke-_dl_build_local_scope-breadth-fir.patch | 53 -------------------
 meta/recipes-core/glibc/glibc_2.34.bb         |  1 -
 2 files changed, 54 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch

diff --git a/meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch b/meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
deleted file mode 100644
index fb0a609dbbd..00000000000
--- a/meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 50b605dece16606dd9d1c737e579c13725eab11d Mon Sep 17 00:00:00 2001
-From: Mark Hatle <mark.hatle@windriver.com>
-Date: Thu, 18 Aug 2016 14:07:58 -0500
-Subject: [PATCH] elf/dl-deps.c: Make _dl_build_local_scope breadth first
-
-According to the ELF specification:
-
-When resolving symbolic references, the dynamic linker examines the symbol
-tables with a breadth-first search.
-
-This function was using a depth first search.  By doing so the conflict
-resolution reported to the prelinker (when LD_TRACE_PRELINKING=1 is set)
-was incorrect.  This caused problems when their were various circular
-dependencies between libraries.  The problem usually manifested itself by
-the wrong IFUNC being executed.
-
-[BZ# 20488]
-
-Upstream-Status: Submitted [libc-alpha]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
----
- elf/dl-deps.c | 14 ++++++++++----
- 1 file changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/elf/dl-deps.c b/elf/dl-deps.c
-index 087a49b212..c09f9334f2 100644
---- a/elf/dl-deps.c
-+++ b/elf/dl-deps.c
-@@ -73,13 +73,19 @@ _dl_build_local_scope (struct link_map **list, struct link_map *map)
- {
-   struct link_map **p = list;
-   struct link_map **q;
-+  struct link_map **r;
- 
-   *p++ = map;
-   map->l_reserved = 1;
--  if (map->l_initfini)
--    for (q = map->l_initfini + 1; *q; ++q)
--      if (! (*q)->l_reserved)
--	p += _dl_build_local_scope (p, *q);
-+
-+  for (r = list; r < p; ++r)
-+    if ((*r)->l_initfini)
-+      for (q = (*r)->l_initfini + 1; *q; ++q)
-+	if (! (*q)->l_reserved)
-+	  {
-+	    *p++ = *q;
-+	    (*q)->l_reserved = 1;
-+	  }
-   return p - list;
- }
- 
diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index f67ef7818c4..67464d6ce0c 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -42,7 +42,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
-           file://0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
            file://0026-intl-Emit-no-lines-in-bison-generated-files.patch \
            file://0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
-- 
2.32.0


