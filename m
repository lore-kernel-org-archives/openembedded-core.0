Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3437D76710
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 06:11:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 04 Oct 2015 23:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,637,1437462000"; d="scan'208";a="657927090"
Received: from dharris-mobl3.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.4.7])
	by orsmga003.jf.intel.com with ESMTP; 04 Oct 2015 23:11:23 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Oct 2015 09:11:28 +0300
Message-Id: <1444025488-26325-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] os-release: fix do_compile() when RPM signing is enabled
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
X-List-Received-Date: Mon, 05 Oct 2015 06:11:29 -0000

do_compile() task failed when RPM signing was in use.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-core/os-release/os-release.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index cc431d2..c99ea3e 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -33,7 +33,7 @@ python do_compile () {
     if d.getVar('RPM_SIGN_PACKAGES', True) == '1':
         rpm_gpg_pubkey = d.getVar('RPM_GPG_PUBKEY', True)
         os.mkdir('${B}/rpm-gpg')
-        distro_version = self.d.getVar('DISTRO_VERSION', True) or "oe.0"
+        distro_version = d.getVar('DISTRO_VERSION', True) or "oe.0"
         shutil.copy2(rpm_gpg_pubkey, d.expand('${B}/rpm-gpg/RPM-GPG-KEY-%s' % distro_version))
 }
 do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
-- 
2.1.4


