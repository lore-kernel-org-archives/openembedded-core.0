Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CC23273189
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 03:19:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 21 Dec 2015 19:19:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="866907910"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2015 19:19:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 16:19:14 +1300
Message-Id: <9054201cd93a77f0637e1b1b0815fa23f1d1677f.1450754300.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450754300.git.paul.eggleton@linux.intel.com>
References: <cover.1450754300.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450754300.git.paul.eggleton@linux.intel.com>
References: <cover.1450754300.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/5] classes/populate_sdk_ext: use uninative to set NATIVELSBSTRING
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
X-List-Received-Date: Tue, 22 Dec 2015 03:19:43 -0000

We inherit uninative in the extensible SDK configuration, and uninative
sets NATIVELSBSTRING to a fixed value, so we don't need to force the
value ourselves.

Fixes [YOCTO #8662].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 802cbe1..3d64e48 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -149,11 +149,6 @@ python copy_buildsystem () {
         # Bypass the default connectivity check if any
         f.write('CONNECTIVITY_CHECK_URIS = ""\n\n')
 
-        # Another hack, but we want the native part of sstate to be kept the same
-        # regardless of the host distro
-        fixedlsbstring = 'SDK-Fixed'
-        f.write('NATIVELSBSTRING_forcevariable = "%s"\n\n' % fixedlsbstring)
-
         # Ensure locked sstate cache objects are re-used without error
         f.write('SIGGEN_LOCKEDSIGS_CHECK_LEVEL = "warn"\n\n')
 
@@ -180,6 +175,8 @@ python copy_buildsystem () {
 
     sstate_out = baseoutpath + '/sstate-cache'
     bb.utils.remove(sstate_out, True)
+    # uninative.bbclass sets NATIVELSBSTRING to 'universal'
+    fixedlsbstring = 'universal'
     oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_pruned,
                                                    d.getVar('SSTATE_DIR', True),
                                                    sstate_out, d,
-- 
2.5.0


