Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QP9hD-0002Mz-7N
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 10:44:04 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2011 01:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,266,1304319600"; 
   d="scan'208";a="1223601"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 01:40:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2011 01:40:40 -0700
Message-Id: <5e9becaa6ba8a0302e3bb91bff0d580127433918.1306312621.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
Cc: Phil Blundell <philb@gnu.org>
Subject: [Updated Consolidated Pull 18/19] rootfs_ipk: issue a diagnostic if rootfs is declared read-only and not all maintainer scripts could be applied offline
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 May 2011 08:44:04 -0000

From: Phil Blundell <pb@pbcl.net>

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/rootfs_ipk.bbclass |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 5727d15..edd84fb 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -54,17 +54,27 @@ fakeroot rootfs_ipk_do_rootfs () {
 	${OPKG_POSTPROCESS_COMMANDS}
 	${ROOTFS_POSTINSTALL_COMMAND}
 	
+	runtime_script_required=0
 	for i in ${IMAGE_ROOTFS}${opkglibdir}/info/*.preinst; do
 		if [ -f $i ] && ! sh $i; then
+		     	runtime_script_required=1
 			opkg-cl ${IPKG_ARGS} flag unpacked `basename $i .preinst`
 		fi
 	done
 	for i in ${IMAGE_ROOTFS}${opkglibdir}/info/*.postinst; do
 		if [ -f $i ] && ! sh $i configure; then
+		     	runtime_script_required=1
 			opkg-cl ${IPKG_ARGS} flag unpacked `basename $i .postinst`
 		fi
 	done
 
+	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
+		if [ $runtime_script_required -eq 1 ]; then
+			echo "Some packages could not be configured offline and rootfs is read-only."
+			exit 1
+		fi
+	fi
+
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}
 	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
 
-- 
1.7.3.4



