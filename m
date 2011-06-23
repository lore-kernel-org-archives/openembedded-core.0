Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QZi3h-0008Vd-2O
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 13:26:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Jun 2011 04:23:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,412,1304319600"; d="scan'208";a="17409378"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by azsmga001.ch.intel.com with ESMTP; 23 Jun 2011 04:23:15 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2011 19:33:04 +0800
Message-Id: <8a1cd7c84d12ad10df0de5a84f7d54128e6e38bf.1308827218.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1308827218.git.lianhao.lu@intel.com>
References: <cover.1308827218.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] libc-package.bbclass: Replace hard coded libdir.
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
X-List-Received-Date: Thu, 23 Jun 2011 11:26:54 -0000

Replace the hard coded libdir for locale generating to meet the multilib
requirement.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/libc-package.bbclass |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 55e3d48..84bac5d 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -277,10 +277,11 @@ python package_do_split_gconvs () {
 
 	def output_locale_binary(name, pkgname, locale, encoding):
 		treedir = base_path_join(bb.data.getVar("WORKDIR", d, 1), "locale-tree")
-		ldlibdir = "%s/lib" % treedir
+		ldlibdir = base_path_join(treedir,libdir)
 		path = bb.data.getVar("PATH", d, 1)
 		i18npath = base_path_join(treedir, datadir, "i18n")
 		gconvpath = base_path_join(treedir, "iconvdata")
+		outputpath = base_path_join(treedir, libdir, "locale")
 
 		use_cross_localedef = bb.data.getVar("LOCALE_GENERATION_WITH_CROSS-LOCALEDEF", d, 1) or "0"
 		if use_cross_localedef == "1":
@@ -300,8 +301,8 @@ python package_do_split_gconvs () {
 				raise bb.build.FuncFailed("unknown arch:" + target_arch + " for locale_arch_options")
 
 			localedef_opts += " --force --old-style --no-archive --prefix=%s \
-				--inputfile=%s/%s/i18n/locales/%s --charmap=%s %s/usr/lib/locale/%s" \
-				% (treedir, treedir, datadir, locale, encoding, treedir, name)
+				--inputfile=%s/%s/i18n/locales/%s --charmap=%s %s/%s" \
+				% (treedir, treedir, datadir, locale, encoding, outputpath, name)
 
 			cmd = "PATH=\"%s\" I18NPATH=\"%s\" GCONV_PATH=\"%s\" cross-localedef %s" % \
 				(path, i18npath, gconvpath, localedef_opts)
-- 
1.7.0.4



