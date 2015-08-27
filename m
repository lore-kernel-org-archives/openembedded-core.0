Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 080F176E17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 09:31:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 27 Aug 2015 02:31:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,421,1437462000"; d="scan'208";a="776621082"
Received: from wneubaue-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.11.162])
	by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2015 02:31:22 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 12:31:15 +0300
Message-Id: <1440667876-1024-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440667876-1024-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1440667876-1024-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 3/4] os-release: add the public package-signing key
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
X-List-Received-Date: Thu, 27 Aug 2015 09:31:21 -0000

Adds the public package-signing key into this package. It will be
installed under /etc/pki/rpm-gpg if the RPM signing feature is used. The
key file is not currently directly used by anything in the target
system. It is merely there for possible later use.

[YOCTO #8134]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-core/os-release/os-release.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index 87fea6f..f24882a 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -23,15 +23,26 @@ PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
 BUILD_ID ?= "${DATETIME}"
 
 python do_compile () {
+    import shutil
     with open(d.expand('${B}/os-release'), 'w') as f:
         for field in d.getVar('OS_RELEASE_FIELDS', True).split():
             value = d.getVar(field, True)
             if value:
                 f.write('{0}={1}\n'.format(field, value))
+    if d.getVar('RPM_SIGN_PACKAGES', True) == '1':
+        rpm_gpg_pubkey = d.getVar('RPM_GPG_PUBKEY', True)
+        os.mkdir('${B}/rpm-gpg')
+        distro_version = self.d.getVar('DISTRO_VERSION', True) or "oe.0"
+        shutil.copy2(rpm_gpg_pubkey, d.expand('${B}/rpm-gpg/RPM-GPG-KEY-%s' % distro_version))
 }
 do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
 
 do_install () {
     install -d ${D}${sysconfdir}
     install -m 0644 os-release ${D}${sysconfdir}/
+
+    if [ -d "rpm-gpg" ]; then
+        install -d "${D}${sysconfdir}/pki"
+        cp -r "rpm-gpg" "${D}${sysconfdir}/pki/"
+    fi
 }
-- 
2.1.4


