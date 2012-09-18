Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TDlhj-0005Tz-T8
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 02:30:20 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Sep 2012 17:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,439,1344236400"; d="scan'208";a="193859690"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.193])
	by azsmga001.ch.intel.com with ESMTP; 17 Sep 2012 17:17:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 17:17:37 -0700
Message-Id: <1347927458-21623-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] rootfs_rpm: add multilib prefix to rpm installed package list
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
X-List-Received-Date: Tue, 18 Sep 2012 00:30:20 -0000

RPM does not name it's packages with the Multilib prefix, but the rootfs_rpm class
keeps track of the Multilib prefixs in a list. Use that list to re-attach the prefix
for use with the license bbclass, buildhistory bbclass will also use this and make
it more accurate between multilib and non-multilib.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/rootfs_rpm.bbclass |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index c0207d8..ad83ffb 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -142,11 +142,18 @@ RPM_QUERY_CMD = '${RPM} --root $INSTALL_ROOTFS_RPM -D "_dbpath ${rpmlibdir}" \
 
 list_installed_packages() {
 	if [ "$1" = "arch" ] ; then
-		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]"
+		GET_LIST=$(${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]")
 	elif [ "$1" = "file" ] ; then
-		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{PACKAGEORIGIN}\n]"
+		GET_LIST=$(${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{PACKAGEORIGIN}\n]")
 	else
-		${RPM_QUERY_CMD} -qa --qf "[%{NAME}\n]"
+		GET_LIST=$(${RPM_QUERY_CMD} -qa --qf "[%{NAME}\n]")
+	fi
+	if [ "x${MULTILIB_PREFIX_LIST}" = "x"]; then
+		echo "$GET_LIST"
+	else
+		for prefix in `echo ${MULTILIB_PREFIX_LIST}`; do
+			echo "$GET_LIST" | sed -e "s/^/$prefix\-/"
+		done
 	fi
 }
 
-- 
1.7.7.6



