Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1ABC176FE2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 02:23:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7J2Nxjn017468
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 19:23:59 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 18 Aug 2016 19:23:58 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2016 10:24:11 +0800
Message-ID: <557e30d15739396a6ffd7b688ed3a8766fd90e44.1471573393.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1471573393.git.Qi.Chen@windriver.com>
References: <cover.1471573393.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] systemd: split systemd-container
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
X-List-Received-Date: Fri, 19 Aug 2016 02:23:59 -0000
Content-Type: text/plain

Split container/vm related units into a new package, systemd-container.

The split mainly references Fedora 24, with a few differences.
Apart from the bash and zsh completion files, the differences include
adding systemd-spawn@.service into the systemd-container package.

[YOCTO #9835]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_230.bb | 38 +++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core/systemd/systemd_230.bb
index 374a197..4d36794 100644
--- a/meta/recipes-core/systemd/systemd_230.bb
+++ b/meta/recipes-core/systemd/systemd_230.bb
@@ -291,9 +291,13 @@ PACKAGES =+ "\
     ${PN}-pam \
     ${PN}-zsh-completion \
     ${PN}-xorg-xinitrc \
+    ${PN}-container \
     ${PN}-extra-utils \
 "
 
+SUMMARY_${PN}-container = "Tools for containers and VMs"
+DESCRIPTION_${PN}-container = "Systemd tools to spawn and manage containers and virtual machines."
+
 SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfmt', '', d)}"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
@@ -348,6 +352,37 @@ RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
 
 RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts kbd-keymaps"
 
+FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.conf \
+                         ${sysconfdir}/dbus-1/system.d/org.freedesktop.machine1.conf \
+                         ${base_bindir}/machinectl \
+                         ${bindir}/systemd-nspawn \
+                         ${nonarch_libdir}/systemd/import-pubring.gpg \
+                         ${systemd_system_unitdir}/busnames.target.wants/org.freedesktop.import1.busname \
+                         ${systemd_system_unitdir}/busnames.target.wants/org.freedesktop.machine1.busname \
+                         ${systemd_system_unitdir}/local-fs.target.wants/var-lib-machines.mount \
+                         ${systemd_system_unitdir}/machine.slice \
+                         ${systemd_system_unitdir}/machines.target \
+                         ${systemd_system_unitdir}/org.freedesktop.import1.busname \
+                         ${systemd_system_unitdir}/org.freedesktop.machine1.busname \
+                         ${systemd_system_unitdir}/systemd-importd.service \
+                         ${systemd_system_unitdir}/systemd-machined.service \
+                         ${systemd_system_unitdir}/var-lib-machines.mount \
+                         ${rootlibexecdir}/systemd/systemd-import \
+                         ${rootlibexecdir}/systemd/systemd-importd \
+                         ${rootlibexecdir}/systemd/systemd-journal-gatewayd \
+                         ${rootlibexecdir}/systemd/systemd-journal-remote \
+                         ${rootlibexecdir}/systemd/systemd-journal-upload \
+                         ${rootlibexecdir}/systemd/systemd-machined \
+                         ${rootlibexecdir}/systemd/systemd-pull \
+                         ${exec_prefix}/lib/tmpfiles.d/systemd-nspawn.conf \
+                         ${systemd_system_unitdir}/systemd-nspawn@.service \
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
@@ -371,9 +406,6 @@ FILES_${PN}-extra-utils = "\
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


