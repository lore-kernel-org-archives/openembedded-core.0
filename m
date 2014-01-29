Return-Path: <jori@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id C70F16E791
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 09:38:53 +0000 (UTC)
Received: from sestows930 (172.16.140.35) by smtp.enea.com (172.21.1.208) with
	Microsoft SMTP Server id 14.3.158.1; Wed, 29 Jan 2014 10:38:49 +0100
Received: from jori by sestows930 with local (Exim 4.80)	(envelope-from
	<jori@sestows930>)	id 1W8Rbd-000427-Rz; Wed, 29 Jan 2014 10:38:49 +0100
From: Jonas Eriksson <jonas.eriksson@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jan 2014 10:38:44 +0100
Message-ID: <1390988324-15471-1-git-send-email-jonas.eriksson@enea.com>
X-Mailer: git-send-email 1.9.rc1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: jonas.eriksson@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] qemu: Allow building without X11 support
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
X-List-Received-Date: Wed, 29 Jan 2014 09:38:55 -0000
Content-Type: text/plain

To enable the construction of minimal hypervisors based on OE, it is
important to be able to build qemu without it requiring X support. By
checking that the distro is built with the x11 feature before adding
virtual/x11 to the dependencies, this is made possible.
---
 meta/recipes-devtools/qemu/qemu.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8705dc7..76119c0 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -1,7 +1,8 @@
 SUMMARY = "Fast open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
-DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman dtc libsdl"
+DEPENDS = "glib-2.0 zlib alsa-lib pixman dtc libsdl \
+           ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
 DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native dtc-native"
 DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
 RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
-- 
1.9.rc1


