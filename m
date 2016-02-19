Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CC63775D4B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 16:45:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 19 Feb 2016 08:45:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,471,1449561600"; d="scan'208";a="749474477"
Received: from bitbang.jf.intel.com ([10.7.199.151])
	by orsmga003.jf.intel.com with ESMTP; 19 Feb 2016 08:45:34 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 08:45:25 -0800
Message-Id: <1455900325-26957-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455809929-37425-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1455809929-37425-1-git-send-email-randy.e.witt@linux.intel.com>
Subject: [PATCH v2] signing-keys: Make signing keys the only publisher of keys
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
X-List-Received-Date: Fri, 19 Feb 2016 16:45:34 -0000

Previously the keys were put into the os-release package. The package
indexing code was also deploying the keys rather than only using the keys.

This change makes signing-keys.bb the only publisher of the keys and also
uses standard tasks that already have sstate.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/sign_package_feed.bbclass     |  9 +----
 meta/classes/sign_rpm.bbclass              | 11 ++++--
 meta/lib/oe/package_manager.py             | 10 -----
 meta/recipes-core/meta/signing-keys.bb     | 61 +++++++++++++++++++++---------
 meta/recipes-core/os-release/os-release.bb | 11 ------
 5 files changed, 52 insertions(+), 50 deletions(-)

diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index 63ca02f..e1ec82e 100644
--- a/meta/classes/sign_package_feed.bbclass
+++ b/meta/classes/sign_package_feed.bbclass
@@ -27,12 +27,7 @@ python () {
     for var in ('PACKAGE_FEED_GPG_NAME', 'PACKAGE_FEED_GPG_PASSPHRASE_FILE'):
         if not d.getVar(var, True):
             raise_sanity_error("You need to define %s in the config" % var, d)
-
-    # Set expected location of the public key
-    d.setVar('PACKAGE_FEED_GPG_PUBKEY',
-             os.path.join(d.getVar('STAGING_ETCDIR_NATIVE', False),
-                                   'PACKAGE-FEED-GPG-PUBKEY'))
 }
 
-do_package_index[depends] += "signing-keys:do_export_public_keys"
-do_rootfs[depends] += "signing-keys:do_export_public_keys"
+do_package_index[depends] += "signing-keys:do_deploy"
+do_rootfs[depends] += "signing-keys:do_populate_sysroot"
diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index 8b59bac..c21e3f0 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -28,8 +28,11 @@ python () {
             raise_sanity_error("You need to define %s in the config" % var, d)
 
     # Set the expected location of the public key
-    d.setVar('RPM_GPG_PUBKEY', os.path.join(d.getVar('STAGING_ETCDIR_NATIVE', False),
-                                            'RPM-GPG-PUBKEY'))
+    d.setVar('RPM_GPG_PUBKEY', os.path.join(d.getVar('STAGING_DIR_TARGET', False),
+                                            d.getVar('sysconfdir', False),
+                                            'pki',
+                                            'rpm-gpg',
+                                            'RPM-GPG-KEY-${DISTRO_VERSION}'))
 }
 
 python sign_rpm () {
@@ -44,5 +47,5 @@ python sign_rpm () {
                      d.getVar('RPM_GPG_PASSPHRASE_FILE', True))
 }
 
-do_package_index[depends] += "signing-keys:do_export_public_keys"
-do_rootfs[depends] += "signing-keys:do_export_public_keys"
+do_package_index[depends] += "signing-keys:do_deploy"
+do_rootfs[depends] += "signing-keys:do_populate_sysroot"
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index b30a4da..5cd43e9 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -144,16 +144,6 @@ class RpmIndexer(Indexer):
                 signer.detach_sign(repomd,
                                    self.d.getVar('PACKAGE_FEED_GPG_NAME', True),
                                    self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True))
-        # Copy pubkey(s) to repo
-        distro_version = self.d.getVar('DISTRO_VERSION', True) or "oe.0"
-        if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
-            shutil.copy2(self.d.getVar('RPM_GPG_PUBKEY', True),
-                         os.path.join(self.deploy_dir,
-                                      'RPM-GPG-KEY-%s' % distro_version))
-        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
-            shutil.copy2(self.d.getVar('PACKAGE_FEED_GPG_PUBKEY', True),
-                         os.path.join(self.deploy_dir,
-                                      'REPODATA-GPG-KEY-%s' % distro_version))
 
 
 class OpkgIndexer(Indexer):
diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index d7763c6..1d0e834 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -3,37 +3,62 @@
 
 DESCRIPTION = "Make public keys of the signing keys available"
 LICENSE = "MIT"
