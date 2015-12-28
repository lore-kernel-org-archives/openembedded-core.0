Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8262E6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:15:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBS7FCBP013862
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:15:12 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:15:11 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:42 -0800
Message-ID: <2c8afd6aae775ab10dd30eb890fc410739048d79.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 34/40] devtool: upgrade: fetch remote repository before checking out new revision
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
X-List-Received-Date: Mon, 28 Dec 2015 07:15:11 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

If we're upgrading a recipe that fetches from git, and we've simply
fetched a tarball of the repo instead of directly from the upstream repo
(this can happen if you have PREMIRRORS set up as in poky with a core recipe,
e.g. kernelshark) then we won't have any new revisions, and the checkout
will fail with "fatal: reference is not a tree: <hash>". To avoid this,
do a "git fetch" before checking out the new revision.

(From OE-Core master rev: c4daebf3fe797a8063dcbc2ab229be2fbedc8134)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/upgrade.py |    1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index f033fc8..6bac44b 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -199,6 +199,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
     if srcrev:
         rev = srcrev
     if uri.startswith('git://'):
+        __run('git fetch')
         __run('git checkout %s' % rev)
         __run('git tag -f devtool-base-new')
         md5 = None
-- 
1.7.9.5


