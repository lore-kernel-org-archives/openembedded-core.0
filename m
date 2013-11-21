Return-Path: <xiao.zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B41306AF9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 08:05:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL85pl0016522
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 00:05:51 -0800 (PST)
Received: from xzhang1-OptiPlex-780.corp.ad.wrs.com (128.224.162.178) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 21 Nov 2013 00:05:50 -0800
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 16:07:24 +0800
Message-ID: <1385021244-18681-1-git-send-email-xiao.zhang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [PATCH] nfs-utils: separate package as Debain style
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
X-List-Received-Date: Thu, 21 Nov 2013 08:05:51 -0000
Content-Type: text/plain

Move binaries used for both nfs client and server into client
package. Add an init script for client package and move
necessary progress from server's init script to this one. Make
client package more powerful and let server package depends on
client one, as Debain does.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 .../nfs-utils/nfs-utils/nfscommon                  | 90 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils/nfsserver                  | 46 +----------
 .../nfs-utils/nfs-utils_1.2.9.bb                   | 27 +++++--
 3 files changed, 114 insertions(+), 49 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
new file mode 100644
index 0000000..c949b96
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
@@ -0,0 +1,90 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          nfs-common
+# Required-Start:    $portmap hwclock
+# Required-Stop:     $portmap hwclock
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: NFS support for both client and server
+# Description:       NFS is a popular protocol for file sharing across
+#                    TCP/IP networks. This service provides various
+#                    support functions for NFS mounts.
+### END INIT INFO
+#
+# Startup script for nfs-utils
+#
+#
+# Location of executables:
+
+# Source function library.
+. /etc/init.d/functions
+
+test -x "$NFS_STATD" || NFS_STATD=/usr/sbin/rpc.statd
+test -z "$STATD_PID" && STATD_PID=/var/run/rpc.statd.pid
+#
+# The default state directory is /var/lib/nfs
+test -n "$NFS_STATEDIR" || NFS_STATEDIR=/var/lib/nfs
+#
+#----------------------------------------------------------------------
+# Startup and shutdown functions.
+#  Actual startup/shutdown is at the end of this file.
+#directories
+create_directories(){
+	echo -n 'creating NFS state directory: '
+	mkdir -p "$NFS_STATEDIR"
+	(	cd "$NFS_STATEDIR"
+		umask 077
+		mkdir -p rpc_pipefs
+		mkdir -p sm sm.bak statd
+		chown rpcuser sm sm.bak statd
+		test -w statd/state || {
+			rm -f statd/state
+			:>statd/state
+		}
+		umask 022
+		for file in xtab etab smtab rmtab
+		do
+			test -w "$file" || {
+				rm -f "$file"
+				:>"$file"
+			}
+		done
+	)
+	chown rpcuser "$NFS_STATEDIR"
+	echo done
+}
+
+#statd
+start_statd(){
+	echo -n "starting statd: "
+	start-stop-daemon --start --exec "$NFS_STATD" --pidfile "$STATD_PID"
+	echo done
+}
+stop_statd(){
+	echo -n 'stopping statd: '
+	start-stop-daemon --stop --quiet --signal 1 --pidfile "$STATD_PID"
+	echo done
+}
+#----------------------------------------------------------------------
+#
+# supported options:
+#  start
+#  stop
+#  restart: stops and starts mountd
+#FIXME: need to create the /var/lib/nfs/... directories
+case "$1" in
+  start)
+	create_directories
+	start_statd;;
+  stop)
+	stop_statd;;
+  status)
+	status $NFS_STATD
+	exit $?;;
+  restart)
+	$0 stop
+	$0 start;;
+  *)
+	echo "Usage: $0 {start|stop|status|restart}"
+	exit 1;;
+esac
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index c263f14..6e0df7e 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -1,8 +1,8 @@
 #!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          nfs-kernel-server
-# Required-Start:    $remote_fs $portmap hwclock
-# Required-Stop:     $remote_fs $portmap hwclock
+# Required-Start:    $remote_fs nfs-common $portmap hwclock
+# Required-Stop:     $remote_fs nfs-common $portmap hwclock
 # Default-Start:     2 3 4 5
 # Default-Stop:      0 1 6
 # Short-Description: Kernel NFS server support
@@ -24,8 +24,6 @@ test -r /etc/default/nfsd && . /etc/default/nfsd
 # Location of executables:
 test -x "$NFS_MOUNTD" || NFS_MOUNTD=/usr/sbin/rpc.mountd
 test -x "$NFS_NFSD" || NFS_NFSD=/usr/sbin/rpc.nfsd
-test -x "$NFS_STATD" || NFS_STATD=/usr/sbin/rpc.statd
-test -z "$STATD_PID" && STATD_PID=/var/run/rpc.statd.pid
 #
 # The user mode program must also exist (it just starts the kernel
 # threads using the kernel module code).
@@ -36,34 +34,9 @@ test -x "$NFS_NFSD" || exit 0
 # ridiculous 99
 test "$NFS_SERVERS" != "" && test "$NFS_SERVERS" -gt 0 && test "$NFS_SERVERS" -lt 100 || NFS_SERVERS=8
 #
