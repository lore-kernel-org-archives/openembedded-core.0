Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVs8d-0007gD-U2
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 22:56:24 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Nov 2011 13:49:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81486493"
Received: from unknown (HELO localhost) ([10.255.12.165])
	by orsmga001.jf.intel.com with ESMTP; 30 Nov 2011 13:49:44 -0800
From: Darren Hart <darren@dvhart.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 13:49:45 -0800
Message-Id: <d66f152cffd363fe56c6f58e9559288020524d83.1322689519.git.darren@dvhart.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <e7ca852c4e673a6b32be203109a704202aeace3a.1322689519.git.darren@dvhart.com>
References: <e7ca852c4e673a6b32be203109a704202aeace3a.1322689519.git.darren@dvhart.com>
In-Reply-To: <cover.1322689519.git.darren@dvhart.com>
References: <cover.1322689519.git.darren@dvhart.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 3/4] grub: Use COMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 30 Nov 2011 21:56:24 -0000

From: Darren Hart <dvhart@linux.intel.com>

Drop the anonymous python block in favor of the much simpler
COMPATIBLE_MACHINE mechanism.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-bsp/grub/grub_1.99.bb |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/grub_1.99.bb
index b6aa827..66ad669 100644
--- a/meta/recipes-bsp/grub/grub_1.99.bb
+++ b/meta/recipes-bsp/grub/grub_1.99.bb
@@ -22,6 +22,8 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
 SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
 SRC_URI[sha256sum] = "b91f420f2c51f6155e088e34ff99bea09cc1fb89585cf7c0179644e57abd28ff"
 
+COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
+
 inherit autotools
 inherit gettext
 
@@ -31,13 +33,6 @@ do_configure() {
     oe_runconf
 }
 
-python __anonymous () {
-    import re
-    host = d.getVar('HOST_SYS', 1)
-    if not re.match('x86.64.*-linux', host) and not re.match('i.86.*-linux', host):
-        raise bb.parse.SkipPackage("incompatible with host %s" % host)
-}
-
 do_install_append () {
     install -m 0755 ${WORKDIR}/40_custom ${D}${sysconfdir}/grub.d/40_custom
 }
-- 
1.7.6.4



