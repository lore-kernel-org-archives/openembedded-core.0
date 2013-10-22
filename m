Return-Path: <Qiang.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 92C956CF07
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 03:03:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9M33mXs003682
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 20:03:48 -0700 (PDT)
Received: from optiplex-780.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 21 Oct 2013 20:03:48 -0700
From: <qiang.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Oct 2013 11:03:59 +0800
Message-ID: <1382411039-1161-1-git-send-email-qiang.chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] nfs-utils: Stop rpc.statd correctly
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
X-List-Received-Date: Tue, 22 Oct 2013 03:03:47 -0000
Content-Type: text/plain

From: Qiang Chen <qiang.chen@windriver.com>

An incorrect process name in the nfsserver initscript prevented
rpc.statd from being shut down.

root@qemux86-64:~# /etc/init.d/nfsserver start
creating NFS state directory: done
starting 8 nfsd kernel threads: done
starting mountd: done
starting statd: done

root@qemux86-64:~# ps | grep rpc.statd
  650 root     10532 S    /usr/sbin/rpc.statd
  654 root      4720 S    grep rpc.statd

root@qemux86-64:~# /etc/init.d/nfsserver stop
stopping statd: done
stopping mountd: done
stopping nfsd: done

root@qemux86-64:~# ps | grep rpc.statd
  650 root     10532 S    /usr/sbin/rpc.statd
  662 root      4720 S    grep rpc.statd

As this daemon drops a pid file,simply use that instead.
Also add some initialization checks so the daemons are not
left partially started in the absence of kernel nfsd support.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
---
 .../nfs-utils/nfs-utils/nfsserver                  |   18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index 1ac6fec..8ee8d0b 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -25,6 +25,7 @@ test -r /etc/default/nfsd && . /etc/default/nfsd
 test -x "$NFS_MOUNTD" || NFS_MOUNTD=/usr/sbin/rpc.mountd
 test -x "$NFS_NFSD" || NFS_NFSD=/usr/sbin/rpc.nfsd
 test -x "$NFS_STATD" || NFS_STATD=/usr/sbin/rpc.statd
+test -z "$STATD_PID" && STATD_PID=/var/run/rpc.statd.pid
 #
 # The user mode program must also exist (it just starts the kernel
 # threads using the kernel module code).
@@ -77,6 +78,17 @@ stop_mountd(){
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
@@ -115,14 +127,12 @@ stop_nfsd(){
 #statd
 start_statd(){
 	echo -n "starting statd: "
-	start-stop-daemon --start --exec "$NFS_STATD"
+	start-stop-daemon --start --exec "$NFS_STATD" --pidfile "$STATD_PID"
 	echo done
 }
 stop_statd(){
-	# WARNING: this kills any process with the executable
-	# name 'statd'.
 	echo -n 'stopping statd: '
-	start-stop-daemon --stop --quiet --signal 1 --name statd
+	start-stop-daemon --stop --quiet --signal 1 --pidfile "$STATD_PID"
 	echo done
 }
 #----------------------------------------------------------------------
-- 
1.7.9.5


