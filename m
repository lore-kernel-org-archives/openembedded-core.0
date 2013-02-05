Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U2fBJ-0006Tt-Sl
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 10:51:14 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Feb 2013 01:35:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; d="scan'208";a="281086936"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2013 01:35:15 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 11:35:02 +0200
Message-Id: <e8464f02c891f3ae480a40c6f2173e9349fc7b41.1360055640.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360055640.git.laurentiu.palcu@intel.com>
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360055640.git.laurentiu.palcu@intel.com>
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
Subject: [PATCH 8/8] pulseaudio: do not postpone postinstall
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 09:51:17 -0000

Since populate-volatile.sh will run everytime the device boots, no
need to postpone the postinstall when the rootfs is created.

[YOCTO #3840]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc |    7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 2fed4f9..81573e3 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -99,12 +99,7 @@ CONFFILES_pulseaudio-server = "\
   "
 
 pkg_postinst_${PN}-server() {
-        # can't do this offline
-        if [ "x$D" != "x" ]; then
-                exit 1
-        fi
-
-        if [ -e ${sysconfdir}/init.d/populate-volatile.sh ] ; then
+        if [ -z "$D" ] && [ -e ${sysconfdir}/init.d/populate-volatile.sh ] ; then
             ${sysconfdir}/init.d/populate-volatile.sh update
         fi
 }
-- 
1.7.9.5



