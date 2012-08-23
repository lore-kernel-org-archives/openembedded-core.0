Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1T4Mho-0002J2-C6
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 03:59:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7N1lP7X019084
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 18:47:25 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 22 Aug 2012 18:47:25 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Aug 2012 20:47:23 -0500
Message-ID: <eef91770e809fcde924c197427cf4e1e956a29ae.1345686284.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1345686284.git.peter.seebach@windriver.com>
References: <cover.1345686284.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] runqemu-export-rootfs and friends: don't put pseudo db in target fs
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
X-List-Received-Date: Thu, 23 Aug 2012 01:59:32 -0000
Content-Type: text/plain

In a few places, we have scripts which use <rootfs>/var/pseudo for
the pseudo state directory controlling a given filesystem. This
seems possibly risky because it means that stuff running under
qemu or whatnot could wipe out the data being used to handle that
rootfs. Move this to:
  <rootfs>/../pseudo_state_$(basename $rootfs)
to avoid problems.

This also solves at least one case (not directly hit by yocto's
tree) wherein you could end up trying to remove a rootfs while
pseudo was using a database inside that rootfs, and thus the
remove would fail.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 .../installer/adt-installer/scripts/extract_rootfs |    8 ++++----
 scripts/runqemu-export-rootfs                      |    2 +-
 scripts/runqemu-extract-sdk                        |   15 +++++++++------
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/extract_rootfs b/meta/recipes-devtools/installer/adt-installer/scripts/extract_rootfs
index 62dc170..fee463c 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/extract_rootfs
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/extract_rootfs
@@ -28,7 +28,6 @@ extract_rootfs()
   native_sysroot=$3
   target_sysroot=$2
   PSEUDO_COMMAND="$native_sysroot/usr/bin/pseudo"
-  PSEUDO_OPTS="-P $natvie_sysroot/usr"
   TAR_OPTS="-xjf"
   PSEUDO_OPTS="-P $native_sysroot/usr"
 
@@ -46,9 +45,10 @@ extract_rootfs()
     mkdir -p "$target_sysroot"
   fi
 
-  mkdir -p "$target_sysroot/var/pseudo"
-  touch "$target_sysroot/var/pseudo/pseudo.pid"
-  PSEUDO_LOCALSTATEDIR="$target_sysroot/var/pseudo"
+  pseudo_state_dir="$target_sysroot/../pseudo_state_$(basename "$target_sysroot")"
+  mkdir -p "$pseudo_state_dir"
+  touch "$pseudo_state_dir/pseudo.pid"
+  PSEUDO_LOCALSTATEDIR="$pseudo_state_dir"
   export PSEUDO_LOCALSTATEDIR
 
   echo_info "Extracting rootfs: $1, using pseudo..."
diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index f8213ba..0e0d32c 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -68,7 +68,7 @@ NFSPID=~/.runqemu-sdk/nfs$NFS_INSTANCE.pid
 MOUNTPID=~/.runqemu-sdk/mount$NFS_INSTANCE.pid
 
 PSEUDO_OPTS="-P $OECORE_NATIVE_SYSROOT/usr"
-PSEUDO_LOCALSTATEDIR="$NFS_EXPORT_DIR/var/pseudo"
+PSEUDO_LOCALSTATEDIR="$NFS_EXPORT_DIR/../pseudo_state/$(basename $NFS_EXPORT_DIR)"
 export PSEUDO_LOCALSTATEDIR
 
 if [ ! -d "$PSEUDO_LOCALSTATEDIR" ]; then
diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
index 4b52475..88fdf0d 100755
--- a/scripts/runqemu-extract-sdk
+++ b/scripts/runqemu-extract-sdk
@@ -73,15 +73,18 @@ if [ ! -d "$SDK_ROOTFS_DIR" ]; then
 	mkdir -p "$SDK_ROOTFS_DIR"
 fi
 
-if [ -e "$SDK_ROOTFS_DIR/var/pseudo" ]; then
-	echo "Error: $SDK_ROOTFS_DIR/var/pseudo already exists!"
-	echo "Please delete the entire rootfs tree manually if this is really what you want"
+pseudo_state_dir="$SDK_ROOTFS_DIR/../pseudo_state_$(basename "$SDK_ROOTFS_DIR")"
+
+if [ -e "$pseudo_state_dir" ]; then
+	echo "Error: $pseudo_state_dir already exists!"
+	echo "Please delete the rootfs tree and pseudo directory manually"
+        echo "if this is really what you want."
 	exit 1
 fi
 
-mkdir -p "$SDK_ROOTFS_DIR/var/pseudo"
-touch "$SDK_ROOTFS_DIR/var/pseudo/pseudo.pid"
-PSEUDO_LOCALSTATEDIR="$SDK_ROOTFS_DIR/var/pseudo"
+mkdir -p "$pseudo_state_dir"
+touch "$pseudo_state_dir/pseudo.pid"
+PSEUDO_LOCALSTATEDIR="$pseudo_state_dir
 export PSEUDO_LOCALSTATEDIR
 
 echo "Extracting rootfs tarball using pseudo..."
-- 
1.7.0.4



