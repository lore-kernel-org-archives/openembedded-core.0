Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id F17A860043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 13:12:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 13 Jan 2017 05:12:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,221,1477983600"; d="scan'208";a="1112091352"
Received: from hessakys-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.14.44])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2017 05:12:56 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:12:44 +0200
Message-Id: <1484313166-29604-9-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1484313166-29604-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1484313166-29604-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 08/10] oeqa.utils.metadata: add bitbake revision information
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
X-List-Received-Date: Fri, 13 Jan 2017 13:12:57 -0000

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/metadata.py | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index 6331c21..a3c1b2b 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -51,6 +51,7 @@ def metadata_from_bb():
                 info_dict['host_distro'][key] = os_release[key]
 
     info_dict['layers'] = get_layers(data_dict['BBLAYERS'])
+    info_dict['bitbake'] = git_rev_info(os.path.dirname(bb.__file__))
     return info_dict
 
 def metadata_from_data_store(d):
@@ -62,24 +63,29 @@ def metadata_from_data_store(d):
     # be useful when running within bitbake.
     pass
 
-def get_layers(layers):
-    """Returns layer information in dict format"""
+def git_rev_info(path):
+    """Get git revision information as a dict"""
     from git import Repo, InvalidGitRepositoryError, NoSuchPathError
 
+    info = OrderedDict()
+    try:
+        repo = Repo(path, search_parent_directories=True)
+    except (InvalidGitRepositoryError, NoSuchPathError):
+        return info
+    info['commit'] = repo.head.commit.hexsha
+    info['commit_count'] = repo.head.commit.count()
+    try:
+        info['branch'] = repo.active_branch.name
+    except TypeError:
+        info['branch'] = '(nobranch)'
+    return info
+
+def get_layers(layers):
+    """Returns layer information in dict format"""
     layer_dict = OrderedDict()
     for layer in layers.split():
         layer_name = os.path.basename(layer)
-        layer_dict[layer_name] = OrderedDict()
-        try:
-            repo = Repo(layer, search_parent_directories=True)
-        except (InvalidGitRepositoryError, NoSuchPathError):
-            continue
-        layer_dict[layer_name]['commit'] = repo.head.commit.hexsha
-        layer_dict[layer_name]['commit_count'] = repo.head.commit.count()
-        try:
-            layer_dict[layer_name]['branch'] = repo.active_branch.name
-        except TypeError:
-            layer_dict[layer_name]['branch'] = '(nobranch)'
+        layer_dict[layer_name] = git_rev_info(layer)
     return layer_dict
 
 def write_metadata_file(file_path, metadata):
-- 
2.6.6


