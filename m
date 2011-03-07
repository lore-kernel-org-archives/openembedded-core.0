Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Pwdln-0007oi-39
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Mar 2011 17:58:56 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Mar 2011 08:56:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,277,1297065600"; d="scan'208";a="398829398"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 07 Mar 2011 08:55:45 -0800
Message-Id: <0cfc1314469e2fe9412ec0285a9bbe577a195258.1299516806.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1299516806.git.nitin.a.kamble@intel.com>
References: <cover.1299516806.git.nitin.a.kamble@intel.com>
Old-Date: Sat, 5 Mar 2011 16:37:14 -0800
Date: Mon, 07 Mar 2011  8:55:45 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Cc: Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 1/1] gcc-runtime: fix LSB library checks for libstdc++.so.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Mar 2011 16:58:56 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

[YOCTO #795]

When we run library check of LSB on qemux86 and qemuppc, we got some failures
about 'libstdc++.so.6'.

Test environment:
Platform: Qemu-x86, Qemu-ppc
lsb image: poky-image-lsb-qemux86-test.ext3(Feb 26th, auto-build server)
Library check of LSB: 4.1.0-1

The error log:
Did not find _ZNKSt5ctypeIcE8do_widenEPKcS2_Pc (GLIBCXX_3.4) in libstdc++.so.6
Unmangled symbol name: std::ctype<char>::do_widen(char const*, char const*,
char*) const
...

 found that some weak symbols ('W') change into local ('t') during link time
and be stripped. According to compiling log, the option
"-fvisibility-inlines-hidden" is used for gcc. And this option caused some weak
symbols change into local.

see http://bugzilla.pokylinux.org/show_bug.cgi?id=795 for more information on the bug.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: Jingdong Lu <jingdong.lu@windriver.com>
---
 meta/conf/bitbake.conf                             |    2 +-
 meta/conf/distro/include/poky-eglibc.inc           |    2 +-
 meta/conf/distro/include/poky-glibc.inc            |    2 +-
 meta/conf/distro/include/poky-uclibc.inc           |    2 +-
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |    1 +
 meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb     |    2 +-
 6 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index cf99a81..473306a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -463,7 +463,7 @@ export CFLAGS = "${TARGET_CFLAGS}"
 export TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
 
 export BUILD_CXXFLAGS = "${BUILD_CFLAGS} -fpermissive"
-export CXXFLAGS = "${TARGET_CXXFLAGS}"
+export CXXFLAGS = "${TARGET_CXXFLAGS} ${CXXFLAGS_EXTRA}"
 export TARGET_CXXFLAGS = "${TARGET_CFLAGS} -fpermissive"
 
 export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
diff --git a/meta/conf/distro/include/poky-eglibc.inc b/meta/conf/distro/include/poky-eglibc.inc
index 3d2c362..44a0146 100644
--- a/meta/conf/distro/include/poky-eglibc.inc
+++ b/meta/conf/distro/include/poky-eglibc.inc
@@ -19,7 +19,7 @@ PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-initial-nativesdk ?= "eglibc-initia
 
 TARGET_OS = "${GLIBCTARGETOS}"
 
-CXXFLAGS += "-fvisibility-inlines-hidden"
+CXXFLAGS_EXTRA += "-fvisibility-inlines-hidden"
 
 LIBC_DEPENDENCIES = "libsegfault \
 		     eglibc \
diff --git a/meta/conf/distro/include/poky-glibc.inc b/meta/conf/distro/include/poky-glibc.inc
index 4be7122..d3f28c0 100644
--- a/meta/conf/distro/include/poky-glibc.inc
+++ b/meta/conf/distro/include/poky-glibc.inc
@@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-initial-nativesdk ?= "glibc-initial
 
 TARGET_OS = "${GLIBCTARGETOS}"
 
-CXXFLAGS += "-fvisibility-inlines-hidden"
+CXXFLAGS_EXTRA += "-fvisibility-inlines-hidden"
 
 LIBC_DEPENDENCIES = "\
     libsegfault \
diff --git a/meta/conf/distro/include/poky-uclibc.inc b/meta/conf/distro/include/poky-uclibc.inc
index def9dfe..13c17f9 100644
--- a/meta/conf/distro/include/poky-uclibc.inc
+++ b/meta/conf/distro/include/poky-uclibc.inc
@@ -15,7 +15,7 @@ USE_NLS_glib-2.0 = "yes"
 
 TARGET_OS = "${UCLIBCTARGETOS}"
 
-CXXFLAGS += "-fvisibility-inlines-hidden"
+CXXFLAGS_EXTRA += "-fvisibility-inlines-hidden"
 
 IMAGE_LINGUAS = ""
 
diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
index 6cc11e2..d4dfbc2 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
@@ -1,5 +1,6 @@
 require gcc-configure-common.inc
 
+CXXFLAGS_EXTA = ""
 EXTRA_OECONF_PATHS = " \
     --with-local-prefix=${STAGING_DIR_TARGET}${prefix} \
     --with-gxx-include-dir=${includedir}/c++/ \
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
index 093f9bf..c1e680d 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
@@ -1,4 +1,4 @@
-PR = "r2"
+PR = "r3"
 
 require gcc-${PV}.inc
 require gcc-configure-runtime.inc
-- 
1.7.3.4



