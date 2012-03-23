Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SB7dR-00087n-Jw
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 17:46:42 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 17:37:37 +0100
Message-Id: <1332520659-12233-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1332520659-12233-1-git-send-email-obi@opendreambox.org>
References: <1332520659-12233-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/4] module.bbclass: sync pkg_post{inst, rm} with kernel.bbclass
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
X-List-Received-Date: Fri, 23 Mar 2012 16:46:42 -0000

* Run depmod when the rootfs gets generated.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/module.bbclass |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 53c16b7..e370b24 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -37,15 +37,16 @@ module_do_install() {
 }
 
 pkg_postinst_append () {
-	if [ -n "$D" ]; then
-		exit 1
-	fi
+if [ -n "$D" ]; then
+	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
+else
 	depmod -a
 	update-modules || true
+fi
 }
 
 pkg_postrm_append () {
-	update-modules || true
+update-modules || true
 }
 
 EXPORT_FUNCTIONS do_compile do_install
-- 
1.7.5.4



