Return-Path: <Qiang.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1DD66D2B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 05:14:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9M5E91O012303
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 22:14:09 -0700 (PDT)
Received: from optiplex-780.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 21 Oct 2013 22:14:08 -0700
From: <qiang.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Oct 2013 13:14:21 +0800
Message-ID: <1382418861-2658-1-git-send-email-qiang.chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] nfs-utils: modify nfsserver init script indent
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
X-List-Received-Date: Tue, 22 Oct 2013 05:14:08 -0000
Content-Type: text/plain

From: Qiang Chen <qiang.chen@windriver.com>

Using sysvinit testing service status, nfsserver status
allways display as [?] unknown.

This is because sysvinit package check whether service's
init script supporting status function or not by:
grep -qs "\Wstatus)" "$SERVICE"

So, this commit modified the indent for status etc, as
most service's init script does.

Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
---
 .../nfs-utils/nfs-utils/nfsserver                  |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index d7cf6e0..c263f14 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -144,26 +144,26 @@ stop_statd(){
 #  restart: stops and starts mountd
 #FIXME: need to create the /var/lib/nfs/... directories
 case "$1" in
-start)	create_directories
+  start)	create_directories
 	start_nfsd "$NFS_SERVERS"
 	start_mountd
 	start_statd
 	test -r /etc/exports && exportfs -a;;
-stop)	exportfs -ua
+  stop)	exportfs -ua
 	stop_statd
 	stop_mountd
 	stop_nfsd;;
-status)
+  status)
 	status /usr/sbin/rpc.mountd
 	RETVAL=$?
 	status nfsd
 	rval=$?
 	[ $RETVAL -eq 0 ] && exit $rval
 	exit $RETVAL;;
-reload)	test -r /etc/exports && exportfs -r;;
-restart)
+  reload)	test -r /etc/exports && exportfs -r;;
+  restart)
 	$0 stop
 	$0 start;;
-*)	echo "Usage: $0 {start|stop|status|reload|restart}"
+  *)	echo "Usage: $0 {start|stop|status|reload|restart}"
 	exit 1;;
 esac
-- 
1.7.9.5


