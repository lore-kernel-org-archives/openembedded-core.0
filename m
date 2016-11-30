Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id A64A471AFD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 22:43:08 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id BC07FB806E6; Wed, 30 Nov 2016 23:43:06 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 23:43:02 +0100
Message-Id: <1480545786-5069-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480545786-5069-1-git-send-email-obi@opendreambox.org>
References: <1480545786-5069-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/6] nfs-utils: create package nfs-utils-mount
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
X-List-Received-Date: Wed, 30 Nov 2016 22:43:09 -0000

Contains just enough to mount and unmount nfs volumes, i.e.
the same as nfs-utils-client before commit 39bb7e3 ("nfs-utils:
separate package as Debain style").

Drop nfs-utils-client's dependency on bash. It contains two shell
scripts, /etc/init.d/nfscommon and /usr/sbin/start-statd, both
using /bin/sh.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
index d4b401e..eb8e99a 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
 DEPENDS = "libcap libnfsidmap libevent util-linux sqlite3 libtirpc"
-RDEPENDS_${PN}-client = "rpcbind bash"
 RDEPENDS_${PN} = "${PN}-client bash"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
@@ -71,7 +70,7 @@ PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wr
 PACKAGECONFIG[nfsidmap] = "--enable-nfsidmap,--disable-nfsidmap,keyutils"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
-PACKAGES =+ "${PN}-client ${PN}-stats"
+PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats"
 
 CONFFILES_${PN}-client += "${localstatedir}/lib/nfs/etab \
 			   ${localstatedir}/lib/nfs/rmtab \
@@ -79,7 +78,7 @@ CONFFILES_${PN}-client += "${localstatedir}/lib/nfs/etab \
 			   ${localstatedir}/lib/nfs/statd/state \
 			   ${sysconfdir}/nfsmount.conf"
 
-FILES_${PN}-client = "${base_sbindir}/*mount.nfs* ${sbindir}/*statd \
+FILES_${PN}-client = "${sbindir}/*statd \
 		      ${sbindir}/rpc.idmapd ${sbindir}/sm-notify \
 		      ${sbindir}/showmount ${sbindir}/nfsstat \
 		      ${localstatedir}/lib/nfs \
@@ -87,6 +86,10 @@ FILES_${PN}-client = "${base_sbindir}/*mount.nfs* ${sbindir}/*statd \
 		      ${sysconfdir}/nfsmount.conf \
 		      ${sysconfdir}/init.d/nfscommon \
 		      ${systemd_unitdir}/system/nfs-statd.service"
+RDEPENDS_${PN}-client = "${PN}-mount rpcbind"
+
+FILES_${PN}-mount = "${base_sbindir}/*mount.nfs*"
+
 FILES_${PN}-stats = "${sbindir}/mountstats ${sbindir}/nfsiostat"
 RDEPENDS_${PN}-stats = "python3-core"
 
-- 
2.7.4


