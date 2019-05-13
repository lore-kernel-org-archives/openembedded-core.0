Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B4BEE7CB4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 02:30:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4D2Uci5003977
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2019 19:30:38 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Sun, 12 May 2019 19:30:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <bunk@stusta.de>
Date: Mon, 13 May 2019 10:30:36 +0800
Message-ID: <1557714636-7436-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] groff: imporve musl support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2019 02:30:39 -0000
Content-Type: text/plain

Drop local fix, backport upstream gnulib fix and translate to tarball groff.

Suggested-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../groff/files/0001-support-musl.patch            | 39 ++++++++++------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-extended/groff/files/0001-support-musl.patch b/meta/recipes-extended/groff/files/0001-support-musl.patch
index e5c817c..a837b11 100644
--- a/meta/recipes-extended/groff/files/0001-support-musl.patch
+++ b/meta/recipes-extended/groff/files/0001-support-musl.patch
@@ -1,6 +1,6 @@
-From f73df5196c35ef9c4531e4b6b26800c41954fd77 Mon Sep 17 00:00:00 2001
+From 695965c27be74acb5968f19d51af86065c4b71a9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sat, 11 May 2019 20:00:29 +0800
+Date: Mon, 13 May 2019 09:48:14 +0800
 Subject: [PATCH] support musl
 
 ...
@@ -16,31 +16,26 @@ Subject: [PATCH] support musl
 |   ^~~~~~~
 ...
 
-Upstream-Status: Pending
+Upstream-Status: Backport [http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commit;h=453ff940449bbbde9ec00f0bbf82a359c5598fc7]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- lib/math.in.h | 2 ++
+ gnulib_m4/signbit.m4 | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/lib/math.in.h b/lib/math.in.h
-index c30fc20..16e406a 100644
---- a/lib/math.in.h
-+++ b/lib/math.in.h
-@@ -2397,11 +2397,13 @@ _GL_EXTERN_C int gl_signbitl (long double arg);
-     gl_signbitf (x))
- # endif
- # ifdef __cplusplus
-+#if defined(__GLIBC__)
- #  if defined signbit || defined GNULIB_NAMESPACE
- _GL_MATH_CXX_REAL_FLOATING_DECL_1 (signbit)
- #   undef signbit
- _GL_MATH_CXX_REAL_FLOATING_DECL_2 (signbit)
- #  endif
-+# endif //if defined(__GLIBC__)
- # endif
- #elif defined GNULIB_POSIXCHECK
- # if defined signbit
+diff --git a/gnulib_m4/signbit.m4 b/gnulib_m4/signbit.m4
+index 9e7884d..8b9c70c 100644
+--- a/gnulib_m4/signbit.m4
++++ b/gnulib_m4/signbit.m4
+@@ -31,6 +31,8 @@ AC_DEFUN([gl_SIGNBIT],
+         [case "$host_os" in
+                           # Guess yes on glibc systems.
+            *-gnu* | gnu*) gl_cv_func_signbit="guessing yes" ;;
++                          # Guess yes on musl systems.
++           *-musl*)       gl_cv_func_signbit="guessing yes" ;;
+                           # Guess yes on native Windows.
+            mingw*)        gl_cv_func_signbit="guessing yes" ;;
+                           # If we don't know, assume the worst.
 -- 
 2.7.4
 
-- 
2.7.4


