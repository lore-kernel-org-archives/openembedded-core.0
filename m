Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QodKE-0008QH-Rj
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:25:39 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 08:21:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,310,1309762800"; 
   d="scan'208";a="3779397"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 08:21:13 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 23:19:33 +0800
Message-Id: <17e9b7019f19617507dad10c72c917b001e98fff.1312384552.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1312384552.git.dongxiao.xu@intel.com>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1312384552.git.dongxiao.xu@intel.com>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/7] eglibc-locale: Specially handle FILES_eglibc-gconv for multilib
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
X-List-Received-Date: Wed, 03 Aug 2011 15:25:39 -0000

In multilib support, it iterate values in PACKAGES and then extend name
for variables like "FILES_xxx", "SUMMARY_xxx", etc.

However eglibc-gconv is dynamically put in PACKAGES by
package_do_split_gconv function. Therefore the name will not be
extended automatically.

Specially handle the FILES variable for eglibc-gconv to fix the issue
of missing "lib32-eglibc-gconv" issue in doing multilib do_rootfs.

Also when set PACKAGES, add the MLPREFIX.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/libc-package.bbclass          |    2 +-
 meta/recipes-core/eglibc/eglibc-locale.inc |    5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index de57230..0d5ce20 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -191,7 +191,7 @@ python package_do_split_gconvs () {
 
 	do_split_packages(d, locales_dir, file_regex='(.*)', output_pattern=bpn+'-localedata-%s', \
 		description='locale definition for %s', hook=calc_locale_deps, extra_depends='')
-	bb.data.setVar('PACKAGES', bb.data.getVar('PACKAGES', d) + ' ' + bpn + '-gconv', d)
+	bb.data.setVar('PACKAGES', bb.data.getVar('PACKAGES', d) + ' ' + bb.data.getVar('MLPREFIX', d) + bpn + '-gconv', d)
 
 	use_bin = bb.data.getVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", d, 1)
 
diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index b496ce6..ca3940d 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -41,7 +41,10 @@ PACKAGES_DYNAMIC = "locale-base-* \
 
 DESCRIPTION_localedef = "eglibc: compile locale definition files"
 
-FILES_eglibc-gconv = "${libdir}/gconv/*"
+# eglibc-gconv is dynamically added into PACKAGES, thus
+# FILES_eglibc-gconv will not be automatically extended in multilib.
+# Explicitly add ${MLPREFIX} for FILES_eglibc-gconv.
+FILES_${MLPREFIX}eglibc-gconv = "${libdir}/gconv/*"
 FILES_${PN}-dbg += "${libdir}/gconv/.debug/*"
 FILES_localedef${PKGSUFFIX} = "${bindir}/localedef"
 
-- 
1.7.1



