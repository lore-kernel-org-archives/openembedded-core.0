Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 841607807D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 03:27:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w193RMbp027721
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Feb 2018 19:27:23 -0800 (PST)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 8 Feb 2018 19:27:15 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Feb 2018 11:25:34 +0800
Message-ID: <1518146734-31932-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH] ltp: fix confiugre with numa support
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
X-List-Received-Date: Fri, 09 Feb 2018 03:27:22 -0000
Content-Type: text/plain

Fix Add-knob-to-control-whether-numa-support-should-be-c.patch since it
doesn't work when set --with-numa=yes.
Disable the test program since it can not run while cross compiling.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-control-whether-numa-support-should-be-c.patch | 31 +++++++++++++++-------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch b/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
index 31460b9..f8790d7 100644
--- a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
+++ b/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
@@ -10,36 +10,47 @@ during build depending upong numa being staged or not
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 Upstream-Status: Pending
 ---
  m4/ltp-numa.m4 | 10 +++++++++-
  1 file changed, 9 insertions(+), 1 deletion(-)
 
 diff --git a/m4/ltp-numa.m4 b/m4/ltp-numa.m4
-index fc3383e..44cb559 100644
+index fc3383e..1ca4613 100644
 --- a/m4/ltp-numa.m4
 +++ b/m4/ltp-numa.m4
-@@ -24,7 +24,13 @@ dnl LTP_CHECK_SYSCALL_NUMA
+@@ -24,21 +24,18 @@ dnl LTP_CHECK_SYSCALL_NUMA
  dnl ----------------------------
  dnl
  AC_DEFUN([LTP_CHECK_SYSCALL_NUMA], [
 -	AC_CHECK_LIB(numa, numa_available, [have_libnuma=yes])
+-	AC_CHECK_HEADERS([numa.h numaif.h], [], [have_numa_headers=no])
+-
+-	if test "x$have_numa_headers" != "xno"; then
+-		AC_RUN_IFELSE([AC_LANG_PROGRAM([
+-#include <numa.h>
+-		], [
+-#if LIBNUMA_API_VERSION < 2
+-exit(1);
+-#endif
+-		])], [have_numa_headers_v2=yes])
+-	fi
 +	AC_MSG_CHECKING([for numa])
 +	AC_ARG_WITH(
 +		[numa],
-+		AC_HELP_STRING([--without-numa],
-+		[without numa support]),
-+		[],
++		AC_HELP_STRING([--with-numa],
++		[with numa support]),
 +	[AC_CHECK_LIB(numa, numa_available, [have_libnuma=yes])
- 	AC_CHECK_HEADERS([numa.h numaif.h], [], [have_numa_headers=no])
++	AC_CHECK_HEADERS([numa.h numaif.h], [have_numa_headers=yes have_numa_headers_v2=yes], [have_numa_headers=no])
  
- 	if test "x$have_numa_headers" != "xno"; then
-@@ -42,3 +48,5 @@ exit(1);
+ 	if test "x$have_libnuma" = "xyes" -a "x$have_numa_headers" != "xno" -a "x$have_numa_headers_v2" = "xyes"; then
+ 		AC_SUBST(NUMA_LIBS, "-lnuma")
  		AC_DEFINE(HAVE_NUMA_V2, 1, [Define to 1 if you have libnuma and it's headers version >= 2 installed.])
  	fi
- ])
++], [])
 +AC_MSG_RESULT([$with_numa])
-+])
+ ])
 -- 
 2.7.0
 
-- 
2.7.4


