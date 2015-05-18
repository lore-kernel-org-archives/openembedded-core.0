Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 96B407404A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 12:40:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 18 May 2015 05:40:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="731113936"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.29.132])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2015 05:40:49 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 15:40:41 +0300
Message-Id: <1431952843-25139-4-git-send-email-tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1431952843-25139-1-git-send-email-tanu.kaskinen@linux.intel.com>
References: <1431952843-25139-1-git-send-email-tanu.kaskinen@linux.intel.com>
Subject: [PATCH 3/5] pulseaudio: move client.conf to a separate package
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
X-List-Received-Date: Mon, 18 May 2015 12:40:50 -0000

Putting client.conf to a separate package allows other recipes to
provide a replacement package when a custom version of client.conf is
needed (Sato will need that to make autospawning work for root).

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 44aabea..d99dbd2 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -72,7 +72,8 @@ USERADD_PARAM_pulseaudio-server = "--system --home /var/run/pulse \
 # adding the console-kit module to an image, we also get the necessary
 # consolekit package produced.
 PACKAGES =+ "libpulsecore libpulsecommon libpulse libpulse-simple libpulse-mainloop-glib \
-             pulseaudio-server pulseaudio-misc ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'pulseaudio-module-console-kit', '', d)}"
+             pulseaudio-client-conf pulseaudio-server pulseaudio-misc \
+             ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'pulseaudio-module-console-kit', '', d)}"
 
 #upgrade path:
 RREPLACES_pulseaudio-server = "libpulse-bin libpulse-conf"
@@ -81,11 +82,7 @@ PACKAGES_DYNAMIC += "^pulseaudio-lib-.* ^pulseaudio-module-.*"
 
 FILES_libpulsecore = "${libdir}/libpulsecore*.so"
 FILES_libpulsecommon = "${libdir}/pulseaudio/libpulsecommon*.so"
-
-# client.conf configures the behaviour of libpulse, so it belongs in the same
-# package.
-FILES_libpulse = "${libdir}/libpulse.so.* ${sysconfdir}/pulse/client.conf"
-
+FILES_libpulse = "${libdir}/libpulse.so.*"
 FILES_libpulse-simple = "${libdir}/libpulse-simple.so.*"
 FILES_libpulse-mainloop-glib = "${libdir}/libpulse-mainloop-glib.so.*"
 
@@ -94,6 +91,7 @@ FILES_${PN}-dbg += "${libexecdir}/pulse/.debug \
 FILES_${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala ${libdir}/cmake"   
 FILES_${PN}-conf = "${sysconfdir}"
 FILES_${PN}-bin += "${sysconfdir}/default/volatiles/volatiles.04_pulse"
+FILES_${PN}-client-conf = "${sysconfdir}/pulse/client.conf"
 FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules"
 
 #SYSTEMD_PACKAGES = "${PN}-server"
@@ -104,7 +102,7 @@ FILES_${PN}-misc = "${bindir}/* ${libdir}/pulseaudio/libpulsedsp.so"
 # Allow the pulseaudio package to be created empty as a placeholder (-dbg and -dev depend on it)
 ALLOW_EMPTY_${PN} = "1"
 
-CONFFILES_libpulse = "${sysconfdir}/pulse/client.conf"
+CONFFILES_${PN}-client-conf = "${sysconfdir}/pulse/client.conf"
 
 CONFFILES_pulseaudio-server = "\ 
   ${sysconfdir}/pulse/default.pa \
@@ -126,6 +124,9 @@ python populate_packages_prepend() {
     do_split_packages(d, plugindir, '^lib(.*)\.so$', 'pulseaudio-lib-%s', 'PulseAudio library for %s', extra_depends='', prepend=True)
 }
 
+# client.conf controls libpulse behaviour, hence the dependency.
+REDPENDS_libpulse += "pulseaudio-client-conf"
+
 RDEPENDS_pulseaudio-server = " \
     pulseaudio-module-filter-apply \
     pulseaudio-module-filter-heuristics \
-- 
1.9.3


