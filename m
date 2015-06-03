Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 63E4C734DA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 11:17:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 03 Jun 2015 04:17:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,546,1427785200"; d="scan'208";a="719962726"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.2.204])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jun 2015 04:17:10 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 14:17:09 +0300
Message-Id: <1433330229-1020-1-git-send-email-tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] alsa-plugins: enable alsa-plugins-pulseaudio-conf conditionally
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
X-List-Received-Date: Wed, 03 Jun 2015 11:17:20 -0000

If pulseaudio isn't enabled, the alsa-plugins-pulseaudio-conf package
is unnecessary. This change fixes these warnings, when pulseaudio
isn't enabled:

WARNING: QA Issue: alsa-plugins-pulseaudio-conf rdepends on
libasound-module-conf-pulse, but it isn't a build dependency?
[build-deps]
WARNING: QA Issue: alsa-plugins-pulseaudio-conf rdepends on
libasound-module-ctl-pulse, but it isn't a build dependency?
[build-deps]
WARNING: QA Issue: alsa-plugins-pulseaudio-conf rdepends on
libasound-module-pcm-pulse, but it isn't a build dependency?
[build-deps]

Reported-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
index 80f0446..5b18d92 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
@@ -38,7 +38,7 @@ PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio
 PACKAGECONFIG[samplerate] = "--enable-samplerate,--disable-samplerate,libsamplerate0"
 PACKAGECONFIG[speex] = "--with-speex=lib,--with-speex=no,speex"
 
-PACKAGES += "alsa-plugins-pulseaudio-conf"
+PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
 
 PACKAGES_DYNAMIC = "^libasound-module-.*"
 
-- 
1.9.3


