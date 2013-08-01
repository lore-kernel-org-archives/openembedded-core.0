Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 0B7426B403
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 11:43:20 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r71Bgwhi031900; 
	Thu, 1 Aug 2013 06:43:20 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 16:43:22 +0500
Message-Id: <1375357402-10147-4-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1375357402-10147-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1375357402-10147-1-git-send-email-muhammad_shakeel@mentor.com>
Subject: [PATCH 4/4] nfs-utils: Add systemd support
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
X-List-Received-Date: Thu, 01 Aug 2013 11:43:21 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

- Remove dependency on meta-systemd

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../nfs-utils/nfs-utils/nfs-utils.service          |   16 ++++++++++++++++
 .../nfs-utils/nfs-utils_1.2.8.bb                   |   13 +++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.service
new file mode 100644
index 0000000..e480cc8
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.service
@@ -0,0 +1,16 @@
+[Unit]
+Description=NFS Server
+Requires=rpcbind.service
+After=rpcbind.service
+
+[Service]
+Type=oneshot
+ExecStart=/usr/sbin/rpc.nfsd
+ExecStart=/usr/sbin/rpc.mountd
+ExecStart=/usr/sbin/rpc.statd
+ExecStart=/usr/sbin/exportfs -a
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
index 40b897b..4149865 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
@@ -15,7 +15,8 @@ RRECOMMENDS_${PN} = "kernel-module-nfsd"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.bz2 \
            file://nfs-utils-1.0.6-uclibc.patch \
            file://nfs-utils-1.2.3-sm-notify-res_init.patch \
-           file://nfsserver"
+           file://nfsserver \
+           file://nfs-utils.service "
 
 SRC_URI[md5sum] = "6e7d97de51e428a0b8698c16ca23db77"
 SRC_URI[sha256sum] = "1cc8f02a633eddbf0a1d93421f331479c4cdab4c5ab33b8bf8c7c369f9156ac6"
@@ -31,7 +32,10 @@ INITSCRIPT_NAME = "nfsserver"
 # in the shutdown levels, but that works fine.
 INITSCRIPT_PARAMS = "defaults"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d systemd
+
+SYSTEMD_SERVICE_${PN} = "nfs-utils.service"
+SYSTEMD_AUTO_ENABLE = "disable"
 
 # --enable-uuid is need for cross-compiling
 EXTRA_OECONF = "--with-statduser=nobody \
@@ -65,6 +69,11 @@ do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
 	install -d ${D}${localstatedir}/lib/nfs/statd
 	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
+
+    install -d ${D}${systemd_unitdir}/system
+    install ${WORKDIR}/nfs-utils.service ${D}${systemd_unitdir}/system/
+    sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${systemd_unitdir}/system/nfs-utils.service
+
 	# kernel code as of 3.8 hard-codes this path as a default
 	install -d ${D}/var/lib/nfs/v4recovery
 
-- 
1.7.9.5


