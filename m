Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8539C10F05
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 20:25:59 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.62459.1702239956444653511
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 12:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lWAZAe3o;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3ba00fe4e94so764025b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 12:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702239955; x=1702844755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRuwU74llJjKIV0kLILKg1+5kmC369o23nIKVTgdeZk=;
        b=lWAZAe3oa8niyCMrGgJlfK0l9/x/bpOEM9Pt4yfDAiNeB+8fyUooaU3Tu4joly03aM
         12d0/GzAVe8ot6HKiK1TL1ca4+xmoOZ7SEYVyW5dK1c3EretU/T5kwQOpqdEC4/Rw85D
         pzeK4O8t9T00x4Vnydy06qfgP3Ns6/eQO5WaT0qiskjoNLb5t5QG4YAT7M9mOxf3o/cX
         98KEtXXEdGXEthCSDlOFbNtSVcsoq2MD/zLFwLDqM5BO9IgitpAWp5AC0T4eTXaxkQKg
         iKm3LUWAiflj1OXE7fNjhfRjvk4Q0rgjbsuFOp/xKjJ8kWDflGhsCaa4i38iyPgg7Kzh
         qPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702239955; x=1702844755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRuwU74llJjKIV0kLILKg1+5kmC369o23nIKVTgdeZk=;
        b=ir2uUW9cfYqWhlvgJH2G66utPzu52Us/m0XxcnBnVj0Bm3xczzrlQZRlCmSP+WtOnO
         v7MQ18yxsOfpOgFvITPmXQ6IK0edwcXgGO5A1dAJo9a4XCeAR4ZgMWGnjitZdwbdteyb
         0TTKjYq3nxzygzpMasAKVbZ/a2wfIqXDIiTF+uREUs8QkMDzjuFJ0H8AA/n3rwxOU3ua
         /PteMsdMMa94TYfNrZXMHwmnWFBZZqRHkZm8kszEjujUjpjuiTeVIVolT6B3qQ1NRIXQ
         2YCUG/YqbJ+tvDJKwt8Sx+ti+e3mhPwcz5IPLCK2awG8fBD7raAraRnGYvEG0VWgWKfS
         enzg==
X-Gm-Message-State: AOJu0YyshlCUgGncUSxqq/5ztRm8Fbm7FOAvNcTIffsso8AlsPncbtFC
	cXpNNzG0lui5duyfoj3SJ3NWaG6xJyw=
X-Google-Smtp-Source: AGHT+IEufExbUT89AjohcMqfkHxS9jSjyGern2ofNw/8/njNjZ6JGP001jP47CbQQ/n3Y7DmGQg2fw==
X-Received: by 2002:a05:6808:158d:b0:3b9:bccd:1b08 with SMTP id t13-20020a056808158d00b003b9bccd1b08mr4402567oiw.32.1702239955485;
        Sun, 10 Dec 2023 12:25:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:3d00::76f0])
        by smtp.gmail.com with ESMTPSA id y24-20020aa78558000000b006cee23e7677sm4246487pfn.210.2023.12.10.12.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 12:25:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/6] sysvinit: Include libgen.h for basename API
Date: Sun, 10 Dec 2023 12:25:48 -0800
Message-ID: <20231210202549.155550-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231210202549.155550-1-raj.khem@gmail.com>
References: <20231210202549.155550-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 20:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192123

This fixes build with latest musl which drops basename declaration API from string.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...wn-include-libgen.h-for-basename-API.patch | 38 +++++++++++++++++++
 meta/recipes-core/sysvinit/sysvinit_3.04.bb   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-libgen.h-for-basename-API.patch

diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-libgen.h-for-basename-API.patch b/meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-libgen.h-for-basename-API.patch
new file mode 100644
index 00000000000..5e4053bad1d
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-libgen.h-for-basename-API.patch
@@ -0,0 +1,38 @@
+From a07c1d94e79840c59563741b45e690e77d4f3dfa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 3 Dec 2023 20:09:30 -0800
+Subject: [PATCH] hddown: include libgen.h for basename API
+
+musl has removed the non-prototype declaration of basename from string.h [1] which now results in build errors with clang-17+ compiler
+
+include libgen.h for using the posix declaration of the funciton.
+
+Fixes
+
+hddown.c:135:8: error: incompatible integer to pointer conversion assigning to 'char *' from 'int' [-Wint-conversion]
+  135 |                         ptr = basename(lnk);
+      |                             ^ ~~~~~~~~~~~~~
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://github.com/slicer69/sysvinit/pull/21]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/hddown.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/hddown.c b/src/hddown.c
+index 7a2cf28..3b31bc0 100644
+--- a/src/hddown.c
++++ b/src/hddown.c
+@@ -24,6 +24,7 @@ char *v_hddown = "@(#)hddown.c  1.02  22-Apr-2003  miquels@cistron.nl";
+ #ifndef _GNU_SOURCE
+ #define _GNU_SOURCE
+ #endif
++#include <libgen.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.04.bb b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
index 76b187c1961..6a612468f35 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.04.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
@@ -21,6 +21,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
            file://rcS \
            file://bootlogd.init \
            file://01_bootlogd \
+           file://0001-hddown-include-libgen.h-for-basename-API.patch \
            "
 SRC_URI[sha256sum] = "2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2b7e3a5"
 
-- 
2.43.0


