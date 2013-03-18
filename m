Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UHca1-00012v-7X
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 17:06:33 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: Ross Burton <ross.burton@intel.com>
Date: Mon, 18 Mar 2013 16:49:43 +0100
Message-Id: <1363621784-22855-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Cc: openembedded-core@lists.openembedded.org
Subject: [ross/systemd][PATCH 1/2] systemd: disable udev initscript when systemd is active
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
X-List-Received-Date: Mon, 18 Mar 2013 16:06:34 -0000

* systemd's unit is called "systemd-udev", which doesn't
  match the name of the initscript

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-core/systemd/systemd_197.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 50d052f..6ce3890 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -106,6 +106,7 @@ do_install() {
 	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
+		ln -sf /dev/null ${D}${systemd_unitdir}/system/udev.service
 	fi
 }
 
-- 
1.7.10.4



