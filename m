Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.13036.1614361213402555447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 09:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=boJg2KxN;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d11so5664393plo.8
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 09:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NZZlmXEfjkxOjezPsawd40Djv0flIkRaxtOoZFWTdII=;
        b=boJg2KxNG6lwUc2rBZJgxRunjqQCJnRBkdW6CBQSlNcX5YKkHfa94veygj5lH6IbsT
         nhiGl/KqwMkrql0fKvVWBYDpfF50c+2Y4lpGS2iMI36EX5IOe5xWJrUsDODBx0UX6SOg
         +Nw4s8Bjvc+dz25COI4hSHTWsuTNzjpH08dW0bU2ywORvNWDk3PYGTLyKdLlh/ZCr8oS
         8HU4HhEDBvVhjzAVY8Yii+zZfF/abR8yc6AS/MzlEs2Md/MfLGcvefz6xmqXHCcyIOAV
         cdFSfUVEXc4O0laL3l9EVG/je8Bw+h6io+PiqVS3mBYBNLPaFduFaZvR0rfB3EeXBqh7
         Bl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NZZlmXEfjkxOjezPsawd40Djv0flIkRaxtOoZFWTdII=;
        b=ZZOJjLSOZOh4BhM/xue7PRXlL5NMgKz7wK2Tihs2r2EO4sTxtEAZQOUtP0Qwi9sngP
         E3wuyWTeFyDP0bee4MgYNeGkhSVlPdJIKO5bXHxjDfRV2C60wOkQ/N7SWsbUNBWC9Qs/
         AN4j6o/Inx96WtykY1stO0IVh0h8HGm2YYn1sITF1hECEnO1RKBKeLDGigGeMmzzH0Ko
         LJLsN8BAKbJcmc8u5zkBViMwxwfrKIHz2qVUKErREuf+LtNVkvgDfwJXXHLzQ3tWIyCB
         iDTiKsMSxrGGpVIxpN/syBtCLPhAvIB3nHN59k2G1Ysuj+6nmHvgnh1zsWw52NZUyOK+
         9bcA==
X-Gm-Message-State: AOAM530kuruJXaESa7WBx6jmMgRwmOoyjJ7DyYBFPvBWMTZ+p0xmZOzT
	M7I//MCQUzPukFGsxmJY5Lr7f/UEPyQVKA==
X-Google-Smtp-Source: ABdhPJyy1CJd1LRvih3RlL3XS0zyxG7XJ1tlmdgP53NA0RpWtmBnOmwGCZ2HMDvv9n6E60dVFa9EVA==
X-Received: by 2002:a17:90a:4a8c:: with SMTP id f12mr4543693pjh.71.1614361212326;
        Fri, 26 Feb 2021 09:40:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id h20sm9818887pfv.164.2021.02.26.09.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 09:40:12 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Fix rawmemchr
Date: Fri, 26 Feb 2021 09:40:09 -0800
Message-Id: <20210226174009.1552912-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is to help gcc bug upstream
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98512

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ork-around-GCC-PR-98512-in-rawmemchr.patch | 58 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch

diff --git a/meta/recipes-core/glibc/glibc/0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch b/meta/recipes-core/glibc/glibc/0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch
new file mode 100644
index 0000000000..e904b28a05
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch
@@ -0,0 +1,58 @@
+From 044e603b698093cf48f6e6229e0b66acf05227e4 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 19 Feb 2021 13:29:00 +0100
+Subject: [PATCH] string: Work around GCC PR 98512 in rawmemchr
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=044e603b698093cf48f6e6229e0b66acf05227e4]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ string/rawmemchr.c | 26 +++++++++++++++-----------
+ 1 file changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/string/rawmemchr.c b/string/rawmemchr.c
+index 59bbeeaa42..b8523118e5 100644
+--- a/string/rawmemchr.c
++++ b/string/rawmemchr.c
+@@ -22,24 +22,28 @@
+ # define RAWMEMCHR __rawmemchr
+ #endif
+ 
+-/* Find the first occurrence of C in S.  */
+-void *
+-RAWMEMCHR (const void *s, int c)
+-{
+-  DIAG_PUSH_NEEDS_COMMENT;
++/* The pragmata should be nested inside RAWMEMCHR below, but that
++   triggers GCC PR 98512.  */
++DIAG_PUSH_NEEDS_COMMENT;
+ #if __GNUC_PREREQ (7, 0)
+-  /* GCC 8 warns about the size passed to memchr being larger than
+-     PTRDIFF_MAX; the use of SIZE_MAX is deliberate here.  */
+-  DIAG_IGNORE_NEEDS_COMMENT (8, "-Wstringop-overflow=");
++/* GCC 8 warns about the size passed to memchr being larger than
++   PTRDIFF_MAX; the use of SIZE_MAX is deliberate here.  */
++DIAG_IGNORE_NEEDS_COMMENT (8, "-Wstringop-overflow=");
+ #endif
+ #if __GNUC_PREREQ (11, 0)
+-  /* Likewise GCC 11, with a different warning option.  */
+-  DIAG_IGNORE_NEEDS_COMMENT (11, "-Wstringop-overread");
++/* Likewise GCC 11, with a different warning option.  */
++DIAG_IGNORE_NEEDS_COMMENT (11, "-Wstringop-overread");
+ #endif
++
++/* Find the first occurrence of C in S.  */
++void *
++RAWMEMCHR (const void *s, int c)
++{
+   if (c != '\0')
+     return memchr (s, c, (size_t)-1);
+-  DIAG_POP_NEEDS_COMMENT;
+   return (char *)s + strlen (s);
+ }
+ libc_hidden_def (__rawmemchr)
+ weak_alias (__rawmemchr, rawmemchr)
++
++DIAG_POP_NEEDS_COMMENT;
+-- 
+2.30.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index e0002e6046..c47826a51e 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -44,6 +44,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
            file://0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch \
+           file://0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.30.1

