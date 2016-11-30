Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0DFE971B02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 22:43:09 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id EABE1B81FA0; Wed, 30 Nov 2016 23:43:06 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 23:43:05 +0100
Message-Id: <1480545786-5069-5-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480545786-5069-1-git-send-email-obi@opendreambox.org>
References: <1480545786-5069-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 5/6] nfs-utils: don't try to load kernel module
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
X-List-Received-Date: Wed, 30 Nov 2016 22:43:10 -0000

This conflicts with KERNEL_MODULE_AUTOLOAD += "nfsd".

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
index 018afb7..4355237 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
@@ -126,8 +126,6 @@ do_install_append () {
 		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
 		${D}${systemd_unitdir}/system/*.service
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-	    install -d ${D}${sysconfdir}/modules-load.d
-	    echo "nfsd" > ${D}${sysconfdir}/modules-load.d/nfsd.conf
 	    install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_unitdir}/system/
 	    install -d ${D}${systemd_unitdir}/system/sysinit.target.wants/
 	    ln -sf ../proc-fs-nfsd.mount ${D}${systemd_unitdir}/system/sysinit.target.wants/proc-fs-nfsd.mount
-- 
2.7.4


