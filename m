Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web12.4960.1585253658227194216
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 13:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ow75bqYc;
 spf=pass (domain: gmail.com, ip: 209.85.167.193, mailfrom: jpuhlman@gmail.com)
Received: by mail-oi1-f193.google.com with SMTP id p125so6716875oif.10
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 13:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=/MxIdEUVmMShMNH4lLzAC73IwCVPRhQwt8HB4/sfiu0=;
        b=Ow75bqYckWo7N0ufIAXQpgJNdgHVz+ExgGqaWBI2UZSMwqLPkd5yrsL1RKpmeXPRPu
         HLDZ0i62WnrEo95LALHZzmZzc+vQJ9Ny0Fa4oNS8X2GM4yBpUx5V6n/lncQt6A4fBrLN
         o6awcDlTuqrTXoBQbGRRvgnuCWr5U3fII3IrDA6UZWNikUnyHcbDOJTNvI3iw5XbykMZ
         jzg/NCZb6WElWch0ApAX66cDHqXmTI9MrLqSVpgBDfNY16keq1S7CY4kkellZADE28C2
         scZBULZLKH3I24RoX5Gyzp8y1fHYEmVbhcFD7KFgGHOb+mbfmgDEEFX16bAKrpC5ilZe
         ZB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=/MxIdEUVmMShMNH4lLzAC73IwCVPRhQwt8HB4/sfiu0=;
        b=o27BWPFRtG3CWFTKzgNLPkZ/rZBW46QtBrpMiKpZhYR9jcxYEgtc6efHGLlMTNvvnU
         X1q/fP66giGvqS8IcZy0g03eLmCuq5zou3cjiCRf/CCaqPBA4oyETcFgjz30ERkUdtp7
         OGlDOBx/STlwCPs32GhmaVmzfCa49F5/jnOdwlHPMvbZFOHgVONJ2E0pQyo2Hu/001AC
         6Mkxh7leJvHL8H02M3bebj/yBIUx3a3VO7+Kjzcoc56AZDvPIL2+KuVlHekUhVgxekQt
         DBLGPRfvznY5k2H9RFy0kBuZqFLzzsvwj6r04HmHEsfpGoBClm3BtvEGTSZqtPLUrbs7
         ZOVg==
X-Gm-Message-State: ANhLgQ2aAiqjRcaQtJ3w9KKag8Cm0A5fugJYaWbnHjOdZu8RRA0otgtp
	0xin8n/NbNOZRqK2ApKJAZj+dfrCgno=
X-Google-Smtp-Source: ADFU+vvSG/A/D491fBRj4wDgvqcnDohO20/6D8PY1k2mUdEVf0QUgzOKH3c1iwZepk6RPXZblnHgMg==
X-Received: by 2002:aca:55ce:: with SMTP id j197mr1567547oib.84.1585253657226;
        Thu, 26 Mar 2020 13:14:17 -0700 (PDT)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain ([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
        by smtp.gmail.com with ESMTPSA id k132sm891786oih.9.2020.03.26.13.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 13:14:16 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id CFC7A2A0AB3; Thu, 26 Mar 2020 13:14:15 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH] apr: add option for disabling time dependant tests
Date: Thu, 26 Mar 2020 13:14:11 -0700
Message-Id: <20200326201411.11713-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3

From: Jeremy Puhlman <jpuhlman@mvista.com>

[YOCTO #13839]

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 ...d-option-to-disable-timed-dependant-tests.patch | 69 ++++++++++++++++++++++
 meta/recipes-support/apr/apr_1.7.0.bb              |  2 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch

diff --git a/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch b/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
new file mode 100644
index 0000000000..abff4e9331
--- /dev/null
+++ b/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
@@ -0,0 +1,69 @@
+From 2bbe20b4f69e84e7a18bc79d382486953f479328 Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Thu, 26 Mar 2020 18:30:36 +0000
+Subject: [PATCH] Add option to disable timed dependant tests
+
+The disabled tests rely on timing to pass correctly. On a virtualized 
+system under heavy load, these tests randomly fail because they miss
+a timer or other timing related issues.
+
+Upstream-Status: Pending
+Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+---
+ configure.in     | 6 ++++++
+ include/apr.h.in | 1 +
+ test/testlock.c  | 4 ++--
+ 3 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index d9f32d6..f0c5661 100644
+--- a/configure.in
++++ b/configure.in
+@@ -2886,6 +2886,12 @@ AC_ARG_ENABLE(timedlocks,
+ )
+ AC_SUBST(apr_has_timedlocks)
+ 
++AC_ARG_ENABLE(timed-tests,
++  [  --disable-timed-tests	  Disable timed tests ],
++  [apr_has_timedtests="0"], [apr_has_timedtests="1"]
++)
++AC_SUBST(apr_has_timedtests)
++
+ # hstrerror is only needed if IPv6 is not enabled,
+ # so getaddrinfo/gai_strerror are not used.
+ if test $have_ipv6 = 0; then
+diff --git a/include/apr.h.in b/include/apr.h.in
+index ee99def..c46a5f4 100644
+--- a/include/apr.h.in
++++ b/include/apr.h.in
+@@ -298,6 +298,7 @@ extern "C" {
+ #define APR_HAS_XTHREAD_FILES     @apr_has_xthread_files@
+ #define APR_HAS_OS_UUID           @osuuid@
+ #define APR_HAS_TIMEDLOCKS        @apr_has_timedlocks@
++#define APR_HAVE_TIME_DEPENDANT_TESTS        @apr_has_timedtests@
+ 
+ #define APR_PROCATTR_USER_SET_REQUIRES_PASSWORD @apr_procattr_user_set_requires_password@
+ 
+diff --git a/test/testlock.c b/test/testlock.c
+index a43f477..6233d0b 100644
+--- a/test/testlock.c
++++ b/test/testlock.c
+@@ -396,13 +396,13 @@ abts_suite *testlock(abts_suite *suite)
+     abts_run_test(suite, threads_not_impl, NULL);
+ #else
+     abts_run_test(suite, test_thread_mutex, NULL);
+-#if APR_HAS_TIMEDLOCKS
++#if APR_HAS_TIMEDLOCKS && APR_HAVE_TIME_DEPENDANT_TESTS
+     abts_run_test(suite, test_thread_timedmutex, NULL);
+ #endif
+     abts_run_test(suite, test_thread_rwlock, NULL);
+     abts_run_test(suite, test_cond, NULL);
+     abts_run_test(suite, test_timeoutcond, NULL);
+-#if APR_HAS_TIMEDLOCKS
++#if APR_HAS_TIMEDLOCKS && APR_HAVE_TIME_DEPENDANT_TESTS
+     abts_run_test(suite, test_timeoutmutex, NULL);
+ #endif
+ #endif
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
index 8a9b780593..7073af8c98 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch \
            file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch \
            file://libtoolize_check.patch \
+           file://0001-Add-option-to-disable-timed-dependant-tests.patch \
            "
 
 SRC_URI[md5sum] = "7a14a83d664e87599ea25ff4432e48a7"
@@ -39,6 +40,7 @@ CACHED_CONFIGUREVARS += "ac_cv_file__dev_zero=yes"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[timed-tests] = "--enable-timed-tests,--disable-timed-tests,"
 
 do_configure_prepend() {
 	# Avoid absolute paths for grep since it causes failures
-- 
2.13.3

