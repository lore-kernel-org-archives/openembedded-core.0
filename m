Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4870865CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 08:17:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2015 01:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,428,1422950400"; d="scan'208";a="469371466"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.7.188])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Mar 2015 01:17:35 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2015 10:17:33 +0200
Message-Id: <1426753053-29649-1-git-send-email-tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] pulseaudio: remove obsolete resampler patching
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
X-List-Received-Date: Thu, 19 Mar 2015 08:17:38 -0000

This sed script hasn't worked since PulseAudio 0.9.8 (released in
2007), because the match condition refers to "sinc-fastest", while the
default resampler is nowadays speex-float-1.

The idea behind the sed script might be good, but it seems obvious
that nobody is actually depending on the script, so let's just delete
it.

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index c307c27..d6ddc3b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -59,10 +59,6 @@ OE_LT_RPATH_ALLOW[export]="1"
 do_install_append() {
 	install -d ${D}${sysconfdir}/default/volatiles
 	install -m 0644 ${WORKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/default/volatiles/volatiles.04_pulse
-	
-	if [ "x${TARGET_PFPU}" = "xsoft" ] ; then 
-	     sed -i -e s:\;\ resample-method\ =\ sinc-fastest:resample-method\ =\ trivial: ${D}${sysconfdir}/pulse/daemon.conf
-	fi
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
-- 
1.9.3


