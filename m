Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TFUtD-0004yt-8M
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 20:57:19 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TFUgu-00023M-2u
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 20:44:36 +0200
Message-ID: <1348339337.4444.229.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2012 19:42:17 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH] dbus: Remove hardcoded reference to /usr in System V startup script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Sep 2012 18:57:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Use ${bindir} to locate the binary instead.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-core/dbus/dbus-1.6.4/dbus-1.init |    2 +-
 meta/recipes-core/dbus/dbus.inc               |    5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-1.6.4/dbus-1.init b/meta/recipes-core/dbus/dbus-1.6.4/dbus-1.init
index 17b58ed..64f2170 100644
--- a/meta/recipes-core/dbus/dbus-1.6.4/dbus-1.init
+++ b/meta/recipes-core/dbus/dbus-1.6.4/dbus-1.init
@@ -16,7 +16,7 @@
 
 set -e
 
-DAEMON=/usr/bin/dbus-daemon
+DAEMON=@bindir@/dbus-daemon
 NAME=dbus
 DAEMONUSER=messagebus           # must match /etc/dbus-1/system.conf
 PIDFILE=/var/run/messagebus.pid # must match /etc/dbus-1/system.conf
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 8f35f56..5c99e11 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,7 +10,7 @@ DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X
 DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
 DEPENDS_virtclass-nativesdk = "nativesdk-expat virtual/nativesdk-libintl virtual/libx11"
 
-INC_PR = "r3"
+INC_PR = "r4"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
@@ -79,7 +79,8 @@ do_install() {
 	autotools_do_install
 
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/dbus-1.init ${D}${sysconfdir}/init.d/dbus-1
+	sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init >${WORKDIR}/dbus-1.init.sh
+	install -m 0755 ${WORKDIR}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-1
 
 	install -d ${D}${sysconfdir}/default/volatiles
 	echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none" \
-- 
1.7.9





