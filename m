Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.7491.1589644727348081837
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 May 2020 08:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pkFRF45+;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id t16so2209409plo.7
        for <openembedded-core@lists.openembedded.org>; Sat, 16 May 2020 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=atK1G4oe5U6ZKD+IeyIlrS5zq8kch7ONmkGS/2x1iW4=;
        b=pkFRF45+CLIpnqBii2xTqtTwj7S1TgBD8sGD847NqYnivm1T36TE8vMxdyjxMX+RGm
         nwsq6l5B4Y48nD7WKi7IaMHCAk0d8Ufp9U3jPTm6abScb9XaYwIq08fOLL1/ojwInRP/
         2LWxIoUzTJNZyJJmtX6JQ6/J1g2mYm87PgspnIN7qu/X9SinVqUxiGpGGwubgzOLWXKZ
         HhS8edHuqwl4/THun8WpbVmCDUDHh8LspDYX1og4QmyThC61W7ybydCwcgEzhPD1Q2P+
         rfwzvAPjZ/Y8ZL9X/GLg5fq0z+XiU0kjNLV4QxIba2toI1TeCykjGjD4yO36S33egNxw
         Y4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=atK1G4oe5U6ZKD+IeyIlrS5zq8kch7ONmkGS/2x1iW4=;
        b=nu2OQdYXsrHHBluvWSC7F+ctgImBHoxezHjybXnMZUtb5r2RGd+V+/0N4AxYofJmXI
         rDKa2zra3MwNRu6zu9lx8fd3Z8R7z9QAe0DBufZ6v8Zx2GQxO1GMiQ7EYYwhn9qJOG1V
         9o8x/wMS6f2QuHUXNa2poSh03VRDe/35xnUI0RSayJ3UG9p3P9gFdij1HFQYoXSsnBUE
         u1/wCYKMiF7rZf/tcepJ5P5aLe3qfm79QS92+BI2N2t95jvHZCbJQzB5bLFF9RQMLmMn
         RGu7eEEYuv7lUDntKMvZJdttlyQRP+0a905DOskMzvBft2uzA6lDkbV18AH/loISB1Rl
         8rkg==
X-Gm-Message-State: AOAM533nZVpZjqmPW/VJAO6gGz5k0ceTjZ0OSwEG+9s/yPzX3R6adfW7
	+5g0nrQWlRptbG6sRnI8yEA7HFzC1kI=
X-Google-Smtp-Source: ABdhPJzm7BYfTIpn1jEWk3nB/UbnlyWgDD57qLREOTtBC+6VNBlCZ3QPIHw6vLdZo/8RyX7doHl0fw==
X-Received: by 2002:a17:902:e78c:: with SMTP id cp12mr6316095plb.135.1589644726405;
        Sat, 16 May 2020 08:58:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id jz3sm4202003pjb.40.2020.05.16.08.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2020 08:58:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/6] glibc: Unify wordsize.h for arm and aarch64
Date: Sat, 16 May 2020 08:58:38 -0700
Message-Id: <20200516155843.1811017-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Should help simplify multilib in arm world

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...y-the-header-between-arm-and-aarch64.patch | 67 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0030-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch

diff --git a/meta/recipes-core/glibc/glibc/0030-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0030-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
new file mode 100644
index 0000000000..cbef2f2830
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0030-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -0,0 +1,67 @@
+From 9cb0a756b017f5961b70ac781d3eaec6c82513cb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 15 May 2020 17:05:45 -0700
+Subject: [PATCH] wordsize.h: Unify the header between arm and aarch64
+
+This helps OE multilibs to not sythesize this header which causes all
+kind of recursions and other issues since wordsize is fundamental header
+and ends up including itself in many case e.g. clang tidy, bpf etc.
+
+Upstream-Status: Inappropriate [ OE-Specific ]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/aarch64/bits/wordsize.h          | 8 ++++++--
+ sysdeps/{aarch64 => arm}/bits/wordsize.h | 8 ++++++--
+ 2 files changed, 12 insertions(+), 4 deletions(-)
+ copy sysdeps/{aarch64 => arm}/bits/wordsize.h (85%)
+
+diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bits/wordsize.h
+index ee01841773..34fcdef1f1 100644
+--- a/sysdeps/aarch64/bits/wordsize.h
++++ b/sysdeps/aarch64/bits/wordsize.h
+@@ -17,12 +17,16 @@
+    License along with the GNU C Library; if not, see
+    <https://www.gnu.org/licenses/>.  */
+ 
+-#ifdef __LP64__
++#if defined (__aarch64__) && defined (__LP64__)
+ # define __WORDSIZE			64
+-#else
++#elif defined (__aarch64__)
+ # define __WORDSIZE			32
+ # define __WORDSIZE32_SIZE_ULONG	1
+ # define __WORDSIZE32_PTRDIFF_LONG	1
++#else
++# define __WORDSIZE			32
++# define __WORDSIZE32_SIZE_ULONG	0
++# define __WORDSIZE32_PTRDIFF_LONG	0
+ #endif
+ 
+ #define __WORDSIZE_TIME64_COMPAT32	0
+diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
+similarity index 85%
+copy from sysdeps/aarch64/bits/wordsize.h
+copy to sysdeps/arm/bits/wordsize.h
+index ee01841773..34fcdef1f1 100644
+--- a/sysdeps/aarch64/bits/wordsize.h
++++ b/sysdeps/arm/bits/wordsize.h
+@@ -17,12 +17,16 @@
+    License along with the GNU C Library; if not, see
+    <https://www.gnu.org/licenses/>.  */
+ 
+-#ifdef __LP64__
++#if defined (__aarch64__) && defined (__LP64__)
+ # define __WORDSIZE			64
+-#else
++#elif defined (__aarch64__)
+ # define __WORDSIZE			32
+ # define __WORDSIZE32_SIZE_ULONG	1
+ # define __WORDSIZE32_PTRDIFF_LONG	1
++#else
++# define __WORDSIZE			32
++# define __WORDSIZE32_SIZE_ULONG	0
++# define __WORDSIZE32_PTRDIFF_LONG	0
+ #endif
+ 
+ #define __WORDSIZE_TIME64_COMPAT32	0
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 2032311b27..61679e2c1c 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -40,6 +40,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0027-intl-Emit-no-lines-in-bison-generated-files.patch \
            file://0028-inject-file-assembly-directives.patch \
            file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
+           file://0030-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.26.2

