Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D59C6FA86
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:21:15 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.8308.1662560469280703160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lLTfk3bH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id l65so14781635pfl.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=PFN61DMNCaneY/sfYckswUntm5kQrwbwty/hTSRVRCY=;
        b=lLTfk3bHLXXcwjuzjAfV4GIK6MjJpSctARCJemWQovPxMuMane0CxhKBMU8f+3hutk
         r1/dj5bDfyJDu7Xlq8j4c2A+AfX+zDS2JRxtx31wmsADF8s2YBmmJm2bGx9T4FYKKOOq
         /VXZSE8BA/0qyQR5pduHE3Vk0/95mtZi/OFufPEuGTkMmdWyNyR0Vp45NRM7QQR/nYyc
         xy4EX0I/WsfC0gdX4a4Spqs31Ytv3msRoyjknxFdEHdCH+fYqRTuy7cqHJ+/FYsoBDNT
         xfpSUO1syM0KIV2fFIXzOclEbtF0e5nCQLERLCG6K2qO0xmQlMnESlFUi+4272yBfZcn
         KqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PFN61DMNCaneY/sfYckswUntm5kQrwbwty/hTSRVRCY=;
        b=32x23+8t+8eEapNj96W9GIUsyFjDqBh764NSJvqeAJ4DLJECP6YNmtBGcuv5kBnGsL
         dDkJ9Eef/0FFJ1MQt6ZydhUkGWkCcpxD+V6QUXBOlfNfVDAd9lbvv5axpkhZj9HwPJRG
         0ATPkmwtYhHTaADtDnkdwLBC9BiYz1+RjAaUMYvufr5BRiukkfxnyMeYGwbvWj/9oiL7
         glo3dXzt9J9DkgTRjtfLl1nwommOgqAq3so//3JdTej8ohU02SkJnxkktYAO8ZPWsiPW
         dg/vYrBT8pPkJkA43R9fe/nTB+lnGGviANHBNaNTosODh92/qRomHHaXflWgLSwMCGfD
         MvCA==
X-Gm-Message-State: ACgBeo0koO8uQ74C6i+/8fsnA4XM1x64FPtMNr11z+lUHFxTWZfd3ETv
	FVaU9nR3M1bWFAhJ2+HTWHddsTmcF6+tA/Mz
X-Google-Smtp-Source: 
 AA6agR61z1vTOH6ZaN0bouLQ+hyFe/BSHC4u8xMN8SIghlkq6fo0gGDpEhSl9BENUIeO2ZkN9G5ctw==
X-Received: by 2002:aa7:95b0:0:b0:537:cdbe:5c8a with SMTP id
 a16-20020aa795b0000000b00537cdbe5c8amr4125127pfk.59.1662560468269;
        Wed, 07 Sep 2022 07:21:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.21.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:21:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/24] apr: Cache configure tests which use
 AC_TRY_RUN
Date: Wed,  7 Sep 2022 04:20:15 -1000
Message-Id: 
 <8784e3712add2fbdf684d442a14fb94e5a7fc61f.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:21:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170409

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
2.25.1


