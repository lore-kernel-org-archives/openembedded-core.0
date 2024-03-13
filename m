Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E92AC54E67
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:57 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.2088.1710351227147101006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hWv3U9Mz;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-513ca834ad7so167103e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351225; x=1710956025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rco2RCLkG7Xui+tLJrTKLeOPeY7FEukmfYSSg160Okk=;
        b=hWv3U9MzaEtJXHfVw/4xoR2i+CfgJhz9vItAcpDlBKA6u7LUn+MPEowOjbInzLnyFv
         ptDeNJC7/ixdGBhBTgh5OEuglGe2TGXjBGwlR8FcKCcIIJz1T37qA51TULOvJWZy0ja5
         MDQnZnvx+qkHH1dq9FtilOloucUQMCPpKPuY31/v0oEFY2FzO1Cc42numU5n9BZ9DUd6
         vRbB4QyOKhbIAsUBNWZIDS5pdqkrSgWXiAVln3WtNoGVvfRkihlokj2efa+K10C5AtuW
         wTV0iBC/xxiYOyIaIIb7ZL73/KnZmEjsuoE2lvoE/QnbaFDp3fWs77RaYZ3Xbw4+q3ve
         QKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351225; x=1710956025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rco2RCLkG7Xui+tLJrTKLeOPeY7FEukmfYSSg160Okk=;
        b=wcF9ujPoCZo1nXDjdGtE+ihQ2GxA39i+FM3yr1cRhpheSvb7H18Wz7nva3NZCsyD8c
         Ykzca7Z1l9arTe6ee4YF7mn6tp6bcaeYrtw4NKQ2GVLelyvgvG1JyD0rPaHDw+7b3dej
         /EIJJSaAnL1Uar7UOXsLVpInAYOBU6NVzaTAGI1GY6wSVZ0Tgy0U8IWeoDQt8YutEf/g
         HG4627p8aDF/+G2BTQ3wuSpEYVFfD68Hbz/K9hgxx7YJ0AcDWc7u0VVXtqcVPHSh5Wqr
         A8HXnOBQQfcbTJ8ac7y4yZgNxu+36oNXdAyIpr9PfQVuvrNs21/hoAR9Er/ups3YJQdR
         Xh3A==
X-Gm-Message-State: AOJu0YzoIardaLxm/aDVlVxEJtq1vg9MUTfMpVcXYdCp7pzpZIfrG3hY
	VserDP3fpzUMxWLnWtMos89/DYD9s19i/GP5LUOVJk7EI0xH9q3u7lbfFRZx
X-Google-Smtp-Source: AGHT+IG1r1XWq63F5P/L4YGPBEbpUwnzcA5w2v1l/ECMamKIIPuEqUSspWBXUNdBz1D1Wvt4jpKMYg==
X-Received: by 2002:ac2:46d2:0:b0:513:32e2:141b with SMTP id p18-20020ac246d2000000b0051332e2141bmr8991249lfo.67.1710351225078;
        Wed, 13 Mar 2024 10:33:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/21] libpam: update 1.5.3 -> 1.6.0
Date: Wed, 13 Mar 2024 18:33:24 +0100
Message-Id: <20240313173336.3900178-9-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197061

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...place-use-of-termio.h-with-termios.h.patch | 39 -------------------
 .../pam/libpam/libpam-xtests.patch            | 22 +++++++----
 .../pam/{libpam_1.5.3.bb => libpam_1.6.0.bb}  |  3 +-
 3 files changed, 16 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-extended/pam/libpam/0001-examples-Replace-use-of-termio.h-with-termios.h.patch
 rename meta/recipes-extended/pam/{libpam_1.5.3.bb => libpam_1.6.0.bb} (97%)

