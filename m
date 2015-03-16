Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF5673928
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 14:19:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2015 07:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,409,1422950400"; d="scan'208";a="680778207"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2015 07:19:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 14:18:55 +0000
Message-Id: <55dd3e2c2450402af07c42132b8acb5f5c145aa9.1426515313.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/16] classes/externalsrc: fix for recipes that fetch local files
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
X-List-Received-Date: Mon, 16 Mar 2015 14:19:14 -0000

If SRC_URI contains local files (file:// references) these will almost
certainly be required at some point during the build process, so we need
to actually fetch these to ${WORKDIR} as we would normally.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 25f0be9..75bdb7a 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -35,7 +35,13 @@ python () {
             d.setVar('B', externalsrcbuild)
         else:
             d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
-        d.setVar('SRC_URI', '')
+
+        srcuri = (d.getVar('SRC_URI', True) or '').split()
+        local_srcuri = []
+        for uri in srcuri:
+            if uri.startswith('file://'):
+                local_srcuri.append(uri)
+        d.setVar('SRC_URI', ' '.join(local_srcuri))
 
         if '{SRCPV}' in d.getVar('PV', False):
             # Dummy value because the default function can't be called with blank SRC_URI
@@ -65,7 +71,13 @@ python () {
                 if setvalue:
                     d.setVarFlag(task, 'cleandirs', ' '.join(cleandirs))
 
+        fetch_tasks = ['do_fetch', 'do_unpack']
+        # If we deltask do_patch, there's no dependency to ensure do_unpack gets run, so add one
+        d.appendVarFlag('do_configure', 'deps', ['do_unpack'])
+
         for task in d.getVar("SRCTREECOVEREDTASKS", True).split():
+            if local_srcuri and task in fetch_tasks:
+                continue
             bb.build.deltask(task, d)
 
         d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_prefunc ")
-- 
1.9.3


