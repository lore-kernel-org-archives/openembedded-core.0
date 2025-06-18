Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55736C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 17:22:27 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.1510.1750267342458584913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 10:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=WRL6eOvk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202506181722180ecfa3d1c51b9e42aa-rsfe0z@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202506181722180ecfa3d1c51b9e42aa
        for <openembedded-core@lists.openembedded.org>;
        Wed, 18 Jun 2025 19:22:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2pwXrMciOd1H096KVtLqiWKNiPgySqzyQESo2JJXlio=;
 b=WRL6eOvkExnQL2K1lf+hgL+kpq0GS1srXEP+xGGHC2Ngw2rQgqSW6XnQWymwauq+78i5K3
 nqQNwdB2rPLoXZF6UjWLS3Vb7kxRk2enU49yr5HmmmzwZI6oapd7oh5JCzYMwI0UQHMkCmgZ
 UZPhGdLK1O+8oakNq0M5bQxYCCtNkPV16ZSBAO/KivN6Dt4fYjBGSSPJAeOcPmxDwauLkkz4
 f024ZU79gyf/i48S0NV67Bca1QtzDNmKvSjSuON7oOXmmTGSl8uRrurps4GVNhw1lVMFqe2v
 MytxXa1yPpEKIYlIxLQWR65Djietw7QQONn7L/aLw31p6hxbkDLN2raw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] glibc: stable 2.39 branch updates
Date: Wed, 18 Jun 2025 19:21:31 +0200
Message-Id: <20250618172131.2131228-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 17:22:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219027

From: Peter Marko <peter.marko@siemens.com>

$ git log --oneline 5b4c4617016d28569106549dff6f9fec73eed5ce..0c76c951620f9e12df2a89b2c684878b55bb6795
0c76c95162 ppc64le: Revert "powerpc: Optimized strcmp for power10" (CVE-2025-5702)
b48d7ab036 ppc64le: Revert "powerpc : Add optimized memchr for POWER10" (Bug 33059)
55cdcadf73 ppc64le: Revert "powerpc: Fix performance issues of strcmp power10" (CVE-2025-5702)
84bdbf8a6f ppc64le: Revert "powerpc: Optimized strncmp for power10" (CVE-2025-5745)
d952c6efaa sparc: Fix argument passing to __libc_start_main (BZ 32981)
515d4166f4 elf: Fix subprocess status handling for tst-dlopen-sgid (bug 32987)
899dd3ab2f x86_64: Fix typo in ifunc-impl-list.c.
624285af3b elf: Test case for bug 32976 (CVE-2025-4802)
2ca34d7627 support: Use const char * argument in support_capture_subprogram_self_sgid
dab44a3b2b elf: Keep using minimal malloc after early DTV resize (bug 32412)
5cf17ebc65 hurd: Fix tst-stack2 test build on Hurd

test results:
            Before After  Diff
FAIL           140   142    +2
PASS          5846  5846     0
UNSUPPORTED    243   243     0
XFAIL           16    16     0
XPASS            4     4     0

failed test changes:
-elf/tst-audit21
+elf/tst-audit-tlsdesc-dlopen2
+elf/tst-dlopen-sgid
-malloc/tst-free-errno-malloc-hugetlb1
+malloc/tst-free-errno
+malloc/tst-malloc-tcache-leak
-nptl/tst-mutex10
+nptl/tst-mutexpi8-static

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc                       | 2 +-
 ...0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch | 2 +-
 ...3-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch | 2 +-
 meta/recipes-core/glibc/glibc_2.41.bb                           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index d84106fb95..2d31131e03 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.41/master"
 PV = "2.41+git"
-SRCREV_glibc ?= "5b4c4617016d28569106549dff6f9fec73eed5ce"
+SRCREV_glibc ?= "0c76c951620f9e12df2a89b2c684878b55bb6795"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch b/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
index 862c7b9086..b42b186418 100644
--- a/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
+++ b/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
@@ -13,7 +13,7 @@ diff --git a/Makeconfig b/Makeconfig
 index e35c5cfe4e..7a19c731c6 100644
 --- a/Makeconfig
 +++ b/Makeconfig
-@@ -1176,7 +1176,7 @@ endif
+@@ -1172,7 +1172,7 @@ endif
  
  # The assembler can generate debug information too.
  ifndef ASFLAGS
diff --git a/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch b/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
index 71777d3f2c..50d80ed577 100644
--- a/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
+++ b/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
@@ -40,7 +40,7 @@ index 8a755293b3..22dafcaad1 100644
    # tests
  
  # process_madvise requires CAP_SYS_ADMIN.
-@@ -277,9 +278,10 @@ tests-time64 += \
+@@ -282,9 +283,10 @@ tests-time64 += \
    tst-ntp_gettimex-time64 \
    tst-ppoll-time64 \
    tst-prctl-time64 \
diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glibc/glibc_2.41.bb
index 82dcf08fcd..731b9ee255 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = ""
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-4802 CVE-2025-5702 CVE-2025-5745"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"

