Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5647D7828A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 11:48:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Aug 2017 04:48:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,444,1498546800"; d="scan'208";a="1008808186"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2017 04:48:28 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 14:45:26 +0300
Message-Id: <20170829114526.37559-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170829114526.37559-1-alexander.kanavin@linux.intel.com>
References: <20170829114526.37559-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/3] signing-keys: do not use DISTRO_VERSION in key names
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
X-List-Received-Date: Tue, 29 Aug 2017 11:48:28 -0000

DISTRO_VERSION may contain the current date, and so is prone to mismatches
particularly when keys are created on one date, and dnf is configured to use the keys
on another date.

[YOCTO #11983]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py         |  2 +-
 meta/recipes-core/meta/signing-keys.bb | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index d43d729203b..ef068813110 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -561,7 +561,7 @@ class RpmPM(PackageManager):
 
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
             gpg_opts = 'repo_gpgcheck=1\n'
-            gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO_VERSION'))
+            gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'), self.d.getVar('DISTRO_CODENAME'))
         else:
             gpg_opts = ''
 
diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index ebfb08c433b..2c1cc3845ea 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -44,25 +44,25 @@ addtask get_public_keys before do_install
 
 do_install () {
     if [ -f "${B}/rpm-key" ]; then
-        install -D -m 0644 "${B}/rpm-key" "${D}${sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-${DISTRO_VERSION}"
+        install -D -m 0644 "${B}/rpm-key" "${D}${sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
     if [ -f "${B}/ipk-key" ]; then
-        install -D -m 0644 "${B}/ipk-key" "${D}${sysconfdir}/pki/ipk-gpg/IPK-GPG-KEY-${DISTRO_VERSION}"
+        install -D -m 0644 "${B}/ipk-key" "${D}${sysconfdir}/pki/ipk-gpg/IPK-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
     if [ -f "${B}/pf-key" ]; then
-        install -D -m 0644 "${B}/pf-key" "${D}${sysconfdir}/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-${DISTRO_VERSION}"
+        install -D -m 0644 "${B}/pf-key" "${D}${sysconfdir}/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
 }
 
 do_deploy () {
     if [ -f "${B}/rpm-key" ]; then
-        install -D -m 0644 "${B}/rpm-key" "${DEPLOYDIR}/RPM-GPG-KEY-${DISTRO_VERSION}"
+        install -D -m 0644 "${B}/rpm-key" "${DEPLOYDIR}/RPM-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
     if [ -f "${B}/ipk-key" ]; then
-        install -D -m 0644 "${B}/ipk-key" "${DEPLOYDIR}/IPK-GPG-KEY-${DISTRO_VERSION}"
+        install -D -m 0644 "${B}/ipk-key" "${DEPLOYDIR}/IPK-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
     if [ -f "${B}/pf-key" ]; then
-        install -D -m 0644 "${B}/pf-key" "${DEPLOYDIR}/PACKAGEFEED-GPG-KEY-${DISTRO_VERSION}"
+        install -D -m 0644 "${B}/pf-key" "${DEPLOYDIR}/PACKAGEFEED-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
 }
 do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_RPM}"
-- 
2.14.1


