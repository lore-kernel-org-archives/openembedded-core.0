Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 464107734B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:09:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 23 Feb 2016 21:09:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,492,1449561600"; d="scan'208";a="658305658"
Received: from sloi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.175])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2016 21:09:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 18:07:28 +1300
Message-Id: <7990b2da72454e7390373a48169642addd617723.1456290353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/14] devtool: upgrade: fix constructing new branch from tarball releases
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
X-List-Received-Date: Wed, 24 Feb 2016 05:09:17 -0000

When we do an upgrade from one tarball version to another we want to:

1) Check out the old version as a new branch
2) Record the changes between the old and new versions as a commit
3) Check out the old version with patches applied
4) Rebase that onto the new branch

Where we went wrong was step #1 where instead we checked out the old
version with patches applied as the new branch, which meant the rebase
didn't do anything and any changes made by the patches to files still in
the new version were wiped out.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 9a308b1..fab7b15 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -179,7 +179,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
         md5 = None
         sha256 = None
     else:
-        __run('git checkout -b devtool-%s' % newpv)
+        __run('git checkout devtool-base -b devtool-%s' % newpv)
 
         tmpdir = tempfile.mkdtemp(prefix='devtool')
         try:
-- 
2.5.0


