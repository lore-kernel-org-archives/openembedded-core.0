Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 4180760F28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 06:30:03 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r8C6U05S025117; 
	Thu, 12 Sep 2013 01:30:02 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2013 11:31:18 +0500
Message-Id: <1378967479-8725-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] oprofileui-server: Add systemd support
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
X-List-Received-Date: Thu, 12 Sep 2013 06:30:03 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

-Remove dependency on meta-systemd

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../oprofileui-server/oprofileui-server.service    |    6 ++++++
 .../oprofile/oprofileui-server_git.bb              |   13 +++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/oprofile/oprofileui-server/oprofileui-server.service b/meta/recipes-kernel/oprofile/oprofileui-server/oprofileui-server.service
new file mode 100644
index 0000000..1a2cbe6
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofileui-server/oprofileui-server.service
@@ -0,0 +1,6 @@
+[Unit]
+Description=OProfileUI Server
+After=network.target
+
+[Service]
+ExecStart=/bin/sh -c ". @SYSCONFDIR@/profile; @BINDIR@/oprofile-server"
diff --git a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
index 200bab3..70a1fbf 100644
--- a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
@@ -6,7 +6,8 @@ PV = "0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://git.yoctoproject.org/oprofileui \
-           file://init"
+           file://init \
+           file://oprofileui-server.service "
 
 EXTRA_OECONF += "--disable-client --enable-server"
 
@@ -15,9 +16,17 @@ RDEPENDS_${PN} = "oprofile"
 do_install_append() {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/oprofileui-server
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/oprofileui-server.service ${D}${systemd_unitdir}/system/
+	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+		-e 's,@BINDIR@,${bindir},g' ${D}${systemd_unitdir}/system/oprofileui-server.service
 }
 
+inherit update-rc.d systemd
+
 INITSCRIPT_NAME = "oprofileui-server"
 INITSCRIPT_PARAMS = "start 999 5 2 . stop 20 0 1 6 ."
 
-inherit update-rc.d
+SYSTEMD_SERVICE_${PN} = "oprofileui-server.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.7.9.5


