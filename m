Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7542B6B00C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 10:58:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jul 2013 03:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,994,1363158000"; d="scan'208";a="364727515"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 04 Jul 2013 03:58:11 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 13:58:00 +0300
Message-Id: <9b803f18c25bc5b0bcab26f6bea6caacb6784d47.1372933905.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372933905.git.laurentiu.palcu@intel.com>
References: <cover.1372933905.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 1/5] sysvinit: allow users in shutdown group to perform halt/reboot
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
X-List-Received-Date: Thu, 04 Jul 2013 10:58:11 -0000

For this to happen:
 * 'shutdown' group has been created;
 * changed ownership group for /sbin/halt and /sbin/shutdown to 'shutdown';
 * deny execution rights to other users except 'root' and those belonging
   to 'shutdown' group;
 * set setuid bit to both apps;

So, basically, in order for a normal user to be able to shutdown/reboot
the machine, it must be a member of 'shutdown' group.

Other changes:
 * fixed identetion for 2 lines that used spaces instead of tabs;

[YOCTO #4345]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index e64b67a..784d538 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -25,7 +25,7 @@ SRC_URI[sha256sum] = "60bbc8c1e1792056e23761d22960b30bb13eccc2cabff8c7310a01f4d5
 S = "${WORKDIR}/sysvinit-${PV}"
 B = "${S}/src"
 
-inherit update-alternatives
+inherit update-alternatives useradd
 DEPENDS_append = " update-rc.d-native"
 
 ALTERNATIVE_${PN} = "init mountpoint halt reboot runlevel shutdown poweroff last mesg utmpdump wall"
@@ -54,6 +54,9 @@ ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
 ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
 ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
 
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system shutdown"
+
 PACKAGES =+ "sysvinit-pidof sysvinit-sulogin"
 FILES_${PN} += "${base_sbindir}/* ${base_bindir}/*"
 FILES_sysvinit-pidof = "${base_bindir}/pidof.sysvinit ${base_sbindir}/killall5"
@@ -87,6 +90,9 @@ do_install () {
 	install -m 0755    ${WORKDIR}/bootlogd.init     ${D}${sysconfdir}/init.d/bootlogd
 	ln -sf bootlogd ${D}${sysconfdir}/init.d/stop-bootlogd
 
-        update-rc.d -r ${D} bootlogd start 07 S .
-        update-rc.d -r ${D} stop-bootlogd start 99 2 3 4 5 .
+	update-rc.d -r ${D} bootlogd start 07 S .
+	update-rc.d -r ${D} stop-bootlogd start 99 2 3 4 5 .
+
+	chown root.shutdown ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
+	chmod o-x,u+s ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
 }
-- 
1.7.9.5


