Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AE88277122
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 11:57:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Oct 2015 04:57:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,688,1437462000"; d="scan'208";a="812530261"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2015 04:57:43 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 14:57:36 +0300
Message-Id: <1444996657-4301-6-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1444996657-4301-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1444996657-4301-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 5/5] Automatically export public keys used for package(feed) signing
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
X-List-Received-Date: Fri, 16 Oct 2015 11:57:45 -0000

Automatically export public key(s) from the gpg keyring. Adds a new
simple recipe that does the actual task of exporting the keys.  This
patch makes the RPM_GPG_PUBKEY and PACKAGE_FEED_GPG PUBKEY settings
obsolete.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/sign_package_feed.bbclass     |  7 +++++
 meta/classes/sign_rpm.bbclass              |  9 ++++--
 meta/recipes-core/meta/signing-keys.bb     | 45 ++++++++++++++++++++++++++++++
 meta/recipes-core/os-release/os-release.bb |  1 +
 4 files changed, 59 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/meta/signing-keys.bb

diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index 8877d90..4263810 100644
--- a/meta/classes/sign_package_feed.bbclass
+++ b/meta/classes/sign_package_feed.bbclass
@@ -21,4 +21,11 @@ python () {
     for var in ('PACKAGE_FEED_GPG_NAME', 'PACKAGE_FEED_GPG_PASSPHRASE_FILE'):
         if not d.getVar(var, True):
             raise_sanity_error("You need to define %s in the config" % var, d)
+
+    # Set expected location of the public key
+    d.setVar('PACKAGE_FEED_GPG_PUBKEY',
+             os.path.join(d.getVar('STAGING_ETCDIR_NATIVE'),
+                                   'PACKAGE-FEED-GPG-PUBKEY'))
 }
+
+do_package_index[depends] += "signing-keys:do_export_public_keys"
diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index 4da1763..f0c3dc9 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -5,9 +5,6 @@
 #           Path to a file containing the passphrase of the signing key.
 # RPM_GPG_NAME
 #           Name of the key to sign with. May be key id or key name.
-# RPM_GPG_PUBKEY
-#           Path to a file containing the public key (in "armor" format)
-#           corresponding the signing key.
 # GPG_BIN
 #           Optional variable for specifying the gpg binary/wrapper to use for
 #           signing.
@@ -24,6 +21,10 @@ python () {
     for var in ('RPM_GPG_NAME', 'RPM_GPG_PASSPHRASE_FILE'):
         if not d.getVar(var, True):
             raise_sanity_error("You need to define %s in the config" % var, d)
+
+    # Set the expected location of the public key
+    d.setVar('RPM_GPG_PUBKEY', os.path.join(d.getVar('STAGING_ETCDIR_NATIVE'),
+                                            'RPM-GPG-PUBKEY'))
 }
 
 
@@ -68,3 +69,5 @@ python sign_rpm () {
     if rpmsign_wrapper(d, rpms, rpm_gpg_passphrase, rpm_gpg_name) != 0:
         raise bb.build.FuncFailed("RPM signing failed")
 }
+
+do_package_index[depends] += "signing-keys:do_export_public_keys"
diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
new file mode 100644
index 0000000..cc401f3
--- /dev/null
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -0,0 +1,45 @@
+# Copyright (C) 2015 Intel Corporation
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Make public keys of the signing keys available"
+LICENSE = "MIT"
+PACKAGES = ""
+
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_install[noexec] = "1"
+do_package[noexec] = "1"
+do_packagedata[noexec] = "1"
+do_package_write_ipk[noexec] = "1"
+do_package_write_rpm[noexec] = "1"
+do_package_write_deb[noexec] = "1"
+do_populate_sysroot[noexec] = "1"
+
+EXCLUDE_FROM_WORLD = "1"
+
+def export_gpg_pubkey(d, keyid, path):
+    import bb
+    gpg_bin = d.getVar('GPG_BIN', True) or \
+              bb.utils.which(os.getenv('PATH'), "gpg")
+    cmd = '%s --batch --yes --export --armor -o %s %s' % \
+          (gpg_bin, path, keyid)
+    status, output = oe.utils.getstatusoutput(cmd)
+    if status:
+        raise bb.build.FuncFailed('Failed to export gpg public key (%s): %s' %
+                                  (keyid, output))
+
+python do_export_public_keys () {
+    if d.getVar("RPM_SIGN_PACKAGES", True):
+        # Export public key of the rpm signing key
+        export_gpg_pubkey(d, d.getVar("RPM_GPG_NAME", True),
+                          d.getVar('RPM_GPG_PUBKEY', True))
+
+    if d.getVar('PACKAGE_FEED_SIGN', True) == '1':
+        # Export public key of the feed signing key
+        export_gpg_pubkey(d, d.getVar("PACKAGE_FEED_GPG_NAME", True),
+                          d.getVar('PACKAGE_FEED_GPG_PUBKEY', True))
+}
+addtask do_export_public_keys before do_build
diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index db82760..c690b82 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -37,6 +37,7 @@ python do_compile () {
         shutil.copy2(rpm_gpg_pubkey, d.expand('${B}/rpm-gpg/RPM-GPG-KEY-%s' % distro_version))
 }
 do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
+do_compile[depends] += "signing-keys:do_export_public_keys"
 
 do_install () {
     install -d ${D}${sysconfdir}
-- 
2.1.4


