Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6571460043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 13:12:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 13 Jan 2017 05:12:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,221,1477983600"; d="scan'208";a="1112091317"
Received: from hessakys-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.14.44])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2017 05:12:53 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:12:41 +0200
Message-Id: <1484313166-29604-6-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1484313166-29604-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1484313166-29604-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 05/10] oeqa.utils.metadata: rename 'revision' to 'commit'
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
X-List-Received-Date: Fri, 13 Jan 2017 13:12:53 -0000

Revision is a bit vague and could point to a tag, for example. Git
commit objects are unambiguous and persistent so be explicit that the
element should contain git commit hash.

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/metadata.py | 2 +-
 scripts/oe-selftest             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index b732d37..2f7e8f2 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -74,7 +74,7 @@ def get_layers(layers):
             repo = Repo(layer, search_parent_directories=True)
         except (InvalidGitRepositoryError, NoSuchPathError):
             continue
-        layer_dict[layer_name]['revision'] = repo.head.commit.hexsha
+        layer_dict[layer_name]['commit'] = repo.head.commit.hexsha
         try:
             layer_dict[layer_name]['branch'] = repo.active_branch.name
         except TypeError:
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index a2298a3..be63d5e 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -631,7 +631,7 @@ def main():
             layer_info = ''
             for layer, values in metadata['layers'].items():
                 layer_info = '%s%-17s = %s:%s\n' % (layer_info, layer,
-                              values.get('branch', '(nogit)'), values.get('revision', '0'*40))
+                              values.get('branch', '(nogit)'), values.get('commit', '0'*40))
             msg = 'Selftest for build %s of %s for machine %s on %s\n\n%s' % (
                    log_prefix[12:], metadata['distro']['pretty_name'],
                    metadata['machine'], metadata['hostname'], layer_info)
-- 
2.6.6


