Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 88D6F6FE78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 18:19:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jun 2014 11:19:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,472,1400050800"; d="scan'208";a="547675175"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2014 11:19:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jun 2014 11:19:47 -0700
Message-Id: <1402683587-7488-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1402683587-7488-1-git-send-email-sgw@linux.intel.com>
References: <1402683587-7488-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] stat: use update-alt for stat
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
X-List-Received-Date: Fri, 13 Jun 2014 18:19:53 -0000

Three different recipes provide the stat program, busybox, coreutils and stat.
Ensure that they are installed to the same place and use update-alternative
with the correct priorities to have the correct binary installed.

[YOCTO #6415]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/stat/stat_3.3.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/stat/stat_3.3.bb b/meta/recipes-extended/stat/stat_3.3.bb
index c9edb1d..6754fb8 100644
--- a/meta/recipes-extended/stat/stat_3.3.bb
+++ b/meta/recipes-extended/stat/stat_3.3.bb
@@ -12,10 +12,17 @@ SRC_URI[md5sum] = "37e247e8e400ad9205f1b0500b728fd3"
 SRC_URI[sha256sum] = "7071f0384a423a938dd542c1f08547a02824f6359acd3ef3f944b2c4c2d1ee09"
 
 do_install() {
-	install -d ${D}${bindir} ${D}${mandir}/man1
-	install -m 755 stat ${D}${bindir}
+	install -d ${D}${base_bindir} ${D}${mandir}/man1
+	install -m 755 stat ${D}${base_bindir}/stat.stat
 	install -m 644 stat.1 ${D}${mandir}/man1
 }
 
+inherit update-alternatives
+
+ALTERNATIVE_${PN} = "stat"
+ALTERNATIVE_PRIORITY[stat] = "200"
+ALTERNATIVE_LINK_NAME[stat] = "${base_bindir}/stat"
+ALTERNATIVE_TARGET[stat] = "${base_bindir}/stat.stat"
+
 BBCLASSEXTEND = "native"
 
-- 
1.8.3.1