diff --git a/meta/recipes-extended/pam/libpam/0001-examples-Replace-use-of-termio.h-with-termios.h.patch b/meta/recipes-extended/pam/libpam/0001-examples-Replace-use-of-termio.h-with-termios.h.patch
deleted file mode 100644
index 95c437df4f1..00000000000
--- a/meta/recipes-extended/pam/libpam/0001-examples-Replace-use-of-termio.h-with-termios.h.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 9b96fcfa5748934b8b6a4db4ee25a5e3165905c0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 1 Jul 2023 07:48:17 -0700
-Subject: [PATCH] examples: Replace use of termio.h with termios.h
-
-Fixes build with musl and makes it portable
-
-Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/5374f677e4cae669eb9accf2449178b602e8a40a]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- examples/tty_conv.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/examples/tty_conv.c b/examples/tty_conv.c
-index 23f0684..db22500 100644
---- a/examples/tty_conv.c
-+++ b/examples/tty_conv.c
-@@ -6,7 +6,8 @@
- #include <string.h>
- #include <errno.h>
- #include <unistd.h>
--#include <termio.h>
-+#include <termios.h>
-+#include <sys/ioctl.h>
- #include <security/pam_appl.h>
- 
- /***************************************
-@@ -16,7 +17,7 @@
-  ***************************************/
- static void echoOff(int fd, int off)
- {
--    struct termio tty;
-+    struct termios tty;
-     if (ioctl(fd, TCGETA, &tty) < 0)
-     {
-         fprintf(stderr, "TCGETA failed: %s\n", strerror(errno));
--- 
-2.41.0
-
diff --git a/meta/recipes-extended/pam/libpam/libpam-xtests.patch b/meta/recipes-extended/pam/libpam/libpam-xtests.patch
index ea145899b49..f2dafa72a5b 100644
--- a/meta/recipes-extended/pam/libpam/libpam-xtests.patch
+++ b/meta/recipes-extended/pam/libpam/libpam-xtests.patch
@@ -1,13 +1,21 @@
-This patch is used to create a new sub package libpam-xtests to do more checks.
+From 060726f7e60c8ecb5bf50fd776910b290d9a0a69 Mon Sep 17 00:00:00 2001
+From: Kang Kai <kai.kang@windriver.com>
+Date: Tue, 19 Jul 2011 17:08:31 +0800
+Subject: [PATCH] This patch is used to create a new sub package libpam-xtests
+ to do more checks.
 
 Upstream-Status: Pending
 
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
-Index: Linux-PAM-1.3.0/xtests/Makefile.am
-===================================================================
---- Linux-PAM-1.3.0.orig/xtests/Makefile.am
-+++ Linux-PAM-1.3.0/xtests/Makefile.am
-@@ -7,7 +7,7 @@ AM_CFLAGS = -DLIBPAM_COMPILE -I$(top_src
+---
+ xtests/Makefile.am | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/xtests/Makefile.am b/xtests/Makefile.am
+index acf9746..9826c9f 100644
+--- a/xtests/Makefile.am
++++ b/xtests/Makefile.am
+@@ -8,7 +8,7 @@ AM_CFLAGS = -DLIBPAM_COMPILE -I$(top_srcdir)/libpam/include \
  LDADD = $(top_builddir)/libpam/libpam.la \
  	$(top_builddir)/libpam_misc/libpam_misc.la
  
@@ -16,7 +24,7 @@ Index: Linux-PAM-1.3.0/xtests/Makefile.am
  
  EXTRA_DIST = run-xtests.sh tst-pam_dispatch1.pamd tst-pam_dispatch2.pamd \
  	tst-pam_dispatch3.pamd tst-pam_dispatch4.pamd \
-@@ -51,3 +51,18 @@ EXTRA_PROGRAMS = $(XTESTS)
+@@ -55,3 +55,18 @@ EXTRA_PROGRAMS = $(XTESTS)
  
  xtests: $(XTESTS) run-xtests.sh
  	"$(srcdir)"/run-xtests.sh "$(srcdir)" ${XTESTS} ${NOSRCTESTS}
diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-extended/pam/libpam_1.6.0.bb
similarity index 97%
rename from meta/recipes-extended/pam/libpam_1.5.3.bb
rename to meta/recipes-extended/pam/libpam_1.6.0.bb
index 4dd98906064..bbea008d552 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.6.0.bb
@@ -21,12 +21,11 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://pam.d/common-session-noninteractive \
            file://pam.d/other \
            file://libpam-xtests.patch \
-           file://0001-examples-Replace-use-of-termio.h-with-termios.h.patch \
            file://run-ptest \
            file://pam-volatiles.conf \
            "
 
-SRC_URI[sha256sum] = "7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773b3c54b0a818283"
+SRC_URI[sha256sum] = "fff4a34e5bbee77e2e8f1992f27631e2329bcbf8a0563ddeb5c3389b4e3169ad"
 
 DEPENDS = "bison-native flex-native cracklib libxml2-native virtual/crypt"
 
-- 
2.39.2


