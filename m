Return-Path: <amarnath.valluri@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2571960851
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 13:42:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 10 Feb 2017 05:42:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,141,1484035200"; d="scan'208";a="42543541"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2017 05:42:31 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 15:42:13 +0200
Message-Id: <1486734151-28331-6-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 05/23] systemd: chagnes to support merged /usr
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
X-List-Received-Date: Fri, 10 Feb 2017 13:42:32 -0000

When the usrmerge DISTRO_FEATURE is selected disable the split-usr
support and modify rootprefix to be exec_prefix, rather than base_prefix.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/recipes-core/systemd/systemd_232.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
index cc8781e..bf0fadc 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -131,7 +131,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_SULOGIN=${base_sbindir}/sulogin"
 
 # Helper variables to clarify locations.  This mirrors the logic in systemd's
 # build system.
-rootprefix ?= "${base_prefix}"
+rootprefix ?= "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '${exec_prefix}', '${base_prefix}', d)}"
 rootlibdir ?= "${base_libdir}"
 rootlibexecdir = "${rootprefix}/lib"
 
@@ -149,10 +149,10 @@ CACHED_CONFIGUREVARS_class-target = "\
 EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --with-rootlibdir=${rootlibdir} \
                  --with-roothomedir=${ROOT_HOME} \
-                 --enable-split-usr \
+                 ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '--disable-split-usr', '--enable-split-usr', d)} \
                  --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
-                 --with-firmware-path=/lib/firmware \
+                 --with-firmware-path=${nonarch_base_libdir}/firmware \
                  --with-testdir=${PTEST_PATH} \
                "
 # per the systemd README, define VALGRIND=1 to run under valgrind
-- 
2.7.4


