Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD8DECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 07:46:54 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.34559.1661500010081044503
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 00:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o6d3t30n;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 x14-20020a17090a8a8e00b001fb61a71d99so7321176pjn.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 00:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=keLDwGydwLs+gwXm2vEBaS99cwDeN6enWYARXfIF6IE=;
        b=o6d3t30nz10RaSLG4hcg2jDOkqdjZpQqDzsi7pDDS/A1y+h6J/Nf1P419WDi6TTfjB
         rcDgBw3G/di56r7QMviqyohpCdi8++1pr45P2V7DCrj4A9o6iFhzi92osQYlNAdxlpSL
         DNKIFGlD6xI38uDOLrQOxwbT/t1wIG7QrsCWAvr6TERolvniEttBP5onPA7s7VtcvGTI
         nA6nUTIbWgiryPR9iu3Af/RC4ZEzVliZEWsUP89H9SGtF1Hu9NNn/BxrYucK0HGVPXNa
         mVgZU8wbliKLmrzRb4p9/7xl81Y4ozt+tH3UBt0snwMJKIkMwFoD7M3CxsYUb449CDeN
         5DbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=keLDwGydwLs+gwXm2vEBaS99cwDeN6enWYARXfIF6IE=;
        b=SXKgcfcN7ZQU5ctMtDj1JsmnIesLu+ZOwwzgaxZ42Bk8bEYka7sjEW1/gkQn6AR827
         0mq+DQtIN2U/52Wp95TI7gPf9ErHbsoAvTT1db1PhYKHKnDIIe9TMhiw/ph5xp9U2JLY
         MxlwfqySZaswQgaTavwqCfScbKFPvTPEMMQCs1+Efw371Bw2inNqYCig0U5z6SLyWsOs
         eOv2aPjkAuOWR3cnABgePrKZGV/GKqz7Qm+5qW96ZyPfApW8KW5Dl1m0D3opphhNQRYY
         QaLcLRRHHyIIrgHuhkrBS05jbqU1pWUv0pFDXjsdUptwE4U6wh0qLXqc7MuBpDhZDrXM
         WYMQ==
X-Gm-Message-State: ACgBeo1q6l+7K+ieXfPa906S2tu9oxzd8U9lC7SVGr5ZLvMorjKr9A/J
	sSAEA6lHsF9+EKRwOMzDJ14rxctUaM6n7w==
X-Google-Smtp-Source: 
 AA6agR6YnzRAhcQWrAWcYsSekdcVkLPQ3kbhwFqSnz9fzRFR8jxU3ZYMlRJ/bceSD6Kz7q2IRtre1A==
X-Received: by 2002:a17:90a:f698:b0:1fb:b605:df71 with SMTP id
 cl24-20020a17090af69800b001fbb605df71mr3216045pjb.134.1661500009090;
        Fri, 26 Aug 2022 00:46:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 m8-20020a170902db0800b00172d78876c7sm882884plx.74.2022.08.26.00.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 00:46:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] apr: Cache configure tests which use AC_TRY_RUN
Date: Fri, 26 Aug 2022 00:46:46 -0700
Message-Id: <20220826074646.3630062-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 07:46:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169903

AC_TRY_RUN macro means the test needs to run to find the result and we
are cross compiling so this will always get wrong results, this results
in miscompiling apache2 on musl because it disables rlimit
(ac_cv_struct_rlimit) wrongly.

All these variables are determined with AC_TRY_RUN checks

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: 
- Fix build issues due to /dev/zero check being disabled
  unconditionally in cross compile
- Define ac_cv_sizeof_struct_iovec properly

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
index 07bf61545e..cb4bb936d7 100644
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
2.37.2


