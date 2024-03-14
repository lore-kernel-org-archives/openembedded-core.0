Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607C3C54E5D
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 04:31:43 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.4281.1710390694266470308
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 21:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G3P9AH7K;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dd9066b7c3so3967415ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 21:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710390693; x=1710995493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffWz4WAPAr7E1jr+dHFUgMqwJHZtvQeu67RcqaPiDQo=;
        b=G3P9AH7KyGqAWy21sYuy8NhGkuTG5hMmFwNyGhmfDukxFXIrtBOTUr1K3Wyafps9OH
         jzNMFT+ZG1JfUDM9vQikjlghABg0zGWi6ZwBCl1Xe2HoHisangSmvYFmg9D732/ihQ1W
         KoCCPK5LSsPkpNwhet0LOGEmdfo+gGLnI17141PZO96GmUsGHIhKfchZHsxlpmBmuiLC
         ImCDYA/h32LgqJH1Mvn4wW0f4487IOgPgbRsmM/J2TNf9B8XOjXQ4iCncAArCitWWf99
         ft7fGMsnALfeKxooO0KbKc77DdR+LldJQhVI+794LBMxXYM1htHoY5ku7T6TI6cq3Rf1
         ULqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710390693; x=1710995493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffWz4WAPAr7E1jr+dHFUgMqwJHZtvQeu67RcqaPiDQo=;
        b=vSeZcVJe4BczvGwJlgCkEHDQJSYKi0XhHPdIbiArls4/Q6mZixdERVQ0O7XJ+cu9IN
         C/XwCuBWerk3ff+9ooMZ1bGMMZdwZxg67W2y7dXgeHw6mocXvrQ9RZqCqlAy3gdBsqbe
         OBDLiOSybHQqHik2sxlA3+TmYt+duOKXAcZpvZY+DsxUnoDdDHV1YJNaYqLd8XlzM48P
         eJLwLdCpaUgp/Aqe2u/HbK3vUJgeWs02dPsI5rI4IU5z1Z3E5sGvah2nmmibpyYfjnVe
         P+DNIizndZRsCGckWMY2fNnoQsZEWAFVBjhpaM35Au2FTh/QY9x3UJae4xJqMJayxr3Q
         DTfg==
X-Gm-Message-State: AOJu0Yx1jMIquOY7pXdlNy2bQwEqOE/jU60BmaeI4wDyxC+LcYY8Mmmt
	O/ZlO+cc455lVr5b8i3RXEs4YZLSMzHjoJGD8SSAiW+PUd9fl79XFC5PGJ8M
X-Google-Smtp-Source: AGHT+IGWyoAGlyfM1OXP0LQSzNX1BisX49eHFA4XtDsU7lo4iPd92aU7vSNc1LLqRQy9KG1Zg0GQYw==
X-Received: by 2002:a17:902:ecd2:b0:1d9:8832:f800 with SMTP id a18-20020a170902ecd200b001d98832f800mr984218plh.8.1710390693406;
        Wed, 13 Mar 2024 21:31:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::18b])
        by smtp.gmail.com with ESMTPSA id n13-20020a170902e54d00b001dd38bce653sm492919plf.99.2024.03.13.21.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 21:31:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] pam: Fix build with musl
Date: Wed, 13 Mar 2024 21:31:31 -0700
Message-ID: <20240314043131.542711-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 04:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197097

Apply a backported patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-pam_namespace-include-stdint-h.patch | 42 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.6.0.bb     |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/0001-pam_namespace-include-stdint-h.patch

diff --git a/meta/recipes-extended/pam/libpam/0001-pam_namespace-include-stdint-h.patch b/meta/recipes-extended/pam/libpam/0001-pam_namespace-include-stdint-h.patch
new file mode 100644
index 00000000000..124e5f1c3c4
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/0001-pam_namespace-include-stdint-h.patch
@@ -0,0 +1,42 @@
+From cc9d40b7cdbd3e15ccaa324a0dda1680ef9dea13 Mon Sep 17 00:00:00 2001
+From: Jacob Heider <jacob@pkgx.dev>
+Date: Wed, 17 Jan 2024 11:49:26 -0500
+Subject: [PATCH] pam_namespace: include stdint.h
+
+pam_namespace.c makes use of SIZE_MAX but doesn't include stdint.h,
+resulting in the following build failures on 1.6.0:
+
+  pam_namespace.c: In function 'process_line':
+  pam_namespace.c:649:41: error: 'SIZE_MAX' undeclared (first use in this function)
+    649 |         if (count > UINT_MAX || count > SIZE_MAX / sizeof(uid_t)) {
+        |                                         ^~~~~~~~
+  pam_namespace.c:41:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
+     40 | #include "argv_parse.h"
+    +++ |+#include <stdint.h>
+     41 |
+  pam_namespace.c:649:41: note: each undeclared identifier is reported only once for each function it appears in
+    649 |         if (count > UINT_MAX || count > SIZE_MAX / sizeof(uid_t)) {
+        |                                         ^~~~~~~~
+
+Fixes: v1.6.0~100 ("pam_namespace: validate amount of uids in config")
+Resolves: https://github.com/linux-pam/linux-pam/issues/733
+
+Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/cc9d40b7cdbd3e15ccaa324a0dda1680ef9dea13]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/pam_namespace/pam_namespace.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespace/pam_namespace.c
+index f72d67189..b16731c22 100644
+--- a/modules/pam_namespace/pam_namespace.c
++++ b/modules/pam_namespace/pam_namespace.c
+@@ -34,6 +34,8 @@
+ 
+ #define _ATFILE_SOURCE
+ 
++#include "config.h"
++#include <stdint.h>
+ #include "pam_cc_compat.h"
+ #include "pam_inline.h"
+ #include "pam_namespace.h"
diff --git a/meta/recipes-extended/pam/libpam_1.6.0.bb b/meta/recipes-extended/pam/libpam_1.6.0.bb
index bbea008d552..e1ed940d1eb 100644
--- a/meta/recipes-extended/pam/libpam_1.6.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.6.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://libpam-xtests.patch \
            file://run-ptest \
            file://pam-volatiles.conf \
+           file://0001-pam_namespace-include-stdint-h.patch \
            "
 
 SRC_URI[sha256sum] = "fff4a34e5bbee77e2e8f1992f27631e2329bcbf8a0563ddeb5c3389b4e3169ad"
-- 
2.44.0


