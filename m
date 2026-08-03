Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BAEC55182
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 22:03:00 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4378.1785794576532324649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 15:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=L+TCuMaa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202608032202577bac28d72000020741-8cmuli@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202608032202577bac28d72000020741
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 00:02:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Iz5Yx+X8Tx15BuXEwIY7Js3Ggi/fGnqNX/etOKc1N+s=;
 b=L+TCuMaadBAdlGLNrVigUHz+yInrZ7fCagsickrRtPnFMb6EdgJFVTnZxcPxsLzJ+0SygC
 IV6Dw0813QkDop6kDrg3zsSDKnC6+L3Bi82oXojJQSPPZvX5QZl4YS4ouDnIBWEsiDBY8RQQ
 1CYFNc4L+Aj/Gjh6j34ZrP9VTmt/pEzYmra6x1m/58HJ2wwLkvpYnyZXRz5XB0AU0r+iOxRl
 +ixIXbI8cizDcYrLNLEPjnbc0jKNJXbldbgKRHvwT3OPf5jMRcHIniWW8XWP2aje9Z4R9wju
 CQu3slbuRqZAf51lkA/kjDaE5P60K0mE0RJVHsaQMUeP/qMKds13GWeA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 10/15] diffutils: patch CVE-2026-53910
Date: Tue,  4 Aug 2026 00:01:50 +0200
Message-ID: <20260803220157.1520377-10-peter.marko@siemens.com>
In-Reply-To: <20260803220157.1520377-1-peter.marko@siemens.com>
References: <20260803220157.1520377-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 22:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242666

From: Peter Marko <peter.marko@siemens.com>

Pick patches mentioned in NVD CVE report.

Adapt NEWS file to apply one of the patches.
Add special code to prevent build error dues to rebuild of manpage.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 3406d85634e5d793eb5c4f5ec9b7f03774a86d65)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../diffutils/CVE-2026-53910-01.patch         | 67 +++++++++++++++++++
 .../diffutils/CVE-2026-53910-02.patch         | 35 ++++++++++
 .../diffutils/diffutils_3.12.bb               |  9 +++
 3 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-01.patch
 create mode 100644 meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-02.patch

diff --git a/meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-01.patch b/meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-01.patch
new file mode 100644
index 0000000000..b2da72b04c
--- /dev/null
+++ b/meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-01.patch
@@ -0,0 +1,67 @@
+From 73ed7ce85cc78effb94daf028c9af6b4e5252e50 Mon Sep 17 00:00:00 2001
+From: Collin Funk <collin.funk1@gmail.com>
+Date: Mon, 20 Apr 2026 23:43:51 -0700
+Subject: [PATCH] diff3: check for integer overflows when reading line numbers
+ from diff
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Reported by Michał Majchrowicz.
+* NEWS: Mention the bug fix.
+* src/diff3.c (readnum): Return nullptr if the line number would
+overflow.
+
+CVE: CVE-2026-53910
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/diffutils.git/commit/?id=73ed7ce85cc78effb94daf028c9af6b4e5252e50]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ NEWS        | 8 ++++++++
+ THANKS      | 1 +
+ src/diff3.c | 3 ++-
+ 3 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/NEWS b/NEWS
+index a8115f7..bfe20d4 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,5 +1,13 @@
+ GNU diffutils NEWS                                    -*- outline -*-
+ 
++ * Noteworthy changes in release ?.? (????-??-??) [?]
++
++** Bug fixes
++
++  diff3 no longer overflows integers when reading line numbers from the
++  diff program.
++  [bug present since "the beginning"]
++
+ * Noteworthy changes in release 3.12 (2025-04-08) [stable]
+ 
+ ** Bug fixes
+diff --git a/THANKS b/THANKS
+index a96b68d..a372954 100644
+--- a/THANKS
++++ b/THANKS
+@@ -13,6 +13,7 @@ Chris Hanson <cph@gnu.org>
+ Jim Kingdon  <kingdon@panix.com>
+ Tom Lord  <lord@gnu.org>
+ David J. MacKenzie  <djm@gnu.org>
++Michał Majchrowicz  <mmajchrowicz@afine.com>
+ Roland McGrath  <roland@redhat.com>
+ Jim Meyering  <jim@meyering.net>
+ Gene Myers  <gene@eecs.berkeley.edu>
+diff --git a/src/diff3.c b/src/diff3.c
+index 1dfba37..1a74407 100644
+--- a/src/diff3.c
++++ b/src/diff3.c
+@@ -1020,7 +1020,8 @@ readnum (char *s, lin *pnum)
+ 
+   do
+     {
+-      num = c - '0' + num * 10;
++      if (ckd_mul (&num, num, 10) || ckd_add (&num, num, c - '0'))
++        return nullptr;
+       c = *++s;
+     }
+   while (c_isdigit (c));
diff --git a/meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-02.patch b/meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-02.patch
new file mode 100644
index 0000000000..7f87893f51
--- /dev/null
+++ b/meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-02.patch
@@ -0,0 +1,35 @@
+From 9ff04d5b84743e331e80b589335a52c5480d1815 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 21 Apr 2026 00:30:50 -0700
+Subject: [PATCH] diff3: prevent overflow in line offsets
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Michał Majchrowicz.
+* src/diff3.c (readnum): Limit line numbers to LIN_MAX / 2.
+
+CVE: CVE-2026-53910
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/diffutils.git/commit/?id=9ff04d5b84743e331e80b589335a52c5480d1815]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/diff3.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/diff3.c b/src/diff3.c
+index 4fed6a8..d32e6ad 100644
+--- a/src/diff3.c
++++ b/src/diff3.c
+@@ -1026,6 +1026,12 @@ readnum (char *s, lin *pnum)
+     }
+   while (c_isdigit (c));
+ 
++  /* Simplify overflow checking later, so that we can always add a
++     line number and a line count, or subtract two line numbers and
++     add 1 to the result, without worrying about overflow.  */
++  if (LIN_MAX / 2 < num)
++    return nullptr;
++
+   *pnum = num;
+   return s;
+ }
diff --git a/meta/recipes-extended/diffutils/diffutils_3.12.bb b/meta/recipes-extended/diffutils/diffutils_3.12.bb
index d00dd772ad..5bf0540eab 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.12.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.12.bb
@@ -6,6 +6,8 @@ require diffutils.inc
 SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
            file://run-ptest \
            file://0001-Skip-strip-trailing-cr-test-case.patch \
+           file://CVE-2026-53910-01.patch \
+           file://CVE-2026-53910-02.patch \
            "
 
 SRC_URI[sha256sum] = "7c8b7f9fc8609141fdea9cece85249d308624391ff61dedaf528fcb337727dfd"
@@ -21,6 +23,13 @@ inherit ptest
 
 RDEPENDS:${PN}-ptest += "make perl"
 
+# patch for CVE-2026-53910 touches source file, so build is trying to
+# refresh the manual, which is failing in cross-compile environment;
+# remove this code on next upgrade
+do_compile:prepend() {
+    touch ${S}/man/diff3.1
+}
+
 do_install_ptest() {
 	t=${D}${PTEST_PATH}
 	install -D ${S}/build-aux/test-driver $t/build-aux/test-driver

