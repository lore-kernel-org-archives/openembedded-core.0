Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECAD96E721
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 10:04:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0OA4D3V019518
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 02:04:13 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 24 Jan 2014 02:04:12 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jan 2014 18:04:22 +0800
Message-ID: <f834d10bac02c65e57fe63ed8b57b579a6164bf0.1390557768.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390557768.git.Qi.Chen@windriver.com>
References: <cover.1390557768.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] run-postinsts: Add systemd service file
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
X-List-Received-Date: Fri, 24 Jan 2014 10:04:12 -0000
Content-Type: text/plain

From: Ross Burton <ross.burton@intel.com>

This patch mainly adds a systmd service file for run-postinsts,
which is started at first boot to run the post-install scripts.

Apart from this, this patch also modifies the installation location
of run-postinsts to ${sbindir}. This is because this script would be
used by both sysvinit and systemd based images. So it's more reasonable
to make it locate under ${sbindir}.

[YOCTO #5719]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../run-postinsts/run-postinsts/run-postinsts.init |    3 +++
 .../run-postinsts/run-postinsts.service            |   17 +++++++++++++++
 .../run-postinsts/run-postinsts_1.0.bb             |   22 ++++++++++++++++----
 3 files changed, 38 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.init
 create mode 100644 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.init b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.init
new file mode 100644
index 0000000..473a1f7
--- /dev/null
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.init
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+run-postinsts
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
new file mode 100644
index 0000000..822327a
--- /dev/null
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=Run pending postinsts
+DefaultDependencies=no
+After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
+Before=sysinit.target
+ConditionPathExistsGlob=#SYSCONFDIR#/*-postinsts
+
+[Service]
+Type=oneshot
+ExecStart=#SBINDIR#/run-postinsts
+ExecStartPost=#BASE_BINDIR#/systemctl disable run-postinsts.service
+RemainAfterExit=No
+TimeoutSec=0
+
+[Install]
+WantedBy=basic.target
+WantedBy=sysinit.target
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index 03989ab..64f85c2 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -5,12 +5,16 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-SRC_URI = "file://run-postinsts"
+SRC_URI = "file://run-postinsts \
+           file://run-postinsts.init \
+           file://run-postinsts.service"
+
+inherit allarch systemd update-rc.d
 
 INITSCRIPT_NAME = "run-postinsts"
 INITSCRIPT_PARAMS = "start 99 S ."
 
-inherit update-rc.d
+SYSTEMD_SERVICE_${PN} = "run-postinsts.service"
 
 do_configure() {
 	:
@@ -21,8 +25,18 @@ do_compile () {
 }
 
 do_install() {
+	install -d ${D}${sbindir}
+	install -m 0755 ${WORKDIR}/run-postinsts ${D}${sbindir}/
+
 	install -d ${D}${sysconfdir}/init.d/
-	install -m 0755 ${WORKDIR}/run-postinsts ${D}${sysconfdir}/init.d/
+	install -m 0755 ${WORKDIR}/run-postinsts.init ${D}${sysconfdir}/init.d/run-postinsts
+
+	install -d ${D}${systemd_unitdir}/system/
+	install -m 0644 ${WORKDIR}/run-postinsts.service ${D}${systemd_unitdir}/system/
 
-	sed -i -e 's:#SYSCONFDIR#:${sysconfdir}:g' ${D}${sysconfdir}/init.d/run-postinsts
+	sed -i -e 's:#SYSCONFDIR#:${sysconfdir}:g' \
+               -e 's:#SBINDIR#:${sbindir}:g' \
+               -e 's:#BASE_BINDIR#:${base_bindir}:g' \
+               ${D}${sbindir}/run-postinsts \
+               ${D}${systemd_unitdir}/system/run-postinsts.service
 }
-- 
1.7.9.5


