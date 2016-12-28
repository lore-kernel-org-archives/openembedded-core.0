Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF9E71A5E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 13:02:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 28 Dec 2016 05:02:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,422,1477983600"; d="scan'208";a="802981700"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Dec 2016 05:02:53 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2016 15:02:44 +0200
Message-Id: <1482930164-15721-9-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1482930164-15721-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1482930164-15721-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 8/8] oeqa.utils.metadata: add bitbake revision information
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
X-List-Received-Date: Wed, 28 Dec 2016 13:02:52 -0000

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/metadata.py | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index 6331c21..23449fc 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -10,6 +10,8 @@ from collections.abc import MutableMapping
 from xml.dom.minidom import parseString
 from xml.etree.ElementTree import Element, tostring
 
+from git import Repo, InvalidGitRepositoryError, NoSuchPathError
+
 from oeqa.utils.commands import runCmd, get_bb_vars
 
 def get_os_release():
@@ -51,6 +53,7 @@ def metadata_from_bb():
                 info_dict['host_distro'][key] = os_release[key]
 
     info_dict['layers'] = get_layers(data_dict['BBLAYERS'])
+    info_dict['bitbake'] = git_rev_info(os.path.dirname(bb.__file__))
     return info_dict
 
 def metadata_from_data_store(d):
@@ -62,24 +65,27 @@ def metadata_from_data_store(d):
     # be useful when running within bitbake.
     pass
 
+def git_rev_info(path):
+    """Get git revision information as a dict"""
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
 def get_layers(layers):
     """Returns layer information in dict format"""
-    from git import Repo, InvalidGitRepositoryError, NoSuchPathError
-
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


