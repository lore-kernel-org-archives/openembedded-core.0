Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DC5C742A7
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:55 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.8705.1678229325886900780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=yobUnBz7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id c10so9070038pfv.13
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwzmvn2NE2qgwNRDVJ4cE4Zh1wuTeoYx6gAI6uz5wB4=;
        b=yobUnBz77Cn40YT4D6jBUQ1EtBfikpkA17RMVNG+cauo4DWXSKbjmgwOffY0PmhOmQ
         SSi/M/o0vD2UA6LK9LwJxKVkENBYY4644WXQzVADON2dc58Uq538kDCTuYB9ZPrhqjVm
         edPZAZBohB01ICjVRZWNjWM2dkobc4zXJUFrpqqER0z9Pj7HsMSJClQuK9mqDyrf5UcF
         Hrc73r6XYJKaQRj51q4yBSmAy4xX0ecJmmgU6wQgFnkDimxOvdrxKcNGpz4O2V4PmT59
         voMvMc2fm47ejuAIK452snUX6uEBTFLd5BrExUH9fv0U6h0mV9AfaE31Ywg21xLeotXS
         cMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwzmvn2NE2qgwNRDVJ4cE4Zh1wuTeoYx6gAI6uz5wB4=;
        b=Od7EDpvTiOCO8JQQT1KWBsZ2lKfK3zvClTiZKcMpKi8sybHWXAgYDTme3LSlpcxsg0
         jTFDVOwINIJkbg79MxeZkiGQSMlGCkUPZz8DqaH4H1ihlX28tjnnzSUA61bc6BRna0Dv
         UiU7ovwwxE3r4UunaXsyAarK8GYDaT3rXYVKYclzfKZjp7jGaLg39hBLnZ7Q0y8Fd4P+
         tGMX9F2P2qFSyMrccfldTIuehyzKoExDjDldHapjHsfFROSNQbGIRvKgs32d4MNmy8VT
         iMO4cRnAmS3xZZMv67Zd+oPEBwmYMN6I4Wk1cOZYbufy+G9338X4kVtr7tZ68wgPdJeu
         ayzA==
X-Gm-Message-State: AO0yUKX5Ek7CC0zK3+pFj9UUd9mGl4oFQFjVyLgiMQprN6CTnf6kQXfL
	tT36ggyV3iCgfXCTpWtwuRdhgND0bfHPHPhT0Dc=
X-Google-Smtp-Source: AK7set+oPwbcTo0nDgbZj2Ot49DGl3L2e4Ic2NNXAXSVqG6lGYfqQtQS2QuDiU6DvHk8f2HkTmQAKQ==
X-Received: by 2002:a62:19c9:0:b0:60e:950c:7a5d with SMTP id 192-20020a6219c9000000b0060e950c7a5dmr15009747pfz.1.1678229324864;
        Tue, 07 Mar 2023 14:48:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/23] apr: Cache configure tests which use AC_TRY_RUN
Date: Tue,  7 Mar 2023 12:47:49 -1000
Message-Id: <104c9ddf7a5323e5193c611b98b3e7465157aecd.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178137

From: Khem Raj <raj.khem@gmail.com>

AC_TRY_RUN macro means the test needs to run to find the result and we
are cross compiling so this will always get wrong results, this results
in miscompiling apache2 on musl because it disables rlimit
(ac_cv_struct_rlimit) wrongly.

All these variables are determined with AC_TRY_RUN checks

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 504eb0ff1cae200ee85ec18ebae564cae9bf9c8c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-runtime-test-for-mmap-that-can-map-.patch | 62 +++++++++++++++++++
 meta/recipes-support/apr/apr_1.7.0.bb         | 15 ++++-
 2 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch

