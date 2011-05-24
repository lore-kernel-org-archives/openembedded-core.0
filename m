Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QOsxu-0004Zk-NQ for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 16:52:10 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QOsv1-0002RR-DY
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 16:49:11 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 24 May 2011 15:49:10 +0100
Message-ID: <1306248550.2525.196.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] rootfs_ipk: issue a diagnostic if rootfs is declared read-only and not all maintainer scripts could be applied offline
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
X-List-Received-Date: Tue, 24 May 2011 14:52:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/rootfs_ipk.bbclass |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 4c8088b..99584eb 100644
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
1.7.1





