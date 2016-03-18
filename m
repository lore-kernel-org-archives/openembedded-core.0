Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2625D605BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 07:41:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 18 Mar 2016 00:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,353,1455004800"; d="scan'208";a="913699370"
Received: from jblondin-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.21.216])
	by orsmga001.jf.intel.com with ESMTP; 18 Mar 2016 00:41:52 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Mar 2016 09:41:51 +0200
Message-Id: <1458286911-9432-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH v2] externalsrc: use shared stamp directory if B=S
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
X-List-Received-Date: Fri, 18 Mar 2016 07:41:53 -0000

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
 meta/classes/externalsrc.bbclass | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 0ec338c..d3cede2 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -92,15 +92,13 @@ python () {
         d.appendVar('RM_WORK_EXCLUDE', ' ' + d.getVar('PN', True))
 
         # If B=S the same builddir is used even for different architectures.
-        # Thus, use a shared CONFIGURESTAMPFILE so that change of do_configure
-        # task hash is correctly detected if e.g. MACHINE changes. In addition,
-        # do_configure needs to depend on the stamp file so that the task is
-        # re-run when the stamp was changed since the last run on this
-        # architecture.
+        # Thus, use a shared CONFIGURESTAMPFILE and STAMP directory so that
+        # change of do_configure task hash is correctly detected and stamps are
+        # invalidated if e.g. MACHINE changes.
         if d.getVar('S', True) == d.getVar('B', True):
             configstamp = '${TMPDIR}/work-shared/${PN}/${EXTENDPE}${PV}-${PR}/configure.sstate'
             d.setVar('CONFIGURESTAMPFILE', configstamp)
-            d.setVarFlag('do_configure', 'file-checksums', configstamp + ':True')
+            d.setVar('STAMP', '${STAMPS_DIR}/work-shared/${PN}/${EXTENDPE}${PV}-${PR}')
 }
 
 python externalsrc_configure_prefunc() {
-- 
2.6.2


