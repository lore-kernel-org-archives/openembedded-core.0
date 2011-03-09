Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Px8Bp-0003E5-8a
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Mar 2011 02:27:49 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Mar 2011 17:26:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,286,1297065600"; d="scan'208";a="399726637"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 08 Mar 2011 17:26:13 -0800
Message-Id: <33b26ba051fa171e480bce3a1e4497a619241176.1299633840.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1299633840.git.nitin.a.kamble@intel.com>
References: <cover.1299633840.git.nitin.a.kamble@intel.com>
Old-Date: Sat, 5 Mar 2011 16:37:14 -0800
Date: Tue, 08 Mar 2011 17:26:13 -0800
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
X-List-Received-Date: Wed, 09 Mar 2011 01:27:49 -0000

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |    3 +++
 meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb     |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
index 6cc11e2..2d214af 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
@@ -1,5 +1,8 @@
 require gcc-configure-common.inc
 
+CXXFLAGS = "${@oe_filter_out('-fvisibility-inlines-hidden',
+'${CXXFLAGS}', d)}" 
+
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



