Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPxRO-0006KL-9C
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 18:00:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Apr 2013 08:42:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,447,1363158000"; d="scan'208";a="284331500"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.51])
	by azsmga001.ch.intel.com with ESMTP; 10 Apr 2013 08:42:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2013 16:42:26 +0100
Message-Id: <57d1ea9b66763521113f063e3f3f0b10817dd695.1365608262.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365608262.git.paul.eggleton@linux.intel.com>
References: <cover.1365608262.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1365608262.git.paul.eggleton@linux.intel.com>
References: <cover.1365608262.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] rpm-postinsts: avoid errors during boot with read-only-rootfs enabled
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
X-List-Received-Date: Wed, 10 Apr 2013 16:00:26 -0000
X-List-Received-Date: Wed, 10 Apr 2013 16:00:26 -0000

* If /etc/rpm-postinsts doesn't exist, don't error
* If deleting the script errors, don't bother printing it (this will
  always happen if the root filesystem is read-only)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm-postinsts.bb |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm-postinsts.bb b/meta/recipes-devtools/rpm/rpm-postinsts.bb
index 0a62da0..fb05ad6 100644
--- a/meta/recipes-devtools/rpm/rpm-postinsts.bb
+++ b/meta/recipes-devtools/rpm/rpm-postinsts.bb
@@ -32,7 +32,10 @@ do_install() {
 	i=\$i
 	cat > ${D}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << EOF
 #!/bin/sh
-for i in \`ls /etc/rpm-postinsts/\`; do
+
+. /etc/default/rcS
+
+[ -d /etc/rpm-postinsts ] && for i in \`ls /etc/rpm-postinsts/ \`; do
 	i=/etc/rpm-postinsts/$i
 	echo "Running postinst $i..."
 	if [ -f $i ] && $i ${REDIRECT_CMD}; then
@@ -41,7 +44,7 @@ for i in \`ls /etc/rpm-postinsts/\`; do
 		echo "ERROR: postinst $i failed."
 	fi
 done
-rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
+rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts 2>/dev/null
 EOF
 	chmod 0755 ${D}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 }
-- 
1.7.10.4



