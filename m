Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3C073167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 15:26:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 24 Mar 2016 08:25:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,385,1455004800"; d="scan'208";a="940768829"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga002.jf.intel.com with ESMTP; 24 Mar 2016 08:25:42 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Mar 2016 07:20:28 +0000
Message-Id: <34e4b28e8c8e665b38fd82d59ecaf8d486de6193.1458803813.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1458803813.git.mariano.lopez@linux.intel.com>
References: <cover.1458803813.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] archiver.bbclass: Just archive gcc-source for all gcc recipes
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
X-List-Received-Date: Thu, 24 Mar 2016 15:26:05 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

It is pointless to archive several times the gcc source.
This change will archive gcc source once, for the gcc-source-{PV}
recipe.

[YOCTO #9327]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/archiver.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index b95176b..1546bd0 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -61,6 +61,12 @@ python () {
     else:
         bb.debug(1, 'archiver: %s is included: %s' % (pn, reason))
 
+    # We just archive gcc-source for all the gcc related recipes
+    if d.getVar('BPN', True) in ['gcc', 'libgcc'] \
+            and not pn.startswith('gcc-source'):
+        bb.debug(1, 'archiver: %s is excluded, covered by gcc-source' % pn)
+        return
+
     ar_src = d.getVarFlag('ARCHIVER_MODE', 'src', True)
     ar_dumpdata = d.getVarFlag('ARCHIVER_MODE', 'dumpdata', True)
     ar_recipe = d.getVarFlag('ARCHIVER_MODE', 'recipe', True)
-- 
2.6.2


