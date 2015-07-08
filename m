Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9B58B75D88
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 10:59:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jul 2015 03:59:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,431,1432623600"; d="scan'208";a="520745267"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jul 2015 03:59:51 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jul 2015 13:59:48 +0300
Message-Id: <1436353189-21566-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1436353189-21566-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1436353189-21566-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] combo-layer: only allow fast-forward when pulling
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
X-List-Received-Date: Wed, 08 Jul 2015 10:59:54 -0000

Only allow fast-forward merges in the component repositories when doing
git-pull. This makes it possible to spot problems (i.e. rewriting of
history) in the component upstream . Also, this change prevents the
creation of local-only merge commits in the component repositories.
These merges cause "last_revision" field of the combo-layer config to
point to a git commit that is only present in the users local component
repository but nowhere in upstream.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/combo-layer | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 2d100be..8637add 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -587,7 +587,7 @@ def action_pull(conf, args):
         branch = repo.get('branch', "master")
         runcmd("git checkout %s" % branch, ldir)
         logger.info("git pull for component repo %s in %s ..." % (name, ldir))
-        output=runcmd("git pull", ldir)
+        output=runcmd("git pull --ff-only", ldir)
         logger.info(output)
 
 def action_update(conf, args):
-- 
2.1.4


