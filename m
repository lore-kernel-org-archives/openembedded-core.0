Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA3165C5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 15:02:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 17 Mar 2016 08:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,350,1455004800"; d="scan'208";a="939422043"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 17 Mar 2016 08:02:22 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 17:02:20 +0200
Message-Id: <1458226940-22662-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] externalsrc: use shared stamp directory if B=S
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
X-List-Received-Date: Thu, 17 Mar 2016 15:03:00 -0000

We have a common build directory for all target architectures if
externalsrc is used and ${B}=${S}. In this case we also need to have a
common stamp directory. The reason is that e.g. changing MACHINE will
basically "invalidate" the artefacts in ${B} (wrt. to the new MACHINE)
but old stamp files with matching hashes from an earlier build might be
available in the machine-specific stamps directory and tasks would not
be correctly re-run.

Previous attempt in f44f12af346888bdeb3ae01a275cb5dd4396b505 to handle
this correctly was faulty as it threw some spurious warnings and caused
do_configure to be re-run in every build if that would not be necessary.

[YOCTO #8950]
[YOCTO #9237]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 0ec338c..8e3f5e5 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -100,7 +100,7 @@ python () {
         if d.getVar('S', True) == d.getVar('B', True):
             configstamp = '${TMPDIR}/work-shared/${PN}/${EXTENDPE}${PV}-${PR}/configure.sstate'
             d.setVar('CONFIGURESTAMPFILE', configstamp)
-            d.setVarFlag('do_configure', 'file-checksums', configstamp + ':True')
+            d.setVar('STAMP', '${STAMPS_DIR}/work-shared/${PN}/${EXTENDPE}${PV}-${PR}')
 }
 
 python externalsrc_configure_prefunc() {
-- 
2.6.2


