Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB79FF8875
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 19:37:12 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4483.1777491422797661378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 12:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Ydct4n8h;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260429193659e5d109808300020709-vhm_6i@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260429193659e5d109808300020709
        for <openembedded-core@lists.openembedded.org>;
        Wed, 29 Apr 2026 21:37:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1GajbPkDq9iPOghRlYPX67QoOYM3alFsXex7xM3Jffo=;
 b=Ydct4n8hGeCCZsqtW2n2j0k4EhSqNHkcb0tIhm/3QHO7LyLmm91/aXlWWEVVt3A8C+plo2
 RiSRjx3no633ONQhrOIxvyePX4gsH83DGW3KCA2WrpPhpe3bOxvnMc6gqg9yKHciKEZo1V6f
 Ua9hc8bcetnyvBGeUzAmvfF563YG74iog4xRxlOOP4wLfNxNIUgyUe8XKb97EIcM0t5Mspzv
 xCP+P5V3YLdP5ZYyMZRVE5l7s6rL6CRffM/HhmHcM5kY6voUdw30Cl6bwiieklkwSvCPTIG7
 018pQvBaRU0deZru1sILIhjpkUVX1c4ANGbykEhcHJ0JF4zt9ZlS54Cw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/7] libgcrypt: upgrade 1.12.1 -> 1.12.2
Date: Wed, 29 Apr 2026 21:36:41 +0200
Message-ID: <20260429193647.3090502-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 19:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236131

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-41989 and CVE-2026-41990.

Release notes: [1]

Refereshed patches.

[1] https://lists.gnu.org/archive/html/info-gnu/2026-04/msg00007.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../files/0001-tests-Fix-link-errors-for-t-thread-local.patch | 2 +-
 ...tests-Makefile.am-fix-undefined-reference-to-pthread.patch | 4 ++--
 .../libgcrypt/{libgcrypt_1.12.1.bb => libgcrypt_1.12.2.bb}    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.12.1.bb => libgcrypt_1.12.2.bb} (95%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
index 8dc2fe328c..19a925c2c6 100644
--- a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
@@ -24,7 +24,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index 4800135..f0f7adb 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -98,7 +98,7 @@ testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -102,7 +102,7 @@ testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
  t_thread_local_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
diff --git a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
index bbd48ebeee..090948c3c5 100644
--- a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
+++ b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
@@ -17,7 +17,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index 93daf3c..4800135 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -96,7 +96,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -100,7 +100,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_secmem_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
@@ -26,7 +26,7 @@ index 93daf3c..4800135 100644
  t_thread_local_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
  t_thread_local_CFLAGS = $(GPG_ERROR_MT_CFLAGS)
  testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
-@@ -117,7 +117,7 @@ else
+@@ -122,7 +122,7 @@ else
  xtestsuite_libs = ../src/.libs/libgcrypt.so*
  xtestsuite_driver = testdrv
  t_kdf_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
similarity index 95%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
index b3c0d050b7..1eb6c472a3 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
@@ -26,7 +26,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "7df5c08d952ba33f9b6bdabdb06a61a78b2cf62d2122c2d1d03a91a79832aa3c"
+SRC_URI[sha256sum] = "7ce33c2492221a0436f96a8500215e9f3e3dcb5fd26a757cd415e7a843babd5e"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 

