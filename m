Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC83CD4F44
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 21:33:30 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.62256.1725485608142033302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 14:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0Yh5YMKc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2da4ea59658so36708a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 14:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725485607; x=1726090407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PSxVDKldkfaBqlpFMUFPtsCp/IcCx1CjI8oj5Em4hs=;
        b=0Yh5YMKcIMHwBi28XN88N1Fqzu14VSPr8xtwVGH4mJzQZJjZs1zK5hTDJhHDM1Lbd0
         W/crJ4j6MriOOtILaZ7xK6RpJ6NSJUCwyiHQ5iEvkxJ552vFczCeRQRw8KF6pqa2i94O
         BPFhurSkJTeOgEyyHyXbNJBWLUfnEy86+H0B1ftd2tPVJ9oYd1VjD6RSf8AcCqc6isJ7
         nSgyYfabPqMsBPi1J4Dw3psyhv9c0GVJZc79HLukWzUZBXdmVbgsYdShuJt7BjeXvqJ5
         zBC/0woPXvVOqQWywlkW5O02UZw9N0dWTNjMWsl7F6PQu4oa9j+2YvsJ5Pch1h/Ip8C/
         vMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725485607; x=1726090407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PSxVDKldkfaBqlpFMUFPtsCp/IcCx1CjI8oj5Em4hs=;
        b=tkW4CIULNEc+F8jWl0ftM+92aQbm5kSy9Nkst6tUXtqv8XKIjtfSz0Q46UeO7hFJOD
         ae94oQnU/LcEPIFrpzDR8Awkfprt/9reyzmXx54jQeoaFjlYC0MWMgE8K7wKIwrp1mzB
         YoKUUJyxo5PzkMeTwC9ZrNvMFRzar4YJhXlmpw33WoVczUS6VCROjcPyt6Uz4jKuNfo4
         kyU4QE6XBDVbHQS+4RU0XKfAbwavwiE4opfWFcW2G1R0aPxVWKDlPzWrdWhCuGkp5vvd
         9q5eFQZPHajq1rFeurQzHVP/3Yv928wNv3G3U+JjINU/JIa/N9friL64Y4U4XRA2THoA
         bG2A==
X-Gm-Message-State: AOJu0Yx2mudpFBr+3Hyn8LCLPGqy6v0jTE0dxIV4ppa/7jCMwJ+T6nUB
	l7bqo5vQ+Ld5Hkvpw3qwWa0YKNI3wsRwH6O9TtlXVGRWb+PCsk03evW5aoyn1ODMI4LSjB5m4hv
	811g=
X-Google-Smtp-Source: AGHT+IER62xpw3fXcFSeE0zF6OgLMrp7bi3sWkkNz1Jyco0RT7hod4iUzb/ym0tNRl+Z0BR/mkUjsQ==
X-Received: by 2002:a17:90a:1285:b0:2d3:df93:1e5f with SMTP id 98e67ed59e1d1-2d88d667cacmr18644168a91.6.1725485607211;
        Wed, 04 Sep 2024 14:33:27 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8e3e8c580sm6693767a91.40.2024.09.04.14.33.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:33:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/14] openssh: add backported header file include
Date: Wed,  4 Sep 2024 14:32:54 -0700
Message-Id: <ae4064a8a60b60bee8a32a454e8784fcf1ecd318.1725456307.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725456307.git.steve@sakoman.com>
References: <cover.1725456307.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 21:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204225

From: Jon Mason <jdmason@kudzu.us>

Backport upstream patch to add a missing header.  The patch says it is
for systemd, but I am seeing build issues when building openssh with
clang and musl.  The issue being seen is:
 #warning usage of non-standard #include <sys/cdefs.h> is deprecated
And similar deprecated warnings.  This patch resolves the issue.

Original patch can be found at
https://github.com/openssh/openssh-portable/commit/88351eca17dcc55189991ba60e50819b6d4193c1

This issue was introduced with OE-Core 1c9d3c22718bf49ae85c2d06e0ee60ebdc2fd0c1
https://github.com/openembedded/openembedded-core/commit/1c9d3c22718bf49ae85c2d06e0ee60ebdc2fd0c1

Patch suggested by Khem Raj.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...sing-header-for-systemd-notification.patch | 27 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-Fix-missing-header-for-systemd-notification.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-Fix-missing-header-for-systemd-notification.patch b/meta/recipes-connectivity/openssh/openssh/0001-Fix-missing-header-for-systemd-notification.patch
new file mode 100644
index 0000000000..2baa4a6fe5
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-Fix-missing-header-for-systemd-notification.patch
@@ -0,0 +1,27 @@
+From 88351eca17dcc55189991ba60e50819b6d4193c1 Mon Sep 17 00:00:00 2001
+From: 90 <hi@90.gripe>
+Date: Fri, 5 Apr 2024 19:36:06 +0100
+Subject: [PATCH] Fix missing header for systemd notification
+
+Upstream-Status: Backport [88351eca17dcc55189991ba60e50819b6d4193c1]
+Signed-off-by: Jon Mason <jdmason@kudzu.us>
+
+---
+ openbsd-compat/port-linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/openbsd-compat/port-linux.c b/openbsd-compat/port-linux.c
+index df7290246df6..4c024c6d2d61 100644
+--- a/openbsd-compat/port-linux.c
++++ b/openbsd-compat/port-linux.c
+@@ -33,6 +33,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <time.h>
++#include <unistd.h>
+ 
+ #include "log.h"
+ #include "xmalloc.h"
+-- 
+2.39.2
+
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 042acffe6a..3c507cf911 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://0001-notify-systemd-on-listen-and-reload.patch \
            file://CVE-2024-6387.patch \
            file://CVE-2024-39894.patch \
+           file://0001-Fix-missing-header-for-systemd-notification.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.34.1


