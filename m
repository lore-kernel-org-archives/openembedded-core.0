Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.9017.1620882298073872133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 22:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gPiZa4Aq;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id t21so13760776plo.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 22:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Blxz0Ko8tEQX73Z8dLJ8y/WUXb1wErXfqNF8NYXP2w=;
        b=gPiZa4Aq56HUg9kxMEf0i7lRF/dJkfdGFeATdwyYPFyXxLpMKlM0NCHgg+9tkcT9XF
         5qSMQ2qylINZFZhNpdlZ9DbIcZ3IINjeh0/ZHxQolJ66G01gM/ZGLqrBE6J7MEWrxU1k
         9aZrT/uLaYVbQHr4P6+F1G9PH+Afb76qDXdsbI3+O+yvt5LoYc1dqU0u3qjbWukJwvqv
         gMx7hEwLYmoUQQmgG+yDj2atWLVufDnV4LLvZ3ABafS4Quoqk8P8lcSX7Ke97MKyauo7
         7DCkyC/32UlqbseV/93Wl2JV5JdC48VpLFUAenW+rWSmOzgWH3PV38eCcKqlBb6TF3ST
         6+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Blxz0Ko8tEQX73Z8dLJ8y/WUXb1wErXfqNF8NYXP2w=;
        b=DoBkA/Qe/QW/PRObBB++OH/8s08pogTE+NL0jVayncjR4SIOWj4pQBGyElPZFiX3LQ
         zM46b9tqtj1hBaU3tJTr6o6HkbvOKiknWoeDyQkGbP7C+X8Wh4NTlFz2BMYW4yDtM0hK
         mC5DxAH4jJ54wUz52jUsdXSssilmNeHWhSHVEWeDXjPFagm5cHgxUAy1zlnOp4GUliBz
         2AX/Jn+DZ5nAQk1ppuOFoL1gDuZh9iXuXAf10XoPfafIXm4IRtO53BVHu3ZcuoIEOR7L
         nHobrcaEavQfRXxaL0PRiEN0ujjGybEv9NAYbjGaJshFQ11YSPtwCYci9xQForBbMcgr
         8QGw==
X-Gm-Message-State: AOAM531iUK9grOHWqIPFMV53SqSmQyz2I8jG4U4KsMX3dHcRT46TCnwb
	rNHxYxvLeZ9vjYEtTnFwwobL3wxmtt+i7Q==
X-Google-Smtp-Source: ABdhPJzPoQ8y2GG20p7pTFkY7lyPsH4nRRDuUGtCwU4gPfXhyglntmGIz6kYx8Kku7lJsAVI6orpSg==
X-Received: by 2002:a17:902:ecc5:b029:ee:cb82:fbc6 with SMTP id a5-20020a170902ecc5b02900eecb82fbc6mr38185533plh.70.1620882297229;
        Wed, 12 May 2021 22:04:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id j2sm5420471pjn.26.2021.05.12.22.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 22:04:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] npth: Check for pthread_create for including lpthread
Date: Wed, 12 May 2021 22:04:53 -0700
Message-Id: <20210513050453.3404849-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pthread_detach() is moved into libc which means this test will fail
so check for pthead_create again

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=df65f897e9501aa5b64a5cbcb101301715f2ec2f
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Check for pthread_create to decide on libpthread linking

 ...em-with-regression-tests-on-recent-g.patch | 43 +++++++++++++++++++
 meta/recipes-support/npth/npth_1.6.bb         |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/npth/npth/0001-Revert-Fix-problem-with-regression-tests-on-recent-g.patch

diff --git a/meta/recipes-support/npth/npth/0001-Revert-Fix-problem-with-regression-tests-on-recent-g.patch b/meta/recipes-support/npth/npth/0001-Revert-Fix-problem-with-regression-tests-on-recent-g.patch
new file mode 100644
index 0000000000..47c426b4a5
--- /dev/null
+++ b/meta/recipes-support/npth/npth/0001-Revert-Fix-problem-with-regression-tests-on-recent-g.patch
@@ -0,0 +1,43 @@
+From e43524868bb4901703d63876f9d49f73ca75b3ab Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 May 2021 20:27:52 -0700
+Subject: [PATCH] Revert "Fix problem with regression tests on recent glibc."
+
+This reverts commit 3a9d32eb59194b989656548755066ccd9feb36ac.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8a9373c..8cda28d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -284,11 +284,9 @@ AC_TYPE_SSIZE_T
+ #
+ # Checks for libraries and functions.
+ #
+-#   We test for pthread_detach because glibc 2.22 includes
+-#   pthread_create but not pthread_detach.
+ if test "$have_w32_system" = no; then
+-  AC_SEARCH_LIBS([pthread_detach],[pthread])
+-  case "x$ac_cv_search_pthread_detach" in
++  AC_SEARCH_LIBS([pthread_create],[pthread])
++  case "x$ac_cv_search_pthread_create" in
+     xno)
+       have_pthread=no
+       ;;
+@@ -297,7 +295,7 @@ if test "$have_w32_system" = no; then
+       ;;
+     *)
+       have_pthread=yes
+-      config_libs="$config_libs $ac_cv_search_pthread_detach"
++      config_libs="$config_libs $ac_cv_search_pthread_create"
+       ;;
+   esac
+   if test "$have_pthread" != no; then
+-- 
+2.31.1
+
diff --git a/meta/recipes-support/npth/npth_1.6.bb b/meta/recipes-support/npth/npth_1.6.bb
index 94a3f00eac..d5a149e041 100644
--- a/meta/recipes-support/npth/npth_1.6.bb
+++ b/meta/recipes-support/npth/npth_1.6.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "\
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/npth/npth-${PV}.tar.bz2 \
            file://pkgconfig.patch \
+           file://0001-Revert-Fix-problem-with-regression-tests-on-recent-g.patch \
           "
 
 SRC_URI[md5sum] = "375d1a15ad969f32d25f1a7630929854"
-- 
2.31.1

