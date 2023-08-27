Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9875CC83F16
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 20:52:44 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.127.1693169562642810650
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 13:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=N17wwFxo;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3a850f07fadso2032981b6e.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 13:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693169561; x=1693774361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSffl5Tg2tSDX96bkihimqSeHloR7K+2g1/rRZmHLuI=;
        b=N17wwFxofEF2oPXYR3twNo0SGRit6L1G23Aa5lZXTmi388Q7g526T1TcowgUVAI/XT
         dIIT31dLa4OOigR8h5wsQGKz+jAvZaEzAPjfKBwYePJTR6WHUoKq44Q7EdiUv2eDMDp8
         Z1VlOFEXXJO65lc2LW02MsYeuFH07JlGp17qPba8pkQbJY/c6j1escS57qtcwANERFuD
         YsY3wuCNEkc7rLpZw5wQp84HCxbMJ1jXGpZXfzkSDv5GQAIk25JJ1MLl8h50bosfX72v
         XwZ1Ym1g0Nhthsx3FbSvnHdMtHADQ5n4sT+AaLO4ESlmIHbMR/807GH2elCN8RqEoN33
         +/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693169561; x=1693774361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSffl5Tg2tSDX96bkihimqSeHloR7K+2g1/rRZmHLuI=;
        b=VyGk/q2e7WXC6W2MikyuvRiGuSvEAmmLGkEp5/uarsZ1Fiefwk9lVReoLME47WJ4cp
         5WiWuQdSf0JyQSO0Jr6kXUhFffeOdnjPlJH0rO/7OT0x7jAWqy+oGacdcn9T9/h3mHii
         Wu+SqtIb5ogUxJuXlZab2yFX9Q5HupI/1QJEnnEyFctX++TRJ6+nRnEx4Fwt8d7ElDZ0
         Xtbkh2KNOPExMXkROLiXVNrZRBMh/JpDUBAwkHmA8AjtAlMtoUcECBXZ58zE9sGIXm7C
         dN4EZxS/uZL45rm817RHVi5h8MYnp6yS713LCADMq9aYChwuARmAkGoXUNEvn2D9kSlG
         8DRw==
X-Gm-Message-State: AOJu0YzIEK5QtVZJjNu4CrrTezLr2aJwYCPcm7yVRR21i95+x4WFbXIW
	kACcLdvEO+o9AZPKtWiuh3GgEXmjglqmzEd0a+IWLQ==
X-Google-Smtp-Source: AGHT+IGuWQQVjuzq8FgB796crS7ahehKqF3o7r8ZftcAAVqst+f7TpEZim/udRTdYv45ETBAd8TLBw==
X-Received: by 2002:a05:6808:1785:b0:3a8:5ff0:6b52 with SMTP id bg5-20020a056808178500b003a85ff06b52mr11337230oib.15.1693169561578;
        Sun, 27 Aug 2023 13:52:41 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a63c142000000b00565dd935938sm1220684pgi.85.2023.08.27.13.52.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 13:52:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/8] Qemu: Resolve undefined reference issue in CVE-2023-2861
Date: Sun, 27 Aug 2023 10:52:24 -1000
Message-Id: <983d19dfdad361f8b3275b404f1ac0b9befc9f6c.1693169420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693169420.git.steve@sakoman.com>
References: <cover.1693169420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 20:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186799

From: Siddharth <sdoshi@mvista.com>

