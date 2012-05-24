Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfuW-0002zm-0V
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125514"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:48 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:25 -0700
Message-Id: <663b4be025283a30adb823760ce9d9a056106bcf.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 14/32] {kernel, module}.bbclass: don't run depmod for module packages during do_rootfs
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
X-List-Received-Date: Thu, 24 May 2012 21:49:35 -0000

From: Andreas Oberritter <obi@opendreambox.org>

* depmod already gets executed by pkg_postinst_kernel-image.

* If you build a module using module.bbclass, pkg_postinst returns 1 in
  do_rootfs, causing pkg_postinst to run again on first boot. To improve
  this situation, I copied pkg_postinst from kernel.bbclass to module.bbclass.
  This was rejected by Koen, because he doesn't like the code from
  kernel.bblcass, which uses ${STAGING_DIR_KERNEL}. Richard then suggested
  that calling depmod during do_rootfs wasn't necessary at all, because
  it already gets done by kernel-image.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
1.7.9.5



