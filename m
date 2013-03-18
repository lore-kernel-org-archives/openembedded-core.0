Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UHca4-00013D-O4
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 17:06:39 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: Ross Burton <ross.burton@intel.com>
Date: Mon, 18 Mar 2013 16:49:44 +0100
Message-Id: <1363621784-22855-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363621784-22855-1-git-send-email-obi@opendreambox.org>
References: <1363621784-22855-1-git-send-email-obi@opendreambox.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [ross/systemd][PATCH 2/2] dbus: disable initscript when systemd is active
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
X-List-Received-Date: Mon, 18 Mar 2013 16:06:42 -0000

* systemd's unit is called "dbus", which doesn't
  match the name of the initscript

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-core/dbus/dbus.inc |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index affffbc..3769a68 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -88,6 +88,9 @@ do_install() {
 		install -d ${D}${sysconfdir}/init.d
 		sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init >${WORKDIR}/dbus-1.init.sh
 		install -m 0755 ${WORKDIR}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-1
+		if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+			ln -sf /dev/null ${D}${systemd_unitdir}/system/dbus-1.service
+		fi
 	fi
 
 	install -d ${D}${sysconfdir}/default/volatiles
-- 
1.7.10.4



