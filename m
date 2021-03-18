Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.7823.1616068576532331714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 04:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SFOcYbE0;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id u9so3481205ejj.7
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 04:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oG5rtOG9yYW44oGJ5R00oTb85uLvt9MUM1jLWjJuI2Y=;
        b=SFOcYbE0RQhNgUmhVUGGzm1trLFkMNTb5DUHVrThvZ8ZeDKiNMq1DJAFWUikf6DU/X
         kOHxJOfYVpxE57EiXdco0FFSHL9SSVNri4cqw7K49fvn0P3t9/wOirYhCZln2cBYIUzV
         69FAUnNdk2XKovgrXfYbUjzuj+pyia4H9dYlLxNtAKZYY3AdgTvQ+qL0lfES0IughZZr
         bM06exvZO+kAR7C61OuUlEWZrMLAVEk7DudCBX+6+V7GkDd08IpVJb8ue1FMNZAAEvRR
         nBTuFFUK93pYYNIfCxPyJ+oe5jDdttA4tQypjM78lSa4rNtKv2y8t6Io1kgiSH1z8h+3
         RixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oG5rtOG9yYW44oGJ5R00oTb85uLvt9MUM1jLWjJuI2Y=;
        b=hI3dwvdWsRdFnWYSzeyggTp5QUxijPCXcv+v4eEixKsVAyrJE11an7zfZ/3YtbbdS7
         JdK1Ayqi3s8BOGgjvxWmQcGGI7x2gGZtWO5HCYGZcFnwd9ofEJHKzRhVxJpGydsP7UK/
         +EgbBX/wWefWYNMgFLRzOerzFXYK+bjKaHqknpP1MgAPs4lVX7rEgRp96OGqkhu5ufwL
         dBoukgZc3w3r97KyhYmlcusKFlOrU9aQ89bClHYtwMwR/hkk1YCrhHsyH7yB8Tw1fNxg
         Rf3RW2dBS5oJACMaYYhsnCrH+LUlwSsQOjqqhu+q7c8+Y2xhMh7NYXE8Zt7ij3HM8V+2
         WwhA==
X-Gm-Message-State: AOAM531pvobzyJ5MNwikiVsXj7Fe8at4x61BBhMsfaJf4+lsETGN92IM
	Ch4x91nLNY75vOYF2hdcpdQQ26MPAbAk1Q==
X-Google-Smtp-Source: ABdhPJwk3SB/+No/o/fnUL+9AGHvL6FB4Ly/D+92Mq3+6ylYJ+qZnBq9f6uQLBi2OfO44B41gzpp3A==
X-Received: by 2002:a17:907:6005:: with SMTP id fs5mr40882939ejc.184.1616068574966;
        Thu, 18 Mar 2021 04:56:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id u59sm1997350edc.73.2021.03.18.04.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 04:56:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCHv2] libxcrypt: fix sporadic failures in nativesdk-libxcrypt-compat
Date: Thu, 18 Mar 2021 12:55:57 +0100
Message-Id: <20210318115557.547767-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...e.ac-do-not-use-compute-symver-floor.patch | 32 +++++++++++++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxcrypt/files/0001-configure.ac-do-not-use-compute-symver-floor.patch

diff --git a/meta/recipes-core/libxcrypt/files/0001-configure.ac-do-not-use-compute-symver-floor.patch b/meta/recipes-core/libxcrypt/files/0001-configure.ac-do-not-use-compute-symver-floor.patch
new file mode 100644
index 0000000000..4e6b427104
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/files/0001-configure.ac-do-not-use-compute-symver-floor.patch
@@ -0,0 +1,32 @@
+From b28bb856ccebe8fded51d11362bf5920699eed59 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 18 Mar 2021 10:52:13 +0000
+Subject: [PATCH] configure.ac: do not use compute-symver-floor
+
+This script (newly introduced in 4.4.18) sporadically fails, without
+failing configure(), which has been reported at
+https://github.com/besser82/libxcrypt/issues/123
+
+Upstream-Status: Inappropriate
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 45b91b4..f3ba945 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -426,11 +426,7 @@ if test x$enable_shared != xyes; then enable_obsolete_api=0; fi
+ # need to be binary backward compatible with.
+ if test $enable_obsolete_api = 1; then
+   AC_MSG_CHECKING([minimum symbol version to use for compatibility symbols])
+-  SYMVER_FLOOR=$(
+-    $PERL ${srcdir}/build-aux/compute-symver-floor \
+-      ${srcdir}/lib/libcrypt.minver $host_os $host_cpu \
+-    2>&AS_MESSAGE_LOG_FD
+-  )
++  SYMVER_FLOOR=GLIBC_2.0
+   AC_MSG_RESULT([$SYMVER_FLOOR])
+   case "$SYMVER_FLOOR" in
+     ERROR)
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index e9f968b556..b5ca863d54 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=bd5d9777dfe7076c4f2928f12fed226a \
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH} \
+           file://0001-configure.ac-do-not-use-compute-symver-floor.patch \
+           "
 SRCREV = "94d84f92ca123d851586016c4678eb1f21c19029"
 SRCBRANCH ?= "develop"
 
-- 
2.29.2

