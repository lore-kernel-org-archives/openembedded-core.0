Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D3C277D25F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 04:08:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2019 20:08:54 -0800
X-IronPort-AV: E=Sophos;i="5.68,302,1569308400"; d="scan'208";a="208004336"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.16.51])
	by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2019 20:08:53 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Nov 2019 12:08:47 +0800
Message-Id: <20191114040847.24279-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] boost: fix build for x32
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
X-List-Received-Date: Thu, 14 Nov 2019 04:08:54 -0000
Content-Transfer-Encoding: 8bit

Commit: d336110b94 boost: update to 1.67.0

dropped the patch that ensured boost doesn't over-ride the architecture flags
set by us resulting in errors:

| build/tmp/work/x86_64_x32-poky-linux-gnux32/boost/1.69.0-r0/recipe-sysroot/usr/include/bits/long-double.h:44:10: fatal error: bits/long-double-64.h: No such file or directory
| #include <bits/long-double-64.h>
|          ^~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.

Remove the relevant part from gcc.jam again to ensure we are passing
them correctly again.

Fixes [YOCTO #13598]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...01-dont-setup-compiler-flags-m32-m64.patch | 42 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.71.0.bb    |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch

diff --git a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
new file mode 100644
index 0000000000..78b19225d4
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
@@ -0,0 +1,42 @@
+From 59402e3a61d14eb7ce8c2019ea1a87ad4bd28605 Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Thu, 14 Nov 2019 10:13:53 +0800
+Subject: [PATCH] dont setup compiler flags -m32/-m64
+
+We don't want these to be setup by boost as we pass our own flags.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ tools/build/src/tools/gcc.jam | 14 --------------
+ 1 file changed, 14 deletions(-)
+
+diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
+index c7e3cf3..24486e0 100644
+--- a/tools/build/src/tools/gcc.jam
++++ b/tools/build/src/tools/gcc.jam
+@@ -430,20 +430,6 @@ local rule compile-link-flags ( * )
+ }
+ 
+ {
+-    # Handle address-model
+-    compile-link-flags <target-os>aix/<address-model>32 : -maix32 ;
+-    compile-link-flags <target-os>aix/<address-model>64 : -maix64 ;
+-
+-    compile-link-flags <target-os>hpux/<address-model>32 : -milp32 ;
+-    compile-link-flags <target-os>hpux/<address-model>64 : -mlp64 ;
+-
+-    local generic-os = [ set.difference $(all-os) : aix hpux ] ;
+-    local arch = power sparc x86 ;
+-    compile-link-flags <target-os>$(generic-os)/<architecture>$(arch)/<address-model>32 : -m32 ;
+-    compile-link-flags <target-os>$(generic-os)/<architecture>$(arch)/<address-model>64 : -m64 ;
+-}
+-
+-{
+     # Handle threading
+     local rule threading-flags ( * )
+     {
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/boost/boost_1.71.0.bb b/meta/recipes-support/boost/boost_1.71.0.bb
index 324b46f168..5e9e0d87d7 100644
--- a/meta/recipes-support/boost/boost_1.71.0.bb
+++ b/meta/recipes-support/boost/boost_1.71.0.bb
@@ -6,4 +6,5 @@ SRC_URI += "file://arm-intrinsics.patch \
            file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
+           file://0001-dont-setup-compiler-flags-m32-m64.patch \
            "
-- 
2.21.0


