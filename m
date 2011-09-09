Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R1rLn-00059I-Vw
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Sep 2011 05:01:56 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Sep 2011 19:56:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,353,1312182000"; d="scan'208";a="46999961"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 08 Sep 2011 19:56:50 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Sep 2011 10:53:05 +0800
Message-Id: <e7bb01a01d1fdf5262436e16b118583b5956e4b9.1315536041.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1315536041.git.edwin.zhai@intel.com>
References: <cover.1315536041.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1315536041.git.edwin.zhai@intel.com>
References: <cover.1315536041.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] opensp: Fix hard path in native nsgmls.
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
X-List-Received-Date: Fri, 09 Sep 2011 03:01:56 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

This relocation issues caused following bug and introduce one partial fix bb024d:
[YOCTO #1440]

But the environment val hacking is not working all the time, as nsgmsl may
append wrong path in some case. This fix use search directory "-D" as solution.
It's better if got fixed from opensp side when next upgrade.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
CC: Saul Would <sgw@linux.intel.com>
---
 meta/recipes-devtools/opensp/opensp_1.5.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opensp/opensp_1.5.bb b/meta/recipes-devtools/opensp/opensp_1.5.bb
index 0269c87..d692137 100644
--- a/meta/recipes-devtools/opensp/opensp_1.5.bb
+++ b/meta/recipes-devtools/opensp/opensp_1.5.bb
@@ -44,8 +44,8 @@ do_install_append() {
 
 do_install_append_virtclass-native() {
 	for util in nsgmls sgmlnorm spam spcat spent sx; do
-		create_wrapper ${D}/${bindir}/$util \
-		    SGML_CATALOG_FILES=${sysconfdir}/sgml/catalog 
+		create_cmdline_wrapper ${D}/${bindir}/$util \
+		    -D ${sysconfdir}/sgml
 	done
 }
 
-- 
1.7.1



