Return-Path: <clopez@igalia.com>
X-Greylist: delayed 626 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 11 Sep 2015 13:00:38 UTC
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 2986360053
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 13:00:38 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2ALBgCxzPJV/5tjdVtdGQEBgwgBU2m9QIFpC4dSORMBAQEBAQEBgQqFcoECiDIBp2qkMYZziiiEFQWVVoUKh3COMoxHIwM9gUoMgixvih8BAQE
X-IPAS-Result: A2ALBgCxzPJV/5tjdVtdGQEBgwgBU2m9QIFpC4dSORMBAQEBAQEBgQqFcoECiDIBp2qkMYZziiiEFQWVVoUKh3COMoxHIwM9gUoMgixvih8BAQE
X-IronPort-AV: E=Sophos;i="5.17,511,1437429600"; d="scan'208";a="20149267"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 11 Sep 2015 14:50:10 +0200
Received: from 239.20.165.83.dynamic.mundo-r.com ([83.165.20.239]
	helo=trinity.local.igalia.com) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim) id 1ZaNmM-0005zC-Ae
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 14:50:10 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Sep 2015 14:49:43 +0200
Message-Id: <1441975783-21782-1-git-send-email-clopez@igalia.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] matchbox-keyboard: Fix build failure with ld-is-gold
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
X-List-Received-Date: Fri, 11 Sep 2015 13:00:42 -0000

  * When ld-is-gold is enabled in DISTRO_FEATURES, matchbox-keyboard
    will fail to build with this error:

    ld: error: matchbox-keyboard-image.o: requires unsupported dynamic
               reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index 0d321d3..cde1c49 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -25,6 +25,8 @@ inherit autotools pkgconfig gettext gtk-immodules-cache distro_features_check
 # The libxft, libfakekey and matchbox-panel-2 requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
+CFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', ' -fPIC ', '', d)}"
+
 EXTRA_OECONF = "--disable-cairo --enable-gtk-im --enable-applet"
 
 PACKAGES += "${PN}-im ${PN}-applet"
-- 
2.1.4


