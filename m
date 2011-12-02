Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RWZhC-0002KN-Og
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 21:26:58 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2011 12:20:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,285,1320652800"; d="scan'208";a="43396289"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Dec 2011 12:20:12 -0800
From: nitin.a.kamble@intel.com
To: hjl.tools@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 12:20:05 -0800
Message-Id: <edc65d76d953ed54df8db4d6d21ca87dfaa663c9.1322856805.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
References: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1322856805.git.nitin.a.kamble@intel.com>
References: <cover.1322856805.git.nitin.a.kamble@intel.com>
Subject: [PATCH 07/11] libxt: fix compilatoin with x32 toolchain
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

This fixes compilation with x32 toolchain.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
---
 .../xorg-lib/libxt/libxt_fix_for_x32.patch         |   19 +++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxt_1.1.1.bb      |    4 +++-
 2 files changed, 22 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch b/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch
new file mode 100644
index 0000000..57ddbeb
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch
@@ -0,0 +1,19 @@
+UpstreamStatus: Pending
+
+This fixes compilation with x32 toolchain.
+
+Received this patch from H.J. Lu <hjl.tools@gmail.com>
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/1
+
+
+--- libXt-1.1.1/include/X11/Xtos.h.x32	2011-02-08 07:56:40.000000000 -0800
++++ libXt-1.1.1/include/X11/Xtos.h	2011-11-30 17:19:27.473349770 -0800
+@@ -62,7 +62,7 @@ SOFTWARE.
+     defined(__sparc64__) || \
+     defined(__s390x__) || \
+     (defined(__hppa__) && defined(__LP64__)) || \
+-    defined(__amd64__) || defined(amd64) || \
++    ((defined(__amd64__) || defined(amd64)) && defined(__LP64__)) || \
+     defined(__powerpc64__) || \
+     (defined(sgi) && (_MIPS_SZLONG == 64))
+ #define LONG64
diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.1.1.bb b/meta/recipes-graphics/xorg-lib/libxt_1.1.1.bb
index 052431a..5475fc7 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.1.1.bb
@@ -19,11 +19,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3239170e81427c5948287df07691f03f"
 DEPENDS += "util-linux libxcb libsm virtual/libx11 kbproto libxdmcp"
 PROVIDES = "xt"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 XORG_PN = "libXt"
 
+SRC_URI +=  "file://libxt_fix_for_x32.patch"
+
 BBCLASSEXTEND = "native"
 
 EXTRA_OECONF += "--disable-install-makestrs --disable-xkb"
-- 
1.7.6.4



