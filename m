Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BCD066AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 18:11:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Jul 2016 11:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,364,1464678000"; d="scan'208";a="846406541"
Received: from yocto-dev86.jf.intel.com ([10.7.198.60])
	by orsmga003.jf.intel.com with ESMTP; 14 Jul 2016 11:11:47 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 11:12:40 -0700
Message-Id: <20160714181240.11728-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] systemd: allow add users to groups in rootfs postprocess
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
X-List-Received-Date: Thu, 14 Jul 2016 18:11:50 -0000

Currently the functionality checks for the "u" and "g" flags to create users and
groups, but not the "m" flag to add users to groups. This change first checks to
be sure that the users and groups are created, creates them if necessary, then
adds the user to the group.

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index db8b551..b38b6a5 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -45,6 +45,15 @@ systemd_create_users () {
 			[ "$id" != "-" ] && groupadd_params="$groupadd_params --gid $id"
 			groupadd_params="$groupadd_params --system $name"
 			eval groupadd --root ${IMAGE_ROOTFS} $groupadd_params || true
+		elif [ "$type" = "m" ]; then
+			group=$id
+			if [ ! `grep -q "^${group}:" ${IMAGE_ROOTFS}${sysconfdir}/group` ]; then
+				eval groupadd --root ${IMAGE_ROOTFS} --system $group
+			fi
+			if [ ! `grep -q "^${name}:" ${IMAGE_ROOTFS}${sysconfdir}/passwd` ]; then
+				eval useradd --root ${IMAGE_ROOTFS} --shell /sbin/nologin --system $name
+			fi
+			eval usermod --root ${IMAGE_ROOTFS} -a -G $group $name
 		fi
 		done
 	done
-- 
2.9.0


