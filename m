Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B9A0C7728E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:51:59 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP; 19 Dec 2016 05:52:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,373,1477983600"; d="scan'208";a="44706852"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 19 Dec 2016 05:52:01 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id CC34D6A4080;
	Mon, 19 Dec 2016 05:51:11 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 15:51:43 +0200
Message-Id: <1482155503-23546-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oe-selftest: import git module only when needed
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
X-List-Received-Date: Mon, 19 Dec 2016 13:51:59 -0000

git module is not included into standard Python
library and therefore causes import errors on the systems
where PythonGit is not installed.

As git module only used in the code implementing --repository
functionality it's better to import git only in the scope
that requires it.

[YOCTO #10821]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/utils/metadata.py | 2 +-
 scripts/oe-selftest             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index ecbe763..5d8bf84 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -5,7 +5,6 @@
 # Functions to get metadata from the testing host used
 # for analytics of test results.
 
-from git import Repo, InvalidGitRepositoryError, NoSuchPathError
 from collections import OrderedDict
 from collections.abc import MutableMapping
 from xml.dom.minidom import parseString
@@ -46,6 +45,7 @@ def metadata_from_data_store(d):
 
 def get_layers(layers):
     """ Returns layer name, branch, and revision as OrderedDict. """
+    from git import Repo, InvalidGitRepositoryError, NoSuchPathError
 
     layer_dict = OrderedDict()
     for layer in layers.split():
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index f4b861f..bfcea66 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -36,7 +36,6 @@ import re
 import fnmatch
 import collections
 import imp
-import git
 
 sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
 import scriptpath
@@ -577,6 +576,7 @@ def main():
         log.info("Finished")
 
         if args.repository:
+            import git
             # Commit tests results to repository
             metadata = metadata_from_bb()
             git_dir = os.path.join(os.getcwd(), 'selftest')
-- 
2.1.4


