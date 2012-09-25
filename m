Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGTvd-0000Bf-25
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 14:07:53 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TGTjF-0005L3-U3
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 13:55:06 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Sep 2012 12:55:04 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348574105.31293.69.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] module.bbclass: Move do_make_scripts() to module-base
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
X-List-Received-Date: Tue, 25 Sep 2012 12:07:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It's sometimes useful to have this function available to recipes which
don't wish to use module.bbclass for whatever reason.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/module-base.bbclass |   11 +++++++++++
 meta/classes/module.bbclass      |   11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 9379bf8..210c47c 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -26,3 +26,14 @@ KERNEL_AR = "${HOST_PREFIX}ar${KERNEL_ARSUFFIX} ${HOST_AR_KERNEL_ARCH}"
 
 # kernel modules are generally machine specific
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+#
+# Ensure the hostprogs are available for module compilation. Modules that
+# inherit this recipe and override do_compile() should be sure to call
+# do_make_scripts() or ensure the scripts are built independently.
+#
+do_make_scripts() {
+	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
+	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+	           -C ${STAGING_KERNEL_DIR} scripts
+}
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 91628e4..c721202 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -3,17 +3,6 @@ DEPENDS += "virtual/kernel"
 
 inherit module-base
 
-#
-# Ensure the hostprogs are available for module compilation. Modules that
-# inherit this recipe and override do_compile() should be sure to call
-# do_make_scripts() or ensure the scripts are built independently.
-#
-do_make_scripts() {
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
-	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
-	           -C ${STAGING_KERNEL_DIR} scripts
-}
-
 addtask make_scripts before do_compile
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 do_make_scripts[deptask] = "do_populate_sysroot"
-- 
1.7.10.4





