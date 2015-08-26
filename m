Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 588D476C9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 11:18:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2015 04:18:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,415,1437462000"; d="scan'208";a="791218523"
Received: from unknown (HELO marquiz.fi.intel.com) ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 26 Aug 2015 04:18:37 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 14:18:33 +0300
Message-Id: <1440587914-1280-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440587914-1280-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1440587914-1280-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/3] os-release: add the public package-signing key
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
X-List-Received-Date: Wed, 26 Aug 2015 11:18:37 -0000

Adds the public package-signing key into this package. It will be
installed under /etc/pki/rpm-gpg if the RPM signing feature is used. The
key file is not currently directly used by anything in the target
system. It is merely there for possible later use.

[YOCTO #8134]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-core/os-release/os-release.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index 87fea6f..542cf56 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -23,15 +23,24 @@ PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
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
+        shutil.copy2(rpm_gpg_pubkey, d.expand('${B}/RPM-GPG-KEY-default'))
 }
 do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
 
 do_install () {
     install -d ${D}${sysconfdir}
     install -m 0644 os-release ${D}${sysconfdir}/
+
+    if [ -f "RPM-GPG-KEY-default" ]; then
+        install -d "${D}${sysconfdir}/pki/rpm-gpg"
+        install -m 0644 "RPM-GPG-KEY-oe" "${D}${sysconfdir}/pki/rpm-gpg/"
+    fi
 }
-- 
2.1.4


