Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4836C77A88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 12:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490186668; x=1521722668;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=PyBkxYThc4i0mGNbZfNqRQp3+9sOKhgaI5lxo/blD/o=;
	b=TAYiWyckcjRKz2ntynb5V6xsp3rX0tICDab4tzrwAP9JBcH7/tRGNA4P
	5lDAAc01tv6Rkzz3ycLY6/Mzn7jAVg==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2017 05:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,205,1486454400"; d="scan'208";a="837386386"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2017 05:44:26 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 14:43:36 +0200
Message-Id: <20170322124337.17061-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170322124337.17061-1-alexander.kanavin@linux.intel.com>
References: <20170322124337.17061-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/3] sign_rpm.bbclass: do not set/use RPM_GPG_PUBKEY
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
X-List-Received-Date: Wed, 22 Mar 2017 12:44:26 -0000

This is entirely unnecessary (we can ask the signer backend to export the
key to a file when needed), and was causing confusing selftest failures
due to the variable being set from two different places.

[YOCTO #11191]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/sign_rpm.bbclass     | 7 -------
 meta/lib/oe/package_manager.py    | 4 +++-
 meta/lib/oeqa/selftest/signing.py | 1 -
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index 2a08020819c..bc2e947107c 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -28,13 +28,6 @@ python () {
     for var in ('RPM_GPG_NAME', 'RPM_GPG_PASSPHRASE'):
         if not d.getVar(var):
             raise_sanity_error("You need to define %s in the config" % var, d)
-
-    # Set the expected location of the public key
-    d.setVar('RPM_GPG_PUBKEY', os.path.join(d.getVar('STAGING_DIR_TARGET', False),
-                                            d.getVar('sysconfdir', False),
-                                            'pki',
-                                            'rpm-gpg',
-                                            'RPM-GPG-KEY-${DISTRO_VERSION}'))
 }
 
 python sign_rpm () {
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2a4df619982..8b2b33106e1 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -520,7 +520,9 @@ class RpmPM(PackageManager):
             open(platformconfdir + "macros", 'a').write("%_prefer_color 7")
 
         if self.d.getVar('RPM_SIGN_PACKAGES') == '1':
-            pubkey_path = self.d.getVar('RPM_GPG_PUBKEY')
+            signer = get_signer(self.d, self.d.getVar('RPM_GPG_BACKEND'))
+            pubkey_path = oe.path.join(self.d.getVar('B'), 'rpm-key')
+            signer.export_pubkey(pubkey_path, self.d.getVar('RPM_GPG_NAME'))
             rpm_bin = bb.utils.which(os.getenv('PATH'), "rpmkeys")
             cmd = [rpm_bin, '--root=%s' % self.target_rootfs, '--import', pubkey_path]
             try:
diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index c1dd8014009..0ac3d1fac98 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -51,7 +51,6 @@ class Signing(oeSelfTest):
         feature = 'INHERIT += "sign_rpm"\n'
         feature += 'RPM_GPG_PASSPHRASE = "test123"\n'
         feature += 'RPM_GPG_NAME = "testuser"\n'
-        feature += 'RPM_GPG_PUBKEY = "%s"\n' % self.pub_key_path
         feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
 
         self.write_config(feature)
-- 
2.11.0


