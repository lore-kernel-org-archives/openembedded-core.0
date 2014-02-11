Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC706E93C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 14:58:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 11 Feb 2014 06:58:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,826,1384329600"; d="scan'208";a="473420840"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2014 06:58:05 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2014 16:58:02 +0200
Message-Id: <185f9a3161f4dfe3cf1643b1e11d4780c304c424.1392130382.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392130382.git.laurentiu.palcu@intel.com>
References: <cover.1392130382.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1392130382.git.laurentiu.palcu@intel.com>
References: <cover.1392130382.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] gmp: add configure.ac patch to append user provided compilation flags
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
X-List-Received-Date: Tue, 11 Feb 2014 14:58:06 -0000

gmp configure script is pretty good at auto detecting the ABI and the
tune flags that need to be passes to the compiler. However, the user
provided flags (CFLAGS, CXXFLAGS, CPPFLAGS) take precedence and the ABI
detection may fail, leading to configure errors like the one below:

| configure: error: Oops, mp_limb_t is 32 bits, but the assembler code
| in this configuration expects 64 bits.
| You appear to have set $CFLAGS, perhaps you also need to tell GMP the
| intended ABI, see "ABI and ISA" in the manual.

One solution would be to change the recipe and add the ABI manually, or
let gmp do the job.

So, this patch will:
 * allow the configure process to auto-detect the ABI and tune flags
   properly;
 * append our flags to the detected ones;

[YOCTO #5783]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../gmp/gmp-5.1.1/append_user_provided_flags.patch |   52 ++++++++++++++++++++
 meta/recipes-support/gmp/gmp_5.1.1.bb              |    1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp-5.1.1/append_user_provided_flags.patch

diff --git a/meta/recipes-support/gmp/gmp-5.1.1/append_user_provided_flags.patch b/meta/recipes-support/gmp/gmp-5.1.1/append_user_provided_flags.patch
new file mode 100644
index 0000000..ae1386c
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp-5.1.1/append_user_provided_flags.patch
@@ -0,0 +1,52 @@
+Upstream-Status: Inappropriate
+
+Append the user provided flags to the auto-detected ones.
+
+Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
+
+Index: gmp-5.1.1/configure.ac
+===================================================================
+--- gmp-5.1.1.orig/configure.ac	2014-02-11 15:05:44.925202403 +0200
++++ gmp-5.1.1/configure.ac	2014-02-11 15:19:03.918511398 +0200
+@@ -1745,8 +1745,12 @@
+ EOF
+ 
+ 
+-test_CFLAGS=${CFLAGS+set}
+-test_CPPFLAGS=${CPPFLAGS+set}
++test_CFLAGS=
++test_CPPFLAGS=
++
++user_CFLAGS=$CFLAGS
++user_CPPFLAGS=$CPPFLAGS
++user_CXXFLAGS=$CXXFLAGS
+ 
+ for abi in $abilist; do
+   abi_last="$abi"
+@@ -2175,7 +2179,7 @@
+ want_cxx=no
+ AC_PROG_CXX
+ if test $enable_cxx != no; then
+-  test_CXXFLAGS=${CXXFLAGS+set}
++  test_CXXFLAGS=
+ 
+   echo "CXXFLAGS chosen by autoconf: $CXXFLAGS" >&AS_MESSAGE_LOG_FD()
+   cxxflags_ac_prog_cxx=$CXXFLAGS
+@@ -2202,7 +2206,7 @@
+   # Automake includes $CPPFLAGS in a C++ compile, so we do the same here.
+   #
+   for cxxflags_choice in $cxxflags_list; do
+-    eval CXXFLAGS=\"\$cxxflags_$cxxflags_choice\"
++    eval CXXFLAGS=\"\$cxxflags_$cxxflags_choice $user_CXXFLAGS\"
+     GMP_PROG_CXX_WORKS($CXX $CPPFLAGS $CXXFLAGS,
+       [want_cxx=yes
+       break])
+@@ -2292,6 +2296,8 @@
+ #  done
+ fi
+ 
++CFLAGS="$CFLAGS $user_CFLAGS"
++CPPFLAGS="$CPPFLAGS $user_CPPFLAGS"
+ 
+ cat >&AS_MESSAGE_LOG_FD() <<EOF
+ Decided:
diff --git a/meta/recipes-support/gmp/gmp_5.1.1.bb b/meta/recipes-support/gmp/gmp_5.1.1.bb
index d6dcb97..6020610 100644
--- a/meta/recipes-support/gmp/gmp_5.1.1.bb
+++ b/meta/recipes-support/gmp/gmp_5.1.1.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
 
 SRC_URI_append = " file://use-includedir.patch \
+                   file://append_user_provided_flags.patch \
                    "
 
 SRC_URI[md5sum] = "2fa018a7cd193c78494525f236d02dd6"
-- 
1.7.9.5


