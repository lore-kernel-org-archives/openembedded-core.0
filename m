Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id A4D9E73181
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 20:43:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id A0A38265477
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2015 20:43:08 +0000
Message-Id: <97a7a9b254227a9dd6f45325c667caf9593d299e.1450298303.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450298303.git.joshua.lock@collabora.co.uk>
References: <cover.1450298303.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1450298303.git.joshua.lock@collabora.co.uk>
References: <cover.1450298303.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v4 2/2] connman: tidy up connman-conf usage
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
X-List-Received-Date: Wed, 16 Dec 2015 20:43:18 -0000

connman-conf is now a systemd oneshot and therefore doesn't need to
be sed'ed in to the ConnMan service file.

Furthermore we add connman-conf as RRECCOMENDS only for qemu machines.

This cleans up connman-conf so that it is not automatically installed
and unconditionally calling a script that doesn't exist for most
machines.

Note: this doesn't affect sysvinit where we provide a ConnMan
init script which checks for the presence of the wired-networking
script and, if it exists, executes it as part of the connman init.

[YOCTO #8399]

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-connectivity/connman/connman.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index ba2ca24..a446e66 100644
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
--
2.5.0

