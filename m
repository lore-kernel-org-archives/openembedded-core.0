Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9BC666067C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 03:25:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6E3Prvb022298
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 20:25:57 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 13 Jul 2016 20:25:51 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jul 2016 11:25:51 +0800
Message-ID: <b833d4bb5bd450464c93f49727f0dd31691897a5.1468466649.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1468466649.git.Qi.Chen@windriver.com>
References: <cover.1468466649.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: split systemd-container
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
X-List-Received-Date: Thu, 14 Jul 2016 03:25:58 -0000
Content-Type: text/plain

Split container/vm related units into a new package, systemd-container.

The split mainly references Fedora 24, with a few differences.
Apart from the bash and zsh completion files, the differences include
adding systemd-spawn@.service into the systemd-container package.

[YOCTO #9835]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_230.bb | 35 +++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core/systemd/systemd_230.bb
index 374a197..cf8aec1 100644
--- a/meta/recipes-core/systemd/systemd_230.bb
+++ b/meta/recipes-core/systemd/systemd_230.bb
@@ -291,6 +291,7 @@ PACKAGES =+ "\
     ${PN}-pam \
     ${PN}-zsh-completion \
     ${PN}-xorg-xinitrc \
+    ${PN}-container \
     ${PN}-extra-utils \
 "
 
@@ -348,6 +349,37 @@ RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
 
 RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts kbd-keymaps"
 
+FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.conf \
+                         ${sysconfdir}/dbus-1/system.d/org.freedesktop.machine1.conf \
+                         ${base_bindir}/machinectl \
+                         ${bindir}/systemd-nspawn \
+                         ${exec_prefix}/lib/systemd/import-pubring.gpg \
+                         ${systemd_unitdir}/system/busnames.target.wants/org.freedesktop.import1.busname \
+                         ${systemd_unitdir}/system/busnames.target.wants/org.freedesktop.machine1.busname \
+                         ${systemd_unitdir}/system/local-fs.target.wants/var-lib-machines.mount \
+                         ${systemd_unitdir}/system/machine.slice \
+                         ${systemd_unitdir}/system/machines.target \
+                         ${systemd_unitdir}/system/org.freedesktop.import1.busname \
+                         ${systemd_unitdir}/system/org.freedesktop.machine1.busname \
+                         ${systemd_unitdir}/system/systemd-importd.service \
+                         ${systemd_unitdir}/system/systemd-machined.service \
+                         ${systemd_unitdir}/system/var-lib-machines.mount \
+                         ${rootlibexecdir}/systemd/systemd-import \
+                         ${rootlibexecdir}/systemd/systemd-importd \
+                         ${rootlibexecdir}/systemd/systemd-journal-gatewayd \
+                         ${rootlibexecdir}/systemd/systemd-journal-remote \
+                         ${rootlibexecdir}/systemd/systemd-journal-upload \
+                         ${rootlibexecdir}/systemd/systemd-machined \
+                         ${rootlibexecdir}/systemd/systemd-pull \
+                         ${exec_prefix}/lib/tmpfiles.d/systemd-nspawn.conf \
+                         ${systemd_unitdir}/system/systemd-nspawn@.service \
+                         ${libdir}/libnss_mymachines.so.2 \
+                         ${datadir}/dbus-1/system-services/org.freedesktop.import1.service \
+                         ${datadir}/dbus-1/system-services/org.freedesktop.machine1.service \
+                         ${datadir}/polkit-1/actions/org.freedesktop.import1.policy \
+                         ${datadir}/polkit-1/actions/org.freedesktop.machine1.policy \
+                        "
+
 FILES_${PN}-extra-utils = "\
                         ${base_bindir}/systemd-escape \
                         ${base_bindir}/systemd-inhibit \
@@ -371,9 +403,6 @@ FILES_${PN}-extra-utils = "\
                         ${rootlibexecdir}/systemd/systemd-resolve-host \
                         ${rootlibexecdir}/systemd/systemd-ac-power \
                         ${rootlibexecdir}/systemd/systemd-activate \
-                        ${bindir}/systemd-nspawn \
-                        ${exec_prefix}/lib/tmpfiles.d/systemd-nspawn.conf \
-                        ${systemd_unitdir}/system/systemd-nspawn@.service \
                         ${rootlibexecdir}/systemd/systemd-bus-proxyd \
                         ${systemd_unitdir}/system/systemd-bus-proxyd.service \
                         ${systemd_unitdir}/system/systemd-bus-proxyd.socket \
-- 
1.9.1


