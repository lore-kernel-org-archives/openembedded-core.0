Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 080756FFE5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 09:23:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 71945264C50
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Dec 2015 09:23:48 +0000
Message-Id: <73467b484f01ebcb00401d7d3f94f1d9033c910e.1449134546.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <cover.1449134546.git.joshua.lock@collabora.co.uk>
References: <cover.1449134546.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1449134546.git.joshua.lock@collabora.co.uk>
References: <cover.1449134546.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v2 3/3] connman: tidy up connman-conf usage
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
X-List-Received-Date: Thu, 03 Dec 2015 09:23:53 -0000

connman-conf is now a systemd oneshot so need not be sed'ed in to
the ConnMan service file.

Furthermore add connman-conf as RRECCOMENDS only for qemu machines.

This cleans up connman-conf so that it is not automatically installed
and unconditionally calling a script that doesn't exist for most
machines.

Note: this doesn't affect sysvinit where we provide the ConnMan
init script which checks for the presence of the wired-networking
script and if it exists executes it as part of the connman init.

[YOCTO #8399]

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-connectivity/connman/connman.inc     | 5 -----
 meta/recipes-connectivity/connman/connman_1.30.bb | 3 +--
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 6324d7a..40880ad 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -68,11 +68,6 @@ python __anonymous () {
 
 SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
-SYSTEMD_WIRED_SETUP = "ExecStartPre=-${datadir}/connman/wired-setup"
-
-do_compile_append() {
-	sed -i "s#ExecStart=#${SYSTEMD_WIRED_SETUP}\nExecStart=#" ${B}/src/connman.service
-}
 
 do_install_append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
diff --git a/meta/recipes-connectivity/connman/connman_1.30.bb b/meta/recipes-connectivity/connman/connman_1.30.bb
index 7d65ac9..7f7f5c3 100644
--- a/meta/recipes-connectivity/connman/connman_1.30.bb
+++ b/meta/recipes-connectivity/connman/connman_1.30.bb
@@ -10,5 +10,4 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
 SRC_URI[md5sum] = "4a3efdbd6796922db9c6f66da57887fa"
 SRC_URI[sha256sum] = "5c5e464bacc9c27ed4e7269fb9b5059f07947f5be26433b59212133663ffa991"
 
-RRECOMMENDS_${PN} = "connman-conf"
-
+RRECOMMENDS_${PN}_qemuall = "connman-conf"
-- 
2.4.3


