Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6710ECD12A2
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:47 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.130213.1712646642562843960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JLXMJT7a;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646643; x=1744182643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Eiw9yMXcfsRdAn4gjJnIVqRT1wof76y9s9TPSc/pSEA=;
  b=JLXMJT7aPVIxw4H3q2KmEq4AlhObk5Rk6zVyJzLb66yNROuqyW1JikZT
   cv7tDBHg2Oa/ZK2JlDnX6ruUmAsqDRVGpcog4THvR+VdswST0wAdvJVIM
   eopw3na4/yYS5x1J8puQfPbyG2QQX2EBKzRsW/8uChVNlZ5t+ovyxnuUX
   zNLQ97s9fTvsF2XRvwsnzeaVXTeLgNh5eBdC6o/a3AS+OgCSGwDVhkTHi
   xwKx+pwN6ONL/nLqO6sKoIS3s05SEK/sqjI/jmGq1qmjGLaIXQDoCZIiz
   VHwB+ceXdFeUZyMxkXASGIfdYGZzq3Ml9fzZqBtB+VPabUwPALr7LVO0K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="156937688"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="156937688"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:39 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CB805E48CD
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C0DF4E706
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9314B1EA82C
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 404D21A0002;
	Tue,  9 Apr 2024 15:10:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/33] coreutils: upgrade 9.4 -> 9.5
Date: Tue,  9 Apr 2024 15:09:51 +0800
Message-Id: <1712646620-16608-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.005
X-TMASE-Result: 10--19.580200-10.000000
X-TMASE-MatchedRID: NSUiViEAzXSjz0nOeth/yTo39wOA02LhMVx/3ZYby7+15eNIExieaY3E
	akIoHWNdjm1D9dz3MENR4Xyks9lwTYgrKnsJ1GRgv5rsfD7H2pk/xRB6OGnb2rKw8Hx0EGitgg8
	W5tsFXIChOywUZIftbeaffHI8kAmizCsOCBxDp3UdZEkR8Y/meZKLNrbpy/A0uBsk5njfgGyEUC
	dPNyyuZS3Ubol29OQnTf4ewF9SxLaZqKCiWKpuTE2xVQmDwU6m+KgiyLtJrSC+NoS24uNuA96ur
	nXKpk/cMyGUfnyOo9QNdZsOPCvd7H1VIn2QdLBcFWovz5bBLube22ctUL9zM6dR1cdKZ+22njwS
	LSLkHpccjPiHTsRKFKw6MUIk3yF4Qx3o5Qz67eG4scQ0aX7cDwRryDXHx6oXTPm/MsQarwOTEzT
	HPaCT9f8pW19mJIOmNYNPh4EndAIzPB7mzXyiQzsKXyzHgcEbJScvOTX4jHOvb2QRUkMkA5SDlQ
	PoCUXSsX24ahsS5PtftuJwrFEhTW+wxxJRnl45gMf23PO6/W/6C0ePs7A07QKmARN5PTKc
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198026

From: Wang Mingyu <wangmy@fujitsu.com>

0001-posixtm-pacify-clang-18.patch
CVE-2024-0684.patch
removed since they're included in 9.5

0001-local.mk-fix-cross-compiling-problem.patch
remove-usr-local-lib-from-m4.patch
refreshed for 9.5

License-Update: Copyright updatedto 2024.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...local.mk-fix-cross-compiling-problem.patch | 12 +++---
 .../0001-posixtm-pacify-clang-18.patch        | 38 ------------------
 .../coreutils/coreutils/CVE-2024-0684.patch   | 39 -------------------
 .../remove-usr-local-lib-from-m4.patch        |  7 ++--
 .../{coreutils_9.4.bb => coreutils_9.5.bb}    |  6 +--
 5 files changed, 11 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/0001-posixtm-pacify-clang-18.patch
 delete mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2024-0684.patch
 rename meta/recipes-core/coreutils/{coreutils_9.4.bb => coreutils_9.5.bb} (97%)

diff --git a/meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch b/meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch
index 66f9a716c9..97a6357ab9 100644
--- a/meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch
+++ b/meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch
@@ -1,4 +1,7 @@
-Subject: local.mk: fix cross compiling problem
+From 7cb2d20cfa2a27191255031d231cd41917dcffe8 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 26 Dec 2016 16:10:35 +0800
+Subject: [PATCH] local.mk: fix cross compiling problem
 
 We meet the following error when cross compiling.
 | Makefile:3418: *** Recursive variable 'INSTALL' references itself (eventually).  Stop.
@@ -12,15 +15,12 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/local.mk b/src/local.mk
-index 36dfa4e..c5898cc 100644
+index 96ee941..cdd47d6 100644
 --- a/src/local.mk
 +++ b/src/local.mk
-@@ -649,4 +649,4 @@ cu_install_program = @INSTALL_PROGRAM@
+@@ -704,4 +704,4 @@ cu_install_program = @INSTALL@
  else
  cu_install_program = src/ginstall
  endif
 -INSTALL = $(cu_install_program) -c
 +INSTALL_PROGRAM = $(cu_install_program)
