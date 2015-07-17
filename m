Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C72A765CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 09:22:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jul 2015 02:22:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,495,1432623600"; d="scan'208";a="525848734"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.fi.intel.com) ([10.237.68.144])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Jul 2015 02:22:20 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2015 12:22:18 +0300
Message-Id: <1437124938-4484-1-git-send-email-tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] pulseaudio: rdepend on modules referenced by start-pulseaudio-x11
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
X-List-Received-Date: Fri, 17 Jul 2015 09:22:23 -0000

pulseaudio-server contains /usr/bin/start-pulseaudio-x11 when X11 is
enabled, and that script tries to load module-device-manager,
module-x11-cork-request, module-x11-publish, and module-x11-xsmp.
Therefore, pulseaudio-server should rdepend on those modules when X11
is enabled, otherwise the script won't work as intended.

[YOCTO #8007]

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index b309d26..1a9d33a 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -160,5 +160,15 @@ RDEPENDS_pulseaudio-misc += "pulseaudio-module-cli-protocol-unix"
 FILES_pulseaudio-module-gconf += "${libexecdir}/pulse/gconf-helper"
 FILES_pulseaudio-module-alsa-card += "${datadir}/pulseaudio/alsa-mixer"
 
+# The console-kit module is good to have on X11 systems (it keeps PulseAudio
+# running for the duration of the user login session). The device-manager and
+# x11-* modules are referenced from the start-pulseaudio-x11 script, so those
+# modules must be installed when X11 is enabled.
 RDEPENDS_pulseaudio-server += "\
-        ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'pulseaudio-module-console-kit', '', d)}"
+        ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '\
+                pulseaudio-module-console-kit \
+                pulseaudio-module-device-manager \
+                pulseaudio-module-x11-cork-request \
+                pulseaudio-module-x11-publish \
+                pulseaudio-module-x11-xsmp \
+        ', '', d)}"
-- 
1.9.3


