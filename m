Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.4914.1615530071460093257
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 22:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iHA7wpl/;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id q5so2541367pgk.5
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 22:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yPGMgZFZoBpRQFIIFe35TcVx2YxO5sFGD6iy7C7eSJw=;
        b=iHA7wpl//ra+6uTaUWC6N1O905GjQo+wBKTgjqi62CEUxCImLEMnH4gybP26xd9SKH
         PlKJNr+Uhqb69JDMjAJNwr3rkLo2Lgo5/uM3aAXZejcWgAC4YqkryexrZy8e+EDveZe8
         7Yy3lm/CRqI5VoB5/NSVJtSuZzxGOaD9/nlMsUu5p1hfsEV6MObvI6UYrHXx8Bzhv46L
         jwQKDfd7oiOiCK930rR26tC+lhQEyrFFsN96oR98QAGtws2G/AmcHRg/iNAz3IphZjSx
         wZdQaCDT8w7lxpZV9U1BggdCwGmniyRNpxA1x4yQE85u8mU6La6z+cUhtHdVELp7fBBK
         nqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yPGMgZFZoBpRQFIIFe35TcVx2YxO5sFGD6iy7C7eSJw=;
        b=shYVwWh0v6TOprK1r6cORR+WOMjfAmdJrmk7wlZLu+Rg1oEz/oaTlclzsIsWfiEo60
         /QGOiBRrQxBc/TmWaw0q3B1P8qen51e/pVCesPtVR43zjcGoYSvZ8QCNs/5G6KGX4cFi
         pVWM4Uyk7E15Y3cgGg7Ut8k1m6b3FLTGhRF4+LumEy5MEViCtVEOQN30iuWLg1WeumHV
         O5/1aMhpiixowMSZkCKDKiV9k+w4eLfK/BFcv0Hs2vkUQB4VAo9hGFbGwzF+4yt5DjQr
         8PaN5rPKlfS4ak/g2u73f2NcPXdnXmuaiZzQzG30TaYo0u3UYBRXivbYQPw+t0JJuC5L
         dz1w==
X-Gm-Message-State: AOAM532q8b7QkC58cDq4ZO95fnRq0oYZ/VQgQKTS2KLsaEKl+YOrKVMO
	KCcF5y4RXva9OkcifP4g514kt8tKPwH+pA==
X-Google-Smtp-Source: ABdhPJxiXj5LL9CHFnVWlWBCpuFe37H3BmogBufnKG2cVfDzcLbeDoFNn+q55kSUYMTAMj3fXqIxtg==
X-Received: by 2002:a63:ba03:: with SMTP id k3mr10445017pgf.274.1615530070680;
        Thu, 11 Mar 2021 22:21:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id e1sm4180378pfi.175.2021.03.11.22.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 22:21:10 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] libunwind: Do not assume libdir for ppc64
Date: Thu, 11 Mar 2021 22:21:05 -0800
Message-Id: <20210312062107.1549935-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210312062107.1549935-1-raj.khem@gmail.com>
References: <20210312062107.1549935-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures that build respects OE's choice for libdir

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...gure-Do-not-enforce-libdir-for-ppc64.patch | 35 +++++++++++++++++++
 .../libunwind/libunwind_1.5.0.bb              |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind/0001-configure-Do-not-enforce-libdir-for-ppc64.patch

diff --git a/meta/recipes-support/libunwind/libunwind/0001-configure-Do-not-enforce-libdir-for-ppc64.patch b/meta/recipes-support/libunwind/libunwind/0001-configure-Do-not-enforce-libdir-for-ppc64.patch
new file mode 100644
index 0000000000..751f1b3404
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/0001-configure-Do-not-enforce-libdir-for-ppc64.patch
@@ -0,0 +1,35 @@
+From 154c7465de2aeb9a8ba3416bbed6e6e07f58c583 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 11 Mar 2021 21:52:28 -0800
+Subject: [PATCH] configure: Do not enforce libdir for ppc64
+
+OE has its own multilib configuration, therefore hardcoding libdir
+breaks that, instead respect the settings coming from build environment
+via configure options.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c8d68f7..254440f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -206,12 +206,6 @@ fi
+ AM_CONDITIONAL(USE_DWARF, [test x$use_dwarf = xyes])
+ AC_MSG_RESULT([$use_dwarf])
+ 
+-if test x$target_arch = xppc64; then
+-        libdir='${exec_prefix}/lib64'
+-        AC_MSG_NOTICE([PowerPC64 detected, lib will be installed ${libdir}]);
+-        AC_SUBST([libdir])
+-fi
+-
+ AC_MSG_CHECKING([whether to restrict build to remote support])
+ if test x$target_arch != x$host_arch; then
+   CPPFLAGS="${CPPFLAGS} -DUNW_REMOTE_ONLY"
+-- 
+2.30.2
+
diff --git a/meta/recipes-support/libunwind/libunwind_1.5.0.bb b/meta/recipes-support/libunwind/libunwind_1.5.0.bb
index 5e4693e205..887a35708e 100644
--- a/meta/recipes-support/libunwind/libunwind_1.5.0.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.5.0.bb
@@ -6,6 +6,7 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
            file://0004-Fix-build-on-mips-musl.patch \
            file://0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
            file://0006-Fix-for-X32.patch \
+           file://0001-configure-Do-not-enforce-libdir-for-ppc64.patch \
            "
 SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
 
-- 
2.30.2

