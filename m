Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.7060.1588683729384669691
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GP7epCvE;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id k1so2660174wrx.4
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IlVpJFA9OxYgEPr29Xv0LLbrOG2KUT4iHths9V8W2zM=;
        b=GP7epCvEIe+GgQILiZgePheE9NJvWmu4u9PuOspuIymd4T1+/6tjTYzkc9ZENmUIxF
         JJYt4cNDmav4H4bdz4hrXK1J8A7aXTARFnUd2rMvS8UlSr+89loJYuDKlSmRGuqwCcjF
         ROtW8y0HwT2Uc84CQhIOEvq5kM/Op0RkJivd8HFhN/tO5UzihF/b8uIIGv6ev1x/YDos
         QKmmX6nLzOeklSJhDml9YXhGdvdXwchhqtC3CW3CPCbcfGCn9XOAqNOCuA9BiaOD58Km
         RpOzrVBGYpM9VPJFujf7RwUrnFU+jzxMDbMrSMzLSdHDSDtP0UVmcPtzm7CIaIasyfJy
         jVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IlVpJFA9OxYgEPr29Xv0LLbrOG2KUT4iHths9V8W2zM=;
        b=hM+IwkUE5qnl3LtDREi1XAnP1PhYfznuy+lDNBCW54wjT7HZ5GW6ovOVhq7W3DemEg
         EWDFtWdThOPjOZ6/dqm2ojVDz2rpoHi9kOWgYdYHceksW7KgYIAjgl6tsdA4Z9qfuSAk
         5iYjX9/9qD84TMntX3RgnXoJHIJssQGD/3ZbkP3tWJg9639gyFbSQPapya14uJmxmcrW
         2dGsbapp81qPWqc8TjO2LXOWC79CUYb7bAM/djntG0SAYo4T1P5ze1LgHCP68DXc2zao
         hvyXTTDtUmiXbFmMwr/+soOP28js9/z9itQsqJKe8f1n5qCy5nse/L4ospC517zUCVyK
         08PQ==
X-Gm-Message-State: AGi0PubpgU2JxQDx+sqb3SUF4Ab6NsKmfv5E2tAbyx2khKiG2/+v+Qbi
	wduEeZCu8wltIzsXGvgT3vdDruLp
X-Google-Smtp-Source: APiQypJwrxo8shzzMjWoeJvP8/exnE3g7HlOaWiR0VlPS1vbM6ZDFRM9VCy4H2imKDwR/NotVJjU4g==
X-Received: by 2002:adf:fac4:: with SMTP id a4mr3429448wrs.134.1588683727533;
        Tue, 05 May 2020 06:02:07 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/24] libcap: update to 2.33
Date: Tue,  5 May 2020 15:01:16 +0200
Message-Id: <20200505130133.24930-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-tests-do-not-statically-link-a-test.patch | 32 +++++++++++++++----
 ...hread_yield-with-standard-sched_yiel.patch | 24 ++++++++++++++
 .../libcap/{libcap_2.32.bb => libcap_2.33.bb} |  5 +--
 3 files changed, 53 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-support/libcap/files/0004-psx.c-replace-pthread_yield-with-standard-sched_yiel.patch
 rename meta/recipes-support/libcap/{libcap_2.32.bb => libcap_2.33.bb} (90%)

diff --git a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
index e568cc47c5..912f33f165 100644
--- a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
+++ b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
@@ -1,4 +1,4 @@
-From 1179b423cce8d119b42cebfb3daa77c540fdca43 Mon Sep 17 00:00:00 2001
+From 24d59c99bcba065f1f40f49f870a5f6483b4b078 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 15 Jan 2020 17:16:28 +0100
 Subject: [PATCH] tests: do not statically link a test
