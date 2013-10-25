Return-Path: <Qiang.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 837866D3C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 06:48:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9P6mgRT004734
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 23:48:42 -0700 (PDT)
Received: from optiplex-780.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 24 Oct 2013 23:48:41 -0700
From: <qiang.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Oct 2013 14:49:11 +0800
Message-ID: <1382683751-1609-1-git-send-email-qiang.chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] nfs-utils: nfsserver restart should kill and recreate nfsd kernel threads
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
X-List-Received-Date: Fri, 25 Oct 2013 06:48:41 -0000
Content-Type: text/plain

From: Qiang Chen <qiang.chen@windriver.com>

nfsserver restart without killing kernel threads worked when portmap
was the rpc publishing process and portmap was restarted.
When rpcbind replaces portmap, nfsserver restart in this way does not
work after an rpcbind restart.

Steps to reproduce:
1). Make ext3 filesystem image on local host.
cd /root
dd if=/dev/zero of=test bs=1024K count=50
mkfs.ext3 -F test

2). runqemu qemux86-64
mkdir /mnt/wrtest
mount -t ext3 -o loop test /mnt/wrtest
echo "/mnt/wrtest *(sync,rw,no_subtree_check,no_root_squash)" > /etc/exports
/etc/init.d/rpcbind restart
/etc/init.d/nfsserver restart
showmount -e localhost
mkdir wrtest
mount -t nfs localhost:/mnt/wrtest wrtest

mount: mounting localhost:/mnt/wrtest on wrtest failed: Connection refused

Modifying the nfsserver script to kill and restart kernel threads on
restart makes the problem go away and is consistent with current
RHEL/SUSE and Ubuntu/Debian mechanisms of handling the nfs server.

Signed-off-by: Rich Dubielzig <rich.dubielzig@windriver.com>
Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
---
 .../nfs-utils/nfs-utils/nfsserver                  |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index 8ee8d0b..d7cf6e0 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -161,14 +161,9 @@ status)
 	[ $RETVAL -eq 0 ] && exit $rval
 	exit $RETVAL;;
 reload)	test -r /etc/exports && exportfs -r;;
-restart)exportfs -ua
-	stop_mountd
-	stop_statd
-	# restart does not restart the kernel threads,
-	# only the user mode processes
-	start_mountd
-	start_statd
-	test -r /etc/exports && exportfs -a;;
+restart)
+	$0 stop
+	$0 start;;
 *)	echo "Usage: $0 {start|stop|status|reload|restart}"
 	exit 1;;
 esac
-- 
1.7.9.5