-# The default state directory is /var/lib/nfs
-test -n "$NFS_STATEDIR" || NFS_STATEDIR=/var/lib/nfs
-#
 #----------------------------------------------------------------------
 # Startup and shutdown functions.
 #  Actual startup/shutdown is at the end of this file.
-#directories
-create_directories(){
-	echo -n 'creating NFS state directory: '
-	mkdir -p "$NFS_STATEDIR"
-	(	cd "$NFS_STATEDIR"
-		umask 077
-		mkdir -p sm sm.bak
-		test -w sm/state || {
-			rm -f sm/state
-			:>sm/state
-		}
-		umask 022
-		for file in xtab etab smtab rmtab
-		do
-			test -w "$file" || {
-				rm -f "$file"
-				:>"$file"
-			}
-		done
-	)
-	echo done
-}
 #mountd
 start_mountd(){
 	echo -n 'starting mountd: '
@@ -124,17 +97,6 @@ stop_nfsd(){
 	fi
 }
 
-#statd
-start_statd(){
-	echo -n "starting statd: "
-	start-stop-daemon --start --exec "$NFS_STATD" --pidfile "$STATD_PID"
-	echo done
-}
-stop_statd(){
-	echo -n 'stopping statd: '
-	start-stop-daemon --stop --quiet --signal 1 --pidfile "$STATD_PID"
-	echo done
-}
 #----------------------------------------------------------------------
 #
 # supported options:
@@ -144,13 +106,11 @@ stop_statd(){
 #  restart: stops and starts mountd
 #FIXME: need to create the /var/lib/nfs/... directories
 case "$1" in
-  start)	create_directories
+  start)
 	start_nfsd "$NFS_SERVERS"
 	start_mountd
-	start_statd
 	test -r /etc/exports && exportfs -a;;
   stop)	exportfs -ua
-	stop_statd
 	stop_mountd
 	stop_nfsd;;
   status)
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
index ea49146..cbfb7c1 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
@@ -9,14 +9,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
 DEPENDS = "libcap libnfsidmap libevent util-linux sqlite3"
-RDEPENDS_${PN} = "rpcbind"
+RDEPENDS_${PN}-client = "rpcbind"
+RDEPENDS_${PN} = "${PN}-client"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
+inherit useradd
+
+USERADD_PACKAGES = "${PN}-client"
+USERADD_PARAM_${PN}-client = "-d /var/lib/nfs -r -s /bin/false rpcuser"
+
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.bz2 \
            file://0001-configure-Allow-to-explicitly-disable-nfsidmap.patch \
            file://nfs-utils-1.0.6-uclibc.patch \
            file://nfs-utils-1.2.3-sm-notify-res_init.patch \
            file://nfsserver \
+           file://nfscommon \
            file://nfs-utils.conf \
            file://nfs-server.service \
            file://nfs-mountd.service \
@@ -30,15 +37,16 @@ PARALLEL_MAKE = ""
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
 
+INITSCRIPT_PACKAGES = "${PN} ${PN}-client"
 INITSCRIPT_NAME = "nfsserver"
-# The server has no dependencies at the user run levels, so just put
-# it in at the default levels.  It must be terminated before the network
-# in the shutdown levels, but that works fine.
 INITSCRIPT_PARAMS = "defaults"
+INITSCRIPT_NAME_${PN}-client = "nfscommon"
+INITSCRIPT_PARAMS_${PN}-client = "start 44 S ."
 
 inherit autotools update-rc.d systemd
 
-SYSTEMD_SERVICE_${PN} = "nfs-server.service nfs-mountd.service nfs-statd.service"
+SYSTEMD_SERVICE_${PN} = "nfs-server.service nfs-mountd.service"
+SYSTEMD_SERVICE_${PN}-client = "nfs-statd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 # --enable-uuid is need for cross-compiling
@@ -60,7 +68,13 @@ PACKAGECONFIG[nfsidmap] = "--enable-nfsidmap,--disable-nfsidmap,keyutils"
 INHIBIT_AUTO_STAGE = "1"
 
 PACKAGES =+ "${PN}-client ${PN}-stats"
-FILES_${PN}-client = "${base_sbindir}/*mount.nfs*"
+FILES_${PN}-client = "${base_sbindir}/*mount.nfs* ${sbindir}/*statd \
+		      ${sbindir}/rpc.idmapd ${sbindir}/sm-notify \
+		      ${sbindir}/showmount ${sbindir}/nfsstat \
+		      ${localstatedir}/lib/nfs \
+		      ${sysconfdir}/nfs-utils.conf \
+		      ${sysconfdir}/init.d/nfscommon \
+		      ${systemd_unitdir}/system/nfs-statd.service"
 FILES_${PN}-stats = "${sbindir}/mountstats ${sbindir}/nfsiostat"
 RDEPENDS_${PN}-stats = "python"
 
@@ -74,6 +88,7 @@ do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
 	install -d ${D}${localstatedir}/lib/nfs/statd
 	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
+	install -m 0755 ${WORKDIR}/nfscommon ${D}${sysconfdir}/init.d/nfscommon
 
 	install -m 0755 ${WORKDIR}/nfs-utils.conf ${D}${sysconfdir}
 	install -d ${D}${systemd_unitdir}/system
-- 
1.8.1.2


