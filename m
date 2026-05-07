Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D203CD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 22:48:52 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1528.1778194125557130622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 15:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=I3i5NrOS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260507224841663a4413d600020768-voy6ld@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260507224841663a4413d600020768
        for <openembedded-core@lists.openembedded.org>;
        Fri, 08 May 2026 00:48:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2xA5EdxNGpDBhesC239WhkxK4qxKrmek/Dkpe9e+BLY=;
 b=I3i5NrOSIj7HqegFdbgg/vAGuXIiY8XAoZQgr83Habw4KZbo8Jj1G1xoKF0ElLmfOUtUXx
 SpOw2L0JQeXfze0hrvE/oaMcSTVjCY75/7EG9lqrkxT3Aya1hi8CQAzuXFm6vfxkatZEoA7J
 Cb7wdOUnD+2SeNumdlzm13Gds27KMxaV5DJMiyFTk/PzW4D/OkjBzJJ9ff2rHSSYWKWnYAW+
 EHFStlWJG02NS+CvN6AGawApDWU9I5CtJ4S/iJdjyIyCaWb76GJJxG113SPZOQ/Vs5W+5yJS
 955tqYLMNWNTrwrdx/kGNSLm69ytVvdBP0ESsw2WZZoUz3giCY7zUnMQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] glibc: stable 2.43 branch updates
Date: Fri,  8 May 2026 00:48:13 +0200
Message-ID: <20260507224813.3496793-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 22:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236626

From: Peter Marko <peter.marko@siemens.com>

$ git log --oneline ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c..e9517114acc77c0b8af9da6700107df16882b701
e9517114ac (origin/release/2.43/master) abilist.awk: Handle weak unversioned defined symbols
1634cc11a5 Linux: Only define OPEN_TREE_* macros in <sys/mount.h> if undefined (bug 33921)
d1d8d27164 include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h
8362e8ce10 Use pending character state in IBM1390, IBM1399 character sets (CVE-2026-4046)

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6629   | 6632   | +3   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 105    | 103    | -2   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 559    | 559    |  0   |
+--------------+--------+--------+------+

Changes in failed testcases:
malloc/tst-malloc-fork-deadlock-malloc-check  FAIL  PASS
malloc/tst-malloc-too-large-malloc-check      PASS  FAIL
nptl/tst-getpid3                              FAIL  PASS
stdlib/tst-qsort3                             FAIL  PASS

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.43.bb     | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 015e7943c5..af3db54cee 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.43/master"
 PV = "2.43+git"
-SRCREV_glibc ?= "ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c"
+SRCREV_glibc ?= "e9517114acc77c0b8af9da6700107df16882b701"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index ffc17eb072..b84c55ca17 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -17,7 +17,9 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438 \
+    CVE-2026-4046 \
+"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"