-PACKAGES = ""
-
-do_fetch[noexec] = "1"
-do_unpack[noexec] = "1"
-do_patch[noexec] = "1"
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
-do_install[noexec] = "1"
-do_package[noexec] = "1"
-do_packagedata[noexec] = "1"
-do_package_write_ipk[noexec] = "1"
-do_package_write_rpm[noexec] = "1"
-do_package_write_deb[noexec] = "1"
-do_populate_sysroot[noexec] = "1"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+
+inherit allarch deploy
 
 EXCLUDE_FROM_WORLD = "1"
+INHIBIT_DEFAULT_DEPS = "1"
+
+PACKAGES =+ "${PN}-rpm ${PN}-packagefeed"
 
+FILES_${PN}-rpm = "${sysconfdir}/pki/rpm-gpg"
+FILES_${PN}-packagefeed = "${sysconfdir}/pki/packagefeed-gpg"
 
-python do_export_public_keys () {
+python do_get_public_keys () {
     from oe.gpg_sign import get_signer
 
     if d.getVar("RPM_SIGN_PACKAGES", True):
         # Export public key of the rpm signing key
         signer = get_signer(d, d.getVar('RPM_GPG_BACKEND', True))
-        signer.export_pubkey(d.getVar('RPM_GPG_PUBKEY', True),
+        signer.export_pubkey(os.path.join(d.expand('${B}'), 'rpm-key'),
                              d.getVar('RPM_GPG_NAME', True))
 
     if d.getVar('PACKAGE_FEED_SIGN', True) == '1':
         # Export public key of the feed signing key
         signer = get_signer(d, d.getVar('PACKAGE_FEED_GPG_BACKEND', True))
-        signer.export_pubkey(d.getVar('PACKAGE_FEED_GPG_PUBKEY', True),
+        signer.export_pubkey(os.path.join(d.expand('${B}'), 'pf-key'),
                              d.getVar('PACKAGE_FEED_GPG_NAME', True))
 }
-addtask do_export_public_keys before do_build
+do_get_public_keys[cleandirs] = "${B}"
+addtask get_public_keys before do_install
+
+do_install () {
+    if [ -f "${B}/rpm-key" ]; then
+        install -D -m 0644 "${B}/rpm-key" "${D}${sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-${DISTRO_VERSION}"
+    fi
+    if [ -f "${B}/pf-key" ]; then
+        install -D -m 0644 "${B}/pf-key" "${D}${sysconfdir}/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-${DISTRO_VERSION}"
+    fi
+}
+
+sysroot_stage_all_append () {
+    sysroot_stage_dir ${D}${sysconfdir}/pki ${SYSROOT_DESTDIR}${sysconfdir}/pki
+}
+
+do_deploy () {
+    if [ -f "${B}/rpm-key" ]; then
+        install -D -m 0644 "${B}/rpm-key" "${DEPLOYDIR}/RPM-GPG-KEY-${DISTRO_VERSION}"
+    fi
+    if [ -f "${B}/pf-key" ]; then
+        install -D -m 0644 "${B}/pf-key" "${DEPLOYDIR}/PACKAGEFEED-GPG-KEY-${DISTRO_VERSION}"
+    fi
+}
+do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_RPM}"
+# cleandirs should possibly be in deploy.bbclass but we need it
+do_deploy[cleandirs] = "${DEPLOYDIR}"
+# clear stamp-extra-info since MACHINE is normally put there by deploy.bbclass
+do_deploy[stamp-extra-info] = ""
+addtask deploy after do_get_public_keys
diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index df19ca2..58364ea 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -30,21 +30,10 @@ python do_compile () {
             value = d.getVar(field, True)
             if value:
                 f.write('{0}="{1}"\n'.format(field, value))
-    if d.getVar('RPM_SIGN_PACKAGES', True) == '1':
-        rpm_gpg_pubkey = d.getVar('RPM_GPG_PUBKEY', True)
-        bb.utils.mkdirhier('${B}/rpm-gpg')
-        distro_version = d.getVar('DISTRO_VERSION', True) or "oe.0"
-        shutil.copy2(rpm_gpg_pubkey, d.expand('${B}/rpm-gpg/RPM-GPG-KEY-%s' % distro_version))
 }
 do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
-do_compile[depends] += "signing-keys:do_export_public_keys"
 
 do_install () {
     install -d ${D}${sysconfdir}
     install -m 0644 os-release ${D}${sysconfdir}/
-
-    if [ -d "rpm-gpg" ]; then
-        install -d "${D}${sysconfdir}/pki"
-        cp -r "rpm-gpg" "${D}${sysconfdir}/pki/"
-    fi
 }
-- 
2.5.0


