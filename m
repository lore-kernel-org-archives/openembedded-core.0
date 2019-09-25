Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 42AA56D561
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 02:53:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8P2rKpJ000008
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 19:53:20 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 24 Sep 2019 19:53:19 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Sep 2019 11:07:49 +0800
Message-ID: <1b92d4ed4d0d7fbd91d56d28e32f3249e8fbdf72.1569380793.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1569380793.git.Qi.Chen@windriver.com>
References: <cover.1569380793.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: mark /etc as updated to avoid unnecessary services to run
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
X-List-Received-Date: Wed, 25 Sep 2019 02:53:19 -0000
Content-Type: text/plain

We have updated hwdb via postinstall, updated systemd users via
'systemd_create_users', so there's no need to update /etc. Mark it
as updated to avoid unnecessary services like systemd-hwdb-update.service
to run.

This would solve timeout problem on qemumips. So also remove the
timeout change for systemd-hwdb-update.service.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/rootfs-postcommands.bbclass | 6 ++++++
 meta/recipes-core/systemd/systemd_243.bb | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 88f75d0..9323e92 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -36,6 +36,8 @@ POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 # Set default target for systemd images
 SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "graphical.target", "multi-user.target", d)}'
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; systemd_create_users;", "", d)}'
+# Mark /etc as updated for systemd as we have done things in rootfs time
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd_mark_etc_updated;", "", d)}'
 
 ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 
@@ -86,6 +88,10 @@ systemd_create_users () {
 	done
 }
 
+systemd_mark_etc_updated () {
+	touch ${IMAGE_ROOTFS}${sysconfdir}/.updated
+}
+
 #
 # A hook function to support read-only-rootfs IMAGE_FEATURES
 #
diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.bb
index f0e8c56..0148c37 100644
--- a/meta/recipes-core/systemd/systemd_243.bb
+++ b/meta/recipes-core/systemd/systemd_243.bb
@@ -298,12 +298,6 @@ do_install() {
 	install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_unitdir}/system-preset/99-default.preset
 }
 
-do_install_append () {
-       # Mips qemu is extremely slow, allow more time for the hwdb update
-       # This is a workaround until https://github.com/systemd/systemd/issues/13581 is resolved
-       sed -i -e s#TimeoutSec=90s#TimeoutSec=180s# ${D}${systemd_unitdir}/system/systemd-hwdb-update.service
-}
-
 python populate_packages_prepend (){
     systemdlibdir = d.getVar("rootlibdir")
     do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
-- 
1.9.1


