Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8294FC6FD1F
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 03:26:24 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.9732.1711682780665022307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 20:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=IfIjP8V1;
 spf=pass (domain: mvista.com, ip: 209.85.216.46, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2a20a9df742so798592a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 20:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711682779; x=1712287579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ykurRbCfghcLSzqNZcQ4Hbi6JKEgxHfS2QiB0Ckfhgs=;
        b=IfIjP8V1Dp0lT161kIYalt5lATyYmK3AyL6ZpJJ2qlf9z73Hfl2nkb25h/Rhm0MBl6
         djEH8GeTps+3FtzE87go20iY9yPkiCM9AcZ55Tpsts1JnoW/oPoGS8n4vOSRVgdyAG5L
         JDlWyr0QsPkBwIff5+D/EMzNd0oaeutxP0pLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711682779; x=1712287579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykurRbCfghcLSzqNZcQ4Hbi6JKEgxHfS2QiB0Ckfhgs=;
        b=PyxmViQkItw6KFnmvWkk4lmGy+16mEJupfsu/20CFhpwUm1rXV18R1i86TDJDAcBhA
         fTkDWAEfBIlG7Ft0SRGypOP0AbW7XozbwQwx8LoMIsapCq8lQAFujizH3tyQRxUCAKun
         inqQYqaPSBYDqMHYuq6nAs/40A1fJjtNgYmbSst+mENy5FuXxuj91et3E/5LIun+Fgcx
         wrk2dRMDD/mUXbdqISHEjL/VtGn4KKWeEzATzk+SVTgVil+DU3FJLIrnkgK3bNEqXI96
         +A1AfHvjph3NNTbZQNOh0M+j61lMypjwFP5nrwKx1RMtTmlAYBd4Wi3+0iwLjvt/RvXb
         HmtA==
X-Gm-Message-State: AOJu0Yy/GJ6XxdreMKev1aZZcv7DZ3DFnkaHPFYSzBHZKT7OGh48fOUc
	O4EVWtGRoeP2mKLOsbt90jTR2HBliiatbwl1IE/HQlaEqOBj8wq6YVED1BDrwNNu2T4QTxndQaZ
	C
X-Google-Smtp-Source: AGHT+IFLEWwBhbyUxFbG/tvOqjwZTnnZ7RgyeLHfib7bSfLUOYWyJsQC6M9OChkmyUwAG/dRXXf2+w==
X-Received: by 2002:a17:90b:11c6:b0:2a0:2881:74f0 with SMTP id gv6-20020a17090b11c600b002a0288174f0mr1329036pjb.21.1711682779068;
        Thu, 28 Mar 2024 20:26:19 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:1cb0:1008:af7f:ee22:ee3e:9989])
        by smtp.gmail.com with ESMTPSA id cx18-20020a17090afd9200b0029d7e7b7b41sm4220326pjb.33.2024.03.28.20.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 20:26:18 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] tar: Fix for CVE-2023-39804
Date: Fri, 29 Mar 2024 08:56:03 +0530
Message-Id: <20240329032603.26825-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 03:26:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197619

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/tar.git/commit/?id=a339f05cd269013fa133d2f148d73f6f7d4247e4

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../tar/tar/CVE-2023-39804.patch              | 64 +++++++++++++++++++
 meta/recipes-extended/tar/tar_1.32.bb         |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2023-39804.patch

diff --git a/meta/recipes-extended/tar/tar/CVE-2023-39804.patch b/meta/recipes-extended/tar/tar/CVE-2023-39804.patch
new file mode 100644
index 0000000000..f550928540
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/CVE-2023-39804.patch
@@ -0,0 +1,64 @@
+From a339f05cd269013fa133d2f148d73f6f7d4247e4 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Sat, 28 Aug 2021 16:02:12 +0300
+Subject: Fix handling of extended header prefixes
+
+* src/xheader.c (locate_handler): Recognize prefix keywords only
+when followed by a dot.
+(xattr_decoder): Use xmalloc/xstrdup instead of alloc
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/tar.git/commit/?id=a339f05cd269013fa133d2f148d73f6f7d4247e4]
+CVE: CVE-2023-39804
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/xheader.c | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/src/xheader.c b/src/xheader.c
+index 4f8b2b2..3cd694d 100644
+--- a/src/xheader.c
++++ b/src/xheader.c
+@@ -637,11 +637,11 @@ static struct xhdr_tab const *
+ locate_handler (char const *keyword)
+ {
+   struct xhdr_tab const *p;
+-
+   for (p = xhdr_tab; p->keyword; p++)
+     if (p->prefix)
+       {
+-        if (strncmp (p->keyword, keyword, strlen(p->keyword)) == 0)
++	size_t kwlen = strlen (p->keyword);
++        if (keyword[kwlen] == '.' && strncmp (p->keyword, keyword, kwlen) == 0)
+           return p;
+       }
+     else
+@@ -1716,19 +1716,20 @@ xattr_decoder (struct tar_stat_info *st,
+                char const *keyword, char const *arg, size_t size)
+ {
+   char *xstr, *xkey;
+-
++  
+   /* copy keyword */
+-  size_t klen_raw = strlen (keyword);
+-  xkey = alloca (klen_raw + 1);
+-  memcpy (xkey, keyword, klen_raw + 1) /* including null-terminating */;
++  xkey = xstrdup (keyword);
+ 
+   /* copy value */
+-  xstr = alloca (size + 1);
++  xstr = xmalloc (size + 1);
+   memcpy (xstr, arg, size + 1); /* separator included, for GNU tar '\n' */;
+ 
+   xattr_decode_keyword (xkey);
+ 
+-  xheader_xattr_add (st, xkey + strlen("SCHILY.xattr."), xstr, size);
++  xheader_xattr_add (st, xkey + strlen ("SCHILY.xattr."), xstr, size);
++
++  free (xkey);
++  free (xstr);
+ }
+ 
+ static void
+-- 
+cgit v1.1
+
diff --git a/meta/recipes-extended/tar/tar_1.32.bb b/meta/recipes-extended/tar/tar_1.32.bb
index 1246f01256..c560741599 100644
--- a/meta/recipes-extended/tar/tar_1.32.bb
+++ b/meta/recipes-extended/tar/tar_1.32.bb
@@ -10,6 +10,7 @@ SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
            file://musl_dirent.patch \
            file://CVE-2021-20193.patch \
            file://CVE-2022-48303.patch \
+           file://CVE-2023-39804.patch \
 "
 
 SRC_URI[md5sum] = "17917356fff5cb4bd3cd5a6c3e727b05"
-- 
2.25.1


