Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 76FC1781C8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 22:48:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jun 2017 15:48:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,303,1493708400"; d="scan'208";a="977113002"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.94.120])
	by orsmga003.jf.intel.com with ESMTP; 05 Jun 2017 15:48:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  5 Jun 2017 15:47:56 -0700
Message-Id: <1496702876-32494-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496702876-32494-1-git-send-email-sgw@linux.intel.com>
References: <1496702876-32494-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH] mkelfimage: Fix broken patch when building native
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
X-List-Received-Date: Mon, 05 Jun 2017 22:48:02 -0000

A change occured about a year ago that broke the native build, fix
that patch

[YOCTO #11590]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../mkelfimage/mkelfimage/fix-makefile-to-find-libz.patch | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage/fix-makefile-to-find-libz.patch b/meta/recipes-devtools/mkelfimage/mkelfimage/fix-makefile-to-find-libz.patch
index 756a65c..be54754 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage/fix-makefile-to-find-libz.patch
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage/fix-makefile-to-find-libz.patch
@@ -3,8 +3,11 @@ Let makefile find libz and zlib.h by CFLAGS and LDFLAGS.
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Upstream-Status: Pending
 ---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
 diff --git a/configure.ac b/configure.ac
-index d1acc36..6f865b0 100644
+index 0f2ac72..f9099a2 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -62,7 +62,7 @@ AC_CHECK_PROG([RPM],   rpm,   rpm,   [], [$PATH])
@@ -16,15 +19,15 @@ index d1acc36..6f865b0 100644
  
  dnl Find the default programs
  if test "with_default" != no ; then
-@@ -175,7 +175,7 @@ fi
- 
+@@ -176,7 +176,7 @@ fi
  dnl ---Output variables...
  
--HOST_CFLAGS="$HOST_CFLAGS -O2 -Wall \$(HOST_CPPFLAGS)"
-+HOST_CFLAGS="$HOST_CFLAGS -O2 -Wall \$(HOST_CPPFLAGS) $CFLAGS"
+ CFLAGS="${CFLAGS:--O2} -Wall \$(CPPFLAGS)"
+-HOST_CFLAGS="${HOST_CFLAGS:--O2} -Wall \$(HOST_CPPFLAGS)"
++HOST_CFLAGS="${HOST_CFLAGS:--O2} -Wall \$(HOST_CPPFLAGS) $CFLAGS"
  
  dnl TODO: figure out how to set these appropriately for compilers other than gcc
  I386_CFLAGS="$I386_CFLAGS -Os -ffreestanding -Wall -W -Wno-format \$(I386_CPPFLAGS)"
 -- 
-1.7.10.4
+2.7.4
 
-- 
2.7.4


