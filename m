Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E3F5B71D7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 13:12:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 13 Jan 2017 05:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,221,1477983600"; d="scan'208";a="1112091293"
Received: from hessakys-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.14.44])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2017 05:12:50 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:12:39 +0200
Message-Id: <1484313166-29604-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1484313166-29604-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1484313166-29604-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 03/10] oeqa.utils.metadata: drop 'unknown' git data elements
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
X-List-Received-Date: Fri, 13 Jan 2017 13:12:51 -0000

It's better just to not have the xml elements than to have elements with
faux data. One could have git branch named 'unknown', for example.

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/metadata.py | 7 +++----
 scripts/oe-selftest             | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index df6ed91..a389c6a 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -73,11 +73,10 @@ def get_layers(layers):
         try:
             repo = Repo(layer, search_parent_directories=True)
             revision, branch = repo.head.object.name_rev.split()
-            layer_dict[layer_name]['branch'] = branch
-            layer_dict[layer_name]['revision'] = revision
         except (InvalidGitRepositoryError, NoSuchPathError):
-            layer_dict[layer_name]['branch'] = 'unknown'
-            layer_dict[layer_name]['revision'] = 'unknown'
+            continue
+        layer_dict[layer_name]['branch'] = branch
+        layer_dict[layer_name]['revision'] = revision
     return layer_dict
 
 def write_metadata_file(file_path, metadata):
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 5510410..a2298a3 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -603,7 +603,7 @@ def main():
             r_branches = set(r_branches.replace('origin/', '').split())
             l_branches = {str(branch) for branch in repo.branches}
             branch = '%s/%s/%s' % (metadata['hostname'],
-                                   metadata['layers']['meta']['branch'],
+                                   metadata['layers']['meta'].get('branch', '(nogit)'),
                                    metadata['machine'])
 
             if branch in l_branches:
@@ -631,7 +631,7 @@ def main():
             layer_info = ''
             for layer, values in metadata['layers'].items():
                 layer_info = '%s%-17s = %s:%s\n' % (layer_info, layer,
-                              values['branch'], values['revision'])
+                              values.get('branch', '(nogit)'), values.get('revision', '0'*40))
             msg = 'Selftest for build %s of %s for machine %s on %s\n\n%s' % (
                    log_prefix[12:], metadata['distro']['pretty_name'],
                    metadata['machine'], metadata['hostname'], layer_info)
-- 
2.6.6


