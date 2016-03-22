Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 208E265CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 22:09:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 22 Mar 2016 15:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,379,1455004800"; d="scan'208";a="674045751"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2016 15:09:19 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 14:04:02 +0000
Message-Id: <91803643cfafda320bee789f70df80f7df849208.1458655100.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1458655100.git.mariano.lopez@linux.intel.com>
References: <cover.1458655100.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1458655100.git.mariano.lopez@linux.intel.com>
References: <cover.1458655100.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 3/4] archiver.bbclass: Fix gcc-source corner case
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
X-List-Received-Date: Tue, 22 Mar 2016 22:09:27 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Bitbake couldn't add the task ar_configured when
trying to archive the configured source for
gcc-source-${PV} recipes. This is because the task
depended in the do_configure and this task doesn't
exist for gcc-source.

This fix allows to archive configured gcc-source recipe.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/archiver.bbclass | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 4064674..d709f78 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -73,8 +73,15 @@ python () {
         # We can't use "addtask do_ar_configured after do_configure" since it
         # will cause the deptask of do_populate_sysroot to run not matter what
         # archives we need, so we add the depends here.
-        d.appendVarFlag('do_ar_configured', 'depends', ' %s:do_configure' % pn)
+
+        # There is a corner case with "gcc-source-${PV}" recipes, they don't have
+        # the "do_configure" task, so we need to use "do_preconfigure"
+        if pn.startswith("gcc-source-"):
+            d.appendVarFlag('do_ar_configured', 'depends', ' %s:do_preconfigure' % pn)
+        else:
+            d.appendVarFlag('do_ar_configured', 'depends', ' %s:do_configure' % pn)
         d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_configured' % pn)
+
     elif ar_src:
         bb.fatal("Invalid ARCHIVER_MODE[src]: %s" % ar_src)
 
@@ -168,11 +175,18 @@ python do_ar_configured() {
     ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
     if d.getVarFlag('ARCHIVER_MODE', 'src', True) == 'configured':
         bb.note('Archiving the configured source...')
+        pn = d.getVar('PN', True)
+        # "gcc-source-${PV}" recipes don't have "do_configure"
+        # task, so we need to run "do_preconfigure" instead
+        if pn.startswith("gcc-source-"):
+            d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))
+            bb.build.exec_func('do_preconfigure', d)
+
         # The libtool-native's do_configure will remove the
         # ${STAGING_DATADIR}/aclocal/libtool.m4, so we can't re-run the
         # do_configure, we archive the already configured ${S} to
         # instead of.
-        if d.getVar('PN', True) != 'libtool-native':
+        elif pn != 'libtool-native':
             # Change the WORKDIR to make do_configure run in another dir.
             d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))
             if bb.data.inherits_class('kernel-yocto', d):
-- 
2.6.2