@@ -7,20 +7,40 @@ This fails on e.g. centos 7
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- tests/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ tests/Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/tests/Makefile b/tests/Makefile
-index 7162cf0..6af47af 100644
+index f9cec56..aa0d09b 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
-@@ -29,7 +29,7 @@ psx_test_wrap: psx_test.c $(DEPS)
+@@ -29,23 +29,23 @@ psx_test_wrap: psx_test.c $(DEPS)
  run_libcap_psx_test: libcap_psx_test
  
  libcap_psx_test: libcap_psx_test.c $(DEPS)
 -	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create --static
 +	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create
  
+ run_libcap_launch_test: libcap_launch_test libcap_psx_launch_test noop
+ 	sudo ./libcap_launch_test
+ 	sudo ./libcap_psx_launch_test
+ 
+ libcap_launch_test: libcap_launch_test.c $(DEPS)
+-	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) --static
++	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB)
+ 
+ # this varies only slightly from the above insofar as it currently
+ # only links in the pthreads fork support. TODO() we need to change
+ # the source to do something interesting with pthreads.
+ libcap_psx_launch_test: libcap_launch_test.c $(DEPS)
+-	$(CC) $(CFLAGS) $(IPATH) -DWITH_PTHREADS $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create --static
++	$(CC) $(CFLAGS) $(IPATH) -DWITH_PTHREADS $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create
+ 
+ noop: noop.c
+-	$(CC) $(CFLAGS) $< -o $@ --static
++	$(CC) $(CFLAGS) $< -o $@
+ 
  clean:
- 	rm -f psx_test psx_test_wrap libcap_psx_test
+ 	rm -f psx_test psx_test_wrap libcap_psx_test libcap_launch_test *~
diff --git a/meta/recipes-support/libcap/files/0004-psx.c-replace-pthread_yield-with-standard-sched_yiel.patch b/meta/recipes-support/libcap/files/0004-psx.c-replace-pthread_yield-with-standard-sched_yiel.patch
new file mode 100644
index 0000000000..848ceb2c0c
--- /dev/null
+++ b/meta/recipes-support/libcap/files/0004-psx.c-replace-pthread_yield-with-standard-sched_yiel.patch
@@ -0,0 +1,24 @@
+From a2c4cdb05d0e382101b13944c09c4375e8d7de5f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 31 Mar 2020 13:39:28 +0200
+Subject: [PATCH] psx.c: replace pthread_yield() with standard sched_yield()
+
+This was causing failures when building with musl C library in
+particular.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+diff --git a/libcap/psx.c b/libcap/psx.c
+index 04d250f..7e4ac10 100644
+--- a/libcap/psx.c
++++ b/libcap/psx.c
+@@ -533,7 +533,7 @@ long int __psx_syscall(long int syscall_nr, ...) {
+ 	if (!waiting) {
+ 	    break;
+ 	}
+-	pthread_yield();
++	sched_yield();
+     }
+ 
+     errno = restore_errno;
diff --git a/meta/recipes-support/libcap/libcap_2.32.bb b/meta/recipes-support/libcap/libcap_2.33.bb
similarity index 90%
rename from meta/recipes-support/libcap/libcap_2.32.bb
rename to meta/recipes-support/libcap/libcap_2.33.bb
index d78a58f7d2..bec492ca5f 100644
--- a/meta/recipes-support/libcap/libcap_2.32.bb
+++ b/meta/recipes-support/libcap/libcap_2.33.bb
@@ -11,9 +11,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
+           file://0004-psx.c-replace-pthread_yield-with-standard-sched_yiel.patch \
            "
-SRC_URI[md5sum] = "7416119c9fdcfd0e8dd190a432c668e9"
-SRC_URI[sha256sum] = "1005e3d227f2340ad1e3360ef8b69d15e3c72a29c09f4894d7aac038bd26e2be"
+SRC_URI[md5sum] = "dcc6220b4a9bf260050b20c07edcddf4"
+SRC_URI[sha256sum] = "08edeaba2757021aeec45c4eeec52566675e0e0f5d4f057284d729e04f2643d6"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.26.1

