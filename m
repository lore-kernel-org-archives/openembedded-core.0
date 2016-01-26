Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4161873D27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 14:13:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jan 2016 06:13:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,350,1449561600"; d="scan'208";a="868951778"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 26 Jan 2016 06:13:28 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 16:13:25 +0200
Message-Id: <1453817605-19259-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1453817605-19259-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1453817605-19259-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] devtool: create-workspace: define separate cache for task file checksums
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
X-List-Received-Date: Tue, 26 Jan 2016 14:13:53 -0000

Define BB_HASH_CHECKSUM_CACHE_FILE variable in the workspace layer
config so that a specific cache is used for storing the task file
dependency checksums. The file checksum cache can grow quite large after
hashing of all file in externalsrc trees was enabled.  This patch
prevents polluting/growing the fetcher local file checksum cache. Also,
this new devtool-specific cache is not used after the workspace layer is
disabled.

[YOCTO #8853]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/devtool | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/devtool b/scripts/devtool
index 2d57da0..e44b87e9 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -152,6 +152,7 @@ def _create_workspace(workspacedir, config, basepath):
             f.write('BBFILE_PATTERN_workspacelayer = "^$' + '{LAYERDIR}/"\n')
             f.write('BBFILE_PATTERN_IGNORE_EMPTY_workspacelayer = "1"\n')
             f.write('BBFILE_PRIORITY_workspacelayer = "99"\n')
+            f.write('BB_HASH_CHECKSUM_CACHE_FILE = "filedep_checksum_cache.dat"\n')
         # Add a README file
         with open(os.path.join(workspacedir, 'README'), 'w') as f:
             f.write('This layer was created by the OpenEmbedded devtool utility in order to\n')
-- 
2.1.4


