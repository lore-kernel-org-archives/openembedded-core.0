Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1Tmwev-0002uO-O9
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 02:16:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBO11wow014142
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 23 Dec 2012 17:01:59 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sun, 23 Dec 2012 17:01:57 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Dec 2012 09:02:04 +0800
Message-ID: <96b27c5fa51c35070dda031c81f9ffaf554292bf.1356310727.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1356310727.git.rongqing.li@windriver.com>
References: <cover.1356310727.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] replace portmap with rpcbind.
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
X-List-Received-Date: Mon, 24 Dec 2012 01:16:53 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Rpcbind has more features, like ipv6 support and nfs4 support;
Redhat, Fedora, debian, Ubuntu are using rpcbind by default.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb |    2 +-
 .../initscripts/initscripts-1.0/mountnfs.sh            |   16 ++++++++--------
 meta/recipes-core/packagegroups/packagegroup-base.bb   |    2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
index 5a4a7e7..84b8e76 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 # util-linux for libblkid
 DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers"
-RDEPENDS_${PN} = "portmap"
+RDEPENDS_${PN} = "rpcbind"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
 PR = "r5"
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
index 82ec7f6..4fffe4e 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          mountnfs
-# Required-Start:    $local_fs $network $portmap
+# Required-Start:    $local_fs $network $rpcbind
 # Required-Stop:
 # Default-Start:     S
 # Default-Stop:
@@ -17,9 +17,9 @@ test -f /etc/fstab && (
 #
 #	Read through fstab line by line. If it is NFS, set the flag
 #	for mounting NFS filesystems. If any NFS partition is found and it
-#	not mounted with the nolock option, we start the portmapper.
+#	not mounted with the nolock option, we start the rpcbind.
 #
-portmap=no
+rpcbind=no
 mount_nfs=no
 mount_smb=no
 mount_ncp=no
@@ -45,7 +45,7 @@ do
 			*nolock*)
 				;;
 			*)
-				portmap=yes
+				rpcbind=yes
 				;;
 		esac
 	fi
@@ -65,12 +65,12 @@ done
 
 exec 0>&1
 
-if test "$portmap" = yes
+if test "$rpcbind" = yes
 then
-	if test -x /sbin/portmap
+	if test -x /usr/sbin/rpcbind
 	then
-		echo -n "Starting portmapper... "
-		start-stop-daemon --start --quiet --exec /sbin/portmap
+		echo -n "Starting rpcbind... "
+		start-stop-daemon --start --quiet --exec /usr/sbin/rpcbind
 		sleep 2
 	fi
 fi
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 347a7e1..b3cdbad 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -328,7 +328,7 @@ RRECOMMENDS_packagegroup-base-cramfs = "\
 #
 SUMMARY_packagegroup-base-nfs = "NFS network filesystem support"
 RDEPENDS_packagegroup-base-nfs = "\
-    portmap"
+    rpcbind"
 
 RRECOMMENDS_packagegroup-base-nfs = "\
     kernel-module-nfs "
-- 
1.7.10.4



