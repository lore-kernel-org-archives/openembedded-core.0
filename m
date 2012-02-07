Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvN-0004HK-Hg
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:09 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:46:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206394"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:46:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:33 -0800
Message-Id: <507bd29c5d1a3459e376e2d2c338b7e2a0afabaa.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/35] systemtap: extend the recipe to build the native package
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
X-List-Received-Date: Tue, 07 Feb 2012 22:54:10 -0000

From: Wade Farnsworth <wade_farnsworth@mentor.com>

Since the target image may not contain dev tools, it is useful to
provide native systemtap in order to be able to compile systemtap
scripts for the target.

Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index dff08ee..fb3c0ef 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -2,10 +2,12 @@ DESCRIPTION = "SystemTap - script-directed dynamic tracing and performance analy
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "elfutils sqlite3"
+DEPENDS = "elfutils sqlite3 systemtap-native"
+DEPENDS_virtclass-native = "elfutils-native sqlite3-native gettext-native"
+DEPENDS_virtclass-nativesdk = "elfutils-nativesdk sqlite3-nativesdk gettext-nativesdk"
 
 SRCREV = "83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81"
-PR = "r0"
+PR = "r1"
 PV = "1.7+git${SRCPV}"
 
 SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git"
@@ -28,4 +30,6 @@ S = "${WORKDIR}/git"
 
 inherit autotools gettext
 
+BBCLASSEXTEND = "native nativesdk"
+
 FILES_${PN}-dbg += "${libexecdir}/systemtap/.debug"
-- 
1.7.6.5



