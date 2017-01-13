Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8AA71D81
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 13:12:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 13 Jan 2017 05:12:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,221,1477983600"; d="scan'208";a="1112091307"
Received: from hessakys-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.14.44])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2017 05:12:51 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:12:40 +0200
Message-Id: <1484313166-29604-5-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1484313166-29604-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1484313166-29604-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 04/10] oeqa.utils.metadata: fix retrieval of git branch and revision
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
X-List-Received-Date: Fri, 13 Jan 2017 13:12:52 -0000

Always return a valid branch name, or, '(nobranch)' if the current HEAD
is detached. Also, always return the hash of the commit object that HEAD
is pointing to. Previous code returned an incorrect branch name (or
crashed) e.g. in the case of detached HEAD.

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/metadata.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index a389c6a..b732d37 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -72,11 +72,13 @@ def get_layers(layers):
         layer_dict[layer_name] = OrderedDict()
         try:
             repo = Repo(layer, search_parent_directories=True)
-            revision, branch = repo.head.object.name_rev.split()
         except (InvalidGitRepositoryError, NoSuchPathError):
             continue
-        layer_dict[layer_name]['branch'] = branch
-        layer_dict[layer_name]['revision'] = revision
+        layer_dict[layer_name]['revision'] = repo.head.commit.hexsha
+        try:
+            layer_dict[layer_name]['branch'] = repo.active_branch.name
+        except TypeError:
+            layer_dict[layer_name]['branch'] = '(nobranch)'
     return layer_dict
 
 def write_metadata_file(file_path, metadata):
-- 
2.6.6


