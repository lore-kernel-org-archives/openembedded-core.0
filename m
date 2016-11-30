Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1C871B03
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 22:43:10 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 22964B81FA4; Wed, 30 Nov 2016 23:43:06 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 23:43:04 +0100
Message-Id: <1480545786-5069-4-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480545786-5069-1-git-send-email-obi@opendreambox.org>
References: <1480545786-5069-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 4/6] nfs-utils: add packageconfig options: blkid, ipv6, libmount, nfsv4, nfsv41 and tirpc
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

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
index eb8e99a..018afb7 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
@@ -7,8 +7,7 @@ SECTION = "console/network"
 LICENSE = "MIT & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
-# util-linux for libblkid
-DEPENDS = "libcap libnfsidmap libevent util-linux sqlite3 libtirpc"
+DEPENDS = "libcap"
 RDEPENDS_${PN} = "${PN}-client bash"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
@@ -54,21 +53,23 @@ SYSTEMD_SERVICE_${PN}-client = "nfs-statd.service"
 # --enable-uuid is need for cross-compiling
 EXTRA_OECONF = "--with-statduser=rpcuser \
                 --enable-mountconfig \
-                --enable-libmount-mount \
-                --disable-nfsv41 \
-                --enable-uuid \
                 --disable-gss \
                 --disable-nfsdcltrack \
                 --with-statdpath=/var/lib/nfs/statd \
                "
 
-PACKAGECONFIG ??= "tcp-wrappers \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+PACKAGECONFIG ??= "blkid libmount nfsv4 tcp-wrappers \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6 tirpc', '', d)} \
 "
 PACKAGECONFIG_remove_libc-musl = "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
 PACKAGECONFIG[nfsidmap] = "--enable-nfsidmap,--disable-nfsidmap,keyutils"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[tirpc] = "--enable-tirpc,--disable-tirpc,libtirpc"
+PACKAGECONFIG[blkid] = "--enable-uuid,--disable-uuid,util-linux"
+PACKAGECONFIG[libmount] = "--enable-libmount-mount,--disable-libmount-mount,util-linux"
+PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,libevent libnfsidmap keyutils sqlite3"
+PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,lvm2"
 
 PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats"
 
-- 
2.7.4


