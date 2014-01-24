Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A76416E8D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 10:04:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0OA4EIL018762
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 02:04:14 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 24 Jan 2014 02:04:13 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jan 2014 18:04:23 +0800
Message-ID: <7c1d7a02ead7fea9d78d4cf75ce0661b400e1f52.1390557768.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390557768.git.Qi.Chen@windriver.com>
References: <cover.1390557768.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] systemd-compat-units: remove run-postints service
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
X-List-Received-Date: Fri, 24 Jan 2014 10:04:14 -0000
Content-Type: text/plain

From: Ross Burton <ross.burton@intel.com>

Remove this service as it's moved to the run-postinsts recipe.

[YOCTO #5719]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd-compat-units.bb  |   19 +------------------
 .../systemd-compat-units/run-postinsts.service     |   17 -----------------
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index d8cc3f7..e653470 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -9,17 +9,7 @@ DEPENDS = "systemd-systemctl-native"
 
 inherit allarch
 
-SRC_URI = "file://*.service"
-
-do_install() {
-	install -d ${D}${systemd_unitdir}/system/basic.target.wants
-	install -d ${D}${systemd_unitdir}/system/sysinit.target.wants/
-	sed -i -e 's,@POSTINSTALL_INITPOSITION@,${POSTINSTALL_INITPOSITION},g' \
-			${WORKDIR}/run-postinsts.service
-	install -m 0644 ${WORKDIR}/run-postinsts.service ${D}${systemd_unitdir}/system
-	ln -sf ../run-postinsts.service ${D}${systemd_unitdir}/system/basic.target.wants/
-	ln -sf ../run-postinsts.service ${D}${systemd_unitdir}/system/sysinit.target.wants/
-}
+ALLOW_EMPTY_${PN} = "1"
 
 SYSTEMD_DISABLED_SYSV_SERVICES = " \
   busybox-udhcpc \
@@ -47,11 +37,4 @@ pkg_postinst_${PN} () {
 	done ; echo
 }
 
-FILES_${PN} = "${systemd_unitdir}/system ${bindir}"
 RDPEPENDS_${PN} = "systemd"
-
-# Define a variable to allow distros to run configure earlier.
-# (for example, to enable loading of ethernet kernel modules before networking starts)
-# note: modifying name or default value for POSTINSTALL_INITPOSITION requires
-# changes in opkg.inc
-POSTINSTALL_INITPOSITION ?= "98"
diff --git a/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service b/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
deleted file mode 100644
index 35cf3d3..0000000
--- a/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
+++ /dev/null
@@ -1,17 +0,0 @@
-[Unit]
-Description=Run pending postinsts
-DefaultDependencies=no
-ConditionPathExists=|/etc/rcS.d/S@POSTINSTALL_INITPOSITION@run-postinsts
-After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
-Before=sysinit.target
-
-[Service]
-ExecStart=/etc/rcS.d/S@POSTINSTALL_INITPOSITION@run-postinsts
-RemainAfterExit=No
-Type=oneshot
-StandardOutput=syslog
-TimeoutSec=0
-
-[Install]
-WantedBy=basic.target
-WantedBy=sysinit.target
-- 
1.7.9.5


