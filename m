Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BD7536AF95
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 20:48:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Jul 2013 13:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,975,1363158000"; d="scan'208";a="363055840"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.91])
	by orsmga002.jf.intel.com with ESMTP; 01 Jul 2013 13:48:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 13:48:42 -0700
Message-Id: <462f7198c0e19dd2f7bccb7e7a3166496da3447d.1372711267.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1372711267.git.sgw@linux.intel.com>
References: <cover.1372711267.git.sgw@linux.intel.com>
In-Reply-To: <cover.1372711267.git.sgw@linux.intel.com>
References: <cover.1372711267.git.sgw@linux.intel.com>
Subject: [PATCH 1/4 v2] mc: Don't remove libdir and split helpers into packages
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
X-List-Received-Date: Mon, 01 Jul 2013 20:48:49 -0000

It contains helper programs that are needed to make mc do the right actions
for the various file formats it understands.

The helpers are perl, python and shell scripts, split them out so the core
mc does not try to pull in perl and python, it will still run without these
helpers.

[YOCTO #4432]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/mc/mc_4.7.5.2.bb | 22 ++++++++++++++++++++++
 meta/recipes-extended/mc/mc_4.8.8.bb   | 22 +++++++++++++++++++++-
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mc/mc_4.7.5.2.bb b/meta/recipes-extended/mc/mc_4.7.5.2.bb
index e7ccc77..818e971 100644
--- a/meta/recipes-extended/mc/mc_4.7.5.2.bb
+++ b/meta/recipes-extended/mc/mc_4.7.5.2.bb
@@ -23,3 +23,25 @@ do_install_append () {
        sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.d/*
        
 }
+
+PACKAGES =+ "${BPN}-helpers-perl ${BPN}-helpers-python ${BPN}-helpers ${BPN}-fish"
+
+DESCRIPTION_${BPN}-helpers-perl = "Midnight Commander perl based helper scripts" 
+FILES_${BPN}-helpers-perl = "${libexecdir}/mc/extfs.d/a+ ${libexecdir}/mc/extfs.d/apt+ \
+                             ${libexecdir}/mc/extfs.d/deb ${libexecdir}/mc/extfs.d/deba \
+                             ${libexecdir}/mc/extfs.d/debd ${libexecdir}/mc/extfs.d/dpkg+ \
+                             ${libexecdir}/mc/extfs.d/mailfs ${libexecdir}/mc/extfs.d/patchfs \ 
+                             ${libexecdir}/mc/extfs.d/rpms+ ${libexecdir}/mc/extfs.d/ulib \ 
+                             ${libexecdir}/mc/extfs.d/uzip"
+RDEPENDS_${BPN}-helpers-perl = "perl"
+
+DESCRIPTION_${BPN}-helpers-python = "Midnight Commander python based helper scripts" 
+FILES_${BPN}-helpers-python = "${libexecdir}/mc/extfs.d/s3+ ${libexecdir}/mc/extfs.d/uc1541"
+RDEPENDS_${BPN}-helpers-python = "python"
+
+DESCRIPTION_${BPN}-helpers = "Midnight Commander shell helper scripts" 
+FILES_${BPN}-helpers = "${libexecdir}/mc/extfs.d/* ${libexecdir}/mc/ext.d/*"
+
+DESCRIPTION_${BPN}-fish = "Midnight Commander Fish scripts"
+FILES_${BPN}-fish = "${libexecdir}/mc/fish"
+
diff --git a/meta/recipes-extended/mc/mc_4.8.8.bb b/meta/recipes-extended/mc/mc_4.8.8.bb
index 20ae797..b2851bb 100644
--- a/meta/recipes-extended/mc/mc_4.8.8.bb
+++ b/meta/recipes-extended/mc/mc_4.8.8.bb
@@ -19,5 +19,25 @@ FILES_${PN}-dbg += "${libexecdir}/mc/.debug/"
 
 do_install_append () {
 	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.d/*
-	rm -rf ${D}${libdir}
 }
+
+PACKAGES =+ "${BPN}-helpers-perl ${BPN}-helpers-python ${BPN}-helpers ${BPN}-fish"
+
+DESCRIPTION_${BPN}-helpers-perl = "Midnight Commander perl based helper scripts" 
+FILES_${BPN}-helpers-perl = "${libexecdir}/mc/extfs.d/a+ ${libexecdir}/mc/extfs.d/apt+ \
+                             ${libexecdir}/mc/extfs.d/deb ${libexecdir}/mc/extfs.d/deba \
+                             ${libexecdir}/mc/extfs.d/debd ${libexecdir}/mc/extfs.d/dpkg+ \
+                             ${libexecdir}/mc/extfs.d/mailfs ${libexecdir}/mc/extfs.d/patchfs \ 
+                             ${libexecdir}/mc/extfs.d/rpms+ ${libexecdir}/mc/extfs.d/ulib \ 
+                             ${libexecdir}/mc/extfs.d/uzip"
+RDEPENDS_${BPN}-helpers-perl = "perl"
+
+DESCRIPTION_${BPN}-helpers-python = "Midnight Commander python based helper scripts" 
+FILES_${BPN}-helpers-python = "${libexecdir}/mc/extfs.d/s3+ ${libexecdir}/mc/extfs.d/uc1541"
+RDEPENDS_${BPN}-helpers-python = "python"
+
+DESCRIPTION_${BPN}-helpers = "Midnight Commander shell helper scripts" 
+FILES_${BPN}-helpers = "${libexecdir}/mc/extfs.d/* ${libexecdir}/mc/ext.d/*"
+
+DESCRIPTION_${BPN}-fish = "Midnight Commander Fish scripts"
+FILES_${BPN}-fish = "${libexecdir}/mc/fish"
-- 
1.8.1.4


