Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9D8C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:33 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.7357.1651727160845892830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RdPd3EIi;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id j6so6517393ejc.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J5JGoQtPOMdlg5B+6v2FZKOXkxzoXxCd4lyh3/vmkEM=;
        b=RdPd3EIibWaZ7eY5giLeeBwb7GITscYpIStTUl6i8DJ69E460r2Zfdin8tpg+ead9m
         bPcY2aCbJ2gDlKMs2m6ao7QTeXbEFR0CY7q5BHRW+cspM1gJjgaC4+mjwUnGYhBiVw6u
         PgUj2t9ieBmD7gl5bVlt9i0XHsBYXEi8QnlVc/lB4DQw4XM1aETeGY3BZA9Yy/YickXM
         nbWvCPlGCha4tUTHZTjXk7v/gZ9txZy22Mh9YRp7WzDS31pSN83Swm1hPOYYaFS8nZkX
         PYvGFqtFce5h/rpWyD9jEiUSC5fVr/YN8PkxwL8EO/sIOvKFxD8qD6q6sWgAcwKmw3M8
         NzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J5JGoQtPOMdlg5B+6v2FZKOXkxzoXxCd4lyh3/vmkEM=;
        b=XiX8HtE19ykUSB0wGnqi/e9gjDjMMjDWtL3HCQswPFdKeCQR5ewOYe+OGAUXBnTIb7
         EmOtyXXsklgXycQFEx8KBOSo8tMiFoIrGv7gqcuNwwuUZK9wWiZgM7cNUBWnKX+kyeLq
         SxWvhZ/KR/VFpNgUOTzdLCDlX9IgMM3YeGvG/t4oASNJtfEK32xC4g8HBKP/P5sUAlAe
         /cfO13EBZtXI1mL090QttOSURodUQoUWVNcjf+IpJeUNuqrKHBgmjAo/1ZvO06v5W0pM
         43cIXvPuEqixeAVrsZ8RiubVLYRIdybvyPaEXzmSmoQApxrAH03kNrkEEpzvcp6K6fM/
         n8xQ==
X-Gm-Message-State: AOAM532tuOzETVEpJidIBkwqZbD5cLTvc5L0M1oGmCRfHO//gtqb9R6g
	oJEH6o9HexULZry2caIy4gj7ragnmOg=
X-Google-Smtp-Source: 
 ABdhPJwOuP5K5Uc0HZK7FxEz30ZqpeBq+XXf2yyGyQrQZIutKuqhl0BA8Mu1iLp1zvr+i3ozoyz8wQ==
X-Received: by 2002:a17:906:2310:b0:6f3:dad4:e285 with SMTP id
 l16-20020a170906231000b006f3dad4e285mr23477230eja.9.1651727184971;
        Wed, 04 May 2022 22:06:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 48/61] sysvinit: update 3.02 -> 3.04
Date: Thu,  5 May 2022 07:05:31 +0200
Message-Id: <20220505050544.651895-48-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165276

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0001-Fixed-compile-error-on-GNU-Hurd.patch | 28 -------------------
 .../{sysvinit_3.02.bb => sysvinit_3.04.bb}    |  3 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-Fixed-compile-error-on-GNU-Hurd.patch
 rename meta/recipes-core/sysvinit/{sysvinit_3.02.bb => sysvinit_3.04.bb} (96%)

diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-Fixed-compile-error-on-GNU-Hurd.patch b/meta/recipes-core/sysvinit/sysvinit/0001-Fixed-compile-error-on-GNU-Hurd.patch
deleted file mode 100644
index d278a32ec7..0000000000
--- a/meta/recipes-core/sysvinit/sysvinit/0001-Fixed-compile-error-on-GNU-Hurd.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From d595594506e6fd2247f7984c276f822ea626434c Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Thu, 7 Apr 2022 11:57:19 +0900
-Subject: [PATCH] Fixed compile error on GNU Hurd
-
-Fixed compile error on GNU Hurd due to missing MAX_PATH definition.
-
-Upstream-Status: Backport [https://github.com/slicer69/sysvinit/commit/14d8d25269016b26965b428a855dd084cc88994d]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- src/bootlogd.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/bootlogd.h b/src/bootlogd.h
-index b47bc9d..ba17f0c 100644
---- a/src/bootlogd.h
-+++ b/src/bootlogd.h
-@@ -10,3 +10,6 @@
- #define FALSE 0
- #endif
- 
-+#ifndef PATH_MAX
-+#define PATH_MAX 2048
-+#endif
--- 
-2.25.1
-
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.02.bb b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
similarity index 96%
rename from meta/recipes-core/sysvinit/sysvinit_3.02.bb
rename to meta/recipes-core/sysvinit/sysvinit_3.04.bb
index cfe9d0b597..f678f65c1e 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.02.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
@@ -20,9 +20,8 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
            file://rcS \
            file://bootlogd.init \
            file://01_bootlogd \
-           file://0001-Fixed-compile-error-on-GNU-Hurd.patch \
            "
-SRC_URI[sha256sum] = "4ca03ffdbefb5a99a60b94a021693686c2b498a08ff8aa4e859821fa7c39a792"
+SRC_URI[sha256sum] = "2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2b7e3a5"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-- 
2.30.2