--- 
-2.1.0
-
diff --git a/meta/recipes-core/coreutils/coreutils/0001-posixtm-pacify-clang-18.patch b/meta/recipes-core/coreutils/coreutils/0001-posixtm-pacify-clang-18.patch
deleted file mode 100644
index e6c84be3c4..0000000000
--- a/meta/recipes-core/coreutils/coreutils/0001-posixtm-pacify-clang-18.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 67c298c36f69b6906840b7584be06b7b5f33f829 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Tue, 16 Jan 2024 17:21:08 -0800
-Subject: [PATCH] posixtm: pacify clang 18
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Khem Raj in:
-https://lists.gnu.org/r/bug-gnulib/2024-01/msg00045.html
-* lib/posixtm.c (posixtime): Pacify clang 18 by converting bool to int.
-Arguably this is a bug in draft C2x, since the non-pointer args to
-ckd_add should promote just like any other expressions do;
-but that’s not clang’s fault.
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-gnulib/2024-01/msg00046.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ChangeLog     | 10 ++++++++++
- lib/posixtm.c |  2 +-
- 2 files changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/lib/posixtm.c b/lib/posixtm.c
-index ef9f55f873..a072c7cad0 100644
---- a/lib/posixtm.c
-+++ b/lib/posixtm.c
-@@ -191,7 +191,7 @@ posixtime (time_t *p, const char *s, unsigned int syntax_bits)
-              | (tm0.tm_min ^ tm1.tm_min)
-              | (tm0.tm_sec ^ tm1.tm_sec)))
-         {
--          if (ckd_add (&t, t, leapsec))
-+          if (ckd_add (&t, t, +leapsec))
-             return false;
-           *p = t;
-           return true;
--- 
-2.43.0
-
diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2024-0684.patch b/meta/recipes-core/coreutils/coreutils/CVE-2024-0684.patch
deleted file mode 100644
index 0c68e2dce0..0000000000
--- a/meta/recipes-core/coreutils/coreutils/CVE-2024-0684.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c4c5ed8f4e9cd55a12966d4f520e3a13101637d9 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Tue, 16 Jan 2024 13:48:32 -0800
-Subject: [PATCH 1/1] split: do not shrink hold buffer
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf8
-Content-Transfer-Encoding: 8bit
-
-* src/split.c (line_bytes_split): Do not shrink hold buffer.
-If it’s large for this batch it’s likely to be large for the next
-batch, and for ‘split’ it’s not worth the complexity/CPU hassle to
-shrink it.  Do not assume hold_size can be bufsize.
-
-CVE: CVE-2024-0684
-Upstream-Status: Backport [https://github.com/coreutils/coreutils/commit/c4c5ed8f4e9cd55a12966d4f520e3a13101637d9]
-Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
----
- src/split.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/split.c b/src/split.c
-index 64020c859..037960a59 100644
---- a/src/split.c
-+++ b/src/split.c
-@@ -809,10 +809,7 @@ line_bytes_split (intmax_t n_bytes, char *buf, idx_t bufsize)
-             {
-               cwrite (n_out == 0, hold, n_hold);
-               n_out += n_hold;
--              if (n_hold > bufsize)
--                hold = xirealloc (hold, bufsize);
-               n_hold = 0;
--              hold_size = bufsize;
-             }
- 
-           /* Output to eol if present.  */
--- 
-2.11.4.GIT
-
-
diff --git a/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
index 1a8a9b9983..718de0ab78 100644
--- a/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
+++ b/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
@@ -1,4 +1,4 @@
-From a26530083a29eeee910bfd606ecc621acecd547a Mon Sep 17 00:00:00 2001
+From f53ffb5b27ab7d4a4c62df00ebd6a1a6936d1709 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 Aug 2011 14:12:30 -0700
 Subject: [PATCH] coreutils: Fix build on uclibc
@@ -12,16 +12,15 @@ and make life easier for cross compilation process.
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Inappropriate [Upstream does care for AIX while we may not]
-
 ---
  m4/getloadavg.m4 | 12 ------------
  1 file changed, 12 deletions(-)
 
 diff --git a/m4/getloadavg.m4 b/m4/getloadavg.m4
-index 8e96965..63782a2 100644
+index 9d0236f..68f7c52 100644
 --- a/m4/getloadavg.m4
 +++ b/m4/getloadavg.m4
-@@ -41,18 +41,6 @@ AC_CHECK_FUNC([getloadavg], [],
+@@ -46,18 +46,6 @@ if test $ac_cv_func_getloadavg != yes; then
         [LIBS="-lutil $LIBS" gl_func_getloadavg_done=yes])
     fi
  
diff --git a/meta/recipes-core/coreutils/coreutils_9.4.bb b/meta/recipes-core/coreutils/coreutils_9.5.bb
similarity index 97%
rename from meta/recipes-core/coreutils/coreutils_9.4.bb
rename to meta/recipes-core/coreutils/coreutils_9.5.bb
index 62ecdea6ec..9a5f836ebe 100644
--- a/meta/recipes-core/coreutils/coreutils_9.4.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.5.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://src/ls.c;beginline=1;endline=15;md5=b720a8b317035d66c555fc6d89e3674c \
+                    file://src/ls.c;beginline=1;endline=15;md5=9ac94aaed7fd46fd8df7147a9e3410cb \
                     "
 DEPENDS = "gmp libcap"
 DEPENDS:class-native = ""
@@ -16,11 +16,9 @@ inherit autotools gettext texinfo
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
-           file://0001-posixtm-pacify-clang-18.patch \
-           file://CVE-2024-0684.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "ea613a4cf44612326e917201bbbcdfbd301de21ffc3b59b6e5c07e040b275e52"
+SRC_URI[sha256sum] = "cd328edeac92f6a665de9f323c93b712af1858bc2e0d88f3f7100469470a1b8a"
 
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 #
-- 
2.34.1