diff --git a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
new file mode 100644
index 0000000000..fa6202da79
--- /dev/null
+++ b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
@@ -0,0 +1,62 @@
+From ee728971fd9d2da39356f1574d58d5daa3b24520 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 26 Aug 2022 00:28:08 -0700
+Subject: [PATCH] configure: Remove runtime test for mmap that can map
+ /dev/zero
+
+This never works for cross-compile moreover it ends up disabling
+ac_cv_file__dev_zero which then results in compiler errors in shared
+mutexes
+
+Upstream-Status: Inappropriate [Cross-compile specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.in | 32 --------------------------------
+ 1 file changed, 32 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index a99049d..f1f55c7 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1182,38 +1182,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm_unlink shmget shmat shmdt shmctl \
+ APR_CHECK_DEFINE(MAP_ANON, sys/mman.h)
+ AC_CHECK_FILE(/dev/zero)
+ 
+-# Not all systems can mmap /dev/zero (such as HP-UX).  Check for that.
+-if test "$ac_cv_func_mmap" = "yes" &&
+-   test "$ac_cv_file__dev_zero" = "yes"; then
+-    AC_MSG_CHECKING(for mmap that can map /dev/zero)
+-    AC_TRY_RUN([
+-#include <sys/types.h>
+-#include <sys/stat.h>
+-#include <fcntl.h>
+-#ifdef HAVE_SYS_MMAN_H
+-#include <sys/mman.h>
+-#endif
+-    int main()
+-    {
+-        int fd;
+-        void *m;
+-        fd = open("/dev/zero", O_RDWR);
+-        if (fd < 0) {
+-            return 1;
+-        }
+-        m = mmap(0, sizeof(void*), PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
+-        if (m == (void *)-1) {  /* aka MAP_FAILED */
+-            return 2;
+-        }
+-        if (munmap(m, sizeof(void*)) < 0) {
+-            return 3;
+-        }
+-        return 0;
+-    }], [], [ac_cv_file__dev_zero=no], [ac_cv_file__dev_zero=no])
+-
+-    AC_MSG_RESULT($ac_cv_file__dev_zero)
+-fi
+-
+ # Now we determine which one is our anonymous shmem preference.
+ haveshmgetanon="0"
+ havemmapzero="0"
+-- 
+2.37.2
+
diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
index b9d3e356da..5e62e5683f 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -25,6 +25,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0001-Add-option-to-disable-timed-dependant-tests.patch \
            file://autoconf270.patch \
            file://0001-add-AC_CACHE_CHECK-for-strerror_r-return-type.patch \
+           file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
            file://CVE-2021-35940.patch \
            "
 
@@ -37,12 +38,22 @@ OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 
 # Added to fix some issues with cmake. Refer to https://github.com/bmwcarit/meta-ros/issues/68#issuecomment-19896928
 CACHED_CONFIGUREVARS += "apr_cv_mutex_recursive=yes"
-
+# Enable largefile
+CACHED_CONFIGUREVARS += "apr_cv_use_lfs64=yes"
+# Additional AC_TRY_RUN tests which will need to be cached for cross compile
+CACHED_CONFIGUREVARS += "apr_cv_epoll=yes epoll_create1=yes apr_cv_sock_cloexec=yes \
+    ac_cv_struct_rlimit=yes \
+    ac_cv_func_sem_open=yes \
+    apr_cv_process_shared_works=yes \
+    apr_cv_mutex_robust_shared=yes \
+    "
 # Also suppress trying to use sctp.
 #
 CACHED_CONFIGUREVARS += "ac_cv_header_netinet_sctp_h=no ac_cv_header_netinet_sctp_uio_h=no"
 
-CACHED_CONFIGUREVARS += "ac_cv_sizeof_struct_iovec=yes"
+# ac_cv_sizeof_struct_iovec is deduced using runtime check which will fail during cross-compile
+CACHED_CONFIGUREVARS += "${@['ac_cv_sizeof_struct_iovec=16','ac_cv_sizeof_struct_iovec=8'][d.getVar('SITEINFO_BITS') != '32']}"
+
 CACHED_CONFIGUREVARS += "ac_cv_file__dev_zero=yes"
 
 CACHED_CONFIGUREVARS:append:libc-musl = " ac_cv_strerror_r_rc_int=yes"
-- 
2.34.1


