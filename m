Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 756527D40E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 15:04:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jul 2019 08:04:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="345843463"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 26 Jul 2019 08:04:11 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2019 23:03:15 +0800
Message-Id: <1564153395-3984-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] pulseaudio: don't include consolekit when systemd is enabled
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
X-List-Received-Date: Fri, 26 Jul 2019 15:04:11 -0000

When using systemd, make sure that pulseaudio-server RDEPENDS on
module-systemd-login instead of module-console-kit both of which provide
the same functionality but for different init systems [1][2].

Even though both modules can co-exist, this helps avoid including
consolekit (which has been deprecated) in the images using systemd.

[1] https://www.freedesktop.org/wiki/Software/PulseAudio/Documentation/User/Modules/#index51h3
[2] https://github.com/pulseaudio/pulseaudio/commit/860d1cf3a76701ade38784822abb24285176227c

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index e245be7..ec51d8b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -259,9 +259,12 @@ FILES_${PN}-module-gsettings += "${libexecdir}/pulse/gsettings-helper ${datadir}
 # modules must be installed when X11 is enabled.
 RDEPENDS_pulseaudio-server += "\
         ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '\
-                pulseaudio-module-console-kit \
                 pulseaudio-module-device-manager \
                 pulseaudio-module-x11-cork-request \
                 pulseaudio-module-x11-publish \
                 pulseaudio-module-x11-xsmp \
         ', '', d)}"
+
+RDEPENDS_pulseaudio-server += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', \
+                                  bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-console-kit', d), \
+                                  '', d)}"
-- 
2.7.4


