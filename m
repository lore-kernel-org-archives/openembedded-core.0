Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 23A717722D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 20:59:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 May 2016 13:59:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,397,1459839600"; d="scan'208";a="966079879"
Received: from yocto-dev86.jf.intel.com ([10.7.198.60])
	by orsmga001.jf.intel.com with ESMTP; 31 May 2016 13:59:11 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2016 13:59:54 -0700
Message-Id: <1464728394-8841-2-git-send-email-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1464728394-8841-1-git-send-email-stephano.cetola@linux.intel.com>
References: <1464728394-8841-1-git-send-email-stephano.cetola@linux.intel.com>
Subject: [PATCHv3] systemd: allow add users as a rootfs postprocess cmd
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
X-List-Received-Date: Tue, 31 May 2016 20:59:11 -0000

Adding all the users / groups to systemd is only available for readonly
file systems. This change allows users to add them to read / write file
systems as well by specifying:

ROOTFS_POSTPROCESS_COMMAND += "systemd_create_users"

Also, add "--shell /sbin/nologin" to each user's add params.

[ YOCTO #9497 ]

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 43 +++++++++++++++-----------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 95d28af..db8b551 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -21,7 +21,7 @@ ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
 POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 # Set default target for systemd images
 SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "graphical.target", "multi-user.target", d)}'
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; ", "", d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; systemd_create_users;", "", d)}'
 
 ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 
@@ -30,7 +30,25 @@ ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 SSH_DISABLE_DNS_LOOKUP ?= " ssh_disable_dns_lookup ; "
 ROOTFS_POSTPROCESS_COMMAND_append_qemuall = "${SSH_DISABLE_DNS_LOOKUP}"
 
-
+systemd_create_users () {
+	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
+		[ -e $conffile ] || continue
+		grep -v "^#" $conffile | sed -e '/^$/d' | while read type name id comment; do
+		if [ "$type" = "u" ]; then
+			useradd_params="--shell /sbin/nologin"
+			[ "$id" != "-" ] && useradd_params="$useradd_params --uid $id"
+			[ "$comment" != "-" ] && useradd_params="$useradd_params --comment $comment"
+			useradd_params="$useradd_params --system $name"
+			eval useradd --root ${IMAGE_ROOTFS} $useradd_params || true
+		elif [ "$type" = "g" ]; then
+			groupadd_params=""
+			[ "$id" != "-" ] && groupadd_params="$groupadd_params --gid $id"
+			groupadd_params="$groupadd_params --system $name"
+			eval groupadd --root ${IMAGE_ROOTFS} $groupadd_params || true
+		fi
+		done
+	done
+}
 
 #
 # A hook function to support read-only-rootfs IMAGE_FEATURES
@@ -73,27 +91,6 @@ read_only_rootfs_hook () {
 			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
 		fi
 	fi
-
-	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
-	    # Update user database files so that services don't fail for a read-only systemd system
-	    for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
-		[ -e $conffile ] || continue
-		grep -v "^#" $conffile | sed -e '/^$/d' | while read type name id comment; do
-		    if [ "$type" = "u" ]; then
-			useradd_params=""
-			[ "$id" != "-" ] && useradd_params="$useradd_params --uid $id"
-			[ "$comment" != "-" ] && useradd_params="$useradd_params --comment $comment"
-			useradd_params="$useradd_params --system $name"
-			eval useradd --root ${IMAGE_ROOTFS} $useradd_params || true
-		    elif [ "$type" = "g" ]; then
-			groupadd_params=""
-			[ "$id" != "-" ] && groupadd_params="$groupadd_params --gid $id"
-			groupadd_params="$groupadd_params --system $name"
-			eval groupadd --root ${IMAGE_ROOTFS} $groupadd_params || true
-		    fi
-		done
-	    done
-	fi
 }
 
 #
-- 
2.8.2


