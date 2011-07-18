Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qih0g-0002RL-ND
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 08:08:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jul 2011 23:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,221,1309762800"; d="scan'208";a="29137751"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2011 23:04:51 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 14:01:48 +0800
Message-Id: <a021f47ba8429c02525444208b085bb3383d5ad9.1310968787.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1310968787.git.dongxiao.xu@intel.com>
References: <cover.1310968787.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1310968787.git.dongxiao.xu@intel.com>
References: <cover.1310968787.git.dongxiao.xu@intel.com>
Subject: [PATCH 4/4] perl: revise the RRECOMMENDS_perl-modules for multilib case
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
X-List-Received-Date: Mon, 18 Jul 2011 06:08:54 -0000

From: Yu Ke <ke.yu@intel.com>

current RRECOMMENDS_perl-modules replace the hardcode "perl-dbg",
"perl-misc" etc. which does not work in multilib case. Instead, it
should replace the "lib64-perl-dbg", "lib-64-perl-misc". without
doing this, current code will produce RRECOMMENDS=lib64-lib64-xxx etc

This patch revise the code to fix this issue

Signed-off-by: Yu Ke <ke.yu@intel.com>
Signed-off-by: Xu Dongxiao <dongxiao.xu@intel.com>
---
 meta/recipes-devtools/perl/perl_5.12.3.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.12.3.bb b/meta/recipes-devtools/perl/perl_5.12.3.bb
index c75a532..4b6b5a7 100644
--- a/meta/recipes-devtools/perl/perl_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.12.3.bb
@@ -282,7 +282,7 @@ FILES_perl-module-unicore += "${libdir}/perl/${PV}/unicore"
 # packages (actually the non modules packages and not created too)
 ALLOW_EMPTY_perl-modules = "1"
 PACKAGES_append = " perl-modules "
-RRECOMMENDS_perl-modules = "${@bb.data.getVar('PACKAGES', d, 1).replace('perl-modules ', '').replace('perl-dbg ', '').replace('perl-misc ', '').replace('perl-dev ', '').replace('perl-pod ', '').replace('perl-doc ', '')}"
+RRECOMMENDS_perl-modules = "${@bb.data.getVar('PACKAGES', d, 1).replace('${PN}-modules ', '').replace('${PN}-dbg ', '').replace('${PN}-misc ', '').replace('${PN}-dev ', '').replace('${PN}-pod ', '').replace('${PN}-doc ', '')}"
 
 python populate_packages_prepend () {
         libdir = bb.data.expand('${libdir}/perl/${PV}', d)
-- 
1.7.1



