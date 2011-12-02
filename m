Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RWZhC-0002Kh-W0
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 21:26:59 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2011 12:20:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,285,1320652800"; d="scan'208";a="43396292"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Dec 2011 12:20:12 -0800
From: nitin.a.kamble@intel.com
To: hjl.tools@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 12:20:07 -0800
Message-Id: <f55ff8cd65d3996c448705253aea7954dc946f7b.1322856805.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
References: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1322856805.git.nitin.a.kamble@intel.com>
References: <cover.1322856805.git.nitin.a.kamble@intel.com>
Subject: [PATCH 09/11] xproto: fix compilation with x32 toolchain
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
X-List-Received-Date: Fri, 02 Dec 2011 20:26:59 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Don't always define LONG64 for AMD64

X32 defines __amd64__/amd64 with 32bit long.  We should simply check
__LP64__ before defining LONG64 without checking __amd64__/amd64.

This fixes compilation with x32 toolchain.

Signed-Off-By: H.J. Lu <hjl.tools@gmail.com>
Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/1
---
 .../xorg-proto/xproto/xproto_fix_for_x32.patch     |   22 ++++++++++++++++++++
 meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb  |    4 ++-
 2 files changed, 25 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch

diff --git a/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch b/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch
new file mode 100644
index 0000000..c9fbb6f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch
@@ -0,0 +1,22 @@
+UpstreamStatus: Pending
+
+Don't always define LONG64 for AMD64
+    
+X32 defines __amd64__/amd64 with 32bit long.  We should simply check
+__LP64__ before defining LONG64 without checking __amd64__/amd64.
+
+This fixes compilation with x32 toolchain.
+
+Received this patch from H.J. Lu <hjl.tools@gmail.com>
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/1
+
+--- xproto-7.0.22/Xmd.h.x32	2009-07-11 04:19:50.000000000 -0700
++++ xproto-7.0.22/Xmd.h	2011-11-30 17:14:19.290395893 -0800
+@@ -62,7 +62,6 @@ SOFTWARE.
+      defined(__ia64__) || defined(ia64) || \
+      defined(__sparc64__) || \
+      defined(__s390x__) || \
+-     defined(__amd64__) || defined(amd64) || \
+      defined(__powerpc64__)
+ #  define LONG64				/* 32/64-bit architecture */
+ # endif
diff --git a/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb b/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb
index 54f8482..8f76314 100644
--- a/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb
+++ b/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb
@@ -8,9 +8,11 @@ System."
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b9e051107d5628966739a0b2e9b32676"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
+SRC_URI += "file://xproto_fix_for_x32.patch"
+
 EXTRA_OECONF_append = " --enable-specs=no"
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.6.4



