Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qe3HR-00064I-9v
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:55:03 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Jul 2011 03:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,478,1304319600"; d="scan'208";a="23530566"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by orsmga001.jf.intel.com with ESMTP; 05 Jul 2011 03:50:58 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 18:51:30 +0800
Message-Id: <8afebe13f6e5c1ba3354907892f2808277a96e6e.1309862610.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1309862610.git.lianhao.lu@intel.com>
References: <cover.1309862610.git.lianhao.lu@intel.com>
Subject: [MULTILIB_SUBTASK4 1/5] libc-package.bbclass: Replace hard coded libdir.
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
X-List-Received-Date: Tue, 05 Jul 2011 10:55:04 -0000

Replace the hard coded libdir for locale generating to meet the multilib
requirement.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/libc-package.bbclass |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 55e3d48..5db46ce 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -277,10 +277,11 @@ python package_do_split_gconvs () {
 
 	def output_locale_binary(name, pkgname, locale, encoding):
 		treedir = base_path_join(bb.data.getVar("WORKDIR", d, 1), "locale-tree")
-		ldlibdir = "%s/lib" % treedir
+		ldlibdir = base_path_join(treedir, bb.data.getVar("base_libdir", d, 1))
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



