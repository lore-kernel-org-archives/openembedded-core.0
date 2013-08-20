Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB25A6B7D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 03:25:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7K3PtQR006888
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 20:25:55 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 19 Aug 2013 20:25:54 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2013 11:25:43 +0800
Message-ID: <13b92f067594e8aceac11c7964242fafdfb21f8d.1376968627.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1376968627.git.jackie.huang@windriver.com>
References: <cover.1376968627.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] nfs-utils: add init.d/nfsserver status command for LSB compliance
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
X-List-Received-Date: Tue, 20 Aug 2013 03:25:54 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../nfs-utils/nfs-utils/nfsserver                  |   25 ++++++++++++++++++-
 1 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index e460e26..494af2e 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -14,6 +14,8 @@
 #
 # Startup script for nfs-utils
 #
+# Source function library.
+. /etc/init.d/functions
 #
 # The environment variable NFS_SERVERS may be set in /etc/default/nfsd
 # Other control variables may be overridden here too
@@ -23,6 +25,7 @@ test -r /etc/default/nfsd && . /etc/default/nfsd
 test -x "$NFS_MOUNTD" || NFS_MOUNTD=/usr/sbin/rpc.mountd
 test -x "$NFS_NFSD" || NFS_NFSD=/usr/sbin/rpc.nfsd
 test -x "$NFS_STATD" || NFS_STATD=/usr/sbin/rpc.statd
+test -z "$STATD_PID" && STATD_PID=/var/run/rpc.statd.pid
 #
 # The user mode program must also exist (it just starts the kernel
 # threads using the kernel module code).
@@ -75,6 +78,17 @@ stop_mountd(){
 #
 #nfsd
 start_nfsd(){
+        modprobe -q nfsd
+	grep -q nfsd /proc/filesystems || {
+		echo NFS daemon support not enabled in kernel
+		exit 1
+        }
+	grep -q nfsd /proc/mounts || mount -t nfsd nfsd /proc/fs/nfsd
+	grep -q nfsd /proc/mounts || {
+		echo nfsd filesystem could not be mounted at /proc/fs/nfsd
+		exit 1
+        }
+
 	echo -n "starting $1 nfsd kernel threads: "
 	start-stop-daemon --start --exec "$NFS_NFSD" -- "$@"
 	echo done
@@ -113,14 +127,14 @@ stop_nfsd(){
 #statd
 start_statd(){
 	echo -n "starting statd: "
-	start-stop-daemon --start --exec "$NFS_STATD"
+	start-stop-daemon --start --exec "$NFS_STATD" --pidfile "$STATD_PID"
 	echo done
 }
 stop_statd(){
 	# WARNING: this kills any process with the executable
 	# name 'statd'.
 	echo -n 'stopping statd: '
-	start-stop-daemon --stop --quiet --signal 1 --name statd
+	start-stop-daemon --stop --quiet --signal 1 --pidfile "$STATD_PID"
 	echo done
 }
 #----------------------------------------------------------------------
@@ -141,6 +155,13 @@ stop)	exportfs -ua
 	stop_statd
 	stop_mountd
 	stop_nfsd;;
+status)
+	status /usr/sbin/rpc.mountd;
+	RETVAL=$?
+	status nfsd;
+	rval=$?
+	[ $RETVAL -eq 0 ] && exit $rval
+	exit $RETVAL;;
 reload)	test -r /etc/exports && exportfs -r;;
 restart)exportfs -ua
 	stop_mountd
-- 
1.7.4.1


