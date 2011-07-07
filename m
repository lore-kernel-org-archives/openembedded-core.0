Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QepLk-0006n6-4r
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 16:14:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Jul 2011 07:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,493,1304319600"; d="scan'208";a="24486647"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by orsmga001.jf.intel.com with ESMTP; 07 Jul 2011 07:10:45 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu,  7 Jul 2011 22:10:07 +0800
Message-Id: <1dce46eed7c322d8ada691bc2a61417ea6ffe928.1310047266.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1310047266.git.ke.yu@intel.com>
References: <cover.1310047266.git.ke.yu@intel.com>
In-Reply-To: <cover.1310047266.git.ke.yu@intel.com>
References: <cover.1310047266.git.ke.yu@intel.com>
Subject: [PATCH 3/8] libc-package.bbclass: fix for non /usr/lib libdir case
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
X-List-Received-Date: Thu, 07 Jul 2011 14:14:40 -0000

if libdir is not /usr/lib, e.g. libdir=/usr/lib64, eglibc will
have build failure:
"
 cross-localedef  --uint32-align=4 --little-endian  --force --old-style --no-archive --prefix=/home/kyu3/sdb/lib64/tmp/work/x86_64-poky-linux/eglibc-2.13-r2+svnr14157/locale-tree --inputfile=/home/kyu3/sdb/lib64/tmp/work/x86_64-poky-linux/eglibc-2.13-r2+svnr14157/locale-tree//usr/share/i18n/locales/es_NI --charmap=UTF-8 /home/kyu3/sdb/lib64/tmp/work/x86_64-poky-linux/eglibc-2.13-r2+svnr14157/locale-tree/usr/lib/locale/es_NI
NOTE: stdout:
NOTE:
NOTE: stderr:
NOTE: cannot write output files to `(null)': No such file or directory
ERROR: Function 'localedef returned an error' failed
"

the reason is that libc-package.bbclass has hard code "/usr/lib". This patch
fix it by using libdir variable.

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/classes/libc-package.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 55e3d48..2ece9ae 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -300,8 +300,8 @@ python package_do_split_gconvs () {
 				raise bb.build.FuncFailed("unknown arch:" + target_arch + " for locale_arch_options")
 
 			localedef_opts += " --force --old-style --no-archive --prefix=%s \
-				--inputfile=%s/%s/i18n/locales/%s --charmap=%s %s/usr/lib/locale/%s" \
-				% (treedir, treedir, datadir, locale, encoding, treedir, name)
+				--inputfile=%s/%s/i18n/locales/%s --charmap=%s %s%s/locale/%s" \
+				% (treedir, treedir, datadir, locale, encoding, treedir, libdir, name)
 
 			cmd = "PATH=\"%s\" I18NPATH=\"%s\" GCONV_PATH=\"%s\" cross-localedef %s" % \
 				(path, i18npath, gconvpath, localedef_opts)
-- 
1.7.0.4



