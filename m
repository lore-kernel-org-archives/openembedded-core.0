Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 846356B605
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 15:17:29 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r7CFHBU2002187; 
	Mon, 12 Aug 2013 10:17:29 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Aug 2013 20:18:11 +0500
Message-Id: <1376320691-20541-4-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1376320691-20541-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1376320691-20541-1-git-send-email-muhammad_shakeel@mentor.com>
Subject: [PATCH 4/4] [v2] nfs-utils: Add systemd support
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
X-List-Received-Date: Mon, 12 Aug 2013 15:17:29 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

- Remove dependency on meta-systemd

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../nfs-utils/nfs-utils/nfs-mountd.service         |   11 ++++++
 .../nfs-utils/nfs-utils/nfs-server.service         |   18 +++++++++
 .../nfs-utils/nfs-utils/nfs-statd.service          |   12 ++++++
 .../nfs-utils/nfs-utils/nfs-utils.conf             |   35 +++++++++++++++++
 .../nfs-utils/nfs-utils_1.2.8.bb                   |   40 ++++++++++++++------
 5 files changed, 104 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
new file mode 100644
index 0000000..2e8dc03
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=NFS Mount Daemon
+After=rpcbind.service nfs-server.service
+Requires=rpcbind.service nfs-server.service
+
+[Service]
+EnvironmentFile=-/etc/nfs-utils.conf
+ExecStart=/usr/sbin/rpc.mountd -F $MOUNTD_OPTS
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
new file mode 100644
index 0000000..6c1eacb
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
@@ -0,0 +1,18 @@
+[Unit]
+Description=NFS Server
+Requires=rpcbind.service nfs-mountd.service
+After=rpcbind.service
+
+[Service]
+Type=oneshot
+EnvironmentFile=-/etc/nfs-utils.conf
+ExecStartPre=/usr/sbin/exportfs -r
+ExecStart=/usr/sbin/rpc.nfsd $NFSD_OPTS $NFSD_COUNT
+ExecStop=/usr/sbin/rpc.nfsd 0
+ExecStopPost=/usr/sbin/exportfs -f
+ExecReload=/usr/sbin/exportfs -r
+StandardError=syslog
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
new file mode 100644
index 0000000..ca53527
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=NFS file locking service
+After=rpcbind.service
+Requires=rpcbind.service
+Before=remote-fs-pre.target
+
+[Service]
+EnvironmentFile=-/etc/nfs-utils.conf
+ExecStart=/usr/sbin/rpc.statd -F $STATD_OPTS
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.conf b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.conf
new file mode 100644
index 0000000..a1007a7
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.conf
@@ -0,0 +1,35 @@
+# Parameters to be passed to nfs-utils (clients & server) service files.
+#
+
+# Options to pass to rpc.nfsd.
+NFSD_OPTS=""
+
+# Number of servers to start up; the default is 8 servers.
+NFSD_COUNT=""
+
+# Where to mount nfsd filesystem; the default is "/proc/fs/nfsd".
+PROCNFSD_MOUNTPOINT=""
+
+# Options used to mount nfsd filesystem; the default is "rw,nodev,noexec,nosuid".
+PROCNFSD_MOUNTOPTS=""
+
+# Options for rpc.mountd.
+# If you have a port-based firewall, you might want to set up
+# a fixed port here using the --port option.
+MOUNTD_OPTS=""
+
+# Parameters to be passed to nfs-common (nfs clients & server) init script.
+#
+
+# If you do not set values for the NEED_ options, they will be attempted
+# autodetected; this should be sufficient for most people. Valid alternatives
+# for the NEED_ options are "yes" and "no".
+
+# Do you want to start the statd daemon? It is not needed for NFSv4.
+NEED_STATD=""
+
+# Options to pass to rpc.statd.
+# N.B. statd normally runs on both client and server, and run-time
+# options should be specified accordingly.
+# STATD_OPTS="-p 32765 -o 32766"
+STATD_OPTS=""
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
index 40b897b..0110d02 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
@@ -15,7 +15,11 @@ RRECOMMENDS_${PN} = "kernel-module-nfsd"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.bz2 \
            file://nfs-utils-1.0.6-uclibc.patch \
            file://nfs-utils-1.2.3-sm-notify-res_init.patch \
-           file://nfsserver"
+           file://nfsserver \
+           file://nfs-utils.conf \
+           file://nfs-server.service \
+           file://nfs-mountd.service \
+           file://nfs-statd.service "
 
 SRC_URI[md5sum] = "6e7d97de51e428a0b8698c16ca23db77"
 SRC_URI[sha256sum] = "1cc8f02a633eddbf0a1d93421f331479c4cdab4c5ab33b8bf8c7c369f9156ac6"
@@ -31,7 +35,10 @@ INITSCRIPT_NAME = "nfsserver"
 # in the shutdown levels, but that works fine.
 INITSCRIPT_PARAMS = "defaults"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d systemd
+
+SYSTEMD_SERVICE_${PN} = "nfs-server.service nfs-mountd.service nfs-statd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
 
 # --enable-uuid is need for cross-compiling
 EXTRA_OECONF = "--with-statduser=nobody \
@@ -62,14 +69,23 @@ do_compile_prepend() {
 }
 
 do_install_append () {
-	install -d ${D}${sysconfdir}/init.d
-	install -d ${D}${localstatedir}/lib/nfs/statd
-	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
-	# kernel code as of 3.8 hard-codes this path as a default
-	install -d ${D}/var/lib/nfs/v4recovery
-
-	# the following are built by CC_FOR_BUILD
-	rm -f ${D}${sbindir}/rpcdebug
-	rm -f ${D}${sbindir}/rpcgen
-	rm -f ${D}${sbindir}/locktest
+    install -d ${D}${sysconfdir}/init.d
+    install -d ${D}${localstatedir}/lib/nfs/statd
+    install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
+
+    install -m 0755 ${WORKDIR}/nfs-utils.conf ${D}${sysconfdir}
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/nfs-server.service ${D}${systemd_unitdir}/system/
+    install -m 0644 ${WORKDIR}/nfs-mountd.service ${D}${systemd_unitdir}/system/
+    install -m 0644 ${WORKDIR}/nfs-statd.service ${D}${systemd_unitdir}/system/
+    sed -i 's,/usr/sbin,${sbindir},g' ${D}${systemd_unitdir}/system/*.service
+    sed -i 's,/etc,${sysconfdir},g' ${D}${systemd_unitdir}/system/*.service
+
+    # kernel code as of 3.8 hard-codes this path as a default
+    install -d ${D}/var/lib/nfs/v4recovery
+
+    # the following are built by CC_FOR_BUILD
+    rm -f ${D}${sbindir}/rpcdebug
+    rm -f ${D}${sbindir}/rpcgen
+    rm -f ${D}${sbindir}/locktest
 }
-- 
1.7.9.5


