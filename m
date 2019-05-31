Return-Path: <philn@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 162C37E4F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 09:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
	bh=xcqeJusHadCtufX/a4bV527rz1OpxHxFnAw5hET7F64=; 
	b=Qr1HaqqWRx/svrCX1sqzhZYNnAc/GpHNoee66UpBJmUkldalLpWaVP8ZyrKUvpNBlD7KqXJOIr1QEDBQgp+moy6mh10XHVA6lCXg6b8s2XiUTvi3hctov4yHolu9VgUl65Nx6Fz15EswT9DTX642uBk4+Kxq/LWoUTGGf6pYDoS8Bfe76rQJ3hzFVXcTAw6CHSNHx2aYjMz5rewRPabeKTURfRPEyE+RCe7RnXxqrXV0pUNFPJtkAgvPx3Y5ST5rlnIUkARSiMdAAIlqeQjGYlxkOqznGctVwirOcLCHKBy9trw/XrYurpC99OujllwuV8jrB6F40DK8HHaz1Mu7fA==;
Received: from 216.red-88-16-195.dynamicip.rima-tde.net ([88.16.195.216]
	helo=localhost.localdomain) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1hWdvF-0003yx-3i; Fri, 31 May 2019 11:34:01 +0200
From: Philippe Normand <philn@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 10:33:37 +0100
Message-Id: <20190531093337.22947-1-philn@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] at-spi2: Make X11 support truly optional
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
X-List-Received-Date: Fri, 31 May 2019 09:34:02 -0000
Content-Transfer-Encoding: 8bit

X11 support in at-spi2-core can be turned off at compile time, so leverage this
and disable it when X11 is not present in DISTRO_FEATURES.

Signed-off-by: Philippe Normand <philn@igalia.com>
---
 meta/recipes-support/atk/at-spi2-atk_2.32.0.bb  | 3 ---
 meta/recipes-support/atk/at-spi2-core_2.32.1.bb | 4 +++-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
index 8812d33d9a..bcf1c9c77a 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
@@ -11,9 +11,6 @@ DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core libxml2"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase distro_features_check upstream-version-is-even
 
-# The at-spi2-core requires x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES = "x11"
-
 PACKAGES =+ "${PN}-gnome ${PN}-gtk2"
 
 FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/gtk-modules"
diff --git a/meta/recipes-support/atk/at-spi2-core_2.32.1.bb b/meta/recipes-support/atk/at-spi2-core_2.32.1.bb
index 0f84259d94..1843ac09e2 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.32.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.32.1.bb
@@ -18,7 +18,9 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '',
 inherit meson gtk-doc gettext systemd pkgconfig upstream-version-is-even gobject-introspection
 
 EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \
-                  -Ddbus_daemon=${bindir}/dbus-daemon"
+                  -Ddbus_daemon=${bindir}/dbus-daemon \
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '-Denable-x11=yes', '-Denable-x11=no', d)} \
+"
 
 GTKDOC_MESON_OPTION = "docs"
 
-- 
2.20.1


