Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.6486.1601503933311887496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gbRRNuMb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id k8so2353342pfk.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=m9+dGFfm6BC3xG1HeXxWVH+Er3QbQEFxPCr+c/M3elM=;
        b=gbRRNuMbszoqMx6y0rI11slQVRAwQtzkHx7AV+eOYXjx8fG6CghQtN56/YHUGO7DaG
         08ru15WL4M9IoNyQHwZe8FUQeLdMChfwf+NqlQdJipNokDzmSfAwelppE41v3c2n4T3L
         h6fL1/ty+Mepk444kJoHv21kbmUlj2sMmbEXXgIu9nX3haU+1h9ZuR56BjquGpQN2L0t
         NhTiDN+vpWJm215wBycTkpfQZ3O58aRHseeP24DXFmXPAbP5qCPkXMLlqEl+W9n26MTQ
         r7c3Hr0bfporeLVOrO3XT9ETZq/ta8PYdu6hiLhZGrNwKaUAVMxidl4ofW1blpTTvoYs
         LhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=m9+dGFfm6BC3xG1HeXxWVH+Er3QbQEFxPCr+c/M3elM=;
        b=glFjNlcANU5V3mqtd88E0DfotrVZe6VjjJVh7uuD5Q4bnSgoaOA4uqZuUdEJwwPiO+
         grd3pZMaw67bte/c2F4qt2suA2iyG2B4qq/aAo4hZ2UuyjX3UK/ENjbJ7P8PEM+2ZD24
         VG/6EJa+EHPiwR49I974rrT8b85SV9b0LcHpVpgoO5LA+R5XZ17GWLnSvkp+Y3AyCZPW
         JpaXV0Mo2UDIQXBMK+plbO1/Y5pQCzdt/IxLB8/8+RCZ1wsB9k3+smrxCZuw+/bTcwWo
         LncvQVCsrr+zjlHreOcOMAsKaCYsO/GnK74qN0A+XtHn2HniuHsBX3uGqakmoBKKmwwv
         JMYQ==
X-Gm-Message-State: AOAM533XbDU9LcwWZOksXbMbawuhkut+3+6Si8iPFCP69vF1C8tutNbd
	l/Kacbde95FdTLHYZiUqVc9z3kg1zD5M1udL0CU=
X-Google-Smtp-Source: ABdhPJzvXEGEyWAUuQad6LcG2YG7Xv2XIvlGLA9fL95IAP+Ov05ryQIuKd+5AXfyDSUAmTrO2FP8TQ==
X-Received: by 2002:aa7:8249:0:b029:142:2501:3964 with SMTP id e9-20020aa782490000b029014225013964mr4551334pfn.41.1601503932451;
        Wed, 30 Sep 2020 15:12:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/41] site: Make sys_siglist default to no
Date: Wed, 30 Sep 2020 12:11:06 -1000
Message-Id: <766e1565f3d33d9222323076cd57c22994bc25bf.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

glibc 2.32 has deprecated sys_siglist [1]

since no is default for musl as well, therefore elevate it to common
site file for all

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=b1ccfc061feee9ce616444ded8e1cd5acf9fa97f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7c19f30849e9a73a7497d8e6c4719a2e57017086)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/site/common       | 7 +++++++
 meta/site/common-glibc | 3 ---
 meta/site/common-musl  | 5 -----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/site/common b/meta/site/common
index ff552329bd..62907274d7 100644
--- a/meta/site/common
+++ b/meta/site/common
@@ -19,3 +19,10 @@ shadow_cv_passwd_dir=${bindir}
 ac_cv_buggy_getaddrinfo=no
 
 ac_cv_path_SED=${ac_cv_path_SED=sed}
+
+# General
+ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=no}
+
+# bash
+bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=no}
+bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index a0680bc44c..0a665658fb 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -1,5 +1,4 @@
 # general
-ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=yes}
 ac_cv_func_calloc_0_nonnull=${ac_cv_func_calloc_0_nonnull=yes}
 ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
 ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
@@ -18,8 +17,6 @@ ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 ac_cv_func_strtod=${ac_cv_func_strtod=yes}
 
 # bash
-bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=yes}
-bash_cv_sys_siglist=${bash_cv_sys_siglist=yes}
 bash_cv_getcwd_malloc=${bash_cv_getcwd_malloc=yes}
 
 # clamav
diff --git a/meta/site/common-musl b/meta/site/common-musl
index 4be8d002d6..44a7a1aea9 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -1,5 +1,4 @@
 # general
-ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=no}
 ac_cv_func_calloc_0_nonnull=${ac_cv_func_calloc_0_nonnull=yes}
 ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
 ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
@@ -29,10 +28,6 @@ glib_cv_have_qsort_r=${glib_cv_have_qsort_r=no}
 #dbus-glib
 ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
 
-# bash
-bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=no}
-bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
-
 # coreutils
 fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
 gl_cv_func_getcwd_abort_bug=${gl_cv_func_getcwd_abort_bug=no}
-- 
2.17.1

