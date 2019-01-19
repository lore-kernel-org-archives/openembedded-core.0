Return-Path: <peter@berginkonsult.se>
X-Greylist: delayed 963 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 19 Jan 2019 21:51:52 UTC
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
	(mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 45402746B2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2019 21:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20140924;
	h=message-id:date:subject:cc:to:from:from;
	bh=/jQIIbnoYAYrNngB1jbmmMDWD+J1Kd4uyTNHtlTGR6w=;
	b=N/iE5Ovy6qRidLXZy37OoFHisTW7n+7HE7mpMYrE6ZitF6wJGDtyIVirNOXt3focj8AuqxtHM0yWO
	cU8ZfHCGLUa7uwsR+FcAxv4/D2ao/Og8NJ4iVfEm1wJw9ohDRefNwPr/nNprGbJQgtwYAr2oWEej0u
	65ogOpHfMwdu8wmQ=
X-HalOne-Cookie: 4436a44570a61804580211dff57d62a0aacf89db
X-HalOne-ID: 2d319dfd-1c32-11e9-b4de-d0431ea8a283
Received: from localhost.localdomain (unknown [82.196.108.68])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 2d319dfd-1c32-11e9-b4de-d0431ea8a283;
	Sat, 19 Jan 2019 21:35:49 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2019 22:35:21 +0100
Message-Id: <1547933721-27188-1-git-send-email-peter@berginkonsult.se>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] at-spi2-core: only depend of x11 if in DISTRO_FEATURES
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
X-List-Received-Date: Sat, 19 Jan 2019 21:51:52 -0000

Build system for at-spi2-core package have auto detection
of x11 dependency since version 2.26.1. Remove the hardcoded
dependency in the recipe and let DISTRO_FEATURES decide.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/recipes-support/atk/at-spi2-core_2.30.0.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb b/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
index d7ea9be..7d2d406 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
@@ -11,11 +11,12 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "d4f22c66b3210ffe6b10d01c04e008b5"
 SRC_URI[sha256sum] = "0175f5393d19da51f4c11462cba4ba6ef3fa042abf1611a70bdfed586b7bfb2b"
 
-DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst"
+X11DEPENDS = "virtual/libx11 libxi libxtst"
 
-inherit meson gtk-doc gettext systemd pkgconfig distro_features_check upstream-version-is-even gobject-introspection
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
+DEPENDS = "dbus glib-2.0"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
+
+inherit meson gtk-doc gettext systemd pkgconfig upstream-version-is-even gobject-introspection
 
 EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \
                   -Ddbus_daemon=${bindir}/dbus-daemon"
-- 
2.7.4


