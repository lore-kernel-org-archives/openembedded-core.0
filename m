Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMKnJ-0001RE-Uh for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 15:58:41 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMKkY-000503-P1
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 15:55:50 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 17 May 2011 14:55:49 +0100
Message-ID: <1305640549.2429.226.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] rootfs_ipk: respect ONLINE_PACKAGE_MANAGEMENT
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
X-List-Received-Date: Tue, 17 May 2011 13:58:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This makes it work more or less the same way as the current tip of oe
master, except that I didn't copy over the behaviour for O_P_M="add"
because it seemed slightly bogus to me.  

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/rootfs_ipk.bbclass |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 5727d15..c7c8325 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -69,8 +69,16 @@ fakeroot rootfs_ipk_do_rootfs () {
 	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
 
 	${ROOTFS_POSTPROCESS_COMMAND}
-	
-	rm -f ${IMAGE_ROOTFS}${opkglibdir}/lists/*
+
+	case "${ONLINE_PACKAGE_MANAGEMENT}" in
+	none)
+ 		rm -rf ${IMAGE_ROOTFS}${opkglibdir}
+		;;
+
+	*)
+		rm -f ${IMAGE_ROOTFS}${opkglibdir}/lists/*
+		;;
+	esac
 
 	log_check rootfs 	
 }
-- 
1.7.1



