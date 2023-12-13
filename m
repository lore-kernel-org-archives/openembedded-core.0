Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA50C4167D
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 20:41:05 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.48310.1702500058569929922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 12:40:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FVvx3j43;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-28b012f93eeso386496a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 12:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702500058; x=1703104858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nN8LSKuaDIDJIHiYs4+4AGFZle5FPmcdw3t10r6Zvho=;
        b=FVvx3j43uhjFP5997W6eBtV0rRxNKsvKX/wRn2ACfbbNW79J6HixmkF2EInVBeNITf
         ogU1H0+jh7yvV4EzR5QvyRvxUa4fQiIzxFDPAlsotaMywz3hVzcDAnKuOE18fGExY/UV
         3N4PndfYElUT//18jov3K2h5PnwELON2qcW0eM0Tfyy6pRIHWpphp1pv0k8nKO30DGuq
         ruKmJ9481gMiN5/c9ERJmeINGCYHjj7riusDHzF2n8px7WK9ZI3jmLUkkVk99MxSXvdA
         Q/ok6rEoOM4k9XGpyojk2qg0c7Hy20iGVQfkwc6wzxGXrLa+YZkeJe2evd/H+XjtQBjH
         r6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702500058; x=1703104858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nN8LSKuaDIDJIHiYs4+4AGFZle5FPmcdw3t10r6Zvho=;
        b=YzgkrjAO7/skLmPdFuse/uHD0ZJntfjPZoNiEenoHh7MQvneD02ynZVDSHRM3tD0aw
         oPjvsqdvcPC/vVNbfSDwur7pGFHrmIkjH8MYQF67xG7HT2gPeNULNUyAdZZ9yX8s438L
         M04R1Tf65UQd6SDWeRU7OUdw1Mf9HbJY1d6LWAQ1ODYScYfHrGxxjpPRvFVtSXmbbW7o
         9b8y0SJXTaYqAMUS5Ji14Kio15rGWZZETiS1zDum7g8NEpKrG5/svfgO4ar+WSc/fN+9
         ESSAURmqIguz1Zp4WX91oC2qmMTzki05UgzXcoZnFiijC4M0kX6rZKmXu0JH4BbnFRX3
         /tog==
X-Gm-Message-State: AOJu0Ywua3evOaHbhiPF30yBk2yzos9ygHSLi6gTfQGdnF1sa/oeDBOo
	FiyJ3JslyJL+RZgT9TyaVD9TTZsc+PI=
X-Google-Smtp-Source: AGHT+IHncpe9/kpdLJX+uUv80pXmxTCeq8XaI6p6Tlk/3ArdZgfGw2KwtI9IiGzUPdoMNreU6xn/wQ==
X-Received: by 2002:a17:90a:bc94:b0:28b:3d1:b372 with SMTP id x20-20020a17090abc9400b0028b03d1b372mr236560pjr.96.1702500057597;
        Wed, 13 Dec 2023 12:40:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id 5-20020a17090a018500b0028658657e9csm12497570pjc.46.2023.12.13.12.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:40:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] systemd: Fix build with latest musl
Date: Wed, 13 Dec 2023 12:40:53 -0800
Message-ID: <20231213204055.4183701-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 20:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192317

musl has removed basename from string.h [1] which leads to build
failures now as declaration is gone and it should be coming from
libgen.h

[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...patible-basename-for-non-glibc-syste.patch | 22 +++++++------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index 7d74cfcc245..24dd6b0df17 100644
--- a/meta/recipes-core/systemd/systemd/0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -13,22 +13,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/machine/machine-dbus.c | 5 +++++
  1 file changed, 5 insertions(+)
 
-diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
-index 45bc056326..aee51d5da5 100644
---- a/src/machine/machine-dbus.c
-+++ b/src/machine/machine-dbus.c
-@@ -4,6 +4,11 @@
- #include <sys/mount.h>
- #include <sys/wait.h>
+--- a/src/basic/string-util.h
++++ b/src/basic/string-util.h
+@@ -26,6 +26,10 @@
+ #define URI_UNRESERVED      ALPHANUMERICAL "-._~"       /* [RFC3986] */
+ #define URI_VALID           URI_RESERVED URI_UNRESERVED /* [RFC3986] */
  
 +#if !defined(__GLIBC__)
-+#include <string.h>
 +#define basename(src) (strrchr(src,'/') ? strrchr(src,'/')+1 : src)
 +#endif
 +
- #include "alloc-util.h"
- #include "bus-common-errors.h"
- #include "bus-get-properties.h"
--- 
-2.39.2
-
+ static inline char* strstr_ptr(const char *haystack, const char *needle) {
+         if (!haystack || !needle)
+                 return NULL;
-- 
2.43.0


