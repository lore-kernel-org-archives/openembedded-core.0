Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DAAB66B8C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 07:38:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0D7cJcY021997
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2014 23:38:19 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 12 Jan 2014 23:38:18 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jan 2014 15:38:46 +0800
Message-ID: <1d073230c282c6e62cd24b164bc42f383a55544a.1389598673.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389598673.git.Qi.Chen@windriver.com>
References: <cover.1389598673.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] systemd-compat-units: make run-postinsts.service work correctly on target
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
X-List-Received-Date: Mon, 13 Jan 2014 07:38:19 -0000
Content-Type: text/plain

If we are using systemd as the init manager and rpm as the package
back-end, then the post-install script would not run at system start-up.

The problem is that we now have two init scripts to deal with post-install
scripts in our system. They are installed as /etc/rcS.d/S98run-postinsts and
/etc/rcS.d/S99run-postinsts respectively, however, the run-postinsts.service
in systemd only deals with the former one.

This patch fixes this problem to make run-postinsts.service work correctly
for the three package back-ends with/without 'package-management' in the
IMAGE_FEATURES.

This patch also hardcodes 98 and 99 instead of using POSTINSTALL_INITPOSITION
because using that variable doesn't bring anything useful.

[YOCTO #5719]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd-compat-units.bb  |    8 --------
 .../systemd-compat-units/run-postinsts.service     |    4 ++--
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 9f28283..5a6adb2 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -14,8 +14,6 @@ SRC_URI = "file://*.service"
 do_install() {
 	install -d ${D}${systemd_unitdir}/system/basic.target.wants
 	install -d ${D}${systemd_unitdir}/system/sysinit.target.wants/
-	sed -i -e 's,@POSTINSTALL_INITPOSITION@,${POSTINSTALL_INITPOSITION},g' \
-			${WORKDIR}/run-postinsts.service
 	install -m 0644 ${WORKDIR}/run-postinsts.service ${D}${systemd_unitdir}/system
 	ln -sf ../run-postinsts.service ${D}${systemd_unitdir}/system/basic.target.wants/
 	ln -sf ../run-postinsts.service ${D}${systemd_unitdir}/system/sysinit.target.wants/
@@ -50,9 +48,3 @@ pkg_postinst_${PN} () {
 
 FILES_${PN} = "${systemd_unitdir}/system ${bindir}"
 RDPEPENDS_${PN} = "systemd"
-
-# Define a variable to allow distros to run configure earlier.
-# (for example, to enable loading of ethernet kernel modules before networking starts)
-# note: modifying name or default value for POSTINSTALL_INITPOSITION requires
-# changes in opkg.inc
-POSTINSTALL_INITPOSITION ?= "98"
diff --git a/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service b/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
index 35cf3d3..1dc7b1a 100644
--- a/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
+++ b/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
@@ -1,12 +1,12 @@
 [Unit]
 Description=Run pending postinsts
 DefaultDependencies=no
-ConditionPathExists=|/etc/rcS.d/S@POSTINSTALL_INITPOSITION@run-postinsts
+ConditionPathExistsGlob=/etc/rcS.d/S*run-postinsts
 After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
 Before=sysinit.target
 
 [Service]
-ExecStart=/etc/rcS.d/S@POSTINSTALL_INITPOSITION@run-postinsts
+ExecStart=-/etc/rcS.d/S98run-postinsts ; -/etc/rcS.d/S99run-postinsts
 RemainAfterExit=No
 Type=oneshot
 StandardOutput=syslog
-- 
1.7.9.5


