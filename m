Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TJXQ9-0000qY-2S
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 00:28:01 +0200
Received: from localhost (m8a2036d0.tmodns.net [208.54.32.138])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 7C08C30434
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2012 18:14:55 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 15:13:52 -0700
Message-Id: <bc5136a3e5da99e83619036a397d619690ccff2e.1349302333.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349302333.git.scott.a.garman@intel.com>
References: <cover.1349302333.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1349302333.git.scott.a.garman@intel.com>
References: <cover.1349302333.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 7C08C30434.3B687
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 2/3] runqemu-export-rootfs: improve rpcbind error detection
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 22:28:01 -0000

mountd requires rpcbind or portmap. Check that one of these
services is running before doing anything else, and report
a user-friendly error when they are not found.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu-export-rootfs |   33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index ca79af3..90edc8a 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -100,6 +100,21 @@ fi
 # See how we were called.
 case "$1" in
   start)
+	PORTMAP_RUNNING=`ps -ef | grep portmap | grep -v grep`
+	RPCBIND_RUNNING=`ps -ef | grep rpcbind | grep -v grep`
+	if [[ "x$PORTMAP_RUNNING" = "x" && "x$RPCBIND_RUNNING" = "x" ]]; then
+		echo "======================================================="
+		echo "Error: neither rpcbind nor portmap appear to be running"
+		echo "Please install and start one of these services first"
+		echo "======================================================="
+		echo "Tip: for recent Ubuntu hosts, run:"
+		echo "  sudo apt-get install rpcbind"
+		echo "Then add OPTIONS=\"-i -w\"  to /etc/default/rpcbind and run"
+		echo "  sudo service portmap restart"
+
+		exit 1
+	fi
+
 	echo "Starting User Mode rpc.mountd"
 	echo "  $PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/rpc.mountd $MOUNTD_OPTS"
 	$PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/rpc.mountd $MOUNTD_OPTS
@@ -107,25 +122,25 @@ case "$1" in
 		echo "====================="
 		echo "Error starting MOUNTD"
 		echo "====================="
-		ps -ef | grep -v grep | grep rpcbind 2>&1 > /dev/null
-		if [ $? = 0 ] ; then
+		if [ ! "x$RPCBIND_RUNNING" = "x" ] ; then
 			echo "  If you see an error above that says:"
 			echo "    RPC: Authentication error; why = Client credential too weak"
-			echo "  You need to change the startup of rpcbind"
-			echo "  on your host by doing the following as root:"
+			echo "  You need to add the -i option when running rpcbind"
 			echo "==============================================="
-			echo "  According to /etc/sysconfig/rpcbind, then "
-			echo "    echo RPCBIND_ARGS=-i >> /etc/sysconfig/rpcbind"
+			echo "For recent Fedora/RedHat hosts:"
+			echo "Add RPCBIND_ARGS=-i to /etc/sysconfig/rpcbind"
 			echo "  or"
-			echo "    echo RPCBIND_OPTIONS=-i >> /etc/sysconfig/rpcbind"
-			echo "    /etc/init.d/rpcbind restart"
+			echo "Add RPCBIND_OPTIONS=-i to /etc/sysconfig/rpcbind"
+			echo "Then run as root: /etc/init.d/rpcbind restart"
 			echo "==============================================="
-			echo "For Ubuntu 11.10 hosts"
+			echo "For recent Debian/Ubuntu hosts:"
 			echo "Add OPTIONS=\"-i -w\"  to /etc/default/rpcbind"
 			echo "sudo service portmap restart"
 		fi
+
 		exit 1
 	fi
+
 	echo "Starting User Mode nfsd"
 	echo "  $PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/rpc.nfsd $NFSD_OPTS"
 	$PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/rpc.nfsd $NFSD_OPTS
-- 
1.7.9.5



