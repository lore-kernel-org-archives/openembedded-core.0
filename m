Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SK8FE-00021h-5T
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 15:14:56 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 15:05:19 +0200
Message-Id: <1334667923-13908-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1334667923-13908-1-git-send-email-obi@opendreambox.org>
References: <1334667923-13908-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 1/5] {kernel, module}.bbclass: don't run depmod for module packages during do_rootfs
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
X-List-Received-Date: Tue, 17 Apr 2012 13:14:56 -0000

* depmod already gets executed by pkg_postinst_kernel-image.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/kernel.bbclass |    4 +---
 meta/classes/module.bbclass |    7 +++----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3519e7c..c21ab96 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -276,9 +276,7 @@ fi
 }
 
 pkg_postinst_modules () {
-if [ -n "$D" ]; then
-	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
-else
+if [ -z "$D" ]; then
 	depmod -a
 	update-modules || true
 fi
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 53c16b7..91628e4 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -37,15 +37,14 @@ module_do_install() {
 }
 
 pkg_postinst_append () {
-	if [ -n "$D" ]; then
-		exit 1
-	fi
+if [ -z "$D" ]; then
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