The commit [https://github.com/openembedded/openembedded-core/commit/9bd4ddeb4b5efc65b0514d50d6991211271924c1] backports fix for CVE-2023-2861 for version 6.2.0.
The 'qemu_fstat' in `do_create_others' is not defined which leads to the undefined symbol error on certain architectures.

Also, the commit message says "(Mjt: drop adding qemu_fstat wrapper for 7.2 where wrappers aren't used)". So either the wrapper has to be dropped or it has to be defined.

Hence, backported the main patch rather than the cherry picked one.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../qemu/qemu/CVE-2023-2861.patch             | 66 +++++++++++--------
 1 file changed, 37 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
index 48f51f5d03..a86413fbad 100644
--- a/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
@@ -1,14 +1,16 @@
-From 10fad73a2bf1c76c8aa9d6322755e5f877d83ce5 Mon Sep 17 00:00:00 2001
+From f6b0de53fb87ddefed348a39284c8e2f28dc4eda Mon Sep 17 00:00:00 2001
 From: Christian Schoenebeck <qemu_oss@crudebyte.com>
-Date: Wed Jun 7 18:29:33 2023 +0200
-Subject: [PATCH] 9pfs: prevent opening special files (CVE-2023-2861) The 9p
- protocol does not specifically define how server shall behave when client
- tries to open a special file, however from security POV it does make sense
- for 9p server to prohibit opening any special file on host side in general. A
- sane Linux 9p client for instance would never attempt to open a special file
- on host side, it would always handle those exclusively on its guest side. A
- malicious client however could potentially escape from the exported 9p tree
- by creating and opening a device file on host side.
+Date: Wed, 7 Jun 2023 18:29:33 +0200
+Subject: [PATCH] 9pfs: prevent opening special files (CVE-2023-2861)
+
+The 9p protocol does not specifically define how server shall behave when
+client tries to open a special file, however from security POV it does
+make sense for 9p server to prohibit opening any special file on host side
+in general. A sane Linux 9p client for instance would never attempt to
+open a special file on host side, it would always handle those exclusively
+on its guest side. A malicious client however could potentially escape
+from the exported 9p tree by creating and opening a device file on host
+side.
 
 With QEMU this could only be exploited in the following unsafe setups:
 
@@ -32,19 +34,16 @@ Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
 Reviewed-by: Greg Kurz <groug@kaod.org>
 Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
 Message-Id: <E1q6w7r-0000Q0-NM@lizzy.crudebyte.com>
-(cherry picked from commit f6b0de5)
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-(Mjt: drop adding qemu_fstat wrapper for 7.2 where wrappers aren't used)
-
-Upstream-Status: Backport [https://github.com/qemu/qemu/commit/10fad73a2bf1c76c8aa9d6322755e5f877d83ce5]
 
+Upstream-Status: Backport from [https://github.com/qemu/qemu/commit/10fad73a2bf1c76c8aa9d6322755e5f877d83ce5]
 CVE: CVE-2023-2861
 
 Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
 ---
- fsdev/virtfs-proxy-helper.c | 27 ++++++++++++++++++++++++--
- hw/9pfs/9p-util.h           | 38 +++++++++++++++++++++++++++++++++++++
- 2 files changed, 63 insertions(+), 2 deletions(-)
+ fsdev/virtfs-proxy-helper.c | 27 +++++++++++++++++++++++--
+ hw/9pfs/9p-util.h           | 40 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 65 insertions(+), 2 deletions(-)
 
 diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
 index 15c0e79b0..f9e4669a5 100644
@@ -56,12 +55,12 @@ index 15c0e79b0..f9e4669a5 100644
  #include "hw/9pfs/9p-proxy.h"
 +#include "hw/9pfs/9p-util.h"
  #include "fsdev/9p-iov-marshal.h"
-
+ 
  #define PROGNAME "virtfs-proxy-helper"
 @@ -338,6 +339,28 @@ static void resetugid(int suid, int sgid)
      }
  }
-
+ 
 +/*
 + * Open regular file or directory. Attempts to open any special file are
 + * rejected.
@@ -106,22 +105,30 @@ index 15c0e79b0..f9e4669a5 100644
          ret = -errno;
      }
 diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
-index 546f46dc7..54e270ac6 100644
+index 546f46dc7..23000e917 100644
 --- a/hw/9pfs/9p-util.h
 +++ b/hw/9pfs/9p-util.h
-@@ -13,6 +13,8 @@
+@@ -13,12 +13,16 @@
  #ifndef QEMU_9P_UTIL_H
  #define QEMU_9P_UTIL_H
-
+ 
 +#include "qemu/error-report.h"
 +
  #ifdef O_PATH
  #define O_PATH_9P_UTIL O_PATH
  #else
-@@ -26,6 +28,38 @@ static inline void close_preserve_errno(int fd)
+ #define O_PATH_9P_UTIL 0
+ #endif
+ 
++#define qemu_fstat      fstat
++
+ static inline void close_preserve_errno(int fd)
+ {
+     int serrno = errno;
+@@ -26,6 +30,38 @@ static inline void close_preserve_errno(int fd)
      errno = serrno;
  }
-
+ 
 +/**
 + * close_if_special_file() - Close @fd if neither regular file nor directory.
 + *
@@ -157,10 +164,10 @@ index 546f46dc7..54e270ac6 100644
  static inline int openat_dir(int dirfd, const char *name)
  {
      return openat(dirfd, name,
-@@ -56,6 +90,10 @@ again:
+@@ -56,6 +92,10 @@ again:
          return -1;
      }
-
+ 
 +    if (close_if_special_file(fd) < 0) {
 +        return -1;
 +    }
@@ -168,5 +175,6 @@ index 546f46dc7..54e270ac6 100644
      serrno = errno;
      /* O_NONBLOCK was only needed to open the file. Let's drop it. We don't
       * do that with O_PATH since fcntl(F_SETFL) isn't supported, and openat()
---
-2.40.0
+-- 
+2.35.7
+
-- 
2.34.1


