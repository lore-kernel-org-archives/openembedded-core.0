Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJY-0001xh-Ae
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 May 2011 16:44:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="741892709"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2011 16:44:56 -0700
Message-Id: <9672b6965c6d8f86c43f0253b02d891ced35363d.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Mon, 2 May 2011 13:41:09 -0700
Date: Tue, 03 May 2011 16:44:56 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 27/33] git: Disable gitk from by default
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
X-List-Received-Date: Tue, 03 May 2011 23:47:36 -0000

From: Saul Wold <sgw@linux.intel.com>

gitk should not be built for native and comment out
the build for the target by default since it includes
tk and will drag in more X11 stuf then needed.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/git/git.inc        |    7 +++++--
 meta/recipes-devtools/git/git_1.7.4.3.bb |    2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 7f12859..725473a 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -40,9 +40,12 @@ FILES_${PN}-perltools += " \
 RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
 
 # git-tk package with gitk and git-gui
-PACKAGES =+ "${PN}-tk"
+# Uncomment the PACKAGE line to include GITK
+#PACKAGES =+ "${GITK}"
+GITK = "${PN}-tk"
+GITK_virtclass-native = ""
 RDEPENDS_${PN}-tk = "${PN} tk tcl"
-EXTRA_OEMAKE = "TCL_PATH=${STAGING_BINDIR_CROSS}/tclsh"
+EXTRA_OEMAKE_${PN}-tk_append = " TCL_PATH=${STAGING_BINDIR_NATIVE}/tclsh"
 FILES_${PN}-tk = " \
     ${bindir}/gitk \
     ${datadir}/gitk \
diff --git a/meta/recipes-devtools/git/git_1.7.4.3.bb b/meta/recipes-devtools/git/git_1.7.4.3.bb
index 45ef61b..e45edcb 100644
--- a/meta/recipes-devtools/git/git_1.7.4.3.bb
+++ b/meta/recipes-devtools/git/git_1.7.4.3.bb
@@ -1,6 +1,6 @@
 require git.inc
 
-PR = "r2"
+PR = "r4"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.4.1



