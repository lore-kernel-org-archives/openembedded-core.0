Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2E22962133
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 07:09:28 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 03 Oct 2017 00:09:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,473,1500966000"; d="scan'208";a="134598871"
Received: from summit.tm.intel.com ([10.237.55.152])
	by orsmga004.jf.intel.com with ESMTP; 03 Oct 2017 00:09:29 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Oct 2017 10:09:26 +0300
Message-Id: <20171003070926.29297-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] staging.bbclass: handle postinst-useradd-* fixmes
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
X-List-Received-Date: Tue, 03 Oct 2017 07:09:29 -0000

After 02457ef7f600ce954874e2d11e74b1c6daaa3bfc, PSEUDO for
postinst-useradd-* scripts get to use only one PSEUDO_LOCALSTATEDIR
which is set under recipes ${WORKDIR}.

When the those scripts are run in a clean build environment that
is built from the sstate (populate_sysroot_setscene run for
postinst-useradd-* providers), pseudo fails to run because it cannot
access the PSEUDO_LOCALSTATEDIR (recipe ${WORKDIR}s do not exist).
This triggers a sysroot staging error.

Previously, the PSEUDO_LOCALSTATEDIR setting in useradd.bbclass
worked because the RSS sstate/staging logic automagically processed
${STAGING_DIR_TARGET} in postinst-useradd-* scripts to point under
the sysroot being built.

The fix uses the same fixme processing by adding PSEUDO_LOCALSTATEDIR
variable to it. Furthermore, LOGFIFO is added to be able to use
the logging fifo of the recipe that actually runs postinst-useradd-*.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta/classes/staging.bbclass | 2 +-
 meta/classes/useradd.bbclass | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index d21e198ae8..c479bd93ea 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -167,7 +167,7 @@ def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
     if not fixme:
         return
     cmd = "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (target, " ".join(fixme), recipesysroot, recipesysrootnative)
-    for fixmevar in ['COMPONENTS_DIR', 'HOSTTOOLS_DIR', 'PKGDATA_DIR']:
+    for fixmevar in ['COMPONENTS_DIR', 'HOSTTOOLS_DIR', 'PKGDATA_DIR', 'PSEUDO_LOCALSTATEDIR', 'LOGFIFO']:
         fixme_path = d.getVar(fixmevar)
         cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
     bb.debug(2, cmd)
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 686e5fbefe..c9103cbe6a 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -133,9 +133,10 @@ useradd_sysroot () {
 }
 
 # The export of PSEUDO in useradd_sysroot() above contains references to
-# ${COMPONENTS_DIR}. These need to be handled when restoring
+# ${COMPONENTS_DIR} and ${PSEUDO_LOCALSTATEDIR}. Additionally, the logging
+# shell functions use ${LOGFIFO}. These need to be handled when restoring
 # postinst-useradd-${PN} from the sstate cache.
-EXTRA_STAGING_FIXMES += "COMPONENTS_DIR"
+EXTRA_STAGING_FIXMES += "COMPONENTS_DIR PSEUDO_LOCALSTATEDIR LOGFIFO"
 
 python useradd_sysroot_sstate () {
     scriptfile = None
-- 
2.11.0


