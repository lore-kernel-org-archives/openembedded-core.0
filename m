Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF5171D81
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 13:12:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 13 Jan 2017 05:12:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,221,1477983600"; d="scan'208";a="1112091330"
Received: from hessakys-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.14.44])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2017 05:12:54 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:12:42 +0200
Message-Id: <1484313166-29604-7-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1484313166-29604-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1484313166-29604-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 06/10] oeqa.utils.metadata: add commit count information
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
X-List-Received-Date: Fri, 13 Jan 2017 13:12:54 -0000

Makes it easier to put the commits into a timeline.

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/metadata.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index 2f7e8f2..d5cc290 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -63,7 +63,7 @@ def metadata_from_data_store(d):
     pass
 
 def get_layers(layers):
-    """ Returns layer name, branch, and revision as OrderedDict. """
+    """Returns layer information in dict format"""
     from git import Repo, InvalidGitRepositoryError, NoSuchPathError
 
     layer_dict = OrderedDict()
@@ -75,6 +75,7 @@ def get_layers(layers):
         except (InvalidGitRepositoryError, NoSuchPathError):
             continue
         layer_dict[layer_name]['commit'] = repo.head.commit.hexsha
+        layer_dict[layer_name]['commit_count'] = repo.head.commit.count()
         try:
             layer_dict[layer_name]['branch'] = repo.active_branch.name
         except TypeError:
-- 
2.6.6


