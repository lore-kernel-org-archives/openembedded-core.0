Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA0C76E4B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 07:43:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 05 Oct 2015 00:43:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,637,1437462000"; d="scan'208";a="803746070"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 05 Oct 2015 00:43:13 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Oct 2015 10:43:11 +0300
Message-Id: <1444030991-22869-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2] os-release: fix do_compile() when RPM signing is enabled
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
X-List-Received-Date: Mon, 05 Oct 2015 07:43:19 -0000

do_compile() task failed when RPM signing was in use.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-core/os-release/os-release.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index cc431d2..db82760 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -32,8 +32,8 @@ python do_compile () {
                 f.write('{0}={1}\n'.format(field, value))
     if d.getVar('RPM_SIGN_PACKAGES', True) == '1':
         rpm_gpg_pubkey = d.getVar('RPM_GPG_PUBKEY', True)
-        os.mkdir('${B}/rpm-gpg')
-        distro_version = self.d.getVar('DISTRO_VERSION', True) or "oe.0"
+        bb.utils.mkdirhier('${B}/rpm-gpg')
+        distro_version = d.getVar('DISTRO_VERSION', True) or "oe.0"
         shutil.copy2(rpm_gpg_pubkey, d.expand('${B}/rpm-gpg/RPM-GPG-KEY-%s' % distro_version))
 }
 do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
-- 
2.1.4


