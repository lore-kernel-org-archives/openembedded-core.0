Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72DCC04FFE
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:01 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.19157.1713529199435302516
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jraHOna8;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e69a51a33so2037270a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529198; x=1714133998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0b3fbFePIJY1s7CI624by7LvxR6hifo294sZXiEmCHo=;
        b=jraHOna8qBcAl8X8sMMHoI33LiKq1xdtRLUsd2CwrqT1+7TApkCjSwKIjVeQ+IVUvi
         bphd2WapSy20QXQOIMOt6lHZjL+wH+MToidKfmqkTHmvSHPH+QRt8DR5vcp7/8GHs1Gc
         G76TaFyk8HBVQn1nDC5FVg/arENBmCOizE/Fclc+IURjAa0xnKCewUgBdYWmVyoUp9bS
         KFdFu7haQHh546hIJI5m1V5wnBtSNgUJPWmwUdN+bgf8swZp1SWjrp0O0obTzTviVT0W
         /XlZggqniAiWkWUkBKqTa3IVHDlL4LRf+1Nv13qsT3d19GgSkgreOw+QWl0p+BaT/SVx
         QMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529198; x=1714133998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0b3fbFePIJY1s7CI624by7LvxR6hifo294sZXiEmCHo=;
        b=Jj5XTZ7gieBEwS3M7T9SOKiawqqtywLnZi7TNKAMuLRO1EGrjm7Ay1C8FAtCN1As0F
         zW0DRapE8ZQ8HU5qmgHzTn3gPFml3LdktPmWkHHigD7u7QROKofFOxkrPyShUNW+SGky
         I8dmgO0UGyeDsYflzsazvvV0KgRrwQ61sKhtl7RDA5cQ6l1Z5J989zXoXqLSx/SQAPVO
         0r/cxwV2PfkAJQGGxHSB1usyujxdks7kSrMcsBq4Dpc7ui84Rx/HZ+NJEYrEWa8PQRNY
         1FVUlvU6bD5U9zOw0VihPdHOMqMIQYry8JP7YYcDc5m4jMEFnCBHmov6InsjCtR/+Kgq
         z4pg==
X-Gm-Message-State: AOJu0YwCIq27HESYytEB8ReSv71p84W9YeE7ZWrtnjAFEsHNZQmEIEMb
	fbruH0h3ThnFVEF5EgOvwBPaHmJi2HDlVwOslZtYH6Xzi8vnvf2a1sU0Sg==
X-Google-Smtp-Source: AGHT+IEbpjUUeocRboTGx5gml907rB+SYuZv3XRDXeCkBuXu8qLDWY6iIWDmOOFAyVVBF/FqL1+tCQ==
X-Received: by 2002:a50:f609:0:b0:56e:24a5:587a with SMTP id c9-20020a50f609000000b0056e24a5587amr1512134edn.11.1713529197800;
        Fri, 19 Apr 2024 05:19:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:19:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/19] apr: drop 0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch
Date: Fri, 19 Apr 2024 14:19:39 +0200
Message-Id: <20240419121945.1920944-13-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419121945.1920944-1-alex@linutronix.de>
References: <20240419121945.1920944-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198541

At some point this became unnecessary, as tested by building apr
with DISTRO_FEATURES:append = " ld-is-gold"

The logs do confirm that (previously) problematic binary links without errors.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...libapr-against-phtread-to-make-gold-.patch | 50 -------------------
 meta/recipes-support/apr/apr_1.7.4.bb         |  1 -
 2 files changed, 51 deletions(-)
 delete mode 100644 meta/recipes-support/apr/apr/0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch

diff --git a/meta/recipes-support/apr/apr/0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch b/meta/recipes-support/apr/apr/0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch
deleted file mode 100644
index 8760b0140ca..00000000000
--- a/meta/recipes-support/apr/apr/0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From c6afc4a4a766478cb6aa6b43a50051881b6318d7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 3 Mar 2017 22:24:17 +0100
-Subject: [PATCH 7/7] explicitly link libapr against phtread to make gold happy
- on test
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutexattr_init'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutexattr_settype'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutexattr_destroy'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutex_trylock'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_attr_setstacksize'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_create'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_join'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_detach'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_sigmask'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_once'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_key_create'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_getspecific'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_key_delete'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_setspecific'
-| collect2: error: ld returned 1 exit status
-| Makefile:114: recipe for target 'globalmutexchild' failed
-| make[1]: *** [globalmutexchild] Error 1
-| make[1]: Leaving directory '/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/apr/1.5.2-r0/apr-1.5.2/test'
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.in b/configure.in
-index a227e72..cbc0f90 100644
---- a/configure.in
-+++ b/configure.in
-@@ -784,6 +784,7 @@ else
-           APR_PTHREADS_CHECK_RESTORE ] )
-     fi
-     if test "$pthreadh" = "1"; then
-+        APR_ADDTO(LIBS,[-lpthread])
-         APR_CHECK_PTHREAD_GETSPECIFIC_TWO_ARGS
-         APR_CHECK_PTHREAD_ATTR_GETDETACHSTATE_ONE_ARG
-         APR_CHECK_PTHREAD_RECURSIVE_MUTEX
--- 
-1.8.3.1
-
diff --git a/meta/recipes-support/apr/apr_1.7.4.bb b/meta/recipes-support/apr/apr_1.7.4.bb
index d322629b66f..4df741c7668 100644
--- a/meta/recipes-support/apr/apr_1.7.4.bb
+++ b/meta/recipes-support/apr/apr_1.7.4.bb
@@ -18,7 +18,6 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0002-apr-Remove-workdir-path-references-from-installed-ap.patch \
            file://0004-Fix-packet-discards-HTTP-redirect.patch \
            file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch \
-           file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch \
            file://libtoolize_check.patch \
            file://0001-Add-option-to-disable-timed-dependant-tests.patch \
            file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
-- 
2.39.2


