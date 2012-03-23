Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SB7dX-0008Bo-2G
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 17:46:47 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 17:37:38 +0100
Message-Id: <1332520659-12233-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1332520659-12233-1-git-send-email-obi@opendreambox.org>
References: <1332520659-12233-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 3/4] sysvinit: use update-alternatives for mountpoint and runlevel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 16:46:47 -0000

* mountpoint and runlevel may be provided by busybox.
* Use update-alternatives to avoid conflict.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 663e298..d3e430c 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
-PR = "r5"
+PR = "r6"
 
 RDEPENDS_${PN} = "${PN}-inittab"
 
@@ -66,9 +66,11 @@ do_install () {
 		ln -s ../init.d/stop-bootlogd ${D}${sysconfdir}/rc$level.d/S99stop-bootlogd
 	done
 	mv                 ${D}${base_sbindir}/init               ${D}${base_sbindir}/init.${BPN}
+	mv ${D}${base_bindir}/mountpoint ${D}${base_bindir}/mountpoint.${BPN}
 	mv ${D}${base_bindir}/pidof ${D}${base_bindir}/pidof.${BPN}
 	mv ${D}${base_sbindir}/halt ${D}${base_sbindir}/halt.${BPN}
 	mv ${D}${base_sbindir}/reboot ${D}${base_sbindir}/reboot.${BPN}
+	mv ${D}${base_sbindir}/runlevel ${D}${base_sbindir}/runlevel.${BPN}
 	mv ${D}${base_sbindir}/shutdown ${D}${base_sbindir}/shutdown.${BPN}
 	mv ${D}${base_sbindir}/poweroff ${D}${base_sbindir}/poweroff.${BPN}
 	mv ${D}${bindir}/last ${D}${bindir}/last.${BPN}
@@ -77,8 +79,10 @@ do_install () {
 }
 
 pkg_postinst_${PN} () {
+	update-alternatives --install ${base_bindir}/mountpoint mountpoint mountpoint.${BPN} 200
 	update-alternatives --install ${base_sbindir}/halt halt halt.${BPN} 200
 	update-alternatives --install ${base_sbindir}/reboot reboot reboot.${BPN} 200
+	update-alternatives --install ${base_sbindir}/runlevel runlevel runlevel.${BPN} 200
 	update-alternatives --install ${base_sbindir}/shutdown shutdown shutdown.${BPN} 200
 	update-alternatives --install ${base_sbindir}/poweroff poweroff poweroff.${BPN} 200
 	update-alternatives --install ${bindir}/last last last.${BPN} 200
@@ -87,8 +91,10 @@ pkg_postinst_${PN} () {
 }
 
 pkg_prerm_${PN} () {
+	update-alternatives --remove mountpoint mountpoint.${BPN}
 	update-alternatives --remove halt halt.${BPN}
 	update-alternatives --remove reboot reboot.${BPN}
+	update-alternatives --remove runlevel runlevel.${BPN}
 	update-alternatives --remove shutdown shutdown.${BPN}
 	update-alternatives --remove poweroff poweroff.${BPN}
 	update-alternatives --remove last last.${BPN}
-- 
1.7.5.4



