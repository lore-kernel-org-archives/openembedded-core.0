Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id C227E7199C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 22:43:07 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 8C534B81F65; Wed, 30 Nov 2016 23:43:06 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 23:43:01 +0100
Message-Id: <1480545786-5069-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/6] nfs-utils: systemd fixes
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
X-List-Received-Date: Wed, 30 Nov 2016 22:43:08 -0000

- Start daemons by default like the initscripts do, but only if
  /etc/exports exists.
- Inform systemd.bbclass about nfs-utils-client package.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service | 1 +
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service | 1 +
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb           | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
index 613ddc0..28b7388 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
@@ -2,6 +2,7 @@
 Description=NFS Mount Daemon
 After=rpcbind.service nfs-server.service
 Requires=rpcbind.service nfs-server.service
+ConditionPathExists=@SYSCONFDIR@/exports
 
 [Service]
 EnvironmentFile=-@SYSCONFDIR@/nfs-utils.conf
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
index 147d7a7..b9dfe74 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
@@ -2,6 +2,7 @@
 Description=NFS Server
 Requires=rpcbind.service nfs-mountd.service
 After=rpcbind.service
+ConditionPathExists=@SYSCONFDIR@/exports
 
 [Service]
 Type=oneshot
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
index 4d6d808..d4b401e 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
@@ -48,9 +48,9 @@ INITSCRIPT_PARAMS_${PN}-client = "defaults 19 21"
 
 inherit autotools-brokensep update-rc.d systemd pkgconfig
 
+SYSTEMD_PACKAGES = "${PN} ${PN}-client"
 SYSTEMD_SERVICE_${PN} = "nfs-server.service nfs-mountd.service"
 SYSTEMD_SERVICE_${PN}-client = "nfs-statd.service"
-SYSTEMD_AUTO_ENABLE = "disable"
 
 # --enable-uuid is need for cross-compiling
 EXTRA_OECONF = "--with-statduser=rpcuser \
-- 
2.7.4


