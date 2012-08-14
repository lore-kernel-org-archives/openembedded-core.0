Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCy-0000ex-D2
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181467"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:37 +0300
Message-Id: <6022af64f75660cbd62c9bf53ac39ce00ac7d0d0.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 50/64] at 3.1.13: get 'at' depends on 'flex-native' explicitly
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
X-List-Received-Date: Tue, 14 Aug 2012 12:30:15 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

'at' needs flex to generate source file lex.yy.c, but it doesn't
depend on flex-native directly; This maybe cause a do_compile
failure if flex-native is not built or included in project.

Error message is:
    error: lex.yy.c: No such file or directory

Get 'at' depends on flex-native to fix this potential issue.

[YOCTO #2919]

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/at/at_3.1.13.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.1.13.bb b/meta/recipes-extended/at/at_3.1.13.bb
index ce9396a..a391d6e 100644
--- a/meta/recipes-extended/at/at_3.1.13.bb
+++ b/meta/recipes-extended/at/at_3.1.13.bb
@@ -4,14 +4,14 @@ the system load levels drop to a particular level."
 SECTION = "base"
 LICENSE="GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
-DEPENDS = "flex initscripts \
+DEPENDS = "flex flex-native initscripts \
 	${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
 
 RCONFLICTS_${PN} = "atd"
 RREPLACES_${PN} = "atd"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://configure.patch \
-- 
1.7.7.6



