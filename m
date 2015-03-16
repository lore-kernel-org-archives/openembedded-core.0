Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C0F707399B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 18:55:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2015 11:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,410,1422950400"; d="scan'208";a="666024011"
Received: from pduzinki-mobl.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.10.191])
	by orsmga001.jf.intel.com with ESMTP; 16 Mar 2015 11:55:29 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 20:55:24 +0200
Message-Id: <1426532125-1219-2-git-send-email-tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426532125-1219-1-git-send-email-tanu.kaskinen@linux.intel.com>
References: <1426532125-1219-1-git-send-email-tanu.kaskinen@linux.intel.com>
Subject: [PATCH 1/2] pulseaudio: move client.conf to libpulse
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
X-List-Received-Date: Mon, 16 Mar 2015 18:55:30 -0000

This fixes a scenario where the system has libpulse installed but not
pulseaudio-server. The "breakage" didn't have any big practical
effects, though, because the default client.conf contains only
comments anyway.

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 3569752..501dcfb 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -85,7 +85,11 @@ PACKAGES_DYNAMIC += "^pulseaudio-lib-.* ^pulseaudio-module-.*"
 
 FILES_libpulsecore = "${libdir}/libpulsecore*.so"
 FILES_libpulsecommon = "${libdir}/pulseaudio/libpulsecommon*.so"
-FILES_libpulse = "${libdir}/libpulse.so.*"
+
+# client.conf configures the behaviour of libpulse, so it belongs in the same
+# package.
+FILES_libpulse = "${libdir}/libpulse.so.* ${sysconfdir}/pulse/client.conf"
+
 FILES_libpulse-simple = "${libdir}/libpulse-simple.so.*"
 FILES_libpulse-mainloop-glib = "${libdir}/libpulse-mainloop-glib.so.*"
 
@@ -104,10 +108,11 @@ FILES_${PN}-misc = "${bindir}/* ${libdir}/pulseaudio/libpulsedsp.so"
 # Allow the pulseaudio package to be created empty as a placeholder (-dbg and -dev depend on it)
 ALLOW_EMPTY_${PN} = "1"
 
+CONFFILES_libpulse = "${sysconfdir}/pulse/client.conf"
+
 CONFFILES_pulseaudio-server = "\ 
   ${sysconfdir}/pulse/default.pa \
   ${sysconfdir}/pulse/daemon.conf \
-  ${sysconfdir}/pulse/client.conf \
   "
 
 pkg_postinst_${PN}-server() {
-- 
1.9.3


