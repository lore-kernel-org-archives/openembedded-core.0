Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.2217.1596649815287949173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 10:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L5Au9jqa;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id t11so5857295plr.5
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 10:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mBv0BZnu7L2jI2p5QqeY4vFmVlvimiMPp+IFvbBIRfw=;
        b=L5Au9jqaBKYVaTJEA8QRXcJ20SitoSlv9r4ZKybsowGbXuepz1QuNtGud6WjNo21Md
         2PYJj+7r73kONgrbJWXuR99YVc7ILnt8CVFuInR9ItU1MvpnS9xq2N8WF/acaLKiSCKx
         dhTRoNRsVKzmFNU971tdCrpIeavHLV4GosJBv9/4lqt+O4hQ2eiZHpckYZZsUpOwh4mK
         BRgtDAVJqnZq5b87XYiUZiWv9PU7ZKbYOsHE+tUxHBSWfyO2b156oS5uDb7faLbiVYFq
         ARvBN00ZC1qmGXTwjJM93w7GJ0o2uaa/bKCmtHUHuDWBFWnW/0c/phkpi1FjzddZ3GNO
         0Ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mBv0BZnu7L2jI2p5QqeY4vFmVlvimiMPp+IFvbBIRfw=;
        b=rQ1Ltf7o7U8jhzI0oH0SsjC1ebHbteS6AY08pEddqvbR6v7ErHZwR4nlMuLxthS/lC
         9UmNR6dj8D23MOP9Iz8Wz9dV74ZF3xgvK1zGxZXuLViuhEkjKVV6A6vAZkxVmq2bXvrC
         hR5yDmelU0ySNDbNM0JVRo8wdaOziWt65Y1rKy5P1rZuNqDyVtGpSYjDX5s4T8lhM9Y3
         Nznw4zWqSd7YjthXRH02WIILQvwLATGpz+Gb3SWpxVy/KWQiSFd/JNP/ptClh9u9NwFZ
         68+W5onAGUug9+0Tqlff1snLYAbYM4j4zreGy9MLGX3Ky+r6yi5TJuu36Cy51XOGzinC
         4Qgg==
X-Gm-Message-State: AOAM5333nFMMsU19x7a7Y290WjLX1DOYO0I/QCZMUHbGGZSW0L7qVzak
	FaBhTNCZp4qbETIdwe5mMxAc+388Dp4=
X-Google-Smtp-Source: ABdhPJzw10ew2faftXlzpsNBH3mSwmv+is4rwrAtF01umzASTQxJY46E9ggH0sWvhEv582+ZQQNcGw==
X-Received: by 2002:a17:902:bcc6:: with SMTP id o6mr4156928pls.109.1596649814359;
        Wed, 05 Aug 2020 10:50:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id v77sm4711115pfc.137.2020.08.05.10.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 10:50:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] inetutils: Fix build with -fno-common
Date: Wed,  5 Aug 2020 10:50:08 -0700
Message-Id: <20200805175011.126156-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes errors like

telnetd/state.c:69: multiple definition of `not42'; utility.o:/usr/src/debug/inetutils/1.9.4-r0/build/telnetd/../../inetutils-1.9.4/telnetd/utility.c:66: first defined here
| clang-11: error: linker command failed with exit code 1 (use -v to see invocation)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-multiple-definitions-of-errcatch-an.patch | 58 +++++++++++++++++++
 .../inetutils/inetutils_1.9.4.bb              |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0001-ftpd-telnetd-Fix-multiple-definitions-of-errcatch-an.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/0001-ftpd-telnetd-Fix-multiple-definitions-of-errcatch-an.patch b/meta/recipes-connectivity/inetutils/inetutils/0001-ftpd-telnetd-Fix-multiple-definitions-of-errcatch-an.patch
new file mode 100644
index 0000000000..49d319f59d
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/0001-ftpd-telnetd-Fix-multiple-definitions-of-errcatch-an.patch
@@ -0,0 +1,58 @@
+From 7d39930468e272c740b0eed3c7e5b7fb3abf29e8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Aug 2020 10:36:22 -0700
+Subject: [PATCH] ftpd,telnetd: Fix multiple definitions of errcatch and not42
+
+This helps fix build failures when -fno-common option is used
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ftpd/extern.h     | 2 +-
+ ftpd/ftpcmd.c     | 1 +
+ telnetd/utility.c | 2 +-
+ 3 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/ftpd/extern.h b/ftpd/extern.h
+index ab33cf3..91dbbee 100644
+--- a/ftpd/extern.h
++++ b/ftpd/extern.h
+@@ -90,7 +90,7 @@ extern void user (const char *);
+ extern char *sgetsave (const char *);
+ 
+ /* Exported from ftpd.c.  */
+-jmp_buf errcatch;
++extern jmp_buf errcatch;
+ extern struct sockaddr_storage data_dest;
+ extern socklen_t data_dest_len;
+ extern struct sockaddr_storage his_addr;
+diff --git a/ftpd/ftpcmd.c b/ftpd/ftpcmd.c
+index beb1f06..d272e9d 100644
+--- a/ftpd/ftpcmd.c
++++ b/ftpd/ftpcmd.c
+@@ -106,6 +106,7 @@
+ #endif
+ 
+ off_t restart_point;
++jmp_buf errcatch;
+ 
+ static char cbuf[512];           /* Command Buffer.  */
+ static char *fromname;
+diff --git a/telnetd/utility.c b/telnetd/utility.c
+index e7ffb8e..46bf91e 100644
+--- a/telnetd/utility.c
++++ b/telnetd/utility.c
+@@ -63,7 +63,7 @@ static int ncc;
+ static char ptyibuf[BUFSIZ], *ptyip;
+ static int pcc;
+ 
+-int not42;
++extern int not42;
+ 
+ static int
+ readstream (int p, char *ibuf, int bufsize)
+-- 
+2.28.0
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index cc9410b94e..adf6d4414e 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
            file://0001-rcp-fix-to-work-with-large-files.patch \
            file://fix-buffer-fortify-tfpt.patch \
+           file://0001-ftpd-telnetd-Fix-multiple-definitions-of-errcatch-an.patch \
 "
 
 SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
-- 
2.28.0

