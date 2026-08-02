Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AECC55174
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 22:18:04 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31805.1785709075997689936
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 15:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=R4iDes/O;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260802221752480e54fd7300020748-ad6lpp@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260802221752480e54fd7300020748
        for <openembedded-core@lists.openembedded.org>;
        Mon, 03 Aug 2026 00:17:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=fkJ7HtNyPLXI6m5FsQoX9rzBA4YF+ihVygy977IRnEM=;
 b=R4iDes/Oe4TQzLJZPwq4OHnG37ArZNpV8hYRmZbvA/OZ5HMQBJtNxhw2xnotS0Svj6l0KU
 BjPPpN/OoSBAT/3li8maZxnE9LrWD9+rszXMH9NUXVwkthf1PFw89Q9cykElPcnlJd99n6S9
 NulAT9FAqJGq/XgvA8CAxxD41VfdCDdk+nf+QHASipfRJPuaA4vrEC+UggeyKC6aHYdeLdE5
 LC7PpypOGg6KJzMgwKyCu9z0omt6QmiBc0Osxi/vLud/Cteq4aYZ/q7eZlEKG/zQaKZVqWkr
 h7Q/5kD6A1du5jhhx949Ee2mg5ZQAdqTwmml7uPYtLXbD0GNr7HTtUqw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] diffutils: patch CVE-2026-53910
Date: Mon,  3 Aug 2026 00:17:06 +0200
Message-ID: <20260802221709.2501900-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 22:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242593

From: Peter Marko <peter.marko@siemens.com>

Pick patches mentioned in NVD CVE report.

Adapt NEWS file to apply one of the patches.
Add special code to prevent build error dues to rebuild of manpage.

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

