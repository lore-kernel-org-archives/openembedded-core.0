Return-Path: <bogdan.a.marinescu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id BAC82621EB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 06:52:41 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Jun 2013 23:52:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,798,1363158000"; d="scan'208";a="311903284"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by azsmga001.ch.intel.com with ESMTP; 03 Jun 2013 23:52:30 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jun 2013 09:52:20 +0300
Message-Id: <1370328740-24362-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] bdwgc: enable full version name in recipe name
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
X-List-Received-Date: Tue, 04 Jun 2013 06:52:42 -0000

bdwgc has version names that may or may not contain a revision
(for example 7.2d or simply 7.2). The current recipe specifies
the revision as a separate variable, which confuses the automatic
version checker. This patch enables using the full version name
as part of the recipe name.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-support/bdwgc/{bdwgc_7.2.bb => bdwgc_7.2d.bb} |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-support/bdwgc/{bdwgc_7.2.bb => bdwgc_7.2d.bb} (91%)

diff --git a/meta/recipes-support/bdwgc/bdwgc_7.2.bb b/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
similarity index 91%
rename from meta/recipes-support/bdwgc/bdwgc_7.2.bb
rename to meta/recipes-support/bdwgc/bdwgc_7.2d.bb
index a0a5bff..b5a6831 100644
--- a/meta/recipes-support/bdwgc/bdwgc_7.2.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
@@ -23,17 +23,15 @@ LIC_FILES_CHKSUM = "file://README.QUICK;md5=9b9dd874f6940641b6ab19893ee8f1cc \
                     file://doc/README;md5=92e7dd0334d1f672b699cd0aca08bef0 \
                     file://libatomic_ops/doc/LICENSING.txt;md5=607073e04548eac7d1f763e480477bab"
 
-REVISION = "d"
-
-SRC_URI = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/gc-${PV}${REVISION}.tar.gz"
+SRC_URI = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/gc-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "91340b28c61753a789eb6077675d87d2"
 SRC_URI[sha256sum] = "d9fe0ae8650d43746a48bfb394cab01a319f3809cee19f8ebd16aa985b511c5e"
 FILES_${PN}-doc = "/usr/share"
 
-PR = "r0"
-
-S = "${WORKDIR}/gc-${PV}"
+PR = "r1"
+REAL_PV = "${@[d.getVar('PV',1)[:-1], d.getVar('PV',1)][(d.getVar('PV',1)[-1]).isdigit()]}"
+S = "${WORKDIR}/gc-${REAL_PV}"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.7.10.4


