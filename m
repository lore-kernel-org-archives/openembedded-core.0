Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB7D77A9D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 21:51:33 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 05 Apr 2017 14:51:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,280,1488873600"; d="scan'208";a="74093702"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 05 Apr 2017 14:51:34 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 14:51:31 -0700
Message-Id: <1491429091-28045-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] license.bbclass: improve reproducibility
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
X-List-Received-Date: Wed, 05 Apr 2017 21:51:33 -0000

Two identical builds can end up having deploy/licenses folders
that differ. This is observed in cases where there are several
different license files of the same name in different folders,
i.e. "COPYING". In those case we have to differentiate the files
somehow and we do it via file expensions such as COPYING.0, COPYING.1.
However, which file will get which extension is presently random.
This means, for example, that COPYING.0 in one build is the same
as COPYING.1 in the other (and vice versa).
Although there is mothing wrong with this, for the sake of binary
reproducibility it is preferable to have a deterministic outcome.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/license.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 81458e7..d4be478 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -505,7 +505,7 @@ def find_license_files(d):
         bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('PF')))
     # Add files from LIC_FILES_CHKSUM to list of license files
     lic_chksum_paths = defaultdict(OrderedDict)
-    for path, data in lic_chksums.items():
+    for path, data in sorted(lic_chksums.items()):
         lic_chksum_paths[os.path.basename(path)][data] = (os.path.join(srcdir, path), data[1], data[2])
     for basename, files in lic_chksum_paths.items():
         if len(files) == 1:
-- 
2.7.4


